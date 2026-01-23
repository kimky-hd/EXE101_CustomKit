package com.papericious.controller.admin;

import com.papericious.dao.ContactDAO;
import com.papericious.model.ContactMessage;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ContactAdminServlet", urlPatterns = {"/admin/contacts"})
public class ContactAdminServlet extends HttpServlet {

    private final ContactDAO contactDAO = new ContactDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<ContactMessage> messages = contactDAO.getAllMessages();
        req.setAttribute("messages", messages);
        req.getRequestDispatcher("/admin/contact-list.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        String idStr = req.getParameter("id");

        if (idStr != null && !idStr.isEmpty()) {
            int id = Integer.parseInt(idStr);
            
            if ("updateStatus".equals(action)) {
                String newStatus = req.getParameter("status"); // NEW, READ, REPLIED
                if (newStatus != null) {
                    contactDAO.updateStatus(id, newStatus);
                }
            } else if ("delete".equals(action)) {
                contactDAO.deleteMessage(id);
            }
        }
        
        resp.sendRedirect(req.getContextPath() + "/admin/contacts");
    }
}
