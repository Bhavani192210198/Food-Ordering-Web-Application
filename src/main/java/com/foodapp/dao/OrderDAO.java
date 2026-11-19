package com.foodapp.dao;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import com.foodapp.model.Order;
import com.foodapp.model.OrderItem;
import com.foodapp.util.DBConnection;
import com.foodapp.util.DbSchema;

public class OrderDAO {

    /**
     * Saves one order and all its items in a single transaction.
     * Either everything is saved or nothing is.
     * Throws the real SQL error so it can be shown on the page.
     */
    public int placeOrderWithItems(Order order, List<OrderItem> items)
            throws SQLException {

        try (Connection con = DBConnection.getConnection()) {

            con.setAutoCommit(false);

            try {

                int orderId = insertOrder(con, order);

                for (OrderItem item : items) {
                    item.setOrderId(orderId);
                    insertOrderItem(con, item);
                }

                con.commit();
                return orderId;

            } catch (SQLException e) {
                con.rollback();
                throw e;
            }
        }
    }

    private int insertOrder(Connection con, Order order)
            throws SQLException {

        Set<String> cols = DbSchema.columns(con, "order");

        String restCol = DbSchema.firstExisting(
            cols, "restaurant_id", "restraunt_id");

        List<String> names = new ArrayList<>();
        List<Object> values = new ArrayList<>();

        if (cols.contains("user_id")) {
            names.add("user_id");
            values.add(order.getUserId());
        }

        if (restCol != null) {
            names.add(restCol);
            values.add(order.getRestaurantId());
        }

        if (cols.contains("order_date")) {
            names.add("order_date");
            values.add(new Timestamp(System.currentTimeMillis()));
        }

        if (cols.contains("total_amount")) {
            names.add("total_amount");
            values.add(order.getTotalAmount());
        }

        if (cols.contains("status")) {
            names.add("status");
            values.add(DbSchema.fitEnum(
                DbSchema.enumValues(con, "order", "status"),
                order.getStatus(),
                "Confirmed", "Placed", "Pending", "Ordered"));
        }

        if (cols.contains("payment_method")) {
            names.add("payment_method");
            values.add(DbSchema.fitEnum(
                DbSchema.enumValues(con, "order", "payment_method"),
                order.getPaymentMethod(),
                "COD", "Cash on Delivery", "Cash"));
        }

        addExtras(con, "order", names, values);

        StringBuilder sql = new StringBuilder("INSERT INTO `order` (");
        StringBuilder marks = new StringBuilder();

        for (int i = 0; i < names.size(); i++) {
            if (i > 0) {
                sql.append(", ");
                marks.append(", ");
            }
            sql.append("`").append(names.get(i)).append("`");
            marks.append("?");
        }

        sql.append(") VALUES (").append(marks).append(")");

        try (PreparedStatement ps = con.prepareStatement(
                sql.toString(), PreparedStatement.RETURN_GENERATED_KEYS)) {

            for (int i = 0; i < values.size(); i++) {
                ps.setObject(i + 1, values.get(i));
            }

            ps.executeUpdate();

            try (ResultSet rs = ps.getGeneratedKeys()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        }

        throw new SQLException("Order was inserted but no order id returned");
    }

    // Give a safe value to any required column we do not know about
    private void addExtras(Connection con, String table,
                           List<String> names, List<Object> values)
            throws SQLException {

        Set<String> supplied = new java.util.HashSet<>();
        for (String n : names) {
            supplied.add(n.toLowerCase());
        }

        java.util.Map<String, Object> extras =
            DbSchema.requiredExtras(con, table, supplied);

        for (java.util.Map.Entry<String, Object> e : extras.entrySet()) {
            names.add(e.getKey());
            values.add(e.getValue());
        }
    }

    private void insertOrderItem(Connection con, OrderItem item)
            throws SQLException {

        Set<String> cols = DbSchema.columns(con, "order_item");

        List<String> names = new ArrayList<>();
        List<Object> values = new ArrayList<>();

        if (cols.contains("order_id")) {
            names.add("order_id");
            values.add(item.getOrderId());
        }
        if (cols.contains("menu_id")) {
            names.add("menu_id");
            values.add(item.getMenuId());
        }
        if (cols.contains("quantity")) {
            names.add("quantity");
            values.add(item.getQuantity());
        }

        String totalCol = DbSchema.firstExisting(
            cols, "item_total", "total_price", "price", "total");

        if (totalCol != null) {
            names.add(totalCol);
            values.add(item.getItemTotal());
        }

        addExtras(con, "order_item", names, values);

        StringBuilder sql = new StringBuilder("INSERT INTO order_item (");
        StringBuilder marks = new StringBuilder();

        for (int i = 0; i < names.size(); i++) {
            if (i > 0) {
                sql.append(", ");
                marks.append(", ");
            }
            sql.append("`").append(names.get(i)).append("`");
            marks.append("?");
        }

        sql.append(") VALUES (").append(marks).append(")");

        try (PreparedStatement ps = con.prepareStatement(sql.toString())) {

            for (int i = 0; i < values.size(); i++) {
                ps.setObject(i + 1, values.get(i));
            }

            ps.executeUpdate();
        }
    }

    // Get all orders belonging to a user
    public List<Order> getOrdersByUserId(int userId) {

        List<Order> orders = new ArrayList<>();

        try (Connection con = DBConnection.getConnection()) {

            Set<String> cols = DbSchema.columns(con, "order");

            String restCol = DbSchema.firstExisting(
                cols, "restaurant_id", "restraunt_id");

            String sql = "SELECT * FROM `order` WHERE user_id = ? "
                       + "ORDER BY order_id DESC";

            try (PreparedStatement ps = con.prepareStatement(sql)) {

                ps.setInt(1, userId);

                try (ResultSet rs = ps.executeQuery()) {

                    while (rs.next()) {

                        Order order = new Order();

                        order.setOrderId(rs.getInt("order_id"));
                        order.setUserId((Integer) rs.getObject("user_id"));

                        if (restCol != null) {
                            order.setRestaurantId(
                                (Integer) rs.getObject(restCol));
                        }

                        if (cols.contains("order_date")
                                && rs.getTimestamp("order_date") != null) {
                            order.setOrderDate(
                                rs.getTimestamp("order_date")
                                  .toLocalDateTime());
                        }

                        if (cols.contains("total_amount")) {
                            order.setTotalAmount(
                                rs.getBigDecimal("total_amount"));
                        }
                        if (cols.contains("status")) {
                            order.setStatus(rs.getString("status"));
                        }
                        if (cols.contains("payment_method")) {
                            order.setPaymentMethod(
                                rs.getString("payment_method"));
                        }

                        orders.add(order);
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return orders;
    }

    // Update order status
    public boolean updateOrderStatus(int orderId, String status) {

        String sql = "UPDATE `order` SET status = ? WHERE order_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, status);
            ps.setInt(2, orderId);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}
