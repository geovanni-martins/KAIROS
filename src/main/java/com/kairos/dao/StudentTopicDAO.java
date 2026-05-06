package com.kairos.dao;

import com.kairos.model.Student;
import com.kairos.model.StudentTopic;
import com.kairos.model.Topic;
import com.kairos.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentTopicDAO {

    public void insert(StudentTopic studentTopic) {
        String sql = "INSERT INTO student_topic (student_id, topic_id, qty_solved_questions, qty_wrong_questions) VALUES (?, ?, ?, ?)";

        try (Connection conn = DBConnection.connect();
             PreparedStatement stmt = conn.prepareStatement(sql)
        ) {
            stmt.setInt(1, studentTopic.getStudent().getId());
            stmt.setInt(2, studentTopic.getTopic().getId());
            stmt.setInt(3, studentTopic.getQtySolvedQuestions());
            stmt.setInt(4, studentTopic.getQtyWrongQuestions());
            stmt.executeUpdate();
            System.out.println("StudentTopic cadastrado");

        } catch (SQLException e) {
            System.out.println("Erro ao inserir studentTopic: " + e.getMessage());
        }
    }

    public StudentTopic getById(int studentId, int topicId) {
        String sql =
                "SELECT st.*, u.name AS student_name, t.name AS topic_name " +
                        "FROM student_topic st " +
                        "INNER JOIN user u ON st.student_id = u.id_user " +
                        "INNER JOIN topic t ON st.topic_id = t.id_topic " +
                        "WHERE st.student_id = ? AND st.topic_id = ?";

        try (Connection conn = DBConnection.connect();
             PreparedStatement stmt = conn.prepareStatement(sql)
        ) {
            stmt.setInt(1, studentId);
            stmt.setInt(2, topicId);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    Student student = new Student(
                            rs.getInt("student_id"), rs.getString("student_name"),
                            null, null, null, 0, 0
                    );
                    Topic topic = new Topic(
                            rs.getInt("topic_id"), rs.getString("topic_name"), null
                    );
                    return new StudentTopic(
                            student, topic,
                            rs.getInt("qty_solved_questions"),
                            rs.getInt("qty_wrong_questions")
                    );
                }
            }

        } catch (SQLException e) {
            System.out.println("Erro ao buscar studentTopic: " + e.getMessage());
        }

        return null;
    }

    public List<StudentTopic> getAll() {
        List<StudentTopic> list = new ArrayList<>();
        String sql =
                "SELECT st.*, u.name AS student_name, t.name AS topic_name " +
                        "FROM student_topic st " +
                        "INNER JOIN user u ON st.student_id = u.id_user " +
                        "INNER JOIN topic t ON st.topic_id = t.id_topic";

        try (Connection conn = DBConnection.connect();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()
        ) {
            while (rs.next()) {
                Student student = new Student(
                        rs.getInt("student_id"), rs.getString("student_name"),
                        null, null, null, 0, 0
                );
                Topic topic = new Topic(
                        rs.getInt("topic_id"), rs.getString("topic_name"), null
                );
                list.add(new StudentTopic(
                        student, topic,
                        rs.getInt("qty_solved_questions"),
                        rs.getInt("qty_wrong_questions")
                ));
            }

        } catch (SQLException e) {
            System.out.println("Erro ao listar studentTopics: " + e.getMessage());
        }

        return list;
    }

    public List<StudentTopic> getAllByStudent(int studentId) {
        List<StudentTopic> list = new ArrayList<>();
        String sql =
                "SELECT st.*, u.name AS student_name, t.name AS topic_name " +
                        "FROM student_topic st " +
                        "INNER JOIN user u ON st.student_id = u.id_user " +
                        "INNER JOIN topic t ON st.topic_id = t.id_topic " +
                        "WHERE st.student_id = ?";

        try (Connection conn = DBConnection.connect();
             PreparedStatement stmt = conn.prepareStatement(sql)
        ) {
            stmt.setInt(1, studentId);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Student student = new Student(
                            rs.getInt("student_id"), rs.getString("student_name"),
                            null, null, null, 0, 0
                    );
                    Topic topic = new Topic(
                            rs.getInt("topic_id"), rs.getString("topic_name"), null
                    );
                    list.add(new StudentTopic(
                            student, topic,
                            rs.getInt("qty_solved_questions"),
                            rs.getInt("qty_wrong_questions")
                    ));
                }
            }

        } catch (SQLException e) {
            System.out.println("Erro ao buscar studentTopics do estudante: " + e.getMessage());
        }

        return list;
    }

    public void update(StudentTopic studentTopic) {
        String sql = "UPDATE student_topic SET qty_solved_questions = ?, qty_wrong_questions = ? WHERE student_id = ? AND topic_id = ?";

        try (Connection conn = DBConnection.connect();
             PreparedStatement stmt = conn.prepareStatement(sql)
        ) {
            stmt.setInt(1, studentTopic.getQtySolvedQuestions());
            stmt.setInt(2, studentTopic.getQtyWrongQuestions());
            stmt.setInt(3, studentTopic.getStudent().getId());
            stmt.setInt(4, studentTopic.getTopic().getId());

            int linesAffected = stmt.executeUpdate();

            if (linesAffected > 0) {
                System.out.println("StudentTopic atualizado");
            } else {
                System.out.println("Nenhum studentTopic encontrado");
            }

        } catch (SQLException e) {
            System.out.println("Erro ao atualizar studentTopic: " + e.getMessage());
        }
    }

    public void upsertProgress(int studentId, int topicId, boolean gotRight) { //vira um insert se no existe e um update se j existe
        int erroValue;
        if (gotRight) {
            erroValue = 0;
        } else {
            erroValue = 1;
        }

        String sql = "INSERT INTO student_topic (student_id, topic_id, qty_solved_questions, qty_wrong_questions) " +
                "VALUES (?, ?, 1, ?) " +
                "ON DUPLICATE KEY UPDATE " +
                "qty_solved_questions = qty_solved_questions + 1, " +
                "qty_wrong_questions = qty_wrong_questions + ?";

        try (Connection conn = DBConnection.connect();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, studentId);
            stmt.setInt(2, topicId);
            stmt.setInt(3, erroValue);
            stmt.setInt(4, erroValue);
            stmt.executeUpdate();
            System.out.println("Progresso do estudante atualizado");
        } catch (SQLException e) {
            System.out.println("Erro ao processar upsert: " + e.getMessage());
        }
    }
}