
package com.foodapp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.foodapp.model.OrderItem;
import com.foodapp.util.DBConnection;

public class OrderItemDAO {

    public boolean addOrderItem(OrderItem item) {

        String sql = "INSERT INTO order_item "
                + "(order_id, menu_id, quantity, item_total) "
                + "VALUES (?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setObject(1, item.getOrderId());
            ps.setObject(2, item.getMenuId());
            ps.setObject(3, item.getQuantity());
            ps.setBigDecimal(4, item.getItemTotal());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    public List<OrderItem> getOrderItemsByOrderId(int orderId) {

        List<OrderItem> items = new ArrayList<>();

        String sql = "SELECT * FROM order_item WHERE order_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, orderId);

            try (ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {

                    OrderItem item = new OrderItem();

                    item.setOrderItemId(rs.getInt("order_item_id"));
                    item.setOrderId((Integer) rs.getObject("order_id"));
                    item.setMenuId((Integer) rs.getObject("menu_id"));
                    item.setQuantity((Integer) rs.getObject("quantity"));
                    item.setItemTotal(rs.getBigDecimal("item_total"));

                    items.add(item);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return items;
    }
}
