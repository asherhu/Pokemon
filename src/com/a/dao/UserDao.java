package com.a.dao;

import com.a.entity.User;

/**
 * Created by huhanbo on 15/12/14.
 */
public interface UserDao {
    public boolean addUser(User user);
    public void modifyUser(User user);
    public String checkUser(User user);
}
