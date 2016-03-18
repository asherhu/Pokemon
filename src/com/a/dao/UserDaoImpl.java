package com.a.dao;

import com.a.entity.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.type.StandardBasicTypes;

import java.nio.charset.StandardCharsets;
import java.util.List;

/**
 * Created by huhanbo on 15/12/14.
 */
public class UserDaoImpl implements UserDao {

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public Session getSession() {
        return sessionFactory.openSession();
    }

    @Override
    public boolean addUser(User user) {
        if(user==null){
            return false;
        }
        System.out.println("-----UserDaoImpl.Adduser-----" );
        Session session = getSession();
        session.beginTransaction();
        boolean userIsExist = false;
        List list = session.createSQLQuery("select * from puser").addScalar("username", StandardBasicTypes.STRING).addScalar("userpassword", StandardBasicTypes.STRING).list();
        for (Object list1 : list) {
            Object[] objectUser = (Object[]) list1;
            String username = (String) objectUser[0];
            String inputUserName = user.getUsername();
            if (inputUserName.equals(username)) {
                userIsExist = true;
            }
        }
        if (!userIsExist) {
            session.save(user);
            session.getTransaction().commit();
            System.out.println("save successful");
            return true;
        } else {

            return false;
        }


    }

    @Override
    public void modifyUser(User user) {

    }

    @Override
    public String checkUser(User user) {
        if(user==null){
            return "fail";
        }
        Session session = getSession();
        boolean userIsExist = false;
        boolean userPasswordMatch=false;
        List list = session.createSQLQuery("select * from puser").addScalar("username", StandardBasicTypes.STRING).addScalar("userpassword", StandardBasicTypes.STRING).list();
        for (Object list1 : list) {
            Object[] objectUser = (Object[]) list1;
            String username = (String) objectUser[0];
            String userpassword = (String) objectUser[1];
            //System.out.println("username:" + username + " userpassword:" + userpassword);
            String inputUserName = user.getUsername();
            String inputUserPassword=user.getUserpassword();
            if (inputUserName.equals(username)) {
                userIsExist=true;
                if(userpassword.equals(inputUserPassword)){
                    userPasswordMatch=true;
                }
            }
        }

        if(!userIsExist){
            return "user_name_error";
        }

        if(!userPasswordMatch){
            return "user_password_error";
        }

        return "user_pass";
    }
}
