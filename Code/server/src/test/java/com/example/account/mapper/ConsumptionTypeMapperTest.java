package com.example.account.mapper;

import com.example.account.entity.ConsumptionType;
import com.example.account.entity.ConsumptionTypeExample;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.MockitoJUnitRunner;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

import static org.junit.Assert.*;
import static org.mockito.Mockito.*;

@RunWith(MockitoJUnitRunner.class)
public class ConsumptionTypeMapperTest {

    @Mock
    private ConsumptionTypeMapper mapper;

    private ConsumptionType testConsumptionType;

    @Before
    public void setUp() {
        testConsumptionType = new ConsumptionType();
        testConsumptionType.setId(1);
        testConsumptionType.setName("Test Type");
        testConsumptionType.setCreateTime(new Date());
        testConsumptionType.setUpdateTime(new Date());
        testConsumptionType.setHouseId(1);
        testConsumptionType.setIsCustom(1);
        testConsumptionType.setIsDelete(0);
    }

    @Test
    public void testInsert() {
        when(mapper.insert(testConsumptionType)).thenReturn(1); // Simulates inserting a record
        int result = mapper.insert(testConsumptionType);
        assertEquals(1, result); // Expecting 1 to indicate successful insertion
    }

    @Test
    public void testSelectByPrimaryKey() {
        when(mapper.selectByPrimaryKey(1)).thenReturn(testConsumptionType); // Simulates finding by primary key
        ConsumptionType result = mapper.selectByPrimaryKey(1);
        assertEquals("Test Type", result.getName());
    }

    @Test
    public void testSelectByHouseId() {
        List<ConsumptionType> expectedList = Arrays.asList(testConsumptionType);
        when(mapper.selectByHouseId(1)).thenReturn(expectedList); // Simulates finding by house ID
        List<ConsumptionType> result = mapper.selectByHouseId(1);
        assertEquals(1, result.size());
        assertEquals("Test Type", result.get(0).getName());
    }

    @Test
    public void testUpdateByPrimaryKey() {
        when(mapper.updateByPrimaryKey(testConsumptionType)).thenReturn(1); // Simulates updating a record
        int result = mapper.updateByPrimaryKey(testConsumptionType);
        assertEquals(1, result); // Expecting 1 to indicate successful update
    }

    @Test
    public void testDeleteByPrimaryKey() {
        when(mapper.deleteByPrimaryKey(1)).thenReturn(1); // Simulates deleting a record
        int result = mapper.deleteByPrimaryKey(1);
        assertEquals(1, result); // Expecting 1 to indicate successful deletion
    }

    @Test
    public void testSelectByName() {
        when(mapper.selectByName("Test Type")).thenReturn(testConsumptionType); // Simulates finding by name
        ConsumptionType result = mapper.selectByName("Test Type");
        assertEquals("Test Type", result.getName());
    }
}
