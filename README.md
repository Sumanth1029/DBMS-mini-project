# Hotel-and-rental-vehicle-full-stack-
Hotel reservation and rental vehicle database management system

This project is developed to maintain the details of Customer booking information, trace the details of customer also maintain the information about the hotel room availability. 
 Project has been designed keeping in mind both employee and customer. For a customer to avail room he simply has to book room and then checking in or directly checking in to the hotel. The task of maintaining the hotel rooms lies with the employee. The employee has to perform tasks like maintaining the hotel rooms, reserve rooms for customers, generate bill for customers. These features have been represented by functions in the program 
 
The vehicle rental system provides complete functionality of listing and booking vehicles.  
A vehicle rental is a vehicle that can be used temporarily for a fee during a specified period. Getting a rental car helps people despite the fact they do not have access to their own personal vehicle or do not own a vehicle at all. The individual who needs a car must contact a rental vehicle company which is owned by the hotel and contract out for a vehicle is processed only if the customer has a room booked in the same hotel.  

I have used MySQL for maintaining the database through PhpMyAdmin in the back end, and java for designing the front end. We have created Swing applications using java and used jframes to include buttons, text fields etc.  

The project consists of many modules through which the DBMS user can navigate and access the database. 
Welcome module – This is a window where the user selects either hotel or vehicle he wants to manage. 
This module consists of 2 buttons clicking on which leads to hotel login or vehicle login. 
 
Hotel Login module- Depending upon the choice made in the welcome window, respective login window is opened and the user has to enter username and password. 
  
Show rooms module- In this module, the list of available rooms is displayed and the customer can select any of the available room 
 
Book room module – in this module, customer details are inserted and a room is initiated for booking. 
 
Confirm booking module- customer looks at the room price, class etc. and confirms his booking. When a booking is confirmed, unique booking ID is generated for each booking 
 
Vehicle login module – In the welcome window, if the user chooses vehicle, then this window is displayed where the DBMS user has to log in using username and password.
 
Show vehicles module- In this module, the list of available vehicles for renting is displayed 
 
Book vehicle module- A vehicle can be booked for an existing booking ID. This ensures that customers who have booked a room are given vehicle. A vehicle is chosen by a customer. 
 
Confirm vehicle booking module – Details of the chosen vehicle is displayed and the vehicle chosen by the customer is booked. 
 
Remove window- Customers can be removed as soon as they return the vehicle or when the check-out of the hotel. 

The application binds several jframes into a single program and the application is completely based upon drag and drop GUI swing builder. 
Each jframe consists of buttons and those buttons have an event described. They can perform a query, log out or delete an entity etc. 
For each update operation performed in the front end, the same is reflected to the back end and if any errors are occurred, then they are shown using a pop up menu. 
This project is included a trigger and a stored procedure in the back end and they are executed automatically when certain operations are performed in the front end. 

  



  
  
