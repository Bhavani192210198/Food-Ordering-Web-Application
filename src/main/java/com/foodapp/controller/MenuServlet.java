package com.foodapp.controller;

import java.io.IOException;
import java.util.List;

import com.foodapp.dao.MenuDAO;
import com.foodapp.model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/menu")
public class MenuServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private MenuDAO menuDAO;

    @Override
    public void init() {
        menuDAO = new MenuDAO();
        System.out.println("MenuServlet initialized successfully.");
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
                         throws ServletException, IOException {

        String restaurantIdParam =
                request.getParameter("restaurantId");

        if (restaurantIdParam == null ||
            restaurantIdParam.trim().isEmpty()) {

            response.sendError(
                HttpServletResponse.SC_BAD_REQUEST,
                "Restaurant ID is required."
            );
            return;
        }

        try {

            int restaurantId =
                    Integer.parseInt(restaurantIdParam);

            if (restaurantId <= 0) {
                response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid restaurant ID."
                );
                return;
            }

            List<Menu> menuItems = new java.util.ArrayList<>();

            try {
                menuItems =
                    menuDAO.getMenuByRestaurantIdOrThrow(restaurantId);
            } catch (java.sql.SQLException e) {
                e.printStackTrace();
                request.setAttribute("menuError", e.getMessage());
            }

            System.out.println(
                "MenuServlet: Total menu items = "
                + menuItems.size()
            );

            request.setAttribute("menuItems", menuItems);

            request.setAttribute(
                "restaurantId",
                restaurantId
            );

            request.getRequestDispatcher("/menu.jsp")
                   .forward(request, response);

        } catch (NumberFormatException e) {

            response.sendError(
                HttpServletResponse.SC_BAD_REQUEST,
                "Invalid restaurant ID."
            );
        }
    }
}