package com.foodapp.controller;

import java.io.IOException;

import com.foodapp.dao.MenuDAO;
import com.foodapp.model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/food-details")
public class FoodDetailsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private MenuDAO menuDAO;

    @Override
    public void init() {
        menuDAO = new MenuDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
                         throws ServletException, IOException {

        String menuIdParam = request.getParameter("menuId");

        if (menuIdParam == null || menuIdParam.trim().isEmpty()) {

            response.sendError(
                HttpServletResponse.SC_BAD_REQUEST,
                "Food item ID is required."
            );
            return;
        }

        try {

            int menuId = Integer.parseInt(menuIdParam);

            Menu foodItem = menuDAO.getMenuById(menuId);

            if (foodItem == null) {

                response.sendError(
                    HttpServletResponse.SC_NOT_FOUND,
                    "Food item not found."
                );
                return;
            }

            request.setAttribute("foodItem", foodItem);

            request.getRequestDispatcher("/food-details.jsp")
                   .forward(request, response);

        } catch (NumberFormatException e) {

            response.sendError(
                HttpServletResponse.SC_BAD_REQUEST,
                "Invalid food item ID."
            );
        }
    }
}