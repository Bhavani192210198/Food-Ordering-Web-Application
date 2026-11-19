-- =====================================================================
-- FoodApp  -  SCRIPT 2 of 2  :  images + 10 new restaurants with menus
-- Run SCRIPT 1 first.
-- Nothing is deleted, dropped or recreated.  Safe to run more than once.
-- =====================================================================

USE foodapp;

START TRANSACTION;

-- ---------------------------------------------------------------------
-- PART A : give your 20 existing restaurants and 60 existing menu items
--          working images.  Only the  image  column is updated, and only
--          where it still holds the original plain file name
--          (for example 'burgerking.jpg', which does not exist in the project).
--          If you do not want this, delete everything in PART A.
-- ---------------------------------------------------------------------

UPDATE restaurant SET image = 'images/restaurants/burgerking.svg' WHERE restaurant_id = 1 AND image = 'burgerking.jpg';
UPDATE restaurant SET image = 'images/restaurants/dominos.svg' WHERE restaurant_id = 2 AND image = 'dominos.jpg';
UPDATE restaurant SET image = 'images/restaurants/kfc.svg' WHERE restaurant_id = 3 AND image = 'kfc.jpg';
UPDATE restaurant SET image = 'images/restaurants/andhragunpowder.svg' WHERE restaurant_id = 4 AND image = 'andhragunpowder.jpg';
UPDATE restaurant SET image = 'images/restaurants/punjabitadka.svg' WHERE restaurant_id = 5 AND image = 'punjabitadka.jpg';
UPDATE restaurant SET image = 'images/restaurants/chinatown.svg' WHERE restaurant_id = 6 AND image = 'chinatown.jpg';
UPDATE restaurant SET image = 'images/restaurants/biryanihouse.svg' WHERE restaurant_id = 7 AND image = 'biryanihouse.jpg';
UPDATE restaurant SET image = 'images/restaurants/pizzahut.svg' WHERE restaurant_id = 8 AND image = 'pizzahut.jpg';
UPDATE restaurant SET image = 'images/restaurants/subway.svg' WHERE restaurant_id = 9 AND image = 'subway.jpg';
UPDATE restaurant SET image = 'images/restaurants/meghana.svg' WHERE restaurant_id = 10 AND image = 'meghana.jpg';
UPDATE restaurant SET image = 'images/restaurants/truffles.svg' WHERE restaurant_id = 11 AND image = 'truffles.jpg';
UPDATE restaurant SET image = 'images/restaurants/empire.svg' WHERE restaurant_id = 12 AND image = 'empire.jpg';
UPDATE restaurant SET image = 'images/restaurants/srisagar.svg' WHERE restaurant_id = 13 AND image = 'srisagar.jpg';
UPDATE restaurant SET image = 'images/restaurants/faasos.svg' WHERE restaurant_id = 14 AND image = 'faasos.jpg';
UPDATE restaurant SET image = 'images/restaurants/behrouz.svg' WHERE restaurant_id = 15 AND image = 'behrouz.jpg';
UPDATE restaurant SET image = 'images/restaurants/onesta.svg' WHERE restaurant_id = 16 AND image = 'onesta.jpg';
UPDATE restaurant SET image = 'images/restaurants/chinita.svg' WHERE restaurant_id = 17 AND image = 'chinita.jpg';
UPDATE restaurant SET image = 'images/restaurants/cornerhouse.svg' WHERE restaurant_id = 18 AND image = 'cornerhouse.jpg';
UPDATE restaurant SET image = 'images/restaurants/nandhini.svg' WHERE restaurant_id = 19 AND image = 'nandhini.jpg';
UPDATE restaurant SET image = 'images/restaurants/wowmomo.svg' WHERE restaurant_id = 20 AND image = 'wowmomo.jpg';

