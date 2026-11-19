package com.foodapp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;

import com.foodapp.model.Menu;
import com.foodapp.util.DBConnection;
import com.foodapp.util.MenuColumn;

public class MenuDAO {

    // Get all available menu items for a restaurant.
    // Throws the real SQL error so the page can show what is wrong.
    public List<Menu> getMenuByRestaurantIdOrThrow(int restaurantId)
            throws SQLException {

        List<Menu> menuList = new ArrayList<>();

        try (Connection con = DBConnection.getConnection()) {

            Set<String> cols = columnsOf(con);

            StringBuilder sql = new StringBuilder("SELECT * FROM menu WHERE ")
                    .append(MenuColumn.restaurantId()).append(" = ?");

            if (cols.contains("is_available")) {
                sql.append(" AND (is_available = 1 OR is_available IS NULL)");
            }
            if (cols.contains("deleted_at")) {
                sql.append(" AND deleted_at IS NULL");
            }

            try (PreparedStatement ps = con.prepareStatement(sql.toString())) {

                ps.setInt(1, restaurantId);

                try (ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        menuList.add(mapMenu(rs, cols));
                    }
                }
            }
        }

        System.out.println("MenuDAO: restaurant " + restaurantId
                + " -> " + menuList.size() + " menu items");

        return menuList;
    }

    // Same as above, but never throws (kept for older callers)
    public List<Menu> getMenuByRestaurantId(int restaurantId) {
        try {
            return getMenuByRestaurantIdOrThrow(restaurantId);
        } catch (Exception e) {
            e.printStackTrace();
            return new ArrayList<>();
        }
    }

    // Get one particular food item
    public Menu getMenuById(int menuId) {

        try (Connection con = DBConnection.getConnection()) {

            Set<String> cols = columnsOf(con);

            StringBuilder sql = new StringBuilder(
                    "SELECT * FROM menu WHERE menu_id = ?");

            if (cols.contains("is_available")) {
                sql.append(" AND (is_available = 1 OR is_available IS NULL)");
            }
            if (cols.contains("deleted_at")) {
                sql.append(" AND deleted_at IS NULL");
            }

            try (PreparedStatement ps = con.prepareStatement(sql.toString())) {

                ps.setInt(1, menuId);

                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        return mapMenu(rs, cols);
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    // Names of the columns that really exist in the menu table
    private Set<String> columnsOf(Connection con) throws SQLException {

        Set<String> cols = new HashSet<>();

        try (PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM menu WHERE 1 = 0");
             ResultSet rs = ps.executeQuery()) {

            ResultSetMetaData md = rs.getMetaData();

            for (int i = 1; i <= md.getColumnCount(); i++) {
                cols.add(md.getColumnLabel(i).toLowerCase(Locale.ROOT));
            }
        }

        return cols;
    }

    private LocalDateTimeHolder time(ResultSet rs, Set<String> cols,
                                     String name) {
        try {
            if (cols.contains(name)) {
                Timestamp t = rs.getTimestamp(name);
                if (t != null) {
                    return new LocalDateTimeHolder(t.toLocalDateTime());
                }
            }
        } catch (Exception e) {
            // bad or zero date in the database: ignore it
        }
        return new LocalDateTimeHolder(null);
    }

    private static class LocalDateTimeHolder {
        final java.time.LocalDateTime value;
        LocalDateTimeHolder(java.time.LocalDateTime value) {
            this.value = value;
        }
    }

    // Convert database record into Menu object
    private Menu mapMenu(ResultSet rs, Set<String> cols) throws SQLException {

        Menu menu = new Menu();

        menu.setMenuId(rs.getInt("menu_id"));

        int restaurantId = rs.getInt(MenuColumn.restaurantId());
        menu.setRestaurantId(rs.wasNull() ? null : restaurantId);

        menu.setItemName(rs.getString("item_name"));

        if (cols.contains("description")) {
            menu.setDescription(rs.getString("description"));
        }

        menu.setPrice(rs.getBigDecimal("price"));

        if (cols.contains("is_available")) {
            menu.setAvailable(rs.getBoolean("is_available"));
        }

        if (cols.contains("category")) {
            menu.setCategory(rs.getString("category"));
        }

        menu.setCreatedAt(time(rs, cols, "created_at").value);
        menu.setUpdatedAt(time(rs, cols, "updated_at").value);
        menu.setDeletedAt(time(rs, cols, "deleted_at").value);

        if (cols.contains("image")) {
            menu.setImage(rs.getString("image"));
        }

        return menu;
    }
}
