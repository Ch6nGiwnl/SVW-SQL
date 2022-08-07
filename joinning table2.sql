use sql_invoicing;

SELECT p.date,c.client_id, c.name, c.state, pm.name AS payment_method, p.amount, p.invoice_id
FROM clients c
JOIN payments p
	ON c.client_id = p.client_id 
JOIN payment_methods pm
	ON p.payment_method = pm.payment_method_id