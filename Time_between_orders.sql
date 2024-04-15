WITH OrderedOrders AS (
  SELECT 
    order_id,
    customer_id,
    order_timestamp,
    LEAD(order_timestamp) OVER (PARTITION BY customer_id ORDER BY order_timestamp) AS next_order_timestamp
  FROM 
    orders
)
SELECT 
  customer_id,
  order_timestamp,
  next_order_timestamp,
  COALESCE(next_order_timestamp - order_timestamp, 0) AS time_between_orders
FROM 
  OrderedOrders;