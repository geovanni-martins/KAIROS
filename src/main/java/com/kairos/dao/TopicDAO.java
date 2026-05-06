package com.kairos.dao;

import com.kairos.model.Topic;
import com.kairos.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TopicDAO {

    public void insert(Topic topic) {
        String sql = "INSERT INTO topic (name, subject) VALUES (?, ?)";

        try (Connection conn = DBConnection.connect();
             PreparedStatement stmt = conn.prepareStatement(sql)
        ) {
            stmt.setString(1, topic.getName());
            stmt.setString(2, topic.getSubject());
            stmt.executeUpdate();
            System.out.println("Tópico cadastrado");
        } catch (SQLException e) {
            System.out.println("Erro ao inserir tópico: " + e.getMessage());
        }
    }

    public void insertTopicWithPreReqs(Topic topic, String[] preReqsIds) {
        String sqlTopic = "INSERT INTO topic (name, subject) VALUES (?, ?)";
        String sqlPreReq = "INSERT INTO topic_pre_requirements (topic_id, pre_requirement_id) VALUES (?, ?)";

        try (Connection conn = DBConnection.connect()) {

            try (PreparedStatement stmtTopic = conn.prepareStatement(sqlTopic, Statement.RETURN_GENERATED_KEYS)) {
                stmtTopic.setString(1, topic.getName());
                stmtTopic.setString(2, topic.getSubject());
                stmtTopic.executeUpdate();

                ResultSet rs = stmtTopic.getGeneratedKeys();
                if (rs.next()) {
                    int idGerado = rs.getInt(1);

                    if (preReqsIds != null) {
                        for (String preId : preReqsIds) {
                            try (PreparedStatement stmtPre = conn.prepareStatement(sqlPreReq)) {
                                stmtPre.setInt(1, idGerado);
                                stmtPre.setInt(2, Integer.parseInt(preId));
                                stmtPre.executeUpdate();
                            }
                        }
                    }
                }
            }
        } catch (SQLException e) {
            System.out.println("Erro : " + e.getMessage());
        }
    }

    public Topic getById(int id) {
        String sql = "SELECT * FROM topic WHERE id_topic = ?";

        try (Connection conn = DBConnection.connect();
             PreparedStatement stmt = conn.prepareStatement(sql)
        ) {
            stmt.setInt(1, id);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new Topic(
                            rs.getInt("id_topic"),
                            rs.getString("name"),
                            rs.getString("subject")
                    );
                }
            }

        } catch (SQLException e) {
            System.out.println("Erro ao buscar tópico: " + e.getMessage());
        }

        return null;
    }

    public List<Topic> getAll() {
        List<Topic> list = new ArrayList<>();
        String sql = "SELECT * FROM topic";

        try (Connection conn = DBConnection.connect();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()
        ) {
            while (rs.next()) {
                list.add(new Topic(
                        rs.getInt("id_topic"),
                        rs.getString("name"),
                        rs.getString("subject")
                ));
            }

        } catch (SQLException e) {
            System.out.println("Erro ao listar tópicos: " + e.getMessage());
        }

        return list;
    }

    public void update(Topic topic) {
        String sql = "UPDATE topic SET name = ?, subject = ? WHERE id_topic = ?";

        try (Connection conn = DBConnection.connect();
             PreparedStatement stmt = conn.prepareStatement(sql)
        ) {
            stmt.setString(1, topic.getName());
            stmt.setString(2, topic.getSubject());
            stmt.setInt(3, topic.getId());

            int linesAffected = stmt.executeUpdate();

            if (linesAffected > 0) {
                System.out.println("Tópico atualizado");
            } else {
                System.out.println("Nenhum tópico encontrado");
            }

        } catch (SQLException e) {
            System.out.println("Erro ao atualizar tópico: " + e.getMessage());
        }
    }

    public void delete(int id) {
        String sql = "DELETE FROM topic WHERE id_topic = ?";

        try (Connection conn = DBConnection.connect();
             PreparedStatement stmt = conn.prepareStatement(sql)
        ) {
            stmt.setInt(1, id);

            int linesAffected = stmt.executeUpdate();

            if (linesAffected > 0) {
                System.out.println("Tópico deletado");
            } else {
                System.out.println("Nenhum tópico encontrado");
            }

        } catch (SQLException e) {
            System.out.println("Erro ao deletar tópico: " + e.getMessage());
        }
    }
}