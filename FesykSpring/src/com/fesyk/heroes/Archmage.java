package com.fesyk.heroes;

import com.fesyk.animals.Animal;

/**
 * Created by Ноздорму on 07.10.2015.
 */
public class Archmage extends Mage {
    private String license;
    private Animal pet;
    public void weapon(String s){
        super.setDamage(10);
        System.out.println("");
        super.weapon(s);
        System.out.println("He shows the license: "+ getLicense());
        System.out.println("Hey, Avalan's cat! Give me a voice!");
        getPet().voice();
    }

    public String getLicense() {
        return license;
    }

    public void setLicense(String license) {
        this.license = license;
    }

    public Animal getPet() {
        return pet;
    }

    public void setPet(Animal pet) {
        this.pet = pet;
    }
}
