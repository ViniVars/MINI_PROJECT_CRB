select DISTINCT * 
from {{source("vini", "PRODUCTS")}} 
where PRODUCT_ID is not NULL
