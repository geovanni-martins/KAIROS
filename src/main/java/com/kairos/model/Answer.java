package com.kairos.model;

import java.time.Instant;

public class Answer {
	private int id;
	private int userId;
	private int questionId;
	private boolean isCorrect;
	private Instant createdAt;
	
	public Answer() {
		
	}
	
	public Answer(int userId, int questionId, boolean isCorrect, Instant createdAt) {
		this.userId = userId;
		this.questionId = questionId;
		this.isCorrect = isCorrect;
		this.createdAt = createdAt;
	}
	
	public Answer(int id, int userId, int questionId, boolean isCorrect, Instant createdAt) {
		this.id = id;
		this.userId = userId;
		this.questionId = questionId;
		this.isCorrect = isCorrect;
		this.createdAt = createdAt;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getQuestionId() {
		return questionId;
	}
	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}
	public boolean isCorrect() {
		return isCorrect;
	}
	public void setCorrect(boolean isCorrect) {
		this.isCorrect = isCorrect;
	}
	public Instant getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Instant createdAt) {
		this.createdAt = createdAt;
	}
}
