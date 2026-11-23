{{ config(materialized='table') }}

SELECT
  o.order_date,
  c.country,
  COUNT(o.order_id) AS order_count,
  SUM(o.amount) AS total_amount
FROM {{ source('core', 'orders') }} AS o
LEFT JOIN {{ source('core', 'customers') }} AS c
  ON o.customer_id = c.customer_id
WHERE o.is_valid
GROUP BY 1, 2