UPDATE menu SET image = 'images/food/whopper.svg' WHERE menu_id = 1 AND image = 'whopper.jpg';
UPDATE menu SET image = 'images/food/chickenfries.svg' WHERE menu_id = 2 AND image = 'chickenfries.jpg';
UPDATE menu SET image = 'images/food/vegburger.svg' WHERE menu_id = 3 AND image = 'vegburger.jpg';
UPDATE menu SET image = 'images/food/margherita.svg' WHERE menu_id = 4 AND image = 'margherita.jpg';
UPDATE menu SET image = 'images/food/farmhouse.svg' WHERE menu_id = 5 AND image = 'farmhouse.jpg';
UPDATE menu SET image = 'images/food/garlicbread.svg' WHERE menu_id = 6 AND image = 'garlicbread.jpg';
UPDATE menu SET image = 'images/food/zinger.svg' WHERE menu_id = 7 AND image = 'zinger.jpg';
UPDATE menu SET image = 'images/food/hotwings.svg' WHERE menu_id = 8 AND image = 'hotwings.jpg';
UPDATE menu SET image = 'images/food/popcorn.svg' WHERE menu_id = 9 AND image = 'popcorn.jpg';
UPDATE menu SET image = 'images/food/chickenbiryani.svg' WHERE menu_id = 10 AND image = 'chickenbiryani.jpg';
UPDATE menu SET image = 'images/food/gonguramutton.svg' WHERE menu_id = 11 AND image = 'gonguramutton.jpg';
UPDATE menu SET image = 'images/food/pesarattu.svg' WHERE menu_id = 12 AND image = 'pesarattu.jpg';
UPDATE menu SET image = 'images/food/butterchicken.svg' WHERE menu_id = 13 AND image = 'butterchicken.jpg';
UPDATE menu SET image = 'images/food/dalmakhani.svg' WHERE menu_id = 14 AND image = 'dalmakhani.jpg';
UPDATE menu SET image = 'images/food/tandooriroti.svg' WHERE menu_id = 15 AND image = 'tandooriroti.jpg';
UPDATE menu SET image = 'images/food/hakkanoodles.svg' WHERE menu_id = 16 AND image = 'hakkanoodles.jpg';
UPDATE menu SET image = 'images/food/chillichicken.svg' WHERE menu_id = 17 AND image = 'chillichicken.jpg';
UPDATE menu SET image = 'images/food/manchow.svg' WHERE menu_id = 18 AND image = 'manchow.jpg';
UPDATE menu SET image = 'images/food/hydbiryani.svg' WHERE menu_id = 19 AND image = 'hydbiryani.jpg';
UPDATE menu SET image = 'images/food/muttonbiryani.svg' WHERE menu_id = 20 AND image = 'muttonbiryani.jpg';
UPDATE menu SET image = 'images/food/vegbiryani.svg' WHERE menu_id = 21 AND image = 'vegbiryani.jpg';
UPDATE menu SET image = 'images/food/peppypaneer.svg' WHERE menu_id = 22 AND image = 'peppypaneer.jpg';
UPDATE menu SET image = 'images/food/pepperoni.svg' WHERE menu_id = 23 AND image = 'pepperoni.jpg';
UPDATE menu SET image = 'images/food/stuffedgarlic.svg' WHERE menu_id = 24 AND image = 'stuffedgarlic.jpg';
UPDATE menu SET image = 'images/food/veggiedelite.svg' WHERE menu_id = 25 AND image = 'veggiedelite.jpg';
UPDATE menu SET image = 'images/food/chickenteriyaki.svg' WHERE menu_id = 26 AND image = 'chickenteriyaki.jpg';
UPDATE menu SET image = 'images/food/cookies.svg' WHERE menu_id = 27 AND image = 'cookies.jpg';
UPDATE menu SET image = 'images/food/bonelessbiryani.svg' WHERE menu_id = 28 AND image = 'bonelessbiryani.jpg';
UPDATE menu SET image = 'images/food/chicken65.svg' WHERE menu_id = 29 AND image = 'chicken65.jpg';
UPDATE menu SET image = 'images/food/kajuchicken.svg' WHERE menu_id = 30 AND image = 'kajuchicken.jpg';
UPDATE menu SET image = 'images/food/classicbeef.svg' WHERE menu_id = 31 AND image = 'classicbeef.jpg';
UPDATE menu SET image = 'images/food/chickensteak.svg' WHERE menu_id = 32 AND image = 'chickensteak.jpg';
UPDATE menu SET image = 'images/food/chocshake.svg' WHERE menu_id = 33 AND image = 'chocshake.jpg';
UPDATE menu SET image = 'images/food/kheemaroll.svg' WHERE menu_id = 34 AND image = 'kheemaroll.jpg';
UPDATE menu SET image = 'images/food/paneerbm.svg' WHERE menu_id = 35 AND image = 'paneerbm.jpg';
UPDATE menu SET image = 'images/food/alfaham.svg' WHERE menu_id = 36 AND image = 'alfaham.jpg';
UPDATE menu SET image = 'images/food/masaladosa.svg' WHERE menu_id = 37 AND image = 'masaladosa.jpg';
UPDATE menu SET image = 'images/food/idlivada.svg' WHERE menu_id = 38 AND image = 'idlivada.jpg';
UPDATE menu SET image = 'images/food/filtercoffee.svg' WHERE menu_id = 39 AND image = 'filtercoffee.jpg';
UPDATE menu SET image = 'images/food/chickenwrap.svg' WHERE menu_id = 40 AND image = 'chickenwrap.jpg';
UPDATE menu SET image = 'images/food/paneerroll.svg' WHERE menu_id = 41 AND image = 'paneerroll.jpg';
UPDATE menu SET image = 'images/food/fries.svg' WHERE menu_id = 42 AND image = 'fries.jpg';
UPDATE menu SET image = 'images/food/awadhi.svg' WHERE menu_id = 43 AND image = 'awadhi.jpg';
UPDATE menu SET image = 'images/food/vegdum.svg' WHERE menu_id = 44 AND image = 'vegdum.jpg';
UPDATE menu SET image = 'images/food/seekh.svg' WHERE menu_id = 45 AND image = 'seekh.jpg';
UPDATE menu SET image = 'images/food/onestafarmhouse.svg' WHERE menu_id = 46 AND image = 'onestafarmhouse.jpg';
UPDATE menu SET image = 'images/food/cheeseburst.svg' WHERE menu_id = 47 AND image = 'cheeseburst.jpg';
UPDATE menu SET image = 'images/food/lavacake.svg' WHERE menu_id = 48 AND image = 'lavacake.jpg';
UPDATE menu SET image = 'images/food/chickentacos.svg' WHERE menu_id = 49 AND image = 'chickentacos.jpg';
UPDATE menu SET image = 'images/food/vegburrito.svg' WHERE menu_id = 50 AND image = 'vegburrito.jpg';
UPDATE menu SET image = 'images/food/nachos.svg' WHERE menu_id = 51 AND image = 'nachos.jpg';
UPDATE menu SET image = 'images/food/deathbychoc.svg' WHERE menu_id = 52 AND image = 'deathbychoc.jpg';
UPDATE menu SET image = 'images/food/butterscotch.svg' WHERE menu_id = 53 AND image = 'butterscotch.jpg';
UPDATE menu SET image = 'images/food/fruitsalad.svg' WHERE menu_id = 54 AND image = 'fruitsalad.jpg';
UPDATE menu SET image = 'images/food/ragimudde.svg' WHERE menu_id = 55 AND image = 'ragimudde.jpg';
UPDATE menu SET image = 'images/food/gheeroast.svg' WHERE menu_id = 56 AND image = 'gheeroast.jpg';
UPDATE menu SET image = 'images/food/bisibelebath.svg' WHERE menu_id = 57 AND image = 'bisibelebath.jpg';
UPDATE menu SET image = 'images/food/chickenmomo.svg' WHERE menu_id = 58 AND image = 'chickenmomo.jpg';
UPDATE menu SET image = 'images/food/friedmomo.svg' WHERE menu_id = 59 AND image = 'friedmomo.jpg';
UPDATE menu SET image = 'images/food/chillimomo.svg' WHERE menu_id = 60 AND image = 'chillimomo.jpg';

