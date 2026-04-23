package com.kairos.model;

public class StudentTopic {

    private int student_id;
    private int topic_id;
    private int qty_solved_questions;
    private int qty_wrong_questions;

    public StudentTopic(int student_id, int topic_id, int qty_solved_questions, int qty_wrong_questions) {
        this.student_id = student_id;
        this.topic_id = topic_id;
        this.qty_solved_questions = qty_solved_questions;
        this.qty_wrong_questions = qty_wrong_questions;
    }

    public StudentTopic(int qty_solved_questions, int qty_wrong_questions) {
        this.qty_solved_questions = qty_solved_questions;
        this.qty_wrong_questions = qty_wrong_questions;
    }

    public int getStudent_id() {
        return student_id;
    }

    public int getTopic_id() {
        return topic_id;
    }

    public int getQty_solved_questions() {
        return qty_solved_questions;
    }

    public void setQty_solved_questions(int qty_solved_questions) {
        this.qty_solved_questions = qty_solved_questions;
    }

    public int getQty_wrong_questions() {
        return qty_wrong_questions;
    }

    public void setQty_wrong_questions(int qty_wrong_questions) {
        this.qty_wrong_questions = qty_wrong_questions;
    }
}
