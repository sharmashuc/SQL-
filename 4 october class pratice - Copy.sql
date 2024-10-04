use regex;
use sakila;
show databases;      
show tables;     
show tables;
select * from employes;
select * from departments;
---------- 1 ---------------------------
create view employeesalary as select employee_id,employee_name ,salary from employes;
---------- 2 -----------------------------
create view employeedepartment as select employee_name , department_name from employes as e join departments as d on e.employee_id=d.department_id; 
------- 3 -------------------------
create view departmentaveragesalary  as select  Department_ID, AVG(Salary) AS AverageSalary
FROM Employes
GROUP BY Department_ID;
------- 4 ----------------
create view highearners as 
SELECT Employee_Name,Salary
FROM Employes WHERE Salary > 100000;

---------- 5 -----------------------
theory ---- update keyword update the view and change the schema of table
------------ 6 ----------------------
create view zxcv as SELECT  Employee_ID,Employee_Name, Salary
FROM Employes
WHERE Salary > 70000;
------------- 7 ---------------
---- drop view employes_name;
---------- 8 -----------------------
create table manager(managerid int ,managername varchar(40));
insert into manager values(1,'aman'),(2,'pooja'),(3,'neha');
create view employeedetails as
SELECT e.Employee_ID,e.Employee_Name,d.Department_Name,m.ManagerName
FROM Employes e
JOIN Departments d ON e.Department_ID = d.Department_ID
JOIN Manager m ON m.ManagerID = m.ManagerID;

-------- index ---------
create index idx_employee_name on employes(employes_name);

------- 2 ------------------
create index idx_employee_department on employes(employee_id,department_id);

-------------- 3 ----------------
create unique index idx_unique_employee_email on employes(employee_id);

--------- 4 ----------------
create index ty on employes(employee_id, employee_name);
select employee_id,employee_name from employes;
---- select query easily reterive the columns------

------  5 --------------
------ drop index idx_employee_name;

--------- 6 -------------
 --- no index can't created a view ---- 
--------- 7 --------------------
----- clustered ---
create clustered index rt on employes(employee_name);

--------- non clustred -----------
create nonclustered index zxc on employes(employee_name);

--- diffrence clustred and non clustred index ====> clusterd index define the order and sort the table and non clusterd index collects the data of table . 
------------- 8 --------------------
-------- A covering index is an index that contains all the data needed to answer a query, and improve your query. 

------- 9 -----------------
--- the more indexes you add, the slower your inserts and deletes will go, 
--------- and the more competition pages will have for precious memory space.     



