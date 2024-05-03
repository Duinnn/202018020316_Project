package com.example.account.param;

import lombok.Data;

/**
 * @author:Nelson
 * @date:2023/12/21 17:53
 */
@Data
public class UpdateConsumptionTypeParam extends ConsumptionTypeParam{

    //标签id
    private Integer id;

    //新名字
    private String newName;

}
