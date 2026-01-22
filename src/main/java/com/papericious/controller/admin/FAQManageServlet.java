package com.papericious.controller.admin;

import com.papericious.dao.FAQDAO;
import com.papericious.model.Account;
import com.papericious.model.FAQ;
import com.papericious.model.FAQCategory;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "FAQManageServlet", value = "/admin/faq/manage")
public class FAQManageServlet extends HttpServlet {
    private final FAQDAO faqDAO = new FAQDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        Account currentUser = (session != null) ? (Account) session.getAttribute("currentUser") : null;

        if (currentUser == null) {
            response.sendRedirect(request.getContextPath() + "/login?message=RequiredLogin");
            return;
        }

        String role = currentUser.getRole();
        if (!"ADMIN".equalsIgnoreCase(role) && !"STAFF".equalsIgnoreCase(role)) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Access Denied");
            return;
        }

        String idStr = request.getParameter("id");
        if (idStr != null && !idStr.isEmpty()) {
            try {
                int id = Integer.parseInt(idStr);
                FAQ faq = faqDAO.getFAQById(id);
                if (faq != null) {
                    request.setAttribute("faq", faq);
                }
            } catch (NumberFormatException e) {
                // Ignore invalid ID
            }
        }

        List<FAQCategory> categories = faqDAO.getAllCategories();
        request.setAttribute("categories", categories);

        request.getRequestDispatcher("/admin/admin-faq-manage.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession(false);
        Account currentUser = (session != null) ? (Account) session.getAttribute("currentUser") : null;

        if (currentUser == null) {
            response.sendRedirect(request.getContextPath() + "/login?message=RequiredLogin");
            return;
        }

        String role = currentUser.getRole();
        if (!"ADMIN".equalsIgnoreCase(role) && !"STAFF".equalsIgnoreCase(role)) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Access Denied");
            return;
        }
        
        String idStr = request.getParameter("id");
        String question = request.getParameter("question");
        String answer = request.getParameter("answer");
        String categoryIdStr = request.getParameter("categoryId");
        String status = request.getParameter("status");
        boolean isPublished = request.getParameter("isPublished") != null; // Checkbox

        // Validation
        if (question == null || question.trim().isEmpty() || answer == null || answer.trim().isEmpty()) {
            request.setAttribute("error", "Question and Answer are required.");
            // Reload data
             List<FAQCategory> categories = faqDAO.getAllCategories();
            request.setAttribute("categories", categories);
            if(idStr != null && !idStr.isEmpty()) {
                 request.setAttribute("faq", faqDAO.getFAQById(Integer.parseInt(idStr)));
            }
            request.getRequestDispatcher("/admin/admin-faq-manage.jsp").forward(request, response);
            return;
        }
        
        // Prepare object
        FAQ faq = new FAQ();
        if (idStr != null && !idStr.isEmpty()) {
            faq.setId(Integer.parseInt(idStr));
        }
        faq.setQuestion(question);
        faq.setAnswer(answer);
        
        if (status == null) {
             faq.setStatus(isPublished ? "PUBLISHED" : "DRAFT");
        } else {
             faq.setStatus(status);
        }
        
        if (categoryIdStr != null && !categoryIdStr.isEmpty()) {
            faq.setCategoryId(Integer.parseInt(categoryIdStr));
        }

        // Set creator - using validated currentUser
        faq.setCreatedBy(currentUser.getId());

        boolean success;
        if (faq.getId() > 0) {
            success = faqDAO.updateFAQ(faq);
        } else {
            success = faqDAO.insertFAQ(faq);
        }

        if (success) {
            response.sendRedirect(request.getContextPath() + "/admin/faq");
        } else {
            request.setAttribute("error", "Database error occurred.");
            doGet(request, response);
        }
    }
}
