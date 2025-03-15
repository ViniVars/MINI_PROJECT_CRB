WITH Vini as (
    SELECT 
        PRODUCT_ID, 
        SUM(REVENUE) as total
    FROM {{ref("stg_Trans")}}
    GROUP BY PRODUCT_ID
)

SELECT 
    RANK() OVER(ORDER BY total DESC) as revenue_rank,
    PRODUCT_ID,
    total
FROM Vini 