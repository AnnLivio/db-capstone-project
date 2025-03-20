# Meta DB Capstone Project
## Module 1
+ Set up a repository for the project
+ Create an ER diagram data model and implement it in MySQL
+ *Data:* `data/littlelemon.csv` (filtered by country = United States)
+ *Files:* `LittleLemonDB_engine.sql`, `LittleLemonDB.mwb`, `LittleLemonMD.png`
+ Show the databases in the MySQL server >> `show_databases.png`.

<img src="LittleLemonMD.png" alt="Little Lemon Data Model" width="600"/>

<!-- ![Little Lemon Data Model](LittleLemonMD.png) -->

## Module 2
**Create a virtual table to summarize data**
+ Create a virtual table called *OrdersView* with OrderID, Quantity and Cost for all orders with a quantity greater than 2. 
+ Extract information from four tables on all customers with orders that cost more than $150.
+ Find all menu items for which more than 2 orders have been placed.
+ SQL File: `Task_123.sql`
+ Captures: `CreateViewTable.png`, `OrdersOver150.png`, `QuantityOver2.png`
_______
  
**Create optimized queries to manage and analyze data**
+ Create a procedure called *GetMaxQuantity* that displays the maximum ordered quantity in the Orders table.
+ Create a prepared statement called *GetOrderDetail*.
+ Create a stored procedure called *CancelOrder* to delete an order record based on the user input of the order id.
+ SQL File: `Task_456.sql`
+ Captures: `GetMaxQuantity.png`, `prepared_statement.png`, `CancelOrder.png`

***

**Create SQL queries to check available bookings based on user input**
+ Populate the Bookings table with the given records of data.
+ Create a stored procedure called *CheckBooking* to check whether a table in the restaurant is already booked.
+ SQL File: `Task_789sql`
+ Captures: `populate_table.png`, `CheckBooking.png`, `AddValidBooking.png`, ÀddValidBooking2.png`

***

**Create SQL queries to add and update bookings**
+ Create a procedure called *AddBooking* to add a new table booking record.
+ Create a procedure called *UpdateBooking* to update existing bookings in the booking table.
+ Create a procedure called *CancelBooking* that they can use to cancel or remove a booking.
+ SQL File: `Task_101112.sql`

## Module 3 
**Create interactive dashboard for sales and profits**
+ Set up the Tableau Workspace for data analysis
+ Create a bar chart that shows customers sales and filter data based on sales with at least $70.
+ Create a line chart to show the sales trend from 2019 to 2022.
+ Create a Bubble chart of sales for all customers.
+ Create a Bar chart that shows the sales of the Turkish, Italian and Greek cuisines.
+ Create an interactive dashboard.
+ Folder Tableau / File: `Little Lemon - Sales Analytics.twbx`
+ Captures: `Dashboard.png`

***
**Add query functions**
+ Set up the client project.
+ Import the connector module, enter your user details and connect with the database
+ Query the database to show all tables within the database.
+ Rreturn specific details from database as: full name and contact details for every customer that has placed an order greater than $60 for a promotional campaign.
+ Jupyter Notebook: `Add_query_function.ipynb`
  
