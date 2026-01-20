package com.papericious.controller;

import com.papericious.dao.AccountDAO;
import com.papericious.model.Account;
import com.papericious.util.ValidationUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "RegisterServlet", urlPatterns = {"/register"})
public class RegisterServlet extends HttpServlet {

    private final AccountDAO accountDAO = new AccountDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        if (fullName != null) fullName = fullName.trim();
        if (email != null) email = email.trim();
        if (phone != null) phone = phone.trim();

        // Use Session to store temp data for redirect
        HttpSession session = request.getSession();
        session.setAttribute("regFullName", fullName);
        session.setAttribute("regEmail", email);
        session.setAttribute("regPhone", phone);

        if (fullName == null || fullName.isBlank()
                || email == null || email.isBlank()
                || password == null || password.isBlank()
                || confirmPassword == null || confirmPassword.isBlank()) {

            session.setAttribute("registerError", "Vui lòng nhập đầy đủ các trường bắt buộc.");
            session.setAttribute("openAuthModal", "register");
            response.sendRedirect("index.jsp");
            return;
        }

        if (!ValidationUtil.isValidEmail(email)) {
            session.setAttribute("registerError", "Email không hợp lệ (ví dụ: user@example.com).");
            session.setAttribute("openAuthModal", "register");
            response.sendRedirect("index.jsp");
            return;
        }

        if (!ValidationUtil.isValidPhoneNumber(phone)) {
            session.setAttribute("registerError", "Số điện thoại không hợp lệ (phải có 10-11 số).");
            session.setAttribute("openAuthModal", "register");
            response.sendRedirect("index.jsp");
            return;
        }

        if (!password.equals(confirmPassword)) {
            session.setAttribute("registerError", "Mật khẩu xác nhận không khớp.");
            session.setAttribute("openAuthModal", "register");
            response.sendRedirect("index.jsp");
            return;
        }

        if (!ValidationUtil.isValidPassword(password)) {
            session.setAttribute("registerError", "Mật khẩu phải có ít nhất 8 ký tự, bao gồm cả chữ và số.");
            session.setAttribute("openAuthModal", "register");
            response.sendRedirect("index.jsp");
            return;
        }

        if (accountDAO.emailExists(email)) {
            session.setAttribute("registerError", "Email đã được sử dụng. Vui lòng chọn email khác.");
            session.setAttribute("openAuthModal", "register");
            response.sendRedirect("index.jsp");
            return;
        }

        try {
            Account acc = accountDAO.create(email, password, fullName, phone);
            acc.setPasswordHash(null);
            
            // Register success: clear temp data
            session.removeAttribute("regFullName");
            session.removeAttribute("regEmail");
            session.removeAttribute("regPhone");
            session.removeAttribute("registerError");
            session.removeAttribute("openAuthModal");
            
            session.setAttribute("currentUser", acc);

            response.sendRedirect("index.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            String msg;
            int code = e.getErrorCode();
            String state = e.getSQLState();
            if (code == 1062) {
                msg = "Email đã được sử dụng. Vui lòng chọn email khác.";
            } else if (code == 1045) {
                msg = "Không thể kết nối CSDL: Sai tài khoản/mật khẩu DB (root).";
            } else if (code == 1049) {
                msg = "Cơ sở dữ liệu 'kisskit_db' chưa tồn tại. Vui lòng tạo DB trước.";
            } else if ("42S02".equals(state)) {
                msg = "Bảng 'account' chưa tồn tại trong cơ sở dữ liệu.";
            } else if ("08S01".equals(state)) {
                msg = "Không thể kết nối CSDL (mất kết nối hoặc host sai).";
            } else {
                msg = "Có lỗi xảy ra khi tạo tài khoản. Vui lòng thử lại.";
            }
            session.setAttribute("registerError", msg);
            session.setAttribute("openAuthModal", "register");
            response.sendRedirect("index.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        response.sendRedirect("index.jsp");
    }
}
