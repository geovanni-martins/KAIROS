package com.kairos.dao;

import com.kairos.model.*;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class StudentTopicDAO {

    public void insertStudentTopic(StudentTopic studentTopic) {

        String sql = "INSERT INTO student_topic (student_id, topic_id, qtd_solved_questions, qtd_wrong_questions) VALUES (?, ?, ?, ?)";

        try (
                java.sql.Connection conn = DBConnection.connect();
                PreparedStatement stmt = conn.prepareStatement(sql);
        ) {
            stmt.setInt(1, studentTopic.getStudent().getId());
            stmt.setInt(2, studentTopic.getTopic().getId());
            stmt.setInt(3, studentTopic.getQtySolvedQuestions());
            stmt.setInt(4, studentTopic.getQtyWrongQuestions());

            stmt.executeUpdate();
            System.out.println("Tópico de estudante cadastrado com sucesso!");

        } catch (SQLException e) {
            System.out.println("Erro ao inserir tópico de estudante: " + e.getMessage());
        }
    }

    public void updateStudentTopic(StudentTopic studentTopic) {

        String sql = "UPDATE student_topic SET qty_solved_questions = ?, qty_wrong_questions = ? WHERE student_id = ? AND topic_id = ?";

        try (
                java.sql.Connection conn = DBConnection.connect();
                PreparedStatement stmt = conn.prepareStatement(sql);
        ) {
            stmt.setInt(1, studentTopic.getQtySolvedQuestions());
            stmt.setInt(2, studentTopic.getQtyWrongQuestions());
            stmt.setInt(3, studentTopic.getStudent().getId());
            stmt.setInt(4, studentTopic.getTopic().getId());
            int linhasAfetadas = stmt.executeUpdate();

            if (linhasAfetadas > 0) {
                System.out.println("Tópico de estudante atualizado com sucesso!");

            } else {
                System.out.println("Nenhum tópico de estudante encontrado com esse ID.");
            }

        } catch (SQLException e) {
            System.out.println("Erro ao atualizar tópico de estudante: " + e.getMessage());
        }
    }

    public StudentTopic searchStudentTopicById(int student_id, int topic_id) {

        String sql = "SELECT st.*, u.name " +
                "FROM student_topic st " +
                "INNER JOIN user u ON st.student_id = u.id_user " +
                "WHERE st.student_id = ? AND st.topic_id = ?";
        StudentTopic studentTopic = null;

        try (
                java.sql.Connection conn = DBConnection.connect();
                PreparedStatement stmt = conn.prepareStatement(sql);
        ) {
            stmt.setInt(1, student_id);
            stmt.setInt(2, topic_id);

            try (ResultSet rs = stmt.executeQuery()) {

                if (rs.next()) {

                    Student student = new Student(
                            rs.getInt("student_id"),
                            rs.getString("name"),
                            null,
                            null,
                            null);

                    Topic topic = new Topic(rs.getInt("topic_id"),
                            null,
                            null);

                    studentTopic = new StudentTopic(
                            student,
                            topic,
                            rs.getInt("qty_solved_questions"),
                            rs.getInt("qty_wrong_questions"));
                }
            }

        } catch (SQLException e) {
            System.out.println("Erro ao buscar tópico de estudante: " + e.getMessage());
        }

        return studentTopic;
    }

    public ArrayList<StudentTopic> listStudentTopic() { //lista todos os topicos de cada estudante
        ArrayList<StudentTopic> lista = new ArrayList<>();
        String sql = "SELECT st.*, u.name AS student_name, " +
                "t.name AS topic_name " +
                "FROM student_topic st " +
                "INNER JOIN user u ON st.student_id = u.id_user " +
                "INNER JOIN topic t ON st.topic_id = t.id_topic";

        try (
                java.sql.Connection conn = DBConnection.connect();
                PreparedStatement stmt = conn.prepareStatement(sql);
                ResultSet rs = stmt.executeQuery();
        ) {
            while (rs.next()) {

                Student student = new Student(
                        rs.getInt("student_id"),
                        rs.getString("student_name"),
                        null, null,
                        null);

                Topic topic = new Topic(
                        rs.getInt("topic_id"),
                        rs.getString("topic_name"),
                        null);

                StudentTopic studentTopic = new StudentTopic(
                        student,
                        topic,
                        rs.getInt("qty_solved_questions"),
                        rs.getInt("qty_wrong_questions")
                );

                lista.add(studentTopic);
            }
        } catch (SQLException e) {
            System.out.println("Erro ao listar tópicos de estudante: " + e.getMessage());
        }

        return lista;
    }

    public ArrayList<StudentTopic> listStudentTopicByStudent(int studentId) { //lista dde um estudante especifico
        ArrayList<StudentTopic> lista = new ArrayList<>();

        String sql = "SELECT st.*, u.name AS student_name, t.name AS topic_name " +
                "FROM student_topic st " +
                "INNER JOIN user u ON st.student_id = u.id_user " +
                "INNER JOIN topic t ON st.topic_id = t.id_topic " +
                "WHERE st.student_id = ?";

        try (
                java.sql.Connection conn = DBConnection.connect();
                PreparedStatement stmt = conn.prepareStatement(sql);
        ) {

            stmt.setInt(1, studentId);

            try (ResultSet rs = stmt.executeQuery()) {

                while (rs.next()) {

                    Student student = new Student(
                            rs.getInt("student_id"),
                            rs.getString("student_name"),
                            null,
                            null,
                            null
                    );

                    Topic topic = new Topic(
                            rs.getInt("topic_id"),
                            rs.getString("topic_name"),
                            null
                    );

                    StudentTopic studentTopic = new StudentTopic(
                            student,
                            topic,
                            rs.getInt("qty_solved_questions"),
                            rs.getInt("qty_wrong_questions")
                    );

                    lista.add(studentTopic);
                }
            }

        } catch (SQLException e) {
            System.out.println("Erro ao listar tópicos do estudante: " + e.getMessage());
        }

        return lista;
    }
}