-- ---------------------------------------------------------------------
-- PART B : 10 new restaurants  (6 or 7 menu items each)
--          If you only want your existing 20, delete PART B.
-- ---------------------------------------------------------------------

INSERT INTO restaurant
    (name, cuisine_type, delivery_time, address, admin_user_id, rating, is_active, image)
SELECT 'Namma Tiffin House', 'South Indian', 25, '4th Block, Jayanagar, Bengaluru 560011', 1, 4.5, 1, 'images/restaurants/namma-tiffin-house.svg'
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM restaurant WHERE name = 'Namma Tiffin House');

INSERT INTO restaurant
    (name, cuisine_type, delivery_time, address, admin_user_id, rating, is_active, image)
SELECT 'Malabar Meals', 'South Indian', 35, '2nd Stage, Indiranagar, Bengaluru 560038', 1, 4.3, 1, 'images/restaurants/malabar-meals.svg'
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM restaurant WHERE name = 'Malabar Meals');

INSERT INTO restaurant
    (name, cuisine_type, delivery_time, address, admin_user_id, rating, is_active, image)
SELECT 'Tandoori Nights', 'North Indian', 35, 'MG Road, Bengaluru 560001', 1, 4.2, 1, 'images/restaurants/tandoori-nights.svg'
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM restaurant WHERE name = 'Tandoori Nights');

INSERT INTO restaurant
    (name, cuisine_type, delivery_time, address, admin_user_id, rating, is_active, image)
SELECT 'Dragon Wok', 'Chinese', 30, '5th Block, Koramangala, Bengaluru 560095', 1, 4.1, 1, 'images/restaurants/dragon-wok.svg'
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM restaurant WHERE name = 'Dragon Wok');

INSERT INTO restaurant
    (name, cuisine_type, delivery_time, address, admin_user_id, rating, is_active, image)
SELECT 'La Piazza', 'Italian', 40, 'Church Street, Bengaluru 560001', 1, 4.4, 1, 'images/restaurants/la-piazza.svg'
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM restaurant WHERE name = 'La Piazza');

INSERT INTO restaurant
    (name, cuisine_type, delivery_time, address, admin_user_id, rating, is_active, image)
SELECT 'Nawabi Biryani House', 'Biryani', 40, 'Shivajinagar, Bengaluru 560051', 1, 4.6, 1, 'images/restaurants/nawabi-biryani-house.svg'
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM restaurant WHERE name = 'Nawabi Biryani House');

INSERT INTO restaurant
    (name, cuisine_type, delivery_time, address, admin_user_id, rating, is_active, image)
SELECT 'Spice Route Biryani', 'Biryani', 35, 'Sector 2, HSR Layout, Bengaluru 560102', 1, 4.2, 1, 'images/restaurants/spice-route-biryani.svg'
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM restaurant WHERE name = 'Spice Route Biryani');

INSERT INTO restaurant
    (name, cuisine_type, delivery_time, address, admin_user_id, rating, is_active, image)
SELECT 'Burger Barn', 'Fast Food', 25, '1st Stage, BTM Layout, Bengaluru 560029', 1, 4.0, 1, 'images/restaurants/burger-barn.svg'
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM restaurant WHERE name = 'Burger Barn');

INSERT INTO restaurant
    (name, cuisine_type, delivery_time, address, admin_user_id, rating, is_active, image)
SELECT 'Sweet Tooth Dessert Parlour', 'Desserts', 30, 'Residency Road, Bengaluru 560025', 1, 4.7, 1, 'images/restaurants/sweet-tooth-dessert-parlour.svg'
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM restaurant WHERE name = 'Sweet Tooth Dessert Parlour');

INSERT INTO restaurant
    (name, cuisine_type, delivery_time, address, admin_user_id, rating, is_active, image)
SELECT 'Green Bowl Kitchen', 'Healthy Food', 25, 'Whitefield Main Road, Bengaluru 560066', 1, 4.3, 1, 'images/restaurants/green-bowl-kitchen.svg'
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM restaurant WHERE name = 'Green Bowl Kitchen');


-- ---------------------------------------------------------------------
-- Menu items for the new restaurants (restaurant_id is looked up by name)
-- ---------------------------------------------------------------------

-- Namma Tiffin House (6 items)

INSERT INTO menu
    (restaurant_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restaurant_id, 'Masala Dosa', 'Crispy rice crepe filled with spiced potato masala, served with chutneys and sambar.', 90.00, 1, 'Breakfast', NOW(), NOW(), NULL, 'images/food/namma-tiffin-house-masala-dosa.svg'
FROM restaurant r
WHERE r.name = 'Namma Tiffin House'
  AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id = r.restaurant_id AND m.item_name = 'Masala Dosa');

INSERT INTO menu
    (restaurant_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restaurant_id, 'Idli Vada Combo', 'Two soft idlis and one crisp medu vada with sambar and coconut chutney.', 80.00, 1, 'Breakfast', NOW(), NOW(), NULL, 'images/food/namma-tiffin-house-idli-vada-combo.svg'
FROM restaurant r
WHERE r.name = 'Namma Tiffin House'
  AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id = r.restaurant_id AND m.item_name = 'Idli Vada Combo');

INSERT INTO menu
    (restaurant_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restaurant_id, 'Ghee Podi Dosa', 'Golden dosa roasted in ghee and dusted with spicy gunpowder podi.', 110.00, 1, 'Breakfast', NOW(), NOW(), NULL, 'images/food/namma-tiffin-house-ghee-podi-dosa.svg'
FROM restaurant r
WHERE r.name = 'Namma Tiffin House'
  AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id = r.restaurant_id AND m.item_name = 'Ghee Podi Dosa');

