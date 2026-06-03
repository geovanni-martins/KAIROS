package com.kairos.dao;

import com.kairos.model.Admin;
import com.kairos.model.Moderator;
import com.kairos.model.Student;
import com.kairos.model.User;
import com.kairos.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {

    public int insert(User user) {
        String sql = "INSERT INTO user (name, email, password, user_type) VALUES (?, ?, ?, ?);";

        try (Connection conn = DBConnection.connect();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)
        ) {
            stmt.setString(1, user.getName());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getPassword());
            stmt.setString(4, user.getRole());
            stmt.executeUpdate();

            try (ResultSet rs = stmt.getGeneratedKeys()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }

        } catch (SQLException e) {
            System.out.println("Erro ao inserir usuário: " + e.getMessage());
        }

        return -1;
    }

    public User getById(int id) {
        String sql =
                "SELECT u.id_user, u.name, u.email, u.password, u.user_type, " +
                        "m.subject_owner " +
                        "FROM user u " +
                        "LEFT JOIN moderator m ON u.id_user = m.id_moderator " +
                        "LEFT JOIN student s ON u.id_user = s.id_student " +
                        "WHERE u.id_user = ?";

        try (Connection conn = DBConnection.connect();
             PreparedStatement stmt = conn.prepareStatement(sql)
        ) {
            stmt.setInt(1, id);

            try (ResultSet rs = stmt.executeQuery()) {
                if (!rs.next()) {
                    return null;
                }

                String userType = rs.getString("user_type");

                switch (userType) {
                    case "admin":
                        return new Admin(
                                rs.getInt("id_user"), rs.getString("name"),
                                rs.getString("email"), rs.getString("password"), userType
                        );
                    case "moderator":
                        return new Moderator(
                                rs.getInt("id_user"), rs.getString("name"),
                                rs.getString("email"), rs.getString("password"), userType,
                                rs.getString("subject_owner")
                        );
                    case "student":
                        return new Student(
                                rs.getInt("id_user"), rs.getString("name"),
                                rs.getString("email"), rs.getString("password"), userType
                        );
                }
            }

        } catch (SQLException e) {
            System.out.println("Erro ao buscar usuário: " + e.getMessage());
        }

        return null;
    }

    public User getByEmail(String email) {
        String sql = "SELECT * FROM user WHERE email = ?";

        try (Connection conn = DBConnection.connect();
             PreparedStatement stmt = conn.prepareStatement(sql)
        ) {
            stmt.setString(1, email);

            try (ResultSet rs = stmt.executeQuery()) {
                if (!rs.next()) {
                    return null;
                }

                int idUser = rs.getInt("id_user");
                String name = rs.getString("name");
                String emailDb = rs.getString("email");
                String passwordDb = rs.getString("password");
                String userType = rs.getString("user_type");

                switch (userType) {
                    case "admin":
                        return new Admin(idUser, name, emailDb, passwordDb, userType);
                    case "moderator": {
                        String sqlMod = "SELECT subject_owner FROM moderator WHERE id_moderator = ?;";
                        try (Connection conn2 = DBConnection.connect();
                             PreparedStatement stmt2 = conn2.prepareStatement(sqlMod)
                        ) {
                            stmt2.setInt(1, idUser);
                            try (ResultSet rs2 = stmt2.executeQuery()) {
                                if (rs2.next()) {
                                    return new Moderator(idUser, name, emailDb, passwordDb, userType, rs2.getString("subject_owner"));
                                }
                            }
                        }
                        break;
                    }
                    case "student": {
                        return new Student(idUser, name, emailDb, passwordDb, userType);
                    }
                }
            }

        } catch (SQLException e) {
            System.out.println("Erro ao buscar usuário: " + e.getMessage());
        }

        return null;
    }

    public List<User> getAll() {
        List<User> list = new ArrayList<>();

        String sql =
                "SELECT u.id_user, u.name, u.email, u.password, u.user_type, " +
                        "a.id_admin, m.subject_owner " +
                        "FROM user u " +
                        "LEFT JOIN admin a ON u.id_user = a.id_admin " +
                        "LEFT JOIN moderator m ON u.id_user = m.id_moderator " +
                        "LEFT JOIN student s ON u.id_user = s.id_student";

        try (Connection conn = DBConnection.connect();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()
        ) {
            while (rs.next()) {
                String userType = rs.getString("user_type");

                switch (userType.toLowerCase()) {
                    case "admin":
                        list.add(new Admin(
                                rs.getInt("id_user"), rs.getString("name"),
                                rs.getString("email"), rs.getString("password"), userType
                        ));
                        break;
                    case "moderator":
                        list.add(new Moderator(
                                rs.getInt("id_user"), rs.getString("name"),
                                rs.getString("email"), rs.getString("password"), userType,
                                rs.getString("subject_owner")
                        ));
                        break;
                    case "student":
                        list.add(new Student(
                                rs.getInt("id_user"), rs.getString("name"),
                                rs.getString("email"), rs.getString("password"), userType
                        ));
                        break;
                }
            }

        } catch (SQLException e) {
            System.out.println("Erro ao listar usuários: " + e.getMessage());
        }

        return list;
    }

    public void update(User user) {
        String sql = "UPDATE user SET name = ?, email = ?, password = ? WHERE id_user = ?;";

        try (Connection conn = DBConnection.connect();
             PreparedStatement stmt = conn.prepareStatement(sql)
        ) {
            stmt.setString(1, user.getName());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getPassword());
            stmt.setInt(4, user.getId());

            int linesAffected = stmt.executeUpdate();

            if (linesAffected > 0) {
                System.out.println("Usuário atualizado");
            } else {
                System.out.println("Nenhum usuário atualizado");
            }

        } catch (SQLException e) {
            System.out.println("Erro ao atualizar usuário: " + e.getMessage());
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
                System.out.println("Usuário deletado");
            } else {
                System.out.println("Nenhum usuário encontrado");
            }

        } catch (SQLException e) {
            System.out.println("Erro ao deletar usuário: " + e.getMessage());
        }
    }
}