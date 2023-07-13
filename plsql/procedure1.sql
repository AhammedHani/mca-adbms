create database db1;
use db1;
create table Details(id int,name varchar(20));
insert into Details values(1,"Hani"),(2,"Fathima");
select * from Details;

DELIMITER //
create procedure getdetails()
begin
select name from Details;
end 
// DELIMITER ;
call getdetails;

