package com.example.account.service.impl;

import com.example.account.entity.House;
import com.example.account.entity.User;
import com.example.account.entity.UserExample;
import com.example.account.enums.ReturnCode;
import com.example.account.mapper.HouseMapper;
import com.example.account.mapper.UserMapper;
import com.example.account.param.BaseUserParam;
import com.example.account.param.RemoveUserParam;
import com.example.account.param.TransferUserParam;
import com.example.account.param.UpdateUserParam;
import com.example.account.response.PageResult;
import com.example.account.response.Result;
import com.example.account.service.UserService;
import com.example.account.utils.MD5Utils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.Random;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private HouseMapper houseMapper;

    @Override
    @Transactional
    public Result register(BaseUserParam param) {
        System.out.println("###register start");
        User user = userMapper.selectByName(param.getName());
        if (null != user) {
            return Result.failure(ReturnCode.REGISTER_FAIL);
        }

        Date date = new Date();
        //新建一个家庭
        House houseRecord = new House();
        houseRecord.setAdminName(param.getName());
        houseRecord.setCreateTime(date);
        houseRecord.setUpdateTime(date);
        houseRecord.setBudget(param.getBudget());
        houseRecord.setIsDelete(0);
        houseMapper.insertSelective(houseRecord);

        House house = houseMapper.selectByAdminName(param.getName());

        //新建一个用户
        param.setHouseId(house.getId());
        addNewUser(param);
        System.out.println("###register end");
        return Result.success();
    }

    @Override
    public Result addUser(BaseUserParam param) {
        if (!isAdmin(param.getId())) {
            Result.failure(ReturnCode.PERMISSION_DENIED);
        }

        User user = userMapper.selectByName(param.getName());
        if (null != user) {
            return Result.failure(ReturnCode.REGISTER_FAIL);
        }

        User u = addNewUser(param);
        return Result.success(u);
    }

    @Override
    public Result queryUser(BaseUserParam param) {
        PageHelper.startPage(param.getPageNum(), param.getPageSize());

        List<User> list = userMapper.selectByHouseId(param.getHouseId());

        PageInfo<User> pageInfo = new PageInfo<User>(list);

        PageResult result = new PageResult(pageInfo.getTotal(), pageInfo.getList());

        return Result.success(result);
    }

    private User addNewUser(BaseUserParam param) {
        Date date = new Date();
        User record = new User();
        record.setName(param.getName());
        String realPassword = param.getPassword() == null ? getRandString(8) : param.getPassword();
        record.setPassword(MD5Utils.EncoderByMd5(realPassword));
        System.out.println("#####password is:" + record.getPassword());
        record.setIsAdmin(param.getIsAdmin());
        record.setHouseId(param.getHouseId());
        record.setCreateTime(date);
        record.setUpdateTime(date);
        record.setIsDelete(0);
        userMapper.insertSelective(record);
        record.setPassword(realPassword);
        return record;
    }


    @Override
    public Result loginUser(BaseUserParam param) {
        String password = MD5Utils.EncoderByMd5(param.getPassword());
        UserExample example = new UserExample();
        UserExample.Criteria criteria = example.createCriteria();//构造自定义查询条件
        criteria.andNameEqualTo(param.getName());
        criteria.andPasswordEqualTo(password);

        try {
            List<User> users = userMapper.selectByExample(example);
            if (users.size() == 0) {
                return Result.failure(ReturnCode.LOGIN_FAIL);
            }
            users.get(0).setPassword(null);
            return Result.success(users);
        } catch (Exception e) {
            e.printStackTrace();
            return Result.failure(ReturnCode.LOGIN_FAIL);
        }

    }

    @Override
    public Result updateMyPsw(UpdateUserParam param) {

        UserExample example = new UserExample();
        UserExample.Criteria criteria = example.createCriteria();//构造自定义查询条件
        criteria.andNameEqualTo(param.getName());
        criteria.andPasswordEqualTo(MD5Utils.EncoderByMd5(param.getOldPassword()));
        List<User> users = userMapper.selectByExample(example);
        if (users.size() == 0) {
            return Result.failure(ReturnCode.LOGIN_FAIL);
        } else {
            UpdateUserParam up = new UpdateUserParam();
            up.setId(users.get(0).getId());
            up.setNewPassword(MD5Utils.EncoderByMd5(param.getNewPassword()));
            try {
                userMapper.updateMyPsw(up);
            } catch (Exception e) {
                e.printStackTrace();
                return Result.failure(ReturnCode.UPDATE_PASSWORD_FAIL);
            }
            return Result.success();
        }
    }

    //移除家庭成员
    @Override
    public Result removeUser(RemoveUserParam param) {

        //判断是否为管理员
        if (!isAdmin(param.getAdminUserId())) {
            Result.failure(ReturnCode.PERMISSION_DENIED);
        }

        try {
            userMapper.removeUser(param.getRemoveUserId());
            return Result.success();
        } catch (Exception e) {
            e.printStackTrace();
            return Result.failure(ReturnCode.DELETE_USER_FAIL);
        }


    }

    //转让家庭账号
    @Override
    @Transactional
    public Result transferAdmin(TransferUserParam param) {

        User fromUser = userMapper.selectByPrimaryKey(param.getFromUserId());
        User toUser = userMapper.selectByPrimaryKey(param.getToUserId());
        //判断转移人是否为管理员,判断两人是否为同一个家庭
        if (fromUser.getIsAdmin() != 1 || toUser.getHouseId() != fromUser.getHouseId()) {
            return Result.failure(ReturnCode.PERMISSION_DENIED);
        }

        //转移人管理员权限置0
        int i = userMapper.transferAdmin(param.getFromUserId(), 0);
        //被转移人管理员权限置1
        int j = userMapper.transferAdmin(param.getToUserId(), 1);

        //修改家庭表
        House record = new House();
        record.setId(toUser.getHouseId());
        record.setAdminName(toUser.getName());
        record.setUpdateTime(new Date());
        houseMapper.updateByPrimaryKeySelective(record);
        if (i > 0 && j > 0) {
            return Result.success();
        } else {
            return Result.failure(ReturnCode.TRANSFER_ADMIN_FAIL);
        }
    }

    @Override
    public Result resetPassword(BaseUserParam param) {
        String password = getRandString(8);
        User record = new User();
        record.setPassword(MD5Utils.EncoderByMd5(password));
        record.setId(param.getId());
        record.setUpdateTime(new Date());
        int i = userMapper.updateByPrimaryKeySelective(record);
        record.setId(param.getId());
        if (i <= 0) {
            return Result.failure(ReturnCode.RESET_PASSWORD_FAIL, record);
        }
        record.setPassword(password);
        return Result.success(record);
    }

    public String getRandString(int length) {
        String charList = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
        String rev = "";
        Random f = new Random();
        for (int i = 0; i < length; i++) {
            rev += charList.charAt(Math.abs(f.nextInt()) % charList.length());
        }
        return rev;
    }

    @Override
    public boolean isAdmin(Integer id) {
        User user = userMapper.selectByPrimaryKey(id);
        if (null == user) {
            return false;
        }
        return user.getIsAdmin() == 1 ? true : false;
    }
}
