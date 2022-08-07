use sql_invoicing;
drop procedure if exists get_invoices_with_balance;
@delimiter $$
create procedure get_invoices_with_balance()
begin
select *, invoice_total - payment_total as balance
from invoices
having balance > 0;
end$$
@delimiter ;
