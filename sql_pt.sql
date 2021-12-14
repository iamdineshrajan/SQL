-- 1st question
create database Placement;
use Placement;

create table amazon(
product_id varchar(255),  
product_category varchar(255),
product_name varchar(255),
price int,
delivery_date date, 
ratings varchar(10),
payment_type varchar(25)
);

select price,product_name,product_category 
from amazon 
group by product_category 
order by price desc;

-- 2nd question
create table Student(
Register_number int);
create table Employee(
emp_id int);

-- 3rd question
create table UPI_Apps(
Google_Pay varchar(30),
Paytm varchar(30),
PhonePe varchar(30),
Bhim varchar(30)
);

-- 4th question
alter table Student add
(
Reg_No int,
Name char(30),
Course char(30),
Resume varchar(50),
LinkedIn varchar(30),
GitHub varchar(30)
);

alter table Student drop column Register_number;

alter table Employee rename column emp_id to Employee_ID;

alter table Employee add
(
Employee_Name char(30),
Department char(30),
Salary int
);

insert into Student values ('01','personA','DA','uploaded','perA','perA_git'),
('02','personB','IT','uploaded','perB','perB_git'),
('03','personC','DA','not uploaded','perC','perC_git'),
('04','personD','CS','uploaded','perD','perD_git'),
('05','personE','DA','not uploaded','perE','perE_git'),
('06','personF','CA','uploaded','perF','perF_git');

select * from Student;

insert into Employee values (001,'EMP A','CA',10000),
(002,'EMP B','CS',11000),
(003,'EMP C','IT',10500),
(004,'EMP D','MATHS',12000),
(005,'EMP E','STATS',12500),
(006,'EMP F','ENGLISH',15000);

select * from Employee;

-- 5th question
create table Facebook_comment_logs
(
Facebook_ID int primary key,
comments varchar(250),
timestamp timestamp
);

insert into Facebook_comment_logs values (101101,'this is a facebook comment','2011-02-28 04:54:12'),
(202398,'Facebook is founded by mark','2013-09-12 12:12:13'),
(306723,'my hobby is same as you SAM','2014-10-28 15:14:01'),
(314509,'i am interested in this post','2011-12-01 01:23:43');

select count(distinct comments) as comment_count
from Facebook_comment_logs;

-- 6th question
alter table Student modify column Reg_No varchar(10);
desc Student;

