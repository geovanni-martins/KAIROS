package com.kairos.controller;

import java.util.List;
import com.kairos.dao.AnswerDAO;
import com.kairos.dao.StudentTopicDAO;
import com.kairos.model.Answer;

public class AnswerController {

	public void processNewAnswer(int studentId, int questionId, int topicId, boolean gotRight) {
		
			java.time.Instant createdAt = java.time.Instant.now();
			Answer ans = new Answer(studentId, questionId, gotRight, createdAt);
			
			AnswerDAO dao = new AnswerDAO();
			dao.insert(ans);
			
			StudentTopicDAO studentTopicDAO = new StudentTopicDAO();
			//O sistema não guarda apenas o histório bruto da resposta, mas também já alimenta uma tabela agregada de progresso por tópico
			//isso evita sobrecarregar o banco na hora de gerar os relatórios
			studentTopicDAO.upsertProgress(studentId, topicId, gotRight);
	}
	
	public List<Answer> getAnswersByStudent(int studentId) {
			AnswerDAO dao = new AnswerDAO();
			return dao.getAllByStudent(studentId);
	}
	
	public List<Answer> getAnswersByQuestion(int questionId) {
			AnswerDAO dao = new AnswerDAO();
			return dao.getAllByQuestion(questionId);
	}
}