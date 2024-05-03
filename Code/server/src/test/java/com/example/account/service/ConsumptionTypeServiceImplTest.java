package com.example.account.service;

import com.example.account.entity.ConsumptionType;
import com.example.account.enums.ReturnCode;
import com.example.account.mapper.ConsumptionTypeMapper;
import com.example.account.param.ConsumptionTypeParam;
import com.example.account.param.UpdateConsumptionTypeParam;
import com.example.account.response.Result;
import com.example.account.service.impl.ConsumptionTypeServiceImpl;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import java.util.Date;
import java.util.List;
import java.util.Arrays;

import static org.mockito.Mockito.*;
import static org.junit.jupiter.api.Assertions.*;

class ConsumptionTypeServiceImplTest {

    @Mock
    private ConsumptionTypeMapper consumptionTypeMapper; // Mock the ConsumptionTypeMapper for the tests

    @InjectMocks
    private ConsumptionTypeServiceImpl consumptionTypeService; // Inject the mocked ConsumptionTypeMapper into the service

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this); // Initialize Mockito mocks before each test
    }

    @Test
    void testQueryConsumptionType() {
        // Prepare a parameter object to query consumption types
        ConsumptionTypeParam param = new ConsumptionTypeParam();
        param.setHouseId(1); // House ID for filtering

        // Create a test ConsumptionType object
        ConsumptionType type1 = new ConsumptionType();
        type1.setId(1);
        type1.setName("Type1");

        // Set the expected behavior for the mock
        when(consumptionTypeMapper.selectByHouseId(1)).thenReturn(Arrays.asList(type1)); // Mock a return list

        // Call the service method to query consumption types
        Result result = consumptionTypeService.queryConsumptionType(param);

        // Validate the result
        assertEquals(ReturnCode.SUCCESS.getCode(), result.getStatus()); // Expect SUCCESS code
        assertNotNull(result.getData()); // Data should not be null
        assertTrue(((List<?>) result.getData()).size() > 0); // Should have at least one item
    }

    @Test
    void testAddConsumptionType() {
        // Prepare a parameter object to add a new consumption type
        ConsumptionTypeParam param = new ConsumptionTypeParam();
        param.setHouseId(1); // House ID for the new type
        param.setName("NewType");

        // Mock the absence of a type with the same name
        when(consumptionTypeMapper.selectByName("NewType")).thenReturn(null); // No existing type

        // Call the service method to add a new consumption type
        Result result = consumptionTypeService.addConsumptionType(param);

        // Check the expected outcome
        assertEquals(ReturnCode.SUCCESS.getCode(), result.getStatus()); // Should succeed
        verify(consumptionTypeMapper, times(1)).insert(any(ConsumptionType.class)); // Insert should be called once
    }

    @Test
    void testAddConsumptionType_Failure() {
        // Prepare a parameter object with an existing name
        ConsumptionTypeParam param = new ConsumptionTypeParam();
        param.setHouseId(1); // House ID for filtering
        param.setName("ExistingType"); // A name that already exists

        // Mock the presence of a type with the same name
        when(consumptionTypeMapper.selectByName("ExistingType")).thenReturn(new ConsumptionType()); // Type exists

        // Call the service method to add a new consumption type
        Result result = consumptionTypeService.addConsumptionType(param);

        // Validate the expected failure outcome
        assertEquals(ReturnCode.ADD_CONSUMTYPE_FAIL.getCode(), result.getStatus()); // Should fail due to duplication
    }

    @Test
    void testUpdateConsumptionType() {
        // Prepare an update parameter object
        UpdateConsumptionTypeParam param = new UpdateConsumptionTypeParam();
        param.setId(1); // ID of the type to update
        param.setNewName("UpdatedType"); // New name for the consumption type

        // Create an existing ConsumptionType object for mock response
        ConsumptionType existingType = new ConsumptionType();
        existingType.setId(1); // Existing type ID
        existingType.setIsCustom(1); // Custom flag
        existingType.setName("OldType"); // Old name

        // Mock the expected behavior for updating
        when(consumptionTypeMapper.selectByPrimaryKey(1)).thenReturn(existingType); // Existing type by ID
        when(consumptionTypeMapper.selectByName("UpdatedType")).thenReturn(null); // No conflict with new name

        // Call the service method to update the consumption type
        Result result = consumptionTypeService.updateConsumptionType(param);

        // Verify the expected success outcome
        assertEquals(ReturnCode.SUCCESS.getCode(), result.getStatus()); // Should succeed
        verify(consumptionTypeMapper, times(1)).updateByPrimaryKeySelective(any(ConsumptionType.class)); // Update should be called once
    }

    @Test
    void testDeleteConsumptionType() {
        // Prepare a parameter object to delete a consumption type
        ConsumptionTypeParam param = new ConsumptionTypeParam();
        param.setId(1); // ID of the type to delete

        // Create an existing ConsumptionType object for mock response
        ConsumptionType existingType = new ConsumptionType();
        existingType.setId(1); // ID of the existing type
        existingType.setIsCustom(1); // Custom flag

        // Mock the expected behavior for deletion
        when(consumptionTypeMapper.selectByPrimaryKey(1)).thenReturn(existingType); // Existing type by ID

        // Call the service method to delete the consumption type
        Result result = consumptionTypeService.deleteConsumptionType(param);

        // Validate the expected success outcome
        assertEquals(ReturnCode.SUCCESS.getCode(), result.getStatus()); // Should succeed
        verify(consumptionTypeMapper, times(1)).updateByPrimaryKeySelective(any(ConsumptionType.class)); // Update should be called once
    }

    @Test
    void testDeleteConsumptionType_Failure() {
        // Prepare a parameter object for deletion with a non-custom type
        ConsumptionTypeParam param = new ConsumptionTypeParam();
        param.setId(1); // ID of the type to delete

        // Create an existing ConsumptionType object that is not custom
        ConsumptionType existingType = new ConsumptionType();
        existingType.setId(1); // ID of the existing type
        existingType.setIsCustom(0); // Not a custom type

        // Mock the expected behavior for deletion with failure
        when(consumptionTypeMapper.selectByPrimaryKey(1)).thenReturn(existingType); // Existing type by ID

        // Call the service method to delete the consumption type
        Result result = consumptionTypeService.deleteConsumptionType(param);

        // Check the expected failure outcome
        assertEquals(ReturnCode.DELETE_CONSUMTYPE_FAIL.getCode(), result.getStatus()); // Should fail due to non-custom type
    }
}
