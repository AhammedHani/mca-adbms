create database db1;
use db1;
SET SQL_SAFE_UPDATES=0; 
create table Students(ID int,Name varchar(20),Address varchar(20),Total_mark int);
insert into Students values(321,"Fathima","Muttanchery",499);
insert into Students values(322,"Akash","Kozhikkode",399);
insert into Students values(323,"Hani","Velliparamb",329);
select * from Students;
-- Insert a new column Department
alter table Students add column Department varchar(20);
update Students set Department="MCA" where id=321;
update Students set Department="EEE" where id=322;
update Students set Department="CSE" where id=323;
-- display all students in ascending order
select * from Students order by Name asc;
-- select all students with null value at address key
insert into Students values(324,"Ajin",null,319,"ECE");
select name from Students where Address is null;
-- Display Highest total mark
select name from Students where Total_mark=(select max(Total_mark) from Student);
-- Display all departments ending with E
select * from Students where Department like '%E';
-- Display all student name starting with A
select * from Students where Name like 'a%';
-- add a column Age
alter table Students add column Age int;
-- add check constraint on column age
alter table Students add constraint Age_Check check(age>=18);
update Students set Age=21 where id=321; 
update Students set Age=20 where id=322;
update Students set Age=21 where id=323;
update Students set Age=22 where id=324;
-- remove check constraint
alter table Students drop constraint Age_Check;
update Students set age=12 where id=324;
-- delete those records where age=12 and commit those changes to database
delete from Students where age=12;
commit;
-- delete those records where age=20  and then rollback changes in db
start transaction;
delete from Students where age=20;
rollback;
-- create a save point
start transaction;
savepoint sp;
update Students set age=20 where id=321;
savepoint sp1;
update Students set name="Fathima shereen" where id=321;
rollback to sp1;
rollback to sp;
-- release the savepoint created
release savepoint sp; 
-- apply not null constraint to name and id
alter table Students modify column Name varchar(20) not null;
alter table Students modify column id int not null;
-- add column email
alter table Students add column Email varchar(50);
update Students set Email="abc1 @ gmail.com" where id=321;
update Students set Email="abc2 @ gmail.com" where id=322;
update Students set Email="abc3 @ gmail.com" where id=323;
-- apply unique constraint to email column
alter table Students add constraint unique_email unique(Email);
-- Display all departments from Students by eliminating duplication
select distinct Department from Students;
-- create a table Departments having dept_id,Dept_Name
create table Departments (Dept_id int not null,Dept_name varchar(50));
insert into Departments values(1,"MCA"),(2,"ECE"),(3,"CSE"),(4,"EEE");
select * from Departments;
-- Define primary key constraint on dept id
alter table Departments add constraint dept_id_pk primary key(Dept_id);
describe Departments;     
-- perform union between table Student and table Department          
select id,Name,Address,Total_mark,Department,Age,Email,null as Dept_id,null as Dept_name from Students 
union 
select null as id,null as Name,null as Address,null as Total_mark,null as Department,null as age,null as Email,Dept_id,Dept_name from Departments;
alter table students add constraint  stud_id_pk primary key(id);
alter table Students add column Department_id int;
-- creating foreign key in Table student
alter table Students add constraint dept_id_fk foreign key(department_id) references Departments(Dept_id);
update Students set Department_id=1 where id=321;
update Students set Department_id=4 where id=322;
update Students set Department_id=3 where id=323;
insert into Students values(324,"Ajin","peruvayal",319,"MCA",22,"abc4@gmail.com",1);