WITH yearly_profit AS (
    SELECT
        EXTRACT(YEAR FROM order_date)::INTEGER AS year,
        ROUND(SUM(profit), 2) AS total_profit
    FROM retail.superstore
    GROUP BY EXTRACT(YEAR FROM order_date)
),

profit_with_previous_year AS (
    SELECT
        year,
        total_profit,
        LAG(total_profit) OVER (
            ORDER BY year
        ) AS previous_year_profit
    FROM yearly_profit
)

SELECT
    year,
    total_profit,
    previous_year_profit,
    ROUND(
        (
            (total_profit - previous_year_profit)
            / NULLIF(previous_year_profit, 0)
        ) * 100,
        2
    ) AS yoy_profit_growth_pct
FROM profit_with_previous_year
ORDER BY year;