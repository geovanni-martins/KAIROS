package com.kairos.dao;

import com.kairos.model.Moderator;
import com.kairos.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ModeratorDAO {

    public boolean insert(int moderatorId, String subjectOwner) {
        String sql = "INSERT INTO moderator (id_moderator, subject_owner) VALUES (?, ?);";

        try (Connection conn = DBConnection.connect();
             PreparedStatement stmt = conn.prepareStatement(sql)
        ) {
            stmt.setInt(1, moderatorId);
            stmt.setString(2, subjectOwner);
            stmt.executeUpdate();
            System.out.println("Moderador cadastrado");
            return true;

        } catch (SQLException e) {
            System.out.println("Erro ao inserir moderador: " + e.getMessage());
            return false;

        }
    }

    public Moderator getById(int id) {
        String sql =
                "SELECT u.id_user, u.name, u.email, u.password, u.user_type, m.subject_owner " +
                        "FROM user u " +
                        "INNER JOIN moderator m ON u.id_user = m.id_moderator " +
                        "WHERE u.id_user = ?;";

        try (Connection conn = DBConnection.connect();
             PreparedStatement stmt = conn.prepareStatement(sql)
        ) {
            stmt.setInt(1, id);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new Moderator(
                            rs.getInt("id_user"), rs.getString("name"),
                            rs.getString("email"), rs.getString("password"),
                            rs.getString("user_type"), rs.getString("subject_owner")
                    );
                }
            }

        } catch (SQLException e) {
            System.out.println("Erro ao buscar moderador: " + e.getMessage());
        }

        return null;
    }

    public List<Moderator> getAll() {
        List<Moderator> list = new ArrayList<>();

        String sql =
                "SELECT u.id_user, u.name, u.email, u.password, u.user_type, m.subject_owner " +
                        "FROM user u " +
                        "INNER JOIN moderator m ON u.id_user = m.id_moderator;";

        try (Connection conn = DBConnection.connect();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()
        ) {
            while (rs.next()) {
                list.add(new Moderator(
                        rs.getInt("id_user"), rs.getString("name"),
                        rs.getString("email"), rs.getString("password"),
                        rs.getString("user_type"), rs.getString("subject_owner")
                ));
            }

        } catch (SQLException e) {
            System.out.println("Erro ao listar moderadores: " + e.getMessage());
        }

        return list;
    }

    public void update(int moderatorId, String newSubject) {
        String sql = "UPDATE moderator SET subject_owner = ? WHERE id_moderator = ?;";

        try (Connection conn = DBConnection.connect();
             PreparedStatement stmt = conn.prepareStatement(sql)
        ) {
            stmt.setString(1, newSubject);
            stmt.setInt(2, moderatorId);

            int linesAffected = stmt.executeUpdate();

            if (linesAffected > 0) {
                System.out.println("Moderador atualizado");
            } else {
                System.out.println("Nenhum moderador encontrado");
            }

        } catch (SQLException e) {
            System.out.println("Erro ao atualizar moderador: " + e.getMessage());
        }
    }

    public void delete(int id) {
        String sql = "DELETE FROM user WHERE id_user = ?;";

        try (Connection conn = DBConnection.connect();
             PreparedStatement stmt = conn.prepareStatement(sql)
        ) {
            stmt.setInt(1, id);

            int linesAffected = stmt.executeUpdate();

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