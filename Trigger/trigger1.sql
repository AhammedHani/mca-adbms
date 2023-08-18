create database sample1;
use sample1;
create table phonebook(pname varchar(15),mobno int);
create table del_phonebook(pname varchar(15),mobno int,modify_date date);
insert into phonebook values('sam',987456127);
insert into phonebook values('ram',787456127);
insert into phonebook values('jain',187456175);
insert into phonebook values('siva',587456157);
desc phonebook;
desc del_phonebook;

delimiter //
create trigger save_old_mob
after delete
on phonebook
for each row
begin
insert into del_phonebook (pname,mobno,modify_date)values(OLD.pname,OLD.mobno,sysdate());
end;
//
select * from phonebook;
delete from phonebook where pname='jain';
select * from phonebook;
select * from del_phonebook;