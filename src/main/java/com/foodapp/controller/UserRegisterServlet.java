
package com.foodapp.controller;

import java.io.IOException;

import com.foodapp.dao.UserDAO;
import com.foodapp.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class UserRegisterServlet extends HttpServlet {

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

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        if (name == null || email == null || password == null
                || name.trim().isEmpty()
                || email.trim().isEmpty()
                || password.isEmpty()) {

            response.sendRedirect(
                request.getContextPath() + "/register.jsp?error=empty");
            return;
        }

        User user = new User();

        user.setName(name.trim());
        user.setEmail(email.trim());
        user.setPassword(password);
        user.setPhone(phone);
        user.setAddress(address);
        user.setRole("CUSTOMER");

        boolean registered = userDAO.registerUser(user);

        if (registered) {
            response.sendRedirect(
                request.getContextPath() + "/login.jsp?success=registered");
        } else {
            response.sendRedirect(
                request.getContextPath() + "/register.jsp?error=failed");
        }
    }
}
