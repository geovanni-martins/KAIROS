package com.kairos.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/gap")
public class GapController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int studentId = Integer.parseInt(request.getParameter("studentId")) ;
		int topicId = Integer.parseInt(request.getParameter("topicId")) ;
		boolean gotRight = Boolean.parseBoolean(request.getParameter("gotRight"));
		
		com.kairos.dao.GapDAO dao = new com.kairos.dao.GapDAO();
		
		dao.updatePerformance(studentId, topicId, gotRight);
		
		dao.checkAndSolveGap(studentId, topicId);
		
		response.setStatus(200);
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		com.kairos.dao.GapDAO dao = new com.kairos.dao.GapDAO();
		
		String studentParam = request.getParameter("studentId");
		
		if(studentParam != null) {
			int studentId = Integer.parseInt(studentParam);
			java.util.List<com.kairos.model.Gap> list = dao.getByStudent(studentId);
			
			response.setStatus(200);
			System.out.println("Fetched " + list.size() + " gaps for student " + studentId);
		}
	}
}
