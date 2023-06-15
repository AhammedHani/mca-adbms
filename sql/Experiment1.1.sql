use db1;
SET SQL_SAFE_UPDATES=0;
-- create table
create table details(id int,name varchar(30),address varchar(20),mathematics int,physics int,computer_science int,total_mark int);
-- insert 4 rows
insert into details value(321,"varun","paruvayal",150,150,150,450);
insert into details value(322,"sarang","koduvally",149,139,109,397);
insert into details value(323,"reema","kozhikode",190,198,98,486);
insert into details value(324,"adwaith","mavoor",100,101,110,311);
-- display all details
select * from details;
-- display name of students with total mark>350
select name from details where total_mark>350;
-- display name of students coming from kozhikkode
select name from details where address="kozhikode";
-- update varun's total mark
update details set total_mark=250 where name="varun";
select * from details;
select total_mark,name from details where name="reema" and total_mark  is not null;
-- update name
update details set name="robin zachariah" where name="adwaith";
-- aggregate functions
select max(total_mark) from details;
select min(mathematics) from details;
select sum(mathematics) from details;
select avg(mathematics) from details;
-- delete column total mark
ALTER TABLE DETAILS DROP TOTAL_MARK;
