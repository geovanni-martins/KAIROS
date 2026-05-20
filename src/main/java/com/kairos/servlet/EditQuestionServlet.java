package com.kairos.servlet;

import com.kairos.controller.QuestionController;
import com.kairos.controller.TopicController;
import com.kairos.model.Alternative;
import com.kairos.model.MultipleChoiceQuestion;
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

@WebServlet("/editQuestion")
public class EditQuestionServlet extends HttpServlet {

    private final QuestionController questionController = new QuestionController();
    private final TopicController topicController = new TopicController();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        if (user == null || user.getRole().equals("student")) {
            resp.sendRedirect(req.getContextPath() + "/home");
            return;
        }

        try {
            int questionId = Integer.parseInt(req.getParameter("questionId"));

            Question question = questionController.searchQuestionById(questionId);

            req.setAttribute("question", question);
            req.setAttribute("topics", topicController.listTopics());

            req.getRequestDispatcher("/WEB-INF/views/editQuestion.jsp").forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect(req.getContextPath() + "/reports");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        if (user == null || user.getRole().equals("student")) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        try {
            int questionId = Integer.parseInt(req.getParameter("questionId"));
            int topicId = Integer.parseInt(req.getParameter("topicId"));
            String difficulty = req.getParameter("difficulty");
            String statement = req.getParameter("statement");

            int correctIndex = Integer.parseInt(req.getParameter("correctAlternativeIndex"));

            Topic topic = topicController.searchTopicById(topicId);

            MultipleChoiceQuestion mcq = new MultipleChoiceQuestion(
                    questionId, statement, "verified", difficulty, topic, null, "Atualizada via Painel"
            );

            ArrayList<Alternative> alts = new ArrayList<>();
            for (int i = 0; i < 5; i++) {
                String altText = req.getParameter("altText_" + i);
                boolean isCorrect = (i == correctIndex);
                alts.add(new Alternative(0, altText, isCorrect, mcq));
            }
            mcq.setAlternatives(alts);

            questionController.updateQuestion(mcq, user);

            resp.sendRedirect(req.getContextPath() + "/reports?resolved=true");

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect(req.getContextPath() + "/reports");
        }
    }
}