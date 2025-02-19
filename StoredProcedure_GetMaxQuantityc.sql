use little_lemon_db;

delimiter //
create procedure GetMaxQuantity()
begin
	select max(Quantity) as 'Max Quantity in Orders'
	from Orders;
end//
delimiter ;


call GetMaxQuantity();

