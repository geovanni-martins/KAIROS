package com.kairos.servlet;

import com.kairos.controller.QuestionController;
import com.kairos.controller.TopicController;
import com.kairos.model.MultipleChoiceQuestion;
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

@WebServlet("/createQuestion")
public class CreateQuestionServlet extends HttpServlet {

    private QuestionController questionController = new QuestionController();
    private TopicController topicController = new TopicController();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        User user = (User) session.getAttribute("user");

        if (user == null || user.isStudent()) {
            resp.sendRedirect(req.getContextPath() + "/home");
            return;
        }

        req.setAttribute("topics", topicController.listTopics());
        req.getRequestDispatcher("/WEB-INF/views/createQuestion.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        HttpSession session = req.getSession(false);
        User user = (User) session.getAttribute("user");

        try {
            int topicId = Integer.parseInt(req.getParameter("topicId"));
            String statement = req.getParameter("statement");
            String difficulty = req.getParameter("difficulty");
            String justification = req.getParameter("justification");

            Topic topic = topicController.searchTopicById(topicId);

            String correctParameter = req.getParameter("correct");
            int correctIndex = Integer.parseInt(correctParameter);

            MultipleChoiceQuestion question = new MultipleChoiceQuestion(
                    statement, "not_verified", difficulty, topic, justification
            );

            for (int i = 0; i < 5; i++) {
                String text = req.getParameter("alt" + i);
                boolean isCorrect = (i == correctIndex);
                question.addAlternative(text, isCorrect);
            }

            questionController.insertQuestion(question, user);

            resp.sendRedirect(req.getContextPath() + "/createQuestion?success=true");

        } catch (Exception e) {
            req.setAttribute("erro", "Erro ao criar questão: " + e.getMessage());
            req.setAttribute("topics", topicController.listTopics());
            req.getRequestDispatcher("/WEB-INF/views/createQuestion.jsp").forward(req, resp);
        }
    }
}