package com.fesyk.animals;

import com.fesyk.heroes.Hero;
import com.fesyk.other.Remains;

import java.util.ArrayList;
import java.util.Map;

/**
 * Created by Ноздорму on 07.10.2015.
 */
public class Dragon implements Animal {
    private Map<String, Hero> heroes;
    private ArrayList<Remains> remains;
    public void voice() {
        System.out.println("");
        System.out.println("I'm a dragon! RHARRRR!!!");
        System.out.println("I have eaten such thieves:");
        for (String key : getHeroes().keySet()) {
            System.out.print(key + " : ");
            Hero hero = getHeroes().get(key);
            hero.weapon(key);
        }
        System.out.println("Lets see what remains: ");
        for (Remains remain : getRemains()){
            remain.typeOf();
        }
    }

    public void setHeroes(Map<String, Hero> heroes){
        this.heroes = heroes;
    }

    public Map<String, Hero> getHeroes() {
        return heroes;
    }

    public ArrayList<Remains> getRemains() {
        return remains;
    }

    public void setRemains(ArrayList<Remains> remains) {
        this.remains = remains;
    }
}
