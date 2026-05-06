package com.kairos.dao;

import com.kairos.model.Alternative;
import com.kairos.model.MultipleChoiceQuestion;
import com.kairos.model.Question;
import com.kairos.model.Topic;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class QuestionDAO {

    public void insert(MultipleChoiceQuestion question) {
        String sql = "INSERT INTO question (topic_id, statement, stats, difficulty) VALUES (?, ?, ?, ?)";

        try (Connection conn = DBConnection.connect();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)
        ) {
            stmt.setInt(1, question.getTopic().getId());
            stmt.setString(2, question.getStatement());
            stmt.setString(3, question.getStats());
            stmt.setString(4, question.getDifficulty());
            stmt.executeUpdate();

            try (ResultSet rs = stmt.getGeneratedKeys()) {
                if (rs.next()) {
                    int generatedId = rs.getInt(1);

                    PreparedStatement stmt2 = conn.prepareStatement(
                            "INSERT INTO multiple_choice_question (question_id, template, justification) VALUES (?, ?, ?)"
                    );
                    stmt2.setInt(1, generatedId);
                    stmt2.setString(2, question.getTemplate());
                    stmt2.setString(3, question.getJustification());
                    stmt2.executeUpdate();

                    PreparedStatement stmt3 = conn.prepareStatement(
                            "INSERT INTO alternative (question_id, text, is_correct) VALUES (?, ?, ?)"
                    );
                    for (Alternative alt : question.getAlternatives()) {
                        stmt3.setInt(1, generatedId);
                        stmt3.setString(2, alt.getText());
                        stmt3.setBoolean(3, alt.getCorrect());
                        stmt3.addBatch();
                    }
                    stmt3.executeBatch();
                }
            }

            System.out.println("Questão cadastrada");

        } catch (SQLException e) {
            System.out.println("Erro ao inserir questão: " + e.getMessage());
        }
    }

    public Question getById(int id) {
        String sql = "SELECT * FROM question WHERE id_question = ?";

        try (Connection conn = DBConnection.connect();
             PreparedStatement stmt = conn.prepareStatement(sql)
        ) {
            stmt.setInt(1, id);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    Topic topic = new Topic(rs.getInt("topic_id"), null, null);
                    return new Question(
                            rs.getInt("id_question"), rs.getString("statement"),
                            rs.getString("stats"), rs.getString("difficulty"),
                            topic, rs.getTimestamp("created_at").toInstant()
                    );
                }
            }

        } catch (SQLException e) {
            System.out.println("Erro ao buscar questão: " + e.getMessage());
        }

        return null;
    }

    public List<Question> getAll() {
        List<Question> list = new ArrayList<>();
        String sql = "SELECT q.*, a.id_alternative, a.text, a.is_correct " +
                        "FROM question q " +
                        "LEFT JOIN alternative a ON q.id_question = a.question_id " +
                        "ORDER BY q.id_question ASC, a.id_alternative ASC";

        try (Connection conn = DBConnection.connect();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()
        ) {
            Question current = null;

            while (rs.next()) {
                int id = rs.getInt("id_question");
                Topic topic = new Topic(rs.getInt("topic_id"), null, null);

                if (current == null || current.getId() != id) {
                    current = new Question(
                            id, rs.getString("statement"), rs.getString("stats"),
                            rs.getString("difficulty"), topic,
                            rs.getTimestamp("created_at").toInstant()
                    );
                    list.add(current);
                }

                int altId = rs.getInt("id_alternative");
                if (!rs.wasNull()) {
                    current.getAlternatives().add(new Alternative(
                            altId, rs.getString("text"),
                            rs.getBoolean("is_correct"), current
                    ));
                }
            }

        } catch (SQLException e) {
            System.out.println("Erro ao listar questões: " + e.getMessage());
        }

        return list;
    }

    public List<Question> getAllByTopic(int topicId) {
        List<Question> list = new ArrayList<>();
        String sql = "SELECT q.*, a.id_alternative, a.text, a.is_correct " +
                        "FROM question q " +
                        "LEFT JOIN alternative a ON q.id_question = a.question_id " +
                        "WHERE q.topic_id = ? " +
                        "ORDER BY q.id_question ASC, a.id_alternative ASC";

        try (Connection conn = DBConnection.connect();
             PreparedStatement stmt = conn.prepareStatement(sql)
        ) {
            stmt.setInt(1, topicId);

            try (ResultSet rs = stmt.executeQuery()) {
                Question current = null;

                while (rs.next()) {
                    int id = rs.getInt("id_question");
                    Topic topic = new Topic(rs.getInt("topic_id"), null, null);

                    if (current == null || current.getId() != id) {
                        current = new Question(
                                id, rs.getString("statement"), rs.getString("stats"),
                                rs.getString("difficulty"), topic,
                                rs.getTimestamp("created_at").toInstant()
                        );
                        list.add(current);
                    }

                    int altId = rs.getInt("id_alternative");
                    if (!rs.wasNull()) {
                        current.getAlternatives().add(new Alternative(
                                altId, rs.getString("text"),
                                rs.getBoolean("is_correct"), current
                        ));
                    }
                }
            }

        } catch (SQLException e) {
            System.out.println("Erro ao listar questões por tópico: " + e.getMessage());
        }

        return list;
    }

    public void update(MultipleChoiceQuestion question) {
        String sql = "UPDATE question SET topic_id = ?, statement = ?, stats = ?, difficulty = ? WHERE id_question = ?";

        try (Connection conn = DBConnection.connect();
             PreparedStatement stmt = conn.prepareStatement(sql)
        ) {
            stmt.setInt(1, question.getTopic().getId());
            stmt.setString(2, question.getStatement());
            stmt.setString(3, question.getStats());
            stmt.setString(4, question.getDifficulty());
            stmt.setInt(5, question.getId());
            stmt.executeUpdate();

            PreparedStatement stmt2 = conn.prepareStatement(
                    "UPDATE multiple_choice_question SET template = ?, justification = ? WHERE question_id = ?"
            );
            stmt2.setString(1, question.getTemplate());
            stmt2.setString(2, question.getJustification());
            stmt2.setInt(3, question.getId());
            stmt2.executeUpdate();

            PreparedStatement stmtDelete = conn.prepareStatement(
                    "DELETE FROM alternative WHERE question_id = ?"
            );
            stmtDelete.setInt(1, question.getId());
            stmtDelete.executeUpdate();

            PreparedStatement stmt3 = conn.prepareStatement(
                    "INSERT INTO alternative (question_id, text, is_correct) VALUES (?, ?, ?)"
            );
            for (Alternative alt : question.getAlternatives()) {
                stmt3.setInt(1, question.getId());
                stmt3.setString(2, alt.getText());
                stmt3.setBoolean(3, alt.getCorrect());
                stmt3.addBatch();
            }
            stmt3.executeBatch();

            System.out.println("Questão atualizada");

        } catch (SQLException e) {
            System.out.println("Erro ao atualizar questão: " + e.getMessage());
        }
    }

    public void delete(int id) {
        String sql = "DELETE FROM question WHERE id_question = ?";

        try (Connection conn = DBConnection.connect();
             PreparedStatement stmt = conn.prepareStatement(sql)
        ) {
            stmt.setInt(1, id);

            int linesAffected = stmt.executeUpdate();

            if (linesAffected > 0) {
                System.out.println("Questão deletada");
            } else {
                System.out.println("Nenhuma questão encontrada");
            }

        } catch (SQLException e) {
            System.out.println("Erro ao deletar questão: " + e.getMessage());
        }
    }
}