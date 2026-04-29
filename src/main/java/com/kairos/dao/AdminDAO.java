package com.kairos.dao;

import com.kairos.model.Admin;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AdminDAO {

    public boolean insert(int adminId) {
        String sql = "INSERT INTO admin (id_admin) VALUES (?);";

        try (Connection conn = DBConnection.connect();
             PreparedStatement stmt = conn.prepareStatement(sql)
        ) {
            stmt.setInt(1, adminId);
            stmt.executeUpdate();
            System.out.println("Admin cadastrado");
            return true;

        } catch (SQLException e) {
            System.out.println("Erro ao inserir admin: " + e.getMessage());
            return false;

        }
    }

    public Admin getById(int id) {
        String sql =
                "SELECT u.id_user, u.name, u.email, u.password, u.user_type " +
                        "FROM user u " +
                        "INNER JOIN admin a ON u.id_user = a.id_admin " +
                        "WHERE u.id_user = ?;";

        try (Connection conn = DBConnection.connect();
             PreparedStatement stmt = conn.prepareStatement(sql)
        ) {
            stmt.setInt(1, id);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new Admin(
                            rs.getInt("id_user"), rs.getString("name"),
                            rs.getString("email"), rs.getString("password"),
                            rs.getString("user_type")
                    );
                }
            }

        } catch (SQLException e) {
            System.out.println("Erro ao buscar admin: " + e.getMessage());
        }

        return null;
    }

    public List<Admin> getAll() {
        List<Admin> list = new ArrayList<>();

        String sql =
                "SELECT u.id_user, u.name, u.email, u.password, u.user_type " +
                        "FROM user u " +
                        "INNER JOIN admin a ON u.id_user = a.id_admin;";

        try (Connection conn = DBConnection.connect();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()
        ) {
            while (rs.next()) {
                list.add(new Admin(
                        rs.getInt("id_user"), rs.getString("name"),
                        rs.getString("email"), rs.getString("password"),
                        rs.getString("user_type")
                ));
            }

        } catch (SQLException e) {
            System.out.println("Erro ao listar admins: " + e.getMessage());
        }

        return list;
    }

    public void delete(int id) {
        String sql = "DELETE FROM user WHERE id_user = ?;";

        try (Connection conn = DBConnection.connect();
             PreparedStatement stmt = conn.prepareStatement(sql)
        ) {
            stmt.setInt(1, id);

            int linesAffected = stmt.executeUpdate();

            if (linesAffected > 0) {
                System.out.println("Admin deletado");
            } else {
                System.out.println("Nenhum admin encontrado");
            }

        } catch (SQLException e) {
            System.out.println("Erro ao deletar admin: " + e.getMessage());
        }
    }
}