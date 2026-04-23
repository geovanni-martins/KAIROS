package com.kairos.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ModeratorDAO {
    public void insert(int moderatorId, String responsibleDiscipline) {
        String sql = "INSERT INTO moderator (id_moderator, subject_owner) VALUES (?, ?);";

        try(Connection connection = DBConnection.connect();
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
        ) {
            preparedStatement.setInt(1, moderatorId);
            preparedStatement.setString(2, responsibleDiscipline);

            preparedStatement.executeUpdate();
            System.out.println("moderador cadastrado");

        } catch (SQLException e) {
            System.out.println("Erro ao inserir moderador: " + e.getMessage());
        }
    }
}
