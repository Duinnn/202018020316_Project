package com.example.account.controller;

import com.example.account.param.BaseUserParam;
import com.example.account.param.RemoveUserParam;
import com.example.account.param.TransferUserParam;
import com.example.account.param.UpdateUserParam;
import com.example.account.response.Result;
import com.example.account.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
public class UserController {
    @Autowired
    private UserService userService;

    /**
     * 注册管理员
     */
    @PostMapping("/user/register")
    public Result register(@RequestBody BaseUserParam param){
        return userService.register(param);
    }

    /**
     * 查询用户
     */
    @GetMapping("/user/query")
    public Result queryUser(BaseUserParam param){
        return userService.queryUser(param);
    }

    /**
     * 增加普通用户
     */
    @PostMapping("/user/add")
    public Result addUser(@RequestBody BaseUserParam param){
        return userService.addUser(param);
    }

    /**
     * 重置密码
     */
    @PutMapping("/user/resetPwd")
    public Result resetPassword(@RequestBody BaseUserParam param){
        return userService.resetPassword(param);
    }

    //登录

    @PostMapping("/user/login")
    public Result loginUser(@RequestBody BaseUserParam param){

        return userService.loginUser(param);

    }

    //普通用户修改自己密码
    @PutMapping("/user/updateMyPsw")
    public Result updateMyPsw(@RequestBody UpdateUserParam param){
        return userService.updateMyPsw(param);
    }

    //移除家庭成员
    @PutMapping("/user/remove")
    public Result removeUser(@RequestBody RemoveUserParam param){
        return userService.removeUser(param);
    }

    //转让管理员
    @PutMapping("/user/transferAdmin")
    public Result transferAdmin(@RequestBody TransferUserParam param){
        return userService.transferAdmin(param);
    }
}
