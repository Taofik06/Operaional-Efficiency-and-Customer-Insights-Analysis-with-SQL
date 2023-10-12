CREATE DATABASE pizza_runner;
USE pizza_runner;

DROP TABLE IF EXISTS runners;
CREATE TABLE runners (
runner_id INTEGER,
registration_date DATE
);
INSERT INTO runners
  (runner_id, registration_date)
VALUES
  (1, '2021-01-01'),
  (2, '2021-01-03'),
  (3, '2021-01-08'),
  (4, '2021-01-15');


DROP TABLE IF EXISTS customer_orders;
CREATE TABLE customer_orders (
  order_id INTEGER,
  customer_id INTEGER,
  pizza_id INTEGER,
  exclusions VARCHAR(4),
  extras VARCHAR(4),
  order_time TIMESTAMP
);

INSERT INTO customer_orders
  (order_id, customer_id, pizza_id, exclusions, extras, order_time)
VALUES
  ('1', '101', '1', '', '', '2020-01-01 18:05:02'),
  ('2', '101', '1', '', '', '2020-01-01 19:00:52'),
  ('3', '102', '1', '', '', '2020-01-02 23:51:23'),
  ('3', '102', '2', '', NULL, '2020-01-02 23:51:23'),
  ('4', '103', '1', '4', '', '2020-01-04 13:23:46'),
  ('4', '103', '1', '4', '', '2020-01-04 13:23:46'),
  ('4', '103', '2', '4', '', '2020-01-04 13:23:46'),
  ('5', '104', '1', 'null', '1', '2020-01-08 21:00:29'),
  ('6', '101', '2', 'null', 'null', '2020-01-08 21:03:13'),
  ('7', '105', '2', 'null', '1', '2020-01-08 21:20:29'),
  ('8', '102', '1', 'null', 'null', '2020-01-09 23:54:33'),
  ('9', '103', '1', '4', '1, 5', '2020-01-10 11:22:59'),
  ('10', '104', '1', 'null', 'null', '2020-01-11 18:34:49'),
  ('10', '104', '1', '2, 6', '1, 4', '2020-01-11 18:34:49');


DROP TABLE IF EXISTS runner_orders;
CREATE TABLE runner_orders (
  order_id INTEGER,
  runner_id INTEGER,
  pickup_time VARCHAR(19),
  distance VARCHAR(7),
  duration VARCHAR(10),
  cancellation VARCHAR(23)
);

INSERT INTO runner_orders
  (order_id, runner_id, pickup_time, distance, duration, cancellation)
VALUES
  ('1', '1', '2020-01-01 18:15:34', '20km', '32 minutes', ''),
  ('2', '1', '2020-01-01 19:10:54', '20km', '27 minutes', ''),
  ('3', '1', '2020-01-03 00:12:37', '13.4km', '20 mins', NULL),
  ('4', '2', '2020-01-04 13:53:03', '23.4', '40', NULL),
  ('5', '3', '2020-01-08 21:10:57', '10', '15', NULL),
  ('6', '3', 'null', 'null', 'null', 'Restaurant Cancellation'),
  ('7', '2', '2020-01-08 21:30:45', '25km', '25mins', 'null'),
  ('8', '2', '2020-01-10 00:15:02', '23.4 km', '15 minute', 'null'),
  ('9', '2', 'null', 'null', 'null', 'Customer Cancellation'),
  ('10', '1', '2020-01-11 18:50:20', '10km', '10minutes', 'null');


DROP TABLE IF EXISTS pizza_names;
CREATE TABLE pizza_names (
  pizza_id INTEGER,
  pizza_name TEXT
);
INSERT INTO pizza_names
  (pizza_id, pizza_name)
VALUES
  (1, 'Meatlovers'),
  (2, 'Vegetarian');


DROP TABLE IF EXISTS pizza_recipes;
CREATE TABLE pizza_recipes (
  pizza_id INTEGER,
  toppings TEXT
);
INSERT INTO pizza_recipes
  (pizza_id, toppings)
VALUES
  (1, '1, 2, 3, 4, 5, 6, 8, 10'),
  (2, '4, 6, 7, 9, 11, 12');


