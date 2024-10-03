use regex;
show tables;
---- index ---------------
--- retrivel easy 
--- types
--- single column
---- multi column index 
------ full text index 
--------- unique index 
-------- clustered index 
------------- non clustered index 
select * from products;
---- single ---
create index easy on products(productid);
----- multi------
create index xyz on products(productname , price);

create index qwer on products(categoryid);
----------- full text -------
create fulltext index empt on products(categoryid);
--------- unique -----------
create unique index uiot on products(productname);
-------- clustered 
create clustered index rt on products(productname);
--------- non clustered 
create nonclustered index zxc on products(productid);
------- index ko dekhna --------------
select productid from products;

----- views --------
create view employee as select productid ,productname from products;

-------- retreive ------------------- 
select productid from employee;

-------- shortcut 
--------- simplification 
---------- restrictting accesss 
--------------- easy to understand

-------- drop ----------
drop view employee;


