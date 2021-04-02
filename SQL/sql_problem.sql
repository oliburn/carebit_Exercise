
CREATE DATABASE IF NOT EXISTS carebit_db;
USE carebit_db;
CREATE TABLE `sales` (
`order_id` varchar(32) NOT NULL,
`username` varchar(64) NOT NULL,
`order_date` datetime NOT NULL,
`product_id` varchar(32) NOT NULL,
`product_name` varchar(256) NOT NULL,
`total_amount` decimal(6,2) NOT NULL,
PRIMARY KEY (`order_id`)
-- KEY `sales_idx_product_id`(`purchased_product_id`), 
-- KEY `sales_idx_username` (`client_username`)
) -- ENGINE=InnoDB DEFAULT 
-- CHARSET=utf8mb4
; 

INSERT INTO sales (order_id, username, order_date, product_id, product_name, total_amount)
VALUES ('42-49', 'bob@me.com', '2019-07-01 15:05:25', 1, 'Ipad mini', 449),
	   ('78-12', 'jane@me.com', '2019-07-03 11:42:54', 2, 'Ipad pro', 879),
       ('18-92', 'alice@me.com', '2019-07-01 17:22:10', 2, 'Ipad pro', 879),
       ('61-14', 'joe@me.com', '2019-06-02 10:11:43', 1, 'Ipad mini', 449),
       ('84-34', 'bob@me.com', '2019-06-10 12:11:32', 3, 'Airpods', 179),
       ('22-25', 'jane@me.com', '2019-05-15 15:10:10', 4, 'Iphone Xs', 939),
       ('52-49', 'joe@me.com', '2019-05-20 13:01:01', 5, 'Iphone 8', 569);
       
SELECT
MONTH(order_date) AS month,
ROUND(SUM(CASE WHEN product_name = 'Ipad pro' THEN total_amount ELSE 0 END),0) AS Ipad_pro_total,
ROUND(SUM(CASE WHEN product_name = 'Iphone Xs' THEN total_amount ELSE 0 END),0) AS Iphone_xs_total,
ROUND(SUM(CASE WHEN product_name NOT IN ('Ipad pro', 'Iphone Xs') THEN total_amount ELSE 0 END),0) AS other_total
FROM sales
GROUP BY MONTH(order_date)
ORDER BY MONTH(order_date);

SELECT
MONTHNAME(order_date) AS month,
ROUND(SUM(CASE WHEN product_name = 'Ipad pro' THEN total_amount ELSE 0 END),0) AS Ipad_pro_total,
ROUND(SUM(CASE WHEN product_name = 'Iphone Xs' THEN total_amount ELSE 0 END),0) AS Iphone_xs_total,
ROUND(SUM(CASE WHEN product_name NOT IN ('Ipad pro', 'Iphone Xs') THEN total_amount ELSE 0 END),0) AS other_total
FROM sales
GROUP BY MONTH(order_date)
ORDER BY MONTH(order_date);

SELECT
WEEK(order_date) AS week,
ROUND(SUM(CASE WHEN product_name = 'Ipad pro' THEN total_amount ELSE 0 END),0) AS Ipad_pro_total,
ROUND(SUM(CASE WHEN product_name = 'Iphone Xs' THEN total_amount ELSE 0 END),0) AS Iphone_xs_total,
ROUND(SUM(CASE WHEN product_name NOT IN ('Ipad pro', 'Iphone Xs') THEN total_amount ELSE 0 END),0) AS other_total
FROM sales
GROUP BY WEEK(order_date)
ORDER BY WEEK(order_date);


