package com.papericious.controller;

import com.papericious.dao.ContactDAO;
import com.papericious.model.Account;
import com.papericious.model.ContactMessage;
import com.papericious.util.ValidationUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "ContactServlet", urlPatterns = {"/contact"})
public class ContactServlet extends HttpServlet {

    private final ContactDAO contactDAO = new ContactDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");

        HttpSession session = request.getSession();

        // Basic Validation
        if (name == null || name.isBlank() || email == null || email.isBlank() || 
            subject == null || subject.isBlank() || message == null || message.isBlank()) {
            
            session.setAttribute("contactError", "Vui lòng điền đầy đủ thông tin.");
            // Preserve inputs
            session.setAttribute("contactName", name);
            session.setAttribute("contactEmail", email);
            session.setAttribute("contactSubject", subject);
            session.setAttribute("contactMessage", message);
            
            response.sendRedirect("contact.jsp");
            return;
        }

        if (!ValidationUtil.isValidEmail(email)) {
            session.setAttribute("contactError", "Email không đúng định dạng.");
             // Preserve inputs
            session.setAttribute("contactName", name);
            session.setAttribute("contactEmail", email);
            session.setAttribute("contactSubject", subject);
            session.setAttribute("contactMessage", message);

            response.sendRedirect("contact.jsp");
            return;
        }

        // Create ContactMessage object
        ContactMessage contactMessage = new ContactMessage();
        contactMessage.setFullName(name);
        contactMessage.setEmail(email);
        contactMessage.setSubject(subject);
        contactMessage.setMessage(message);

        // Check if user is logged in
        Account currentUser = (Account) session.getAttribute("currentUser");
        if (currentUser != null) {
            contactMessage.setAccountId(currentUser.getId());
        }

        // Save to database
        boolean success = contactDAO.insertMessage(contactMessage);

        if (success) {
            session.setAttribute("contactSuccess", "Tin nhắn của bạn đã được gửi thành công! Chúng mình sẽ phản hồi sớm nhất có thể.");
            // Clear inputs
            session.removeAttribute("contactName");
            session.removeAttribute("contactEmail");
            session.removeAttribute("contactSubject");
            session.removeAttribute("contactMessage");
            response.sendRedirect("contact.jsp");
        } else {
            session.setAttribute("contactError", "Có lỗi xảy ra khi gửi tin nhắn. Vui lòng thử lại sau.");
            // Preserve inputs
            session.setAttribute("contactName", name);
            session.setAttribute("contactEmail", email);
            session.setAttribute("contactSubject", subject);
            session.setAttribute("contactMessage", message);
            response.sendRedirect("contact.jsp");
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Redirect to contact page if accessed via GET
        response.sendRedirect("contact.jsp");
    }
}
