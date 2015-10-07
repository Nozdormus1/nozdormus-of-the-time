package com.fesyk.speech;

/**
 * Created by Ноздорму on 06.10.2015.
 */
public class DivineWords implements Speech {
    private static String[] LINES = {
            "You shall not pass!",
            "The light will crush you!",
            "Be afraid of the light!",
            "God blessing you!",
            "I will light my way through the darkness!",};

    public void words(){
        int a = (int) (Math.random()*5);
        System.out.println(LINES[a]);
    }
}
