package com.example.account.mapper;

import com.example.account.dto.QueryBillsDTO;
import com.example.account.dto.StatisticsByTypeDTO;
import com.example.account.entity.Bill;
import com.example.account.entity.BillExample;
import com.example.account.param.BillManageParam;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BillMapper {
    int countByExample(BillExample example);

    int deleteByExample(BillExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Bill record);

    int insertSelective(Bill record);

    List<Bill> selectByExample(BillExample example);

    Bill selectByPrimaryKey(Integer id);

    List<QueryBillsDTO> selectBillDetails(BillManageParam param);

    Float selectBillTotalMoney(BillManageParam param);

    List<StatisticsByTypeDTO> selectBillTotalMoneyByType(BillManageParam param);


    int updateByExampleSelective(@Param("record") Bill record, @Param("example") BillExample example);

    int updateByExample(@Param("record") Bill record, @Param("example") BillExample example);

    int updateByPrimaryKeySelective(Bill record);

    int updateByPrimaryKey(Bill record);
}