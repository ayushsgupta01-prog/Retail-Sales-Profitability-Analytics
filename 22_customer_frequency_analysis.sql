WITH customer_metrics AS (
    SELECT
        customer_id,
        customer_name,
        COUNT(DISTINCT order_id) AS total_orders,
        ROUND(SUM(sales), 2) AS total_sales,
        ROUND(SUM(profit), 2) AS total_profit
    FROM retail.superstore
    GROUP BY
        customer_id,
        customer_name
),

customer_frequency AS (
    SELECT
        customer_id,
        customer_name,
        total_orders,
        total_sales,
        total_profit,
        CASE
            WHEN total_orders BETWEEN 1 AND 3 THEN 'Low Frequency'
            WHEN total_orders BETWEEN 4 AND 7 THEN 'Medium Frequency'
            WHEN total_orders >= 8 THEN 'High Frequency'
        END AS frequency_group
    FROM customer_metrics
)

SELECT
    frequency_group,
    COUNT(*) AS customer_count,
    ROUND(AVG(total_orders), 2) AS avg_orders_per_customer,
    ROUND(AVG(total_sales), 2) AS avg_sales_per_customer,
    ROUND(AVG(total_profit), 2) AS avg_profit_per_customer
FROM customer_frequency
GROUP BY frequency_group
ORDER BY
    CASE frequency_group
        WHEN 'Low Frequency' THEN 1
        WHEN 'Medium Frequency' THEN 2
        WHEN 'High Frequency' THEN 3
    END;