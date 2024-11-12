package com.yash.capp.config;


import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
//@ComponentScan(basePackages = {"com.yash.capp.dao","com.yash.capp.service"})
public class SpringRootConfig {
    //TODO: Services, DAO, DataSource, Email Sender or some other business layer beans
    @Bean
    public BasicDataSource getDataSource(){
        BasicDataSource ds = new BasicDataSource();
        ds.setDriverClassName("com.mysql.cj.jdbc.Driver");
        ds.setUrl("jdbc:mysql://localhost:3306/capp_db");
        ds.setUsername("root");
        ds.setPassword("root");
        ds.setMaxTotal(2);  //firstly we set it 2 when project is in production we can increase it
        ds.setInitialSize(1);
        ds.setTestOnBorrow(true); //when connection is borrow from connection pull connection will be tested
        ds.setValidationQuery("SELECT 1");  //used to test the connection
        ds.setDefaultAutoCommit(true);
        return ds;
    }
}