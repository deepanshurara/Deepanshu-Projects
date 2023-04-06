Use Sakila; 
select * from orders;
select * from customers;
select * from orderdetails;
select * from offices;

#Q1. Write an SQL query to retrieve the first 5 rows from the customers table. 
Select * from Customers limit 5;

#Q2. Write an SQL query to retrieve unique city names from customers table sorted in descending order.
Select distinct city from Customers order by city desc; 

#Q3. 3. Write a SQL query to get the number of unique city names "offices" table.
SELECT COUNT(DISTINCT city) as num_unique_cities FROM offices;

#Q4. Write a SQL query to get the maximum, minimum and average value from the "CreditLimit" column in the "customers" table.
SELECT MAX(CreditLimit) as max_credit_limit, 
       MIN(CreditLimit) as min_credit_limit, 
       AVG(CreditLimit) as avg_credit_limit 
FROM customers;

#5. Write a SQL query to get the city names which are present in “offices” table but not in “customer” table.
SELECT DISTINCT city 
FROM offices 
WHERE city NOT IN (SELECT city FROM customers);

#6. Write a SQL query to get the city names which are present in “offices” table as well as in "customer” table.
select city from offices where city in (select city from customers);

#7. Write a SQL query to get records where city or state is not given in “customer” table and creditlimit is in the range – 80000 to 130000.
select * from customers WHERE (city IS NULL OR state IS NULL) and creditlimit between 80000 and 130000;

#Q8. Write a SQL query to get the maximum number of orders placed on a particular date and what is that date in orders table.
SELECT orderDate, COUNT(orderNumber) AS num_orders
FROM orders
GROUP BY orderDate
ORDER BY num_orders DESC
LIMIT 1;

#Q9. For the records which we get in previous question(Q8), write a SQL query to get the customer names and their phone numbers.
SELECT c.CustomerName, c.Phone
FROM customers c
JOIN orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderDate = [date obtained in Q8 result];

#Q10. SQL query to get the customer phone number and customer name from customers table where order is either cancelled or disputed in orders table.
SELECT c.CustomerName, c.Phone
FROM customers c
JOIN orders o ON c.CustomerID = o.CustomerID
WHERE o.Status IN ('Cancelled', 'Disputed');

#Q11. 11. Write a SQL query to get the top 4 highest selling products from orderdetails table.
SELECT Productcode, count(QuantityOrdered) AS TotalQuantitySales
FROM orderdetails
GROUP BY Productcode
ORDER BY TotalQuantitySales DESC
LIMIT 4;

#Q12. Write a SQL query to get the count of orders placed by each customer in 2003 and 2004.
SELECT orders.customernumber, COUNT(orders.Ordernumber) AS NumOrders
FROM orders
WHERE YEAR(orders.OrderDate) IN (2003, 2004)
GROUP BY orders.customernumber
ORDER BY NumOrders DESC;

#Q13. Write a SQL query to get the city names from customer table where more than 4 customers reside.
Select customers.city, count(DISTINCT customers.customername) as numcustomers
from customers
group by customers.city
order by numcustomers desc;

