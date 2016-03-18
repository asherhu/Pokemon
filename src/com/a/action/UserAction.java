package com.a.action;

import com.a.entity.User;
import com.a.service.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.servlet.Servlet;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;
import java.util.Objects;

/**
 * Created by huhanbo on 15/12/14.
 */
public class UserAction extends ActionSupport{
    private User user;
    private UserService userService;
    private HttpServletRequest httpServletRequest= ServletActionContext.getRequest();
    private HttpSession httpSession= httpServletRequest.getSession();

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

    //user login operation
    public String userLogin(){

        User sessionUser= (User) httpServletRequest.getSession().getAttribute("user");
        if(sessionUser!=null){
            return "success";
        }

        //System.out.println("-----UserAction.checkUser()-----");
        String checkUser=userService.checkUser(user);
        if("user_pass".equals(checkUser)){
            httpSession.setAttribute("user", user);
            httpSession.setMaxInactiveInterval(0);
            return "success";
        }
        if("user_password_error".equals(checkUser)||"user_name_error".equals(checkUser)){
            httpServletRequest.setAttribute("user_status",checkUser);
            httpServletRequest.setAttribute("username",user.getUsername());
        }

        return "fail";
    }

//user register operation
    public String userRegister(){

        //if user go to register,go to register.jsp
        if(user==null){
            return "fail";
        }

        System.out.println("-----UserAction.addUser()-----");
        boolean isAddUser=userService.addUser(user);


        if(isAddUser){
            httpServletRequest.setAttribute("addsuccess","addsuccess");
            return "success";
        }else{
           //if user register failed , show name and error in register.jsp
            httpServletRequest.setAttribute("addfailed","addfailed");
            httpServletRequest.setAttribute("failedname",user.getUsername());
            return "fail";
        }

    }

    //user edit operation
    public String userEdit(){
        ActionContext actionContext=ActionContext.getContext();
        //Map<String,Object> applicationMap=actionContext.getApplication();
        //applicationMap.put("useredit",true);
         Map<String,Object> requestMap= (Map<String, Object>) actionContext.get("request");
        requestMap.put("useredit", true);

        return "success";
    }

    // user logout operation
    public String userLogout(){
       // System.out.println("-----UserAction.userLogout()-----"+user.getUsername());
        httpSession.setAttribute("user", null);
        return "success";
    }


    public String userModify(){
        ActionContext actionContext=ActionContext.getContext();
        Map<String,Object> requestMap= (Map<String, Object>) actionContext.get("request");
        requestMap.put("modifyfailed", true);
        requestMap.put("useredit",true);
        httpServletRequest.setAttribute("test","test");
        return "fail";
    }

    //back to main.jsp
    public String backMain(){
        return "success";
    }

    //user go to play jsTetris
    public String goJsTetris(){
        User sessionUser= (User) httpSession.getAttribute("user");

        if(sessionUser==null){
            return "fail";
        }
        httpServletRequest.setAttribute("username",sessionUser.getUsername());
        return "success";
    }
}
