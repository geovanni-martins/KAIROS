package com.kairos.model;

import java.time.Instant;

public class Answer {
	private int id;
	private int studentId;
	private int questionId;
	private boolean gotRight;
	private Instant createdAt;
	private String type; //'Multiplique_Choice
	private String baseAnswer;
	
	public Answer() {
		
	}
	
	public Answer(int studentId, int questionId, boolean gotRight, Instant createdAt, String type, String baseAnswer) {
		this.studentId = studentId;
		this.questionId = questionId;
		this.gotRight = gotRight;
		this.createdAt = createdAt;
		this.type = type;
		this.baseAnswer = baseAnswer;
	}
	public Answer(int id, int studentId, int questionId, boolean gotRight, Instant createdAt, String type, String baseAnswer) {
		this.id = id;
		this.studentId = studentId;
		this.questionId = questionId;
		this.gotRight = gotRight;
		this.createdAt = createdAt;
		this.type = type;
		this.baseAnswer = baseAnswer;
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

	public int getQuestionId() {
		return questionId;
	}

	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}

	public boolean isGotRight() {
		return gotRight;
	}

	public void setGotRight(boolean gotRight) {
		this.gotRight = gotRight;
	}

	public Instant getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Instant createdAt) {
		this.createdAt = createdAt;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getBaseAnswer() {
		return baseAnswer;
	}

	public void setBaseAnswer(String baseAnswer) {
		this.baseAnswer = baseAnswer;
	}
}
