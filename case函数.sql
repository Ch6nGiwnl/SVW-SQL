use sql_store;

select 
	order_id,
    case 
		when year(order_date) = 2019 then 'active'
        when year(order_date) = 2019-1 then 'last year'
        when year(order_date) < 2019-1 then 'archived'
        else 'future'
	END AS category
from orders;

use sql_store;

select 
	concat(first_name,' ',last_name) as name,
    points,
    case 
		when points > 3000 then'Gold'
        when points between 2000 and 3000 then 'Silver'
        when points <2000 then 'Bronze'
		else 'warning'
	END AS category
from customers
order by points desc

     