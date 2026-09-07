WITH product_profit AS (
    SELECT
        product_id,
        product_name,
        category,
        sub_category,
        ROUND(SUM(profit), 2) AS total_profit
    FROM retail.superstore
    GROUP BY
        product_id,
        product_name,
        category,
        sub_category
),

product_contribution AS (
    SELECT
        product_id,
        product_name,
        category,
        sub_category,
        total_profit,
        SUM(total_profit) OVER (
            PARTITION BY category
        ) AS category_total_profit
    FROM product_profit
)

SELECT
    category,
    product_id,
    product_name,
    sub_category,
    total_profit,
    ROUND(category_total_profit, 2) AS category_total_profit,
    ROUND(
        (total_profit / NULLIF(category_total_profit, 0)) * 100,
        2
    ) AS profit_contribution_pct
FROM product_contribution
ORDER BY category, profit_contribution_pct DESC
LIMIT 20;