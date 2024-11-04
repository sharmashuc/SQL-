--------- constrains ------------  rules and regulation 
------- remove / avoid unwanted data
use regex;
create table t1(id int );
insert into t1 values(10);
insert into t1 values(null);
select * from t1;

create table t2(id int not null);
insert into t2 values(10);
insert into t2 values(20);
select * from t2;

create table t5(id int check(id>=10) );
insert into t5 values(10);
insert into t5 values(null);
select * from t5;



create table t3(id int unique);
insert into t3 values(10);
insert into t3 values(null);
select * from t3;

create table t4(id int default 10 );
insert into t4 values(10);
insert into t4 values(null);
select * from t4;

create table t7(id int primary key );
insert into t7 values(10);
insert into t7 values(50);
select * from t7;