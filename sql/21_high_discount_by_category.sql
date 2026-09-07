WITH discount_category_metrics AS (
    SELECT
        category,
        discount,
        COUNT(*) AS transaction_rows,
        ROUND(SUM(sales), 2) AS total_sales,
        ROUND(SUM(profit), 2) AS total_profit,
        ROUND(
            (SUM(profit) / NULLIF(SUM(sales), 0)) * 100,
            2
        ) AS profit_margin_pct
    FROM retail.superstore
    GROUP BY
        category,
        discount
)

SELECT
    category,
    discount,
    transaction_rows,
    total_sales,
    total_profit,
    profit_margin_pct
FROM discount_category_metrics
WHERE discount >= 0.30
ORDER BY category, discount;