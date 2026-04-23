package com.kairos.dao;

import com.kairos.model.User;
import java.sql.*;

public class AdminDAO {
    public void insert(int adminId) {
        String sql = "INSERT INTO admin (id_admin) VALUES (?);";

        try(Connection connection = DBConnection.connect();
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
        ) {
            preparedStatement.setInt(1, adminId);

            preparedStatement.executeUpdate();
            System.out.println("Admin cadastrado");

        } catch (SQLException e) {
            System.out.println("Erro ao inserir admin: " + e.getMessage());
        }
    }
}
