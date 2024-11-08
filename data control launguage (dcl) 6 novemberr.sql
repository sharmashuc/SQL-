------------------ DCL -------------- DATA CONTROL LAUNGUAGE ---------------------
----- permission  (previleges)
--- new object,s owner the owner usually has the ability to modify objects it owns and grant other users acess to them. 
--- privileges 
--- username ------- user  (password)
create user bob1 identified by 'bob1';
--- user dehnee k liyee 
select current_user();

-------- user information dehnee k liyee
select * from mysql.user;
------- user information m kisi specific table dekhnee k liyeeee-----------------
select * from mysql.user where user='bob1';
------- user drop krnee k liyeee
drop  user 'bob1';

--------- sakila database m tablee bnayiiii  bob user acess k liyee  --------
create table sakila.test(id int);
insert into sakila.test values(10),(20);

select * from sakila.test;

grant all privileges on sakila.test to bob1;
select * from mysql.user;
----- grants dekhneee k liyeee-------
show grants for 'bob1';

------- flush privileges  modify kr de user koo  ------------
flush privileges;

------- privileges htane k liyeee---------

revoke all privileges on sakila.test from bob1;

select * from sakila.staff;
--------- specially ek column ki permission dene k liyeee---------
grant select (staff_id,first_name) on sakila.staff to bob1;

------ password changeee krnaa bob se regex  ------------
alter user 'bob1' identified by 'regex';

------ setting password ----

set password = 'new password';

---------- locking user --------
alter user 'bob1' account lock;

-------- unlock user -----------
alter user 'bob1' account unlock;

------- create role  group ko permission deene k  liyeee ek sath ----------------
create role sales1;
grant select on sakila.* to sales1;

create user "aman9" identified by "aman9";
show grants for "aman9";

---------- grant role to user -------
grant sales1 to aman9;
flush privileges;

----------- to check the role----------
select current_role();

--- row number -- dense rank ------ rank----
---- Q  ------- window function how diffrent from aggregrate function ----------------- select sare column , insert name , email m update ko------
---- assigning role to user konsa role use krnaa agr jyada role haii to  ------------
set default role all to aman9;
----------------- q ----------
create table sakila.e2(id int, name varchar(40),email varchar(60));
insert into sakila.e2 values(10,'aman','12@gmail.com'),(20,'ashish','34@gmail.com'),(30,'neha','56@gmail.com');

select * from sakila.e2;

create user abhinav identified by 'shuchi';
grant select (id ,name,email ) on sakila.e2 to abhinav;
grant insert (name) on sakila.e2 to abhinav;
grant update (email) on sakila.e2 to abhinav;   