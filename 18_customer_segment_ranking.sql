WITH customer_metrics AS (
    SELECT
        customer_id,
        customer_name,
        segment,
        COUNT(DISTINCT order_id) AS total_orders,
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
),

ranked_customers AS (
    SELECT
        customer_id,
        customer_name,
        segment,
        total_orders,
        total_sales,
        total_profit,
        profit_margin_pct,
        RANK() OVER (
            PARTITION BY segment
            ORDER BY total_profit DESC
        ) AS profit_rank
    FROM customer_metrics
)

SELECT
    segment,
    profit_rank,
    customer_id,
    customer_name,
    total_orders,
    total_sales,
    total_profit,
    profit_margin_pct
FROM ranked_customers
WHERE profit_rank <= 3
ORDER BY segment, profit_rank;