# Task 1 : What percentage of total orders were shipped on the same date?
SELECT 
       count(*) * 100.0 / (select count(*) from superstore) as order_percent
FROM superstore
WHERE Order_Date=Ship_Date;

# Task 2 : Name top 3 customers with highest total value of orders.
SELECT Customer_Name FROM superstore
GROUP BY Customer_Name
ORDER BY SUM(Sales) desc
LIMIT 3;

# Task 3 : Find the top 5 items with the highest average sales per day.
SELECT Product_Name,avg(Sales),Order_Date
FROM superstore
GROUP BY Product_Name,Order_Date
ORDER BY avg(Sales) desc
limit 5;

# Task 4 : Write a query to find the average order value for each customer, and rank the customers by their average order value.
SELECT avg(Sales),Customer_ID,
RANK() OVER (ORDER BY avg(Sales) desc) Customer_rank 
FROM sales.mytable
GROUP BY Customer_ID;


# Task 6 : What is the most demanded sub-category in the west region?
SELECT count(*),Sub_Category 
FROM sales.mytable where Region='West'
GROUP BY Sub_Category
ORDER BY count(*) desc limit 1;

# Task 7 : Which order has the highest number of items?
SELECT Count(Product_ID),Order_ID 
FROM superstore 
GROUP BY Order_ID
ORDER BY Count(Product_ID) desc limit 1;

# Task 8 : Which order has the highest cumulative value?
SELECT sum(sum(Sales)) over (order by Order_ID) as cum_sum,Order_ID
FROM  superstore
GROUP BY Order_ID
ORDER BY cum_sum desc limit 1;

# Task 9 : Which segment’s order is more likely to be shipped via first class?
SELECT Count(Segment),Segment 
FROM superstore where Ship_Mode='First Class'
GROUP BY Segment
ORDER BY Count(Segment) desc limit 1;

# Task 10 : Which city is least contributing to total revenue?
SELECT City,sum(Sales) 
FROM superstore 
GROUP BY City
ORDER BY sum(Sales) asc limit 1;

# Task 11 : What is the average time for orders to get shipped after order is placed?
SELECT avg(DATEDIFF(Ship_Date, Order_Date)) as diff  
FROM superstore;

# Task 12 : Which segment places the highest number of orders from each state and which segment places the largest individual orders from each state?
SELECT Segment,State,Count(distinct Order_ID) 
FROM superstore
GROUP BY State,Segment
ORDER BY Count(distinct Order_ID) desc limit 1 ;

# Task 13 : Find all the customers who individually ordered on 3 consecutive days where each day’s total order was more than 50 in value. **
SELECT T.Customer_Name
FROM (SELECT T.*, COUNT(*) OVER(ORDER BY T.Order_Date 
RANGE BETWEEN INTERVAL 1 DAY PRECEDING 
AND INTERVAL 1 DAY FOLLOWING) cnt_days
FROM superstore T
WHERE T.Sales>50)T
 WHERE T.cnt_days = 3;