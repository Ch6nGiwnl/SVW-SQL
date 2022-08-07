use sql_invoicing;

select  distinct client_id, 
		name,
		(select avg(invoice_total)
			from invoices) as average,
		(select sum(invoice_total)
			from invoices 
			where client_id = i.client_id) as total_sales,
		(select total_sales)-(select average) as difference
from invoices i
right join clients using(client_id)
-- 用group by client_id也可以
