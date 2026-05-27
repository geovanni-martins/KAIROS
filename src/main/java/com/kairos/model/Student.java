package com.kairos.model;

public class Student extends User {
    private int level, xp;

    public Student(String name, String email, String password, String role) {
        super(name, email, password, role);
        level = 0;
        xp = 0;
    }

    public Student(int id, String name, String email, String password, String role, int level, int xp) {
        super(id, name, email, password, role);
        this.level = level;
        this.xp = xp;
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

    @Override
    public boolean isStudent() { return true; }
}
