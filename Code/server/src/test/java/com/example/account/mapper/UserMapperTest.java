package com.example.account.mapper;

import com.example.account.entity.User;
import com.example.account.param.UpdateUserParam;
import com.example.account.param.TransferUserParam;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import java.util.Arrays;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

public class UserMapperTest {

    @Mock
    private UserMapper userMapper; // Mock the UserMapper for test cases

    @BeforeEach
    public void setUp() {
        // Initialize the mock objects before each test
        MockitoAnnotations.openMocks(this);
    }

    @Test
    public void testInsertUser() {
        // Create a new User object to be inserted
        User user = new User();
        user.setName("Test User");

        // Define the expected behavior for the insert operation
        when(userMapper.insert(user)).thenReturn(1); // Returns 1 to indicate success

        // Perform the insert operation
        int result = userMapper.insert(user);

        // Assert the expected outcome
        assertEquals(1, result, "Insert should return 1 when successful");
    }

    @Test
    public void testSelectByExample() {
        // Create User objects to simulate a response from the mapper
        User user1 = new User();
        user1.setId(1);
        user1.setName("User 1");

        User user2 = new User();
        user2.setId(2);
        user2.setName("User 2");

        // Define the expected list of Users
        List<User> expectedUsers = Arrays.asList(user1, user2);

        // Set up the mock behavior to return the expected list
        when(userMapper.selectByExample(null)).thenReturn(expectedUsers); // Using a null example

        // Retrieve the result using the selectByExample method
        List<User> result = userMapper.selectByExample(null);

        // Verify the returned data
        assertEquals(2, result.size(), "Expected 2 users");
        assertEquals("User 1", result.get(0).getName()); // Verify names of users
        assertEquals("User 2", result.get(1).getName());
    }

    @Test
    public void testSelectByPrimaryKey() {
        // Create a User object to simulate a specific user retrieved by ID
        User user = new User();
        user.setId(1);
        user.setName("Test User");

        // Define the expected behavior when selecting by primary key
        when(userMapper.selectByPrimaryKey(1)).thenReturn(user); // Simulate fetching by ID

        // Retrieve the user by primary key
        User result = userMapper.selectByPrimaryKey(1);

        // Verify the result
        assertNotNull(result, "User should not be null");
        assertEquals(1, result.getId(), "Expected user ID to be 1");
        assertEquals("Test User", result.getName(), "Expected name to be 'Test User'");
    }

    @Test
    public void testUpdateMyPsw() {
        // Create an UpdateUserParam object with new password data
        UpdateUserParam param = new UpdateUserParam();
        param.setPassword("new_password");

        // Define the expected behavior for updating the password
        when(userMapper.updateMyPsw(param)).thenReturn(1); // Returns 1 to indicate success

        // Perform the update password operation
        int result = userMapper.updateMyPsw(param);

        // Validate the result
        assertEquals(1, result, "Update should return 1 when successful");
    }

    @Test
    public void testTransferAdmin() {
        // Define the expected behavior for transferring admin rights
        when(userMapper.transferAdmin(1, 1)).thenReturn(1); // Simulate admin transfer

        // Perform the admin transfer operation
        int result = userMapper.transferAdmin(1, 1);

        // Assert the expected outcome
        assertEquals(1, result, "Transfer should return 1 when successful");
    }
}
