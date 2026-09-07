WITH product_metrics AS (
    SELECT
        product_id,
        product_name,
        category,
        sub_category,
        ROUND(SUM(sales), 2) AS total_sales,
        ROUND(SUM(profit), 2) AS total_profit,
        ROUND(
            (SUM(profit) / NULLIF(SUM(sales), 0)) * 100,
            2
        ) AS profit_margin_pct
    FROM retail.superstore
    GROUP BY
        product_id,
        product_name,
        category,
        sub_category
)

SELECT
    product_id,
    product_name,
    category,
    sub_category,
    total_sales,
    total_profit,
    profit_margin_pct
FROM product_metrics
WHERE total_sales > 10000
  AND profit_margin_pct < 5
ORDER BY total_sales DESC;  