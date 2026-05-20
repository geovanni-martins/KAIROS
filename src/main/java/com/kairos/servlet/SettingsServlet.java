package com.kairos.servlet;

import com.kairos.controller.UserController;
import com.kairos.model.User;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/settings/*")
public class SettingsServlet extends HttpServlet {

    private UserController userController = new UserController();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        req.getRequestDispatcher("/WEB-INF/views/settings.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        User user = (User) session.getAttribute("user");
        String pathInfo = req.getPathInfo(); // "/name", "/email", "/password", "/delete"

        switch (pathInfo) {
            case "/name" -> handleNameUpdate(req, resp, session, user);
            case "/email" -> handleEmailUpdate(req, resp, session, user);
            case "/password" -> handlePasswordUpdate(req, resp, session, user);
            case "/delete" -> handleDelete(req, resp, session, user);
            default -> resp.sendRedirect(req.getContextPath() + "/settings");
        }
    }

    private void handleNameUpdate(HttpServletRequest req, HttpServletResponse resp,
                                  HttpSession session, User user)
            throws ServletException, IOException {
        String newName = req.getParameter("newName");

        if (newName == null || newName.isBlank() || newName.length() > 100) {
            req.setAttribute("errorMessage", "Nome inválido.");
            req.getRequestDispatcher("/WEB-INF/views/settings.jsp").forward(req, resp);
            return;
        }

        userController.updateName(user.getId(), newName);
        user.setName(newName);
        session.setAttribute("user", user);

        req.setAttribute("successMessage", "Nome atualizado com sucesso.");
        req.getRequestDispatcher("/WEB-INF/views/settings.jsp").forward(req, resp);
    }

    private void handleEmailUpdate(HttpServletRequest req, HttpServletResponse resp,
                                   HttpSession session, User user)
            throws ServletException, IOException {
        String newEmail = req.getParameter("newEmail");

        if (newEmail == null || newEmail.isBlank() || newEmail.length() > 100) {
            req.setAttribute("errorMessage", "E-mail inválido.");
            req.getRequestDispatcher("/WEB-INF/views/settings.jsp").forward(req, resp);
            return;
        }

        userController.updateEmail(user.getId(), newEmail);
        user.setEmail(newEmail);
        session.setAttribute("user", user);

        req.setAttribute("successMessage", "E-mail atualizado com sucesso.");
        req.getRequestDispatcher("/WEB-INF/views/settings.jsp").forward(req, resp);
    }

    private void handlePasswordUpdate(HttpServletRequest req, HttpServletResponse resp,
                                      HttpSession session, User user)
            throws ServletException, IOException {
        String newPassword = req.getParameter("newPassword");
        String confirmPassword = req.getParameter("confirmPassword");

        if (newPassword == null || newPassword.isBlank() || newPassword.length() < 8) {
            req.setAttribute("errorMessage", "A senha deve ter ao menos 8 caracteres.");
            req.getRequestDispatcher("/WEB-INF/views/settings.jsp").forward(req, resp);
            return;
        }

        if (!newPassword.equals(confirmPassword)) {
            req.setAttribute("errorMessage", "As senhas não coincidem.");
            req.getRequestDispatcher("/WEB-INF/views/settings.jsp").forward(req, resp);
            return;
        }

        userController.updatePassword(user.getEmail(), newPassword);

        req.setAttribute("successMessage", "Senha atualizada com sucesso.");
        req.getRequestDispatcher("/WEB-INF/views/settings.jsp").forward(req, resp);
    }

    private void handleDelete(HttpServletRequest req, HttpServletResponse resp,
                              HttpSession session, User user)
            throws IOException {
        userController.deleteUserById(user.getId());
        session.invalidate();
        resp.sendRedirect(req.getContextPath() + "/login");
    }
}