INSERT INTO menu
    (restaurant_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restaurant_id, 'Bisi Bele Bath', 'Traditional Karnataka rice and lentil dish with vegetables and ghee.', 120.00, 1, 'Main Course', NOW(), NOW(), NULL, 'images/food/namma-tiffin-house-bisi-bele-bath.svg'
FROM restaurant r
WHERE r.name = 'Namma Tiffin House'
  AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id = r.restaurant_id AND m.item_name = 'Bisi Bele Bath');

INSERT INTO menu
    (restaurant_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restaurant_id, 'Medu Vada (2 pcs)', 'Crispy lentil doughnuts served hot with sambar and chutney.', 60.00, 1, 'Snacks', NOW(), NOW(), NULL, 'images/food/namma-tiffin-house-medu-vada-2-pcs.svg'
FROM restaurant r
WHERE r.name = 'Namma Tiffin House'
  AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id = r.restaurant_id AND m.item_name = 'Medu Vada (2 pcs)');

INSERT INTO menu
    (restaurant_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restaurant_id, 'Filter Coffee', 'Strong South Indian filter coffee with frothy milk.', 40.00, 1, 'Beverages', NOW(), NOW(), NULL, 'images/food/namma-tiffin-house-filter-coffee.svg'
FROM restaurant r
WHERE r.name = 'Namma Tiffin House'
  AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id = r.restaurant_id AND m.item_name = 'Filter Coffee');

-- Malabar Meals (6 items)

INSERT INTO menu
    (restaurant_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restaurant_id, 'Kerala Veg Meals', 'Rice with sambar, avial, thoran, pickle, papad and payasam.', 160.00, 1, 'Main Course', NOW(), NOW(), NULL, 'images/food/malabar-meals-kerala-veg-meals.svg'
FROM restaurant r
WHERE r.name = 'Malabar Meals'
  AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id = r.restaurant_id AND m.item_name = 'Kerala Veg Meals');

INSERT INTO menu
    (restaurant_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restaurant_id, 'Malabar Fish Curry Meals', 'Rice served with tangy coconut fish curry and fried fish.', 240.00, 1, 'Main Course', NOW(), NOW(), NULL, 'images/food/malabar-meals-malabar-fish-curry-meals.svg'
FROM restaurant r
WHERE r.name = 'Malabar Meals'
  AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id = r.restaurant_id AND m.item_name = 'Malabar Fish Curry Meals');

INSERT INTO menu
    (restaurant_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restaurant_id, 'Appam with Veg Stew', 'Soft lacy appams served with mildly spiced vegetable stew.', 150.00, 1, 'Main Course', NOW(), NOW(), NULL, 'images/food/malabar-meals-appam-with-veg-stew.svg'
FROM restaurant r
WHERE r.name = 'Malabar Meals'
  AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id = r.restaurant_id AND m.item_name = 'Appam with Veg Stew');

INSERT INTO menu
    (restaurant_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restaurant_id, 'Kerala Parotta (2 pcs)', 'Flaky layered parotta made fresh on the griddle.', 70.00, 1, 'Breads', NOW(), NOW(), NULL, 'images/food/malabar-meals-kerala-parotta-2-pcs.svg'
FROM restaurant r
WHERE r.name = 'Malabar Meals'
  AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id = r.restaurant_id AND m.item_name = 'Kerala Parotta (2 pcs)');

INSERT INTO menu
    (restaurant_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restaurant_id, 'Chicken Roast', 'Kerala-style pepper chicken roasted with caramelised onions.', 220.00, 1, 'Non-Veg', NOW(), NOW(), NULL, 'images/food/malabar-meals-chicken-roast.svg'
FROM restaurant r
WHERE r.name = 'Malabar Meals'
  AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id = r.restaurant_id AND m.item_name = 'Chicken Roast');

INSERT INTO menu
    (restaurant_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restaurant_id, 'Banana Fry (Pazhampori)', 'Ripe banana slices dipped in batter and fried golden.', 60.00, 1, 'Snacks', NOW(), NOW(), NULL, 'images/food/malabar-meals-banana-fry-pazhampori.svg'
FROM restaurant r
WHERE r.name = 'Malabar Meals'
  AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id = r.restaurant_id AND m.item_name = 'Banana Fry (Pazhampori)');

-- Tandoori Nights (7 items)

INSERT INTO menu
    (restaurant_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restaurant_id, 'Paneer Butter Masala', 'Soft paneer cubes in a rich, creamy tomato and butter gravy.', 260.00, 1, 'Main Course', NOW(), NOW(), NULL, 'images/food/tandoori-nights-paneer-butter-masala.svg'
FROM restaurant r
WHERE r.name = 'Tandoori Nights'
  AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id = r.restaurant_id AND m.item_name = 'Paneer Butter Masala');

INSERT INTO menu
    (restaurant_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restaurant_id, 'Dal Makhani', 'Slow-cooked black lentils finished with butter and cream.', 220.00, 1, 'Main Course', NOW(), NOW(), NULL, 'images/food/tandoori-nights-dal-makhani.svg'
FROM restaurant r
WHERE r.name = 'Tandoori Nights'
  AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id = r.restaurant_id AND m.item_name = 'Dal Makhani');

INSERT INTO menu
    (restaurant_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restaurant_id, 'Butter Chicken', 'Tender tandoori chicken in a smooth, mildly sweet tomato gravy.', 320.00, 1, 'Non-Veg', NOW(), NOW(), NULL, 'images/food/tandoori-nights-butter-chicken.svg'
FROM restaurant r
WHERE r.name = 'Tandoori Nights'
  AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id = r.restaurant_id AND m.item_name = 'Butter Chicken');

INSERT INTO menu
    (restaurant_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restaurant_id, 'Butter Naan', 'Soft tandoor-baked bread brushed with butter.', 45.00, 1, 'Breads', NOW(), NOW(), NULL, 'images/food/tandoori-nights-butter-naan.svg'
FROM restaurant r
WHERE r.name = 'Tandoori Nights'
  AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id = r.restaurant_id AND m.item_name = 'Butter Naan');

