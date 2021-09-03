# POSTGRESQL Database Queries

## Section 1. Querying Data

## SELECT Query :
* One of the most common tasks, when you work with the database, is to query data from tables by using the SELECT statement.
* The syntax of the SELECT statement:

```
SELECT
   select_list
FROM
   table_name;
```

* Following the `SELECT` keyword comes list which you want to retrieve
* This list can consist of a single or multiple columns separated by commas(,)
* After the `FROM` keyword you should specify the table where data should be retrieved from.

* Examples: 
```
SELECT name FROM customers;
```
```
SELECT   name,   city,   email FROM   customers;
```
```
SELECT * FROM customers;
``` 
> NOTE : `*` to select all values from customers.

```
SELECT   name || ' : ' || email  FROM    customers;
```
> NOTE : `||` to concatenates columns from customers.
```
SELECT 5 * 3;
```
> NOTE : `5 * 3` is an expression.



## Column Aliases

* A column alias allows you to assign a column or an expression in the select list of a SELECT statement a temporary name. The column alias exists temporarily during the execution of the query.

* The following illustrates the syntax of using a column alias:

```
SELECT column_name AS alias_name FROM table_name; 
```

* `column_name` is name of a column that you want to alias as.
* `AS` keyword is optional.
* `alias_name` is name that you want to give to your column.

* Examples:
```
SELECT name as first_name FROM customers;
```
```
SELECT name first_name FROM customers;
```
```
SELECT name || ' ' || city AS address FROM customers;
```
> Note : Alias for an expression in the SELECT clause. 

> Note : If a column alias contains one or more spaces, you need to surround it with double quotes like this:
```
column_name AS "column alias"
```
For example:
```
SELECT name || ' ' || city "Name and City" FROM customers;
```


## ORDER BY clause
* When you query data from a table, the SELECT statement returns rows in an unspecified order. To sort the rows of the result set, you use the ORDER BY clause in the SELECT statement.

* The ORDER BY clause allows you to sort rows returned by a SELECT clause in ascending or descending order based on a sort expression.

* The following illustrates the syntax of the ORDER BY clause:
```
SELECT select_list FROM table_name ORDER BY sort_expression1 [ASC | DESC],sort_expressionN [ASC | DESC];
```

* First, specify a sort expression, which can be a column or an expression, that you want to sort after the ORDER BY keywords. If you want to sort the result set based on multiple columns or expressions, you need to place a comma (,) between two columns or expressions to separate them.

* Second, you use the ASC option to sort rows in ascending order and the DESC option to sort rows in descending order. If you omit the ASC or DESC option, the ORDER BY uses ASC by default.

* Examples:
```
SELECT name, city FROM customers ORDER BY name;
```
> Note : ASC option is the default, you can omit it in the ORDER BY clause. 

```
SELECT name, city FROM customers ORDER BY name DESC;
```
> Note : DESC sorts the rows by values in the name column in descending order. 

## ORDER BY clause to sort rows by expressions.
* The LENGTH() function accepts a string and returns the length of that string.
```
SELECT name, LENGTH(email) len FROM customer ORDER BY len DESC;
```

## ORDER BY clause and NULL
* In the database world, NULL is a marker that indicates the missing data or the data is unknown at the time of recording.

* When you sort rows that contains NULL, you can specify the order of NULL with other non-null values by using the NULLS FIRST or NULLS LAST option of the ORDER BY clause:

```
ORDER BY sort_expresssion [ASC | DESC] [NULLS FIRST | NULLS LAST]
```
> Note: The NULLS FIRST option places NULL before other non-null values and the NULL LAST option places NULL after other non-null values.

* For Example:
```
-- create a new table
CREATE TABLE sort_demo(	num INT );

-- insert some data
INSERT INTO sort_demo(num) VALUES (1),(2),(3),(null);
```
> Note that you don’t need to understand the CREATE TABLE and INSERT statements. You just need to execute it from pgAdmin or psql to create the sort_demo table and insert data into it.

```
SELECT num FROM sort_demo ORDER BY num;
```
* In above example, the ORDER BY clause sorts values in the num column of the sort_demo table in ascending order. It places NULL after other values.

* So if you use the ASC option, the ORDER BY clause uses the NULLS LAST option by default. Therefore, the following query returns the same result:

```
SELECT num FROM sort_demo ORDER BY num NULLS LAST;
```
* To place NULL before other non-null values, you use the NULLS FIRST option:
```
SELECT num FROM sort_demo ORDER BY num NULLS FIRST;
```
* The following statement sorts values in the num column of the sort_demo table in descending order: 
```
SELECT num FROM sort_demo ORDER BY num DESC;
```
* As you can see clearly from the output, the ORDER BY clause with the DESC option uses the NULLS FIRST by default.

* To reverse the order, you can use the NULLS LAST option:
```
SELECT num FROM sort_demo ORDER BY num DESC NULLS LAST;
```


## SELECT DISTINCT clause
* The DISTINCT clause is used in the SELECT statement to remove duplicate rows from a result set. The DISTINCT clause keeps one row for each group of duplicates. The DISTINCTclause can be applied to one or more columns in the select list of the SELECT statement.

* The following illustrates the syntax of the DISTINCT clause:
```
SELECT DISTINCT column1 FROM table_name;
```
* In this statement, the values in the column1 column are used to evaluate the duplicate.

* If you specify multiple columns, the DISTINCT clause will evaluate the duplicate based on the combination of values of these columns.
```
SELECT DISTINCT column1, column2 FROM table_name;
```
* PostgreSQL also provides the DISTINCT ON (expression) to keep the “first” row of each group of duplicates using the following syntax:
```
SELECT DISTINCT ON (column1) column_alias, column2 FROM table_name ORDER BY column1, column2;
```
## SELECT DISTINCT examples

* First, use the following CREATE TABLE statement to create the distinct_demo table that consists of three columns: id, bcolorand fcolor.

```
CREATE TABLE distinct_demo (id serial NOT NULL PRIMARY KEY,	bcolor VARCHAR,	fcolor VARCHAR);
```
* Second, insert some rows into the distinct_demo table using the following INSERT statement:

```
INSERT INTO distinct_demo (bcolor, fcolor) VALUES 
    ('red', 'red'), 
    ('red', 'red'), 
    ('red', NULL),
    (NULL, 'red'),
	('red', 'green'),
	('red', 'blue'),
	('green', 'red'),
	('green', 'blue'),
	('green', 'green'),
	('blue', 'red'),
	('blue', 'green'),
	('blue', 'blue');
```
* Third, query the data from the distinct_demo table using the SELECT statement:

```
SELECT id, bcolor, fcolor FROM distinct_demo;
```
## DISTINCT one column example
* The following statement selects unique values in the  bcolor column from the t1 table and sorts the result set in alphabetical order by using the ORDER BY clause.
```
SELECT DISTINCT bcolor FROM distinct_demo ORDER BY bcolor;
```
