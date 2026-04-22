package com.kairos.model;

public class Topic {

    private int id;
    private String name;
    private String subject;

    public Topic(int id, String name, String subject) {

        this.id = id;
        this.name = name;
        this.subject = subject;
    }

    public Topic(String name, String subject) {

        this.name = name;
        this.subject = subject;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }
}
