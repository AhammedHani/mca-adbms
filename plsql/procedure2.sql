use db1;
DELIMITER //
create procedure getsample(a int)
begin
declare x int;
set x=a;
set x=x+10;
select x as 'result';
end
// DELIMITER ;
call getsample(30);
