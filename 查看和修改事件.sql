show events like 'yearly%';
drop event if exists yearly_delete_stale_audit_rows;
alter event yearly_delete_stale_audit_rows enable;
