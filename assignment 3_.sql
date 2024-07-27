use mavenmovies;


-- que 1 -- 
select customer_id , sum(amount) as tot_amt , 
rank() over(order by sum(amount) desc) as ranking 
from payment group by customer_id;


-- que 2 -- 
select * from film;
select * from payment;
select * from rental;

select f.film_id , title , payment_date , sum(amount) over(partition by f.film_id order by payment_date) as cumu_revenue
from payment as p
join rental r on p.rental_id = r.rental_id
join inventory i on r.inventory_id = i.inventory_id
join film as f on f.film_id = i.film_id 
order by f.film_id , payment_date;

-- que 3 --

select * from film;

select title , avg(rental_duration) over (partition by title order by length) as avg_ren_duration , length
from film  group by title , rental_duration , length order by length desc;




-- que 4 --
select * from film_category;
select * from rental;
select * from inventory;
select * from category;

with table_1 as ( 
select f.title , count(rental_id) as rental_count , name , 
rank() over(partition by name order by count(rental_id) desc ) as ranking 
from film as f 
left join inventory as i on i.film_id = f.film_id
left join rental as r on r.inventory_id = i.inventory_id 
left join film_category as fc on fc.film_id = f.film_id
left join category as cat on cat.category_id = fc.category_id
 group by title , name order by name , count(rental_id)desc
 ),
 
 table2 as (
 select title , rental_count , name , ranking from table_1 where ranking <= 3 
 )
 select * from table2 ;
 
 --  or  -- 
 
 
with table_1 as ( 
select f.title , count(rental_id) as rental_count , name , 
row_number() over(partition by name order by count(rental_id) desc ) as ranking 
from film as f 
left join inventory as i on i.film_id = f.film_id
left join rental as r on r.inventory_id = i.inventory_id 
left join film_category as fc on fc.film_id = f.film_id
left join category as cat on cat.category_id = fc.category_id
 group by title , name order by name , count(rental_id)desc
 ),
 
 table2 as (
 select title , rental_count , name , ranking from table_1 where ranking <= 3 
 )
 select * from table2 ;


-- que 5 --

select * from rental;
 
select customer_id , count(rental_id) , avg(count(rental_id)) over() as avg_rental , 
count(rental_id) - avg(count(rental_id)) over() as count_diff from rental group by customer_id order by count(rental_id) desc; 


-- que 6 --

select * from payment;

select monthname(payment_date) as month_name , sum(amount) as tot_revenue 
from payment as p group by monthname(payment_date);


-- que 7 --

with table1 as (
select customer_id , sum(amount) as spending 
from payment
group by customer_id
),

table2 as (
select customer_id , sum(spending) over() as tot_spend , spending from table1 
),

table3 as (
select customer_id , count(customer_id) over() as tot_cust , spending/tot_spend * 100 as percentage , spending , tot_spend from table2
),

table4 as (
select customer_id , spending , count(distinct customer_id) as a   from table3
)
select * from table4 group by customer_id , spending ; -- please guide how to find 20% other

-- que 8 --

select * from rental;
select * from inventory;
select * from film_category;

select c.name , count(rental_id) as rental_count   from rental as r 
left join inventory as i on  r.inventory_id = i.inventory_id
left join film_category as fc on fc.film_id = i.film_id
left join category as c on c.category_id = fc.category_id
group by c.name order by count(rental_id); -- cant understand running total of rentals please explain




-- que 9 --

with table1 as (
select title , count(rental_id) as tot_rental  , avg(count(rental_id)) over(partition by c.name) as avg_count , name as category 
 from film as f
 inner join inventory as i on i.film_id = f.film_id
 inner join rental as r on r.inventory_id = i.inventory_id
 inner join film_category as fc on fc.film_id = i.film_id
 inner join category as c on c.category_id = fc.category_id group by c.name , title 
),

table2 as (
select title , tot_rental , avg_count , category from table1
where tot_rental < avg_count 
group by category , title 

)
select * from table2  order by category , Tot_rental asc;


-- que 10 --

select * from payment;
select monthname(payment_date) as month_name , sum(amount) as revenue from payment 
group by monthname(payment_date) 
order by sum(amount) desc limit 5;





