package com.kairos.model;

import java.time.Instant;
import java.util.ArrayList;
import java.util.List;

public class MultipleChoiceQuestion extends Question {

    private String justification;
    private final ArrayList<Alternative> alternatives = new ArrayList<>();

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

    public List<Alternative> getAlternatives() {
        return alternatives;
    }

    public Alternative addAlternative(String text, Boolean isCorrect) {
        Alternative alternative = new Alternative(text, isCorrect, this);
        alternatives.add(alternative);

        return alternative;
    }

    public void addAlternative(Alternative alternative) {
        if (alternative == null) {
            System.out.println("Alternative deve pertencer a uma MultipleChoiceQuestion");
            return;
        }

        if (alternative.getQuestion() != this) {
            System.out.println("Alternative deve pertencer a uma MultipleChoiceQuestion");
            return;
        }

        alternatives.add(alternative);
    }

    public boolean removeAlternative(Alternative alt) {
        if (alt == null || alt.getQuestion() != this) {
            return false;
        }
        return alternatives.remove(alt);
    }
}
