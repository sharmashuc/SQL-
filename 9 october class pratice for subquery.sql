use regex;
show tables;
select * from employees;
select * from departments;
--------- 1 ----------------------
select name ,salary from employees where salary >(select avg(salary) from employees);

--------- 2 --------------------
select name from employees where department_id in(select department_id from employees group by department_id having count(*) > 1 );
------------ 3 ----------------------
select department_id ,avg (salary) as average_salary from employees group by department_id;
-------- 4 ----------------
select name from employees  where salary > (select max(salary) from employees as e join departments as d on e.department_id=d.department_id);

--------- 5 --------------------
select department_id from employees as e where salary > (select avg(salary)from 
employees where department_id = e.department_id)group by department_id having count(*) >3;

-------------- 6 --------------
select name from employees where department_id=(select department_id from employees where department_id =5);
-------- 7 ---------------- 
select e.name ,e.salary, d.max_salary from employees as e join (select department_id,max(salary) as max_salary from employees group by department_id) d on e.department_id = d.department_id;
-------- 8 -------------------
select e.name from employees as e where department_id in (select department_id from employees group by department_id having count(*) > 5);
----------- 9 ------------------
select * FROM employees WHERE department_id NOT IN (SELECT department_id FROM employees
WHERE salary > 80000);

---------- 10 --------------
select e.* FROM employees e JOIN (SELECT department_id, AVG(salary) AS avg_salary FROM employees
GROUP BY department_id HAVING COUNT(*) > 2
) AS avg_dept ON e.department_id = avg_dept.department_id WHERE e.salary > avg_dept.avg_salary;

