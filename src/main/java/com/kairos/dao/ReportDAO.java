package com.kairos.dao;

import com.kairos.model.Moderator;
import com.kairos.model.MultipleChoiceQuestion;
import com.kairos.model.Report;
import com.kairos.model.Student;
import com.kairos.util.DBConnection;

import java.sql.*;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;

public class ReportDAO {

    private StudentDAO studentDAO = new StudentDAO();
    private QuestionDAO questionDAO = new QuestionDAO();
    private ModeratorDAO moderatorDAO = new ModeratorDAO();

    public void insert(Report report) {
        String sql = "INSERT INTO reports (student_id, question_id, reason, stats) VALUES (?, ?, ?, ?);";

        try (Connection conn = DBConnection.connect();
             PreparedStatement stmt = conn.prepareStatement(sql)
        ) {
            stmt.setInt(1, report.getStudent().getId());
            stmt.setInt(2, report.getQuestion().getId());
            stmt.setString(3, report.getReason());
            stmt.setString(4, report.getStatus());
            stmt.executeUpdate();
            System.out.println("Report cadastrado");

        } catch (SQLException e) {
            System.out.println("Erro ao inserir report: " + e.getMessage());
        }
    }

    public Report getById(int id) {
        String sql = "SELECT * FROM reports WHERE id_reports = ?;";

        try (Connection conn = DBConnection.connect();
             PreparedStatement stmt = conn.prepareStatement(sql)
        ) {
            stmt.setInt(1, id);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    Student student = studentDAO.getById(rs.getInt("student_id"));
                    MultipleChoiceQuestion question = (MultipleChoiceQuestion) questionDAO.getById(rs.getInt("question_id"));

                    Moderator moderator = null;
                    int analyzedBy = rs.getInt("analyzed_by");
                    if (!rs.wasNull()) {
                        moderator = moderatorDAO.getById(analyzedBy);
                    }

                    Instant reportDate = null;
                    Timestamp ts = rs.getTimestamp("report_date");
                    if (ts != null) {
                        reportDate = ts.toInstant();
                    }

                    return new Report(
                            rs.getInt("id_reports"), student, question,
                            rs.getString("reason"), rs.getString("stats"),
                            reportDate, moderator
                    );
                }
            }

        } catch (SQLException e) {
            System.out.println("Erro ao buscar report: " + e.getMessage());
        }

        return null;
    }

    public List<Report> getAll() {
        List<Report> list = new ArrayList<>();
        String sql = "SELECT * FROM reports;";

        try (Connection conn = DBConnection.connect();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()
        ) {
            while (rs.next()) {
                Student student = studentDAO.getById(rs.getInt("student_id"));
                MultipleChoiceQuestion question = (MultipleChoiceQuestion) questionDAO.getById(rs.getInt("question_id"));

                Moderator moderator = null;
                int analyzedBy = rs.getInt("analyzed_by");
                if (!rs.wasNull()) {
                    moderator = moderatorDAO.getById(analyzedBy);
                }

                Instant reportDate = null;
                Timestamp ts = rs.getTimestamp("report_date");
                if (ts != null) {
                    reportDate = ts.toInstant();
                }

                list.add(new Report(
                        rs.getInt("id_reports"), student, question,
                        rs.getString("reason"), rs.getString("stats"),
                        reportDate, moderator
                ));
            }

        } catch (SQLException e) {
            System.out.println("Erro ao listar reports: " + e.getMessage());
        }

        return list;
    }

    public List<Report> getAllByStudent(int studentId) {
        List<Report> list = new ArrayList<>();
        String sql = "SELECT * FROM reports WHERE student_id = ?;";

        try (Connection conn = DBConnection.connect();
             PreparedStatement stmt = conn.prepareStatement(sql)
        ) {
            stmt.setInt(1, studentId);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Student student = studentDAO.getById(rs.getInt("student_id"));
                    MultipleChoiceQuestion question = (MultipleChoiceQuestion) questionDAO.getById(rs.getInt("question_id"));

                    Moderator moderator = null;
                    int analyzedBy = rs.getInt("analyzed_by");
                    if (!rs.wasNull()) {
                        moderator = moderatorDAO.getById(analyzedBy);
                    }

                    Instant reportDate = null;
                    Timestamp ts = rs.getTimestamp("report_date");
                    if (ts != null) {
                        reportDate = ts.toInstant();
                    }

                    list.add(new Report(
                            rs.getInt("id_reports"), student, question,
                            rs.getString("reason"), rs.getString("stats"),
                            reportDate, moderator
                    ));
                }
            }

        } catch (SQLException e) {
            System.out.println("Erro ao buscar reports do estudante: " + e.getMessage());
        }

        return list;
    }

    public List<Report> getAllByStatus(String status) {
        List<Report> list = new ArrayList<>();
        String sql = "SELECT * FROM reports WHERE stats = ?;";

        try (Connection conn = DBConnection.connect();
             PreparedStatement stmt = conn.prepareStatement(sql)
        ) {
            stmt.setString(1, status);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Student student = studentDAO.getById(rs.getInt("student_id"));
                    MultipleChoiceQuestion question = (MultipleChoiceQuestion) questionDAO.getById(rs.getInt("question_id"));

                    Moderator moderator = null;
                    int analyzedBy = rs.getInt("analyzed_by");
                    if (!rs.wasNull()) {
                        moderator = moderatorDAO.getById(analyzedBy);
                    }

                    Instant reportDate = null;
                    Timestamp ts = rs.getTimestamp("report_date");
                    if (ts != null) {
                        reportDate = ts.toInstant();
                    }

                    list.add(new Report(
                            rs.getInt("id_reports"), student, question,
                            rs.getString("reason"), rs.getString("stats"),
                            reportDate, moderator
                    ));
                }
            }

        } catch (SQLException e) {
            System.out.println("Erro ao buscar reports por status: " + e.getMessage());
        }

        return list;
    }

    public void updateStatus(int reportId, int moderatorId, String newStatus) {
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
}