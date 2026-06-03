package com.kairos.model;

import java.time.Instant;

public class Report {
    private int id;
    private Student student;
    private MultipleChoiceQuestion question;
    private String reason;
    private String status; // "analyzed", "not_analyzed"
    private Instant createdAt;
    private Moderator analyzedBy;

    public Report(Student student, MultipleChoiceQuestion question, String reason, String status) {
        this.student = student;
        this.question = question;
        this.reason = reason;
        this.status = status;
        this.analyzedBy = null;
    }

    public Report(int id, Student student, MultipleChoiceQuestion question, String reason, String status, Instant createdAt, Moderator analyzedBy) {
        this.id = id;
        this.student = student;
        this.question = question;
        this.reason = reason;
        this.status = status;
        this.createdAt = createdAt;
        this.analyzedBy = analyzedBy;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public Moderator getAnalyzedBy() {
        return analyzedBy;
    }

    public void setAnalyzedBy(Moderator analyzedBy) {
        this.analyzedBy = analyzedBy;
    }

    public Instant getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Instant createdAt) {
        this.createdAt = createdAt;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public MultipleChoiceQuestion getQuestion() {
        return question;
    }

    public void setQuestion(MultipleChoiceQuestion question) {
        this.question = question;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public int getId() {
        return id;
    }
}
