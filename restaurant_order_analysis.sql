USE restaurant_db;

-- 1.view menu items table 
SELECT * FROM menu_items;  
-- 2.find number of items on the menu
SELECT COUNT(*) FROM menu_items; 
-- 3.what are the least and most expensive items on the menu?
SELECT * FROM menu_items ORDER BY price DESC;
-- 4. How many italian dishes are on the menu?
SELECT COUNT(*) FROM menu_items WHERE category = 'Italian';
-- 5.what are the least and most expensive italian dishes on the menu?
SELECT * FROM menu_items WHERE category = 'Italian' ORDER BY price;
-- 6.how many dishes are in each category?
SELECT category, COUNT(ï»¿menu_item_id) AS num_of_dishes
FROM menu_items
GROUP BY category;
-- 7.average dish price within each category?
SELECT category, AVG(price) AS avg_price_of_dishes
FROM menu_items
GROUP BY category;   

-- 1.ORDER_DETAILS Table
select * from order_details;
-- 2.what is the date range of the table?
SELECT * FROM order_details ORDER BY order_date;
SELECT MIN(order_date), MAX(order_date) FROM order_details;
-- 3.how many orders were made within this date range?
SELECT COUNT(DISTINCT order_id) FROM order_details;
-- 4.how many items were ordered within this date range?
SELECT COUNT(*) FROM order_details;
-- 5.which orders had the most number of items?
 SELECT order_id, COUNT(item_id) AS num_of_items
 FROM order_details
 GROUP BY order_id
 ORDER BY num_of_items DESC;
-- 6.how many orders had more than 12 items?
 SELECT COUNT(*) FROM
 (SELECT order_id, COUNT(item_id) AS num_of_items
 FROM order_details
 GROUP BY order_id  
 HAVING num_of_items > 12) AS num_orers;
 
 -- 1.combine the menu_items and order_details tables into a single table.
 SELECT * FROM menu_items;
 ALTER TABLE menu_items RENAME COLUMN ï»¿menu_item_id TO menu_item_id;
 SELECT * FROM order_details;
 ALTER TABLE order_details RENAME COLUMN ï»¿order_details_id TO order_details_id;
 
SELECT * 
 FROM order_details od LEFT JOIN menu_items mi
 ON od.item_id = mi.menu_item_id;

 -- 2.what are the least and most ordered items? what categories were they in?
 SELECT item_name, category, COUNT(order_details_id) AS num_purchases 
 FROM order_details od LEFT JOIN menu_items mi
 ON od.item_id = mi.menu_item_id
 GROUP BY item_name, category
 ORDER BY num_purchases;
 
  -- 3.what were the top 5 orders that spent the most money?
SELECT order_id, SUM(price) AS total_spent
 FROM order_details od LEFT JOIN menu_items mi
 ON od.item_id = mi.menu_item_id
 GROUP BY order_id
 ORDER BY total_spent DESC
 LIMIT 5;
 
 -- 4.view the details of the highest spent order, what insights can you gather from the results?
 SELECT category, COUNT(item_id) AS num_items
 FROM order_details od LEFT JOIN menu_items mi
      ON od.item_id = mi.menu_item_id
 WHERE order_id = 440
 GROUP BY category;
 
 -- 5.view the details of the top 5 highest spent order, what insights can you gather from the results?
 SELECT order_id, category, COUNT(item_id) AS num_items
 FROM order_details od LEFT JOIN menu_items mi
      ON od.item_id = mi.menu_item_id
 WHERE order_id IN (440, 2075, 1957, 330, 2675)
 GROUP BY order_id, category;
 
 





