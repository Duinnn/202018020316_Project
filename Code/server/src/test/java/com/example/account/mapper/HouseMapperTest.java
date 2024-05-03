package com.example.account.mapper;

import com.example.account.entity.House;
import com.example.account.entity.HouseExample;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

public class HouseMapperTest {

    @Mock
    private HouseMapper houseMapper;

    @BeforeEach
    public void setup() {
        MockitoAnnotations.openMocks(this); // Initialize Mockito to create mock objects
    }

    @Test
    public void testSelectByPrimaryKey() {
        // Create a test House object to return for the mock
        House house = new House();
        house.setId(1);
        house.setAdminName("John");

        // Define the mock behavior to return the test House
        when(houseMapper.selectByPrimaryKey(1)).thenReturn(house);

        // Execute the method being tested
        House result = houseMapper.selectByPrimaryKey(1);

        // Validate the returned object
        assertNotNull(result); // Ensure it's not null
        assertEquals("John", result.getAdminName()); // Confirm the admin name matches
    }

    @Test
    public void testInsert() {
        // Create a new House object to insert
        House newHouse = new House();
        newHouse.setId(1);
        newHouse.setAdminName("John");

        // Set the mock behavior to return a success indicator for insertion
        when(houseMapper.insert(any(House.class))).thenReturn(1);

        // Perform the insert operation
        int result = houseMapper.insert(newHouse);

        // Check that the operation succeeded
        assertEquals(1, result); // Expect a return value of 1 indicating success
    }

    @Test
    public void testSelectByExample() {
        // Create test House objects for comparison
        House house1 = new House();
        house1.setId(1);
        house1.setAdminName("John");

        House house2 = new House();
        house2.setId(2);
        house2.setAdminName("Jane");

        // Create a HouseExample to specify selection criteria
        HouseExample example = new HouseExample();

        // Define the mock behavior to return the expected list of Houses
        when(houseMapper.selectByExample(example)).thenReturn(Arrays.asList(house1, house2));

        // Execute the selection method with the given example
        List<House> result = houseMapper.selectByExample(example);

        // Check that the expected results are returned
        assertEquals(2, result.size()); // Confirm two results were returned
    }

    @Test
    public void testUpdateByPrimaryKey() {
        // Create a House object with updated data
        House updatedHouse = new House();
        updatedHouse.setId(1);
        updatedHouse.setAdminName("John Updated");

        // Set the mock behavior to indicate a successful update
        when(houseMapper.updateByPrimaryKey(any(House.class))).thenReturn(1);

        // Perform the update operation
        int result = houseMapper.updateByPrimaryKey(updatedHouse);

        // Confirm the operation was successful
        assertEquals(1, result); // Expect a return value of 1 indicating success
    }

    @Test
    public void testDeleteByPrimaryKey() {
        // Define the mock behavior to return a success indicator for deletion
        when(houseMapper.deleteByPrimaryKey(1)).thenReturn(1);

        // Perform the delete operation
        int result = houseMapper.deleteByPrimaryKey(1);

        // Validate the operation result
        assertEquals(1, result); // Expect a return value of 1 indicating successful deletion
    }

    @Test
    public void testSelectByAdminName() {
        // Create a House object to be returned for a given admin name
        House house = new House();
        house.setAdminName("John");

        // Set the mock behavior to return the House with the specified admin name
        when(houseMapper.selectByAdminName("John")).thenReturn(house);

        // Execute the method to get the House by admin name
        House result = houseMapper.selectByAdminName("John");

        // Check the returned data
        assertEquals("John", result.getAdminName()); // Confirm the admin name matches
    }
}
