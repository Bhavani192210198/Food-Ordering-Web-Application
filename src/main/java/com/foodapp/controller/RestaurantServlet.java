package com.foodapp.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.foodapp.dao.RestaurantDAO;
import com.foodapp.model.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/restaurants")
public class RestaurantServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private RestaurantDAO restaurantDAO;

    @Override
    public void init() throws ServletException {
        restaurantDAO = new RestaurantDAO();
        System.out.println("RestaurantServlet initialized");
    }

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("RestaurantServlet executed");

        try {

            List<Restaurant> restaurants =
                    restaurantDAO.getAllRestaurants();

            System.out.println(
                "SERVLET: Total restaurants = " + restaurants.size()
            );

            request.setAttribute("restaurants", restaurants);

            request.getRequestDispatcher("/home.jsp")
                   .forward(request, response);

        } catch (SQLException e) {

            System.err.println("Unable to load restaurants");
            e.printStackTrace();

            throw new ServletException(
                "Failed to retrieve restaurant data from database", e
            );
        }
    }
}