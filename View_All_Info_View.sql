-- For your second task, Little Lemon need information from four tables on all customers with orders that cost more than $150.
-- Extract the required information from each of the following tables by using the relevant JOIN clause: 

-- Customers table: The customer id and full name.

-- Orders table: The order id and cost.

-- Menus table: The menus name.

-- MenusItems table: course name and starter name.


use little_lemon_db;

CREATE VIEW All_Info_View AS
select Customers.CustomerID, Customers.CustomerName as FullName
	, Orders.OrderID, Orders.TotalCost as Cost 
    , menu.MenuName
    , menuitems.CourseName, menuitems.StarterName
from Orders 
    join Delivery_Status on Orders.DeliveryID=Delivery_Status.DeliveryID
    join Bookings on Delivery_Status.BookingID=Bookings.BookingID
    join Customers on Bookings.CustomerID=Customers.CustomerID
    join MenuItems on MenuItems.MenuItemID=Orders.MenuItemID
    join Menu on MenuItems.MenuID=Menu.MenuID
where Orders.TotalCost > 150;

select * from All_Info_View;