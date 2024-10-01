create database regex1;
use regex1;
create table date(student_id int ,name varchar(40));
insert into date values(12,'pooja');
insert into date values(13,'sita');
insert into date values(14,'neeta');
insert into date values(15,'geeta');
insert into date values(12,'kavita');
set sql_safe_updates=0;
select * from date;
update date set name='neeta' where student_id = 12;
alter table date add column phonenumber int;
select * from date;
insert into date (phonenumber)values(2777733),(6636663);
select * from date;

------- 25 september -----------------------
create database regex12;
use regex12;
create table pr


