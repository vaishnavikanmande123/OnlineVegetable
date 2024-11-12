package com.yash.capp.service;

import com.yash.capp.dao.BaseDAO;
import com.yash.capp.dao.UserDAO;
import com.yash.capp.domain.User;
import com.yash.capp.exception.UserBlockedException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class UserServiceImpl extends BaseDAO implements  UserService
{

    @Autowired
    private UserDAO userDAO;

    @Override
    public void register(User u) {
        userDAO.save(u);
    }

    @Override
    public User login(String loginName, String password) throws UserBlockedException {
        return null;
    }

    @Override
    public List<User> getUserList() {
        return List.of();
    }

    @Override
    public void changeLoginStatus(Integer userId, Integer loginStatus) {

    }

    @Override
    public Boolean isUsernameExist(String username) {
        return null;
    }
}
