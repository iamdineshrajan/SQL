create database EMPLOYEE_MANAGEMENT;
use EMPLOYEE_MANAGEMENT;

create table EMP_INFO(
W_ID int
,F_NAME varchar(30)
,L_NAME varchar(30)
,JOIN_DATE date
,DOB date
,GENDER varchar(10)
,DEPARTMENT_ID int
);

create table DEPT_INFO(
DEPARTMENT_ID int
,DEPARTMENT_NAME varchar(50)
);

create table EMP(
W_ID int
, EmpPosition varchar(20)
, SAL int
, primary key(W_ID)
);

insert into EMP_INFO(W_ID,F_NAME,L_NAME,JOIN_DATE,DOB,GENDER,DEPARTMENT_ID)
values(001,"ASH","R","1989/12/04","1980/01/08","MALE",20210);

insert into EMP_INFO
values(002,"RAVI","R","1989/11/09","1980/03/04","MALE",20211);

insert into EMP_INFO
values(003,"LAKSHMI","K","1990/11/11","1975/12/10","FEMALE",20212);

insert into EMP_INFO
values(004,"KUMAR","R","1990/09/15","1979/05/23","MALE",20213);

insert into EMP_INFO
values(005,"DINESH","R","1991/06/26","1981/07/07","MALE",20214);

insert into EMP_INFO
values(006,"BALA","M","1992/08/29","1982/05/12","MALE",20214);

insert into EMP_INFO
values(007,"MURUGAN","A","1991/06/19","1980/09/30","MALE",20211);

insert into EMP_INFO
values(008,"JAANU","D","1990/03/14","1976/01/12","FEMALE",20212);

insert into EMP_INFO
values(009,"RAK","M","1992/03/03","1981/11/06","FEMALE",20213);

insert into EMP_INFO
values(010,"JEYA","K","1992/09/17","1980/11/23","FEMALE",20210);

insert into DEPT_INFO
values(20211,"COMPUTER APPLICATIONS");

insert into DEPT_INFO
values(20211,"COMPUTER APPLICATIONS");

insert into DEPT_INFO
values(20212,"COMPUTER SCIENCE");

insert into DEPT_INFO
values(20212,"COMPUTER SCIENCE");

insert into DEPT_INFO
values(20213,"INFORMATION TECHNOLOGY");

insert into DEPT_INFO
values(20213,"INFORMATION TECHNOLOGY");

insert into DEPT_INFO
values(20214,"MATHEMATICS");

insert into DEPT_INFO
values(20214,"MATHEMATICS");

insert into DEPT_INFO
values(20210,"STATISTICS");

insert into DEPT_INFO
values(20210,"STATISTICS");

select * from EMP_INFO;
select * from DEPT_INFO;

insert into EMP 
values(001,"ASST_PROF.",80000);

insert into EMP
values(003,"ASST_PROF",88000);

insert into EMP 
values(002,"ASST_PROF",90000);

insert into EMP 
values(004,"ASST_PROF",93000);

insert into EMP 
values(005,"ASST_PROF",95000);

insert into EMP 
values(010,"PROF",112000);

insert into EMP 
values(008,"PROF",119000);

insert into EMP 
values(007,"PROF",130000);

insert into EMP 
values(009,"PROF",123000);

insert into EMP 
values(006,"PROF",121000);

select * from EMP;

select EMP_INFO.*,EMP.EmpPosition
from EMP
inner join EMP_INFO on EMP_INFO.W_ID = EMP.W_ID;

alter table EMP_INFO rename column F_NAME to EMP_NAME;


select concat("EMP_NAME","L_NAME") as NAME;
select distinct concat("EMP_NAME","L_NAME") as NAME ,EMP_INFO.*,EMP.EmpPosition,DEPT_INFO.DEPARTMENT_NAME
from (( EMP 
inner join EMP_INFO on EMP_INFO.W_ID = EMP.W_ID)
inner join DEPT_INFO on EMP_INFO.DEPARTMENT_ID = DEPT_INFO.DEPARTMENT_ID);