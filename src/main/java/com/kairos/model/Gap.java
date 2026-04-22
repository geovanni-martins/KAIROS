package com.kairos.model;

public class Gap {
	private int id;
	private int userId;
	private int topicId;
	private String status; // Ex "OPEN", "IN_PROGRESS"  "CLOSED"
	
	public Gap() {
		
	}
	public Gap(int id, int userId, int topicId, String status) {
		this.id = id;
		this.userId = userId;
		this.topicId = topicId;
		this.status = status;
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
	public int getTopicId() {
		return topicId;
	}
	public void setTopicId(int topicId) {
		this.topicId = topicId;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
}
