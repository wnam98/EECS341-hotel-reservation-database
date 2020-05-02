# EECS341-hotel-reservation-database

## Application background
Our product is a database for a third-party hotel reservation management system with an easy way to make reservations for hotels. Our database holds all useful information that users can easily access all the information our database has collected. Based on the information provided, users can then choose the place, time, date, and room they want to reserve, and finally confirm their reservation.

## Data description 
In our database, there are 5 entity sets including Student, Reservation, Hotel, Room, and Hotel staff. In the Student entity set, Student_id is the primary key. In the Reservation entity set, Reservation_id is the primary key. In the Room entity set, Hotel_id and room_number is the composite primary key since Room is a weak entity set that depends on the Hotel entity set. In the hotel staff entity set, staff_id is the primary key. In the Hotel entity set, Hotel_id is the primary key. There are also four relation sets including has_reservation, assign_room, has_room, and has_staff.  In the has_reservation relation, Student_id references Student, Reservation_id references Reservation. It is a one-to-many relationship between a Student and a Reservation. In the assign_room relation, Reservation_id references Reservation, Room_number references Room. It is a many-to-many relationship between a Reservation and a Room. In the has_room relation, Room_number references Room, Hotel_id references Hotel. It is a many-to-one relationship between a Room and a Hotel. In the has_staff relation, Staff_id references Hotel staff, Hotel_id references Hotel. It is a many-to-one relationship between a Hotel staff and a Hotel. We manually added some dummy data based on the information we found online to our database. The source of our dummy data is booking.com. 

##Database Schema
![DBSchema](https://raw.github.com/wnam98/EECS341-hotel-reservation-database/master/docs/DBSchema.PNG "DBSchema")
