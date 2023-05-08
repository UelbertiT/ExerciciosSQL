-- 1 apresente a média de custo de reposição dos  filmes.

select avg (replacement_cost) 
from film;

-- 2 apresente o filme com o maior custo de reposição dos filmes.

select title,replacement_cost
from film
where replacement_cost = (select max (replacement_cost) from film) limit 1

-- 3 apresente o filme com o menor custo de reposição dos filmes.

select title,replacement_cost
from film
where replacement_cost = (select min (replacement_cost) from film) limit 1

-- 4 apresente uma consulta com o nome e sobrenome dos clientes que mais locaram filmes
--e o valor total gasto nas locações em ordem decrescente.

select customer
select c1.first_name || ' ' || c1.last_name, sum (p1.amount)
from customer c1
inner join payment p1 on p1.customer_id = c1.customer_id
group by c1.customer_id
order by sum (p1.customer_id)desc;

-- 5 Apresente uma consulta com o nome  dos filmes mais locados e a quantidade 
--de locação ocorrida em ordem decrescente.

