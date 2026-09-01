
SELECT *
FROM sales;


SELECT customer_name, product, amount
FROM sales;


SELECT *
FROM sales
WHERE amount > 10000;


SELECT *
FROM sales
WHERE city = 'Bangalore'
  AND amount > 3000;


SELECT *
FROM sales
WHERE city = 'Bangalore'
   OR city = 'Chennai';


SELECT *
FROM sales
WHERE NOT category = 'Electronics';


SELECT *
FROM sales
WHERE customer_name LIKE 'A%';


SELECT *
FROM sales
WHERE city IN ('Mumbai', 'Delhi', 'Hyderabad');


SELECT *
FROM sales
WHERE amount BETWEEN 2000 AND 15000;


SELECT *
FROM sales
WHERE customer_name IS NULL;
