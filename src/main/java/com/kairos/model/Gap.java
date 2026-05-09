package com.kairos.model;

import java.time.Instant;

public class Gap {
	private int id;
	private int studentId;
	private int topicId;
	private int qtySolvedQuestions;
	private int correctAnswers;
	private Instant createdAt;
	private String stats; //'solved', 'not_solved'
	private String topicName;
	private String subject;
	
	public Gap() {
		
	}
	public Gap(int studentId, int topicId, int qtySolvedQuestions, int correctAnswers, Instant createdAt, String stats) {
		this.studentId = studentId;
		this.topicId = topicId;
		this.qtySolvedQuestions = qtySolvedQuestions;
		this.correctAnswers = correctAnswers;
		this.createdAt = createdAt;
		this.stats = stats;
	}
	public Gap(int id, int studentId, int topicId, int qtySolvedQuestions, int correctAnswers, Instant createdAt, String stats) {
		this.id = id;
		this.studentId = studentId;
		this.topicId = topicId;
		this.qtySolvedQuestions = qtySolvedQuestions;
		this.correctAnswers = correctAnswers;
		this.createdAt = createdAt;
		this.stats = stats;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getStudentId() {
		return studentId;
	}
	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}
	public int getTopicId() {
		return topicId;
	}
	public void setTopicId(int topicId) {
		this.topicId = topicId;
	}
	public int getQtySolvedQuestions() {
		return qtySolvedQuestions;
	}
	public void setQtySolvedQuestions(int qtySolvedQuestions) {
		this.qtySolvedQuestions = qtySolvedQuestions;
	}
	public int getCorrectAnswers() {
		return correctAnswers;
	}
	public void setCorrectAnswers(int correctAnswers) {
		this.correctAnswers = correctAnswers;
	}
	public Instant getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Instant createdAt) {
		this.createdAt = createdAt;
	}
	public String getStats() {
		return stats;
	}
	public void setStats(String stats) {
		this.stats = stats;
	}
	public String getTopicName() {
		return topicName;
	}
	public void setTopicName(String topicName) {
		this.topicName = topicName;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
}
