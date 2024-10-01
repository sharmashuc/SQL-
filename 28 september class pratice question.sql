use regex;
drop table order_items;
create table categories(category_id int , category_name varchar(40));
insert into categories values(1,' Electronics'),(2,' Clothing'),(3, 'HomeHome &amp
Kitchen'), (4,' Books'),(5 ,'Sports');
create table productss(product_id int ,product_name varchar(40),category_id int , price int);
insert into productss values(1 ,'Laptop ',1, 1200),
(2,' Smartphone ',1 ,800),
(3, 'T-shirt ',2, 25),
(4 ,'Blender' ,3 ,150),
(5 ,'Novel', 4, 15),
(6 ,'Soccer Ball' ,5 ,30),
(7,' Headphones', 1 ,100),
(8, 'Jacket', 2 ,60),
(9 ,'Coffee Maker', 3 ,80),
(10, 'Cookbook' ,4, 25);
create table customers(customer_id int ,customer_name varchar (50), referrer_id int);
insert into customers values(1 ,'Alice',' 5'),
(2 ,'Bob' ,1),
(3 ,'Charlie' ,1),(4, 'David', 4),
(5 ,'Eva', 2);
create table orderstable(order_id int , customer_id int ,  order_date date);
insert into orderstable values(1, 1,'2023-01-01'),(2, 1,'2023-01-02'),(3, 2,'2023-01-03'),(4 ,3, '2023-01-04'),
(5, 2 ,'2023-01-05'),
(6 ,4 ,'2023-01-06');
create table order_items(order_item_id int , order_id int , product_id int,quantity int);
insert into order_items values(1, 1, 1 ,1),
(2, 1 ,2 ,2),
(3 ,2 ,3 ,1),(4, 3, 4, 1),
(5, 4, 5 ,1),
(6, 5, 6, 2),
(7, 6, 7, 1),
(8 ,1, 8 ,1);
-- 1 ------
SELECT p.product_id, p.product_name, c.category_name
FROM productss p INNER JOIN categories c ON p.category_id = c.category_id;
-- 2 -------------
SELECT c.category_name, p.product_name
FROM categories c
LEFT JOIN productss p ON c.category_id = p.category_id;
----- 3 -------------------
SELECT c1.customer_name AS Customer, c2.customer_name AS Referrer
FROM customers c1
LEFT JOIN customers c2 ON c1.referrer_id = c2.customer_id;

----------------- 4 -------------
SELECT c.customer_name
FROM customers c
LEFT JOIN orderstable o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;
----------- 5 ----------------------
SELECT p.product_name, c.category_name
FROM productss p
INNER JOIN categories c ON p.category_id = c.category_id
ORDER BY c.category_name;
------------ 6 -------------
select c.category_name , count(p.price) as product_count 
from categories c inner join productss p on c.category_id = p.category_id 
group by c.category_name;
---------- 7-------------
select c.category_name from categories as c left join productss p on c.category_id=p.category_id 
where p.product_id is null;
----------- 8 ----------------
select c.category_id , max(product_id) from categories
as c inner join productss p on c.category_id=p.category_id
group by pc.category_name;
-------------- 9----------------
SELECT o.order_id, COUNT(oi.product_id) AS item_count
FROM orderstable o
LEFT JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY o.order_id;
------ 10 -----------------
SELECT oi.product_id, COUNT(oi.order_id) AS order_count
FROM order_items oi
GROUP BY oi.product_id
HAVING COUNT(oi.order_id)> 5;
----- 11--------------------
SELECT p.product_name
FROM productss p
INNER JOIN categories c ON p.category_id = c.category_id
WHERE c.category_name = 'electronics';
----- 12 ------------
SELECT c.category_name, AVG(p.price) AS average_price
FROM categories c
INNER JOIN products p ON c.category_id = p.category_id
GROUP BY c.category_name;
------ 13--------------
SELECT c.customer_name, o.order_id
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;
---------- 14 ------------
SELECT c.customer_name
FROM customers c
LEFT JOIN customers ref ON c.customer_id = ref.referrer_id
WHERE ref.referrer_id IS NULL;
-------- 15---------------
SELECT c.category_name, COUNT(p.product_id) AS total_products
FROM categories c
INNER JOIN products p ON c.category_id = p.category_id
GROUP BY c.category_name;
--------- 16------------
SELECT c.category_name, SUM(oi.quantity * p.price) AS total_sales
FROM categories c
INNER JOIN products p ON c.category_id = p.category_id
INNER JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY c.category_name;
--------- 17 -------------
SELECT c.category_name
FROM categories c
INNER JOIN products p ON c.category_id = p.category_id
GROUP BY c.category_name
HAVING COUNT(p.product_id) > 3;
------------- 18 ---------------------
SELECT p.product_name, c.category_name, p.price
FROM products p
INNER JOIN categories c ON p.category_id = c.category_id
ORDER BY c.category_name, p.price ASC;
------------- 19 ---------------------------
SELECT c.category_name, MAX(p.price) AS highest_price
FROM categories c
INNER JOIN products p ON c.category_id = p.category_id
GROUP BY c.category_name
ORDER BY highest_price DESC
LIMIT 1;
-------- 20 -----------------------------
SELECT c.customer_name, COUNT(o.order_id) AS order_count
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name
HAVING COUNT(o.order_id) >5;