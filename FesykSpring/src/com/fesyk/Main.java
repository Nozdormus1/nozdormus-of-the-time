package com.fesyk;

import com.fesyk.animals.Animal;
import com.fesyk.heroes.Hero;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * Created by Ноздорму on 07.10.2015.
 */
public class Main {
    public static void main(String[] args){
        ApplicationContext context = new ClassPathXmlApplicationContext("spring-config.xml");
        Hero hero = (Hero) context.getBean("Viktor");
        hero.weapon("Viktor");
        Hero palad = (Hero) context.getBean("Uther");
        palad.weapon("Uther");
        Hero arch = (Hero) context.getBean("Avalan");
        arch.weapon("Avalan");
        Animal dragon = (Animal) context.getBean("Smaug");
        dragon.voice();
    }
}
