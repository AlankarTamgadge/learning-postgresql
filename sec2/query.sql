--WHERE Clause--
SELECT last_name, first_name FROM customer WHERE first_name = 'Jamie';

SELECT last_name, first_name FROM customer WHERE first_name = 'Jamie' AND last_name = 'Rice';

SELECT first_name, last_name FROM customer WHERE last_name = 'Rodriguez' OR first_name = 'Adam';

SELECT first_name, last_name FROM customer WHERE first_name IN ('Ann','Anne','Annie');

SELECT first_name, last_name FROM customer WHERE first_name LIKE 'Ann%'


--LIMIT clause--
SELECT film_id, title, release_year FROM film ORDER BY film_id LIMIT 5;

SELECT film_id, title, release_year FROM film ORDER BY film_id LIMIT 4 OFFSET 3;

SELECT film_id, title, rental_rate FROM film ORDER BY rental_rate DESC LIMIT 10;


--FETCH clause--
SELECT film_id, title FROM film ORDER BY title FETCH FIRST ROW ONLY;

SELECT film_id, title FROM film ORDER BY title FETCH FIRST 1 ROW ONLY;

SELECT film_id, title FROM film ORDER BY title FETCH FIRST 5 ROW ONLY;

SELECT film_id, title FROM film ORDER BY title OFFSET 5 ROWS FETCH FIRST 5 ROW ONLY; 

--- IN operator---
SELECT customer_id, rental_id, return_date FROM rental WHERE customer_id IN (1, 2) ORDER BY return_date DESC;

SELECT rental_id,customer_id,return_date FROM rental WHERE customer_id = 1 OR customer_id = 2 ORDER BY return_date DESC;

---NOT IN operator---
SELECT customer_id,rental_id,return_date FROM rental WHERE customer_id NOT IN (1, 2);

SELECT customer_id,rental_id,return_date FROM rental WHERE customer_id <> 1 AND customer_id <> 2;

SELECT customer_id FROM rental WHERE CAST (return_date AS DATE) = '2005-05-27'ORDER BY customer_id;

SELECT customer_id,first_name,last_name FROM customer WHERE customer_id IN (SELECT customer_id FROM rental WHERE CAST (return_date AS DATE) = '2005-05-27') ORDER BY customer_id;

--- BETWEEN operator---
SELECT customer_id,payment_id,amount FROM payment WHERE amount BETWEEN 8 AND 9;

SELECT customer_id,payment_id,amount FROM payment WHERE amount NOT BETWEEN 8 AND 9;

SELECT customer_id, payment_id, amount, payment_date FROM payment WHERE payment_date BETWEEN '2007-02-07' AND '2007-02-15';

---LIKE operator---
SELECT first_name,last_name FROM customer WHERE first_name LIKE 'Jen%';

SELECT 'foo' LIKE 'foo','foo' LIKE 'f%','foo' LIKE '_o_','bar' LIKE 'b_';

SELECT first_name,last_name FROM customer WHERE first_name LIKE '_her%' ORDER BY first_name;

SELECT first_name,last_name FROM customer WHERE first_name NOT LIKE 'Jen%' ORDER BY first_name

SELECT first_name, last_name FROM customer WHERE first_name ILIKE 'BAR%';

--NULL and IS NULL operator---
SELECT id,first_name,last_name,email,phone FROM contacts WHERE phone = NULL;

SELECT id,first_name,last_name,email,phone FROM contacts WHERE phone IS NULL;

SELECT id,first_name,last_name,email,phone FROM contacts WHERE phone IS NOT NULL;
