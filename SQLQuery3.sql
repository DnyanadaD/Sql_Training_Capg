create database SQLHands
use SQLHands 


create table salesman(
salesman_id int primary key,
Saleman_name varchar(100),
city varchar(100),
commission float
)

create table customer(
customer_id int   primary key,
cust_name varchar(100),
city varchar(100),
grade int,
salesman_id int references salesman(salesman_id)
)

create table orders(
ord_no int primary key,
purch_amt float ,
ord_date date,
customer_id int references customer(customer_id) ,
salesman_id int references salesman(salesman_id),
)

insert into salesman values(5001 , 'James Hoog' ,'New York',0.15)
insert into salesman values(5002 , 'Nail Knite' ,'Paris',0.13)
insert into salesman values(5005 , 'Pit Alex' ,'London',0.11)
insert into salesman values(5006 , 'Mc Lyon' ,'Paris',0.14)
insert into salesman values(5007 , 'Paul Adam' ,'Rome',0.13)
insert into salesman values(5003 , 'Lauson Hen' ,'San Jose',0.12)
select * from salesman

insert into customer values(3002,'Nick Rimando','New York',100,5001)
insert into customer values(3007,'Brade Davis','New York',200,5001)
insert into customer values(3005,'Graham Zusi','California',200,5002)
insert into customer values(3008,'Julian Green','London',300,5002)
insert into customer values(3004,'Geoff','Paris',300,5003)
insert into customer values(3001,'Brad Guzan','Moscow', NULL,5005)
select * from customer

insert into orders values(70001 , 150.5 ,'2012-10-05', 3002,5001)
insert into orders values(70009 , 270.65 ,'2012-09-10', 3001,5005)
insert into orders values(70002 , 65.26 ,'2012-10-05', 3005,5001)
insert into orders values(70011 , 75.29 ,'2012-09-15', 3008,5002)
insert into orders values(70012 , 250.26 ,'2012-10-27', 3004,5005)
insert into orders values(70014 , 11150.5 ,'2012-10-05', 3005,5002)
insert into orders values(70013 , 3045.5 ,'2012-04-25', 3002,5002)
insert into orders values(70023 , 45.5 ,'2012-11-25', 3007,5002)
insert into orders values(70022 , 445.0 ,'2012-10-10', 3007,5002)
insert into orders values(70000 , 550.5 ,'2012-10-10', 3007,5002)
select * from orders

select * from salesman
select * from customer
select * from orders

--1
select ord_date , salesman_id ,ord_no , purch_amt from orders
select * from orders


--2
SELECT DISTINCT salesman_id
FROM orders;
select * from orders

--3
SELECT Saleman_name,city
FROM salesman
WHERE city='Paris';
select * from salesman

--4
SELECT ord_no,ord_date, purch_amt
FROM orders
WHERE salesman_id=5001;
select * from orders

--5
SELECT * FROM customer WHERE city = 'New York' AND grade>100;
select *from customer WHERE city = 'New York'
select * from customer where grade>100;
select * from customer

--6
select * from salesman where commission  between 0.10 AND 0.12
select * from salesman 

--7
select count(*) as 'Count' ,sum(purch_amt) as 'Total_purchase_amount' from orders
select * from orders


--8
select avg(purch_amt) as 'Average_purchase_amount'  from orders
select * from orders

--9
SELECT DISTINCT salesman_id 
FROM orders;

SELECT COUNT (DISTINCT salesman_id) 
FROM orders;

SELECT * FROM orders;

--10
SELECT customer_id,MAX(purch_amt) 
FROM orders 
GROUP BY customer_id;
SELECT * FROM orders 


--11
SELECT customer_id,ord_date,MAX(purch_amt) 
FROM orders 
GROUP BY customer_id,ord_date;


--12
insert into orders values(70003, 1200.00 ,'2012-08-17',3002,5002)
select *from orders
SELECT salesman_id,MAX(purch_amt) 
FROM orders 
WHERE ord_date = '2012-08-17' 
GROUP BY salesman_id;

--13
SELECT salesman.Saleman_name AS "Salesman",
customer.cust_name, customer.city 
FROM salesman,customer 
WHERE salesman.city=customer.city;

select *from salesman
select *from customer

--14
SELECT  a.ord_no,a.purch_amt,
b.cust_name,b.city 
FROM orders a,customer b 
WHERE a.customer_id=b.customer_id 
AND a.purch_amt BETWEEN 500 AND 2000;
select *from orders where purch_amt between 500 AND 2000
select *from customer

--15
SELECT a.cust_name AS "Customer Name", 
a.city, b.Saleman_name AS "Salesman", b.commission 
FROM customer a 
INNER JOIN salesman b 
ON a.salesman_id=b.salesman_id 
WHERE b.commission>.12;

--16
SELECT a.cust_name,a.city,a.grade, 
b.Saleman_name AS "Salesman",b.city 
FROM customer a 
LEFT JOIN salesman b 
ON a.salesman_id=b.salesman_id 
order by a.customer_id;


--SubQuery

--1
SELECT * FROM  orders
select * from  salesman
SELECT *
FROM orders
WHERE salesman_id IN
    (SELECT salesman_id 
     FROM salesman 
     WHERE Saleman_name='Paul Adam');

--2
SELECT * FROM  orders
select * from  salesman
SELECT *
FROM orders
WHERE salesman_id IN
    (SELECT salesman_id 
     FROM salesman 
     WHERE city='London');

--3
SELECT * FROM  orders
select * from  salesman
SELECT *
FROM orders
WHERE salesman_id =
    (SELECT DISTINCT salesman_id 
     FROM orders 
     WHERE customer_id =3007);

--4

select avg(purch_amt) as avg_purch from orders where ord_date='2012-10-10' 
select purch_amt from orders
SELECT *
FROM orders
WHERE purch_amt >
    (SELECT  AVG(purch_amt) 
     FROM orders 
     WHERE ord_date ='2012-10-10');
--5
SELECT * FROM  orders
select * from  salesman
SELECT *
FROM orders
WHERE salesman_id IN
    (SELECT salesman_id 
     FROM salesman 
     WHERE city ='New York');

--6
select salesman_id, Saleman_name  from salesman
select salesman_id from customer
SELECT salesman_id,Saleman_name 
FROM salesman a 
WHERE 1 < 
    (SELECT COUNT(*) 
     FROM customer 
     WHERE salesman_id=a.salesman_id);

--7
SELECT AVG(purch_amt) as 'Average_purch' FROM orders
SELECT * 
FROM orders 
WHERE purch_amt >=
    (SELECT AVG(purch_amt) FROM orders);

--8
SELECT max (purch_amt) as 'max_purch' FROM orders

SELECT ord_date,purch_amt FROM orders 

SELECT ord_date, SUM (purch_amt)
FROM orders 
GROUP BY ord_date


SELECT ord_date, SUM (purch_amt)
FROM orders 
GROUP BY ord_date
HAVING SUM (purch_amt) >
    (SELECT 1000.00 + MAX(purch_amt) 
     FROM orders) 
     
--9
SELECT * FROM customer
WHERE EXISTS
   (SELECT *
    FROM customer 
    WHERE city='London');

--10

select salesman_id ,Saleman_name from salesman

select salesman_id , customer_id from customer

SELECT * FROM salesman 
WHERE salesman_id IN (
   SELECT DISTINCT salesman_id 
   FROM customer a 
   WHERE NOT EXISTS (SELECT * FROM customer b
   WHERE a.salesman_id=b.salesman_id 
      AND a.cust_name != b.cust_name))
      



