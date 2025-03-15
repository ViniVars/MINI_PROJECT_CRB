
  
    

        create or replace transient table VINI.PUBLIC.fct_new_customers
         as
        (WITH Vini as (
    SELECT 
        CUSTOMER_ID,
        DATEDIFF(MONTH, LAG(PAYMENT_MONTH) OVER(PARTITION BY CUSTOMER_ID ORDER BY PAYMENT_MONTH), PAYMENT_MONTH) as month_gap,
        FIRST_VALUE(PAYMENT_MONTH) OVER(PARTITION BY CUSTOMER_ID ORDER BY PAYMENT_MONTH) as first_pay
        FROM VINI.PUBLIC.stg_Trans
), 


Vars as (
    SELECT
        first_pay, 
        COUNT(DISTINCT CUSTOMER_ID) as New_Members
    FROM Vini
    GROUP BY first_pay
    ORDER BY first_pay
)

SELECT *
FROM Vars
        );
      
  