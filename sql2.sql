create database sql2;
use sql2;

-- 1st question
/* Create a table which contains SWAYAM Course details: Course ID as primary key,
Course Name, Credits, Lecture Given By, Date of Enrollment, Number of Assignments,
Institution and Email ID.
 Write a query to display all the course names where no. of credits are less than 3
 Write a query to display all the course names where no. of credits are greater than 3 */

create table SWAYAM 
(
CourseID varchar(40) primary key,
CourseName varchar(40),
Credits int,
Lecturer char,
DateOfEnrollment date,
NumberOfAssignments int,
Institution char,
EmailID varchar(30)
);

desc SWAYAM;

alter table SWAYAM modify column Lecturer char(20),
modify column Institution char(30);

insert into SWAYAM values('COMPUTERSCIENCE0089','JAVA PROGRAMMING',4,'RAM','2021-01-17',16,'IITM','iitm0089@gmail.com'),
('COMPUTERSCIENCE0090','JAVA PROGRAMMING-2',4,'RAM','2021-01-17',16,'IITM','iitm0090@gmail.com'),
('COMPUTERSCIENCE0095','PYTHON FOR WEB APPLICATION',3,'BALAKUMAR','2021-01-21',12,'IITK','iitk0095@gmail.com'),
('COMPUTERSCIENCE0096','PYTHON FOR WEB APPLICATION-2',3,'BALAKUMAR','2021-01-21',12,'IITK','iitk0096@gmail.com'),
('COMPUTERSCIENCE0100','PYTHON FOR ANALYTICS',2,'NIRMAL','2021-02-21',08,'IITR','iitR0100@gmail.com'),
('COMPUTERSCIENCE0101','PYTHON FOR ANALYTICS-2',2,'NIRMAL','2021-02-21',08,'IITR','iitR0101@gmail.com');
 
select CourseName  /* courses less than 3 credits */
from SWAYAM
where Credits < 3; 

select CourseName /* courses greater than 3 crdits */
from SWAYAM
where Credits > 3;

/* 2. Create two tables Student and Course (Course ID, Course Name, and Registration Number)
and Student (Registration Number, Name, and Address) to perform referential integrity */

create table Course 
(
CourseID varchar(10),
CourseName char(30),
RegistrationNumber varchar(10)
);

create table Student
(
RegistrationNumber varchar(10),
Name char(30),
Address varchar(50)
);

/* 3. Write a query to add two columns Date of Birth and Course to the table Student */

alter table Student add column DOB date, 
add column Course char(30);

desc Student;
desc Course;

/* 4. Create Employee and Job role table to perform inner join based on employee id.  */

create table Employee 
(
EmployeeID int,
EmployeeName char(30),
JoiningDate date,
Department char(20),
Branch char(20)
);

create table JobRole
(
Position char(20),
Salary int,
EmployeeID int
);

select Employee.EmployeeID,
Department, Position, Salary 
from Employee inner join JobRole
on Employee.EmployeeID = JobRole.EmployeeID;

/* 5.Write the SQL queries to Database Schema, SQL Query Results as shown below: */
create table BodyFitLogs
(
id int primary key,
Type char(20),
Minutes int,
Calories int,
Heart_rate int
);

insert into BodyFitLogs values (1,'biking',30,100,110),
(2,'biking',10,30,105),
(3,'dancing',15,200,120);

-- Write a query to group the calories greater than 50
select * from BodyFitLogs 
where Calories > 50;

-- Write a query to group the calories greater than 50 with the criteria below 30 minutes
select * from BodyFitLogs
where Calories > 50 and Minutes < 30;

-- Write a query to group the calories greater than 50 correspondingly with the criteria greater than 100
select * from BodyFitLogs
where Calories > 50 or Heart_rate > 100 
group by Calories;

/* 6. Select any dataset from Kaggle or data.gov.in and create the schema likewise,
Use SELECT queries to display about the data.
 Write queries using aggregate functions HAVING with average, min and
max values in the data
 After performing the aggregate functions as mentioned above: Group up
the rest of values available.
 Filter the data using (AND/OR) */

select State_Name, 
Crop_Year, 
avg(Area) as avg_area,
min(Production) as min_prod,
max(Production) as max_prod
from cropproduction
where State_Name = 'Tamil Nadu' and State_Name = 'Kerala'
group by District_Name
having min_prod > 0
order by Production;