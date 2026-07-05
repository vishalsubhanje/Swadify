package com.swadify.dao;

import com.swadify.model.User;

public interface UserDAO {

    int addUser(User user);

    User getUser(String email);

}