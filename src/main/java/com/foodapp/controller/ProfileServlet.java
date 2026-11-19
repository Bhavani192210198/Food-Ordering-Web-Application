package com.foodapp.controller;

import java.io.IOException;

import com.foodapp.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // Check whether the user is logged in
        if (session == null ||
                session.getAttribute("user") == null) {

            response.sendRedirect(
                request.getContextPath() + "/login.jsp?error=login"
            );
            return;
        }

        // Get logged-in user details
        User user = (User) session.getAttribute("user");

        request.setAttribute("profileUser", user);

        // Open profile page
        request.getRequestDispatcher("/profile.jsp")
               .forward(request, response);
    }
}