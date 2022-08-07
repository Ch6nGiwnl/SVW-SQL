show variables like 'event%';
set global event_scheduler = on -- 启用事件

@DELIMITER $$
create event yearly_delete_stale_audit_rows
on schedule
	--  at '2019-05-01' -- 执行一次
    every 1 year starts '2019-01-01' ENDS '2029-01-01'  -- 2 day 1year 执行多次
DO BEGIN
	delete from payments_audit
    where action_date < now() - interval 1 year;
    -- 类似dateadd(now(),interval-1year) 和 datesub(now(),interval +1 year) 都是now -1年 
end $$
@delimiter ;
-- 本事件的作用是定期删除一年前的旧数据