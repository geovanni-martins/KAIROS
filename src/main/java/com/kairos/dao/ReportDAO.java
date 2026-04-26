package com.kairos.dao;

import com.kairos.model.Moderator;
import com.kairos.model.Question;
import com.kairos.model.Report;
import com.kairos.model.Student;
import java.sql.*;
import java.time.Instant;
import java.util.ArrayList;

public class ReportDAO {

    public void insertReport(Report report) {
        String sql = "INSERT INTO reports (student_id, question_id, reason, stats) VALUES (?, ?, ?, ?);";
        try (Connection connection = DBConnection.connect();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)
        ) {
            preparedStatement.setInt(1, report.getStudent().getId());
            preparedStatement.setInt(2, report.getQuestion().getId());
            preparedStatement.setString(3, report.getReason());
            preparedStatement.setString(4, report.getStatus());
            preparedStatement.executeUpdate();
            System.out.println("Report cadastrado");
        } catch (SQLException e) {
            System.out.println("Erro ao inserir report: " + e.getMessage());
        }
    }

    public Report getReportById(int id) {
        String sql = "SELECT * FROM reports WHERE id_reports = ?;";

        try (Connection conn = DBConnection.connect();
             PreparedStatement stmt = conn.prepareStatement(sql)
        ) {
            stmt.setInt(1, id);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return buildReport(rs);
                }
            }

        } catch (SQLException e) {
            System.out.println("Erro ao buscar report: " + e.getMessage());
        }

        return null;
    }

    public ArrayList<Report> listReport() {
        ArrayList<Report> reportList = new ArrayList<>();
        String sql = "SELECT * FROM reports;";

        try (Connection conn = DBConnection.connect();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()
        ) {
            while (rs.next()) {
                reportList.add(buildReport(rs));
            }

        } catch (SQLException e) {
            System.out.println("Erro ao listar reports: " + e.getMessage());
        }

        return reportList;
    }

    public ArrayList<Report> getReportsByStudentId(int studentId) {
        ArrayList<Report> reportList = new ArrayList<>();
        String sql = "SELECT * FROM reports WHERE student_id = ?;";

        try (Connection conn = DBConnection.connect();
             PreparedStatement stmt = conn.prepareStatement(sql)
        ) {
            stmt.setInt(1, studentId);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    reportList.add(buildReport(rs));
                }
            }

        } catch (SQLException e) {
            System.out.println("Erro ao buscar reports do estudante: " + e.getMessage());
        }

        return reportList;
    }

    public ArrayList<Report> getReportsByStatus(String status) {
        ArrayList<Report> reportList = new ArrayList<>();
        String sql = "SELECT * FROM reports WHERE stats = ?;";

        try (Connection conn = DBConnection.connect();
             PreparedStatement stmt = conn.prepareStatement(sql)
        ) {
            stmt.setString(1, status);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    reportList.add(buildReport(rs));
                }
            }

        } catch (SQLException e) {
            System.out.println("Erro ao buscar reports por status: " + e.getMessage());
        }

        return reportList;
    }

    public void updateReportStatus(int reportId, int moderatorId, String newStatus) {
        String sql = "UPDATE reports SET stats = ?, analyzed_by = ? WHERE id_reports = ?;";

        try (Connection conn = DBConnection.connect();
             PreparedStatement stmt = conn.prepareStatement(sql)
        ) {
            stmt.setString(1, newStatus);
            stmt.setInt(2, moderatorId);
            stmt.setInt(3, reportId);

            int linesAffected = stmt.executeUpdate();

            if (linesAffected > 0) {
                System.out.println("Report atualizado");
            } else {
                System.out.println("Nenhum report encontrado");
            }

        } catch (SQLException e) {
            System.out.println("Erro ao atualizar report: " + e.getMessage());
        }
    }

    // Método auxiliar para evitar repetição na construção do objeto Report
    private Report buildReport(ResultSet rs) throws SQLException {
        StudentDAO studentDAO = new StudentDAO();
        QuestionDAO questionDAO = new QuestionDAO();
        ModeratorDAO moderatorDAO = new ModeratorDAO();

        Student student = studentDAO.getStudentById(rs.getInt("student_id"));
        Question question = questionDAO.searchQuestionById(rs.getInt("question_id"));

        Moderator moderator = null;
        int analyzedBy = rs.getInt("analyzed_by");
        if (!rs.wasNull()) {
            moderator = moderatorDAO.getModeratorById(analyzedBy);
        }

        Instant reportDate = null;
        Timestamp ts = rs.getTimestamp("report_date");
        if (ts != null) {
            reportDate = ts.toInstant();
        }

        return new Report(
                rs.getInt("id_reports"),
                student,
                question,
                rs.getString("reason"),
                rs.getString("stats"),
                reportDate,
                moderator
        );
    }
}