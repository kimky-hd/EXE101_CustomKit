package com.papericious.controller;

import com.papericious.dao.AccountDAO;
import com.papericious.model.Account;
import com.papericious.util.PasswordUtil;
import com.papericious.util.ValidationUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

    private final AccountDAO accountDAO = new AccountDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (email != null) email = email.trim();

        // Set attribute for repopulation
        request.setAttribute("loginEmail", email);

        if (email == null || email.isBlank() || password == null || password.isBlank()) {
            request.setAttribute("loginError", "Vui lòng nhập đầy đủ email và mật khẩu.");
            request.setAttribute("openAuthModal", "login");
            request.getRequestDispatcher("index.jsp").forward(request, response);
            return;
        }

        if (!ValidationUtil.isValidEmail(email)) {
            request.setAttribute("loginError", "Email không đúng định dạng.");
            request.setAttribute("openAuthModal", "login");
            request.getRequestDispatcher("index.jsp").forward(request, response);
            return;
        }

        Account account = accountDAO.findByEmail(email);
        if (account == null || !"ACTIVE".equalsIgnoreCase(account.getStatus())
                || !PasswordUtil.verifyPassword(password, account.getPasswordHash())) {
            request.setAttribute("loginError", "Email hoặc mật khẩu không đúng, hoặc tài khoản đang bị khóa.");
            request.setAttribute("openAuthModal", "login");
            request.getRequestDispatcher("index.jsp").forward(request, response);
            return;
        }

        // Đăng nhập thành công
        account.setPasswordHash(null); // không giữ hash trong session
        HttpSession session = request.getSession(true);
        session.setAttribute("currentUser", account);

        response.sendRedirect("index.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        response.sendRedirect("index.jsp");
    }
}
