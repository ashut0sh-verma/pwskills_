use mavenmovies;

-- 1 solution --
select count(rental_id) from rental;

-- 2 solution --
select avg(rental_duration) from film;

-- 3 solution --
select* from customer;
select upper(concat(first_name, " " , last_name)) from customer;
select upper(first_name), upper(last_name) from customer;

-- 4 solution --
select * from rental;
select rental_id , month(rental_date) from rental;
select rental_id , monthname(rental_date) from rental;

-- 5 solution --
select * from rental;
select customer_id , count(rental_id) from rental group by customer_id order by count(rental_id) desc;

-- 6 solution -- can't find revenue in any table
select * from payment;
select customer_id  , sum(amount) from payment group by customer_id;


-- 7 solution --
select * from film;
select * from customer;
select * from rental;
select * from inventory;

select title , concat(first_name , ' ', last_name) as name from film inner join inventory on film.film_id = inventory.film_id
inner join rental on inventory.inventory_id = rental.inventory_id
inner join customer on rental.customer_id = customer.customer_id ;


-- 8 solution ( can't find name "gone with the wind')
select * from film_actor;
select * from film ;
select * from actor;

select concat(first_name, ' ' , last_name) as name , title from actor inner join film_actor on actor.actor_id = film_actor.actor_id
inner join film on film.film_id = film_actor.film_id where title = 'gone trouble';


-- group by --
-- queston 1
select * from film_category;
select * from rental;
select * from film;
select * from category;
select * from inventory;

select name , count(rental_id) as count from film inner join film_category on film.film_id = film_category.film_id
 inner join category on category.category_id = film_category.category_id
 inner join inventory on film.film_id = inventory.film_id
 inner join rental on inventory.inventory_id = rental.inventory_id group by name order by count desc;
 
 -- 2 solution --
 
 select * from film;
 select name , avg(rental_rate)  from film inner join language 
 on  film.language_id = language.language_id group by  name;


-- 3 solution --

select * from customer;
select * from payment;
select * from rental;

select concat(first_name, ' ', last_name) as name , sum(amount) from customer inner join rental 
on customer.customer_id = rental.customer_id 
inner join payment on customer.customer_id = payment.customer_id 
group by name order by  sum(amount) desc;


-- 4 solution --\

select * from customer;
select * from city;
select * from inventory;
select * from address;
select * from rental;
select * from film;

select title, concat(first_name, ' ', last_name) as name , city from customer inner join address
on customer.address_id = address.address_id
inner join city on city.city_id = address.city_id
inner join inventory on customer.store_id = inventory.store_id 
inner join film on inventory.film_id = film.film_id where city = 'london';


-- 5 solution -- 

select * from film;
select * from inventory;
select * from rental;

select title , count(rental_id) from film inner join inventory
on film.film_id = inventory.film_id
inner join rental on 
rental.inventory_id = inventory.inventory_id group by title order by title desc limit 5;

-- 6 solution --

select * from customer;
select * from inventory;
select * from rental;


select * from customer 
inner join  rental
on rental.customer_id = customer.customer_id 
inner join inventory 
on rental.inventory_id = inventory.inventory_id ; -- ( please explain this one)