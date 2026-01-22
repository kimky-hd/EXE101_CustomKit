package com.papericious.dao;

import com.papericious.model.FAQ;
import com.papericious.model.FAQCategory;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class FAQDAO {
    private final DBContext dbContext = new DBContext();

    public List<FAQ> getAllFAQs() {
        List<FAQ> list = new ArrayList<>();
        String sql = "SELECT f.*, c.name as category_name, a.full_name as creator_name " +
                     "FROM faq f " +
                     "LEFT JOIN faq_category c ON f.category_id = c.id " +
                     "LEFT JOIN account a ON f.created_by = a.id " +
                     "ORDER BY f.created_at DESC";
        try (Connection conn = dbContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                list.add(mapRow(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<FAQ> searchFAQs(String keyword, String status, String categoryIdStr) {
        List<FAQ> list = new ArrayList<>();
        StringBuilder sql = new StringBuilder(
                "SELECT f.*, c.name as category_name, a.full_name as creator_name " +
                "FROM faq f " +
                "LEFT JOIN faq_category c ON f.category_id = c.id " +
                "LEFT JOIN account a ON f.created_by = a.id " +
                "WHERE 1=1 ");

        List<Object> params = new ArrayList<>();

        if (keyword != null && !keyword.trim().isEmpty()) {
            sql.append("AND (f.question LIKE ? OR f.answer LIKE ?) ");
            params.add("%" + keyword.trim() + "%");
            params.add("%" + keyword.trim() + "%");
        }

        if (status != null && !status.trim().isEmpty()) {
            sql.append("AND f.status = ? ");
            params.add(status);
        }

        if (categoryIdStr != null && !categoryIdStr.trim().isEmpty()) {
            try {
                int catId = Integer.parseInt(categoryIdStr);
                sql.append("AND f.category_id = ? ");
                params.add(catId);
            } catch (NumberFormatException e) {
                // Ignore invalid category ID
            }
        }

        sql.append("ORDER BY f.created_at DESC");

        try (Connection conn = dbContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql.toString())) {
            
            for (int i = 0; i < params.size(); i++) {
                ps.setObject(i + 1, params.get(i));
            }

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(mapRow(rs));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public FAQ getFAQById(int id) {
        String sql = "SELECT f.*, c.name as category_name, a.full_name as creator_name " +
                     "FROM faq f " +
                     "LEFT JOIN faq_category c ON f.category_id = c.id " +
                     "LEFT JOIN account a ON f.created_by = a.id " +
                     "WHERE f.id = ?";
        try (Connection conn = dbContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
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

    public boolean insertFAQ(FAQ faq) {
        String sql = "INSERT INTO faq (question, answer, status, category_id, created_by, created_at, updated_at) " +
                     "VALUES (?, ?, ?, ?, ?, NOW(), NOW())";
        try (Connection conn = dbContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, faq.getQuestion());
            ps.setString(2, faq.getAnswer());
            ps.setString(3, faq.getStatus());
            ps.setInt(4, faq.getCategoryId());
            if (faq.getCreatedBy() != null) {
                ps.setInt(5, faq.getCreatedBy());
            } else {
                ps.setNull(5, Types.INTEGER);
            }
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateFAQ(FAQ faq) {
        String sql = "UPDATE faq SET question = ?, answer = ?, status = ?, category_id = ?, updated_at = NOW() " +
                     "WHERE id = ?";
        try (Connection conn = dbContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, faq.getQuestion());
            ps.setString(2, faq.getAnswer());
            ps.setString(3, faq.getStatus());
            ps.setInt(4, faq.getCategoryId());
            ps.setInt(5, faq.getId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteFAQ(int id) {
        String sql = "DELETE FROM faq WHERE id = ?";
        try (Connection conn = dbContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<FAQCategory> getAllCategories() {
        List<FAQCategory> list = new ArrayList<>();
        String sql = "SELECT * FROM faq_category";
        try (Connection conn = dbContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                FAQCategory cat = new FAQCategory();
                cat.setId(rs.getInt("id"));
                cat.setName(rs.getString("name"));
                cat.setDescription(rs.getString("description"));
                list.add(cat);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    private FAQ mapRow(ResultSet rs) throws SQLException {
        FAQ faq = new FAQ();
        faq.setId(rs.getInt("id"));
        faq.setQuestion(rs.getString("question"));
        faq.setAnswer(rs.getString("answer"));
        faq.setStatus(rs.getString("status"));
        faq.setCategoryId(rs.getInt("category_id"));
        faq.setCreatedBy(rs.getObject("created_by") != null ? rs.getInt("created_by") : null);
        
        Timestamp createdAt = rs.getTimestamp("created_at");
        if (createdAt != null) faq.setCreatedAt(createdAt.toLocalDateTime());
        
        Timestamp updatedAt = rs.getTimestamp("updated_at");
        if (updatedAt != null) faq.setUpdatedAt(updatedAt.toLocalDateTime());
        
        // Joined fields
        try {
            faq.setCategoryName(rs.getString("category_name"));
            faq.setCreatedByName(rs.getString("creator_name"));
        } catch (SQLException e) {
            // Use defaults or ignore if columns missing
        }
        return faq;
    }
}
