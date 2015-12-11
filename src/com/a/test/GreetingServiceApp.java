package com.a.test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * Created by huhanbo on 15/12/11.
 */
public class GreetingServiceApp {
    public static void main(String[] args) {
        ApplicationContext ctx = new ClassPathXmlApplicationContext("hello.xml");
        GreetingService greetingService= (GreetingService) ctx.getBean("greetingService");

        greetingService.sayGreeting();
    }
}
