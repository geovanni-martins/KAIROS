package com.kairos.controller;

import java.util.List;

import com.kairos.dao.AnswerDAO;
import com.kairos.model.Answer;

public class AnswerController{

	public void processNewAnswer(int studentId, int questionId, boolean gotRight) {
		
		java.time.Instant createdAt = java.time.Instant.now();
		Answer ans = new Answer(studentId, questionId, gotRight);
		AnswerDAO dao = new AnswerDAO();
		dao.insert(ans);
	}
	
	public List<Answer> getAnswersByStudent(int studentId){
		AnswerDAO dao = new AnswerDAO();
		return dao.getAllByStudent(studentId);
	}
	
	public List<Answer> getAnswersByQuestion(int questionId){
		AnswerDAO dao = new AnswerDAO();
		return dao.getAllByQuestion(questionId);
	}
}