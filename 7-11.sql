-- 7查询学过"张三"老师授课的同学的信息
select s_id, s_name
from student
join score using(s_id)
join course using(c_id)
join teacher using(t_id)
where t_id =1;

-- 8查询没学过"张三"老师授课的同学的信息
select distinct s_name, s_birth, s_sex
from student
left join score using(s_id)
left join course using(c_id)
left join teacher using(t_id)
where s_id not in (select s_id 
from student
join score using(s_id)
join course using(c_id)
join teacher using(t_id)
where t_id =1
);

-- 查询学过编号为"01"并且也学过编号为"02"的课程的同学的信息
select temp.s_id, temp.s_name, temp.s_birth, temp.s_sex
from (
select distinct *
from student
left join score using(s_id)
left join course using(c_id)
left join teacher using(t_id)
where c_id = 01 or c_id = 02
) as temp
group by s_name
having count(*)=2;
select *
from student as s
where s.s_id in (select s_id from score where c_id = 01)
and s.s_id in (select s_id from score where c_id = 02);
-- 10、查询学过编号为"01"但是没有学过编号为"02"的课程的同学的信息
select *
from student as s
where s.s_id in (select s_id from score where c_id = 01)
and s.s_id not in (select s_id from score where c_id = 02);

-- 11、查询没有学全所有课程的同学的信息
select temp.s_id, temp.s_name, temp.s_birth, temp.s_sex,count(temp.s_id),count(temp.c_id)
from (
select distinct *
from student
left join score using(s_id)
left join course using(c_id)
left join teacher using(t_id)
) as temp
group by temp.s_id
having count(temp.s_id) < (select count(distinct c_id) from course);

select *
from student
where s_id not in (select s_id 
                   from score 
                   group by s_id 
                   having count(c_id) = (select count(distinct c_id) from course));
                   
-- 查询至少有一门课与学号为"01"的同学所学相同的同学的信息
select distinct s_name, s_id, s_birth, s_sex
from student
join score using(s_id)
where c_id in (select c_id
from score
join student using(s_id)
where s_id = 01)
and s_id != 01;

-- 查询和"01"号的同学学习的课程完全相同的其他同学的信息
SELECT * FROM student
WHERE s_id IN (
SELECT s_id FROM score
GROUP BY s_id
HAVING GROUP_CONCAT(c_id) = (
SELECT GROUP_CONCAT(c_id) FROM score
GROUP BY s_id
HAVING s_id= 01)
AND s_id != 01
);

-- 查询没学过"张三"老师讲授的任一门课程的学生姓名
select * from student
where s_id not in
(
select s_id
from (select *
from student
join score using(s_id)) as temp
where temp.c_id = (select c_id
from course
join teacher using(t_id)
where t_name = '张三')
);

select s_name
from student
where s_id not in (select * from score as a inner join course as b on a.c_id = b.c_id
                   inner join teacher as c on b.t_id = c.t_id where c.t_name = '张三');
                   
-- 15.查询两门及其以上不及格课程的同学的学号，姓名及其平均成绩
select s_id, s_name, avg(s_score), count(s_score)
from score s
join student using(s_id)
group by s_id
having sum(case when s_score < 60 then 1 else 0 end) >= 2;

-- 16. 检索"01"课程分数小于60，按分数降序排列的学生信息
select s_id, s_name,c_id,s_score
from score s
join student using(s_id)
group by s_id
having c_id = 01 and s_score < 60
order by s_score desc;

-- 按平均成绩从高到低显示所有学生的所有课程的成绩以及平均成绩（重要！）
select *
from student st
left join
(select c_id, s_id, s_score as cn_score,c_name  from score join student using(s_id) left join course using(c_id) where c_id = 01) as CN using(s_id)
left join 
(select c_id, s_id, s_score as ma_score,c_name  from score join student using(s_id) left join course using(c_id) where c_id = 02) as MA using(s_id)
left join
(select c_id, s_id, s_score as en_score,c_name  from score join student using(s_id) left join course using(c_id) where c_id = 03) as EN using(s_id)
left join
(select s_id, avg(s_score) as avgscore from score group by s_id) as avgscore on st.s_id = avgscore.s_id
order by avgscore desc;

select a.s_id,(select s_score from score where s_id = a.s_id and c_id = '01') as 语文,
              (select s_score from score where s_id = a.s_id and c_id = '02') as 数学,
              (select s_score from score where s_id = a.s_id and c_id = '03') as 英语,
              round(avg(s_score),2) as 平均分 
from score as a 
group by a.s_id 
order by 平均分 desc;

-- 18.查询各科成绩最高分、最低分和平均分：以如下形式显示：课程ID，课程name，最高分，最低分，平均分，及格率，中等率，优良率，优秀率--及格为>=60，中等为：70-80，优良为：80-90，优秀为：>=90（重要！）
select c_id, c_name, max(s_score) as 最高分, min(s_score) as 最低分,  avg(s_score) as 平均分,
		sum(case when s_score >= 60 then 1 else 0 end)/count(*) as 及格率,
        sum(case when s_score between 70 and 80 then 1 else 0 end)/count(*) as 中等率,
		sum(case when s_score between 80 and 90 then 1 else 0 end)/count(*) as 优良率,
        sum(case when s_score >= 90 then 1 else 0 end)/count(*) as 优秀率
from score left join course using(c_id) group by c_id;

-- 19. 按各科成绩进行排序，并显示排名（涉及到TopN问题，重要！！！）窗口函数
select *, dense_rank() over (partition by c_id order by s_score desc) as 'rank'
from score
order by c_id;

-- 20. 查询学生的总成绩并进行排名
select s_id, s_name, sum(s_score) as 总成绩, dense_rank() over (order by sum(s_score) desc) as 'rank'
from score
right join student using (s_id)
group by s_id




