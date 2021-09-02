SELECT version();

SELECT name FROM customers;

SELECT   name,   city,   email FROM   customers;

SELECT * FROM customers;

SELECT   first_name || ' ' || last_name,   email FROM    customers;

SELECT name as first_name FROM customers;

SELECT name first_name FROM customers;

SELECT name || ' ' || city AS address FROM customers;

SELECT name, city FROM customers ORDER BY name;

SELECT name, city FROM customers ORDER BY name DESC;

SELECT name, LENGTH(email) len FROM customers ORDER BY len DESC;

ORDER BY sort_expresssion [ASC | DESC] [NULLS FIRST | NULLS LAST]

SELECT num FROM sort_demo ORDER BY num;

SELECT num FROM sort_demo ORDER BY num NULLS LAST;

SELECT num FROM sort_demo ORDER BY num NULLS FIRST;

SELECT DISTINCT name FROM customers;

SELECT DISTINCT column1, column2 FROM customers;


