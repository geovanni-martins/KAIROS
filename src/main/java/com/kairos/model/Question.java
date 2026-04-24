package com.kairos.model;

import java.time.Instant;
import java.util.ArrayList;

public class Question {

    private int id;
    private String statement;
    private String stats;  // "verified", "not_verified"
    private String difficulty;  // "easy", "medium", "hard"
    private Topic topic;
    private User createBy;
    private Instant createAt;
    private ArrayList<Alternative> alternatives = new ArrayList<>();

    public Question(int id, String statement, String stats, String difficulty, Topic topic, Instant createAt) {
        this.id = id;
        this.statement = statement;
        this.stats = stats;
        this.difficulty = difficulty;
        this.topic = topic;
        this.createAt = createAt;
    }

    public Question(String statement, String stats, String difficulty, Topic topic) {
        this.statement = statement;
        this.stats = stats;
        this.difficulty = difficulty;
        this.topic = topic;
        createAt = Instant.now();
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

    public Instant getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Instant createAt) {
        this.createAt = createAt;
    }

    @Override
    public String toString() {
        return "Question{id=" + id + ", statement='" + statement + "', stats='" + stats + "', difficulty='" + difficulty + "'}";
    }
}
