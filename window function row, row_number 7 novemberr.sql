-------- window function -----------
use sakila;

select * from payment;
select count(amount) from payment;
select payment_id,amount,customer_id,(select count(amount) from payment) from payment;
select payment_id,amount,customer_id,16044 from payment;

------- over window function m lagegaaa hr row k sathh repeate hogiii valuee--

select payment_id,customer_id,count(amount) over() from payment;
select payment_id ,customer_id ,count(amount) over(),max(amount) over() from payment;
select max(amount) from payment;

------- partition byy -------------------
select payment_id ,customer_id ,count(amount) over(partition by customer_id),count(amount) over() from payment;

select count(*) from payment where customer_id=1;

-------- tablee createe -----------
show tables;
drop table employees;
create table employees(id int primary key auto_increment,
dept varchar(20), salary int);

insert into employees(dept, salary) values("hr",200),
("hr",300),("hr",100),
("marketing",70),("marketing",50),
("marketing",200),("marketing",400),
("dsa",150),("dsa",120),
("dsa",40),("dsa",90),("dsa",500);
select * from employees;

select id, dept , salary ,avg(salary) over() from employees;

-------- running avg , running sum value badh rhii haii wassay wassay total hotaaa jataa haiii---------------
select id , dept, salary , avg(salary) over(partition by dept order by salary) from employees;
select id , dept, salary , sum(salary) over(partition by dept order by salary) from employees;

select id , dept, salary , min(salary) over(partition by dept order by salary) from employees;
select id , dept, salary , sum(salary) over(partition by dept ) from employees order by salary;

---------- window function called analytical function same haiii-------------
-------------- row_number hmeshaa unique value 1,2,3,4,5,6,7,8,9 -----------
select id, salary,dept, row_number() over(partition by dept) from employees;

---------- rank compare krtaa haii but unique hi valuee detaa haii or skip krdetaa haiii or next pr chlaa jata haii --------------------
select id, salary,dept, rank() over(partition by dept order by salary) from employees;

insert into employees values(99,'dsa',120);