INSERT INTO menu
    (restaurant_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restaurant_id, 'Aloo Paratha with Curd', 'Stuffed wheat paratha served with fresh curd and pickle.', 110.00, 1, 'Breakfast', NOW(), NOW(), NULL, 'images/food/tandoori-nights-aloo-paratha-with-curd.svg'
FROM restaurant r
WHERE r.name = 'Tandoori Nights'
  AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id = r.restaurant_id AND m.item_name = 'Aloo Paratha with Curd');

INSERT INTO menu
    (restaurant_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restaurant_id, 'Sweet Lassi', 'Thick, chilled Punjabi lassi topped with malai.', 80.00, 1, 'Beverages', NOW(), NOW(), NULL, 'images/food/tandoori-nights-sweet-lassi.svg'
FROM restaurant r
WHERE r.name = 'Tandoori Nights'
  AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id = r.restaurant_id AND m.item_name = 'Sweet Lassi');

INSERT INTO menu
    (restaurant_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restaurant_id, 'Veg Thali', 'Dal, paneer sabzi, seasonal vegetable, rice, roti, salad and sweet.', 250.00, 1, 'Thali', NOW(), NOW(), NULL, 'images/food/tandoori-nights-veg-thali.svg'
FROM restaurant r
WHERE r.name = 'Tandoori Nights'
  AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id = r.restaurant_id AND m.item_name = 'Veg Thali');

-- Dragon Wok (6 items)

INSERT INTO menu
    (restaurant_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restaurant_id, 'Veg Hakka Noodles', 'Wok-tossed noodles with crunchy vegetables and soy sauce.', 150.00, 1, 'Noodles', NOW(), NOW(), NULL, 'images/food/dragon-wok-veg-hakka-noodles.svg'
FROM restaurant r
WHERE r.name = 'Dragon Wok'
  AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id = r.restaurant_id AND m.item_name = 'Veg Hakka Noodles');

INSERT INTO menu
    (restaurant_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restaurant_id, 'Chicken Fried Rice', 'Fragrant rice stir-fried with chicken, egg and spring onion.', 190.00, 1, 'Rice', NOW(), NOW(), NULL, 'images/food/dragon-wok-chicken-fried-rice.svg'
FROM restaurant r
WHERE r.name = 'Dragon Wok'
  AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id = r.restaurant_id AND m.item_name = 'Chicken Fried Rice');

INSERT INTO menu
    (restaurant_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restaurant_id, 'Chilli Paneer (Dry)', 'Crispy paneer tossed with capsicum, onion and spicy chilli sauce.', 210.00, 1, 'Starters', NOW(), NOW(), NULL, 'images/food/dragon-wok-chilli-paneer-dry.svg'
FROM restaurant r
WHERE r.name = 'Dragon Wok'
  AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id = r.restaurant_id AND m.item_name = 'Chilli Paneer (Dry)');

INSERT INTO menu
    (restaurant_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restaurant_id, 'Veg Manchurian', 'Vegetable dumplings in a tangy, garlicky Manchurian gravy.', 170.00, 1, 'Starters', NOW(), NOW(), NULL, 'images/food/dragon-wok-veg-manchurian.svg'
FROM restaurant r
WHERE r.name = 'Dragon Wok'
  AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id = r.restaurant_id AND m.item_name = 'Veg Manchurian');

INSERT INTO menu
    (restaurant_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restaurant_id, 'Chicken Momos (8 pcs)', 'Steamed dumplings stuffed with chicken, served with red chilli chutney.', 160.00, 1, 'Starters', NOW(), NOW(), NULL, 'images/food/dragon-wok-chicken-momos-8-pcs.svg'
FROM restaurant r
WHERE r.name = 'Dragon Wok'
  AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id = r.restaurant_id AND m.item_name = 'Chicken Momos (8 pcs)');

INSERT INTO menu
    (restaurant_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restaurant_id, 'Hot and Sour Soup', 'Spicy, tangy vegetable soup with pepper and vinegar.', 110.00, 1, 'Soups', NOW(), NOW(), NULL, 'images/food/dragon-wok-hot-and-sour-soup.svg'
FROM restaurant r
WHERE r.name = 'Dragon Wok'
  AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id = r.restaurant_id AND m.item_name = 'Hot and Sour Soup');

-- La Piazza (7 items)

INSERT INTO menu
    (restaurant_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restaurant_id, 'Margherita Pizza', 'Classic pizza with tomato sauce, fresh mozzarella and basil.', 299.00, 1, 'Pizza', NOW(), NOW(), NULL, 'images/food/la-piazza-margherita-pizza.svg'
FROM restaurant r
WHERE r.name = 'La Piazza'
  AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id = r.restaurant_id AND m.item_name = 'Margherita Pizza');

INSERT INTO menu
    (restaurant_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restaurant_id, 'Farmhouse Pizza', 'Loaded with capsicum, onion, mushroom, tomato and sweet corn.', 359.00, 1, 'Pizza', NOW(), NOW(), NULL, 'images/food/la-piazza-farmhouse-pizza.svg'
FROM restaurant r
WHERE r.name = 'La Piazza'
  AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id = r.restaurant_id AND m.item_name = 'Farmhouse Pizza');

INSERT INTO menu
    (restaurant_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restaurant_id, 'Penne Arrabbiata', 'Penne pasta in a spicy tomato and garlic sauce.', 260.00, 1, 'Pasta', NOW(), NOW(), NULL, 'images/food/la-piazza-penne-arrabbiata.svg'
FROM restaurant r
WHERE r.name = 'La Piazza'
  AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id = r.restaurant_id AND m.item_name = 'Penne Arrabbiata');

INSERT INTO menu
    (restaurant_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restaurant_id, 'White Sauce Pasta', 'Creamy white sauce pasta with mushrooms and herbs.', 280.00, 1, 'Pasta', NOW(), NOW(), NULL, 'images/food/la-piazza-white-sauce-pasta.svg'
FROM restaurant r
WHERE r.name = 'La Piazza'
  AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id = r.restaurant_id AND m.item_name = 'White Sauce Pasta');

