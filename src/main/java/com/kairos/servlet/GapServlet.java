package com.kairos.servlet;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.kairos.controller.GapController;
import com.kairos.model.Gap;

@WebServlet("/gap")
public class GapServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int studentId = Integer.parseInt(request.getParameter("studentId"));
		int topicId = Integer.parseInt(request.getParameter("topicId"));
		boolean gotRight = Boolean.parseBoolean(request.getParameter("gotRight"));
		
		GapController controller = new GapController();
		controller.processGapUpdate(studentId, topicId, gotRight);
		
		response.setStatus(200);
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		GapController controller = new GapController();
		String studentParam = request.getParameter("studentId");
		
		if(studentParam != null) {
			int studentId = Integer.parseInt(studentParam);
			List<Gap> list = controller.getGapsByStudent(studentId);
			
			response.setStatus(200);
			System.out.println("Fetched " + list.size() + " gaps for student " + studentId);
		}
	}
}