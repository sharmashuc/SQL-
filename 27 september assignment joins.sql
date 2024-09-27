show databases;
use regex;
create table Employes(employee_id int , employee_name varchar(40),department_id int , manager_id int ,title varchar(30),salary int);
insert into employes values(1 ,'Alice', 1 ,'2',' Manager', 90000),(2 ,'Bob' ,1, 1, 'Developer' ,70000),
(3, 'Charlie' ,2, 1 ,'Developer' ,75000),(4 ,'David ',2, 1 ,'Developer ',65000),(5 ,'Eve', 3, '9' ,'Manager', 95000),
(6 ,'Frank' ,3, 5 ,'Developer', 60000),(7 ,'Grace ','4', '6', 'Intern', 40000);

create table Departments(department_id int , department_name varchar(40));
insert into departments values(1 ,'Sales'),(2,'Engineering'),(3,'Marketing'),(4,'HR');

create table Projects(project_id int , project_name varchar(50));
insert into projects values(1 ,'Project Alpha'),(2,'Project Beta'),(3,'ProjectGamma');

create table ProjectAssignments(assignment_id int , employee_id int , project_id int );
insert into projectassignments values(1, 2 ,1),(2, 3 ,1),(3 ,4 ,2),(4, 5 ,3),(5 ,6 ,3);
------ 1-------------
select e.employee_id,e.employee_name,d.department_name from employes e inner join departments d on e.department_id=d.department_id;
----------- 2---------------
select d.department_name,e.employee_name from departments d left join employes e on d.department_id=e.department_id;
-------- 3 ------------
select e.employee_name,d.department_name from employes e left join departments d on 
e.department_id=d.department_id union select e.employee_name,d.department_name from employes e
 right join departments d on e.department_id=d.department_id;
 ------- 4---------------
 SELECT e1.employee_name AS Employee, e2.employee_name AS Manager
FROM employes e1
LEFT JOIN employes e2 ON e1.manager_id = e2.employee_id;
---- 5 --------------
select d.department_name,count(e.employee_id) as employee_count from departments d inner join
employes e on d.department_id=e.department_id group by d.department_name; 
 ------- 6 --------------
 SELECT e.employee_name
FROM employes e
LEFT JOIN projectassignments pa ON e.employee_id = pa.employee_id
WHERE pa.project_id IS NULL;
------ 7 ----------------
SELECT e.employee_name, d.department_name
FROM employes e
INNER JOIN departments d ON e.department_id = d.department_id
ORDER BY d.department_name;
---------- 8 --------------
SELECT d.department_name
FROM departments d
LEFT JOIN employes e ON d.department_id = e.department_id
WHERE e.employee_id IS NULL;
----------- 9 -------------------
SELECT p.project_name, COUNT(pa.employee_id) AS employee_count
FROM projects p
LEFT JOIN projectassignments pa ON p.project_id = pa.project_id
GROUP BY p.project_name;
--------- 10 --------------------
SELECT e1.employee_name AS Employee1, e2.employee_name AS Employee2, e1.manager_id
FROM employes e1
JOIN employes e2 ON e1.manager_id = e2.manager_id
WHERE e1.employee_id <> e2.employee_id;
------------ 11 ------------------
SELECT d.department_name, MAX(e.salary) AS highest_salary
FROM departments d
INNER JOIN employes e ON d.department_id = e.department_id
GROUP BY d.department_name;
------------- 12 -------------------
SELECT e.employee_name
FROM employes e
INNER JOIN departments d ON e.department_id = d.department_id
WHERE d.department_name ='sales';
----------------- 13 -----------------------
SELECT e.employee_name, p.project_name
FROM employes e
LEFT JOIN projectassignments pa ON e.employee_id = pa.employee_id
LEFT JOIN projects p ON pa.project_id = p.project_id;
------------ 14 ----------------------
SELECT p.project_name
FROM projects p
JOIN projectassignments pa ON p.project_id = pa.project_id
GROUP BY p.project_name
HAVING COUNT(pa.employee_id)>2;
-------------------- 15 ---------------- 
SELECT e.employee_name, d.department_name
FROM employes e
INNER JOIN departments d ON e.department_id = d.department_id
WHERE e.title = 'manager';
---------------- 16------------------
SELECT e.employee_name
FROM employes e
LEFT JOIN employes m ON e.manager_id = m.employee_id
WHERE m.employee_id IS null;
-------------- 17 -------------------
SELECT e.employee_name, COUNT(pa.project_id) AS total_projects
FROM employes e
INNER JOIN projectassignments pa ON e.employee_id = pa.employee_id
GROUP BY e.employee_name;
------------------ 18 ----------------
SELECT d.department_name
FROM departments d
JOIN employes e ON d.departmen]t_id = e.department_id
GROUP BY d.department_name
HAVING COUNT(e.employee_id) >5;
------------- 19 --------------- 
SELECT e.employee_id, e.employee_name, d.department_name
FROM employes e
INNER JOIN departments d ON e.department_id = d.department_id;