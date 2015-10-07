package com.fesyk.heroes;

/**
 * Created by Ноздорму on 06.10.2015.
 */
public class Mage implements Hero {
    private int damage;
    public int getDamage() {
        return damage;
    }

    public void setDamage(int damage) {
        this.damage = damage;
    }
    public void weapon(String s){
        System.out.println(s+" has wand with "+ getDamage() +" magic damage!");
    }
}
