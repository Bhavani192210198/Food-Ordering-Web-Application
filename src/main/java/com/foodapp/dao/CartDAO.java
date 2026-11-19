package com.foodapp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.foodapp.model.Cart;
import com.foodapp.util.DBConnection;
import com.foodapp.util.MenuColumn;

public class CartDAO {

    // Add item to cart
    public boolean addToCart(Cart cart) {

        String sql = "INSERT INTO cart "
                   + "(user_id, menu_id, quantity) "
                   + "VALUES (?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setObject(1, cart.getUserId());
            ps.setObject(2, cart.getMenuId());
            ps.setObject(3, cart.getQuantity());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    // Get cart items with complete food details
    public List<Cart> getCartByUserId(int userId) {

        List<Cart> cartList = new ArrayList<>();

        String sql =
            "SELECT c.cart_id, c.user_id, c.menu_id, c.quantity, "
          + "m.item_name, m.description, m.category, "
          + "m.price, m.image, m." + MenuColumn.restaurantId() + " AS rest_id "
          + "FROM cart c "
          + "INNER JOIN menu m ON c.menu_id = m.menu_id "
          + "WHERE c.user_id = ? "
          + "AND m.deleted_at IS NULL "
          + "ORDER BY c.cart_id DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, userId);

            try (ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {

                    Cart cart = new Cart();

                    cart.setCartId(rs.getInt("cart_id"));
                    cart.setUserId(rs.getInt("user_id"));
                    cart.setMenuId(rs.getInt("menu_id"));
                    cart.setQuantity(rs.getInt("quantity"));

                    cart.setItemName(rs.getString("item_name"));
                    cart.setDescription(rs.getString("description"));
                    cart.setCategory(rs.getString("category"));

                    cart.setPrice(rs.getBigDecimal("price"));
                    cart.setImage(rs.getString("image"));
                    cart.setRestaurantId((Integer) rs.getObject("rest_id"));

                    cartList.add(cart);
                }
            }

        } catch (Exception e) {
            System.err.println("Error retrieving cart details:");
            e.printStackTrace();
        }

        return cartList;
    }

    // Update quantity
    public boolean updateQuantity(int cartId, int quantity) {

        String sql =
            "UPDATE cart SET quantity = ? WHERE cart_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, quantity);
            ps.setInt(2, cartId);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    // Remove item from cart
    public boolean removeFromCart(int cartId) {

        String sql =
            "DELETE FROM cart WHERE cart_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, cartId);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    // Empty the whole cart of a user (used after an order is confirmed)
    public boolean clearCart(int userId) {

        String sql = "DELETE FROM cart WHERE user_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ps.executeUpdate();
            return true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}
