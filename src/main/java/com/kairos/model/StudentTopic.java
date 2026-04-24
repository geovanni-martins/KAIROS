package com.kairos.model;

public class StudentTopic {

    private Student student;
    private Topic topic;
    private int qtySolvedQuestions;
    private int qtyWrongQuestions;

    public StudentTopic(Student student, Topic topic, int qtySolvedQuestions, int qtyWrongQuestions) {
        this.student = student;
        this.topic = topic;
        this.qtySolvedQuestions = qtySolvedQuestions;
        this.qtyWrongQuestions = qtyWrongQuestions;
    }

    public StudentTopic(int qtySolvedQuestions, int qtyWrongQuestions) {
        this.qtySolvedQuestions = qtySolvedQuestions;
        this.qtyWrongQuestions = qtyWrongQuestions;
    }

    public Student getStudent() {
        return student;
    }

    public Topic getTopic() {
        return topic;
    }

    public int getQtySolvedQuestions() {
        return qtySolvedQuestions;
    }

    public void setQtySolvedQuestions(int qtySolvedQuestions) {
        this.qtySolvedQuestions = qtySolvedQuestions;
    }

    public int getQtyWrongQuestions() {
        return qtyWrongQuestions;
    }

    public void setQtyWrongQuestions(int qtyWrongQuestions) {
        this.qtyWrongQuestions = qtyWrongQuestions;
    }

    @Override
    public String toString() {
        return "StudentTopic{" +
                "studentId=" + student.getId() +
                ", topicId=" + topic.getId() +
                ", solved=" + qtySolvedQuestions +
                ", wrong=" + qtyWrongQuestions +
                '}';
    }
}
