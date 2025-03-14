-- Task 1
-- Create a new procedure called AddBooking to add a new table booking record.
-- The procedure should include four input parameters: booking id, customer id, booking date, and table number.
DELIMITER //

CREATE PROCEDURE AddBooking(IN booking_id INT, IN customer_id INT, IN booking_date DATE, IN table_no INT)
BEGIN
INSERT INTO Bookings(BookingID, CustomerID, Date, TableNo) VALUES(booking_id, customer_id, booking_date, table_no);
SELECT 'New booking added';
END //

DELIMITER ;

CALL AddBooking(9, 3, '2022-12-30', 4);

-- Task 2
-- Create a new procedure called UpdateBooking that they can use to update existing bookings in the booking table.
-- The procedure should have two input parameters in the form of booking id and booking date. 

DELIMITER //

CREATE PROCEDURE UpdateBooking(IN booking_id INT, IN booking_date DATE)
BEGIN
UPDATE Bookings SET Date = booking_date WHERE BookingID = booking_id;
SELECT concat('Booking ', booking_id, ' updated') AS Confirmation;
END //
DELIMITER ;

CALL UpdateBooking(9, '2022-12-16');

-- Task 3
-- Create a new procedure called CancelBooking that they can use to cancel or remove a booking.
-- The procedure should have one input parameter in the form of booking id. You must also write a DELETE statement inside the procedure. 

DELIMITER //

CREATE PROCEDURE CancelBooking(IN booking_id INT)
BEGIN
DELETE FROM Bookings WHERE BookingID = booking_id;
SELECT concat('Booking ', booking_id, ' cancelled') AS CONFIRMATION;
END //

DELIMITER ;

CALL CancelBooking(9);