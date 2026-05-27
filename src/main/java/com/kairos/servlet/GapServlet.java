package com.kairos.servlet;

import java.io.IOException;
import java.util.List;

import com.kairos.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.kairos.controller.GapController;
import com.kairos.model.Gap;
import jakarta.servlet.http.HttpSession;

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

		HttpSession session = request.getSession(false);
		User user = null;

		if (session != null) {
			user = (User) session.getAttribute("user");
		}

		//Barreira de segurança, garante que apenas o perfil "Estudante" acesse a tela de lacunas
		if (user == null || !user.isStudent()) {
			response.sendRedirect(request.getContextPath() + "/home");
			return;
		}

		int studentId = user.getId();

		GapController controller = new GapController();
		List<Gap> list = controller.getGapsByStudent(studentId);

		request.setAttribute("listaLacunas", list);
		request.getRequestDispatcher("/WEB-INF/views/gap.jsp").forward(request, response);
	}
}