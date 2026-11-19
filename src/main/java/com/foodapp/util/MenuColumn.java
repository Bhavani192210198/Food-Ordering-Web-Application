package com.foodapp.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;

/**
 * The restaurant column in the menu table may be called
 * "restaurant_id" (correct) or "restraunt_id" (old spelling).
 * This class finds out which one the database really has.
 */
public class MenuColumn {

    private static String name;

    public static synchronized String restaurantId() {

        if (name != null) {
            return name;
        }

        try (Connection con = DBConnection.getConnection();
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(
                 "SELECT * FROM menu WHERE 1 = 0")) {

            ResultSetMetaData md = rs.getMetaData();

            for (int i = 1; i <= md.getColumnCount(); i++) {
                String col = md.getColumnLabel(i);

                if (col.equalsIgnoreCase("restaurant_id")) {
                    name = "restaurant_id";
                    return name;
                }
                if (col.equalsIgnoreCase("restraunt_id")) {
                    name = "restraunt_id";
                    return name;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return "restaurant_id";
    }
}
