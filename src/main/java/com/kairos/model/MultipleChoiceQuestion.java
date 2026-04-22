package com.kairos.model;

public class MultipleChoiceQuestion extends Question {

    private String template;
    private String justification;

    public MultipleChoiceQuestion(int id, String statement, String stats, String difficulty, Topic topic, String template, String justification) {
        super(id, statement, stats, difficulty, topic);
        this.template = template;
        this.justification = justification;
    }

    public MultipleChoiceQuestion(String statement, String stats, String difficulty, Topic topic, String template, String justification) {
        super(statement, stats, difficulty, topic);
        this.template = template;
        this.justification = justification;
    }

    public String getTemplate() {
        return template;
    }

    public void setTemplate(String template) {
        this.template = template;
    }

    public String getJustification() {
        return justification;
    }

    public void setJustification(String justification) {
        this.justification = justification;
    }
}
