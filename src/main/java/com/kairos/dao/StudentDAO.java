package com.kairos.dao;

import com.kairos.model.Student;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class StudentDAO {
    public void insert(int studentId) {
        String sql = "INSERT INTO student (id_student) VALUES (?);";

        try(Connection connection = DBConnection.connect();
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
        ) {
            preparedStatement.setInt(1, studentId);

            preparedStatement.executeUpdate();
            System.out.println("estudante cadastrado");

        } catch (SQLException e) {
            System.out.println("Erro ao inserir estudante: " + e.getMessage());
        }
    }
}
