set @para_invoices_count = 0; -- user or session variables
set @para_invoices_total = 0;
call sql_invoicing.get_unpaid_invoices_for_client(3, @para_invoices_count, @para_invoices_total);
select @para_invoices_count, @para_invoices_total;

-- local variable
