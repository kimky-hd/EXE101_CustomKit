package com.papericious.model;

import java.sql.Timestamp;

public class ContactMessage {
    private int id;
    private String fullName;
    private String email;
    private String subject;
    private String message;
    private Integer accountId; // Can be null
    private Timestamp createdAt;

    public ContactMessage() {
    }

    public ContactMessage(String fullName, String email, String subject, String message, Integer accountId) {
        this.fullName = fullName;
        this.email = email;
        this.subject = subject;
        this.message = message;
        this.accountId = accountId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Integer getAccountId() {
        return accountId;
    }

    public void setAccountId(Integer accountId) {
        this.accountId = accountId;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    @Override
    public String toString() {
        return "ContactMessage{" +
                "id=" + id +
                ", fullName='" + fullName + '\'' +
                ", email='" + email + '\'' +
                ", subject='" + subject + '\'' +
                ", message='" + message + '\'' +
                ", accountId=" + accountId +
                ", createdAt=" + createdAt +
                '}';
    }
}
