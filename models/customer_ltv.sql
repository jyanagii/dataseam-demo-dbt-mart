{{ config(materialized='table') }}

SELECT
  c.customer_id,
  c.country,
  COUNT(o.order_id) AS lifetime_orders,
  SUM(o.amount) AS lifetime_value
FROM {{ source('core', 'customers') }} AS c
LEFT JOIN {{ source('core', 'orders') }} AS o
  ON c.customer_id = o.customer_id
GROUP BY 1, 2
