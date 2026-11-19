-- Run this in MySQL Workbench to see why a restaurant has no menu items.
USE foodapp;

-- 1) Column names of the menu table
SHOW COLUMNS FROM menu;

-- 2) How many menu rows exist, and for which restaurants
--    (use restaurant_id below, or restraunt_id if SHOW COLUMNS shows that)
SELECT restaurant_id, COUNT(*) AS items FROM menu GROUP BY restaurant_id;

-- 3) Rows that are hidden by the app (not available / deleted)
SELECT menu_id, item_name, is_available, deleted_at FROM menu
WHERE is_available = 0 OR deleted_at IS NOT NULL;

-- 4) Restaurants that have no menu rows at all
SELECT r.restaurant_id, r.name FROM restaurant r
LEFT JOIN menu m ON m.restaurant_id = r.restaurant_id
WHERE m.menu_id IS NULL;
