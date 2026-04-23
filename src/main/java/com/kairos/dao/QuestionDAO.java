package com.kairos.dao;

import com.kairos.model.Question;
import com.kairos.model.Topic;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class QuestionDAO {

    public void insertQuestion(Question question) {

        String sql = "INSERT INTO question (topic_id, statement, stats, difficulty) VALUES (?, ?, ?, ?)";

        try (
                java.sql.Connection conn = DBConnection.connect();
                PreparedStatement stmt = conn.prepareStatement(sql);
        ) {
            stmt.setInt(1, question.getTopic().getId());
            stmt.setString(2, question.getStatement());
            stmt.setString(3, question.getStats());
            stmt.setString(4, question.getDifficulty());

            stmt.executeUpdate();
            System.out.println("Questão cadastrada com sucesso!");

        } catch (SQLException e) {
            System.out.println("Erro ao inserir questão: " + e.getMessage());
        }
    }

    public void updateQuestion(Question question) {

        String sql = "UPDATE question SET topic_id = ?, statement = ?, stats = ?, difficulty = ? WHERE id_question = ?";

        try (
                java.sql.Connection conn = DBConnection.connect();
                PreparedStatement stmt = conn.prepareStatement(sql);
        ) {
            stmt.setInt(1, question.getTopic().getId());
            stmt.setString(2, question.getStatement());
            stmt.setString(3, question.getStats());
            stmt.setString(4, question.getDifficulty());
            stmt.setInt(5, question.getId());
            int linhasAfetadas = stmt.executeUpdate();

            if (linhasAfetadas > 0) {
                System.out.println("Questão atualizada com sucesso!");
            } else {
                System.out.println("Nenhuma questão encontrada com esse ID.");
            }

        } catch (SQLException e) {
            System.out.println("Erro ao atualizar questão: " + e.getMessage());
        }
    }

    public ArrayList<Question> listQuestions() {
        ArrayList<Question> lista = new ArrayList<>();
        String sql = "SELECT * FROM question";

        try (
                java.sql.Connection conn = DBConnection.connect();
                PreparedStatement stmt = conn.prepareStatement(sql);
                ResultSet rs = stmt.executeQuery();
        ) {
            while (rs.next()) {
                Topic topic = new Topic(rs.getInt("topic_id"), null, null);
                Question question = new Question(rs.getInt("id_question"), rs.getString("statement"), rs.getString("stats"), rs.getString("difficulty"), topic, rs.getTimestamp("created_at").toInstant());
                lista.add(question);
            }

        } catch (SQLException e) {
            System.out.println("Erro ao listar questões: " + e.getMessage());
        }

        return lista;
    }

    public Question searchQuestionById(int id_question) {

        String sql = "SELECT * FROM question WHERE id_question = ?";
        Question question = null;

        try (
                java.sql.Connection conn = DBConnection.connect();
                PreparedStatement stmt = conn.prepareStatement(sql);
        ) {
            stmt.setInt(1, id_question);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    Topic topic = new Topic(rs.getInt("topic_id"), null, null);
                    question = new Question(rs.getInt("id_question"), rs.getString("statement"), rs.getString("stats"), rs.getString("difficulty"), topic, rs.getTimestamp("created_at").toInstant());
                }
            }

        } catch (SQLException e) {
            System.out.println("Erro ao buscar questão: " + e.getMessage());
        }

        return question;
    }

    public void deleteQuestion(int id_question) {

        String sql = "DELETE FROM question WHERE id_question = ?";

        try (
                java.sql.Connection conn = DBConnection.connect();
                PreparedStatement stmt = conn.prepareStatement(sql);
        ) {
            stmt.setInt(1, id_question);

            int linhasAfetadas = stmt.executeUpdate();

            if (linhasAfetadas > 0) {
                System.out.println("Questão excluída com sucesso!");
            } else {
                System.out.println("Nenhuma questão encontrada com esse ID.");
            }

        } catch (SQLException e) {
            System.out.println("Erro ao excluir questão: " + e.getMessage());
        }
    }
}