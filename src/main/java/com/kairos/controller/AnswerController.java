package com.kairos.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/answer")
public class AnswerController extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		int userId = Integer.parseInt(request.getParameter("userId"));
		int questionId =  Integer.parseInt(request.getParameter("questionId"));
		boolean isCorrect = Boolean.parseBoolean(request.getParameter("isCorrect"));
		
		java.time.Instant createdAt = java.time.Instant.now();
		
		com.kairos.model.Answer ans = new com.kairos.model.Answer(userId, questionId, isCorrect, createdAt);
		
		com.kairos.dao.AnswerDAO dao = new com.kairos.dao.AnswerDAO();
		dao.create(ans);
		
		response.setStatus(201);
	}
	@Override 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		com.kairos.dao.AnswerDAO dao = new com.kairos.dao.AnswerDAO();
		
		String userParam = request.getParameter("userId");
		String questionParam = request.getParameter("questionId");
		
		if(userParam != null) {
				int userId = Integer.parseInt(userParam);
				java.util.List<com.kairos.model.Answer> list = dao.getByUser(userId);
				
				response.setStatus(200);
				System.out.println("Fetched " + list.size() + " answer for user " + userId);
		} else if(questionParam != null){
				int questionId = Integer.parseInt(questionParam);
				java.util.List<com.kairos.model.Answer> list = dao.getByQuestion(questionId);
				
				response.setStatus(200);
				System.out.println("Fetched " + list.size() + " answer for question " + questionId);
		}
		
	}
}
