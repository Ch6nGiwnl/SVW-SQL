use sql_invoicing;

select *
from invoices i
where invoice_total > (
	select avg(invoice_total)
    from invoices
    where client_id = i.client_id
)