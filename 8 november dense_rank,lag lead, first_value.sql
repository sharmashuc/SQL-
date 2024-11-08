use sakila;
select * from employees;

select id, dept,salary ,rank() over(partition by dept order by salary desc) from employees;

--------- dense rankkk --------------------
select id, dept,salary ,dense_rank() over(partition by dept order by salary desc) from employees;
select id, dept,salary ,rank() over(partition by dept order by salary desc),dense_rank() over(partition by dept order by salary desc) from employees;

---------- first_value sbke sath generate hogiiii------------
select id,dept,salary,first_value(id) over(partition by dept) from employees;
select id,dept,salary,first_value(id) over(order by salary) from employees;

------------ lead()----------------
select id,dept,salary,lead(salary,1) over() from employees;
select id,dept,salary,lead(salary,1) over(partition by dept) from employees;

--------- lag() function -------------------
select id,dept,salary,lag(salary,1) over() from employees;
select id,dept,salary,lag(salary,1) over(partition by dept) from employees;
select id,dept,salary,lag(salary,1) over(partition by dept,salary) from employees;
select id,dept,salary,lag(salary,2) over(partition by dept) from employees;

--------- date diff--------
select datediff(adddate,now(),2),now() from dual; 