INSERT INTO menu
    (restaurant_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restaurant_id, 'Garlic Bread with Cheese', 'Toasted garlic bread topped with melted mozzarella.', 150.00, 1, 'Starters', NOW(), NOW(), NULL, 'images/food/la-piazza-garlic-bread-with-cheese.svg'
FROM restaurant r
WHERE r.name = 'La Piazza'
  AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id = r.restaurant_id AND m.item_name = 'Garlic Bread with Cheese');

INSERT INTO menu
    (restaurant_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restaurant_id, 'Veg Lasagne', 'Layers of pasta, vegetables, white sauce and baked cheese.', 330.00, 1, 'Main Course', NOW(), NOW(), NULL, 'images/food/la-piazza-veg-lasagne.svg'
FROM restaurant r
WHERE r.name = 'La Piazza'
  AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id = r.restaurant_id AND m.item_name = 'Veg Lasagne');

INSERT INTO menu
    (restaurant_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restaurant_id, 'Tiramisu', 'Coffee-soaked sponge layered with mascarpone cream and cocoa.', 190.00, 1, 'Desserts', NOW(), NOW(), NULL, 'images/food/la-piazza-tiramisu.svg'
FROM restaurant r
WHERE r.name = 'La Piazza'
  AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id = r.restaurant_id AND m.item_name = 'Tiramisu');

-- Nawabi Biryani House (7 items)

INSERT INTO menu
    (restaurant_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restaurant_id, 'Hyderabadi Chicken Dum Biryani', 'Basmati rice and marinated chicken slow-cooked on dum with saffron.', 280.00, 1, 'Biryani', NOW(), NOW(), NULL, 'images/food/nawabi-biryani-house-hyderabadi-chicken-dum-biryani.svg'
FROM restaurant r
WHERE r.name = 'Nawabi Biryani House'
  AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id = r.restaurant_id AND m.item_name = 'Hyderabadi Chicken Dum Biryani');

INSERT INTO menu
    (restaurant_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restaurant_id, 'Mutton Biryani', 'Tender mutton pieces layered with aromatic long-grain rice.', 360.00, 1, 'Biryani', NOW(), NOW(), NULL, 'images/food/nawabi-biryani-house-mutton-biryani.svg'
FROM restaurant r
WHERE r.name = 'Nawabi Biryani House'
  AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id = r.restaurant_id AND m.item_name = 'Mutton Biryani');

INSERT INTO menu
    (restaurant_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restaurant_id, 'Veg Dum Biryani', 'Garden vegetables and paneer cooked with fragrant spices and rice.', 220.00, 1, 'Biryani', NOW(), NOW(), NULL, 'images/food/nawabi-biryani-house-veg-dum-biryani.svg'
FROM restaurant r
WHERE r.name = 'Nawabi Biryani House'
  AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id = r.restaurant_id AND m.item_name = 'Veg Dum Biryani');

INSERT INTO menu
    (restaurant_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restaurant_id, 'Egg Biryani', 'Boiled eggs tossed in masala and layered with basmati rice.', 200.00, 1, 'Biryani', NOW(), NOW(), NULL, 'images/food/nawabi-biryani-house-egg-biryani.svg'
FROM restaurant r
WHERE r.name = 'Nawabi Biryani House'
  AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id = r.restaurant_id AND m.item_name = 'Egg Biryani');

INSERT INTO menu
    (restaurant_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restaurant_id, 'Chicken 65', 'Spicy, crispy deep-fried chicken with curry leaves.', 220.00, 1, 'Starters', NOW(), NOW(), NULL, 'images/food/nawabi-biryani-house-chicken-65.svg'
FROM restaurant r
WHERE r.name = 'Nawabi Biryani House'
  AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id = r.restaurant_id AND m.item_name = 'Chicken 65');

INSERT INTO menu
    (restaurant_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restaurant_id, 'Mirchi ka Salan', 'Tangy peanut and sesame gravy with green chillies.', 70.00, 1, 'Sides', NOW(), NOW(), NULL, 'images/food/nawabi-biryani-house-mirchi-ka-salan.svg'
FROM restaurant r
WHERE r.name = 'Nawabi Biryani House'
  AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id = r.restaurant_id AND m.item_name = 'Mirchi ka Salan');

INSERT INTO menu
    (restaurant_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restaurant_id, 'Double Ka Meetha', 'Hyderabadi bread pudding soaked in saffron milk.', 90.00, 1, 'Desserts', NOW(), NOW(), NULL, 'images/food/nawabi-biryani-house-double-ka-meetha.svg'
FROM restaurant r
WHERE r.name = 'Nawabi Biryani House'
  AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id = r.restaurant_id AND m.item_name = 'Double Ka Meetha');

-- Spice Route Biryani (6 items)

INSERT INTO menu
    (restaurant_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restaurant_id, 'Donne Chicken Biryani', 'Bengaluru-style green masala biryani served in a leaf bowl.', 240.00, 1, 'Biryani', NOW(), NOW(), NULL, 'images/food/spice-route-biryani-donne-chicken-biryani.svg'
FROM restaurant r
WHERE r.name = 'Spice Route Biryani'
  AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id = r.restaurant_id AND m.item_name = 'Donne Chicken Biryani');

INSERT INTO menu
    (restaurant_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restaurant_id, 'Paneer Tikka Biryani', 'Smoky paneer tikka layered with rice and mint.', 250.00, 1, 'Biryani', NOW(), NOW(), NULL, 'images/food/spice-route-biryani-paneer-tikka-biryani.svg'
FROM restaurant r
WHERE r.name = 'Spice Route Biryani'
  AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id = r.restaurant_id AND m.item_name = 'Paneer Tikka Biryani');

