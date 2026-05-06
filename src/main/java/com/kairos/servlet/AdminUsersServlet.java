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

@WebServlet({"/admin/users", "/admin/deleteUser"})
public class AdminUsersServlet extends HttpServlet {

    private final UserController userController = new UserController();

    /** GET /admin/users — list all users */
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        User currentUser = (session != null) ? (User) session.getAttribute("user") : null;

        if (currentUser == null || !currentUser.getRole().equals("admin")) {
            resp.sendRedirect(req.getContextPath() + "/home");
            return;
        }

        req.setAttribute("users", userController.userList());
        req.getRequestDispatcher("/WEB-INF/views/adminUsers.jsp").forward(req, resp);
    }

    /** POST /admin/deleteUser — remove a user by id */
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

        try {
            int userId = Integer.parseInt(req.getParameter("userId"));

            // Guard: prevent admin from deleting themselves
            if (userId == currentUser.getId()) {
                req.setAttribute("erro", "Você não pode remover sua própria conta.");
                req.setAttribute("users", userController.userList());
                req.getRequestDispatcher("/WEB-INF/views/adminUsers.jsp").forward(req, resp);
                return;
            }

            userController.deleteUserById(userId);
            resp.sendRedirect(req.getContextPath() + "/admin/users?deleted=true");

        } catch (NumberFormatException e) {
            resp.sendRedirect(req.getContextPath() + "/admin/users");
        }
    }
}