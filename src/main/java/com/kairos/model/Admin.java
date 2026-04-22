package com.kairos.model;

public class Admin extends User {
    public Admin(String name, String email, String password) {
        super(name, email, password);
    }

    public Admin(int id, String name, String email, String password, String role) {
        super(id, name, email, password, role);
    }
}
