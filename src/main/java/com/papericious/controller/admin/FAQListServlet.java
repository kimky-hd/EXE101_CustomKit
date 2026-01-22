package com.papericious.controller.admin;

import com.papericious.dao.FAQDAO;
import com.papericious.model.FAQ;
import com.papericious.model.FAQCategory;
import com.papericious.model.Account;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "FAQListServlet", value = "/admin/faq")
public class FAQListServlet extends HttpServlet {
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

        String search = request.getParameter("search");
        String status = request.getParameter("status");
        String categoryId = request.getParameter("categoryId");
        
        // Handle delete action
        String action = request.getParameter("action");
        if ("delete".equals(action)) {
            String idStr = request.getParameter("id");
            if (idStr != null) {
                try {
                    int id = Integer.parseInt(idStr);
                    faqDAO.deleteFAQ(id);
                    response.sendRedirect(request.getContextPath() + "/admin/faq");
                    return;
                } catch (NumberFormatException e) {
                    e.printStackTrace();
                }
            }
        }

        List<FAQ> faqList = faqDAO.searchFAQs(search, status, categoryId);
        List<FAQCategory> categories = faqDAO.getAllCategories();

        request.setAttribute("faqList", faqList);
        request.setAttribute("categories", categories);
        
        request.setAttribute("paramSearch", search);
        request.setAttribute("paramStatus", status);
        request.setAttribute("paramCategoryId", categoryId);

        request.getRequestDispatcher("/admin/admin-faq-list.jsp").forward(request, response);
    }
}
