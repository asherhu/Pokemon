package com.a.dao;

import com.a.entity.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 * Created by huhanbo on 15/12/14.
 */
public class UserDaoImpl implements UserDao {

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public Session getSession(){
        return sessionFactory.openSession();
    }

    @Override
    public void addUser(User user) {
        System.out.println("-----UserDaoImpl.Adduser-----"+user.getUsername());
        Session session=getSession();
        session.save(user);
    }

    @Override
    public void modifyUser(User user) {

    }
}
