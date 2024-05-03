package com.example.account.enums;

public enum ReturnCode {
    SUCCESS("200", "success"),
    //用户模块
    REGISTER_FAIL("E10001", "The username already exists！"),
    RESET_PASSWORD_FAIL("E10002", "Failed to reset user password！"),
    DELETE_USER_FAIL("E10003", "Failed to delete user！"),
    PERMISSION_DENIED("E10004","No operation permission！"),
    LOGIN_FAIL("E10005","Incorrect username or password！"),
    TRANSFER_ADMIN_FAIL("E10006","Transfer administrator failed！"),
    UPDATE_PASSWORD_FAIL("E10007", "Failed to modify user password！"),
    ADD_CONSUMTYPE_FAIL("E10008", "This type already exists！"),
    QUERY_CONSUMTYPE_FAIL("E10009", "Search error！"),
    UPDATE_CONSUMTYPE_FAIL("E10010", "You do not have the authority to modify this type！"),
    DELETE_CONSUMTYPE_FAIL("E10011", "Failed to delete this type！"),

    //账单模块
    ADD_BILL_FAIL("E20001", "Failed to add bill"),
    UPDATE_BILL_FAIL("E20002", "Failed to modify bill"),
    DELETE_BILL_FAIL("E20003", "Failed to delete bill"),
    UPDATE_BUDGET_FAIL("E20004", "Budget setting failed");

    /**
     * 状态码
     */
    String code;

    /**
     * 状态信息
     */
    String msg;

    ReturnCode(String code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
