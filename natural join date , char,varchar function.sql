use sakila;
create table emp(eid int, ename varchar(40), manager_id int);
insert into emp values(101,'aman',null),(102,'abhishek',101),(103,'naina',102),(104,'joly',103);

select * from emp;
---------- self join ---------------------
select emp.eid,emp.ename,manager.eid,manager.ename from emp join 
emp as manager on emp.manager_id=manager.eid;

select emp.eid,emp.ename,manager.eid,manager.ename from emp join 
emp as manager where emp.manager_id=manager.eid;

------ natural  joins ----------

select * from actor;
select * from film_actor;

use regex;
show tables;
select * from departments;
select * from departmentss;

select * from departments natural join departmentss;
create table p1( pid int, pname varchar(20));
insert into p1 values(10,"tv"), (11,"mobile"),(12,"laptop");

create table o1( oid int, price int, product_id int);
insert into o1 values(101,55,10), (102,66,11),
(103,77,15),(104,88,16);
insert into o1 values(105,99,10);
select * from o1;
select * from p1;
select * from p1 natural join o1;
select p1.pid,p1.pname,o1.oid,o1.product_id from p1 left join o1 on p1.pid =o1.product_id;

-------------- column name same hone pr inner nhii to croos join natural join m------------------
----- datatype) int (signed,unsigned)-----------------
create database regex1;
use regex1;
create table employee(eid int);
insert into employee values(245363737);
create table employee1(eid int unsigned);
insert into employee1 values(2147483648);

-------- types of int --------------------------
------------ (tinyint 1 , smallint 2, mediumint 3, int 4 , bigint 8 )
 ------ 1 byte ==> 8 2(8)
 ---- boolean ==> tiynint 
 --------- 2**8 ==> 256(unsigned) ==> -128 to 127 
 
create table employee2(id tinyint unsigned);
insert into employee2 values(255);
------- true ------------ false ----------------
insert into employee2 values(true);
select * from employee2;

------ string ---------
------ fix character data(char)
--------- varchar extra character jitna chayee utna space leta haii yhhh - -----------
--------- char -------------
create table ep3(name1 char(3));
insert into ep3 values("zzz");
select name1 , length(name1) from ep3;

----------- variable character ------------
create table ec(name1 varchar(3));
insert into ec values("xxx     ");
select name1 , length(name1) from ec;
select * from ec;

-------- date -------------
create table test(dob date);
insert into test values("2022-05-03"),("2021-05-01");
select * from test;





