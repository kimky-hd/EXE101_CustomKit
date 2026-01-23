package com.papericious.controller.admin;

import com.papericious.dao.ContactDAO;
import com.papericious.model.ContactMessage;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "ContactDetailServlet", urlPatterns = {"/admin/contact-details"})
public class ContactDetailServlet extends HttpServlet {

    private final ContactDAO contactDAO = new ContactDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idStr = req.getParameter("id");
        if (idStr == null || idStr.isEmpty()) {
            resp.sendRedirect(req.getContextPath() + "/admin/contacts");
            return;
        }

        try {
            int id = Integer.parseInt(idStr);
            ContactMessage msg = contactDAO.getMessageById(id);
            
            if (msg == null) {
                resp.sendRedirect(req.getContextPath() + "/admin/contacts");
                return;
            }

            // Auto-mark as READ if it is NEW when viewed?
            // User requirement didn't specify, but it's good UX.
            // However, let's stick to explicit action or only "Read" means "Seen".
            // Let's NOT auto-update for now to avoid side effects during simple view, 
            // unless user asks. But wait, "view details" implies reading. 
            // I'll leave it manual for now to match the "Mark Read" button existence.

            req.setAttribute("msg", msg);
            req.getRequestDispatcher("/admin/contact-detail.jsp").forward(req, resp);

        } catch (NumberFormatException e) {
            resp.sendRedirect(req.getContextPath() + "/admin/contacts");
        }
    }
}
