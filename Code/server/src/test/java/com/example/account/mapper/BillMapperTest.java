package com.example.account.mapper;

import com.example.account.dto.QueryBillsDTO;
import com.example.account.dto.StatisticsByTypeDTO;
import com.example.account.entity.Bill;
import com.example.account.param.BillManageParam;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

// Using JUnit 5 and Mockito Extension
@ExtendWith(MockitoExtension.class)
public class BillMapperTest {

    @Mock
    private BillMapper billMapper;

    @Test
    public void testSelectByPrimaryKey() {
        // Prepare a mock data object
        Bill mockBill = new Bill();
        mockBill.setId(1);
        mockBill.setMoney(100.0f);
        mockBill.setRecordTime(new Date());

        // Configure the mock return value
        when(billMapper.selectByPrimaryKey(1)).thenReturn(mockBill);

        // Execute the test method
        Bill result = billMapper.selectByPrimaryKey(1);

        // Verify the result
        assertNotNull(result);
        assertEquals(1, result.getId());
        assertEquals(100.0f, result.getMoney());
    }

    @Test
    public void testInsert() {
        Bill billToInsert = new Bill();
        billToInsert.setMoney(200.0f);

        // Configure the mock return value
        when(billMapper.insert(billToInsert)).thenReturn(1); // 1 indicates a successful insertion

        // Execute the test method
        int insertResult = billMapper.insert(billToInsert);

        // Verify the result
        assertEquals(1, insertResult);
    }

    @Test
    public void testSelectBillDetails() {
        BillManageParam param = new BillManageParam();

        List<QueryBillsDTO> mockResult = new ArrayList<>();
        QueryBillsDTO dto = new QueryBillsDTO();
        dto.setId(1);
        dto.setMoney(100.0f);
        mockResult.add(dto);

        when(billMapper.selectBillDetails(param)).thenReturn(mockResult);

        List<QueryBillsDTO> result = billMapper.selectBillDetails(param);

        assertNotNull(result);
        assertFalse(result.isEmpty());
        assertEquals(1, result.size());
        assertEquals(100.0f, result.get(0).getMoney());
    }

    @Test
    public void testUpdateByPrimaryKey() {
        Bill billToUpdate = new Bill();
        billToUpdate.setId(1);
        billToUpdate.setMoney(150.0f);

        when(billMapper.updateByPrimaryKey(billToUpdate)).thenReturn(1);

        int updateResult = billMapper.updateByPrimaryKey(billToUpdate);

        assertEquals(1, updateResult); // 1 indicates successful update
    }

    @Test
    public void testDeleteByPrimaryKey() {
        when(billMapper.deleteByPrimaryKey(1)).thenReturn(1);

        int deleteResult = billMapper.deleteByPrimaryKey(1);

        assertEquals(1, deleteResult); // 1 indicates successful deletion
    }
}
