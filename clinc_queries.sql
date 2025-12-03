--1
SELECT 
    sales_channel,
    SUM(amount) AS total_revenue
FROM clinic_sales
WHERE YEAR(datetime) = 2021
GROUP BY sales_channel;


--2

SELECT 
    cs.id AS customer_id,
    SUM(clinic_sales.amount) AS total_spent
FROM customers cs
JOIN clinic_sales 
    ON cs.id = cs.id   -- (placeholder join since schema did not show relation)
WHERE YEAR(clinic_sales.datetime) = 2021
GROUP BY cs.id
ORDER BY total_spent DESC
LIMIT 10;


--3

SELECT 
    MONTH(datetime) AS month_no,
    SUM(amount) AS revenue
FROM clinic_sales
WHERE YEAR(datetime) = 2021
GROUP BY MONTH(datetime)
ORDER BY month_no;


--4
SELECT 
    c.cid,
    c.city,
    MONTH(cs.datetime) AS month_no,
    SUM(cs.amount) AS revenue
FROM clinics c
JOIN clinic_sales cs ON c.cid = cs.cid
WHERE YEAR(cs.datetime) = 2021
GROUP BY c.cid, c.city, MONTH(cs.datetime);
