package com.kairos.controller;

import com.kairos.dao.AdminDAO;
import com.kairos.dao.ModeratorDAO;
import com.kairos.dao.StudentDAO;
import org.mindrot.jbcrypt.BCrypt;
import com.kairos.model.User;
import com.kairos.dao.UserDAO;

import java.util.List;
import java.util.Set;

public class UserController {
    private UserDAO userDAO;
    private AdminDAO adminDAO;
    private StudentDAO studentDAO;
    private ModeratorDAO moderatorDAO;

    public UserController() {
        userDAO = new UserDAO();
        adminDAO = new AdminDAO();
        studentDAO = new StudentDAO();
        moderatorDAO = new ModeratorDAO();
    }

    public void register(String name, String email, String passwordTyped, String role, String responsibleDiscipline) {
        Set<String> roles = Set.of("admin", "moderator", "student");

        if (name == null || email == null || passwordTyped == null ||
                name.isBlank() || email.isBlank() || passwordTyped.isBlank()) {
            return;
        }

        if (name.length() > 100 || email.length() > 100 || passwordTyped.length() > 100) {
            return;
        }

        if (!roles.contains(role)) {
            return;
        }

        if (role.equals("moderator") && (responsibleDiscipline == null || responsibleDiscipline.isBlank())) {
            return;
        }

        String password = BCrypt.hashpw(passwordTyped, BCrypt.gensalt(12));

        User user = new User(name, email, password, role);
        int userId = userDAO.insert(user);

        if (userId == -1) {
            return;
        }

        switch (role) {
            case "admin":
                adminDAO.insert(userId);
                break;

            case "moderator":
                moderatorDAO.insert(userId, responsibleDiscipline);
                break;

            case "student":
                studentDAO.insert(userId);
                break;
        }
    }

    public User getUserByEmail(String email) {
        if (email.isBlank()) {
            return null;
        }

        return userDAO.getByEmail(email);
    }

    public User login(String email, String passwordTyped) {
        if (email == null || passwordTyped == null ||
                email.isBlank() || passwordTyped.isBlank()) {
            return null;
        }

        User user = this.getUserByEmail(email);
        if (user == null) {
            return null;
        }

        if (!BCrypt.checkpw(passwordTyped, user.getPassword())) {
            return null;
        }

        return user;
    }

    public User getUserById(int id) {
        return userDAO.getById(id);
    }

    public List<User> userList() {
        return userDAO.getAll();
    }

    public void updateName(int id, String newName) {
        User user = this.getUserById(id);

        if (newName == null || newName.isBlank() || newName.length() > 100) {
            return;
        }

        user.setName(newName);

        userDAO.update(user);
    }

    public void updateEmail(int id, String newEmail) {
        User user = this.getUserById(id);

        if (newEmail == null || newEmail.isBlank() || newEmail.length() > 100) {
            return;
        }

        user.setEmail(newEmail);

        userDAO.update(user);
    }

    public void updatePassword(String email, String newPassword) {
        User user = this.getUserByEmail(email);

        if (newPassword == null || newPassword.isBlank() || newPassword.length() > 100) {
            return;
        }

        user.setPassword(BCrypt.hashpw(newPassword, BCrypt.gensalt(12)));

        userDAO.update(user);
    }

    public void deleteUserById(int id) {
        userDAO.delete(id);
    }

    public void deleteUserByEmail(String email) {
        userDAO.delete(userDAO.getByEmail(email).getId());
    }
}