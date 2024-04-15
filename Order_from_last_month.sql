WITH RecentCustomers AS (

  SELECT customer_id

  FROM customers

  WHERE registration_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH)

)

SELECT customer_id, COUNT(order_id) AS total_orders

FROM orders

WHERE customer_id IN (SELECT customer_id FROM RecentCustomers)

GROUP BY customer_id;