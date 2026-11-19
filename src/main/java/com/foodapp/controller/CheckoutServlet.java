package com.foodapp.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.ArrayList;

import com.foodapp.dao.CartDAO;
import com.foodapp.dao.OrderDAO;
import com.foodapp.model.Cart;
import com.foodapp.model.Order;
import com.foodapp.model.OrderItem;
import com.foodapp.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private CartDAO cartDAO;
    private OrderDAO orderDAO;

    @Override
    public void init() {
        cartDAO = new CartDAO();
        orderDAO = new OrderDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
                         throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // Login is required for checkout
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(
                request.getContextPath() + "/login.jsp"
            );
            return;
        }

        User user = (User) session.getAttribute("user");

        // Retrieve logged-in user's cart
        List<Cart> cartItems =
            cartDAO.getCartByUserId(user.getId());

        if (cartItems == null || cartItems.isEmpty()) {
            response.sendRedirect(
                request.getContextPath() + "/cart"
            );
            return;
        }

        // Calculate total amount
        BigDecimal grandTotal = BigDecimal.ZERO;

        for (Cart item : cartItems) {
            grandTotal = grandTotal.add(item.getTotalPrice());
        }

        Object checkoutError = session.getAttribute("checkoutError");
        if (checkoutError != null) {
            request.setAttribute("checkoutError", checkoutError);
            session.removeAttribute("checkoutError");
        }

        request.setAttribute("cartItems", cartItems);
        request.setAttribute("grandTotal", grandTotal);
        request.setAttribute("checkoutUser", user);

        request.getRequestDispatcher("/checkout.jsp")
               .forward(request, response);
    }

    // Confirm the order (no payment gateway) and save it
    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
                          throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(
                request.getContextPath() + "/login.jsp"
            );
            return;
        }

        User user = (User) session.getAttribute("user");

        List<Cart> cartItems =
            cartDAO.getCartByUserId(user.getId());

        if (cartItems == null || cartItems.isEmpty()) {
            response.sendRedirect(
                request.getContextPath() + "/cart"
            );
            return;
        }

        // Group cart items by restaurant (one order per restaurant)
        Map<Integer, List<Cart>> byRestaurant = new LinkedHashMap<>();

        for (Cart item : cartItems) {
            byRestaurant
                .computeIfAbsent(item.getRestaurantId(),
                                 k -> new ArrayList<>())
                .add(item);
        }

        // Payment method chosen on the page (no real payment is taken)
        String payment = request.getParameter("paymentMethod");

        if (payment == null
                || !(payment.equals("UPI")
                  || payment.equals("Debit Card")
                  || payment.equals("Credit Card")
                  || payment.equals("Cash on Delivery"))) {
            payment = "Cash on Delivery";
        }

        try {

            for (Map.Entry<Integer, List<Cart>> entry
                    : byRestaurant.entrySet()) {

                BigDecimal total = BigDecimal.ZERO;
                List<OrderItem> orderItems = new ArrayList<>();

                for (Cart item : entry.getValue()) {

                    total = total.add(item.getTotalPrice());

                    OrderItem oi = new OrderItem();
                    oi.setMenuId(item.getMenuId());
                    oi.setQuantity(item.getQuantity());
                    oi.setItemTotal(item.getTotalPrice());
                    orderItems.add(oi);
                }

                Order order = new Order();
                order.setUserId(user.getId());
                order.setRestaurantId(entry.getKey());
                order.setTotalAmount(total);
                order.setStatus("Confirmed");
                order.setPaymentMethod(payment);

                orderDAO.placeOrderWithItems(order, orderItems);
            }

        } catch (Exception e) {

            e.printStackTrace();

            session.setAttribute("checkoutError", e.toString());

            response.sendRedirect(
                request.getContextPath() + "/checkout?error=1"
            );
            return;
        }

        // Order saved: empty the cart and go to My Orders
        cartDAO.clearCart(user.getId());

        response.sendRedirect(
            request.getContextPath() + "/orders?placed=1"
        );
    }
}
