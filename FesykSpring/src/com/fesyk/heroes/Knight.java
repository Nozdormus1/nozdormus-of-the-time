package com.fesyk.heroes;

/**
 * Created by Ноздорму on 06.10.2015.
 */
public class Knight implements Hero {
    private int damage = (int) (Math.random()*10+1);
    public Knight(){};
    public Knight(int a, int b){
        this.setDamage(a*b);
    }
    public void weapon(String s){
        System.out.println(s+ " has sword with "+ getDamage() +" damage!");
    }

    public int getDamage() {
        return damage;
    }

    public void setDamage(int damage) {
        this.damage = damage;
    }
}
