package com.kairos.servlet;

import com.kairos.controller.ReportController;
import com.kairos.dao.QuestionDAO;
import com.kairos.dao.StudentDAO;
import com.kairos.model.Question;
import com.kairos.model.Student;
import com.kairos.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/reportQuestion")
public class ReportQuestionServlet extends HttpServlet {

    private final ReportController reportController = new ReportController();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        if (user == null || !user.isStudent()) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        try {
            int questionId = Integer.parseInt(req.getParameter("questionId"));
            int topicId = Integer.parseInt(req.getParameter("topicId"));

            QuestionDAO questionDAO = new QuestionDAO();
            Question question = questionDAO.getById(questionId);

            req.setAttribute("question", question);
            req.setAttribute("topicId", topicId);

            req.getRequestDispatcher("/WEB-INF/views/reportQuestion.jsp").forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect(req.getContextPath() + "/home");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        if (user == null || !user.isStudent()) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        try {
            int questionId = Integer.parseInt(req.getParameter("questionId"));
            int topicId = Integer.parseInt(req.getParameter("topicId"));
            String reason = req.getParameter("reason");

            StudentDAO studentDAO = new StudentDAO();
            Student student = studentDAO.getById(user.getId());

            QuestionDAO questionDAO = new QuestionDAO();
            Question question = questionDAO.getById(questionId);

            reportController.insertReport(student, question, reason);

            resp.sendRedirect(req.getContextPath() + "/questions?topicId=" + topicId + "&reported=true");

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect(req.getContextPath() + "/home");
        }
    }
}