package com.kairos.servlet;

import com.kairos.controller.UserController;
import com.kairos.model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/new-password")
public class NewPasswordServlet extends HttpServlet {

    private UserController userController = new UserController();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.getRequestDispatcher("/WEB-INF/views/new-password.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String newPassword = req.getParameter("newPassword");

        User people = userController.login(email, password);

        if (people != null) {
            userController.updatePassword(email, newPassword);

            req.setAttribute("success", "Senha atualizada com sucesso");
            req.getRequestDispatcher("/WEB-INF/views/new-password.jsp").forward(req, resp);

        } else {

            req.setAttribute("error", "Email ou senha incorretos.");
            req.getRequestDispatcher("/WEB-INF/views/new-password.jsp").forward(req, resp);
        }
    }
}