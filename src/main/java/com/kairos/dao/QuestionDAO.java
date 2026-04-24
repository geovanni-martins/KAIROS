package com.kairos.dao;

import com.kairos.model.Alternative;
import com.kairos.model.MultipleChoiceQuestion;
import com.kairos.model.Question;
import com.kairos.model.Topic;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class QuestionDAO {

    public void insertQuestion(MultipleChoiceQuestion question) {

        String sql = "INSERT INTO question (topic_id, statement, stats, difficulty) VALUES (?, ?, ?, ?)";

        try (
                java.sql.Connection conn = DBConnection.connect();
                PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
        ) {
            stmt.setInt(1, question.getTopic().getId());
            stmt.setString(2, question.getStatement());
            stmt.setString(3, question.getStats());
            stmt.setString(4, question.getDifficulty());
            stmt.executeUpdate();

            ResultSet generatedKeys = stmt.getGeneratedKeys();
            if (generatedKeys.next()) {
                int idGerado = generatedKeys.getInt(1);

                String sql2 = "INSERT INTO multiple_choice_question (question_id, template, justification) VALUES (?, ?, ?)"; //inserindo a questão como de multipla escolha ja que so existe ela por enquanto
                PreparedStatement stmt2 = conn.prepareStatement(sql2);

                stmt2.setInt(1, idGerado);
                stmt2.setString(2, question.getTemplate());
                stmt2.setString(3, question.getJustification());
                stmt2.executeUpdate();

                String sql3 = "INSERT INTO alternative (question_id, text, is_correct) VALUES (?, ?, ?)";
                PreparedStatement stmt3 = conn.prepareStatement(sql3);
                for (Alternative alt : question.getAlternatives()) {
                    stmt3.setInt(1, idGerado);
                    stmt3.setString(2, alt.getText());
                    stmt3.setBoolean(3, alt.getCorrect());
                    stmt3.addBatch();
                }
                stmt3.executeBatch();

            }

            System.out.println("Questão cadastrada com sucesso");

        } catch (SQLException e) {
            System.out.println("Erro ao inserir questão: " + e.getMessage());
        }

    }

    public void updateQuestion(MultipleChoiceQuestion question) {

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
            stmt.executeUpdate();

            String sql2 = "UPDATE multiple_choice_question SET template = ?, justification = ? WHERE question_id = ?";

            PreparedStatement stmt2 = conn.prepareStatement(sql2);
            stmt2.setString(1, question.getTemplate());
            stmt2.setString(2, question.getJustification());
            stmt2.setInt(3, question.getId());
            stmt2.executeUpdate();

            String sqlDelete = "DELETE FROM alternative WHERE question_id = ?"; //aq deleta as alternativas antigas

            PreparedStatement stmtDelete = conn.prepareStatement(sqlDelete);
            stmtDelete.setInt(1, question.getId());
            stmtDelete.executeUpdate();

            String sql3 = "INSERT INTO alternative (question_id, text, is_correct) VALUES (?, ?, ?)";

            PreparedStatement stmt3 = conn.prepareStatement(sql3);

            for (Alternative alt : question.getAlternatives()) {
                stmt3.setInt(1, question.getId());
                stmt3.setString(2, alt.getText());
                stmt3.setBoolean(3, alt.getCorrect());
                stmt3.addBatch();
            }

            stmt3.executeBatch();

            System.out.println("Questão atualizada com sucesso");

        } catch (SQLException e) {
            System.out.println("Erro ao atualizar questão: " + e.getMessage());
        }
    }

    public ArrayList<Question> listQuestions() {
        ArrayList<Question> lista = new ArrayList<>();
        String sql = "SELECT q.*, a.id_alternative, a.text, a.is_correct " +
                "FROM question q " +
                "LEFT JOIN alternative a ON q.id_question = a.question_id";

        try (
                java.sql.Connection conn = DBConnection.connect();
                PreparedStatement stmt = conn.prepareStatement(sql);
                ResultSet rs = stmt.executeQuery();
        ) {

            Question currentQuestion = null;

            while (rs.next()) {

                int id = rs.getInt("id_question");

                Topic topic = new Topic(rs.getInt("topic_id"),
                        null,
                        null);

                if (currentQuestion == null || currentQuestion.getId() != id) {
                    currentQuestion = new Question(
                            rs.getInt("id_question"),
                            rs.getString("statement"),
                            rs.getString("stats"),
                            rs.getString("difficulty"),
                            topic,
                            rs.getTimestamp("created_at").toInstant());
                    lista.add(currentQuestion);
                }


                Alternative alternative = new Alternative(
                        rs.getInt("id_alternative"),
                        rs.getString("text"),
                        rs.getBoolean("is_correct"),
                        currentQuestion
                );

                currentQuestion.getAlternatives().add(alternative);

            }

        } catch (SQLException e) {
            System.out.println("Erro ao listar questões: " + e.getMessage());
        }

        return lista;
    }

    public ArrayList<Question> listQuestionsPerTopic(int topicId) {
        ArrayList<Question> lista = new ArrayList<>();
        String sql = "SELECT q.*, a.id_alternative, a.text, a.is_correct " +
                "FROM question q " +
                "LEFT JOIN alternative a ON q.id_question = a.question_id " +
                "WHERE q.topic_id = ?";

        try (
                java.sql.Connection conn = DBConnection.connect();
                PreparedStatement stmt = conn.prepareStatement(sql);
        ) {

            stmt.setInt(1, topicId);

            try (ResultSet rs = stmt.executeQuery()) {

                Question currentQuestion = null;

                while (rs.next()) {

                    int id = rs.getInt("id_question");

                    Topic topic = new Topic(rs.getInt("topic_id"),
                            null,
                            null);

                    if (currentQuestion == null || currentQuestion.getId() != id) {

                        currentQuestion = new Question(
                                rs.getInt("id_question"),
                                rs.getString("statement"),
                                rs.getString("stats"),
                                rs.getString("difficulty"),
                                topic,
                                rs.getTimestamp("created_at").toInstant());

                        lista.add(currentQuestion);
                    }

                    Alternative alternative = new Alternative(
                            rs.getInt("id_alternative"),
                            rs.getString("text"),
                            rs.getBoolean("is_correct"),
                            currentQuestion
                    );

                    currentQuestion.getAlternatives().add(alternative);
                }
            }
        } catch (SQLException e) {
            System.out.println("Erro ao listar questões por tópico: " + e.getMessage());
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
                    Topic topic = new Topic(rs.getInt("topic_id"),
                            null,
                            null);

                    question = new Question(
                            rs.getInt("id_question"),
                            rs.getString("statement"),
                            rs.getString("stats"),
                            rs.getString("difficulty"),
                            topic,
                            rs.getTimestamp("created_at").toInstant());
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
                System.out.println("Questão excluída com sucesso");

            } else {
                System.out.println("Nenhuma questão encontrada com esse ID.");
            }

        } catch (SQLException e) {
            System.out.println("Erro ao excluir questão: " + e.getMessage());
        }
    }
}