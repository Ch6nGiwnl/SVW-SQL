use sql_invoicing;
drop procedure if exists get_risk_factor;
@DELIMITER $$

create procedure get_risk_factor()
begin

	declare risk_factor DECIMAL(9,2) default 0;
	declare invoices_total DECIMAL(9,2) default 0;
    declare invoices_count int;
    select count(*),sum(invoice_total)
    into invoices_count,invoices_total
    from invoices;
    
    set risk_factor = invoices_total / invoices_count * 5;
    select risk_factor;
-- risk factor = invoices_total / invoices_count * 5
-- declare的局部变量和set的用户变量不会最后被显示，用户变量需要在select中选择，局部变量在存储过程后变量无效


end$$

@DELIMITER ; 
