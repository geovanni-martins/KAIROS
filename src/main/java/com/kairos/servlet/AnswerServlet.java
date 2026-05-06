package com.kairos.servlet;

import java.io.IOException;
import java.util.List;

import com.kairos.controller.AnswerController;
import com.kairos.model.Answer;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/answer")
public class AnswerServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int studentId = Integer.parseInt(request.getParameter("studentId"));
		int questionId = Integer.parseInt(request.getParameter("questionId"));
		int topicId = Integer.parseInt(request.getParameter("topicId"));
		boolean gotRight = Boolean.parseBoolean(request.getParameter("gotRight"));
		
		AnswerController controller = new AnswerController();
		controller.processNewAnswer(studentId, questionId, topicId, gotRight);
		
		response.setStatus(201);
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		AnswerController controller = new AnswerController();
		
		String studentParam = request.getParameter("studentId");
		String questionParam = request.getParameter("questionId");
		
		if(studentParam != null) {
				int studentId = Integer.parseInt(studentParam);
				List<Answer> list = controller.getAnswersByStudent(studentId);
			
				request.setAttribute("listaRespostas", list);
				request.getRequestDispatcher("/desempenho.jsp").forward(request, response);

		} else if(questionParam !=  null) {
				int questionId = Integer.parseInt(questionParam);
				List<Answer> list = controller.getAnswersByQuestion(questionId);
				
				request.setAttribute("listaRespostas", list);
				request.getRequestDispatcher("/desempenho.jsp").forward(request, response);
		}
	}
}
