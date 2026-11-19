package com.foodapp.util;

import jakarta.servlet.ServletContext;
import java.io.File;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Locale;

public class ImagePathUtil {

    private static String normalize(String value) {
        if (value == null) {
            return "";
        }

        return value.toLowerCase(Locale.ROOT)
                .replaceAll("[^a-z0-9]", "");
    }

    public static String resolveImageUrl(
            ServletContext context,
            String contextPath,
            String databasePath,
            String itemName) {

        String realPath = context.getRealPath("/images");

        if (realPath == null) {
            return null;
        }

        File folder = new File(realPath);

        if (!folder.exists() || !folder.isDirectory()) {
            return null;
        }

        File[] files = folder.listFiles();

        if (files == null) {
            return null;
        }

        String dbName = databasePath == null
                ? ""
                : databasePath.replace("\\", "/");

        dbName = dbName.substring(dbName.lastIndexOf("/") + 1);

        int dot = dbName.lastIndexOf(".");
        if (dot > 0) {
            dbName = dbName.substring(0, dot);
        }

        String normalizedDb = normalize(dbName);
        String normalizedItem = normalize(itemName);

        File bestMatch = null;
        int bestScore = 0;

        for (File file : files) {

            if (!file.isFile()) {
                continue;
            }

            String filename = file.getName();
            int extensionIndex = filename.lastIndexOf(".");

            if (extensionIndex < 0) {
                continue;
            }

            String extension = filename.substring(
                    extensionIndex + 1
            ).toLowerCase(Locale.ROOT);

            if (!extension.matches("jpg|jpeg|png|webp|svg")) {
                continue;
            }

            String actualName = filename.substring(0, extensionIndex);
            String normalizedActual = normalize(actualName);

            if (!normalizedDb.isEmpty()
                    && normalizedActual.equals(normalizedDb)) {
                return buildUrl(contextPath, filename);
            }

            if (!normalizedItem.isEmpty()
                    && normalizedActual.equals(normalizedItem)) {
                return buildUrl(contextPath, filename);
            }

            int score = 0;

            if (!normalizedDb.isEmpty()
                    && (normalizedActual.contains(normalizedDb)
                    || normalizedDb.contains(normalizedActual))) {
                score += 3;
            }

            if (!normalizedItem.isEmpty()
                    && (normalizedActual.contains(normalizedItem)
                    || normalizedItem.contains(normalizedActual))) {
                score += 5;
            }

            if (score > bestScore) {
                bestScore = score;
                bestMatch = file;
            }
        }

        if (bestMatch != null && bestScore >= 2) {
            return buildUrl(contextPath, bestMatch.getName());
        }

        return null;
    }

    private static String buildUrl(
            String contextPath,
            String filename) {

        try {
            return contextPath + "/images/"
                    + URLEncoder.encode(
                            filename,
                            StandardCharsets.UTF_8.name()
                    ).replace("+", "%20");

        } catch (Exception e) {
            return contextPath + "/images/" + filename;
        }
    }
}