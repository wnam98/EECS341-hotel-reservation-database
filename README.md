# EECS341-hotel-reservation-database

## Application background
Our product is a database for a third-party hotel reservation management system with an easy way to make reservations for hotels. Our database holds all useful information that users can easily access all the information our database has collected. Based on the information provided, users can then choose the place, time, date, and room they want to reserve, and finally confirm their reservation.

## Data description 
In our database, there are 5 entity sets including Student, Reservation, Hotel, Room, and Hotel staff. In the Student entity set, Student_id is the primary key. In the Reservation entity set, Reservation_id is the primary key. In the Room entity set, Hotel_id and room_number is the composite primary key since Room is a weak entity set that depends on the Hotel entity set. In the hotel staff entity set, staff_id is the primary key. In the Hotel entity set, Hotel_id is the primary key. There are also four relation sets including has_reservation, assign_room, has_room, and has_staff.  In the has_reservation relation, Student_id references Student, Reservation_id references Reservation. It is a one-to-many relationship between a Student and a Reservation. In the assign_room relation, Reservation_id references Reservation, Room_number references Room. It is a many-to-many relationship between a Reservation and a Room. In the has_room relation, Room_number references Room, Hotel_id references Hotel. It is a many-to-one relationship between a Room and a Hotel. In the has_staff relation, Staff_id references Hotel staff, Hotel_id references Hotel. It is a many-to-one relationship between a Hotel staff and a Hotel. We manually added some dummy data based on the information we found online to our database. The source of our dummy data is booking.com. 

## Database Schema
![DBSchema](https://raw.github.com/wnam98/EECS341-hotel-reservation-database/master/docs/DBSchema.PNG "DBSchema")
## Relational Schema
Mapping our ER model to relational schemas, we get the following schema set: 

Student = (Student_id, Student_name, Gender, Preference, Expected_price)
Reservation = (Reservation_id, Date,  Check_in_time, Check_out_time)
Room = (Hotel_id, Room_number, Room_type, Status, Price)
Hotel = (Hotel id, Hotel_name, Location, Rating, ContactInfo)
Hotel Staff = (Staff_id, Staff_name, Gender, Language)

has_reservation = (Reservation_id, Student_id)
assign_room = (Reservation_id, Hotel_id, Room_number)
has_room = (Room_number, Hotel_id)
has_staff = (Staff_id, Hotel_id)

## Functional Dependencies
For the Student table, assuming each student has only one name, one gender, and one expected price, but can have more than one preference, then the following functional dependency holds: 

Student_id -> Student_name, Gender, Expected_price 

For the Reservation table, assuming each reservation has only one date, one check in time, and one check out time, then the following functional dependency holds: 

Reservation_id -> Date,  Check_in_time, Check_out_time

For the Room table, assuming each room has only one room type, one status, and one price, then the following functional dependency holds: 

Hotel_id, Room_number -> Room_type, Status, Price

For the Hotel table, assuming each hotel has only one name, one location, and rating, but can have more than one contact info, then the following functional dependency holds: 

Hotel_id -> Hotel_name, Location, Rating

For the Hotel staff table, assuming each staff has only one name, one gender, but can speak more than one language, then the following functional dependency holds: 

Staff_id -> Staff_name, Gender

## Example Queries
Find the names  of students whose expected price is greater than 100 dollars:

SELECT Student_name
FROM Student
WHERE Expected_price > 100;

TRC: {t| (∃s) (s є Student Λ t[Student_name] = s[Student_name] 
Λ s[Expected_price] > 100)}

RA:  ∏Student_name (σ Expected_price>100 (Student) )


Find the names of hotels that have ratings greater than 3: 

SELECT Hotel_Name
FROM Hotel
WHERE Rating > 3;

TRC: {t| (∃s) (s є Hotel Λ t[Hotel_name] = s[Hotel_name] 
Λ s[Rating] > 3)}

RA:  ∏Hotel_name (σ Rating >3 (Hotel) )


