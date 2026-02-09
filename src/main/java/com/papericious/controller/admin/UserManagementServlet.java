package com.papericious.controller.admin;

import com.papericious.dao.AccountDAO;
import com.papericious.model.Account;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "UserManagementServlet", urlPatterns = {"/admin/users"})
public class UserManagementServlet extends HttpServlet {
    private final AccountDAO accountDAO = new AccountDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Account user = (Account) session.getAttribute("currentUser");
        if (user == null || !"ADMIN".equals(user.getRole())) {
            resp.sendRedirect(req.getContextPath() + "/index.jsp");
            return;
        }

        try {
            List<Account> accounts = accountDAO.findAll();
            req.setAttribute("accounts", accounts);
        } catch (SQLException e) {
            e.printStackTrace();
            req.setAttribute("errorMessage", "Error retrieving accounts: " + e.getMessage());
            // We still forward, so the page loads (with error message)
        }
        req.getRequestDispatcher("/admin/user-list.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Account user = (Account) session.getAttribute("currentUser");
        if (user == null || !"ADMIN".equals(user.getRole())) {
            resp.sendRedirect(req.getContextPath() + "/index.jsp");
            return;
        }

        String action = req.getParameter("action");
        if (action == null) {
            resp.sendRedirect(req.getContextPath() + "/admin/users");
            return;
        }

        try {
            switch (action) {
                case "create":
                    createUser(req, resp);
                    break;
                case "update":
                    updateUser(req, resp);
                    break;
                case "delete":
                    deleteUser(req, resp);
                    break;
                default:
                    resp.sendRedirect(req.getContextPath() + "/admin/users");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            req.getSession().setAttribute("errorMessage", "Database error: " + e.getMessage());
            resp.sendRedirect(req.getContextPath() + "/admin/users");
        }
    }

    private void createUser(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException {
        String email = req.getParameter("email");
        String fullName = req.getParameter("fullName");
        String phone = req.getParameter("phone");
        String password = req.getParameter("password");
        // Role and Status typically default to USER and ACTIVE, but admin might want to specify
        
        if (accountDAO.emailExists(email)) {
            req.getSession().setAttribute("errorMessage", "Email already exists.");
            resp.sendRedirect(req.getContextPath() + "/admin/users");
            return;
        }

        accountDAO.create(email, password, fullName, phone);
        req.getSession().setAttribute("successMessage", "User created successfully.");
        resp.sendRedirect(req.getContextPath() + "/admin/users");
    }

    private void updateUser(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String fullName = req.getParameter("fullName");
        String phone = req.getParameter("phone");
        String role = req.getParameter("role");
        String status = req.getParameter("status");

        Account account = accountDAO.findById(id);
        if (account != null) {
            account.setFullName(fullName);
            account.setPhone(phone);
            account.setRole(role);
            account.setStatus(status);
            accountDAO.update(account);
            req.getSession().setAttribute("successMessage", "User updated successfully.");
        } else {
            req.getSession().setAttribute("errorMessage", "User not found.");
        }
        resp.sendRedirect(req.getContextPath() + "/admin/users");
    }

    private void deleteUser(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        accountDAO.delete(id);
        req.getSession().setAttribute("successMessage", "User deleted successfully.");
        resp.sendRedirect(req.getContextPath() + "/admin/users");
    }
}
