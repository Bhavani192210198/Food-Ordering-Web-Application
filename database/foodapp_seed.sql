-- =====================================================================
-- FoodApp sample data (seed) script
-- Database : foodapp   (existing tables: restaurant, menu)
-- NOTE: uses your real column names: restraunt_id and cusine_type
--       (they are spelled this way in your database).
-- Safe to run more than once: every INSERT checks whether the row exists.
-- This script does NOT drop, delete, truncate or alter anything.
-- Image paths are relative to the web app root (src/main/webapp), e.g.
--   images/restaurants/namma-tiffin-house.svg
-- =====================================================================

USE foodapp;

START TRANSACTION;

-- ---------------------------------------------------------------------
-- PART 1 : RESTAURANTS  (10 rows)
-- ---------------------------------------------------------------------

INSERT INTO restaurant
    (name, cusine_type, delivery_time, address, admin_user_id, rating, is_active, image)
SELECT 'Namma Tiffin House', 'South Indian', 25, '4th Block, Jayanagar, Bengaluru 560011', NULL, 4.5, 1, 'images/restaurants/namma-tiffin-house.svg'
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM restaurant WHERE name = 'Namma Tiffin House');

INSERT INTO restaurant
    (name, cusine_type, delivery_time, address, admin_user_id, rating, is_active, image)
SELECT 'Malabar Meals', 'South Indian', 35, '2nd Stage, Indiranagar, Bengaluru 560038', NULL, 4.3, 1, 'images/restaurants/malabar-meals.svg'
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM restaurant WHERE name = 'Malabar Meals');

INSERT INTO restaurant
    (name, cusine_type, delivery_time, address, admin_user_id, rating, is_active, image)
SELECT 'Punjabi Tadka', 'North Indian', 35, 'MG Road, Bengaluru 560001', NULL, 4.2, 1, 'images/restaurants/punjabi-tadka.svg'
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM restaurant WHERE name = 'Punjabi Tadka');

INSERT INTO restaurant
    (name, cusine_type, delivery_time, address, admin_user_id, rating, is_active, image)
SELECT 'Dragon Wok', 'Chinese', 30, '5th Block, Koramangala, Bengaluru 560095', NULL, 4.1, 1, 'images/restaurants/dragon-wok.svg'
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM restaurant WHERE name = 'Dragon Wok');

INSERT INTO restaurant
    (name, cusine_type, delivery_time, address, admin_user_id, rating, is_active, image)
SELECT 'La Piazza', 'Italian', 40, 'Church Street, Bengaluru 560001', NULL, 4.4, 1, 'images/restaurants/la-piazza.svg'
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM restaurant WHERE name = 'La Piazza');

INSERT INTO restaurant
    (name, cusine_type, delivery_time, address, admin_user_id, rating, is_active, image)
SELECT 'Nawabi Biryani House', 'Biryani', 40, 'Shivajinagar, Bengaluru 560051', NULL, 4.6, 1, 'images/restaurants/nawabi-biryani-house.svg'
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM restaurant WHERE name = 'Nawabi Biryani House');

INSERT INTO restaurant
    (name, cusine_type, delivery_time, address, admin_user_id, rating, is_active, image)
SELECT 'Spice Route Biryani', 'Biryani', 35, 'Sector 2, HSR Layout, Bengaluru 560102', NULL, 4.2, 1, 'images/restaurants/spice-route-biryani.svg'
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM restaurant WHERE name = 'Spice Route Biryani');

INSERT INTO restaurant
    (name, cusine_type, delivery_time, address, admin_user_id, rating, is_active, image)
SELECT 'Burger Barn', 'Fast Food', 25, '1st Stage, BTM Layout, Bengaluru 560029', NULL, 4.0, 1, 'images/restaurants/burger-barn.svg'
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM restaurant WHERE name = 'Burger Barn');

INSERT INTO restaurant
    (name, cusine_type, delivery_time, address, admin_user_id, rating, is_active, image)
SELECT 'Sweet Tooth Dessert Parlour', 'Desserts', 30, 'Residency Road, Bengaluru 560025', NULL, 4.7, 1, 'images/restaurants/sweet-tooth-dessert-parlour.svg'
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM restaurant WHERE name = 'Sweet Tooth Dessert Parlour');

INSERT INTO restaurant
    (name, cusine_type, delivery_time, address, admin_user_id, rating, is_active, image)
SELECT 'Green Bowl Kitchen', 'Healthy Food', 25, 'Whitefield Main Road, Bengaluru 560066', NULL, 4.3, 1, 'images/restaurants/green-bowl-kitchen.svg'
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM restaurant WHERE name = 'Green Bowl Kitchen');


-- ---------------------------------------------------------------------
-- PART 2 : MENU ITEMS  (restaurant_id is looked up by restaurant name,
--          so the ids are always valid and never hard-coded)
-- ---------------------------------------------------------------------

-- Namma Tiffin House (6 items)

