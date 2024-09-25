create database regex1234;
use regex1234;
create table products(productname varchar (40),id int);
insert into products values('oatmilk',1),('flakes',2),('tub',5),('patch',3),('eggs',4);

create table suppliers(id int,namesss varchar (30));
insert into suppliers values(1,'john'),(2,'anne'),(3,'robert'),(5,'tim');
select * from products;
select * from supplier;
update suppliers set namesss='robert'where id=3;
set sql_safe_updates=0;
update suppliers set id=6 where namesss='robert';
update suppliers set id=7 where namesss='tim';
select * from suppliers;
---- inner join ---
select products.productname,suppliers.namesss
from products inner join suppliers on products.id=suppliers.id;

select products.productname,suppliers.namesss from products left join suppliers on products.id=suppliers.id;
select products.productname,suppliers.namesss from products right join suppliers on products.id=suppliers.id;
select products.productname,suppliers.namesss from products cross join suppliers;
select products.productname,suppliers.namesss from products natural join suppliers;

select products.productname,suppliers.namesss from products left join suppliers on products.id=suppliers.id 
union select products.productname,suppliers.namesss from products right join suppliers on products.id=suppliers.id;

select a.productname, b.id from products a , products b where a.id = b.id;

