package com.yash.capp.test;

import com.yash.capp.config.SpringRootConfig;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.sql.DataSource;

public class TestDataSource {

    public static void main(String[] args) {
        ApplicationContext ctx = new AnnotationConfigApplicationContext(SpringRootConfig.class);
        DataSource ds = ctx.getBean(DataSource.class);
        JdbcTemplate jt = new JdbcTemplate(ds);
        String sql = "INSERT into user (name,phone,email,address, loginName,password) VALUES(?,?,?,?,?,?)";
        Object[] param = new Object[]{"Divyanee","9156980120","dd@gmail.com","Dhule","ddesale","12345"};
        jt.update(sql , param);
        System.out.println("-----------SQL Execution ---------");

    }
}