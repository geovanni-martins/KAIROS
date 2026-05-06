package com.kairos.dao;

import  java.sql.Connection;
//import  com.kairos.dao.DBConnection;

public class TestConnectionDB {
    public static void main(String[] args) {
        try {
            Connection conn = DBConnection.connect();
            System.out.println("Conectado com sucesso!");
            conn.close();
        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
