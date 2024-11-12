package com.yash.capp.test;

import com.yash.capp.config.SpringRootConfig;
import com.yash.capp.dao.UserDAO;
import com.yash.capp.domain.User;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class TestUserDAOUpdate {
    public static void main(String[] args) {
        ApplicationContext ctx=new AnnotationConfigApplicationContext(SpringRootConfig.class);
        UserDAO userDAO=ctx.getBean(UserDAO.class);
        //the user details will be taken from the registration form
        User u=new User();
        u.setUserId(5);
        u.setName("Divyanee Desale");
        u.setPhone("7020180120");
        u.setEmail("divyanee.desale@yash.com");
        u.setAddress("Indore");
        u.setRole(1); //admin role
        u.setLoginStatus(1); //active
        userDAO.update(u);
        System.out.println("---------Data Updated Saved-------------");
    }
}
