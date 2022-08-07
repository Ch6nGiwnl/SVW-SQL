use sql_invoicing;
drop procedure if exists get_invoices_by_client;
@DELIMITER $$
-- -- 修改‘$$’替代‘;’为结尾分隔符
create procedure get_invoices_by_client
(
para_client_id integer
)-- recall INT
begin
	select *
	from invoices i
    where i.client_id = para_client_id;
end$$

@DELIMITER ; 
-- 修改回‘;’为结尾分隔符