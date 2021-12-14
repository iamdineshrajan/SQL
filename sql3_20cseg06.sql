create database sql3;
use sql3;

/* 1. Write a query using two tables to return the names and purchase of the first three records
which are brought together. The name of both product should appear in one column
 Get the unique product pairs from same order by using SELF –JOIN with order ID
and product ID
 Group the pair of products purchased frequently and display the first three records of
frequent product purchases */

create table orders
(
order_id int,
customer_id int,
product_id int
);

insert into orders values (1,1,1),
(1,1,2), 
(1,1,3),
(2,2,1),
(2,2,2),
(2,2,4),
(3,1,5);

create table products
(
id int,
name char(1)
);

insert into products values (1,'A'),
(2,'B'),
(3,'C'),
(4,'D'),
(5,'E');

select *
from orders
limit 3;

select distinct(s1.product_id) as dist_prod,
s1.order_id,
s1.customer_id
from orders as s1, orders s2;

select count(product_id) as frequent_purchase,
product_id
from orders
group by product_id
limit 3;

/* 2. Use SELF – JOIN and write a query for a given table to match the states and cities with its
distance
 To display list of cities with its state and distance */

create table stations
(
id int,
city char(30),
state char(30),
latitude float(3,2),
longitude float(3,2)
);

alter table stations modify column latitude float(3,1);
alter table stations modify column longitude float(4,1);
insert into stations values
(1,'Asheville','North Carolina',35.6,82.6),
(2,'Burlington','North Carolina',36.1,79.4),
(3,'Chapel Hill','North Carolina',35.9,79.1),
(4,'Davidson','North Carolina',35.5,80.8),
(5,'Elizabeth City','North Carolina',36.3,76.3),
(6,'Fargo','North Dakota',46.9,96.8),
(7,'Grand Forks','North Dakota',47.9,97.0),
(8,'Hettinger','North Dakota',46.0,102.6),
(9,'Inkster','North Dakota',48.2,97.6);

select * from stations;
select city,
state,
((latitude ^ 2) + (longitude ^ 2)) as distance
from stations;

/* 3. Use Inner Join for the given two tables and write a query to order the score in descending
order, and order the hacker id in ascending order, remove the record if the score value found
zero
 To display the hacker ID, Name and Total Score */

create table hackers
(
hacker_id int,
name char(10)
);

insert into hackers values
(1,'John'),
(2,'Jane'),
(3,'Joe'),
(4,'Jim');

create table submissions
(
submission_id int,
hacker_id int,
challenge_id int,
score int
);

insert into submissions values
(101,1,1,10),
(102,1,1,12),
(103,2,1,11),
(104,2,1,9),
(105,2,2,13),
(106,3,1,9),
(107,3,2,12),
(108,3,2,15),
(109,4,1,0);

select hackers.hacker_id,name,sum(score) as total_score
from hackers inner join submissions 
on hackers.hacker_id = submissions.hacker_id
where score > 0
group by hacker_id
order by score desc,hacker_id asc;

/* 4. Use JOIN queries and write a query to display the students names with count, who have all
present and attended the classes on their birthday.*/

create table attendance
(
student_id int,
school_date date,
attendance int
);

create table students
(
student_id int,
school_id int,
grade_level int,
date_of_birth date
);

insert into attendance values
(1,'2020-04-03',0),
(2,'2020-04-03',1),
(3,'2020-04-03',1),
(1,'2020-04-04',1),
(2,'2020-04-04',1),
(3,'2020-04-04',1),
(1,'2020-04-05',0),
(2,'2020-04-05',1),
(3,'2020-04-05',1),
(4,'2020-04-05',1);

insert into students values
(1,2,5,'2012-04-03'),
(2,1,4,'2013-04-04'),
(3,1,3,'2014-04-05'),
(4,2,4,'2013-04-03');


select attendance.student_id,
attendance.school_date,
attendance.attendance,
students.date_of_birth
from attendance inner join students
on attendance.student_id = students.student_id
where day(attendance.school_date) = day(students.date_of_birth)
and attendance = 1;

/* 5. Use OUTER JOIN and write a query to display the number of users visited only the mobile
or web page or used both with its user id */

create table mobile
(
user_id int,
page_url char(1)
);

create table web
(
user_id int,
page_url char(1)
);

insert into mobile values
(1,'A'),
(2,'B'),
(3,'C'),
(4,'A'),
(9,'B'),
(2,'C'),
(10,'B');

insert into web values
(6,'A'),
(2,'B'),
(3,'C'),
(7,'A'),
(4,'B'),
(8,'C'),
(5,'B');

select mobile.user_id,mobile.page_url /* only mobile users */
from mobile left outer join web
on mobile.user_id = web.user_id
where web.user_id is null;

select web.user_id,web.page_url /* only web users */
from mobile right outer join web
on mobile.user_id = web.user_id
where mobile.user_id is null;

select mobile.user_id,mobile.page_url 
from mobile left outer join web
on mobile.user_id = web.user_id
where web.user_id is not null
union /* used both */
select web.user_id,web.page_url 
from mobile right outer join web
on mobile.user_id = web.user_id
where mobile.user_id is not null;

select count(*) as mobile_user
from mobile left outer join web
on mobile.user_id = web.user_id
where web.user_id is null;

select count(*) as web_user
from mobile right outer join web
on mobile.user_id = web.user_id
where mobile.user_id is null;

select count(*) as both_user
from mobile left outer join web
on mobile.user_id = web.user_id
where web.user_id is not null
union /* used both */
select count(*) as both_user 
from mobile right outer join web
on mobile.user_id = web.user_id
where mobile.user_id is not null;