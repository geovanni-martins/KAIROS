package com.kairos.servlet;

import com.kairos.controller.ReportController;
import com.kairos.dao.ModeratorDAO;
import com.kairos.model.Moderator;
import com.kairos.model.Report;
import com.kairos.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/reports")
public class ManageReportsServlet extends HttpServlet {

    private final ReportController reportController = new ReportController();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        if (user == null || user.isStudent()) {
            resp.sendRedirect(req.getContextPath() + "/home");
            return;
        }

        List<Report> pendingReports = reportController.getReportsByStatus("not_analyzed");

        req.setAttribute("reports", pendingReports);
        req.getRequestDispatcher("/WEB-INF/views/manageReports.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        if (user == null || user.isStudent()) {
            resp.sendRedirect(req.getContextPath() + "/home");
            return;
        }

        try {
            int reportId = Integer.parseInt(req.getParameter("reportId"));

            ModeratorDAO modDAO = new ModeratorDAO();
            Moderator moderator = modDAO.getById(user.getId());

            Report report = reportController.getReportById(reportId);

            reportController.analyzeReport(report, moderator, "analyzed");

            resp.sendRedirect(req.getContextPath() + "/reports?resolved=true");
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect(req.getContextPath() + "/reports?error=true");
        }
    }
}