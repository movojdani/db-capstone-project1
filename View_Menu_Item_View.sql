-- For the third and final task, Little Lemon need you to find all menu items for which more than 2 orders have been placed.
-- You can carry out this task by creating a subquery that lists the menu names from the menus table for any order quantity
-- with more than 2.

use little_lemon_db;

CREATE VIEW Menu_Item_View AS
select  menu.MenuName
from  Menu 
where MenuID = Any (
					select menuitems.MenuID
					from Orders 
						join MenuItems on MenuItems.MenuItemID=Orders.MenuItemID
					where Orders.Quantity>2) ;

select * from Menu_Item_View
 