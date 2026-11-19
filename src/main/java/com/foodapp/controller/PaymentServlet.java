package com.foodapp.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.foodapp.model.User;
import com.foodapp.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/payment")
public class PaymentServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private static class OrderLine {
        int menuId;
        String name;
        int quantity;
        BigDecimal itemTotal;

        OrderLine(int menuId, String name, int quantity, BigDecimal itemTotal) {
            this.menuId = menuId;
            this.name = name;
            this.quantity = quantity;
            this.itemTotal = itemTotal;
        }
    }

    // Opening /payment directly (refresh, back button, typed URL) used to
    // give "405 Method Not Allowed". Send the user back to checkout instead.
    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        response.sendRedirect(request.getContextPath() + "/checkout");
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String context = request.getContextPath();

        HttpSession session = request.getSession(false);

        // Check login
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(context + "/login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");

        // Get checkout details
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String paymentMethod = request.getParameter("paymentMethod");

        if (phone == null || address == null || paymentMethod == null) {
            response.sendRedirect(context + "/checkout?error=missing");
            return;
        }

        phone = phone.trim();
        address = address.trim();
        paymentMethod = paymentMethod.trim();

        String normalizedPhone = phone.replaceAll("[\\s()+-]", "");

        if (!normalizedPhone.matches("\\d{10,15}")) {
            response.sendRedirect(context + "/checkout?error=phone");
            return;
        }

        if (address.length() < 10) {
            response.sendRedirect(context + "/checkout?error=address");
            return;
        }

        if (!paymentMethod.equals("UPI")
                && !paymentMethod.equals("Debit Card")
                && !paymentMethod.equals("Credit Card")
                && !paymentMethod.equals("Cash on Delivery")) {

            response.sendRedirect(context + "/checkout?error=payment");
            return;
        }

        Connection con = null;

        try {
            con = DBConnection.getConnection();
            con.setAutoCommit(false);

            List<OrderLine> orderLines = new ArrayList<>();

            BigDecimal grandTotal = BigDecimal.ZERO;
            int restaurantId = -1;

            // Lock cart items and retrieve current menu prices
            String cartSql =
                "SELECT c.menu_id, c.quantity, m.price, m.restaurant_id, "
              + "m.item_name, m.is_available "
              + "FROM cart c "
              + "INNER JOIN menu m ON c.menu_id = m.menu_id "
              + "WHERE c.user_id = ? "
              + "AND m.deleted_at IS NULL "
              + "FOR UPDATE";

            try (PreparedStatement ps = con.prepareStatement(cartSql)) {

                ps.setInt(1, user.getId());

                try (ResultSet rs = ps.executeQuery()) {

                    while (rs.next()) {

                        int menuId = rs.getInt("menu_id");
                        int quantity = rs.getInt("quantity");
                        int currentRestaurantId =
                            rs.getInt("restaurant_id");

                        BigDecimal price = rs.getBigDecimal("price");
                        String itemName = rs.getString("item_name");

                        // Cart shows this item, so tell the user clearly
                        // instead of silently dropping it.
                        if (!rs.getBoolean("is_available")) {
                            throw new IllegalStateException(
                                "UNAVAILABLE:" + itemName
                            );
                        }

                        if (quantity <= 0 || price == null
                                || price.compareTo(BigDecimal.ZERO) < 0) {
                            throw new IllegalStateException(
                                "Invalid cart item."
                            );
                        }

                        // This order implementation supports one
                        // restaurant per checkout.
                        if (restaurantId == -1) {
                            restaurantId = currentRestaurantId;
                        } else if (restaurantId != currentRestaurantId) {
                            throw new IllegalStateException(
                                "MULTIPLE_RESTAURANTS"
                            );
                        }

                        BigDecimal itemTotal =
                            price.multiply(BigDecimal.valueOf(quantity));

                        grandTotal = grandTotal.add(itemTotal);

                        orderLines.add(
                            new OrderLine(menuId, itemName, quantity, itemTotal)
                        );
                    }
                }
            }

            if (orderLines.isEmpty()) {
                con.rollback();
                response.sendRedirect(context + "/cart?error=empty");
                return;
            }

            // Create order
            String orderSql =
                "INSERT INTO `order` "
              + "(user_id, restaurant_id, order_date, total_amount, "
              + "status, payment_method) "
              + "VALUES (?, ?, NOW(), ?, ?, ?)";

            int orderId;

            try (PreparedStatement ps = con.prepareStatement(
                    orderSql, Statement.RETURN_GENERATED_KEYS)) {

                ps.setInt(1, user.getId());
                ps.setInt(2, restaurantId);
                ps.setBigDecimal(3, grandTotal);
                ps.setString(4, "Confirmed");
                ps.setString(5, paymentMethod);

                ps.executeUpdate();

                try (ResultSet keys = ps.getGeneratedKeys()) {

                    if (!keys.next()) {
                        throw new IllegalStateException(
                            "Order ID could not be generated."
                        );
                    }

                    orderId = keys.getInt(1);
                }
            }

            // Insert order items
            String itemSql =
                "INSERT INTO order_item "
              + "(order_id, menu_id, quantity, item_total) "
              + "VALUES (?, ?, ?, ?)";

            try (PreparedStatement ps = con.prepareStatement(itemSql)) {

                for (OrderLine item : orderLines) {

                    ps.setInt(1, orderId);
                    ps.setInt(2, item.menuId);
                    ps.setInt(3, item.quantity);
                    ps.setBigDecimal(4, item.itemTotal);

                    ps.addBatch();
                }

                ps.executeBatch();
            }

            // Clear the user's cart after successful order creation
            String deleteSql =
                "DELETE FROM cart WHERE user_id = ?";

            try (PreparedStatement ps = con.prepareStatement(deleteSql)) {

                ps.setInt(1, user.getId());
                ps.executeUpdate();
            }

            // Commit the complete order transaction
            con.commit();

            // Save order information for confirmation page
            List<String> summary = new ArrayList<>();
            for (OrderLine line : orderLines) {
                summary.add(line.name + " × " + line.quantity
                          + " — ₹" + line.itemTotal);
            }
            session.setAttribute("lastOrderItems", summary);
            session.setAttribute("lastOrderId", orderId);
            session.setAttribute("lastOrderTotal", grandTotal);
            session.setAttribute("lastPaymentMethod", paymentMethod);
            session.setAttribute("lastDeliveryPhone", phone);
            session.setAttribute("lastDeliveryAddress", address);

            response.sendRedirect(
                context + "/payment-success.jsp"
            );

        } catch (Exception e) {

            if (con != null) {
                try {
                    con.rollback();
                } catch (Exception rollbackError) {
                    rollbackError.printStackTrace();
                }
            }

            e.printStackTrace();

            String msg = e.getMessage();

            if ("MULTIPLE_RESTAURANTS".equals(msg)) {
                response.sendRedirect(
                    context + "/cart?error=multiple_restaurants"
                );
            } else if (msg != null && msg.startsWith("UNAVAILABLE:")) {
                response.sendRedirect(
                    context + "/cart?error=unavailable&item="
                    + java.net.URLEncoder.encode(
                        msg.substring("UNAVAILABLE:".length()),
                        java.nio.charset.StandardCharsets.UTF_8)
                );
            } else {
                // The real cause (bad column, wrong status value, DB down)
                // is printed above by printStackTrace(); also show a hint.
                String detail = msg == null ? e.getClass().getSimpleName() : msg;
                if (detail.length() > 160) detail = detail.substring(0, 160);
                response.sendRedirect(
                    context + "/checkout?error=failed&detail="
                    + java.net.URLEncoder.encode(detail,
                        java.nio.charset.StandardCharsets.UTF_8)
                );
            }

        } finally {

            if (con != null) {
                try {
                    con.setAutoCommit(true);
                    con.close();
                } catch (Exception closeError) {
                    closeError.printStackTrace();
                }
            }
        }
    }
}