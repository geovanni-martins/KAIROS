package com.kairos.model;

public class Student extends User {

    public Student(String name, String email, String password, String role) {
        super(name, email, password, role);
    }

    public Student(int id, String name, String email, String password, String role) {
        super(id, name, email, password, role);
    }

    @Override
    public boolean isStudent() { return true; }
}
