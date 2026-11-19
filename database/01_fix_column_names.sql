-- =====================================================================
-- FoodApp  -  SCRIPT 1 of 2  :  fix misspelled column names
-- =====================================================================
-- Your Java code (which is correct and is NOT changed) expects the column
-- names  restaurant_id  and  cuisine_type.  Your database has the
-- misspellings  restraunt_id  and  cusine_type.  This script renames them:
--
--     restaurant.restraunt_id -> restaurant_id
--     restaurant.cusine_type  -> cuisine_type
--     menu.restraunt_id       -> restaurant_id
--     order.restraunt_id      -> restaurant_id
--
-- Only the column NAMES change.  No rows are touched, nothing is dropped.
-- Safe to run twice: a column that is already fixed is skipped.
-- Requires the table to be called  restaurant  (you already renamed it).
-- =====================================================================

USE foodapp;

SET @stmt = (SELECT IF(COUNT(*) = 1,
    'ALTER TABLE `restaurant` RENAME COLUMN `restraunt_id` TO `restaurant_id`',
    'SELECT ''restaurant.restraunt_id: nothing to do (already fixed)'' AS info')
  FROM information_schema.columns
  WHERE table_schema = DATABASE() AND table_name = 'restaurant' AND column_name = 'restraunt_id');
PREPARE s FROM @stmt; EXECUTE s; DEALLOCATE PREPARE s;

SET @stmt = (SELECT IF(COUNT(*) = 1,
    'ALTER TABLE `restaurant` RENAME COLUMN `cusine_type` TO `cuisine_type`',
    'SELECT ''restaurant.cusine_type: nothing to do (already fixed)'' AS info')
  FROM information_schema.columns
  WHERE table_schema = DATABASE() AND table_name = 'restaurant' AND column_name = 'cusine_type');
PREPARE s FROM @stmt; EXECUTE s; DEALLOCATE PREPARE s;

SET @stmt = (SELECT IF(COUNT(*) = 1,
    'ALTER TABLE `menu` RENAME COLUMN `restraunt_id` TO `restaurant_id`',
    'SELECT ''menu.restraunt_id: nothing to do (already fixed)'' AS info')
  FROM information_schema.columns
  WHERE table_schema = DATABASE() AND table_name = 'menu' AND column_name = 'restraunt_id');
PREPARE s FROM @stmt; EXECUTE s; DEALLOCATE PREPARE s;

SET @stmt = (SELECT IF(COUNT(*) = 1,
    'ALTER TABLE `order` RENAME COLUMN `restraunt_id` TO `restaurant_id`',
    'SELECT ''order.restraunt_id: nothing to do (already fixed)'' AS info')
  FROM information_schema.columns
  WHERE table_schema = DATABASE() AND table_name = 'order' AND column_name = 'restraunt_id');
PREPARE s FROM @stmt; EXECUTE s; DEALLOCATE PREPARE s;

-- Check: every row below should say  restaurant_id / cuisine_type  (no misspellings)
SELECT table_name, column_name
FROM information_schema.columns
WHERE table_schema = 'foodapp'
  AND column_name IN ('restaurant_id', 'restraunt_id', 'cuisine_type', 'cusine_type')
ORDER BY table_name, column_name;
