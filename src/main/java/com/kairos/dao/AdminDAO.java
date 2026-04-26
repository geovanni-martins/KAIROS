package com.kairos.dao;

import com.kairos.model.Admin;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AdminDAO {

    public void insert(int adminId) {
        String sql = "INSERT INTO admin (id_admin) VALUES (?);";
        try (Connection connection = DBConnection.connect();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)
        ) {
            preparedStatement.setInt(1, adminId);
            preparedStatement.executeUpdate();
            System.out.println("Admin cadastrado");
        } catch (SQLException e) {
            System.out.println("Erro ao inserir admin: " + e.getMessage());
        }
    }

    public Admin getAdminById(int id) {
        String sql =
                "SELECT u.id_user, u.name, u.email, u.password, u.user_type " +
                        "FROM users u " +
                        "INNER JOIN admin a ON u.id_user = a.id_admin " +
                        "WHERE u.id_user = ?;";

        try (Connection connection = DBConnection.connect();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)
        ) {
            preparedStatement.setInt(1, id);

            try (ResultSet rs = preparedStatement.executeQuery()) {
                if (rs.next()) {
                    return new Admin(
                            rs.getInt("id_user"),
                            rs.getString("name"),
                            rs.getString("email"),
                            rs.getString("password"),
                            rs.getString("user_type")
                    );
                }
            }

        } catch (SQLException e) {
            System.out.println("Erro ao buscar admin: " + e.getMessage());
        }

        return null;
    }

    public List<Admin> getAllAdmins() {
        List<Admin> adminList = new ArrayList<>();

        String sql =
                "SELECT u.id_user, u.name, u.email, u.password, u.user_type " +
                        "FROM users u " +
                        "INNER JOIN admin a ON u.id_user = a.id_admin;";

        try (Connection connection = DBConnection.connect();
             PreparedStatement preparedStatement = connection.prepareStatement(sql);
             ResultSet rs = preparedStatement.executeQuery()
        ) {
            while (rs.next()) {
                adminList.add(new Admin(
                        rs.getInt("id_user"),
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("user_type")
                ));
            }

        } catch (SQLException e) {
            System.out.println("Erro ao listar admins: " + e.getMessage());
        }

        return adminList;
    }

    public void deleteAdminById(int id) {
        String sql = "DELETE FROM users WHERE id_user = ?;";

        try (Connection connection = DBConnection.connect();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)
        ) {
            preparedStatement.setInt(1, id);

            int linesAffected = preparedStatement.executeUpdate();

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