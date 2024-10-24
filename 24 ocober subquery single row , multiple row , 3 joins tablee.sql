use sakila;
select * from actor;
select * from film_actor;
select * from film;
select a.actor_id, a.first_name,f.film_id,film.title from actor a inner join film_actor f on a.actor_id=f.actor_id inner join film on f.film_id=film.film_id;

-------- subquery --------------
----- single roe subquery -------------- m =, <,> 
select * from payment where amount=(select amount from payment where payment_id=8);
select payment_id, amount from payment where payment_id=3;
select * from payment where payment_id=(select payment_id from payment where payment_id=3);
select * from payment;
  --- question  i need to get all the column name along with 10% high in the amount only for those user where the month of payment date should be same as date of payment id 13
select * ,amount+10 from payment where payment_id=(select month(payment_date) from payment where payment_id=13);

select * from payment;
select amount,payment_id from payment where amount=(select avg(amount)from payment);

--- question  get the customer id the total amount spend by each customer only for those customer where the number of payment 
------- for the customer should be greater than the number of payments done by the customer id=3

select * from payment;
select * from payment where payment_id =(select count(*) from payment where customer_id=3 group by customer_id);------- yhh maine kiya thaa
select customer_id , sum(amount),count(*)from payment group by customer_id  having count(*)> (select count(*) from payment where customer_id=3 );
select amount from payment where payment_id in(2,3);
-------- multirow subquery ----- in, any , or , =any or in operatar return same values 
select * from payment where amount in(select amount from payment where payment_id in (2,3));
select * from payment where amount =any (select amount from payment where payment_id in (2,3));
select * from payment where amount < any(select amount from payment where payment_id in (2,3));
select * from payment where amount in(select amount from payment where payment_id in (2,3));
select * from payment where amount <all(select amount from payment where payment_id in (2,3));
select * from payment where amount >all(select amount from payment where payment_id in (2,3));
select * from payment where amount <=all(select amount from payment where payment_id in (2,3));
select * from payment where amount >=all(select amount from payment where payment_id in (2,3));

-------- corerealted subquery padhnanna haii 
---- A correlated subquery is a subquery that refers to a column of a table that is not in its FROM clause. The column can be in the Projection clause or in the WHERE clause. In general, correlated subqueries diminish performance.




 