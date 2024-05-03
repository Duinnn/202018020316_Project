package com.example.account.mapper;

import com.example.account.entity.User;
import com.example.account.entity.UserExample;
import java.util.List;

import com.example.account.param.TransferUserParam;
import com.example.account.param.UpdateUserParam;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserMapper {
    int countByExample(UserExample example);

    int deleteByExample(UserExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    List<User> selectByExample(UserExample example);

    User selectByPrimaryKey(Integer id);

    User selectByName(String name);
    User selectByPsw(String psw);

    List<User> selectByHouseId(Integer houseId);

    int updateByExampleSelective(@Param("record") User record, @Param("example") UserExample example);

    int updateByExample(@Param("record") User record, @Param("example") UserExample example);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    //修改密码
    int updateMyPsw(UpdateUserParam param);

    //移除家庭成员
    int removeUser(Integer removeUserId);

    //转让管理员账号
    int transferAdmin(@Param("id") Integer id, @Param("isAdmin") Integer isAdmin);
}