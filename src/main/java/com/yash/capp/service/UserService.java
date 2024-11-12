package com.yash.capp.service;

import com.yash.capp.domain.User;
import com.yash.capp.exception.UserBlockedException;
import org.springframework.stereotype.Service;

import java.util.List;

//@Service
//public interface UserService {
//    //constants for active and block status for the user
//    public static final Integer LOGIN_STATUS_ACTIVE=1;
//    public static final Integer LOGIN_STATUS_BLOCKED=2;
//
//
//    public static final Integer ROLE_ADMIN=1;
//    public static final Integer ROLE_USER=2;
//
//    public void register(User u);
//
//    /**
//     * The method handles the login operation (authentication) using given credentials ,it returns user object when success and null when failed.
//     * @param loginName
//     * @param password
//     * @return
//     * @throws this will thrown when user account is blocked
//     */
//    public User login(String loginName, String password) throws UserBlockedException;
//
//    //this will return all the methods
//    public List<User> getUserList();
//
//    /**
//     * This method change the user login status for details passed as argument
//     * @param userId
//     * @param loginStatus
//     */
//    public void changeLoginStatus(Integer userId, Integer loginStatus);
//
//
//    public Boolean isUsernameExist(String username);
//}
@Service
public interface UserService {

    public static final Integer LOGIN_STATUS_ACTIVE=1;
    public static final Integer LOGIN_STATUS_BLOCKED=2;

    public static final Integer ROLE_ADMIN=1;
    public static final Integer ROLE_USER=2;

    public void register(User u);

    public User login(String loginName, String password) throws UserBlockedException;

    public List<User> getUserList();

    public void changeLoginStatus(Integer userId, Integer loginStatus);

    public Boolean isUsernameExist(String username);
}

