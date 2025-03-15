
  
    

        create or replace transient table VINI.PUBLIC.fct_customer_cross_sell
         as
        (WITH Vini as(
    SELECT
        CUSTOMER_ID,
        PAYMENT_MONTH,
        COUNT(PRODUCT_ID) as Count_Products
    FROM VINI.PUBLIC.stg_Trans
    GROUP BY CUSTOMER_ID, PAYMENT_MONTH
),

Vars as(
    SELECT
        SUM(Count_Products) OVER (PARTITION BY CUSTOMER_ID) 
        - FIRST_VALUE(Count_Products) OVER (PARTITION BY CUSTOMER_ID ORDER BY PAYMENT_MONTH) AS Cross_Sell,        
        CUSTOMER_ID,
    FROM Vini
),

Gojo as (

    SELECT 
        CUSTOMER_ID, 
        Cross_Sell
    FROM Vars
    GROUP BY 
        CUSTOMER_ID, 
        Cross_Sell
    ORDER BY 
        Cross_Sell DESC
    LIMIT 10
)

SELECT *
FROM Gojo
        );
      
  