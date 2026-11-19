
package com.foodapp.controller;

import java.io.IOException;
import java.util.List;

import com.foodapp.dao.OrderDAO;
import com.foodapp.model.Order;
import com.foodapp.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/orders")
public class OrderServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private OrderDAO orderDAO;

    @Override
    public void init() {
        orderDAO = new OrderDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
                         throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(
                request.getContextPath() + "/login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");

        List<Order> orders =
                orderDAO.getOrdersByUserId(user.getId());

        request.setAttribute("orders", orders);

        request.getRequestDispatcher("/orders.jsp")
               .forward(request, response);
    }
}
