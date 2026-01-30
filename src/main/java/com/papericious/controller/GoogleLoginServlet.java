package com.papericious.controller;

import com.papericious.dao.AccountDAO;
import com.papericious.model.Account;
import com.papericious.model.GooglePojo;
import com.papericious.util.GoogleUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "GoogleLoginServlet", urlPatterns = {"/login-google"})
public class GoogleLoginServlet extends HttpServlet {

    private final AccountDAO accountDAO = new AccountDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String code = request.getParameter("code");

        if (code == null || code.isEmpty()) {
            response.sendRedirect("index.jsp?error=google_login_failed");
            return;
        }

        try {
            String accessToken = GoogleUtils.getToken(code);
            GooglePojo googlePojo = GoogleUtils.getUserInfo(accessToken);

            String email = googlePojo.getEmail();
            Account account = accountDAO.findByEmail(email);

            if (account == null) {
                // Register new account automatically
                try {
                    account = accountDAO.createGoogleAccount(email, googlePojo.getName(), googlePojo.getPicture());
                } catch (Exception e) {
                     e.printStackTrace();
                     response.sendRedirect("index.jsp?error=google_register_failed");
                     return;
                }
            } else {
                 if (!"ACTIVE".equalsIgnoreCase(account.getStatus())) {
                     response.sendRedirect("index.jsp?error=account_locked");
                     return;
                 }
            }

            HttpSession session = request.getSession();
            session.setAttribute("currentUser", account);
            response.sendRedirect("index.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("index.jsp?error=google_exception");
        }
    }
}
