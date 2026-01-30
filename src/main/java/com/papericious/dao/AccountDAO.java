package com.papericious.dao;

import com.papericious.model.Account;
import com.papericious.util.PasswordUtil;

import java.sql.*;
import java.time.LocalDateTime;

public class AccountDAO {

    private final DBContext dbContext = new DBContext();

    public Account findByEmail(String email) {
        String sql = "SELECT id, email, password_hash, full_name, phone, role, status, created_at, updated_at " +
                "FROM account WHERE email = ?";
        try (Connection conn = dbContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, email);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return mapRow(rs);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean emailExists(String email) {
        String sql = "SELECT 1 FROM account WHERE email = ?";
        try (Connection conn = dbContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, email);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public Account create(String email,
                          String plainPassword,
                          String fullName,
                          String phone) throws SQLException {

        String sql = "INSERT INTO account (email, password_hash, full_name, phone, role, status) " +
                "VALUES (?, ?, ?, ?, ?, ?)";

        String passwordHash = PasswordUtil.hashPassword(plainPassword);

        return executeInsert(email, passwordHash, fullName, phone, sql);
    }

    public Account createGoogleAccount(String email, String fullName, String picture) throws SQLException {
        String sql = "INSERT INTO account (email, password_hash, full_name, role, status) " +
                "VALUES (?, ?, ?, ?, ?)";
        // Use a placeholder for password_hash that won't match any real password hash
        String passwordHash = "GOOGLE_LOGIN";

        try (Connection conn = dbContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setString(1, email);
            ps.setString(2, passwordHash);
            ps.setString(3, fullName);
            ps.setString(4, "USER");
            ps.setString(5, "ACTIVE");

            int affected = ps.executeUpdate();
            if (affected == 0) {
                throw new SQLException("Creating account failed, no rows affected.");
            }

            try (ResultSet keys = ps.getGeneratedKeys()) {
                if (keys.next()) {
                    int id = keys.getInt(1);
                    Account acc = new Account();
                    acc.setId(id);
                    acc.setEmail(email);
                    acc.setPasswordHash(passwordHash);
                    acc.setFullName(fullName);
                    acc.setRole("USER");
                    acc.setStatus("ACTIVE");
                    acc.setCreatedAt(LocalDateTime.now());
                    acc.setUpdatedAt(LocalDateTime.now());
                    return acc;
                }
            }
        }
        throw new SQLException("Creating google account failed, no ID obtained.");
    }

    private Account executeInsert(String email, String passwordHash, String fullName, String phone, String sql) throws SQLException {
        try (Connection conn = dbContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setString(1, email);
            ps.setString(2, passwordHash);
            ps.setString(3, fullName);
            ps.setString(4, phone);
            ps.setString(5, "USER");
            ps.setString(6, "ACTIVE");

            int affected = ps.executeUpdate();
            if (affected == 0) {
                throw new SQLException("Creating account failed, no rows affected.");
            }

            try (ResultSet keys = ps.getGeneratedKeys()) {
                if (keys.next()) {
                    int id = keys.getInt(1);
                    Account acc = new Account();
                    acc.setId(id);
                    acc.setEmail(email);
                    acc.setPasswordHash(passwordHash);
                    acc.setFullName(fullName);
                    acc.setPhone(phone);
                    acc.setRole("USER");
                    acc.setStatus("ACTIVE");
                    acc.setCreatedAt(LocalDateTime.now());
                    acc.setUpdatedAt(LocalDateTime.now());
                    return acc;
                }
            }
        }
        throw new SQLException("Creating account failed, no ID obtained.");
    }

    private Account mapRow(ResultSet rs) throws SQLException {
        Account acc = new Account();
        acc.setId(rs.getInt("id"));
        acc.setEmail(rs.getString("email"));
        acc.setPasswordHash(rs.getString("password_hash"));
        acc.setFullName(rs.getString("full_name"));
        acc.setPhone(rs.getString("phone"));
        acc.setRole(rs.getString("role"));
        acc.setStatus(rs.getString("status"));

        Timestamp created = rs.getTimestamp("created_at");
        Timestamp updated = rs.getTimestamp("updated_at");
        if (created != null) {
            acc.setCreatedAt(created.toLocalDateTime());
        }
        if (updated != null) {
            acc.setUpdatedAt(updated.toLocalDateTime());
        }
        return acc;
    }
}