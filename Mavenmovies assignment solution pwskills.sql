use mavenmovies;

-- 1 solution--
-- primary key shows unique data in any table and foriegn key links two diffrent tables--



-- 2 solution--
select * from actor;

-- 3 solituion--
select * FROM customer;

-- 4 solution --
select country from country;

-- 5 solution --
select * from customer;
select customer_id , first_name , last_name , email from customer where active=1;

-- 6 solution --
select * from rental;
select rental_id from rental where customer_id = 1;

-- 7 solution --
select * from film;	
select title from film where rental_duration > 5;

-- 8 solution --
select count(*) from film where replacement_cost between 15 and 20;

-- 9 solution --
select * from  actor;
select count(distinct first_name) from actor ;

--  10 solution --
select * from customer limit 10;

-- 11 solution --
select * from customer where first_name like "b%" limit 3;

-- 12 solution --
select * from film;
select title from film where rating = 'G' limit 5;

-- 13 solution --
select * from customer where first_name like 'a%';

-- 14 solution --
select * from customer where first_name like 'a%';

-- 15 solution --
select * from city where city like 'a%a' limit 4;

-- 16 solution --
select * from customer where first_name like '%NI%';

-- 17 solution --
select * from customer where first_name like '_r%';

-- 18 solution --
select * from customer where first_name like 'a____%';

-- 19 solution --
select * from customer where first_name like 'a%o';

-- 20 solution --
select * from film where rating in ('PG' , 'PG-13');

-- 21 solution --
select * from film where length between 50 and 100;

-- 22 solution --
select * from actor limit 50;

-- 23 solution --
select distinct film_id from inventory;