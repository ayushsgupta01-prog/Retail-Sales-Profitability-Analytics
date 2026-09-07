WITH customer_metrics AS (
    SELECT
        customer_id,
        customer_name,
        segment,
        COUNT(DISTINCT order_id) AS total_orders,
        SUM(quantity) AS total_quantity,
        ROUND(SUM(sales), 2) AS total_sales,
        ROUND(SUM(profit), 2) AS total_profit,
        ROUND(
            (SUM(profit) / NULLIF(SUM(sales), 0)) * 100,
            2
        ) AS profit_margin_pct
    FROM retail.superstore
    GROUP BY
        customer_id,
        customer_name,
        segment
)

SELECT
    customer_id,
    customer_name,
    segment,
    total_orders,
    total_quantity,
    total_sales,
    total_profit,
    profit_margin_pct
FROM customer_metrics
ORDER BY total_profit DESC
LIMIT 10;