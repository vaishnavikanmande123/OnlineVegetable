package com.yash.capp.service;

import com.yash.capp.domain.Contact;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * The interface specifies all the business operation for contact Entity
 */
@Service
public interface ContactService {

    public void save(Contact contact);

    public void update(Contact contact);

    public void delete(Integer contactId);

   public void delete(Integer[] contactIds);


    /**
     * method returns all User contact (user who is logged in)
     * @param userId
     * @return
     */
    public List<Contact> findUserContact(Integer userId);


    public List<Contact> findUserContact(Integer userId, String txt);

    Contact findById(Integer cotactId);
}