package com.kairos.model;

import java.sql.Timestamp;

public class Answer {
	private int id;
	private int userId;
	private int questionId;
	private boolean isCorrect;
	private Timestamp createdAt;
	
	public Answer() {
		
	}
	public Answer(int id, int userId, int questionId, boolean isCorrect, Timestamp createdAt) {
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
	public Timestamp getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}
}
