-- Task 1
-- Little Lemon wants to populate the Bookings table of their database with some records of data. 
-- Your first task is to replicate the list of records in the following table by adding them to the Little Lemon booking table. 
INSERT INTO Bookings(CustomerID, Date, TableNo) 
VALUES(1, '2022-10-10', 5),
(3, '2022-11-12', 3),
(2, '2022-10-11', 2),
(1, '2022-10-13', 2);

-- Task 2
-- Create a stored procedure called CheckBooking to check whether a table in the restaurant is already booked. 
DELIMITER //

CREATE PROCEDURE CheckBooking(booking_date DATE, table_no INT)
BEGIN
DECLARE table_check INT;
DECLARE message VARCHAR(25);

SELECT COUNT(*) INTO table_check FROM Bookings WHERE tableNo = table_no AND Date = booking_date;

IF table_check >= 1
THEN
SET message = concat('Table ', table_no, ' is already booked');
ELSE
SET message = 'The table is available';
END IF;

SELECT message;

END //

DELIMITER ;


CALL CheckBooking('2022-10-10', 5);

-- Task 3
-- Little Lemon need to verify a booking, and decline any reservations for tables that are already booked under another name. 
-- Create a new procedure called AddValidBooking. This procedure must use a transaction statement to perform a rollback 
-- if a customer reserves a table that’s already booked under another name.  

DELIMITER //

CREATE PROCEDURE AddValidBooking(booking_date DATE, table_no INT)
BEGIN
DECLARE table_check INT;
DECLARE message VARCHAR(45) DEFAULT 'Booking successfull';
DECLARE customerID INT;

SET customerID = 3;

START TRANSACTION; 
SELECT COUNT(*) INTO table_check FROM Bookings WHERE tableNo = table_no AND Date = booking_date;
INSERT INTO Bookings(CustomerID, Date, TableNo) VALUES(customerID, booking_date, table_no);
IF table_check = 0 THEN
	COMMIT;
ELSE
	ROLLBACK;
    SET message = concat('Table ', table_no, ' is already booked. Booking cancelled');
END IF;

SELECT message;
END //

DELIMITER ;

CALL AddValidBooking('2022-10-14', 5);
