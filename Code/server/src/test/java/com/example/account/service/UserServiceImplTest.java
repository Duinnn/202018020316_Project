package com.example.account.service;

import com.example.account.entity.User;
import com.example.account.entity.House;
import com.example.account.enums.ReturnCode;
import com.example.account.mapper.UserMapper;
import com.example.account.mapper.HouseMapper;
import com.example.account.param.BaseUserParam;
import com.example.account.param.TransferUserParam;
import com.example.account.response.Result;
import com.example.account.service.impl.UserServiceImpl;
import com.example.account.utils.MD5Utils;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;

import java.util.Arrays;

import static org.junit.Assert.*;
import static org.mockito.Mockito.*;

@RunWith(MockitoJUnitRunner.class) // Use MockitoJUnitRunner to enable mockito functionality
public class UserServiceImplTest {

    @Mock
    private UserMapper userMapper; // Mock the UserMapper to test service methods

    @Mock
    private HouseMapper houseMapper; // Mock the HouseMapper to test service methods related to House

    @InjectMocks
    private UserServiceImpl userService; // Inject mocks into the UserServiceImpl instance

    private BaseUserParam baseUserParam; // A shared parameter object for user operations

    @Before
    public void setUp() {
        // Initialize the shared BaseUserParam with basic user information
        baseUserParam = new BaseUserParam();
        baseUserParam.setName("JohnDoe");
        baseUserParam.setPassword("password123");
        baseUserParam.setBudget(1000.0F);
        baseUserParam.setIsAdmin(1); // Indicates the user is an admin
        baseUserParam.setHouseId(1); // ID of the associated house
    }

    @Test
    public void testRegisterUser_Success() {
        // Setup mock behavior to simulate a successful user registration
        when(userMapper.selectByName("JohnDoe")).thenReturn(null); // User name does not exist
        when(houseMapper.insertSelective(any(House.class))).thenReturn(1); // Successfully insert a house
        House house = new House(); // Create a new house object
        house.setId(1); // Set its ID
        when(houseMapper.selectByAdminName("JohnDoe")).thenReturn(house); // Return the newly created house
        when(userMapper.insertSelective(any(User.class))).thenReturn(1); // Successfully insert a user

        // Call the register method
        Result result = userService.register(baseUserParam);

        // Assert that the operation was successful
        assertEquals(ReturnCode.SUCCESS.getCode(), result.getStatus());
    }

    @Test
    public void testRegisterUser_Fail_UserExists() {
        // Simulate a user that already exists with the same name
        User existingUser = new User();
        when(userMapper.selectByName("JohnDoe")).thenReturn(existingUser); // User name already exists

        // Try to register with the same name, expecting failure
        Result result = userService.register(baseUserParam);

        // Check that the expected failure code is returned
        assertEquals(ReturnCode.REGISTER_FAIL.getCode(), result.getStatus());
    }

    @Test
    public void testAddUser_Success() {
        // Simulate the admin user for validation
        User admin = new User();
        admin.setId(1);
        admin.setIsAdmin(1); // The admin should have admin rights

        // Configure the expected mock behavior
        lenient().when(userMapper.selectByPrimaryKey(1)).thenReturn(admin); // The admin user exists
        when(userMapper.insertSelective(any(User.class))).thenReturn(1); // User can be successfully inserted

        // Call the addUser method to add a new user
        Result result = userService.addUser(baseUserParam);

        // Validate that the addition was successful
        assertEquals(ReturnCode.SUCCESS.getCode(), result.getStatus());
    }

    @Test
    public void testLoginUser_Success() {
        // Prepare a mock user with encrypted password
        User user = new User();
        user.setName("JohnDoe");
        user.setPassword(MD5Utils.EncoderByMd5("password123")); // Encrypt the password

        // Configure mock behavior to simulate user login
        when(userMapper.selectByExample(any())).thenReturn(Arrays.asList(user)); // The user exists in the database

        // Create a login parameter with user credentials
        BaseUserParam loginParam = new BaseUserParam();
        loginParam.setName("JohnDoe");
        loginParam.setPassword("password123"); // Plain text password

        // Call the login method
        Result result = userService.loginUser(loginParam);

        // Validate successful login
        assertEquals(ReturnCode.SUCCESS.getCode(), result.getStatus());
    }

    @Test
    public void testLoginUser_Fail() {
        // Simulate an empty result set, indicating no matching user
        when(userMapper.selectByExample(any())).thenReturn(Arrays.asList());

        // Create a login parameter with incorrect credentials
        BaseUserParam loginParam = new BaseUserParam();
        loginParam.setName("JohnDoe");
        loginParam.setPassword("wrongpassword"); // Incorrect password

        // Call the login method with incorrect credentials
        Result result = userService.loginUser(loginParam);

        // Ensure login fails with the expected error code
        assertEquals(ReturnCode.LOGIN_FAIL.getCode(), result.getStatus());
    }

    @Test
    public void testTransferAdmin_Success() {
        // Create user objects to simulate the transfer of admin rights
        User fromUser = new User();
        fromUser.setId(1); // ID of the original admin
        fromUser.setIsAdmin(1); // Indicates that this user is an admin
        fromUser.setHouseId(1); // House ID for context

        User toUser = new User();
        toUser.setId(2); // ID of the new admin
        toUser.setHouseId(1); // Same house as fromUser

        // Configure mock behavior to simulate admin transfer
        when(userMapper.selectByPrimaryKey(1)).thenReturn(fromUser); // Original admin exists
        when(userMapper.selectByPrimaryKey(2)).thenReturn(toUser); // New admin exists
        when(userMapper.transferAdmin(1, 0)).thenReturn(1); // Admin transfer from original user
        when(userMapper.transferAdmin(2, 1)).thenReturn(1); // Admin transfer to new user

        // Define the transfer parameters for admin rights
        TransferUserParam transferParam = new TransferUserParam();
        transferParam.setFromUserId(1); // Original admin ID
        transferParam.setToUserId(2); // New admin ID

        // Call the transferAdmin method to execute the transfer
        Result result = userService.transferAdmin(transferParam);

        // Validate that the operation was successful
        assertEquals(ReturnCode.SUCCESS.getCode(), result.getStatus());
    }

    @Test
    public void testTransferAdmin_Fail_PermissionDenied() {
        // Simulate the fromUser with no admin rights
        User fromUser = new User();
        fromUser.setId(1);
        fromUser.setIsAdmin(0); // Not an admin
        fromUser.setHouseId(1); // Same house as original admin

        // Simulate the toUser with a different house context
        User toUser = new User();
        toUser.setId(2); // New user ID
        toUser.setHouseId(2); // Different house

        // Configure mock behavior to simulate permission denial
        when(userMapper.selectByPrimaryKey(1)).thenReturn(fromUser); // The original user exists
        when(userMapper.selectByPrimaryKey(2)).thenReturn(toUser); // The new user exists

        // Define the transfer parameters attempting to transfer from non-admin
        TransferUserParam transferParam = new TransferUserParam();
        transferParam.setFromUserId(1); // Non-admin user ID
        transferParam.setToUserId(2); // New user with different house context

        // Call the transferAdmin method with invalid parameters
        Result result = userService.transferAdmin(transferParam);

        // Ensure the operation fails with permission denied
        assertEquals(ReturnCode.PERMISSION_DENIED.getCode(), result.getStatus());
    }
}
