select
	o.order_id,c.first_name as customer,o.order_date,sh.name as shipper,os.name as status
from customers c
left join orders o
	on c.customer_id=o.customer_id
left join shippers sh
	on o.shipper_id=sh.shipper_id
join order_statuses os
	on o.status=os.order_status_id
order by o.status