DROP TABLE IF EXISTS pizza_toppings;
CREATE TABLE pizza_toppings (
  topping_id INTEGER,
  topping_name TEXT
);
INSERT INTO pizza_toppings
  (topping_id, topping_name)
VALUES
  (1, 'Bacon'),
  (2, 'BBQ Sauce'),
  (3, 'Beef'),
  (4, 'Cheese'),
  (5, 'Chicken'),
  (6, 'Mushrooms'),
  (7, 'Onions'),
  (8, 'Pepperoni'),
  (9, 'Peppers'),
  (10, 'Salami'),
  (11, 'Tomatoes'),
  (12, 'Tomato Sauce');
  
SET SQL_SAFE_UPDATES = 0;

-- Updating the runner_orders table  
UPDATE pizza_runner.runner_orders
SET cancellation = NULL
WHERE cancellation = 'null';

UPDATE pizza_runner.runner_orders
SET cancellation = NULL
WHERE cancellation = '';

UPDATE runner_orders
SET pickup_time = NULL
WHERE pickup_time = 'null';

UPDATE runner_orders
SET distance = NULL
WHERE distance = 'null';

UPDATE runner_orders
SET duration = NULL
WHERE duration = 'null';

-- Updasting the customer table
UPDATE customer_orders
SET exclusions = NULL
WHERE exclusions = 'null' OR exclusions = '';

UPDATE customer_orders
SET extras = NULL
WHERE extras = 'null' OR extras = '';

SELECT * FROM customer_orders;

SET SQL_SAFE_UPDATES = 1;

-- SECTION A
  -- 1. How many pizzas were ordered?
  SELECT 
	COUNT(*) AS ordered_pizzas
  FROM customer_orders;
  
  -- 2. How many unique customer orders were made?
SELECT 
    COUNT(DISTINCT (order_id)) AS unique_orders
FROM
    customer_orders;

-- 3. How many successful orders were delivered by each runner?
SELECT 
	runner_id,  
	COUNT(*) AS orders_delivered
FROM runner_orders
WHERE pickup_time IS NOT NULL
GROUP BY runner_id;

-- 4. How many of each type of pizza was delivered?
SELECT 
	pizza_id, 
	pizza_name, 
	COUNT(*) AS no_delivered
FROM customer_orders JOIN runner_orders 
USING (order_id)
JOIN pizza_names
USING(pizza_id)
WHERE pickup_time IS NOT NULL
GROUP BY pizza_id, pizza_name;

-- 5. How many Vegetarian and Meatlovers were ordered by each customer?
SELECT 
	customer_id, 
	pizza_name, 
	COUNT(*) AS no_ordered 
FROM customer_orders 
JOIN pizza_names USING (pizza_id)
GROUP BY customer_id, pizza_name
ORDER BY customer_id;

-- 6. What was the maximum number of pizzas delivered in a single order?
SELECT 
	order_id, 
	COUNT(*) AS delivered_pizza 
FROM customer_orders 
JOIN runner_orders USING(order_id)
WHERE pickup_time IS NOT NULL
GROUP BY order_id
ORDER BY delivered_pizza DESC
LIMIT 1;

-- 7. For each customer, how many delivered pizzas had at least 1 change and how many had no changes?
SELECT 
	customer_id, 
SUM(CASE
  WHEN (exclusions IS NOT NULL) OR (extras IS NOT NULL) THEN 1 ELSE 0
        END) AS Changes,
SUM(CASE 
  WHEN (exclusions IS NULL) AND (extras IS NULL) THEN 1 ELSE 0
        END) as NoChange
FROM customer_orders JOIN runner_orders USING(order_id)
WHERE pickup_time IS NOT NULL
GROUP BY customer_id
ORDER BY customer_id;

-- 8. How many pizzas were delivered that had both exclusions and extras?
WITH cte AS (SELECT 
	pizza_id,
	CASE 
		WHEN exclusions IS NULL OR extras IS NULL THEN 'No' ELSE 'Yes' 
	END AS 'both_changes' 
FROM customer_orders JOIN runner_orders USING(order_id)
WHERE pickup_time IS NOT NULL)
SELECT pizza_id, both_changes, COUNT(*) AS no_of_changes 
FROM cte
WHERE both_changes = 'Yes'
GROUP BY pizza_id, both_changes;

