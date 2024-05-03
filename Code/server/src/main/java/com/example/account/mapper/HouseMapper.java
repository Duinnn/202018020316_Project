package com.example.account.mapper;

import com.example.account.entity.House;
import com.example.account.entity.HouseExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface HouseMapper {
    int countByExample(HouseExample example);

    int deleteByExample(HouseExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(House record);

    int insertSelective(House record);

    List<House> selectByExample(HouseExample example);

    House selectByPrimaryKey(Integer id);

    House selectByAdminName(String adminName);

    int updateByExampleSelective(@Param("record") House record, @Param("example") HouseExample example);

    int updateByExample(@Param("record") House record, @Param("example") HouseExample example);

    int updateByPrimaryKeySelective(House record);

    int updateByPrimaryKey(House record);
}