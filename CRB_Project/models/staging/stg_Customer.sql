select DISTINCT * 
from {{source("vini", "CUSTOMERS")}} 
where company is NOT NULL
ORDER BY CUSTOMER_ID