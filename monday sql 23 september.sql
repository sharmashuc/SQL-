CREATE DATABASE Students;
uSE Students;
CREATE TABLE Students123(Student_id int,
Studentname Varchar(50),address Varchar(50),
date_of_enrolling date);
-- Retrive (select)
 -- Select column_name from table_name
 -- * means all columns
 Select * from Students123;
Select student_id,Studentname from Students123;
-- Insert into
-- data is inserted through insert into
-- Syntax
-- Insert into 
Insert into  students123(column1,column2,coumn3........) values (value1,value2,value3,value4,value5........)
Insert into Students123(student_id,Studentname,address,date_of_enrolling) values (68,'Bhanu Sharma','Jaipur','2024-09-10'),(23,'abc','abc','2024-09-02');
Select * from Students123;
Insert into Students123 values (68,'Bhanu Sharma','Jaipur','2024-09-10'),(23,'abc','abc','2024-09-02');
Insert into Students123(student_id,Studentname,address) values (68,'Bhanu Sharma','Jaipur'),(23,'abc','abc');
-- update table name set newcondition where condition-----
set sql_safe_updates =0;
update students123 set student_id=5 where studentname ='abc';
select * from students123;
update students123 set student_id=101;
select * from students123;
-- alter table tablename add column course varchar(20)
alter table students123 add column course varchar(40);
select * from students123;
alter table students123 modify column course int;
alter table students123 rename column  address to course1;
alter table students123 drop column course123;
---------------- 23 september-----------------
---- constrains------
--- not null---
-- unique---
----- primary key--
--- default '2024-07-01' getdate()--
--- check(>=10)---
 -- foreign key---
 create database regex;
 use regex;
create table departments1(deptid int primary key, salary_date date default'2024-08-02', age int check(age>=18), departmentname varchar(40) not null, phonenumber int unique);
insert into departments values(12,'2024-08-05', 20,'radha',98677485);
insert into departments values(13,'2024-08-03', 18,'pooja',96588445);
insert into departments values(11,'2024-08-02', 20,'sita',8935264);
insert into departments values(10,'2024-08-01', 22,'priya',91234567);
insert into departments values(14,'2024-08-09', 28,'hema',74848484);
insert into departments values(45,'2024-08-08', 29,'ponam',9098765);
select * from departments;
select deptid from departments;

------------ 24 september---------------

