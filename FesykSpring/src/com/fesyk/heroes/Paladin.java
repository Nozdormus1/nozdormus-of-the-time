package com.fesyk.heroes;

import com.fesyk.speech.Speech;

/**
 * Created by Ноздорму on 06.10.2015.
 */
public class Paladin extends Knight {
    private Speech speech;
    public Paladin(Speech speech){
        super();
        this.setSpeech(speech);
    }
    public Paladin(Speech speech, int a, int b){
        super(a, b);
        this.setSpeech(speech);

    }
    public void weapon(String s){
        System.out.println("");
        super.weapon(s);
        System.out.println("And he says:");
        getSpeech().words();
    }

    public Speech getSpeech() {
        return speech;
    }

    public void setSpeech(Speech speech) {
        this.speech = speech;
    }
}
