--1
SELECT 
    u.user_id,
    b.room_no
FROM users u
JOIN bookings b 
    ON u.user_id = b.user_id
WHERE b.booking_date = (
    SELECT MAX(booking_date)
    FROM bookings
    WHERE user_id = u.user_id
);


--2
SELECT 
    b.booking_id,
    SUM(i.item_rate * bc.item_quantity) AS total_amount
FROM bookings b
JOIN booking_commercials bc ON b.booking_id = bc.booking_id
JOIN items i ON bc.item_id = i.item_id
WHERE MONTH(b.booking_date) = 11
  AND YEAR(b.booking_date) = 2021
GROUP BY b.booking_id;


--3
SELECT 
    bc.bill_id,
    SUM(i.item_rate * bc.item_quantity) AS bill_amount
FROM booking_commercials bc
JOIN items i ON bc.item_id = i.item_id
WHERE MONTH(bc.bill_date) = 10
  AND YEAR(bc.bill_date) = 2021
GROUP BY bc.bill_id
HAVING SUM(i.item_rate * bc.item_quantity) > 1000;


--4
SELECT 
    MONTH(bc.bill_date) AS month_no,
    i.item_name,
    SUM(bc.item_quantity) AS total_qty
FROM booking_commercials bc
JOIN items i ON bc.item_id = i.item_id
WHERE YEAR(bc.bill_date) = 2021
GROUP BY MONTH(bc.bill_date), i.item_name
ORDER BY month_no, total_qty DESC;


--5
