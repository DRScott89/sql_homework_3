--1.)List all customers who live in Texas (use JOINs)
--ANSWER: Jennifer Davis, Kim Cruz, Richard Mccrary, Bryan Hardison, Ian Still

select first_name,last_name
from customer 
inner join address
on address.address_id = customer.address_id 
where address.district = 'Texas';

--2.) Get all payments above $6.99 with the Customer's Full Name
--ANSWER: Mary Smith, Peter,Menard, Harold Martino, Douglas Graf, Alvin Deloach, Alfredo Mcadams
select first_name, last_name
from customer
where customer_id in (   
	select customer_id
	from payment 
	group by payment_id
	having amount > 6.99
	order by amount desc
	)
--3). Show all customers names who have made payments over $175(use subqueries)
--ANSWER: Mary Smith, Douglas Graf
select first_name, last_name
from customer
where customer_id in (   
	select customer_id
	from payment 
	group by payment_id
	having amount > 175
	order by amount desc
	)
--4.)List all customers that live in Nepal (use the city table)
--ANSWER: Kevin	Schuler
select customer.first_name, customer.last_name, customer.email, country
from customer 
full join address 
on customer.address_id = address.address_id
full join city 
on address.city_id = city.city_id
full join country 
on city.country_id = country.country_id 
where country = 'Nepal';


--5.) Which staff member had the most transactions?
--ANSWER: Jon
select staff_id, count(payment_id)
from payment
group by staff_id 
order by count(payment_id) desc;

--6.) How many movies of each rating are there?
--ANSWER: PG-13-223, NC-17-209, R-196, PG-194, G-178
select rating, count(film_id)
from film
group by rating
order by count(film_id) desc;

--7.)Show all customers who have made a single payment above $6.99 (Use Subqueries)
--ANSWER: Mary Smith, Peter Menard, Harold Martino, Douglas Graf, Alvin	Deloach, Alfredo Mcadams
select first_name, last_name
from customer
where customer_id in (   
	select customer_id
	from payment 
	group by payment_id
	having amount > 7.99
	order by amount desc
	);
--8.) 8. How many free rentals did our stores give away?
ANSWER: 1452
select count(rental_id)
from rental
where rental_id in(
select rental.rental_id
from rental 
left join payment 
on payment.rental_id = rental.rental_id 
where payment.rental_id is null);







