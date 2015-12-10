package com.a.test;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 * Created by huhanbo on 15/12/10.
 */
public class PostgresqlJDBCTest {
    public static void main(String[] args) {
        Connection c=null;
        try{
            Class.forName("org.postgresql.Driver");
            c= DriverManager.getConnection("jdbc:postgresql://localhost:5432/pokemon","postgres","huhanbo");
        }catch (Exception e){
            System.err.println(e.getClass().getName()+":"+e.getMessage());
            System.exit(0);
            System.out.println("11");
        }
        System.out.println("connect postgresql success!");
    }
}
