package com.kairos.model;

import java.util.Objects;

public class Alternative {

    private int id;
    private String text;
    private Boolean isCorrect;
    private Question question;

    public Alternative(int id, String text, Boolean isCorrect, Question question) {
        Objects.requireNonNull(question, "Alternative deve pertencer a uma Question");
        this.id = id;
        this.text = text;
        this.isCorrect = isCorrect;
        this.question = question;
    }

    public Alternative(String text, Boolean isCorrect, Question question) {
        Objects.requireNonNull(question, "Alternative deve pertencer a uma Question");
        this.text = text;
        this.isCorrect = isCorrect;
        this.question = question;
    }

    public int getId() {
        return id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Boolean getCorrect() {
        return isCorrect;
    }

    public void setCorrect(Boolean correct) {
        isCorrect = correct;
    }

    public Question getQuestion() {
        return question;
    }


    @Override
    public String toString() {
        return "Alternative{id=" + id + ", text='" + text + "', isCorrect=" + isCorrect + "}";
    }
}
