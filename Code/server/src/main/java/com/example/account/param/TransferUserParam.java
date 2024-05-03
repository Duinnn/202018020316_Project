package com.example.account.param;

import lombok.Data;
/**
 * @author:Nelson
 * @date:2023/12/21 17:53
 */
@Data
public class TransferUserParam {
    /**
     * 转移人Id
     */
    private Integer fromUserId;

    /**
     * 被转移人Id
     */
    private Integer toUserId;
}
