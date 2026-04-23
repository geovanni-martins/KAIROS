package com.kairos.model;

import java.util.ArrayList;

public class Student extends User {
    private int level, xp;
    private ArrayList<Topic> chosenTopic;

    public Student(String name, String email, String password, String role) {
        super(name, email, password, role);
        level = 0;
        xp = 0;
        chosenTopic = new ArrayList<>();
    }

    public Student(int id, String name, String email, String password, String role, int level, int xp) {
        super(id, name, email, password, role);
        this.level = level;
        this.xp = xp;
        chosenTopic = new ArrayList<>();
    }

    public ArrayList<Topic> getChosenTopic() {
        return chosenTopic;
    }

    public void setChosenTopic(ArrayList<Topic> chosenTopic) {
        this.chosenTopic = chosenTopic;
    }

    public int getXp() {
        return xp;
    }

    public void setXp(int xp) {
        this.xp = xp;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }
}
