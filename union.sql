USE sql_store;
select c.customer_id,c.first_name,c.points,'Bronze' as type
from customers c
	where points < 2000
union
select c.customer_id,c.first_name,c.points,'Silver' as type
from customers c
	where points between 2000 and 3000
union
select c.customer_id,c.first_name,c.points,'Gold' as type
from customers c
	where points > 3000
order by first_name