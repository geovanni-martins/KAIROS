package com.kairos.dao;

import com.kairos.model.Student;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentDAO {

    public boolean insert(int studentId) {
        String sql = "INSERT INTO student (id_student) VALUES (?);";

        try (Connection conn = DBConnection.connect();
             PreparedStatement stmt = conn.prepareStatement(sql)
        ) {
            stmt.setInt(1, studentId);
            stmt.executeUpdate();
            System.out.println("Estudante cadastrado");
            return true;

        } catch (SQLException e) {
            System.out.println("Erro ao inserir estudante: " + e.getMessage());
            return false;
        }
    }

    public Student getById(int id) {
        String sql =
                "SELECT u.id_user, u.name, u.email, u.password, u.user_type, s.level, s.xp " +
                        "FROM user u " +
                        "INNER JOIN student s ON u.id_user = s.id_student " +
                        "WHERE u.id_user = ?;";

        try (Connection conn = DBConnection.connect();
             PreparedStatement stmt = conn.prepareStatement(sql)
        ) {
            stmt.setInt(1, id);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new Student(
                            rs.getInt("id_user"), rs.getString("name"),
                            rs.getString("email"), rs.getString("password"),
                            rs.getString("user_type"),
                            rs.getInt("level"), rs.getInt("xp")
                    );
                }
            }

        } catch (SQLException e) {
            System.out.println("Erro ao buscar estudante: " + e.getMessage());
        }

        return null;
    }

    public List<Student> getAll() {
        List<Student> list = new ArrayList<>();

        String sql =
                "SELECT u.id_user, u.name, u.email, u.password, u.user_type, s.level, s.xp " +
                        "FROM user u " +
                        "INNER JOIN student s ON u.id_user = s.id_student;";

        try (Connection conn = DBConnection.connect();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()
        ) {
            while (rs.next()) {
                list.add(new Student(
                        rs.getInt("id_user"), rs.getString("name"),
                        rs.getString("email"), rs.getString("password"),
                        rs.getString("user_type"),
                        rs.getInt("level"), rs.getInt("xp")
                ));
            }

        } catch (SQLException e) {
            System.out.println("Erro ao listar estudantes: " + e.getMessage());
        }

        return list;
    }
}