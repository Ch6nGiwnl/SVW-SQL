use sql_invoicing;
drop procedure if exists get_unpaid_invoices_for_client;
@DELIMITER $$
-- -- 修改‘$$’替代‘;’为结尾分隔符
create procedure get_unpaid_invoices_for_client
(
para_client_id integer,
OUT para_invoices_count tinyint, -- 输出参数
OUT para_invoices_total decimal(9,2)
)
begin
	select count(*), sum(invoice_total)
    into para_invoices_count,para_invoices_total
	from invoices i
    where i.client_id = para_client_id 
    AND payment_total = 0;
end$$

@DELIMITER ; 
-- 修改回‘;’为结尾分隔符