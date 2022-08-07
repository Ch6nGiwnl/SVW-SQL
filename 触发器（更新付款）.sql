@DELIMITER $$

create trigger payments_after_insert
	after insert on payments
    for each row
begin
	update invoices
    set payment_total = payment_total + NEW.amount
	where invoice_id = NEW.invoice_id;

end$$

@DELIMITER ;