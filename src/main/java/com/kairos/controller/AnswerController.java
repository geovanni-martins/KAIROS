package com.kairos.controller;

import com.kairos.dao.AnswerDAO;
import com.kairos.dao.StudentTopicDAO;
import com.kairos.model.Answer;
import java.io.IOException;
import java.time.Instant;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/answer")
public class AnswerController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private AnswerDAO answerDAO = new AnswerDAO();
	private StudentTopicDAO studentTopicDAO = new StudentTopicDAO();

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int studentId = Integer.parseInt(request.getParameter("studentId"));
			int questionId = Integer.parseInt(request.getParameter("questionId"));
			int topicId = Integer.parseInt(request.getParameter("topicId"));
			boolean gotRight = Boolean.parseBoolean(request.getParameter("gotRight"));
			Instant createdAt = Instant.now();

			Answer answer = new Answer(studentId, questionId, gotRight, createdAt);
			answerDAO.insert(answer);

			studentTopicDAO.upsertProgress(studentId, topicId, gotRight);

			response.setStatus(201);
			System.out.println("Processamento de resposta concluído para o estudante: " + studentId);

		} catch (Exception e) {
			System.err.println("Erro ao processar resposta: " + e.getMessage());
			response.setStatus(400);
		}
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String studentParam = request.getParameter("studentId");
		String questionParam = request.getParameter("questionId");

		if (studentParam != null) {
			int studentId = Integer.parseInt(studentParam);
			List<Answer> list = answerDAO.getAllByStudent(studentId);
			response.setStatus(200);
			System.out.println("Fetched " + list.size() + " answers for student " + studentId);
		} else if (questionParam != null) {
			int questionId = Integer.parseInt(questionParam);
			List<Answer> list = answerDAO.getAllByQuestion(questionId);
			response.setStatus(200);
			System.out.println("Fetched " + list.size() + " answers for question " + questionId);
		}
	}
}