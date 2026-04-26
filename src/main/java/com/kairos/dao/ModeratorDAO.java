package com.kairos.dao;

import com.kairos.model.Moderator;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ModeratorDAO {

    public void insert(int moderatorId, String responsibleDiscipline) {
        String sql = "INSERT INTO moderator (id_moderator, subject_owner) VALUES (?, ?);";
        try (Connection connection = DBConnection.connect();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)
        ) {
            preparedStatement.setInt(1, moderatorId);
            preparedStatement.setString(2, responsibleDiscipline);
            preparedStatement.executeUpdate();
            System.out.println("Moderador cadastrado");
        } catch (SQLException e) {
            System.out.println("Erro ao inserir moderador: " + e.getMessage());
        }
    }

    public Moderator getModeratorById(int id) {
        String sql =
                "SELECT u.id_user, u.name, u.email, u.password, u.user_type, " +
                        "m.subject_owner " +
                        "FROM users u " +
                        "INNER JOIN moderator m ON u.id_user = m.id_moderator " +
                        "WHERE u.id_user = ?;";

        try (Connection connection = DBConnection.connect();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)
        ) {
            preparedStatement.setInt(1, id);

            try (ResultSet rs = preparedStatement.executeQuery()) {
                if (rs.next()) {
                    return new Moderator(
                            rs.getInt("id_user"),
                            rs.getString("name"),
                            rs.getString("email"),
                            rs.getString("password"),
                            rs.getString("user_type"),
                            rs.getString("subject_owner")
                    );
                }
            }

        } catch (SQLException e) {
            System.out.println("Erro ao buscar moderador: " + e.getMessage());
        }

        return null;
    }

    public List<Moderator> getAllModerators() {
        List<Moderator> moderatorList = new ArrayList<>();

        String sql =
                "SELECT u.id_user, u.name, u.email, u.password, u.user_type, " +
                        "m.subject_owner " +
                        "FROM users u " +
                        "INNER JOIN moderator m ON u.id_user = m.id_moderator;";

        try (Connection connection = DBConnection.connect();
             PreparedStatement preparedStatement = connection.prepareStatement(sql);
             ResultSet rs = preparedStatement.executeQuery()
        ) {
            while (rs.next()) {
                moderatorList.add(new Moderator(
                        rs.getInt("id_user"),
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("user_type"),
                        rs.getString("subject_owner")
                ));
            }

        } catch (SQLException e) {
            System.out.println("Erro ao listar moderadores: " + e.getMessage());
        }

        return moderatorList;
    }

    public void updateSubjectOwner(int moderatorId, String newSubject) {
        String sql = "UPDATE moderator SET subject_owner = ? WHERE id_moderator = ?;";

        try (Connection connection = DBConnection.connect();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)
        ) {
            preparedStatement.setString(1, newSubject);
            preparedStatement.setInt(2, moderatorId);

            int linesAffected = preparedStatement.executeUpdate();

            if (linesAffected > 0) {
                System.out.println("Moderador atualizado");
            } else {
                System.out.println("Nenhum moderador atualizado");
            }

        } catch (SQLException e) {
            System.out.println("Erro ao atualizar moderador: " + e.getMessage());
        }
    }

    public void deleteModeratorById(int id) {
        String sql = "DELETE FROM users WHERE id_user = ?;";

        try (Connection connection = DBConnection.connect();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)
        ) {
            preparedStatement.setInt(1, id);

            int linesAffected = preparedStatement.executeUpdate();

            if (linesAffected > 0) {
                System.out.println("Moderador deletado");
            } else {
                System.out.println("Nenhum moderador encontrado");
            }

        } catch (SQLException e) {
            System.out.println("Erro ao deletar moderador: " + e.getMessage());
        }
    }
}