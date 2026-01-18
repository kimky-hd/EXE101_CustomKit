package com.papericious.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBContext {
    private final String url = "jdbc:mysql://localhost:3306/kisskit_db?useSSL=false&allowPublicKeyRetrieval=true&useUnicode=true&characterEncoding=utf8&serverTimezone=UTC";
    private final String user = "root";
    private final String password = "1234";

    public Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException(e);
        }
        return DriverManager.getConnection(url, user, password);
    }

    public static void main(String[] args) {
        DBContext db = new DBContext();
        try (Connection connection = db.getConnection()) {
            System.out.println("Connected to database: " + connection.getCatalog());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
