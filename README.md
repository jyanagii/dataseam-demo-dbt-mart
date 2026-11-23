# dataseam-demo-dbt-mart

Downstream dbt project (`acme_mart`) for the DataSeam multi-repository demo.
Reads `acme-analytics-prod.core.orders` and `acme-analytics-prod.core.customers`
as dbt sources and builds `mart.daily_sales` and `mart.customer_ltv`.
