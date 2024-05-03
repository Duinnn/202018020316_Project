package com.example.account.response;

import com.example.account.enums.ReturnCode;
import lombok.Data;

@Data
public class ResultStatus {
    /**
     * 状态码
     */
    private String code;

    /**
     * 错误描述
     */
    private String description;

    public ResultStatus(String code, String description) {
        this.code = code;
        this.description = description;
    }

    public ResultStatus(){
        this(ReturnCode.SUCCESS.getCode(), ReturnCode.SUCCESS.getMsg());
    }

}
