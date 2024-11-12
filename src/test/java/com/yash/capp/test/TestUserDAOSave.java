package com.yash.capp.test;

import com.yash.capp.config.SpringRootConfig;
import com.yash.capp.dao.UserDAO;
import com.yash.capp.domain.User;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class TestUserDAOSave {
    public static void main(String[] args) {
        ApplicationContext ctx=new AnnotationConfigApplicationContext(SpringRootConfig.class);
        UserDAO userDAO=ctx.getBean(UserDAO.class);
        //the user details will be taken from the registration form
        User u=new User();
        u.setName("Divyanee");
        u.setPhone("9156980120");
        u.setEmail("divyaneedesale@yash.com");
        u.setAddress("Pune");
        u.setLoginName("dddesale");
        u.setPassword("dd1234");
        u.setRole(1); //admin role
        u.setLoginStatus(1); //active
        userDAO.save(u);
        System.out.println("---------Data Saved-------------");
    }
}