INSERT INTO menu
    (restraunt_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restraunt_id, 'Masala Dosa', 'Crispy rice crepe filled with spiced potato masala, served with chutneys and sambar.', 90.00, 1, 'Breakfast', NOW(), NOW(), NULL, 'images/food/namma-tiffin-house-masala-dosa.svg'
FROM restaurant r
WHERE r.name = 'Namma Tiffin House'
  AND NOT EXISTS (SELECT 1 FROM menu m
                  WHERE m.restraunt_id = r.restraunt_id AND m.item_name = 'Masala Dosa');

INSERT INTO menu
    (restraunt_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restraunt_id, 'Idli Vada Combo', 'Two soft idlis and one crisp medu vada with sambar and coconut chutney.', 80.00, 1, 'Breakfast', NOW(), NOW(), NULL, 'images/food/namma-tiffin-house-idli-vada-combo.svg'
FROM restaurant r
WHERE r.name = 'Namma Tiffin House'
  AND NOT EXISTS (SELECT 1 FROM menu m
                  WHERE m.restraunt_id = r.restraunt_id AND m.item_name = 'Idli Vada Combo');

INSERT INTO menu
    (restraunt_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restraunt_id, 'Ghee Podi Dosa', 'Golden dosa roasted in ghee and dusted with spicy gunpowder podi.', 110.00, 1, 'Breakfast', NOW(), NOW(), NULL, 'images/food/namma-tiffin-house-ghee-podi-dosa.svg'
FROM restaurant r
WHERE r.name = 'Namma Tiffin House'
  AND NOT EXISTS (SELECT 1 FROM menu m
                  WHERE m.restraunt_id = r.restraunt_id AND m.item_name = 'Ghee Podi Dosa');

INSERT INTO menu
    (restraunt_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restraunt_id, 'Bisi Bele Bath', 'Traditional Karnataka rice and lentil dish with vegetables and ghee.', 120.00, 1, 'Main Course', NOW(), NOW(), NULL, 'images/food/namma-tiffin-house-bisi-bele-bath.svg'
FROM restaurant r
WHERE r.name = 'Namma Tiffin House'
  AND NOT EXISTS (SELECT 1 FROM menu m
                  WHERE m.restraunt_id = r.restraunt_id AND m.item_name = 'Bisi Bele Bath');

INSERT INTO menu
    (restraunt_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restraunt_id, 'Medu Vada (2 pcs)', 'Crispy lentil doughnuts served hot with sambar and chutney.', 60.00, 1, 'Snacks', NOW(), NOW(), NULL, 'images/food/namma-tiffin-house-medu-vada-2-pcs.svg'
FROM restaurant r
WHERE r.name = 'Namma Tiffin House'
  AND NOT EXISTS (SELECT 1 FROM menu m
                  WHERE m.restraunt_id = r.restraunt_id AND m.item_name = 'Medu Vada (2 pcs)');

INSERT INTO menu
    (restraunt_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restraunt_id, 'Filter Coffee', 'Strong South Indian filter coffee with frothy milk.', 40.00, 1, 'Beverages', NOW(), NOW(), NULL, 'images/food/namma-tiffin-house-filter-coffee.svg'
FROM restaurant r
WHERE r.name = 'Namma Tiffin House'
  AND NOT EXISTS (SELECT 1 FROM menu m
                  WHERE m.restraunt_id = r.restraunt_id AND m.item_name = 'Filter Coffee');

-- Malabar Meals (6 items)

INSERT INTO menu
    (restraunt_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restraunt_id, 'Kerala Veg Meals', 'Rice with sambar, avial, thoran, pickle, papad and payasam.', 160.00, 1, 'Main Course', NOW(), NOW(), NULL, 'images/food/malabar-meals-kerala-veg-meals.svg'
FROM restaurant r
WHERE r.name = 'Malabar Meals'
  AND NOT EXISTS (SELECT 1 FROM menu m
                  WHERE m.restraunt_id = r.restraunt_id AND m.item_name = 'Kerala Veg Meals');

INSERT INTO menu
    (restraunt_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restraunt_id, 'Malabar Fish Curry Meals', 'Rice served with tangy coconut fish curry and fried fish.', 240.00, 1, 'Main Course', NOW(), NOW(), NULL, 'images/food/malabar-meals-malabar-fish-curry-meals.svg'
FROM restaurant r
WHERE r.name = 'Malabar Meals'
  AND NOT EXISTS (SELECT 1 FROM menu m
                  WHERE m.restraunt_id = r.restraunt_id AND m.item_name = 'Malabar Fish Curry Meals');

INSERT INTO menu
    (restraunt_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restraunt_id, 'Appam with Veg Stew', 'Soft lacy appams served with mildly spiced vegetable stew.', 150.00, 1, 'Main Course', NOW(), NOW(), NULL, 'images/food/malabar-meals-appam-with-veg-stew.svg'
FROM restaurant r
WHERE r.name = 'Malabar Meals'
  AND NOT EXISTS (SELECT 1 FROM menu m
                  WHERE m.restraunt_id = r.restraunt_id AND m.item_name = 'Appam with Veg Stew');

INSERT INTO menu
    (restraunt_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restraunt_id, 'Kerala Parotta (2 pcs)', 'Flaky layered parotta made fresh on the griddle.', 70.00, 1, 'Breads', NOW(), NOW(), NULL, 'images/food/malabar-meals-kerala-parotta-2-pcs.svg'
FROM restaurant r
WHERE r.name = 'Malabar Meals'
  AND NOT EXISTS (SELECT 1 FROM menu m
                  WHERE m.restraunt_id = r.restraunt_id AND m.item_name = 'Kerala Parotta (2 pcs)');

INSERT INTO menu
    (restraunt_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restraunt_id, 'Chicken Roast', 'Kerala-style pepper chicken roasted with caramelised onions.', 220.00, 1, 'Non-Veg', NOW(), NOW(), NULL, 'images/food/malabar-meals-chicken-roast.svg'
FROM restaurant r
WHERE r.name = 'Malabar Meals'
  AND NOT EXISTS (SELECT 1 FROM menu m
                  WHERE m.restraunt_id = r.restraunt_id AND m.item_name = 'Chicken Roast');

INSERT INTO menu
    (restraunt_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restraunt_id, 'Banana Fry (Pazhampori)', 'Ripe banana slices dipped in batter and fried golden.', 60.00, 1, 'Snacks', NOW(), NOW(), NULL, 'images/food/malabar-meals-banana-fry-pazhampori.svg'
FROM restaurant r
WHERE r.name = 'Malabar Meals'
  AND NOT EXISTS (SELECT 1 FROM menu m
                  WHERE m.restraunt_id = r.restraunt_id AND m.item_name = 'Banana Fry (Pazhampori)');

-- Punjabi Tadka (7 items)

INSERT INTO menu
    (restraunt_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restraunt_id, 'Paneer Butter Masala', 'Soft paneer cubes in a rich, creamy tomato and butter gravy.', 260.00, 1, 'Main Course', NOW(), NOW(), NULL, 'images/food/punjabi-tadka-paneer-butter-masala.svg'
FROM restaurant r
WHERE r.name = 'Punjabi Tadka'
  AND NOT EXISTS (SELECT 1 FROM menu m
                  WHERE m.restraunt_id = r.restraunt_id AND m.item_name = 'Paneer Butter Masala');

INSERT INTO menu
    (restraunt_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restraunt_id, 'Dal Makhani', 'Slow-cooked black lentils finished with butter and cream.', 220.00, 1, 'Main Course', NOW(), NOW(), NULL, 'images/food/punjabi-tadka-dal-makhani.svg'
FROM restaurant r
WHERE r.name = 'Punjabi Tadka'
  AND NOT EXISTS (SELECT 1 FROM menu m
                  WHERE m.restraunt_id = r.restraunt_id AND m.item_name = 'Dal Makhani');

INSERT INTO menu
    (restraunt_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restraunt_id, 'Butter Chicken', 'Tender tandoori chicken in a smooth, mildly sweet tomato gravy.', 320.00, 1, 'Non-Veg', NOW(), NOW(), NULL, 'images/food/punjabi-tadka-butter-chicken.svg'
FROM restaurant r
WHERE r.name = 'Punjabi Tadka'
  AND NOT EXISTS (SELECT 1 FROM menu m
                  WHERE m.restraunt_id = r.restraunt_id AND m.item_name = 'Butter Chicken');

INSERT INTO menu
    (restraunt_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restraunt_id, 'Butter Naan', 'Soft tandoor-baked bread brushed with butter.', 45.00, 1, 'Breads', NOW(), NOW(), NULL, 'images/food/punjabi-tadka-butter-naan.svg'
FROM restaurant r
WHERE r.name = 'Punjabi Tadka'
  AND NOT EXISTS (SELECT 1 FROM menu m
                  WHERE m.restraunt_id = r.restraunt_id AND m.item_name = 'Butter Naan');

INSERT INTO menu
    (restraunt_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restraunt_id, 'Aloo Paratha with Curd', 'Stuffed wheat paratha served with fresh curd and pickle.', 110.00, 1, 'Breakfast', NOW(), NOW(), NULL, 'images/food/punjabi-tadka-aloo-paratha-with-curd.svg'
FROM restaurant r
WHERE r.name = 'Punjabi Tadka'
  AND NOT EXISTS (SELECT 1 FROM menu m
                  WHERE m.restraunt_id = r.restraunt_id AND m.item_name = 'Aloo Paratha with Curd');

INSERT INTO menu
    (restraunt_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restraunt_id, 'Sweet Lassi', 'Thick, chilled Punjabi lassi topped with malai.', 80.00, 1, 'Beverages', NOW(), NOW(), NULL, 'images/food/punjabi-tadka-sweet-lassi.svg'
FROM restaurant r
WHERE r.name = 'Punjabi Tadka'
  AND NOT EXISTS (SELECT 1 FROM menu m
                  WHERE m.restraunt_id = r.restraunt_id AND m.item_name = 'Sweet Lassi');

INSERT INTO menu
    (restraunt_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restraunt_id, 'Veg Thali', 'Dal, paneer sabzi, seasonal vegetable, rice, roti, salad and sweet.', 250.00, 1, 'Thali', NOW(), NOW(), NULL, 'images/food/punjabi-tadka-veg-thali.svg'
FROM restaurant r
WHERE r.name = 'Punjabi Tadka'
  AND NOT EXISTS (SELECT 1 FROM menu m
                  WHERE m.restraunt_id = r.restraunt_id AND m.item_name = 'Veg Thali');

-- Dragon Wok (6 items)

INSERT INTO menu
    (restraunt_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restraunt_id, 'Veg Hakka Noodles', 'Wok-tossed noodles with crunchy vegetables and soy sauce.', 150.00, 1, 'Noodles', NOW(), NOW(), NULL, 'images/food/dragon-wok-veg-hakka-noodles.svg'
FROM restaurant r
WHERE r.name = 'Dragon Wok'
  AND NOT EXISTS (SELECT 1 FROM menu m
                  WHERE m.restraunt_id = r.restraunt_id AND m.item_name = 'Veg Hakka Noodles');

INSERT INTO menu
    (restraunt_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restraunt_id, 'Chicken Fried Rice', 'Fragrant rice stir-fried with chicken, egg and spring onion.', 190.00, 1, 'Rice', NOW(), NOW(), NULL, 'images/food/dragon-wok-chicken-fried-rice.svg'
FROM restaurant r
WHERE r.name = 'Dragon Wok'
  AND NOT EXISTS (SELECT 1 FROM menu m
                  WHERE m.restraunt_id = r.restraunt_id AND m.item_name = 'Chicken Fried Rice');

INSERT INTO menu
    (restraunt_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restraunt_id, 'Chilli Paneer (Dry)', 'Crispy paneer tossed with capsicum, onion and spicy chilli sauce.', 210.00, 1, 'Starters', NOW(), NOW(), NULL, 'images/food/dragon-wok-chilli-paneer-dry.svg'
FROM restaurant r
WHERE r.name = 'Dragon Wok'
  AND NOT EXISTS (SELECT 1 FROM menu m
                  WHERE m.restraunt_id = r.restraunt_id AND m.item_name = 'Chilli Paneer (Dry)');

INSERT INTO menu
    (restraunt_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restraunt_id, 'Veg Manchurian', 'Vegetable dumplings in a tangy, garlicky Manchurian gravy.', 170.00, 1, 'Starters', NOW(), NOW(), NULL, 'images/food/dragon-wok-veg-manchurian.svg'
FROM restaurant r
WHERE r.name = 'Dragon Wok'
  AND NOT EXISTS (SELECT 1 FROM menu m
                  WHERE m.restraunt_id = r.restraunt_id AND m.item_name = 'Veg Manchurian');

INSERT INTO menu
    (restraunt_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restraunt_id, 'Chicken Momos (8 pcs)', 'Steamed dumplings stuffed with chicken, served with red chilli chutney.', 160.00, 1, 'Starters', NOW(), NOW(), NULL, 'images/food/dragon-wok-chicken-momos-8-pcs.svg'
FROM restaurant r
WHERE r.name = 'Dragon Wok'
  AND NOT EXISTS (SELECT 1 FROM menu m
                  WHERE m.restraunt_id = r.restraunt_id AND m.item_name = 'Chicken Momos (8 pcs)');

INSERT INTO menu
    (restraunt_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restraunt_id, 'Hot and Sour Soup', 'Spicy, tangy vegetable soup with pepper and vinegar.', 110.00, 1, 'Soups', NOW(), NOW(), NULL, 'images/food/dragon-wok-hot-and-sour-soup.svg'
FROM restaurant r
WHERE r.name = 'Dragon Wok'
  AND NOT EXISTS (SELECT 1 FROM menu m
                  WHERE m.restraunt_id = r.restraunt_id AND m.item_name = 'Hot and Sour Soup');

-- La Piazza (7 items)

INSERT INTO menu
    (restraunt_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restraunt_id, 'Margherita Pizza', 'Classic pizza with tomato sauce, fresh mozzarella and basil.', 299.00, 1, 'Pizza', NOW(), NOW(), NULL, 'images/food/la-piazza-margherita-pizza.svg'
FROM restaurant r
WHERE r.name = 'La Piazza'
  AND NOT EXISTS (SELECT 1 FROM menu m
                  WHERE m.restraunt_id = r.restraunt_id AND m.item_name = 'Margherita Pizza');

INSERT INTO menu
    (restraunt_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restraunt_id, 'Farmhouse Pizza', 'Loaded with capsicum, onion, mushroom, tomato and sweet corn.', 359.00, 1, 'Pizza', NOW(), NOW(), NULL, 'images/food/la-piazza-farmhouse-pizza.svg'
FROM restaurant r
WHERE r.name = 'La Piazza'
  AND NOT EXISTS (SELECT 1 FROM menu m
                  WHERE m.restraunt_id = r.restraunt_id AND m.item_name = 'Farmhouse Pizza');

INSERT INTO menu
    (restraunt_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restraunt_id, 'Penne Arrabbiata', 'Penne pasta in a spicy tomato and garlic sauce.', 260.00, 1, 'Pasta', NOW(), NOW(), NULL, 'images/food/la-piazza-penne-arrabbiata.svg'
FROM restaurant r
WHERE r.name = 'La Piazza'
  AND NOT EXISTS (SELECT 1 FROM menu m
                  WHERE m.restraunt_id = r.restraunt_id AND m.item_name = 'Penne Arrabbiata');

INSERT INTO menu
    (restraunt_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restraunt_id, 'White Sauce Pasta', 'Creamy white sauce pasta with mushrooms and herbs.', 280.00, 1, 'Pasta', NOW(), NOW(), NULL, 'images/food/la-piazza-white-sauce-pasta.svg'
FROM restaurant r
WHERE r.name = 'La Piazza'
  AND NOT EXISTS (SELECT 1 FROM menu m
                  WHERE m.restraunt_id = r.restraunt_id AND m.item_name = 'White Sauce Pasta');

INSERT INTO menu
    (restraunt_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restraunt_id, 'Garlic Bread with Cheese', 'Toasted garlic bread topped with melted mozzarella.', 150.00, 1, 'Starters', NOW(), NOW(), NULL, 'images/food/la-piazza-garlic-bread-with-cheese.svg'
FROM restaurant r
WHERE r.name = 'La Piazza'
  AND NOT EXISTS (SELECT 1 FROM menu m
                  WHERE m.restraunt_id = r.restraunt_id AND m.item_name = 'Garlic Bread with Cheese');

INSERT INTO menu
    (restraunt_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restraunt_id, 'Veg Lasagne', 'Layers of pasta, vegetables, white sauce and baked cheese.', 330.00, 1, 'Main Course', NOW(), NOW(), NULL, 'images/food/la-piazza-veg-lasagne.svg'
FROM restaurant r
WHERE r.name = 'La Piazza'
  AND NOT EXISTS (SELECT 1 FROM menu m
                  WHERE m.restraunt_id = r.restraunt_id AND m.item_name = 'Veg Lasagne');

INSERT INTO menu
    (restraunt_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restraunt_id, 'Tiramisu', 'Coffee-soaked sponge layered with mascarpone cream and cocoa.', 190.00, 1, 'Desserts', NOW(), NOW(), NULL, 'images/food/la-piazza-tiramisu.svg'
FROM restaurant r
WHERE r.name = 'La Piazza'
  AND NOT EXISTS (SELECT 1 FROM menu m
                  WHERE m.restraunt_id = r.restraunt_id AND m.item_name = 'Tiramisu');

-- Nawabi Biryani House (7 items)

INSERT INTO menu
    (restraunt_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restraunt_id, 'Hyderabadi Chicken Dum Biryani', 'Basmati rice and marinated chicken slow-cooked on dum with saffron.', 280.00, 1, 'Biryani', NOW(), NOW(), NULL, 'images/food/nawabi-biryani-house-hyderabadi-chicken-dum-biryani.svg'
FROM restaurant r
WHERE r.name = 'Nawabi Biryani House'
  AND NOT EXISTS (SELECT 1 FROM menu m
                  WHERE m.restraunt_id = r.restraunt_id AND m.item_name = 'Hyderabadi Chicken Dum Biryani');

INSERT INTO menu
    (restraunt_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restraunt_id, 'Mutton Biryani', 'Tender mutton pieces layered with aromatic long-grain rice.', 360.00, 1, 'Biryani', NOW(), NOW(), NULL, 'images/food/nawabi-biryani-house-mutton-biryani.svg'
FROM restaurant r
WHERE r.name = 'Nawabi Biryani House'
  AND NOT EXISTS (SELECT 1 FROM menu m
                  WHERE m.restraunt_id = r.restraunt_id AND m.item_name = 'Mutton Biryani');

INSERT INTO menu
    (restraunt_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restraunt_id, 'Veg Dum Biryani', 'Garden vegetables and paneer cooked with fragrant spices and rice.', 220.00, 1, 'Biryani', NOW(), NOW(), NULL, 'images/food/nawabi-biryani-house-veg-dum-biryani.svg'
FROM restaurant r
WHERE r.name = 'Nawabi Biryani House'
  AND NOT EXISTS (SELECT 1 FROM menu m
                  WHERE m.restraunt_id = r.restraunt_id AND m.item_name = 'Veg Dum Biryani');

INSERT INTO menu
    (restraunt_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restraunt_id, 'Egg Biryani', 'Boiled eggs tossed in masala and layered with basmati rice.', 200.00, 1, 'Biryani', NOW(), NOW(), NULL, 'images/food/nawabi-biryani-house-egg-biryani.svg'
FROM restaurant r
WHERE r.name = 'Nawabi Biryani House'
  AND NOT EXISTS (SELECT 1 FROM menu m
                  WHERE m.restraunt_id = r.restraunt_id AND m.item_name = 'Egg Biryani');

INSERT INTO menu
    (restraunt_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restraunt_id, 'Chicken 65', 'Spicy, crispy deep-fried chicken with curry leaves.', 220.00, 1, 'Starters', NOW(), NOW(), NULL, 'images/food/nawabi-biryani-house-chicken-65.svg'
FROM restaurant r
WHERE r.name = 'Nawabi Biryani House'
  AND NOT EXISTS (SELECT 1 FROM menu m
                  WHERE m.restraunt_id = r.restraunt_id AND m.item_name = 'Chicken 65');

INSERT INTO menu
    (restraunt_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restraunt_id, 'Mirchi ka Salan', 'Tangy peanut and sesame gravy with green chillies.', 70.00, 1, 'Sides', NOW(), NOW(), NULL, 'images/food/nawabi-biryani-house-mirchi-ka-salan.svg'
FROM restaurant r
WHERE r.name = 'Nawabi Biryani House'
  AND NOT EXISTS (SELECT 1 FROM menu m
                  WHERE m.restraunt_id = r.restraunt_id AND m.item_name = 'Mirchi ka Salan');

INSERT INTO menu
    (restraunt_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restraunt_id, 'Double Ka Meetha', 'Hyderabadi bread pudding soaked in saffron milk.', 90.00, 1, 'Desserts', NOW(), NOW(), NULL, 'images/food/nawabi-biryani-house-double-ka-meetha.svg'
FROM restaurant r
WHERE r.name = 'Nawabi Biryani House'
  AND NOT EXISTS (SELECT 1 FROM menu m
                  WHERE m.restraunt_id = r.restraunt_id AND m.item_name = 'Double Ka Meetha');

-- Spice Route Biryani (6 items)

INSERT INTO menu
    (restraunt_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restraunt_id, 'Donne Chicken Biryani', 'Bengaluru-style green masala biryani served in a leaf bowl.', 240.00, 1, 'Biryani', NOW(), NOW(), NULL, 'images/food/spice-route-biryani-donne-chicken-biryani.svg'
FROM restaurant r
WHERE r.name = 'Spice Route Biryani'
  AND NOT EXISTS (SELECT 1 FROM menu m
                  WHERE m.restraunt_id = r.restraunt_id AND m.item_name = 'Donne Chicken Biryani');

INSERT INTO menu
    (restraunt_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restraunt_id, 'Paneer Tikka Biryani', 'Smoky paneer tikka layered with rice and mint.', 250.00, 1, 'Biryani', NOW(), NOW(), NULL, 'images/food/spice-route-biryani-paneer-tikka-biryani.svg'
FROM restaurant r
WHERE r.name = 'Spice Route Biryani'
  AND NOT EXISTS (SELECT 1 FROM menu m
                  WHERE m.restraunt_id = r.restraunt_id AND m.item_name = 'Paneer Tikka Biryani');

INSERT INTO menu
    (restraunt_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restraunt_id, 'Prawn Biryani', 'Juicy prawns cooked in coastal masala with basmati rice.', 340.00, 1, 'Biryani', NOW(), NOW(), NULL, 'images/food/spice-route-biryani-prawn-biryani.svg'
FROM restaurant r
WHERE r.name = 'Spice Route Biryani'
  AND NOT EXISTS (SELECT 1 FROM menu m
                  WHERE m.restraunt_id = r.restraunt_id AND m.item_name = 'Prawn Biryani');

INSERT INTO menu
    (restraunt_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restraunt_id, 'Chicken Lollipop (6 pcs)', 'Crispy chicken drumettes in a spicy Schezwan coating.', 230.00, 1, 'Starters', NOW(), NOW(), NULL, 'images/food/spice-route-biryani-chicken-lollipop-6-pcs.svg'
FROM restaurant r
WHERE r.name = 'Spice Route Biryani'
  AND NOT EXISTS (SELECT 1 FROM menu m
                  WHERE m.restraunt_id = r.restraunt_id AND m.item_name = 'Chicken Lollipop (6 pcs)');

INSERT INTO menu
    (restraunt_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restraunt_id, 'Raita', 'Chilled curd with onion, cucumber and cumin.', 50.00, 1, 'Sides', NOW(), NOW(), NULL, 'images/food/spice-route-biryani-raita.svg'
FROM restaurant r
WHERE r.name = 'Spice Route Biryani'
  AND NOT EXISTS (SELECT 1 FROM menu m
                  WHERE m.restraunt_id = r.restraunt_id AND m.item_name = 'Raita');

INSERT INTO menu
    (restraunt_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restraunt_id, 'Gulab Jamun (2 pcs)', 'Soft milk dumplings soaked in rose-scented sugar syrup.', 70.00, 1, 'Desserts', NOW(), NOW(), NULL, 'images/food/spice-route-biryani-gulab-jamun-2-pcs.svg'
FROM restaurant r
WHERE r.name = 'Spice Route Biryani'
  AND NOT EXISTS (SELECT 1 FROM menu m
                  WHERE m.restraunt_id = r.restraunt_id AND m.item_name = 'Gulab Jamun (2 pcs)');

-- Burger Barn (7 items)

INSERT INTO menu
    (restraunt_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restraunt_id, 'Classic Veg Burger', 'Crispy veg patty with lettuce, tomato and house mayo in a toasted bun.', 99.00, 1, 'Burgers', NOW(), NOW(), NULL, 'images/food/burger-barn-classic-veg-burger.svg'
FROM restaurant r
WHERE r.name = 'Burger Barn'
  AND NOT EXISTS (SELECT 1 FROM menu m
                  WHERE m.restraunt_id = r.restraunt_id AND m.item_name = 'Classic Veg Burger');

INSERT INTO menu
    (restraunt_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restraunt_id, 'Crispy Chicken Burger', 'Fried chicken fillet with cheese slice and smoky sauce.', 149.00, 1, 'Burgers', NOW(), NOW(), NULL, 'images/food/burger-barn-crispy-chicken-burger.svg'
FROM restaurant r
WHERE r.name = 'Burger Barn'
  AND NOT EXISTS (SELECT 1 FROM menu m
                  WHERE m.restraunt_id = r.restraunt_id AND m.item_name = 'Crispy Chicken Burger');

INSERT INTO menu
    (restraunt_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restraunt_id, 'Double Cheese Burger', 'Two grilled patties with double cheese and caramelised onions.', 189.00, 1, 'Burgers', NOW(), NOW(), NULL, 'images/food/burger-barn-double-cheese-burger.svg'
FROM restaurant r
WHERE r.name = 'Burger Barn'
  AND NOT EXISTS (SELECT 1 FROM menu m
                  WHERE m.restraunt_id = r.restraunt_id AND m.item_name = 'Double Cheese Burger');

INSERT INTO menu
    (restraunt_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restraunt_id, 'French Fries (Large)', 'Golden, salted fries served with ketchup.', 99.00, 1, 'Sides', NOW(), NOW(), NULL, 'images/food/burger-barn-french-fries-large.svg'
FROM restaurant r
WHERE r.name = 'Burger Barn'
  AND NOT EXISTS (SELECT 1 FROM menu m
                  WHERE m.restraunt_id = r.restraunt_id AND m.item_name = 'French Fries (Large)');

INSERT INTO menu
    (restraunt_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restraunt_id, 'Peri Peri Fries', 'Fries tossed in tangy peri peri seasoning.', 119.00, 1, 'Sides', NOW(), NOW(), NULL, 'images/food/burger-barn-peri-peri-fries.svg'
FROM restaurant r
WHERE r.name = 'Burger Barn'
  AND NOT EXISTS (SELECT 1 FROM menu m
                  WHERE m.restraunt_id = r.restraunt_id AND m.item_name = 'Peri Peri Fries');

INSERT INTO menu
    (restraunt_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restraunt_id, 'Chicken Wings (6 pcs)', 'Crispy wings tossed in BBQ sauce.', 199.00, 1, 'Starters', NOW(), NOW(), NULL, 'images/food/burger-barn-chicken-wings-6-pcs.svg'
FROM restaurant r
WHERE r.name = 'Burger Barn'
  AND NOT EXISTS (SELECT 1 FROM menu m
                  WHERE m.restraunt_id = r.restraunt_id AND m.item_name = 'Chicken Wings (6 pcs)');

INSERT INTO menu
    (restraunt_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restraunt_id, 'Cold Coffee', 'Thick, chilled coffee blended with ice cream.', 110.00, 1, 'Beverages', NOW(), NOW(), NULL, 'images/food/burger-barn-cold-coffee.svg'
FROM restaurant r
WHERE r.name = 'Burger Barn'
  AND NOT EXISTS (SELECT 1 FROM menu m
                  WHERE m.restraunt_id = r.restraunt_id AND m.item_name = 'Cold Coffee');

-- Sweet Tooth Dessert Parlour (6 items)

INSERT INTO menu
    (restraunt_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restraunt_id, 'Chocolate Truffle Pastry', 'Rich dark chocolate sponge layered with ganache.', 120.00, 1, 'Pastries', NOW(), NOW(), NULL, 'images/food/sweet-tooth-dessert-parlour-chocolate-truffle-pastry.svg'
FROM restaurant r
WHERE r.name = 'Sweet Tooth Dessert Parlour'
  AND NOT EXISTS (SELECT 1 FROM menu m
                  WHERE m.restraunt_id = r.restraunt_id AND m.item_name = 'Chocolate Truffle Pastry');

INSERT INTO menu
    (restraunt_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restraunt_id, 'Red Velvet Cake Slice', 'Velvety red sponge with cream cheese frosting.', 140.00, 1, 'Cakes', NOW(), NOW(), NULL, 'images/food/sweet-tooth-dessert-parlour-red-velvet-cake-slice.svg'
FROM restaurant r
WHERE r.name = 'Sweet Tooth Dessert Parlour'
  AND NOT EXISTS (SELECT 1 FROM menu m
                  WHERE m.restraunt_id = r.restraunt_id AND m.item_name = 'Red Velvet Cake Slice');

INSERT INTO menu
    (restraunt_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restraunt_id, 'Hot Chocolate Brownie with Ice Cream', 'Warm fudgy brownie topped with vanilla ice cream and chocolate sauce.', 170.00, 1, 'Desserts', NOW(), NOW(), NULL, 'images/food/sweet-tooth-dessert-parlour-hot-chocolate-brownie-with-ice-cream.svg'
FROM restaurant r
WHERE r.name = 'Sweet Tooth Dessert Parlour'
  AND NOT EXISTS (SELECT 1 FROM menu m
                  WHERE m.restraunt_id = r.restraunt_id AND m.item_name = 'Hot Chocolate Brownie with Ice Cream');

INSERT INTO menu
    (restraunt_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restraunt_id, 'Belgian Chocolate Waffle', 'Crisp waffle drizzled with Belgian chocolate sauce.', 160.00, 1, 'Desserts', NOW(), NOW(), NULL, 'images/food/sweet-tooth-dessert-parlour-belgian-chocolate-waffle.svg'
FROM restaurant r
WHERE r.name = 'Sweet Tooth Dessert Parlour'
  AND NOT EXISTS (SELECT 1 FROM menu m
                  WHERE m.restraunt_id = r.restraunt_id AND m.item_name = 'Belgian Chocolate Waffle');

INSERT INTO menu
    (restraunt_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restraunt_id, 'Mango Cheesecake', 'Creamy baked cheesecake topped with fresh mango puree.', 180.00, 1, 'Cakes', NOW(), NOW(), NULL, 'images/food/sweet-tooth-dessert-parlour-mango-cheesecake.svg'
FROM restaurant r
WHERE r.name = 'Sweet Tooth Dessert Parlour'
  AND NOT EXISTS (SELECT 1 FROM menu m
                  WHERE m.restraunt_id = r.restraunt_id AND m.item_name = 'Mango Cheesecake');

INSERT INTO menu
    (restraunt_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restraunt_id, 'Butterscotch Sundae', 'Vanilla and butterscotch ice cream with nuts and caramel.', 150.00, 1, 'Ice Cream', NOW(), NOW(), NULL, 'images/food/sweet-tooth-dessert-parlour-butterscotch-sundae.svg'
FROM restaurant r
WHERE r.name = 'Sweet Tooth Dessert Parlour'
  AND NOT EXISTS (SELECT 1 FROM menu m
                  WHERE m.restraunt_id = r.restraunt_id AND m.item_name = 'Butterscotch Sundae');

-- Green Bowl Kitchen (6 items)

INSERT INTO menu
    (restraunt_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restraunt_id, 'Quinoa Veggie Bowl', 'Quinoa with roasted vegetables, chickpeas and lemon-tahini dressing.', 260.00, 1, 'Bowls', NOW(), NOW(), NULL, 'images/food/green-bowl-kitchen-quinoa-veggie-bowl.svg'
FROM restaurant r
WHERE r.name = 'Green Bowl Kitchen'
  AND NOT EXISTS (SELECT 1 FROM menu m
                  WHERE m.restraunt_id = r.restraunt_id AND m.item_name = 'Quinoa Veggie Bowl');

INSERT INTO menu
    (restraunt_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restraunt_id, 'Grilled Chicken Salad', 'Grilled chicken breast over greens, cherry tomato and olives.', 290.00, 1, 'Salads', NOW(), NOW(), NULL, 'images/food/green-bowl-kitchen-grilled-chicken-salad.svg'
FROM restaurant r
WHERE r.name = 'Green Bowl Kitchen'
  AND NOT EXISTS (SELECT 1 FROM menu m
                  WHERE m.restraunt_id = r.restraunt_id AND m.item_name = 'Grilled Chicken Salad');

INSERT INTO menu
    (restraunt_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restraunt_id, 'Paneer Tikka Wrap', 'Whole wheat wrap with grilled paneer, mint chutney and crunchy veggies.', 200.00, 1, 'Wraps', NOW(), NOW(), NULL, 'images/food/green-bowl-kitchen-paneer-tikka-wrap.svg'
FROM restaurant r
WHERE r.name = 'Green Bowl Kitchen'
  AND NOT EXISTS (SELECT 1 FROM menu m
                  WHERE m.restraunt_id = r.restraunt_id AND m.item_name = 'Paneer Tikka Wrap');

INSERT INTO menu
    (restraunt_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restraunt_id, 'Greek Salad', 'Cucumber, tomato, olives and feta with olive oil dressing.', 230.00, 1, 'Salads', NOW(), NOW(), NULL, 'images/food/green-bowl-kitchen-greek-salad.svg'
FROM restaurant r
WHERE r.name = 'Green Bowl Kitchen'
  AND NOT EXISTS (SELECT 1 FROM menu m
                  WHERE m.restraunt_id = r.restraunt_id AND m.item_name = 'Greek Salad');

INSERT INTO menu
    (restraunt_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restraunt_id, 'Fresh Fruit Bowl', 'Seasonal fruits served chilled with a squeeze of lime.', 150.00, 1, 'Bowls', NOW(), NOW(), NULL, 'images/food/green-bowl-kitchen-fresh-fruit-bowl.svg'
FROM restaurant r
WHERE r.name = 'Green Bowl Kitchen'
  AND NOT EXISTS (SELECT 1 FROM menu m
                  WHERE m.restraunt_id = r.restraunt_id AND m.item_name = 'Fresh Fruit Bowl');

INSERT INTO menu
    (restraunt_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restraunt_id, 'Green Detox Smoothie', 'Spinach, apple, cucumber and ginger blended fresh.', 140.00, 1, 'Beverages', NOW(), NOW(), NULL, 'images/food/green-bowl-kitchen-green-detox-smoothie.svg'
FROM restaurant r
WHERE r.name = 'Green Bowl Kitchen'
  AND NOT EXISTS (SELECT 1 FROM menu m
                  WHERE m.restraunt_id = r.restraunt_id AND m.item_name = 'Green Detox Smoothie');

COMMIT;

-- ---------------------------------------------------------------------
-- PART 3 : QUICK CHECKS (read-only). Expected after the first run:
--   10 restaurants, each with 6 or 7 menu items.
-- ---------------------------------------------------------------------
SELECT r.restraunt_id, r.name, r.cusine_type, r.delivery_time, r.rating, r.is_active,
       COUNT(m.menu_id) AS menu_items
FROM restaurant r
LEFT JOIN menu m ON m.restraunt_id = r.restraunt_id AND m.is_available = 1 AND m.deleted_at IS NULL
GROUP BY r.restraunt_id, r.name, r.cusine_type, r.delivery_time, r.rating, r.is_active
ORDER BY r.restraunt_id;
