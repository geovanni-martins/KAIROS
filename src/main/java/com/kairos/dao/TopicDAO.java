package com.kairos.dao;

import com.kairos.model.Topic;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class TopicDAO {

    public void insertTopic(Topic topic) {

        String sql = "INSERT INTO topic (name, subject) VALUES (?, ?)";

        try (
                Connection conn = DBConnection.connect();
                PreparedStatement stmt = conn.prepareStatement(sql);
        ) {
            stmt.setString(1, topic.getName());
            stmt.setString(2, topic.getSubject());
            stmt.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Erro ao inserir tópico: " + e.getMessage());
        }
    }

    public ArrayList<Topic> listTopics() {

        String sql = "SELECT * FROM topic";

        ArrayList<Topic> lista = new ArrayList<>();

        try (Connection conn = DBConnection.connect();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Topic topic = new Topic(
                        rs.getInt("id_topic"),
                        rs.getString("name"),
                        rs.getString("subject")
                );

                lista.add(topic);
            }

        } catch (SQLException e) {

            System.out.println("Erro ao listar tópicos: " + e.getMessage());
        }
        return lista;

    }

    public Topic searchTopicById(int topic_id) {

        String sql = "SELECT * FROM topic WHERE id_topic = ?";

        Topic topic = null;

        try (Connection conn = DBConnection.connect();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, topic_id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                topic = new Topic(
                        rs.getInt("id_topic"),
                        rs.getString("name"),
                        rs.getString("subject")
                );
            }

        } catch (SQLException e) {

            System.out.println("Erro ao buscar tópico pelo id: " + e.getMessage());
        }

        return topic;
    }

    public void updateTopic(Topic topic) {

        String sql = "UPDATE topic SET name = ?, subject = ? WHERE id_topic = ?";

        try (
                java.sql.Connection conn = DBConnection.connect();
                PreparedStatement stmt = conn.prepareStatement(sql);
        ) {
            stmt.setString(1, topic.getName());
            stmt.setString(2, topic.getSubject());
            stmt.setInt(3, topic.getId());
            stmt.executeUpdate();

            System.out.println("Tópico atualizado com sucesso");

        } catch (SQLException e) {

            System.out.println("Erro ao atualizar tópico: " + e.getMessage());
        }
    }


    public void deleteTopic(int id_topic) {

        String sql = "DELETE FROM topic WHERE id_topic = ?";

        try (
                java.sql.Connection conn = DBConnection.connect();
                PreparedStatement stmt = conn.prepareStatement(sql);

        ) {

            stmt.setInt(1, id_topic);

            int linhasAfetadas = stmt.executeUpdate();

            if (linhasAfetadas > 0) {
                System.out.println("Tópico excluído com sucesso");

            } else {
                System.out.println("Nenhum tópico encontrada com esse ID.");
            }

        } catch (SQLException e) {
            System.out.println("Erro ao excluir tópico: " + e.getMessage());
        }
    }

}





