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

@WebServlet("/admin/createAdmin")
public class CreateAdminServlet extends HttpServlet {

    private final UserController userController = new UserController();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        if (user == null || !user.isAdmin()) {
            resp.sendRedirect(req.getContextPath() + "/home");
            return;
        }

        req.getRequestDispatcher("/WEB-INF/views/createAdmin.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        HttpSession session = req.getSession(false);
        User currentUser = (session != null) ? (User) session.getAttribute("user") : null;

        if (currentUser == null || !currentUser.isAdmin()) {
            resp.sendRedirect(req.getContextPath() + "/home");
            return;
        }

        String name     = req.getParameter("name");
        String email    = req.getParameter("email");
        String password = req.getParameter("password");

        boolean success = userController.register(name, email, password, "admin", null);

        if (success) {
            resp.sendRedirect(req.getContextPath() + "/admin/createAdmin?success=true");
        } else {
            req.setAttribute("erro", "Não foi possível cadastrar o administrador. O e-mail pode já estar em uso.");
            req.getRequestDispatcher("/WEB-INF/views/createAdmin.jsp").forward(req, resp);
        }
    }
}