-- 9. What was the total volume of pizzas ordered for each hour of the day
SELECT HOUR(order_time) AS hour, COUNT(*) AS pizza_ordered
FROM customer_orders
GROUP BY hour
ORDER BY pizza_ordered DESC;

-- 10. What was the volume of orders for each day of the week?
SELECT 
	DAYNAME(order_time) day_of_week, 
    COUNT(*) AS pizza_ordered
FROM customer_orders
GROUP BY day_of_week
ORDER BY pizza_ordered DESC; 

-- SECTION B
-- 1. How many runners signed up for each 1 week period? (i.e. week starts 2021-01-01)
SELECT 
  FLOOR(DATEDIFF(registration_date, '2021-01-01') / 7) + 1 AS week_number, 
  COUNT(*) AS registered_runners
FROM runners
GROUP BY week_number;

-- 2. What was the average time in minutes it took for each runner to arrive at the 
-- Pizza Runner HQ to pickup the order?
WITH cte AS
    (SELECT 
        *,
            TIMESTAMPDIFF(MINUTE, order_time, pickup_time) AS time_taken
    FROM
        customer_orders
    JOIN runner_orders USING (order_id)
    WHERE
        pickup_time IS NOT NULL)
SELECT 
    runner_id, ROUND(AVG(time_taken), 2) AS avg_time
FROM cte
GROUP BY runner_id;

-- question 2 can also be answered with
SELECT 
    runner_id, ROUND(AVG(time_taken), 2) AS avg_time
FROM
    (SELECT 
        *,
            TIMESTAMPDIFF(MINUTE, order_time, pickup_time) AS time_taken
    FROM
        customer_orders
    JOIN runner_orders USING (order_id)
    WHERE
        pickup_time IS NOT NULL) A
GROUP BY runner_id;

-- 3. Is there any relationship between the number of pizzas and how long the order takes to prepare?
WITH cte AS 
(SELECT 
    order_id, COUNT(*) AS no_of_pizza, 
    ROUND(AVG(TIMESTAMPDIFF(MINUTE, order_time, pickup_time)), 2) AS time_taken
    FROM
        customer_orders c
    JOIN runner_orders USING (order_id)
    WHERE
        pickup_time IS NOT NULL
GROUP BY order_id)
SELECT no_of_pizza, ROUND(AVG(time_taken), 2) AS time_taken
FROM cte
GROUP BY no_of_pizza;

-- 4. What was the average distance travelled for each customer?
WITH cte AS 
(SELECT 
        *,
            CAST(REPLACE(distance, 'km', '') AS DECIMAL (10 , 2 )) AS dis
    FROM
        customer_orders
    LEFT JOIN runner_orders USING (order_id)
    WHERE
        pickup_time IS NOT NULL)
SELECT 
    customer_id, ROUND(AVG(dis), 2) AS avg_dist
FROM cte
GROUP BY customer_id;

-- question 4 can also be nswered with
SELECT 
    customer_id, ROUND(AVG(dis), 2) AS avg_dist
FROM
    (SELECT 
        *,
            CAST(REPLACE(distance, 'km', '') AS DECIMAL (10 , 2 )) AS dis
    FROM
        customer_orders
    LEFT JOIN runner_orders USING (order_id)
    WHERE
        pickup_time IS NOT NULL) A
GROUP BY customer_id;

-- 5. What was the difference between the longest and shortest delivery times for all orders?
SELECT MAX(SUBSTR(duration, 1, 2)) - MIN(SUBSTR(duration, 1, 2)) AS del_time_range
FROM runner_orders
WHERE duration IS NOT NULL;


SELECT MAX(del_time) - MIN(del_time) AS del_time_range 
FROM (SELECT SUBSTR(duration, 1, 2) AS del_time
FROM runner_orders) A;

-- 6 What was the average speed for each runner for each delivery and do you notice any trend for these values?
SELECT 
    runner_id, order_id, ROUND(AVG(speed), 2) AS avg_speed
FROM
    (SELECT 
        *,
            CAST(REPLACE(distance, 'km', '') / SUBSTR(duration, 1, 2)
                AS DECIMAL (10 , 2 )) AS speed
    FROM
        runner_orders
    WHERE
        duration IS NOT NULL) A
GROUP BY runner_id , order_id
ORDER BY runner_id;

