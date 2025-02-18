-- Your third and final task is to create a stored procedure called CancelOrder.
-- Little Lemon want to use this stored procedure to delete an order record based on the user input of the order id.
-- Creating this procedure will allow Little Lemon to cancel any order by specifying the order id value in the
-- procedure parameter without typing the entire SQL delete statement.

use little_lemon_db;

delimiter //

create procedure CancelOrder(in orderID_to_delete int)
begin
	delete from Orders where OrderID=orderID_to_delete;
end//

delimiter ;

call CancelOrder(1);

