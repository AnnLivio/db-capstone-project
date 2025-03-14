use littlelemondb;

-- Task 1
-- Create a procedure that displays the maximum ordered quantity in the Orders table. 
DELIMITER //

CREATE PROCEDURE GetMaxQuantity()
BEGIN

SELECT MAX(quantity) as 'Max Quantity in Order'
	FROM(
		SELECT COUNT(*) as quantity
		FROM Orders GROUP BY OrderNo) C;
END //

DELIMITER ;

CALL GetMaxQuantity;

-- Task 2
-- Create a prepared statement called GetOrderDetail. This prepared statement will help to reduce the parsing time of queries. 
-- The prepared statement should accept one input argument, the CustomerID value, from a variable. 
-- The statement should return the order id, the quantity and the order cost from the Orders table.  
PREPARE GetOrderDetail FROM 'SELECT OrderNo, COUNT(*) as Quantity, SUM(TotalCost) FROM Orders WHERE OrderNo = ? GROUP BY OrderNo';
SET @id = 1;
EXECUTE GetORderDetail USING @id;


-- Task 3
-- Create a stored procedure called CancelOrder. Little Lemon want to use this stored procedure to delete an order record based on the user input of the order id.
-- This procedure will allow to cancel any order by specifying the order id value in the procedure parameter without typing the entire SQL delete statement.   


DELIMITER //

CREATE PROCEDURE CancelOrder(order_id INT)
BEGIN

DECLARE order_quantity INT;
DECLARE message VARCHAR(25);

SELECT count(*) INTO order_quantity FROM Orders WHERE OrderNo = order_id;

IF order_quantity > 0
THEN 
DELETE FROM Orders WHERE OrderNo = order_id;
SET message = concat('Order ', order_id, ' is Cancelled');
ELSE SET message = 'The Order does not exists';
END IF;

SELECT message as Confirmation;

END //

DELIMITER ;

CALL CancelOrder(41);