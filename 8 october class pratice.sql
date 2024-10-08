----- Sub query or nested query

---- Single value
---- Single row
---- -Single column
------ Multiple columns and rows(table or part of table)

------ -------Single row subquery
------ Select name from employees where id in (Select * from employees where id=12)

---- Single column subquery
--------- Select id from employees where name in (Select employee_name from employees wheresalary&gt;80000)

----- Single value subquery
Select name from employees where salary&gt;(select avg(salary) from employees)

-- Multi rows and column subquery
------------ Select address from employees where name not in (Select employee_name, employee_salaryfrom employees where salary&gt;60000)

use regex;
show tables;
create table employees(employee_id int , name varchar(60),salary int , department_id int);
insert into employees values(1,' John', 50000, 101),
(2, 'Jane' ,60000, 102),(3, 'Michael', 70000, 101),(4, 'Emily' ,55000 ,103),
(5 ,'Daniel' ,80000 ,101);

create table departmentss(department_id int ,department_name varchar(60));
insert into departmentss values(101 ,'HR'),(102, 'Sales'),(103, 'IT');

------ 1 -------------
SELECT name, salary FROM Employees
WHERE salary> (SELECT AVG(salary) FROM Employees);

--------- 2 ---------------
SELECT name FROM Employees e
WHERE EXISTS (SELECT 1 FROM Employees WHERE department_id = e.department_id AND salary >60000);

-------- 3 --------------- 
SELECT name FROM Employees
WHERE department_id IN (SELECT department_id FROM Departments WHERE department_id IN(101, 102));

--------- 4 -------------
SELECT e.name, e.salary,(SELECT AVG(salary) from Employees WHERE department_id = e.department_id) AS avg_department_salary
FROM Employees e;

--------- 5 --------------
SELECT e.name AS employee_name, d.department_name as department_name FROM Employees e
JOIN Departments d ON e.department_id = d.department_id
WHERE e.salary > (SELECT AVG(salary) FROM Employees WHERE department_id = e.department_id);