INSERT INTO menu
    (restaurant_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restaurant_id, 'Prawn Biryani', 'Juicy prawns cooked in coastal masala with basmati rice.', 340.00, 1, 'Biryani', NOW(), NOW(), NULL, 'images/food/spice-route-biryani-prawn-biryani.svg'
FROM restaurant r
WHERE r.name = 'Spice Route Biryani'
  AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id = r.restaurant_id AND m.item_name = 'Prawn Biryani');

INSERT INTO menu
    (restaurant_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restaurant_id, 'Chicken Lollipop (6 pcs)', 'Crispy chicken drumettes in a spicy Schezwan coating.', 230.00, 1, 'Starters', NOW(), NOW(), NULL, 'images/food/spice-route-biryani-chicken-lollipop-6-pcs.svg'
FROM restaurant r
WHERE r.name = 'Spice Route Biryani'
  AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id = r.restaurant_id AND m.item_name = 'Chicken Lollipop (6 pcs)');

INSERT INTO menu
    (restaurant_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restaurant_id, 'Raita', 'Chilled curd with onion, cucumber and cumin.', 50.00, 1, 'Sides', NOW(), NOW(), NULL, 'images/food/spice-route-biryani-raita.svg'
FROM restaurant r
WHERE r.name = 'Spice Route Biryani'
  AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id = r.restaurant_id AND m.item_name = 'Raita');

INSERT INTO menu
    (restaurant_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restaurant_id, 'Gulab Jamun (2 pcs)', 'Soft milk dumplings soaked in rose-scented sugar syrup.', 70.00, 1, 'Desserts', NOW(), NOW(), NULL, 'images/food/spice-route-biryani-gulab-jamun-2-pcs.svg'
FROM restaurant r
WHERE r.name = 'Spice Route Biryani'
  AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id = r.restaurant_id AND m.item_name = 'Gulab Jamun (2 pcs)');

-- Burger Barn (7 items)

INSERT INTO menu
    (restaurant_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restaurant_id, 'Classic Veg Burger', 'Crispy veg patty with lettuce, tomato and house mayo in a toasted bun.', 99.00, 1, 'Burgers', NOW(), NOW(), NULL, 'images/food/burger-barn-classic-veg-burger.svg'
FROM restaurant r
WHERE r.name = 'Burger Barn'
  AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id = r.restaurant_id AND m.item_name = 'Classic Veg Burger');

INSERT INTO menu
    (restaurant_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restaurant_id, 'Crispy Chicken Burger', 'Fried chicken fillet with cheese slice and smoky sauce.', 149.00, 1, 'Burgers', NOW(), NOW(), NULL, 'images/food/burger-barn-crispy-chicken-burger.svg'
FROM restaurant r
WHERE r.name = 'Burger Barn'
  AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id = r.restaurant_id AND m.item_name = 'Crispy Chicken Burger');

INSERT INTO menu
    (restaurant_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restaurant_id, 'Double Cheese Burger', 'Two grilled patties with double cheese and caramelised onions.', 189.00, 1, 'Burgers', NOW(), NOW(), NULL, 'images/food/burger-barn-double-cheese-burger.svg'
FROM restaurant r
WHERE r.name = 'Burger Barn'
  AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id = r.restaurant_id AND m.item_name = 'Double Cheese Burger');

INSERT INTO menu
    (restaurant_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restaurant_id, 'French Fries (Large)', 'Golden, salted fries served with ketchup.', 99.00, 1, 'Sides', NOW(), NOW(), NULL, 'images/food/burger-barn-french-fries-large.svg'
FROM restaurant r
WHERE r.name = 'Burger Barn'
  AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id = r.restaurant_id AND m.item_name = 'French Fries (Large)');

INSERT INTO menu
    (restaurant_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restaurant_id, 'Peri Peri Fries', 'Fries tossed in tangy peri peri seasoning.', 119.00, 1, 'Sides', NOW(), NOW(), NULL, 'images/food/burger-barn-peri-peri-fries.svg'
FROM restaurant r
WHERE r.name = 'Burger Barn'
  AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id = r.restaurant_id AND m.item_name = 'Peri Peri Fries');

INSERT INTO menu
    (restaurant_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restaurant_id, 'Chicken Wings (6 pcs)', 'Crispy wings tossed in BBQ sauce.', 199.00, 1, 'Starters', NOW(), NOW(), NULL, 'images/food/burger-barn-chicken-wings-6-pcs.svg'
FROM restaurant r
WHERE r.name = 'Burger Barn'
  AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id = r.restaurant_id AND m.item_name = 'Chicken Wings (6 pcs)');

INSERT INTO menu
    (restaurant_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restaurant_id, 'Cold Coffee', 'Thick, chilled coffee blended with ice cream.', 110.00, 1, 'Beverages', NOW(), NOW(), NULL, 'images/food/burger-barn-cold-coffee.svg'
FROM restaurant r
WHERE r.name = 'Burger Barn'
  AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id = r.restaurant_id AND m.item_name = 'Cold Coffee');

-- Sweet Tooth Dessert Parlour (6 items)

INSERT INTO menu
    (restaurant_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restaurant_id, 'Chocolate Truffle Pastry', 'Rich dark chocolate sponge layered with ganache.', 120.00, 1, 'Pastries', NOW(), NOW(), NULL, 'images/food/sweet-tooth-dessert-parlour-chocolate-truffle-pastry.svg'
FROM restaurant r
WHERE r.name = 'Sweet Tooth Dessert Parlour'
  AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id = r.restaurant_id AND m.item_name = 'Chocolate Truffle Pastry');

INSERT INTO menu
    (restaurant_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restaurant_id, 'Red Velvet Cake Slice', 'Velvety red sponge with cream cheese frosting.', 140.00, 1, 'Cakes', NOW(), NOW(), NULL, 'images/food/sweet-tooth-dessert-parlour-red-velvet-cake-slice.svg'
FROM restaurant r
WHERE r.name = 'Sweet Tooth Dessert Parlour'
  AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id = r.restaurant_id AND m.item_name = 'Red Velvet Cake Slice');

