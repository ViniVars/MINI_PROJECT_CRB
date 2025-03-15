WITH Vini AS (
    SELECT 
        CUSTOMER_ID, 
        SUM(REVENUE) AS total
    FROM VINI.PUBLIC.stg_Trans
    GROUP BY CUSTOMER_ID
)

SELECT 
    RANK() OVER (ORDER BY total DESC) AS revenue_rank, 
    CUSTOMER_ID,
    total
FROM Vini