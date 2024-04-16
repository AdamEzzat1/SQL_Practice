WITH OrderedOrders AS (
  SELECT 
    order_id,
    customer_id,
    order_timestamp,
    LEAD(order_timestamp, 1) OVER (PARTITION BY customer_id ORDER BY order_timestamp) AS second_order_timestamp
  FROM 
    orders
)
SELECT 
  customer_id,
  order_timestamp,
  second_order_timestamp,
  COALESCE(second_order_timestamp - order_timestamp, 0) AS time_between_first_and_second_orders
FROM 
  OrderedOrders;
