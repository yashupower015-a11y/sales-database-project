1. INNER JOIN
SELECT
s.Transaction_ID,
s.Date,
s.Customer_ID,
c.City AS Customer_City,
c.Age_Band,
c.Gender,
s.Net_Sales
FROM sales_transactions AS s
INNER JOIN customer_data AS c
ON s.Customer_ID = c.Customer_ID;
2. LEFT JOIN
SELECT
s.Transaction_ID,
s.Customer_ID,
c.City AS Customer_City,
c.Total_Orders,
c.Total_Revenue,
s.Net_Sales
FROM sales_transactions AS s
LEFT JOIN customer_data AS c
ON s.Customer_ID = c.Customer_ID;
3. RIGHT JOIN
SELECT
c.Customer_ID,
c.City,
c.Age_Band,
c.Total_Orders,
s.Transaction_ID,
s.Date,
s.Net_Sales
FROM sales_transactions AS s
RIGHT JOIN customer_data AS c
ON s.Customer_ID = c.Customer_ID;
4. FULL OUTER JOIN
SELECT
c.Customer_ID,
c.City,
s.Transaction_ID,
s.Date,
s.Net_Sales
FROM customer_data AS c
FULL OUTER JOIN sales_transactions AS s
ON c.Customer_ID = s.Customer_ID;
5. JOIN SALES TO PRODUCTS (ALIASES)
SELECT
s.Transaction_ID,
s.Product_ID,
p.Name AS Product_Name,
p.Category,
p.MRP,
p.COGS,
s.Units,
s.Net_Sales
FROM sales_transactions AS s
INNER JOIN product_catalogue AS p
ON s.Product_ID = p.Product_ID;
6. DUPLICATE ROWS CAUSED BY A BAD JOIN
-- Joining on City can multiply rows because many
-- customers can live in the same city.
SELECT
s.Transaction_ID,
s.Customer_ID AS Sale_Customer_ID,
c.Customer_ID AS Matched_Customer_ID,
s.City
FROM sales_transactions AS s
JOIN customer_data AS c
ON s.City = c.City
LIMIT 20;
7. FIX DUPLICATE ROWS
-- Use the correct key: Customer_ID.
SELECT
s.Transaction_ID,
s.Customer_ID,
c.City,
c.Age_Band,
c.Gender
FROM sales_transactions AS s
JOIN customer_data AS c
ON s.Customer_ID = c.Customer_ID;
-- Check for duplicate customer records:
SELECT
Customer_ID,
COUNT(*) AS customer_row_count
FROM customer_data
GROUP BY Customer_ID
HAVING COUNT(*) > 1;
8. SELF JOIN
-- Find pairs of different customers in the same city.
SELECT
c1.Customer_ID AS Customer_1,
c2.Customer_ID AS Customer_2,
c1.City
FROM customer_data AS c1
INNER JOIN customer_data AS c2
ON c1.City = c2.City
AND c1.Customer_ID < c2.Customer_ID
ORDER BY c1.City, c1.Customer_ID;
9. BUSINESS EXAMPLE — THREE TABLES
SELECT
s.Transaction_ID,
s.Date,
c.Customer_ID,
c.Age_Band,
c.Gender,
p.Product_ID,
p.Name AS Product_Name,
p.Category,
s.Units,
s.Channel,
s.Net_Sales
FROM sales_transactions AS s
LEFT JOIN customer_data AS c
ON s.Customer_ID = c.Customer_ID
LEFT JOIN product_catalogue AS p
ON s.Product_ID = p.Product_ID;
10. NOTES
INNER JOIN : only matching records from both tables.
LEFT JOIN : all left-table rows + matching right rows.
RIGHT JOIN : all right-table rows + matching left rows.
FULL OUTER : all rows from both tables.
Duplicates : often caused by non-unique JOIN keys or
unintended one-to-many/many-to-many matches.
Fix : use the correct key, aggregate before joining
when appropriate, or use DISTINCT only when
duplicate business records are not required.
SELF JOIN : joins a table to itself using two aliases.