package com.kairos.dao;

import com.kairos.model.Admin;
import com.kairos.model.Moderator;
import com.kairos.model.Student;
import com.kairos.model.User;

import java.sql.*;
import java.util.ArrayList;

public class UserDAO {

    public int insert(User user) {
        String sql = "INSERT INTO users (name, email, password, user_type) VALUES (?, ?, ?, ?);";

        try (Connection connection = DBConnection.connect();
             PreparedStatement preparedStatement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
        ) {
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getPassword());
            preparedStatement.setString(4, user.getRole());

            preparedStatement.executeUpdate();
            System.out.println("Pessoa cadastrada");

            ResultSet resultSet = preparedStatement.getGeneratedKeys();

            if (resultSet.next()) {
                return resultSet.getInt(1);
            }

        } catch (SQLException e) {
            System.out.println("Erro ao inserir user: " + e.getMessage());
        }

        return -1;
    }

    public User getUserByEmail(String email) {
        User user = null;

        String sql = "SELECT * FROM users WHERE email = ?";

        try (Connection connection = DBConnection.connect();
             PreparedStatement preparedStatement = connection.prepareStatement(sql);
        ) {
            preparedStatement.setString(1, email);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    user = new User(
                            resultSet.getInt("id_user"),
                            resultSet.getString("name"),
                            resultSet.getString("email"),
                            resultSet.getString("password"),
                            resultSet.getString("user_type")
                    );
                }
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        if (user == null) {
            return null;
        }

        switch (user.getRole()) {
            case "admin":
                return new Admin(
                        user.getId(),
                        user.getName(),
                        user.getEmail(),
                        user.getPassword(),
                        user.getRole()
                );

            case "moderator":
                String sqlMod = "SELECT subject_owner FROM moderator WHERE id_moderator = ?;";

                try (Connection connection2 = DBConnection.connect();
                     PreparedStatement preparedStatement2 = connection2.prepareStatement(sqlMod);
                ) {
                    preparedStatement2.setInt(1, user.getId());
                    try (ResultSet resultSet2 = preparedStatement2.executeQuery()) {

                        if (resultSet2.next()) {
                            return new Moderator(
                                    user.getId(), user.getName(), user.getEmail(), user.getPassword(), user.getRole(),
                                    resultSet2.getString("subject_owner"));
                        }
                    }

                } catch (SQLException e) {
                    System.out.println(e.getMessage());
                }

            case "student":
                String sqlStudent = "SELECT level, xp FROM student WHERE id_student = ?;";

                try (Connection connection2 = DBConnection.connect();
                     PreparedStatement preparedStatement2 = connection2.prepareStatement(sqlStudent);
                ) {
                    preparedStatement2.setInt(1, user.getId());
                    try (ResultSet resultSet2 = preparedStatement2.executeQuery()) {

                        if (resultSet2.next()) {
                            return new Student(
                                    user.getId(), user.getName(), user.getEmail(), user.getPassword(), user.getRole(),
                                    resultSet2.getInt("level"),
                                    resultSet2.getInt("xp")
                            );
                        }
                    }

                } catch (SQLException e) {
                    System.out.println(e.getMessage());
                }
        }
        return user;
    }

    public ArrayList<User> getUserList() {
        ArrayList<User> userList = new ArrayList<>();

        String sql = "SELECT u.id_user, u.name, u.email, u.password, u.user_type, " +
                "a.id_admin, m.subject_owner, s.level, s.xp " +
                "FROM users u " +
                "LEFT JOIN admin a ON u.id_user = a.id_admin " +
                "LEFT JOIN moderator m ON u.id_user = m.id_moderator " +
                "LEFT JOIN student s ON u.id_user = s.id_student";

        try (Connection connection = DBConnection.connect();
             PreparedStatement preparedStatement = connection.prepareStatement(sql);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {

                String userType = resultSet.getString("user_type");

                switch (userType.toLowerCase()) {

                    case "admin":
                        userList.add(new Admin(
                                resultSet.getInt("id_user"),
                                resultSet.getString("name"),
                                resultSet.getString("email"),
                                resultSet.getString("password"),
                                userType
                        ));
                        break;

                    case "moderator":
                        userList.add(new Moderator(
                                resultSet.getInt("id_user"),
                                resultSet.getString("name"),
                                resultSet.getString("email"),
                                resultSet.getString("password"),
                                userType,
                                resultSet.getString("subject_owner")
                        ));
                        break;

                    case "student":
                        userList.add(new Student(
                                resultSet.getInt("id_user"),
                                resultSet.getString("name"),
                                resultSet.getString("email"),
                                resultSet.getString("password"),
                                userType,
                                resultSet.getInt("level"),
                                resultSet.getInt("xp")
                        ));
                        break;
                }
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return userList;
    }

    public User getUserById(int id) {
        User user = null;

        String sql =
                "SELECT " +
                        "u.id_user, u.name, u.email, u.password, u.user_type, " +
                        "m.subject_owner, " +
                        "s.level, s.xp " +
                        "FROM users u " +
                        "LEFT JOIN moderator m ON u.id_user = m.id_moderator " +
                        "LEFT JOIN student s ON u.id_user = s.id_student " +
                        "WHERE u.id_user = ?";

        try (Connection connection = DBConnection.connect();
             PreparedStatement preparedStatement = connection.prepareStatement(sql);
        ) {

            preparedStatement.setInt(1, id);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {

                if (!resultSet.next()) {
                    return null;
                }

                String userType = resultSet.getString("user_type");

                switch (userType) {
                    case "admin":
                        return new Admin(
                                resultSet.getInt("id_user"),
                                resultSet.getString("name"),
                                resultSet.getString("email"),
                                resultSet.getString("password"),
                                userType
                        );

                    case "moderator":
                        return new Moderator(
                                resultSet.getInt("id_user"),
                                resultSet.getString("name"),
                                resultSet.getString("email"),
                                resultSet.getString("password"),
                                userType,
                                resultSet.getString("subject_owner")
                        );

                    // TODO : FILTRAR OS TÓPICOS DE ESTUDANTE JUNTO AO PUXAR ELE
                    case "student":
                        return new Student(
                                resultSet.getInt("id_user"),
                                resultSet.getString("name"),
                                resultSet.getString("email"),
                                resultSet.getString("password"),
                                userType,
                                resultSet.getInt("level"),
                                resultSet.getInt("xp")
                        );
                }
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public void updateById(User user) {
        String sql = "UPDATE users SET name = ?, email = ?, password = ? WHERE id_user = ?;";

        try (Connection connection = DBConnection.connect();
             PreparedStatement preparedStatement = connection.prepareStatement(sql);
        ) {

            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getPassword());
            preparedStatement.setInt(4, user.getId());

            int linesAffected = preparedStatement.executeUpdate();

            if (linesAffected > 0) {
                System.out.println("User atualizado");
            } else {
                System.out.println("Nenhum usuário atualizado");
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void updateByEmail(User user) {
        String sql = "UPDATE users SET name = ?, password = ? WHERE id_user = ?;";

        try (Connection connection = DBConnection.connect();
             PreparedStatement preparedStatement = connection.prepareStatement(sql);
        ) {

            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getPassword());
            preparedStatement.setInt(4, user.getId());

            int linesAffected = preparedStatement.executeUpdate();

            if (linesAffected > 0) {
                System.out.println("User atualizado");
            } else {
                System.out.println("Nenhum usuário atualizado");
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void deleteUserById(int id) {
        String sql = "DELETE FROM users WHERE id_user = ?;";

        try (Connection connection = DBConnection.connect();
             PreparedStatement preparedStatement = connection.prepareStatement(sql);
        ) {

            preparedStatement.setInt(1, id);
            int linesAffected = preparedStatement.executeUpdate();

            if (linesAffected > 0) {
                System.out.println("user deletado");
            } else {
                System.out.println("Erro ao excluir");
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void deleteUserByEmail(String email) {
        String sql = "DELETE FROM users WHERE email = ?;";

        try (Connection connection = DBConnection.connect();
             PreparedStatement preparedStatement = connection.prepareStatement(sql);
        ) {

            preparedStatement.setString(1, email);
            int linesAffected = preparedStatement.executeUpdate();

            if (linesAffected > 0) {
                System.out.println("user deletado");
            } else {
                System.out.println("Erro ao excluir");
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
}

