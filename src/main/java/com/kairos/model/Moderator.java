package com.kairos.model;

public class Moderator extends User{
    private String responsibileDiscipline;

    public Moderator(String name, String email, String password, String responsibileDiscipline) {
        super(name, email, password);
        this.responsibileDiscipline = responsibileDiscipline;
    }

    public Moderator(int id, String name, String email, String password, String role, String responsibileDiscipline) {
        super(id, name, email, password, role);
        this.responsibileDiscipline = responsibileDiscipline;
    }

    public void setResponsibileDiscipline(String responsibileDiscipline) {
        this.responsibileDiscipline = responsibileDiscipline;
    }

    public String getResponsibileDiscipline() {
        return responsibileDiscipline;
    }
}
