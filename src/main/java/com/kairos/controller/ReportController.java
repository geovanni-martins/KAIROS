package com.kairos.controller;

import com.kairos.dao.ReportDAO;
import com.kairos.model.*;
import java.util.ArrayList;

public class ReportController {

    private ReportDAO reportDAO;

    public ReportController() {
        reportDAO = new ReportDAO();
    }

    public void insertReport(Student student, Question question, String reason) {
        if (student == null) { return; }
        if (question == null) { return; }
        if (reason == null || reason.isBlank()) { return; }

        Report report = new Report(student, question, reason, "pending");
        reportDAO.insertReport(report);
    }

    public ArrayList<Report> reportList() {
        return reportDAO.listReport();
    }

    public Report getReportById(int id) {
        if (id <= 0) { return null; }
        return reportDAO.getReportById(id);
    }

    public ArrayList<Report> getReportsByStudent(Student student) {
        if (student == null) { return new ArrayList<>(); }
        return reportDAO.getReportsByStudentId(student.getId());
    }

    public ArrayList<Report> getReportsByStatus(String status) {
        if (status == null || status.isBlank()) { return new ArrayList<>(); }
        return reportDAO.getReportsByStatus(status);
    }

    public void analyzeReport(Report report, Moderator moderator, String newStatus) {
        if (report == null) { return; }
        if (moderator == null) { return; }
        if (newStatus == null || newStatus.isBlank()) { return; }

        reportDAO.updateReportStatus(report.getId(), moderator.getId(), newStatus);
    }
}