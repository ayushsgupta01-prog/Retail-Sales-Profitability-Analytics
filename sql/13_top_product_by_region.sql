WITH regional_product_profit AS (
    SELECT
        region,
        product_id,
        product_name,
        category,
        sub_category,
        ROUND(SUM(sales), 2) AS total_sales,
        ROUND(SUM(profit), 2) AS total_profit
    FROM retail.superstore
    GROUP BY
        region,
        product_id,
        product_name,
        category,
        sub_category
),

ranked_products AS (
    SELECT
        region,
        product_id,
        product_name,
        category,
        sub_category,
        total_sales,
        total_profit,
        ROW_NUMBER() OVER (
            PARTITION BY region
            ORDER BY total_profit DESC
        ) AS region_rank
    FROM regional_product_profit
)

SELECT
    region,
    region_rank,
    product_id,
    product_name,
    category,
    sub_category,
    total_sales,
    total_profit
FROM ranked_products
WHERE region_rank = 1
ORDER BY region;