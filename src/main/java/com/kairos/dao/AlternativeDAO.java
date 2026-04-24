package com.kairos.dao;

import com.kairos.model.Alternative;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AlternativeDAO {

    public void insertAlternative(Alternative alternative) {

        String sql = "INSERT INTO alternative (question_id, text, is_correct) VALUES (?, ?, ?)";

        try (
                Connection conn = DBConnection.connect();
                PreparedStatement stmt = conn.prepareStatement(sql);
        ) {
            stmt.setInt(1, alternative.getQuestion().getId());
            stmt.setString(2, alternative.getText());
            stmt.setBoolean(3, alternative.getCorrect());
            stmt.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Erro ao inserir alternativa: " + e.getMessage());
        }
    }

    public void insertAlternatives(List<Alternative> alternatives, int questionId) {

        String sql = "INSERT INTO alternative (question_id, text, is_correct) VALUES (?, ?, ?)";

        try (
                Connection conn = DBConnection.connect();
                PreparedStatement stmt = conn.prepareStatement(sql);
        ) {

            for (Alternative alternative : alternatives) {
                stmt.setInt(1, questionId);
                stmt.setString(2, alternative.getText());
                stmt.setBoolean(3, alternative.getCorrect());
                stmt.addBatch();
            }

            stmt.executeBatch();

        } catch (SQLException e) {
            System.out.println("Erro ao inserir alternativas: " + e.getMessage());
        }
    }

    public List<Alternative> alternativesByQuestionId(int questionId) {

        String sql = "SELECT * FROM alternative WHERE question_id = ?";

        List<Alternative> alternatives = new ArrayList<>();

        try (Connection conn = DBConnection.connect();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, questionId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Alternative alternative = new Alternative(
                        rs.getInt("id_alternative"),
                        rs.getString("text"),
                        rs.getBoolean("is_correct"),
                        null
                );
                alternatives.add(alternative);
            }

        } catch (SQLException e) {
            System.out.println("Erro ao buscar alternativas: " + e.getMessage());
        }
        return alternatives;
    }

    public void updateAlternative(Alternative alternative) {
        String sql = "UPDATE alternative SET text = ?, is_correct = ? WHERE id_alternative = ?";

        try (Connection conn = DBConnection.connect();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, alternative.getText());
            stmt.setBoolean(2, alternative.getCorrect());
            stmt.setInt(3, alternative.getId());
            stmt.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Erro ao atualizar alternativa: " + e.getMessage());
        }
    }

    public void deleteById(int id) {

        String sql = "DELETE FROM alternative WHERE id_alternative = ?";

        try (Connection conn = DBConnection.connect();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            stmt.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Erro ao deletar alternativa: " + e.getMessage());
        }
    }

    public void deleteAlternativeByQuestionId(int questionId) {

        String sql = "DELETE FROM alternative WHERE question_id = ?";

        try (
                Connection conn = DBConnection.connect();
                PreparedStatement stmt = conn.prepareStatement(sql);
        ) {
            stmt.setInt(1, questionId);
            stmt.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Erro ao deletar alternativas: " + e.getMessage());
        }
    }
}