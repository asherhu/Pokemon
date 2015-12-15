package com.a.service;

import com.a.dao.UserDao;
import com.a.entity.User;
import com.a.service.UserService;

/**
 * Created by huhanbo on 15/12/14.
 */
public class UserServiceImpl implements UserService {

    private UserDao userDao;

    public UserDao getUserDao() {
        return userDao;
    }

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    @Override
    public void addUser(User user) {
        System.out.println("-----UserService-----"+user.getUsername());
        userDao.addUser(user);
    }
}
