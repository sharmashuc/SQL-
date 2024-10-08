------------------------  subquery question  ------------------------------

create table employees(employee_id int , name varchar(60),salary int , department_id int);
insert into employees values(1,' John', 50000, 101),
(2, 'Jane' ,60000, 102),(3, 'Michael', 70000, 101),(4, 'Emily' ,55000 ,103),
(5 ,'Daniel' ,80000 ,101);

create table departmentss(department_id int ,department_name varchar(60));
insert into departmentss values(101 ,'HR'),(102, 'Sales'),(103, 'IT');

-----------  1 --------------------
SELECT * FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees);

-----------  2 -----------------------
SELECT department_id, COUNT(*) AS employeecount FROM employees GROUP BY department_id
ORDER BY employeecount DESC LIMIT 1;

----------- 3 ----------------------
SELECT * FROM employees
WHERE employee_id NOT IN (SELECT employee_id FROM employees WHERE department_id = 102);

----------- 4 ----------------------
SELECT DISTINCT department_id FROM employees WHERE department_id IN (SELECT department_id
FROM employees GROUP BY department_id HAVING COUNT(*) > 1 );

--------- 5 -------------------------
SELECT * FROM employees WHERE salary BETWEEN (SELECT AVG(salary) FROM employees) AND 
(SELECT MAX(salary) FROM employees);

select * from employees;
select * from departmentss;   
 




