
  
    

        create or replace transient table VINI.PUBLIC.stg_Product
         as
        (select DISTINCT * 
from VINI.PUBLIC.PRODUCTS 
where PRODUCT_ID is not NULL
        );
      
  