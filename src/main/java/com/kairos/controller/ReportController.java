package com.kairos.controller;

import com.kairos.dao.ReportDAO;
import com.kairos.model.*;
import java.util.ArrayList;
import java.util.List;

public class ReportController {

    private ReportDAO reportDAO;

    public ReportController() {
        reportDAO = new ReportDAO();
    }

    public void insertReport(Student student, MultipleChoiceQuestion question, String reason) {
        if (student == null) { return; }
        if (question == null) { return; }
        if (reason == null || reason.isBlank()) { return; }

        Report report = new Report(student, question, reason, "not_analyzed");
        reportDAO.insert(report);
    }

    public List<Report> reportList() {
        return reportDAO.getAll();
    }

    public Report getReportById(int id) {
        if (id <= 0) { return null; }
        return reportDAO.getById(id);
    }

    public List<Report> getReportsByStudent(Student student) {
        if (student == null) { return new ArrayList<>(); }
        return reportDAO.getAllByStudent(student.getId());
    }

    public List<Report> getReportsByStatus(String status) {
        if (status == null || status.isBlank()) { return new ArrayList<>(); }
        return reportDAO.getAllByStatus(status);
    }

    public void analyzeReport(Report report, Moderator moderator, String newStatus) {
        if (report == null) { return; }
        if (moderator == null) { return; }
        if (newStatus == null || newStatus.isBlank()) { return; }

        reportDAO.updateStatus(report.getId(), moderator.getId(), newStatus);
    }
}