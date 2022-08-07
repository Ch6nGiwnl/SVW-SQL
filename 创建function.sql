use sql_invoicing;
drop function if exists get_risk_factor_for_client;
@DELIMITER $$

create function get_risk_factor_for_client
(
	client_id int
)
returns integer
-- deterministic -- 确定性，输入同样的值，输出同样的值 本案例中无
reads SQL DATA -- 读取数据
-- modifies sql data -- 修改数据 本案例中无
begin

	declare risk_factor DECIMAL(9,2) default 0;
	declare invoices_total DECIMAL(9,2) default 0;
    declare invoices_count int;
    select count(*),sum(invoice_total)
    into invoices_count,invoices_total
    from invoices i
    where i.client_id = client_id;
    
    set risk_factor = invoices_total / invoices_count * 5;
	return ifnull(risk_factor,0);

end$$

@DELIMITER ; 
