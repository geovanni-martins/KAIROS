package com.kairos.model;

public class Moderator extends User{
    private String responsibileDiscipline;

    public Moderator(String name, String email, String password, String role, String responsibileDiscipline) {
        super(name, email, password, role);
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

    @Override
    public boolean isAdmin() { return false; }

    @Override
    public boolean isStudent() { return false; }

    @Override
    public boolean canManageContent() { return true; }

    @Override
    public void applyQuestionStats(MultipleChoiceQuestion question) {
        question.setStats("verified");
    }
}
