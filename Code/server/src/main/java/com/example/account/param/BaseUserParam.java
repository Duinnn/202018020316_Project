package com.example.account.param;

import lombok.Data;
/**
 * @author:Nelson
 * @date:2023/12/21 17:53
 */
@Data
public class BaseUserParam extends BasePageParam{
    private int id;

    private String name;

    private String password;

    private Integer isAdmin;

    private Integer houseId;

    private float budget;

    private int pageNum;

    private int pageSize;
}
