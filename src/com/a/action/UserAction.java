package com.a.action;

import com.a.entity.User;
import com.a.service.UserService;
import com.opensymphony.xwork2.ActionSupport;

/**
 * Created by huhanbo on 15/12/14.
 */
public class UserAction extends ActionSupport{
    private User user;
    private UserService userService;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public UserService getUserService() {
        return userService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public String addUser(){
        System.out.println("-----UserAction.addUser()-----"+user.getUsername());
        userService.addUser(user);
        return "success";
    }


    public String userRegister(){
        System.out.println("-----UserAction.addUser()-----"+user.getUsername());
        userService.addUser(user);
        return "success";
    }

}