INSERT INTO menu
    (restaurant_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restaurant_id, 'Hot Chocolate Brownie with Ice Cream', 'Warm fudgy brownie topped with vanilla ice cream and chocolate sauce.', 170.00, 1, 'Desserts', NOW(), NOW(), NULL, 'images/food/sweet-tooth-dessert-parlour-hot-chocolate-brownie-with-ice-cream.svg'
FROM restaurant r
WHERE r.name = 'Sweet Tooth Dessert Parlour'
  AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id = r.restaurant_id AND m.item_name = 'Hot Chocolate Brownie with Ice Cream');

INSERT INTO menu
    (restaurant_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restaurant_id, 'Belgian Chocolate Waffle', 'Crisp waffle drizzled with Belgian chocolate sauce.', 160.00, 1, 'Desserts', NOW(), NOW(), NULL, 'images/food/sweet-tooth-dessert-parlour-belgian-chocolate-waffle.svg'
FROM restaurant r
WHERE r.name = 'Sweet Tooth Dessert Parlour'
  AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id = r.restaurant_id AND m.item_name = 'Belgian Chocolate Waffle');

INSERT INTO menu
    (restaurant_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restaurant_id, 'Mango Cheesecake', 'Creamy baked cheesecake topped with fresh mango puree.', 180.00, 1, 'Cakes', NOW(), NOW(), NULL, 'images/food/sweet-tooth-dessert-parlour-mango-cheesecake.svg'
FROM restaurant r
WHERE r.name = 'Sweet Tooth Dessert Parlour'
  AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id = r.restaurant_id AND m.item_name = 'Mango Cheesecake');

INSERT INTO menu
    (restaurant_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restaurant_id, 'Butterscotch Sundae', 'Vanilla and butterscotch ice cream with nuts and caramel.', 150.00, 1, 'Ice Cream', NOW(), NOW(), NULL, 'images/food/sweet-tooth-dessert-parlour-butterscotch-sundae.svg'
FROM restaurant r
WHERE r.name = 'Sweet Tooth Dessert Parlour'
  AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id = r.restaurant_id AND m.item_name = 'Butterscotch Sundae');

-- Green Bowl Kitchen (6 items)

INSERT INTO menu
    (restaurant_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restaurant_id, 'Quinoa Veggie Bowl', 'Quinoa with roasted vegetables, chickpeas and lemon-tahini dressing.', 260.00, 1, 'Bowls', NOW(), NOW(), NULL, 'images/food/green-bowl-kitchen-quinoa-veggie-bowl.svg'
FROM restaurant r
WHERE r.name = 'Green Bowl Kitchen'
  AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id = r.restaurant_id AND m.item_name = 'Quinoa Veggie Bowl');

INSERT INTO menu
    (restaurant_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restaurant_id, 'Grilled Chicken Salad', 'Grilled chicken breast over greens, cherry tomato and olives.', 290.00, 1, 'Salads', NOW(), NOW(), NULL, 'images/food/green-bowl-kitchen-grilled-chicken-salad.svg'
FROM restaurant r
WHERE r.name = 'Green Bowl Kitchen'
  AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id = r.restaurant_id AND m.item_name = 'Grilled Chicken Salad');

INSERT INTO menu
    (restaurant_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restaurant_id, 'Paneer Tikka Wrap', 'Whole wheat wrap with grilled paneer, mint chutney and crunchy veggies.', 200.00, 1, 'Wraps', NOW(), NOW(), NULL, 'images/food/green-bowl-kitchen-paneer-tikka-wrap.svg'
FROM restaurant r
WHERE r.name = 'Green Bowl Kitchen'
  AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id = r.restaurant_id AND m.item_name = 'Paneer Tikka Wrap');

INSERT INTO menu
    (restaurant_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restaurant_id, 'Greek Salad', 'Cucumber, tomato, olives and feta with olive oil dressing.', 230.00, 1, 'Salads', NOW(), NOW(), NULL, 'images/food/green-bowl-kitchen-greek-salad.svg'
FROM restaurant r
WHERE r.name = 'Green Bowl Kitchen'
  AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id = r.restaurant_id AND m.item_name = 'Greek Salad');

INSERT INTO menu
    (restaurant_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restaurant_id, 'Fresh Fruit Bowl', 'Seasonal fruits served chilled with a squeeze of lime.', 150.00, 1, 'Bowls', NOW(), NOW(), NULL, 'images/food/green-bowl-kitchen-fresh-fruit-bowl.svg'
FROM restaurant r
WHERE r.name = 'Green Bowl Kitchen'
  AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id = r.restaurant_id AND m.item_name = 'Fresh Fruit Bowl');

INSERT INTO menu
    (restaurant_id, item_name, description, price, is_available, category, created_at, updated_at, deleted_at, image)
SELECT r.restaurant_id, 'Green Detox Smoothie', 'Spinach, apple, cucumber and ginger blended fresh.', 140.00, 1, 'Beverages', NOW(), NOW(), NULL, 'images/food/green-bowl-kitchen-green-detox-smoothie.svg'
FROM restaurant r
WHERE r.name = 'Green Bowl Kitchen'
  AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id = r.restaurant_id AND m.item_name = 'Green Detox Smoothie');

COMMIT;

-- ---------------------------------------------------------------------
-- CHECK (read-only). Expect 30 restaurants, all active, every one with menu items.
-- ---------------------------------------------------------------------
SELECT r.restaurant_id, r.name, r.cuisine_type, r.delivery_time, r.rating, r.is_active,
       r.image, COUNT(m.menu_id) AS menu_items
FROM restaurant r
LEFT JOIN menu m ON m.restaurant_id = r.restaurant_id AND m.is_available = 1 AND m.deleted_at IS NULL
GROUP BY r.restaurant_id, r.name, r.cuisine_type, r.delivery_time, r.rating, r.is_active, r.image
ORDER BY r.restaurant_id;
