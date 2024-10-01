set sql_safe_updates=0;
use regex;
create table Customers(CustomerID int , CustomerName  varchar(40), Email varchar (60));
insert into customers values(1, 'John Doe', 'john@example.com'),(2, 'Jane Smith' ,'jane@example.com'),
(3, 'Alice Johnson', 'alice@example.com'),(4, 'Bob Brown', 'bob@example.com');
drop table orders;
create table Orders(OrderID int ,CustomerId int , OrderDate date , TotalAmount int , ShippingDate date );
insert into orders values(101, 1, '2023-09-01', 150.00, '2023-09-02'),
(102, 2, '2023-09-05', 200.00, NULL),
(103, 1, '2023-09-10', 75.00, '2023-09-12'),
(104, 3 ,'2023-09-15', 100.00, '2023-09-16');
create table Products(ProductID int  ,ProductName varchar (60), Price int ,  CategoryID int);
insert into products values(1, 'Laptop', 1000.00 ,1),
(2, 'Smartphone' ,500.00, 1),
(3, 'Desk Chair' ,150.00 ,2),
(4, 'Monitor', 300.00, 1);
create table Sales(SaleID int, ProductID int, SaleDate date, Quantity int);
insert into sales values(1, 1, '2023-09-05' ,2),
(2, 2 ,'2023-09-07', 5),
(3, 3 ,'2023-09-08', 10),
(4, 4, '2023-09-10' ,3);
create table Employees(EmployeeID  int ,EmployeeName varchar(60), Salary int , DepartmentId int ,managerid int);
insert into employees values(1, 'Sarah Connor', 70000, 1, NULL),
(2, 'Kyle Reese', 60000, 1 ,1),
(3, 'John Connor' ,80000 ,2, NULL),
(4, 'Linda Hamilton' ,55000, 2 ,3);
create table Departments(DepartmentId int , departmentname varchar(40));
insert into departments values(1 ,'IT'),(2,'hr');
create table ProductReviews(ProductID int ,  Rating int );
insert into ProductReviews values(1, 4.5),(2, 4.0),(3, NULL),(4, 5.0);
--------- 1 -----------
SELECT p.productname, SUM(price*s.quantity) AS total_amount
FROM products as p inner join sales as s on p.productid = s.productid
group by p.productname;
----------- 2 -----------------------
select d.departmentname ,avg(e.salary) as aggregate_salary
from departments  d inner join employees  e on d.departmentid = e.employeeid 
group by d.departmentname;
---------- 3 -----------------
select COUNT(*) AS UnshippedOrderCount
FROM Orders
WHERE ShippingDate IS NULL;
----------- 4 ----------------------- 
select CategoryID, MIN(Price) AS MinPrice
FROM Products
group by categoryid;
------- 5 --------------
select employeeid,employeename,salary 
from employees order by salary desc
limit 5;
----------- 6--------------
SELECT COUNT(CustomerID) AS TotalCustomers, AVG(totalamount) AS AverageOrderValue 
FROM Orders;

------------ 7 -----------------
SELECT ProductID, YEAR(SaleDate) AS SaleYear, SUM(productid) AS TotalSales 
FROM Sales 
GROUP BY ProductID, SaleYear;
------------- 8 ------------------
SELECT DepartmentID, DepartmentName 
FROM Departments 
WHERE departmentname > 5;
---------- 9 ----------------
SELECT AVG(Rating) AS AverageRating 
FROM ProductReviews 
WHERE Rating IS NOT NULL;
------------ 10-------------------
SELECT DepartmentID, AVG(Salary) AS AverageSalary 
FROM Employees 
GROUP BY DepartmentID 
ORDER BY AverageSalary DESC LIMIT 1;




