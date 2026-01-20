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

        HttpSession session = request.getSession();

        if (email == null || email.isBlank() || password == null || password.isBlank()) {
            session.setAttribute("loginError", "Vui lòng nhập đầy đủ email và mật khẩu.");
            session.setAttribute("openAuthModal", "login");
            session.setAttribute("loginEmail", email);
            response.sendRedirect("index.jsp");
            return;
        }

        if (!ValidationUtil.isValidEmail(email)) {
            session.setAttribute("loginError", "Email không đúng định dạng.");
            session.setAttribute("openAuthModal", "login");
            session.setAttribute("loginEmail", email);
            response.sendRedirect("index.jsp");
            return;
        }

        Account account = accountDAO.findByEmail(email);
        if (account == null || !"ACTIVE".equalsIgnoreCase(account.getStatus())
                || !PasswordUtil.verifyPassword(password, account.getPasswordHash())) {
            session.setAttribute("loginError", "Email hoặc mật khẩu không đúng, hoặc tài khoản đang bị khóa.");
            session.setAttribute("openAuthModal", "login");
            session.setAttribute("loginEmail", email);
            response.sendRedirect("index.jsp");
            return;
        }

        // Đăng nhập thành công
        account.setPasswordHash(null); // không giữ hash trong session
        
        // Clean up temporary session attributes
        session.removeAttribute("loginEmail");
        session.removeAttribute("loginError");
        session.removeAttribute("openAuthModal");
        
        session.setAttribute("currentUser", account);

        response.sendRedirect("index.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        response.sendRedirect("index.jsp");
    }
}
