package com.foodapp.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.List;
import java.util.Locale;
import java.util.Set;

/**
 * Looks at the real tables in MySQL so the code works even when a
 * column is spelled differently (restaurant_id / restraunt_id) or a
 * column is an ENUM with fixed values.
 */
public class DbSchema {

    // Lower-case names of all columns of a table
    public static Set<String> columns(Connection con, String table)
            throws SQLException {

        Set<String> cols = new HashSet<>();

        try (Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(
                 "SELECT * FROM `" + table + "` WHERE 1 = 0")) {

            ResultSetMetaData md = rs.getMetaData();

            for (int i = 1; i <= md.getColumnCount(); i++) {
                cols.add(md.getColumnLabel(i).toLowerCase(Locale.ROOT));
            }
        }

        return cols;
    }

    // First column name from the options that exists, or null
    public static String firstExisting(Set<String> cols, String... options) {
        for (String o : options) {
            if (cols.contains(o.toLowerCase(Locale.ROOT))) {
                return o;
            }
        }
        return null;
    }

    // If the column is an ENUM, return its allowed values; else null
    public static List<String> enumValues(Connection con, String table,
                                          String column) throws SQLException {

        try (PreparedStatement ps = con.prepareStatement(
                "SHOW COLUMNS FROM `" + table + "` LIKE ?")) {

            ps.setString(1, column);

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {

                    String type = rs.getString("Type");

                    if (type != null
                            && type.toLowerCase(Locale.ROOT)
                                   .startsWith("enum(")) {

                        List<String> values = new ArrayList<>();
                        String inner = type.substring(
                            type.indexOf('(') + 1, type.lastIndexOf(')'));

                        for (String part : inner.split(",")) {
                            String v = part.trim();
                            if (v.startsWith("'") && v.endsWith("'")
                                    && v.length() >= 2) {
                                v = v.substring(1, v.length() - 1);
                            }
                            values.add(v);
                        }
                        return values;
                    }
                }
            }
        }

        return null;
    }

    // Pick a value the column accepts: the wanted one if allowed,
    // otherwise the first allowed value that matches a fallback word,
    // otherwise the first allowed value.
    public static String fitEnum(List<String> allowed, String wanted,
                                 String... fallbacks) {

        if (allowed == null || allowed.isEmpty()) {
            return wanted;
        }

        for (String a : allowed) {
            if (a.equalsIgnoreCase(wanted)) {
                return a;
            }
        }

        for (String f : fallbacks) {
            for (String a : allowed) {
                if (a.equalsIgnoreCase(f)) {
                    return a;
                }
            }
        }

        return allowed.get(0);
    }

    /**
     * Columns that are NOT NULL, have no default value and are not
     * auto-generated, and are not already supplied. An INSERT fails
     * unless they get a value, so fill each with a harmless one.
     */
    public static Map<String, Object> requiredExtras(
            Connection con, String table, Set<String> supplied)
            throws SQLException {

        Map<String, Object> extras = new LinkedHashMap<>();

        try (Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(
                 "SHOW COLUMNS FROM `" + table + "`")) {

            while (rs.next()) {

                String field = rs.getString("Field");
                String type = rs.getString("Type").toLowerCase(Locale.ROOT);
                String nullable = rs.getString("Null");
                String def = rs.getString("Default");
                String extra = rs.getString("Extra") == null
                        ? "" : rs.getString("Extra").toLowerCase(Locale.ROOT);

                if (supplied.contains(field.toLowerCase(Locale.ROOT))) {
                    continue;
                }
                if (!"NO".equalsIgnoreCase(nullable) || def != null) {
                    continue;
                }
                if (extra.contains("auto_increment")
                        || extra.contains("generated")) {
                    continue;
                }

                Object value;

                if (type.startsWith("enum(")) {
                    String inner = type.substring(
                        type.indexOf('(') + 1, type.lastIndexOf(')'));
                    String first = inner.split(",")[0].trim();
                    value = first.length() >= 2
                        ? first.substring(1, first.length() - 1) : first;
                } else if (type.contains("int") || type.contains("decimal")
                        || type.contains("numeric") || type.contains("float")
                        || type.contains("double") || type.contains("bit")) {
                    value = 0;
                } else if (type.contains("date") || type.contains("time")) {
                    value = new java.sql.Timestamp(System.currentTimeMillis());
                } else {
                    value = "";
                }

                extras.put(field, value);
            }
        }

        return extras;
    }
}
