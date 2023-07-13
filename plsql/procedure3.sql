use db1;
create table products(pid int primary key, pname varchar(20),price int);
insert into products values(1,'A',1000),(2,'B',2000),(3,'C',1500);
DELIMITER //
create procedure getproductprice(in productid int,out productprice int)
begin
select price into productprice from products  where pid=productid;
end
// DELIMITER ;
call getproductprice(2,@productprice);
select @productprice;

