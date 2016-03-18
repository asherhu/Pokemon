package com.a.service;

import com.a.entity.User;

/**
 * Created by huhanbo on 15/12/14.
 */
public interface UserService {
    public boolean addUser(User user);
    public String checkUser(User user);
}
