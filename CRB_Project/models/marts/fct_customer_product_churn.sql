WITH Vini as (
    SELECT 
        DATEDIFF(MONTH, LAG(PAYMENT_MONTH) OVER (PARTITION BY CUSTOMER_ID, PRODUCT_ID ORDER BY PAYMENT_MONTH), PAYMENT_MONTH) AS month_gap,
        *
        FROM {{ ref("stg_Trans")}}
        
),

Vars as (

    SELECT 
        CUSTOMER_ID, 
        MAX(month_gap) as Product_Churn
    FROM Vini
    WHERE month_gap > 1
    GROUP BY 
        CUSTOMER_ID
    ORDER BY 
        Product_Churn DESC
    LIMIT 10
)

SELECT * 
FROM Vars

