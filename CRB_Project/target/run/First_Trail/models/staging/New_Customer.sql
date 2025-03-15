
  
    

        create or replace transient table VINI.PUBLIC.New_Customer
         as
        (select DISTINCT * 
from VINI.PUBLIC.CUSTOMERS 
where company is NOT NULL
ORDER BY CUSTOMER_ID
        );
      
  