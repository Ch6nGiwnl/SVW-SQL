use sql_store;

select 
	concat(first_name,' ',last_name) as customer, coalesce(phone,'unknown') as phone
from customers