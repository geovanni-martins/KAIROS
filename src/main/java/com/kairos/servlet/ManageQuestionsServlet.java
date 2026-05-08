package com.kairos.servlet;

import com.kairos.dao.QuestionDAO;
import com.kairos.dao.TopicDAO;
import com.kairos.model.Question;
import com.kairos.model.Topic;
import com.kairos.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/manageQuestions")
public class ManageQuestionsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        User user = null;

        if (session != null) {
            user = (User) session.getAttribute("user");
        }

        if (user == null || user.getRole().equals("student")) {
            resp.sendRedirect(req.getContextPath() + "/home");
            return;
        }

        QuestionDAO questionDAO = new QuestionDAO();
        TopicDAO topicDAO = new TopicDAO();

        List<Topic> allTopics = topicDAO.getAll();
        List<Question> allQuestions = questionDAO.getAll();
        List<Question> questionsToShow = new ArrayList<>();

        String topicParameter = req.getParameter("topicId");

        if (topicParameter != null && !topicParameter.isEmpty()) {
            int selectedTopicId = Integer.parseInt(topicParameter);

            for (Question q : allQuestions) {
                if (q.getTopic().getId() == selectedTopicId) {
                    questionsToShow.add(q);
                }
            }
        } else {
            questionsToShow = allQuestions;
        }

        for (Question q : questionsToShow) {
            for (Topic t : allTopics) {
                if (q.getTopic().getId() == t.getId()) {
                    q.getTopic().setName(t.getName());
                    break;
                }
            }
        }

        req.setAttribute("topics", allTopics);
        req.setAttribute("questions", questionsToShow);
        req.setAttribute("selectedTopic", topicParameter);

        req.getRequestDispatcher("/WEB-INF/views/manageQuestions.jsp").forward(req, resp);
    }
}