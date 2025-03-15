WITH Vini as(
    SELECT 
        CUSTOMER_ID, 
        MIN(PAYMENT_MONTH) as first_pay
    FROM VINI.PUBLIC.stg_Trans
    GROUP BY CUSTOMER_ID
),

Vars as(
    SELECT
        YEAR(first_pay) as fiscal_year,
        COUNT(CUSTOMER_ID) as new_customers
    FROM Vini
    GROUP BY fiscal_year
    ORDER BY fiscal_year DESC
)

SELECT *
FROM Vars