use regex ;
show tables;
drop table orderdetails;
create table customers(CustomerID int ,Name varchar(40),Email varchar(80)
,City varchar(60),TotalSpending int);
insert into customers values(1,'Alice', 'alice@example.com', 'New York',15000),(2,'Bob', 'bob@example.com' ,'LosAngeles',20000),
(3,'Charlie', 'charlie@example.com', 'Chicago',50000),(4,'David', 'david@example.com', 'Miami',40000);

create table Orders(OrderID int ,CustomerId int , OrderDate date , TotalAmount int);
insert into orders values(101, 1, '2023-09-01', 150.00),
(102, 2, '2023-09-05', 200.00),
(103, 1, '2023-09-10', 75.00),
(104, 3 ,'2023-09-15', 100.00);

create table Products(ProductID int,ProductName varchar (60), Price int ,  CategoryID int);
insert into products values(1, 'Laptop', 1000.00 ,1),
(2, 'Smartphone' ,500.00, 1),
(3, 'Desk Chair' ,150.00 ,2),
(4, 'Monitor', 300.00, 1);

create table orderdetails(OrderDetailID int ,OrderID int ,ProductID int ,Quantity int);
insert into orderdetails values( 101 , 800, 50, 2),(102,801,51,3),(103,802,52,4),(104,803,53,5);

create table sales(SaleID int,  ProductID int ,OrderId int , SaleDate date, SaleAmount int);
insert into sales values(1,500,800,'2023-09-05', 8000),(2,501,801,'2023-09-07',9000),(3,502,802,'2023-09-08',10000);

------ 1 -----------------------
SELECT c.customerid, c.name, COUNT(o.orderid) AS total_orders
FROM customers c
LEFT JOIN orders o ON c.customerid = o.customerid
GROUP BY c.customerid, c.name;

---------- 2 ------------------------
SELECT AVG(totalamount) AS average_order_value
FROM orders
WHERE totalamount IS NOT NULL;

---------- 3 -----------------
SELECT saleid, SUM(saleamount) AS total_sales
FROM sales
GROUP BY saleid;
------------- 4 --------------------
SELECT customerid, SUM(totalamount) AS totalspending
FROM orders
GROUP BY customerid
ORDER BY totalspending DESC
LIMIT 5;

--------- 6 ----------------------
SELECT AVG(totalamount) AS averagequantityperorder
FROM orders;
----------- 7 ---------------------------
SELECT AVG(totalamount) AS order_value
FROM orders
WHERE totalamount IS NOT NULL;
----------- 8 ----------------------
SELECT orderid, SUM(totalamount) AS quantity_sold
FROM orders
GROUP BY orderid
ORDER BY quantity_sold DESC;
------------- 11 ----------------
SELECT CustomerId, COUNT(OrderID) AS order_count
FROM Orders
GROUP BY CustomerId
ORDER BY order_count DESC;  
--------------- 12 -----------------------------
SELECT CustomerId, SUM(TotalAmount) AS totalspending,AVG(TotalAmount) AS averagespending
FROM Orders
GROUP BY CustomerId
ORDER BY totalspending DESC; 
--------------- 13 -------------------
SELECT orderid, COUNT(*) AS order_count
FROM orders
GROUP BY orderid
HAVING COUNT(*) > 10;

----------- 14 ---------------------
SELECT SUM(TotalAmount) AS total_salesdiscount
FROM Orders
WHERE orderid > 0; 
------------ 15 -----------------------
SELECT COUNT(*) AS total_orders
FROM Orders;

--------------- 17 -------------------------
SELECT c.customerid, c.name
FROM customers c
LEFT JOIN orders o ON c.customerid = o.customerid AND o.orderdate >= '2022-10-01'
WHERE o.orderid IS NULL;
------------- 18 ----------------------------
SELECT p.productid, p.productname,SUM(oi.quantity) AS total_quantity_sold
FROM products p
JOIN orderdetails oi ON p.productid = oi.productid
GROUP BY p.productid, p.productname
HAVING SUM(oi.quantity) < (SELECT AVG(quantity) FROM orderdetails);

------------------- 19 ----------------------------------
SELECT orderId, SUM(TotalAmount) AS total_sales
FROM Orders
GROUP BY orderid
HAVING SUM(TotalAmount) > 1000 
ORDER BY total_sales DESC; 
----------------- 20 --------------------
SELECT SUM(totalamount) AS total_order_amount,AVG(totalamount) AS average_order_amount
FROM orders
WHERE totalamount IS NOT NULL;

---------------------------------------------------------------------------------  

