WITH Vini as(
    SELECT 
        DISTINCT *
    FROM {{source("vini", "TRANS")}} 
    WHERE CUSTOMER_ID IS NOT NULL
),

Vars as (
    SELECT 
        CUSTOMER_ID, 
        PRODUCT_ID,
        TO_DATE(PAYMENT_MONTH, 'MM-DD-YYYY') as PAYMENT_MONTH,
        REVENUE_TYPE,
        REVENUE,
        QUANTITY,
        DIMENSION_1 as Dim_1,
        DIMENSION_2 as Dim_2,
        DIMENSION_3 as Dim_3,
        DIMENSION_4 as Dim_4,
        DIMENSION_5 as Dim_5,
        DIMENSION_6 as Dim_6,
        DIMENSION_7 as Dim_7,
        DIMENSION_8 as Dim_8,
        DIMENSION_9 as Dim_9,
        DIMENSION_10 as Dim_10,
        COMPANIES
    FROM Vini
)

SELECT *
FROM Vars