@DELIMITER $$

create trigger payments_after_delete
	after delete on payments
    for each row
begin
	update invoices
    set payment_total = payment_total - OLD.amount
	where invoice_id = OLD.invoice_id;

end$$

@DELIMITER ;
-- how to use
-- delete 
-- from payments
-- where payment_id = 9