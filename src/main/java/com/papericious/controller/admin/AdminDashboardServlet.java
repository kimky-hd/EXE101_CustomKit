package com.papericious.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AdminDashboardServlet", urlPatterns = {"/admin/dashboard"})
public class AdminDashboardServlet extends HttpServlet {
    
    private final com.papericious.dao.ContactDAO contactDAO = new com.papericious.dao.ContactDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int unreadCount = contactDAO.countNewMessages();
        req.setAttribute("unreadCount", unreadCount);
        req.getRequestDispatcher("/admin/dashboard.jsp").forward(req, resp);
    }
}
