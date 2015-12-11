package com.a.test;

/**
 * Created by huhanbo on 15/12/11.
 */
public class GreetingServiceImpl implements GreetingService{

    private String say;

    public String getSay() {
        return say;
    }

    public void setSay(String say) {
        this.say = say;
    }

    @Override
    public void sayGreeting() {
        System.out.println(say);
    }
}
