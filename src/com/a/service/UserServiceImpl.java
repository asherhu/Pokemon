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
    public boolean addUser(User user) {
        System.out.println("-----UserService-----");
        boolean isAddUser=userDao.addUser(user);
        return isAddUser;
    }

    @Override
    public String checkUser(User user) {
        String chechUser=userDao.checkUser(user);
        return chechUser;
    }
}
