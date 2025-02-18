
-- In the second task, Little Lemon need you to help them to create a prepared statement called GetOrderDetail.
-- This prepared statement will help to reduce the parsing time of queries. It will also help to secure the database from SQL injections.
-- The prepared statement should accept one input argument, the CustomerID value, from a variable. 
-- The statement should return the order id, the quantity and the order cost from the Orders table. 
-- Once you create the prepared statement, you can create a variable called id and assign it value of 1. 

use little_lemon_db;

prepare GetOrderDetail from 
	'select OrderID,Quantity,TotalCost 
    from Orders 
    join Delivery_Status on Orders.DeliveryID=Delivery_Status.DeliveryID
    join Bookings on Delivery_Status.BookingID=Bookings.BookingID
    where Bookings.CustomerID=?';

SET @id = 1;
EXECUTE GetOrderDetail USING @id;