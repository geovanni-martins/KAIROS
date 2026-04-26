package com.kairos.dao;

import com.kairos.model.Student;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentDAO {

    public void insert(int studentId) {
        String sql = "INSERT INTO student (id_student) VALUES (?);";
        try (Connection connection = DBConnection.connect();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)
        ) {
            preparedStatement.setInt(1, studentId);
            preparedStatement.executeUpdate();
            System.out.println("Estudante cadastrado");
        } catch (SQLException e) {
            System.out.println("Erro ao inserir estudante: " + e.getMessage());
        }
    }

    public Student getStudentById(int id) {
        String sql =
                "SELECT u.id_user, u.name, u.email, u.password, u.user_type, " +
                        "s.level, s.xp " +
                        "FROM users u " +
                        "INNER JOIN student s ON u.id_user = s.id_student " +
                        "WHERE u.id_user = ?;";

        try (Connection connection = DBConnection.connect();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)
        ) {
            preparedStatement.setInt(1, id);

            try (ResultSet rs = preparedStatement.executeQuery()) {
                if (rs.next()) {
                    return new Student(
                            rs.getInt("id_user"),
                            rs.getString("name"),
                            rs.getString("email"),
                            rs.getString("password"),
                            rs.getString("user_type"),
                            rs.getInt("level"),
                            rs.getInt("xp")
                    );
                }
            }

        } catch (SQLException e) {
            System.out.println("Erro ao buscar estudante: " + e.getMessage());
        }

        return null;
    }

    public List<Student> getAllStudents() {
        List<Student> studentList = new ArrayList<>();

        String sql =
                "SELECT u.id_user, u.name, u.email, u.password, u.user_type, " +
                        "s.level, s.xp " +
                        "FROM users u " +
                        "INNER JOIN student s ON u.id_user = s.id_student;";

        try (Connection connection = DBConnection.connect();
             PreparedStatement preparedStatement = connection.prepareStatement(sql);
             ResultSet rs = preparedStatement.executeQuery()
        ) {
            while (rs.next()) {
                studentList.add(new Student(
                        rs.getInt("id_user"),
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("user_type"),
                        rs.getInt("level"),
                        rs.getInt("xp")
                ));
            }

        } catch (SQLException e) {
            System.out.println("Erro ao listar estudantes: " + e.getMessage());
        }

        return studentList;
    }
}