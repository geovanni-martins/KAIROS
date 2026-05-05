package com.kairos.servlet;

import com.kairos.controller.StudentTopicController;
import com.kairos.dao.AnswerDAO;
import com.kairos.dao.GapDAO;
import com.kairos.model.Gap;
import com.kairos.model.StudentTopic;
import com.kairos.model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/home")
public class HomeServlet extends HttpServlet {

    private StudentTopicController studentTopicController = new StudentTopicController();
    private GapDAO gapDAO = new GapDAO();
    private AnswerDAO answerDAO = new AnswerDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        HttpSession session = req.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            User user = (User) session.getAttribute("user");

            if ("student".equals(user.getRole())) {
                int studentId = user.getId();

                List<StudentTopic> topics = studentTopicController.listByStudent(studentId);
                int solvedQuestions = 0;
                int wrongQuestions = 0;

                if (topics != null) {
                    for (StudentTopic studentTopic : topics) {
                        solvedQuestions += studentTopic.getQtySolvedQuestions();
                        wrongQuestions += studentTopic.getQtyWrongQuestions();
                    }
                }

                int totalHits = solvedQuestions - wrongQuestions;
                int percentageCorrectAnswers = 0;
                if (solvedQuestions > 0) {
                    percentageCorrectAnswers = (int) Math.round(((double) totalHits / solvedQuestions) * 100);
                }

                List<Gap> gaps = gapDAO.getAllByStudent(studentId);
                int activeGaps = 0;
                if (gaps != null) {
                    for (Gap gap : gaps) {
                        if ("NOT_SOLVED".equalsIgnoreCase(gap.getStats())) {
                            activeGaps++;
                        }
                    }
                }

                req.setAttribute("solvedQuestions", solvedQuestions);
                req.setAttribute("percentageCorrectAnswers", percentageCorrectAnswers);
                req.setAttribute("activeGaps", activeGaps);
                req.setAttribute("topics", topics);
                req.setAttribute("weeklyData", answerDAO.getWeeklyProgress(studentId)); //grafico
            }
        }

        req.getRequestDispatcher("/WEB-INF/views/home.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");


    }
}