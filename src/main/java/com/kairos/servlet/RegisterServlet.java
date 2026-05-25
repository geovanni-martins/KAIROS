package com.kairos.servlet;

import com.kairos.controller.UserController;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private UserController userController = new UserController();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String passwordTyped = req.getParameter("password");
        String role = req.getParameter("role");
        String responsibleDiscipline = req.getParameter("responsibleDiscipline");

        boolean sucess = userController.register(name, email, passwordTyped, role, responsibleDiscipline);


        if(sucess) {
            HttpSession session = req.getSession(true);
            session.setAttribute("user", userController.login(email, passwordTyped));
            resp.sendRedirect(req.getContextPath() + "/home");

        } else {
            req.setAttribute("error", "Erro ao cadastrar, algo está incorreto.");
            req.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(req, resp);
        }
    }
}
