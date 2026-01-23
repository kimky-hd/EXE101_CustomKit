package com.papericious.filter;

import com.papericious.model.Account;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter(filterName = "AdminAuthFilter", urlPatterns = {"/admin/*"})
public class AdminAuthFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);

        Account account = (session != null) ? (Account) session.getAttribute("currentUser") : null;

        if (account == null || !"ADMIN".equalsIgnoreCase(account.getRole())) {
            // Not authorized or not logged in
            res.sendRedirect(req.getContextPath() + "/index.jsp");
            return;
        }

        chain.doFilter(request, response);
    }
}
