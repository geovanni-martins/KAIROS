package com.kairos.model;

import java.time.Instant;

public class MultipleChoiceQuestion extends Question {


    private String justification;

    public MultipleChoiceQuestion(int id, String statement, String stats, String difficulty, Topic topic, Instant createAt, String justification) {
        super(id, statement, stats, difficulty, topic, createAt);
        this.justification = justification;
    }

    public MultipleChoiceQuestion(String statement, String stats, String difficulty, Topic topic, String justification) {
        super(statement, stats, difficulty, topic);
        this.justification = justification;
    }

    public String getJustification() {
        return justification;
    }

    public void setJustification(String justification) {
        this.justification = justification;
    }
}
