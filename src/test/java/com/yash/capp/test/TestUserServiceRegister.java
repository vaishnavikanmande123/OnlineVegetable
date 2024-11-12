package com.yash.capp.test;

import com.yash.capp.config.SpringRootConfig;
import com.yash.capp.domain.User;
import com.yash.capp.service.UserService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class TestUserServiceRegister {
    public static void main(String[] args) {
        ApplicationContext ctx = new AnnotationConfigApplicationContext(SpringRootConfig.class);
        UserService userService=ctx.getBean(UserService.class);
        //TODO: the user details will be taken from User-Reg-Form
        User u=new User();
        u.setName("Chaitali");
        u.setPhone("7893213321");
        u.setEmail("chaiti@.net");
        u.setAddress("Pune");
        u.setLoginName("cahire");
        u.setPassword("cA123");
        u.setRole(1);//Admin Role
        u.setLoginStatus(1); //Active
        userService.register(u);
        System.out.println("--------Data Saved in Service------");
    }
}
