package com.kairos.servlet;

import com.kairos.dao.TopicDAO;
import com.kairos.model.Topic;
import com.kairos.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/createTopic")
public class CreateTopicServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        HttpSession session = req.getSession(false);

        User user;
        if (session != null) {
            user = (User) session.getAttribute("user");
        } else {
            user = null;
        }

        if (user == null || user.getRole().equals("student")) {
            resp.sendRedirect(req.getContextPath() + "/home");
            return;
        }

        TopicDAO topicDAO = new TopicDAO();

        try {
            List<Topic> topics = topicDAO.getAll();
            req.setAttribute("topics", topics);
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("erro", "Erro ao carregar a lista de tópicos");
        }

        req.getRequestDispatcher("/WEB-INF/views/createTopic.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            try {
                req.setCharacterEncoding("UTF-8");

                String name = req.getParameter("name");
                String subject = req.getParameter("subject");
                String[] preReqs = req.getParameterValues("preReqs");

                TopicDAO dao = new TopicDAO();
                List<Topic> allTopics = dao.getAll();

                boolean topicExists = false;

                if (name != null) {
                    for (Topic t : allTopics) {
                        if (t.getName() != null && t.getName().trim().equalsIgnoreCase(name.trim())) {
                            topicExists = true;
                            break;
                        }
                    }
                }

                if (topicExists) {
                    req.setAttribute("erro", "Este tópico já está cadastrado no sistema.");
                    req.setAttribute("topics", allTopics);
                    req.getRequestDispatcher("/WEB-INF/views/createTopic.jsp").forward(req, resp);
                } else {
                    Topic novoTopico = new Topic(name, subject);
                    dao.insertTopicWithPreReqs(novoTopico, preReqs);
                    resp.sendRedirect(req.getContextPath() + "/createTopic?success=true");
                }

            } catch (Exception e) {

                e.printStackTrace();
                req.setAttribute("erro", "Erro: " + e.getMessage());

                TopicDAO dao = new TopicDAO();
                req.setAttribute("topics", dao.getAll());
                req.getRequestDispatcher("/WEB-INF/views/createTopic.jsp").forward(req, resp);
            }
    }
}
