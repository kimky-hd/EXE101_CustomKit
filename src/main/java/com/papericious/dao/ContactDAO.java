package com.papericious.dao;

import com.papericious.model.ContactMessage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Types;

public class ContactDAO {

    public boolean insertMessage(ContactMessage msg) {
        String sql = "INSERT INTO contact_message (full_name, email, subject, message, account_id) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, msg.getFullName());
            ps.setString(2, msg.getEmail());
            ps.setString(3, msg.getSubject());
            ps.setString(4, msg.getMessage());

            if (msg.getAccountId() != null) {
                ps.setInt(5, msg.getAccountId());
            } else {
                ps.setNull(5, Types.INTEGER);
            }

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