-- question 6 can also be answered with
SELECT 
    runner_id, order_id, 
ROUND(AVG(CAST(REPLACE(distance, 'km', '') / SUBSTR(duration, 1, 2)
                AS DECIMAL (10 , 2 ))), 2) AS speed
    FROM
        runner_orders
    WHERE
        duration IS NOT NULL
GROUP BY runner_id , order_id
ORDER BY runner_id;

-- 7. What is the successful delivery percentage for each runner?
WITH cte AS (SELECT *, 
CASE 
	WHEN duration IS NULL THEN 0 ELSE 1 
END AS delivery_flag
FROM runner_orders)
SELECT 
	runner_id, 
	ROUND(SUM(delivery_flag)/COUNT(*) * 100, 0) AS delivery_percent
FROM cte
GROUP BY runner_id;
SELECT * FROM runner_orders;


-- SECTION C

-- 1. If a Meat Lovers pizza costs $12 and Vegetarian costs $10 and there were no charges for changes 
-- how much money has Pizza Runner made so far if there are no delivery fees?
USE pizza_runner;

SELECT 
SUM(CASE WHEN pizza_id = 1 THEN 12 ELSE 10 
END) AS amount
FROM customer_orders 
LEFT JOIN runner_orders USING (order_id) 
WHERE pickup_time IS NOT NULL;

-- What if there was an additional $1 charge for any pizza extras? Add cheese is $1 extra
WITH cte AS (SELECT *, 
CASE WHEN pizza_id = 1 THEN 12 ELSE 10 
END AS amount
FROM customer_orders 
LEFT JOIN runner_orders USING (order_id) 
WHERE pickup_time IS NOT NULL)

SELECT 
SUM(CASE WHEN extras OR exclusions IS NOT NULL THEN amount+1 ELSE amount
END) AS extra_amt
FROM cte;


-- The Pizza Runner team now wants to add an additional ratings system that allows customers to rate their runner, 
-- how would you design an additional table for this new dataset - generate a schema for this new table and insert 
-- your own data for ratings for each successful customer order between 1 to 5.
DROP TABLE IF EXISTS order_ratings;
CREATE TABLE order_ratings (
order_id INT,
rating INT);
INSERT INTO order_ratings
(order_id, rating)
VALUES
(1,2),
(2,4),
(3,1),
(4,3),
(5,2),
(7,5),
(8,4),
(10,2);

-- Using your newly generated table - can you join all of the information together to form a table which has 
-- the following information for successful deliveries?
-- ustomer_id
-- order_id
-- runner_id
-- rating
-- order_time
-- pickup_time
-- Time between order and pickup
-- Delivery duration
-- Average speed
-- Total number of pizzas
-- select * from order_ratings;
SELECT 
	customer_id, 
	order_id, 
	runner_id,
    rating
	order_time, 
	pickup_time, 
	TIMESTAMPDIFF(MINUTE, order_time, pickup_time) AS time_taken,
    LEFT(duration, 2) AS delivery_duration,
    CAST(REPLACE(distance, 'km', '') / LEFT(duration, 2) AS DECIMAL (10 , 2 )) AS speed,
    COUNT(*) no_of_pizaa
FROM customer_orders 
JOIN runner_orders USING(order_id) 
LEFT JOIN order_ratings USING(order_id)
WHERE duration IS NOT NULL
GROUP BY customer_id, order_id, runner_id, rating, pickup_time, order_time, duration, distance;

-- BONUS



-- 1. What are the standard ingredients for each pizza?
SELECT * FROM pizza_recipes;
DROP TABLE IF EXISTS pizza_recipes;
CREATE TABLE pizza_recipe
(pizza_id INT, toppings INT);

INSERT INTO pizza_recipe (pizza_id, toppings)
VALUES 
(1,1),
(1,2),
(1,3),
(1,4),
(1,5),
(1,6),
(1,8),
(1,10),
(2,4),
(2,6),
(2,7),
(2,9),
(2,11),
(2,12);

SELECT 
    pizza_name,
    GROUP_CONCAT(topping_name) AS standard_ingredient
FROM
    pizza_recipe p
        LEFT JOIN
    pizza_toppings t ON p.toppings = t.topping_id
        JOIN
    pizza_names USING (pizza_id)
GROUP BY pizza_name;
