package com.kairos.servlet;

import com.kairos.dao.*;
import com.kairos.model.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.Instant;
import java.util.List;

@WebServlet("/questions")
public class StudentQuestionsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null || !"student".equals(user.getRole())) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        TopicDAO topicDAO = new TopicDAO();
        QuestionDAO questionDAO = new QuestionDAO();

        String topicParam = req.getParameter("topicId");
        List<Question> questions;
        List<Topic> allTopics = topicDAO.getAll();

        int studentId = user.getId();

        if (topicParam != null && !topicParam.isEmpty()) {
            questions = questionDAO.getUnansweredByTopic(Integer.parseInt(topicParam), studentId);
        } else {
            questions = questionDAO.getUnanswered(studentId);
        }

        for (Question q : questions) {
            for (Topic t : allTopics) {
                if (t.getId() == q.getTopic().getId()) {
                    q.getTopic().setName(t.getName());
                    break;
                }
            }
        }

        req.setAttribute("topics", allTopics);
        req.setAttribute("questions", questions);
        req.setAttribute("selectedTopic", topicParam);

        req.getRequestDispatcher("/WEB-INF/views/questions.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null || !"student".equals(user.getRole())) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        int studentId = user.getId();
        int questionId = Integer.parseInt(req.getParameter("questionId"));
        int topicId = Integer.parseInt(req.getParameter("topicId"));
        int selectedAlternativeId = Integer.parseInt(req.getParameter("alternativeId"));

        AlternativeDAO altDAO = new AlternativeDAO();
        List<Alternative> alternatives = altDAO.getAllByQuestion(questionId);
        boolean gotRight = false;

        for (Alternative alt : alternatives) {
            if (alt.getId() == selectedAlternativeId) {
                gotRight = alt.getCorrect();
                break;
            }
        }
        AnswerDAO answerDAO = new AnswerDAO();
        Answer answer = new Answer(studentId, questionId, gotRight, Instant.now());
        answerDAO.insert(answer);

        StudentTopicDAO stDAO = new StudentTopicDAO();
        stDAO.upsertProgress(studentId, topicId, gotRight);

        resp.sendRedirect(req.getContextPath() + "/questions?topicId=" + topicId + "&answered=true&correct=" + gotRight);
    }
}
