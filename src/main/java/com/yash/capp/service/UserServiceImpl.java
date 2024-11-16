package com.yash.capp.service;

import com.yash.capp.dao.BaseDAO;
import com.yash.capp.dao.UserDAO;
import com.yash.capp.domain.User;
import com.yash.capp.exception.UserBlockedException;
import com.yash.capp.rm.UserRowMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;
import java.util.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
        String sql = "SELECT userId, name, phone, email, address, role, loginStatus, loginName"
                + " FROM user WHERE loginName=:ln AND password=:pw";   //Named Parameter
        Map m = new HashMap();
        m.put("ln", loginName);
        m.put("pw", password);
        try {
            User u = getNamedParameterJdbcTemplate().queryForObject(sql, m, new UserRowMapper()); //single record we can get form this query
            if (u.getLoginStatus().equals(UserService.LOGIN_STATUS_BLOCKED)) {
                throw new UserBlockedException("Your accout has been blocked. Contact to admin.");
            } else {
                return u;
            }
        } catch (EmptyResultDataAccessException exex) {
            return null;
        }
    }

    @Override
    public List<User> getUserList() {
        return Arrays.asList();
    }

    @Override
    public void changeLoginStatus(Integer userId, Integer loginStatus) {

    }

    @Override
    public Boolean isUsernameExist(String username) {
        return null;
    }
}


