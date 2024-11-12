-------------------------------------- views -----------------------------------------------
use sakila;
select * from actor;
create view actor_view as select last_name,actor_id,first_name from actor where actor_id between 2 and 6;
select last_name from actor_view;
show tables;

create table employee123(id int, name varchar(20), salary int);
insert into employee123 values(10,"abc",100),(20,"def",200),(30,"new",300); 
select * from employee123 ;

------ simple view ----- m dml operation chlaa sktee haiii   -----view m change hogaa to data m bhii changee hogaaa
create view emp_view as select id,name from employee123;
insert into emp_view values(40,"naina");

create table dept123(id int, deptname varchar(20));
insert into dept123 values(10,"HR"),(20,"Marketing"),(100,"oops"); 

select * from employee123;
select * from dept123;

---------- complex view--- ---- m dml operation nhii chlaa sktee only simple view m hi chlaa sktee haii chnge kr skte haii--------------
create view empjoin as select employee123.id,name,deptname from employee123 inner join dept123 using(id);
select * from empjoin;
insert into empjoin (id,name,deptname)values(60,"kilo","new");

------------- insert isliyeee hua kyukii usne departmentname ko assume kr liyaa or ek hi table se relate kr rhii haii isliyeee-----------------
insert into empjoin (deptname) values("ya");
insert into empjoin (id,name)values(60,"kilo");

select * from empjoin;
select * from dept123;

--------- replace view yhhh part haii view kaa se puranaa walaa ht jayegaa or nyaabn jayegaaa-----
create or replace view empjoin as select employee123.id,name,deptname from employee123 inner join dept123 using(id);

------- tablee ki copy bannaaa--- actor tablee kii

create table actor_c as select actor_id,first_name from actor where actor_id>10;
select * from actor_c;

------- check constraint vieww-----------------
create view actor_chk as select actor_id,first_name from actor_c where actor_id>50 with check option;

-------- yhhh isliyee isert hoga kyukii ismee condition ko satified kr rhaa haii
insert into actor_chk values(203,"abcd"); 
select * from actor_chk; 



