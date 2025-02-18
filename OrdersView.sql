-- In the first task, Little Lemon need you to create a virtual table called OrdersView that focuses on
--  OrderID, Quantity and Cost columns within the Orders table for all orders with a quantity greater than 2. 

use little_lemon_db;

CREATE VIEW OrdersView AS
select OrderID, Quantity , TotalCost from Orders where quantity > 2;

select * from OrdersView