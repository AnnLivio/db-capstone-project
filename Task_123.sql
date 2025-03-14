-- Task 1
-- Create a virtual table called OrdersView that focuses on OrderID, Quantity and Cost within Orders for all orders with a quantity greater than 2. 

CREATE VIEW OrdersView AS
SELECT OrderNo, COUNT(OrderNo) as Quantity, SUM(TotalCost) as Cost
FROM Orders
GROUP BY OrderNo
HAVING Quantity > 2;

SELECT * FROM OrdersView order by OrderNo;

-- Task 2
/* Little Lemon need information from four tables on all customers with orders that cost more than $150. 
Extract the required information: customer id, full name, order id, cost, menus name, course name and starter name.
The result set should be sorted by the lowest cost amount. */

WITH sum_orders AS (
	SELECT OrderNo, count(MenuID), SUM(TotalCost) AS TotalCost, MenuID, CustomerID 
    FROM Orders GROUP BY OrderNo, MenuID, CustomerID HAVING TotalCost > 150
)
SELECT Customers.CustomerID, Customers.FullName, 
		sum_orders.OrderNo, sum_orders.TotalCost, 
		Menus.MenuName, MenuItems.CourseName, MenuItems.StarterName
FROM sum_orders
INNER JOIN Customers ON Customers.CustomerID = sum_orders.CustomerID
INNER JOIN Menus ON Menus.MenuID = sum_orders.MenuID
INNER JOIN MenuItems ON MenuItems.MenuItemID = Menus.MenuItemID
ORDER BY sum_orders.TotalCost;

-- Task 3
-- Little Lemon need you to find all menu items for which more than 2 orders have been placed
SELECT MenuName 
FROM Menus WHERE EXISTS (SELECT MenuID FROM (SELECT OrderNo, count(MenuID) as Quantity, MenuID
    FROM Orders GROUP BY OrderNo, MenuID HAVING Quantity > 2) T);