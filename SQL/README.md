
## SQL Exercise

### -Describe, using SQL statements, how you would transform Table A into Table B. 

SELECT <br>
MONTH(order_date) AS month, <br>
ROUND(SUM(CASE WHEN product_name = 'Ipad pro' THEN total_amount ELSE 0 END),0) AS Ipad_pro_total, <br>
ROUND(SUM(CASE WHEN product_name = 'Iphone Xs' THEN total_amount ELSE 0 END),0) AS Iphone_xs_total, <br>
ROUND(SUM(CASE WHEN product_name NOT IN ('Ipad pro', 'Iphone Xs') THEN total_amount ELSE 0 END),0) AS other_total <br>
FROM sales <br>
GROUP BY MONTH(order_date) <br>
ORDER BY MONTH(order_date);

### -Would you use materialized tables or SQL Views? 

Depends on the amount of the data and the performance we want. In this case I would use an sql view, because we have an small amount of data and we can avoid the use of any type of join or merge operation to get the Table B result, so we don’t need the faster indexing method that materialized tables provides (basically to do more computationally complex operations like joins).

### -Is it possible to do this transformation using a single SQL statement? 



### -How would the transformation change if we wanted to group the sales by week number? And using the name of the month (i.e. July instead of the number of the month 07 ) ?

#### Grouping by week number:

We only need to change MONTH into WEEK function:

SELECT <br>
WEEK(order_date) AS week, <br>
ROUND(SUM(CASE WHEN product_name = 'Ipad pro' THEN total_amount ELSE 0 END),0) AS Ipad_pro_total, <br>
ROUND(SUM(CASE WHEN product_name = 'Iphone Xs' THEN total_amount ELSE 0 END),0) AS Iphone_xs_total, <br>
ROUND(SUM(CASE WHEN product_name NOT IN ('Ipad pro', 'Iphone Xs') THEN total_amount ELSE 0 END),0) AS other_total <br>
FROM sales <br>
GROUP BY WEEK(order_date) <br>
ORDER BY WEEK(order_date);

#### Using the name of the month:

We only need to change the MONTH function to MONTHNAME:

SELECT <br>
MONTHNAME(order_date) AS month, <br>
ROUND(SUM(CASE WHEN product_name = 'Ipad pro' THEN total_amount ELSE 0 END),0) AS Ipad_pro_total, <br>
ROUND(SUM(CASE WHEN product_name = 'Iphone Xs' THEN total_amount ELSE 0 END),0) AS Iphone_xs_total, <br>
ROUND(SUM(CASE WHEN product_name NOT IN ('Ipad pro', 'Iphone Xs') THEN total_amount ELSE 0 END),0) AS other_total <br>
FROM sales <br>
GROUP BY MONTH(order_date) <br>
ORDER BY MONTH(order_date);


