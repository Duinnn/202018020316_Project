package com.example.account.service;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;
import static org.junit.jupiter.api.Assertions.*;

import com.example.account.dto.BillStatisticsDTO;
import com.example.account.dto.BillStatisticsListDTO;
import com.example.account.dto.StatisticsByTypeDTO;
import com.example.account.entity.House;
import com.example.account.mapper.BillMapper;
import com.example.account.mapper.HouseMapper;
import com.example.account.param.BillManageParam;
import com.example.account.response.Result;
import com.example.account.service.impl.BillStatisticsServiceImpl;
import com.example.account.service.UserService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class BillStatisticsServiceImplTest {

    @Mock
    private BillMapper billMapper;

    @Mock
    private UserService userService;

    @Mock
    private HouseMapper houseMapper;

    @InjectMocks
    private BillStatisticsServiceImpl billStatisticsService;

    @BeforeEach
    public void setUp() {
        MockitoAnnotations.openMocks(this);
    }

    @Test
    public void testStatisticsByTime() {
        // Setup
        BillManageParam param = new BillManageParam();
        param.setUserId(1);
        param.setHouseId(1);
        param.setTimeType(1);

        // Mock dependencies
        when(userService.isAdmin(any(Integer.class))).thenReturn(true);
        House house = new House();
        house.setBudget(1000.0f);
        when(houseMapper.selectByPrimaryKey(any(Integer.class))).thenReturn(house);

        Float totalExpend = 500.0f;
        when(billMapper.selectBillTotalMoney(any(BillManageParam.class))).thenReturn(totalExpend);

        // Test
        Result result = billStatisticsService.statisticsByTime(param);

        // Assertions
        assertEquals("200", result.getStatus());
        BillStatisticsDTO data = (BillStatisticsDTO) result.getData();
        assertNotNull(data);
        assertEquals(1000.0f, data.getTotalBudget());
        assertEquals(500.0f, data.getTotalExpend());
    }

    @Test
    public void testStatisticsTypeByTime() {
        // Setup
        BillManageParam param = new BillManageParam();
        param.setUserId(1);
        param.setTimeType(1);

        // Mock dependencies
        when(userService.isAdmin(any(Integer.class))).thenReturn(true);

        List<StatisticsByTypeDTO> statisticsList = new ArrayList<>();
        StatisticsByTypeDTO statByType = new StatisticsByTypeDTO();
        statByType.setBillType("Food");
        statByType.setTotalMoney(100.0f);
        statisticsList.add(statByType);

        when(billMapper.selectBillTotalMoneyByType(any(BillManageParam.class))).thenReturn(statisticsList);

        // Test
        Result result = billStatisticsService.statisticsTypeByTime(param);

        // Assertions
        assertEquals("200", result.getStatus());
        List<?> data = (List<?>) result.getData();
        assertNotNull(data);
        assertFalse(data.isEmpty());
        assertEquals(1, data.size());
        assertEquals("Food", ((StatisticsByTypeDTO) data.get(0)).getBillType());
    }

    @Test
    public void testStatisticsLineChartByTime() {
        // Setup
        BillManageParam param = new BillManageParam();
        param.setUserId(1);
        param.setTimeType(1);

        // Mock dependencies
        when(userService.isAdmin(any(Integer.class))).thenReturn(true);

        // Mock lists
        List<String> dateList = new ArrayList<>();
        List<Float> incomeList = new ArrayList<>();
        List<Float> expendList = new ArrayList<>();

        when(billMapper.selectBillTotalMoney(any(BillManageParam.class)))
                .thenReturn(200.0f);

        // Test
        Result result = billStatisticsService.statisticsLineChartByTime(param);

        // Assertions
        assertEquals("200", result.getStatus());
        BillStatisticsListDTO data = (BillStatisticsListDTO) result.getData();
        assertNotNull(data);
        assertNotNull(data.getDateList());
        assertNotNull(data.getIncomeList());
        assertNotNull(data.getExpendList());
        assertFalse(data.getDateList().isEmpty());
    }
}
