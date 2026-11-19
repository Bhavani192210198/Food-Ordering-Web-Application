
package com.foodapp.util;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DBConnection {

    private static final Properties CONFIG = loadConfig();

    private static Properties loadConfig() {

        Properties properties = new Properties();

        try (InputStream input = DBConnection.class.getClassLoader()
                .getResourceAsStream("db.properties")) {

            if (input != null) {
                properties.load(input);
            }

        } catch (IOException e) {
            throw new ExceptionInInitializerError(e);
        }

        return properties;
    }

    private static String setting(String key, String defaultValue) {

        String env = System.getenv(key);

        if (env != null && !env.trim().isEmpty()) {
            return env.trim();
        }

        String value = CONFIG.getProperty(key);

        return (value == null || value.trim().isEmpty())
                ? defaultValue
                : value.trim();
    }

    public static Connection getConnection() throws SQLException {

        String url = setting(
                "FOODAPP_DB_URL",
                "jdbc:mysql://localhost:3306/foodapp?useSSL=false&serverTimezone=UTC"
        );

        String username = setting("FOODAPP_DB_USER", "root");

        // Read password from db.properties or environment variable.
        // Never hardcode your password in this Java file.
        String password = setting("FOODAPP_DB_PASSWORD", "bhavani23");

        if (password.isEmpty()
                || "YOUR_LOCAL_MYSQL_PASSWORD".equals(password)) {

            throw new SQLException(
                    "Database password is not configured. "
                    + "Set it in src/main/java/db.properties."
            );
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

        } catch (ClassNotFoundException e) {

            throw new SQLException(
                    "MySQL JDBC Driver not found. Check WEB-INF/lib.",
                    e
            );
        }

        Connection connection = DriverManager.getConnection(
                url,
                username,
                password
        );

        System.out.println("MySQL database connected successfully!");

        return connection;
    }
}
