package com.kairos.model;

import java.util.ArrayList;
import java.util.Date;

public class Question {

    private int id;
    private String statement;
    private String stats;  // "verified", "not_verified"
    private String difficulty;  // "easy", "medium", "hard"
    private Topic topic;
    private User createBy;
    private Date createAt;
    private ArrayList<Alternative> alternatives = new ArrayList<>();

    public Question(int id, String statement, String stats, String difficulty, Topic topic) {

        this.id = id;
        this.statement = statement;
        this.stats = stats;
        this.difficulty = difficulty;
        this.topic = topic;
    }

    public Question(String statement, String stats, String difficulty, Topic topic) {

        this.statement = statement;
        this.stats = stats;
        this.difficulty = difficulty;
        this.topic = topic;
    }

    public int getId() {
        return id;
    }

    public String getStatement() {
        return statement;
    }

    public void setStatement(String statement) {
        this.statement = statement;
    }

    public String getStats() {
        return stats;
    }

    public void setStats(String stats) {
        this.stats = stats;
    }

    public String getDifficulty() {
        return difficulty;
    }

    public void setDifficulty(String difficulty) {
        this.difficulty = difficulty;
    }

    public Topic getTopic() {
        return topic;
    }

    public void setTopic(Topic topic) {
        this.topic = topic;
    }

    public ArrayList<Alternative> getAlternatives() {
        return alternatives;
    }

    public void setAlternatives(ArrayList<Alternative> alternatives) {
        this.alternatives = alternatives;
    }

    public User getCreateBy() {
        return createBy;
    }

    public void setCreateBy(User createBy) {
        this.createBy = createBy;
    }

    public Date getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }
}
