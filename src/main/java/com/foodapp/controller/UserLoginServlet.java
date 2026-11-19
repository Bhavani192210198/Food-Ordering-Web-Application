
package com.foodapp.controller;

import java.io.IOException;

import com.foodapp.dao.UserDAO;
import com.foodapp.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class UserLoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private UserDAO userDAO;

    @Override
    public void init() {
        userDAO = new UserDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
                          throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (email == null || password == null
                || email.trim().isEmpty()
                || password.trim().isEmpty()) {

            response.sendRedirect(
                request.getContextPath() + "/login.jsp?error=empty");
            return;
        }

        User user = userDAO.getUserByEmail(email.trim());

        // Temporary basic check.
        // Secure password hashing must be implemented before production use.
        if (user != null && password.equals(user.getPassword())) {

            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            response.sendRedirect(
                request.getContextPath() + "/restaurants");

        } else {

            response.sendRedirect(
                request.getContextPath() + "/login.jsp?error=invalid");
        }
    }
}
