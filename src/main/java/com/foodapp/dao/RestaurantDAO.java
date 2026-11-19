package com.foodapp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.foodapp.model.Restaurant;
import com.foodapp.util.DBConnection;

public class RestaurantDAO {

    public List<Restaurant> getAllRestaurants() throws SQLException {

        List<Restaurant> restaurants = new ArrayList<>();

        String sql = "SELECT restaurant_id, name, cuisine_type, " +
                     "delivery_time, address, admin_user_id, " +
                     "rating, is_active, image " +
                     "FROM restaurant WHERE is_active = 1";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                Restaurant restaurant = new Restaurant();

                restaurant.setRestaurantId(
                    rs.getInt("restaurant_id")
                );

                restaurant.setName(
                    rs.getString("name")
                );

                restaurant.setCuisineType(
                    rs.getString("cuisine_type")
                );

                restaurant.setDeliveryTime(
                    rs.getInt("delivery_time")
                );

                restaurant.setAddress(
                    rs.getString("address")
                );

                int adminId = rs.getInt("admin_user_id");

                restaurant.setAdminUserId(
                    rs.wasNull() ? null : adminId
                );

                restaurant.setRating(
                    rs.getBigDecimal("rating")
                );

                restaurant.setActive(
                    rs.getBoolean("is_active")
                );

                restaurant.setImage(
                    rs.getString("image")
                );

                restaurants.add(restaurant);
            }

            System.out.println(
                "DAO: Restaurants fetched = " + restaurants.size()
            );

        } catch (SQLException e) {

            System.err.println("ERROR IN RestaurantDAO");
            e.printStackTrace();

            throw e;
        }

        return restaurants;
    }
}