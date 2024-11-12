package com.yash.capp.dao;

import com.yash.capp.domain.Contact;
import com.yash.capp.domain.User;
import com.yash.capp.rm.ContactRowMapper;
import com.yash.capp.rm.UserRowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class ContactDAOImpl extends BaseDAO implements ContactDAO
{

    @Override
    public void save(Contact c) {
        String sql ="INSERT into Contact(userId, name,phone,email,address,remark) VALUES (:userId, :name, :phone, :email, :address, :remark)";
        Map m=new HashMap();
        m.put("userId",c.getUserId());
        m.put("name",c.getName()); //this bind with the name given by the user
        m.put("phone",c.getPhone());
        m.put("email",c.getEmail());
        m.put("address",c.getAddress());
        m.put("remark",c.getRemark());
        SqlParameterSource ps=new MapSqlParameterSource(m);
        KeyHolder kh=new GeneratedKeyHolder();
        getNamedParameterJdbcTemplate().update(sql,ps,kh);
        c.setContactId(kh.getKey().intValue());
    }

    @Override
    public void update(Contact c) {
        String sql ="UPDATE Contact SET  name=:name,phone=:phone,email=:email,address=:address,remark=:remark)";
        Map m=new HashMap();
        m.put("contactId",c.getContactId());
        m.put("name",c.getName()); //this bind with the name given by the user
        m.put("phone",c.getPhone());
        m.put("email",c.getEmail());
        m.put("address",c.getAddress());
        m.put("remark",c.getRemark());
        getNamedParameterJdbcTemplate().update(sql,m);
    }

    @Override
    public void delete(Contact c) {
        this.delete(c.getContactId());
    }

    @Override
    public void delete(Integer contactId) {
        String sql="DELETE FROM contact where contactId=?";
        getJdbcTemplate().update(sql,contactId);

    }

    @Override
    public Contact findById(Integer contactId) {
        String sql="SELECT contactId, userId,name,phone,email,address,remark FROM contact WHERE contactId=?";
        Contact c=getJdbcTemplate().queryForObject(sql,new ContactRowMapper(),contactId);
        return c;
    }

    @Override
    public List<Contact> findAll() {
        String sql="SELECT contactId, userId,name,phone,email,address,remark FROM contact";
        return getJdbcTemplate().query(sql,new ContactRowMapper());

    }

    @Override
    public List<Contact> findByProperty(String propName, Object propValue) {
        String sql="SELECT contactId, userId,name,phone,email,address,remark FROM contact WHERE "+propName+"=?";
        return getJdbcTemplate().query(sql,new ContactRowMapper(),propValue);

    }
}
