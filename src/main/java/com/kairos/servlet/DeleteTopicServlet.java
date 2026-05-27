package com.kairos.servlet;

import com.kairos.dao.TopicDAO;
import com.kairos.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/deleteTopic")
public class DeleteTopicServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        User user = null;

        if (session != null) {
            user = (User) session.getAttribute("user");
        }

        if (user == null || user.isStudent()) {
            resp.sendRedirect(req.getContextPath() + "/home");
            return;
        }

        try {
            int topicId = Integer.parseInt(req.getParameter("topicId"));
            TopicDAO dao = new TopicDAO();
            dao.delete(topicId);

            resp.sendRedirect(req.getContextPath() + "/createTopic?deleted=true");
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect(req.getContextPath() + "/createTopic?error=true");
        }
    }
}