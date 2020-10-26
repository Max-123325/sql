create table student(
 stuno int auto_increment primary key,
 stuname varchar(23),
 stusex VARCHAR(2),
 stuaddress VARCHAR(23)
);

insert into student VALUES(null,'tom','男','北京');
insert into student VALUES(null,'tom1','女','上海');
insert into student VALUES(null,'tom2','男','浙江');
insert into student VALUES(null,'tom3','女','江西');
insert into student VALUES(null,'tom4','男','北京');

create table stumarks(
 examno int auto_increment primary key,
 stuno varchar(23),
 writtenexam double,
 labexam double
);

insert into stumarks VALUES(null,2,45,97);
insert into stumarks VALUES(null,1,45,67);
insert into stumarks VALUES(null,4,95,67);
insert into stumarks VALUES(null,2,45,55);
insert into stumarks VALUES(null,3,55,69);

SELECT stuaddress,count(writtenexam) c from student LEFT JOIN stumarks on student.stuno=stumarks.stuno group by stuaddress;
SELECT stuaddress,count(writtenexam) c from student left join stumarks using(stuno) group by stuaddress having c>0;
select distinct stuaddress from student right join stumarks using(stuno);
select distinct stuaddress from student right join stumarks using(stuno) having stuaddress is not null;
select stusex,count(*) 总数 from student group by stusex;
select stusex,count(*) 总数 from student where stusex='男' union select stusex,COUNT(*) from student where stusex='女';
select sum(stusex='男') 男,SUM(stusex='女') 女 from student;
-- 显示每个地区的总人数，男生，女生人数。
SELECT stuaddress,count(stusex) 总人数,sum(stusex='男') 男,sum(stusex='女') 女 from student group by stuaddress;
-- 显示每个地区的写作和实验的总成绩，并按降序排序。
SELECT stuaddress,sum(writtenexam+labexam) s from student LEFT JOIN stumarks using(stuno) GROUP BY stuaddress ORDER BY s desc;

-- 子查询
-- 找出
select * from student where stuno=(select stuno from stumarks where writtenexam=67);
-- 找出最高分的学生
SELECT *,count(
) from student where stuno=(select stuno from stumarks ORDER BY (writtenexam+labexam) desc limit 1);

