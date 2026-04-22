package com.kairos.model;

import java.util.ArrayList;

public class Student extends User {
    private int currentStreak, highestStreak;
    private ArrayList<Topic> chosenTopic;

    public Student(String name, String email, String password) {
        super(name, email, password);
        currentStreak = 0;
        highestStreak = 0;
        chosenTopic = new ArrayList<>();
    }

    public Student(int id, String name, String email, String password, String role) {
        super(id, name, email, password, role);
    }

    public ArrayList<Topic> getChosenTopic() {
        return chosenTopic;
    }

    public void setChosenTopic(ArrayList<Topic> chosenTopic) {
        this.chosenTopic = chosenTopic;
    }

    public int getHighestStreak() {
        return highestStreak;
    }

    public void setHighestStreak(int highestStreak) {
        this.highestStreak = highestStreak;
    }

    public int getCurrentStreak() {
        return currentStreak;
    }

    public void setCurrentStreak(int currentStreak) {
        this.currentStreak = currentStreak;
    }
}
