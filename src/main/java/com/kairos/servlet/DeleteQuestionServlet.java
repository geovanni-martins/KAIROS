package com.kairos.servlet;

import com.kairos.dao.QuestionDAO;
import com.kairos.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/deleteQuestion")
public class DeleteQuestionServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        User user = null;

        if (session != null) {
            user = (User) session.getAttribute("user");
        }

        if (user == null || user.getRole().equals("student")) {
            resp.sendRedirect(req.getContextPath() + "/home");
            return;
        }

        try {
            int questionId = Integer.parseInt(req.getParameter("questionId"));
            QuestionDAO dao = new QuestionDAO();
            dao.delete(questionId);

            resp.sendRedirect(req.getContextPath() + "/manageQuestions?deleted=true");
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect(req.getContextPath() + "/manageQuestions?error=true");
        }
    }
}