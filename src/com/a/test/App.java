package com.a.test;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;



/**
 * Created by huhanbo on 15/12/10.
 */
public class App {


    private static SessionFactory sessionFactory;
    private static ServiceRegistry serviceRegistry;

    public static void main(String[] args) {
        Configuration cfg = new Configuration().configure();

        sessionFactory = (SessionFactory) cfg.buildSessionFactory();

        Session session = null;
        try {
            session = sessionFactory.openSession();
            session.beginTransaction();
            User user = new User();
            user.setUserpassword("123");
            user.setUsername("abc");
            session.save(user);
            session.getTransaction().commit();
            System.out.println("save success!");

        } catch (Exception e) {
            session.getTransaction().rollback();
        } finally {
            if(session!=null){
                session.clear();
                session.close();
            }
            System.exit(0);
        }
    }
}
