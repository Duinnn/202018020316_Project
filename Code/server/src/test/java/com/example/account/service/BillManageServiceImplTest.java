package com.example.account.service;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;
import static org.junit.jupiter.api.Assertions.*;
import com.example.account.dto.QueryBillsDTO;
import com.example.account.entity.Bill;
import com.example.account.entity.House;
import com.example.account.mapper.BillMapper;
import com.example.account.mapper.HouseMapper;
import com.example.account.param.BillManageParam;
import com.example.account.response.Result;
import com.example.account.response.PageResult;
import com.example.account.service.impl.BillManageServiceImpl;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import java.util.*;

public class BillManageServiceImplTest {
    @Mock
    private BillMapper billMapper;

    @Mock
    private UserService userService;

    @Mock
    private HouseMapper houseMapper;

    @InjectMocks
    private BillManageServiceImpl billManageService;

    @BeforeEach
    public void setUp() {
        MockitoAnnotations.openMocks(this);
    }

    @Test
    public void testAddBill() {
        // Setup
        BillManageParam param = new BillManageParam();
        param.setConsumptionId(1);
        param.setUserId(1);
        param.setHouseId(1);
        param.setMoney(100.0F);
        param.setRemark("Test Bill");
        param.setRecordTime("2022-01-01 12:00:00");
        param.setBillType(1);

        // Mock the insertSelective response
        when(billMapper.insertSelective(any(Bill.class))).thenReturn(1);

        // Test
        Result result = billManageService.addBill(param);

        // Assertions
        assertEquals("200", result.getStatus());
        assertEquals("success", result.getDescription());
    }

    @Test
    public void testQueryBills() {
        // Setup
        BillManageParam param = new BillManageParam();
        param.setPageNum(1);
        param.setPageSize(10);
        param.setUserId(1);
        param.setBeginDate("2022-01-01 12:00:00");
        param.setEndDate("2022-01-02 12:00:00");

        // Mock the userService and billMapper response
        when(userService.isAdmin(any(Integer.class))).thenReturn(true);

        List<QueryBillsDTO> bills = new ArrayList<>();
        QueryBillsDTO billDto = new QueryBillsDTO();
        billDto.setBillType(1);
        billDto.setConsumptionId(1);
        bills.add(billDto);

        when(billMapper.selectBillDetails(any(BillManageParam.class))).thenReturn(bills);

        // Test
        Result result = billManageService.queryBills(param);

        // Assertions
        assertEquals("200", result.getStatus());
        PageResult<?> pageResult = (PageResult<?>) result.getData();
        assertNotNull(pageResult);
        assertEquals(1, pageResult.getTotal());
        assertFalse(pageResult.getList().isEmpty());
    }

    @Test
    public void testUpdateBill() {
        // Setup
        BillManageParam param = new BillManageParam();
        param.setId(1);
        param.setConsumptionId(1);
        param.setRemark("Updated Bill");
        param.setMoney(200.0F);
        param.setRecordTime("2022-01-01 12:00:00");

        // Mock the updateByPrimaryKeySelective response
        when(billMapper.updateByPrimaryKeySelective(any(Bill.class))).thenReturn(1);

        // Test
        Result result = billManageService.updateBill(param);

        // Assertions
        assertEquals("200", result.getStatus());
        assertEquals("success", result.getDescription());
    }

    @Test
    public void testRemoveBill() {
        // Setup
        BillManageParam param = new BillManageParam();
        param.setId(1);

        // Mock the updateByPrimaryKeySelective response
        when(billMapper.updateByPrimaryKeySelective(any(Bill.class))).thenReturn(1);

        // Test
        Result result = billManageService.removeBill(param);

        // Assertions
        assertEquals("200", result.getStatus());
        assertEquals("success", result.getDescription());
    }

    @Test
    public void testUpdateBudget() {
        // Setup
        BillManageParam param = new BillManageParam();
        param.setHouseId(1);
        param.setBudget(5000.0F);

        // Mock the updateByPrimaryKeySelective response
        when(houseMapper.updateByPrimaryKeySelective(any(House.class))).thenReturn(1);

        // Test
        Result result = billManageService.updateBudget(param);

        // Assertions
        assertEquals("200", result.getStatus());
        assertEquals("success", result.getDescription());
    }
}
