WITH Vini as (
    SELECT 
        CUSTOMER_ID,
        DATEDIFF(MONTH, LAG(PAYMENT_MONTH) OVER(PARTITION BY CUSTOMER_ID ORDER BY PAYMENT_MONTH), PAYMENT_MONTH) as month_gap
    FROM {{ref("stg_Trans")}}
),

Vars as (
    SELECT  
        CUSTOMER_ID,
    FROM Vini
    WHERE month_gap > 1
    GROUP BY CUSTOMER_ID
)


SELECT COUNT(CUSTOMER_ID) as Churned_Customers
FROM Vars