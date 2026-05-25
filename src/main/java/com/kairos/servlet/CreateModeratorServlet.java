package com.kairos.servlet;

import com.kairos.controller.UserController;
import com.kairos.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/admin/createModerator")
public class CreateModeratorServlet extends HttpServlet {

    private final UserController userController = new UserController();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        if (user == null || !user.getRole().equals("admin")) {
            resp.sendRedirect(req.getContextPath() + "/home");
            return;
        }

        req.getRequestDispatcher("/WEB-INF/views/createModerator.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        HttpSession session = req.getSession(false);
        User currentUser = (session != null) ? (User) session.getAttribute("user") : null;

        if (currentUser == null || !currentUser.getRole().equals("admin")) {
            resp.sendRedirect(req.getContextPath() + "/home");
            return;
        }

        String name                 = req.getParameter("name");
        String email                = req.getParameter("email");
        String password             = req.getParameter("password");
        String responsibleDiscipline = req.getParameter("responsibleDiscipline");

        boolean success = userController.register(name, email, password, "moderator", responsibleDiscipline);

        if (success) {
            resp.sendRedirect(req.getContextPath() + "/admin/createModerator?success=true");
        } else {
            req.setAttribute("error", "Não foi possível cadastrar o moderador. Verifique os dados e tente novamente.");
            req.getRequestDispatcher("/WEB-INF/views/createModerator.jsp").forward(req, resp);
        }
    }
}