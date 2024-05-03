package com.example.account.param;

import lombok.Data;

/**
 * @author:Nelson
 * @date:2023/12/21 17:53
 */
@Data
public class UpdateUserParam extends BaseUserParam{

    //旧密码
    private String oldPassword;

    //新密码
    private String newPassword;
}
