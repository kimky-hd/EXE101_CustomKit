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

        // Set attributes for repopulation in case of error
        request.setAttribute("regFullName", fullName);
        request.setAttribute("regEmail", email);
        request.setAttribute("regPhone", phone);

        if (fullName == null || fullName.isBlank()
                || email == null || email.isBlank()
                || password == null || password.isBlank()
                || confirmPassword == null || confirmPassword.isBlank()) {

            request.setAttribute("registerError", "Vui lòng nhập đầy đủ các trường bắt buộc.");
            request.setAttribute("openAuthModal", "register");
            request.getRequestDispatcher("index.jsp").forward(request, response);
            return;
        }

        if (!ValidationUtil.isValidEmail(email)) {
            request.setAttribute("registerError", "Email không hợp lệ (ví dụ: user@example.com).");
            request.setAttribute("openAuthModal", "register");
            request.getRequestDispatcher("index.jsp").forward(request, response);
            return;
        }

        if (!ValidationUtil.isValidPhoneNumber(phone)) {
            request.setAttribute("registerError", "Số điện thoại không hợp lệ (phải có 10-11 số).");
            request.setAttribute("openAuthModal", "register");
            request.getRequestDispatcher("index.jsp").forward(request, response);
            return;
        }

        if (!password.equals(confirmPassword)) {
            request.setAttribute("registerError", "Mật khẩu xác nhận không khớp.");
            request.setAttribute("openAuthModal", "register");
            request.getRequestDispatcher("index.jsp").forward(request, response);
            return;
        }

        if (!ValidationUtil.isValidPassword(password)) {
            request.setAttribute("registerError", "Mật khẩu phải có ít nhất 8 ký tự, bao gồm cả chữ và số.");
            request.setAttribute("openAuthModal", "register");
            request.getRequestDispatcher("index.jsp").forward(request, response);
            return;
        }

        if (accountDAO.emailExists(email)) {
            request.setAttribute("registerError", "Email đã được sử dụng. Vui lòng chọn email khác.");
            request.setAttribute("openAuthModal", "register");
            request.getRequestDispatcher("index.jsp").forward(request, response);
            return;
        }

        try {
            Account acc = accountDAO.create(email, password, fullName, phone);
            acc.setPasswordHash(null);
            HttpSession session = request.getSession(true);
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
            request.setAttribute("registerError", msg);
            request.setAttribute("openAuthModal", "register");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        response.sendRedirect("index.jsp");
    }
}
