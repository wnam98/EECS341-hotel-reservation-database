# Hotel Reservation Management Database

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
**Find the names  of students whose expected price is greater than 100 dollars:**

SELECT Student_name
FROM Student
WHERE Expected_price > 100;

TRC: {t| (∃s) (s є Student Λ t[Student_name] = s[Student_name] 
Λ s[Expected_price] > 100)}

RA:  ∏Student_name (σ Expected_price>100 (Student) )


**Find the names of hotels that have ratings greater than 3:**

SELECT Hotel_Name
FROM Hotel
WHERE Rating > 3;

TRC: {t| (∃s) (s є Hotel Λ t[Hotel_name] = s[Hotel_name] 
Λ s[Rating] > 3)}

RA:  ∏Hotel_name (σ Rating >3 (Hotel) )

## Complex Queries
**Find the reservation_id of reservations made to hotels that have at least one staff member that can speak French:**

SELECT reservation_id<br/>
FROM assign_room, Hotel, has_staff, Hotel_staff, StaffLanguage<br/>
WHERE assign_room.Hotel_id = Hotel.Hotel_id<br/>
&nbsp;&nbsp;&nbsp;&nbsp;AND has_staff.hotel_id = Hotel. Hotel_id<br/>
&nbsp;&nbsp;&nbsp;&nbsp;AND Hotel_staff.staff_id = has_staff. staff_id<br/>
&nbsp;&nbsp;&nbsp;&nbsp;AND StaffLanguage.staff_id = Hotel_staff. Staff_id<br/>
&nbsp;&nbsp;&nbsp;&nbsp;AND StaffLanguage.Languages = 'French';


TRC: {t| (∃s) (s є assign_room Λ t[Reservation_id] = s[Reservation_id]<br/> 
&nbsp;&nbsp;&nbsp;&nbsp;Λ (∃r) (r є Hotel  Λ r[Hotel_id] = s[Hotel_id]<br/> 
&nbsp;&nbsp;&nbsp;&nbsp;Λ (∃u) (u є has_staff  Λ  u[Hotel_id] = r[Hotel_id]<br/>    
&nbsp;&nbsp;&nbsp;&nbsp;Λ (∃w) (w є Hotel_staff  Λ w[Staff_id] = u[Staff_id]<br/>  
&nbsp;&nbsp;&nbsp;&nbsp;Λ (∃z) (z є StaffLanguage  Λ z[Staff_id] = w[Staff_id] Λ  z[Languages] = ‘French’)}

RA:  ∏Reservation_id ((assign_room ⋈ Hotel ⋈ has_staff) ⋈ (σ Languages = ‘French’ (StaffLanguage ⋈ Hotel_staff) ))


**Find the names of students who reserved Doubletree hotel:**

SELECT Student_name<br/>
FROM Student, has_reservation, reservation, assign_room, Hotel<br/>
WHERE Student.Student_id = has_reservation.Student_id<br/>
&nbsp;&nbsp;&nbsp;&nbsp;AND reservation.reservation_id = has_reservation.reservation_id<br/>
&nbsp;&nbsp;&nbsp;&nbsp;AND assign_room.reservation_id = reservation.reservation_id<br/>
&nbsp;&nbsp;&nbsp;&nbsp;AND assign_room.Hotel_id = Hotel.Hotel_id<br/>
&nbsp;&nbsp;&nbsp;&nbsp;AND Hotel.Hotel_name = ‘Doubletree’;

TRC: {t| (∃s) (s є Student Λ t[Student_name] = s[Student_name] 
Λ (∃r) (r є has_reservation  Λ r[Student_id] = s[Student_id]
Λ (∃u) (u є reservation  Λ  u[Reservation_id] = r[Reservation_id]   
Λ (∃w) (w є assign_room  Λ w[Reservation_id] = u[Reservation_id] 
Λ (∃z) (z є Hotel  Λ z[Hotel_id] = w[Hotel_id] Λ  z[Hotel_name] = ‘Doubletree’)}

RA: ∏Student_name ((Student ⋈ has_reservation⋈ Reservation) ⋈ (σ Hotel_name = ‘Doubletree’ (assign_room ⋈ Hotel) ))

## Tools/Frameworks

* [MySQL](https://www.mysql.com/) - DBMS for project. Queries were written in Workbench.
* [Octoparse](https://www.octoparse.com/) - Third party webscrapper used to collect sample data.

## Project Team

* **Walter Nam** - [profile](https://github.com/wnam98)
* **Xiaoyao Ni** - [profile](https://github.com/xxn23)

