-- quantos filmes de comedia  exeistem? só o valor!
select count (*)
  from film f1
  inner join film_category fc1 on fc1.film_id = f1.film_id
  inner join category c1 on c1.category_id = fc1.category_id
 where c1.category_id = 5;
-- quantos filmes de comedia  exeistem? com os nomes dos filmes!
select f1.title 
  from film f1
  inner join film_category fc1 on fc1.film_id = f1.film_id
  inner join category c1 on c1.category_id = fc1.category_id
 where c1.category_id = 5;
 
 -- quantos filmes de ação  exeistem? só o valor!
 select count (*)
  from film f2
  inner join film_category fc2 on fc2.film_id = f2.film_id
  inner join category c2 on c2.category_id = fc2.category_id
 where c2.category_id = 1;
 -- quantos filmes de ação  exeistem? com os nomes dos filmes!
  select f2.title 
  from film f2
  inner join film_category fc2 on fc2.film_id = f2.film_id
  inner join category c2 on c2.category_id = fc2.category_id
 where c2.category_id = 1;
 
 select *
 from customer
 --quantos a cliente sarah gastou ? com o nome aparecendo!
select *
 from customer c1
 inner join payment p1 on c1.customer_id = p1.customer_id
 where c1.customer_id = 23;
 --quantos a cliente sarah gastou ? so o valor gasto!
 select sum (p1.amount)
 from customer c1
 inner join payment p1 on c1.customer_id = p1.customer_id
 where c1.customer_id = 23;
 
--quantos filmes existem de cada ator?
select fa1.actor_id, a1.first_name || ' ' || a1.last_name, count(*)
from film_actor fa1
inner join  actor a1 on a1.actor_id = fa1.actor_id
group by fa1.actor_id, a1.first_name || ' ' || a1.last_name