-- use sql_store;

-- select
-- 	o.order_id,c.first_name,sh.name as shipper
-- from orders o
-- join customers c
	-- on o.customer_id=c.customer_id,当2表中某一列名称完全相同时，可用using代替on
 --    using (customer_id)
-- left join shippers sh
-- 	using (shipper_id)

use sql_invoicing;
select p.date,c.name,p.amount,pm.name as payment_methods
from payments p
left join clients c
	using (client_id)
join payment_methods pm
	on p.payment_method=pm.payment_method_id
