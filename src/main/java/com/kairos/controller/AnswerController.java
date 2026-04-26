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

		int studentId = Integer.parseInt(request.getParameter("studentId"));
		int questionId =  Integer.parseInt(request.getParameter("questionId"));
		boolean gotRight = Boolean.parseBoolean(request.getParameter("gotRight"));
		java.time.Instant createdAt = java.time.Instant.now();
		String type = request.getParameter("type");
		String baseAnswer = request.getParameter("baseAnswer");
		
		com.kairos.model.Answer ans = new com.kairos.model.Answer(studentId, questionId, gotRight, createdAt, type, baseAnswer);
		
		com.kairos.dao.AnswerDAO dao = new com.kairos.dao.AnswerDAO();
		dao.create(ans);
		
		response.setStatus(201);
	}
	
	@Override 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		com.kairos.dao.AnswerDAO dao = new com.kairos.dao.AnswerDAO();
		
		String studentParam = request.getParameter("studentId");
		String questionParam = request.getParameter("questionId");
		
		if(studentParam != null) {
			int studentId = Integer.parseInt(studentParam);
			java.util.List<com.kairos.model.Answer> list = dao.getByStudent(studentId);
			
			response.setStatus(200);
			System.out.println("Fetched " + list.size() + " answers for student " + studentId);
		} else if(questionParam != null){
			int questionId = Integer.parseInt(questionParam);
			java.util.List<com.kairos.model.Answer> list = dao.getByQuestion(questionId);
			
			response.setStatus(200);
			System.out.println("Fetched " + list.size() + " answers for question " + questionId);
		}
	}
}