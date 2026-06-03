package com.kairos.dao;

import com.kairos.model.Alternative;
import com.kairos.model.MultipleChoiceQuestion;
import com.kairos.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AlternativeDAO {

    public void insert(Alternative alternative) {
        String sql = "INSERT INTO alternative (question_id, text, is_correct) VALUES (?, ?, ?)";

        try (Connection conn = DBConnection.connect();
             PreparedStatement stmt = conn.prepareStatement(sql)
        ) {
            stmt.setInt(1, alternative.getQuestion().getId());
            stmt.setString(2, alternative.getText());
            stmt.setBoolean(3, alternative.getCorrect());
            stmt.executeUpdate();
            System.out.println("Alternativa cadastrada");

        } catch (SQLException e) {
            System.out.println("Erro ao inserir alternativa: " + e.getMessage());
        }
    }

    public void insertAll(List<Alternative> alternatives, int questionId) {
        String sql = "INSERT INTO alternative (question_id, text, is_correct) VALUES (?, ?, ?)";

        try (Connection conn = DBConnection.connect();
             PreparedStatement stmt = conn.prepareStatement(sql)
        ) {
            for (Alternative alternative : alternatives) {
                stmt.setInt(1, questionId);
                stmt.setString(2, alternative.getText());
                stmt.setBoolean(3, alternative.getCorrect());
                stmt.addBatch();
            }
            stmt.executeBatch();
            System.out.println("Alternativas cadastradas");

        } catch (SQLException e) {
            System.out.println("Erro ao inserir alternativas: " + e.getMessage());
        }
    }

    public List<Alternative> getAllByQuestion(int questionId) {
        QuestionDAO questionDAO = new QuestionDAO();
        MultipleChoiceQuestion q = (MultipleChoiceQuestion) questionDAO.getById(questionId);
        if (q == null) return new ArrayList<>();
        return new ArrayList<>(q.getAlternatives());
    }

    public void update(Alternative alternative) {
        String sql = "UPDATE alternative SET text = ?, is_correct = ? WHERE id_alternative = ?";

        try (Connection conn = DBConnection.connect();
             PreparedStatement stmt = conn.prepareStatement(sql)
        ) {
            stmt.setString(1, alternative.getText());
            stmt.setBoolean(2, alternative.getCorrect());
            stmt.setInt(3, alternative.getId());
            stmt.executeUpdate();
            System.out.println("Alternativa atualizada");

        } catch (SQLException e) {
            System.out.println("Erro ao atualizar alternativa: " + e.getMessage());
        }
    }

    public void delete(int id) {
        String sql = "DELETE FROM alternative WHERE id_alternative = ?";

        try (Connection conn = DBConnection.connect();
             PreparedStatement stmt = conn.prepareStatement(sql)
        ) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
            System.out.println("Alternativa deletada");

        } catch (SQLException e) {
            System.out.println("Erro ao deletar alternativa: " + e.getMessage());
        }
    }

    public void deleteAllByQuestion(int questionId) {
        String sql = "DELETE FROM alternative WHERE question_id = ?";

        try (Connection conn = DBConnection.connect();
             PreparedStatement stmt = conn.prepareStatement(sql)
        ) {
            stmt.setInt(1, questionId);
            stmt.executeUpdate();
            System.out.println("Alternativas deletadas");

        } catch (SQLException e) {
            System.out.println("Erro ao deletar alternativas: " + e.getMessage());
        }
    }
}