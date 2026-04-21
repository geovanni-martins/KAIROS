package com.kairos.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static final String URL = "jdbc:mysql://localhost:3306/kairosDB";
    private static final String USER = "user";
    private static final String PASSWORD = "";

    public static Connection connect() throws SQLException {
        // DriverManager.getConnection lança SQLException se falhar
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
