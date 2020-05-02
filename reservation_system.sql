DROP DATABASE IF EXISTS Project;
CREATE DATABASE Project;

USE Project;

DROP TABLE IF EXISTS assign_room;
DROP TABLE IF EXISTS has_reservation;
DROP TABLE IF EXISTS has_room;
DROP TABLE IF EXISTS has_staff;
DROP TABLE IF EXISTS Hotel;
DROP TABLE IF EXISTS hotel_staff;
DROP TABLE IF EXISTS hotelcontact;
DROP TABLE IF EXISTS Preference;
DROP TABLE IF EXISTS reservation;
DROP TABLE IF EXISTS stafflanguage;
DROP TABLE IF EXISTS Student;


CREATE TABLE Student(
    Student_ID INT,
    Student_name VARCHAR(20),
    Gender VARCHAR(20),
    Expected_price INT,
    PRIMARY KEY(Student_ID)
);

CREATE TABLE Preference(
    Student_ID INT,
    Preference VARCHAR(20),
    PRIMARY KEY(Student_ID, Preference),
    foreign key(Student_ID)
		references Student(Student_ID)
);


CREATE TABLE Reservation(
    Reservation_id INT,
    Date VARCHAR(20),
    Check_in_time VARCHAR(20),
    Check_out_time VARCHAR(20),
    PRIMARY KEY(Reservation_id)
);

CREATE TABLE Hotel(
    Hotel_ID INT,
    Hotel_name VARCHAR(20),
    Location VARCHAR(20),
    Rating INT,
    PRIMARY KEY(Hotel_ID)
);

CREATE TABLE HotelContact(
    Hotel_ID INT,
    Contact_info VARCHAR(20),
    PRIMARY KEY(Hotel_ID, Contact_info),
    foreign key(Hotel_ID)
		references Hotel(Hotel_ID)
);

CREATE TABLE Hotel_staff(
    Staff_ID INT,
    Staff_Name VARCHAR(20),
    Gender VARCHAR(20),
    PRIMARY KEY(Staff_ID)
);

CREATE TABLE StaffLanguage(
    Staff_ID INT,
    Languages VARCHAR(20),
    PRIMARY KEY(Staff_ID, Languages),
    foreign key(Staff_ID)
		references Hotel_staff(Staff_ID)
);


CREATE TABLE has_room(
    Room_number INT,
    Room_type VARCHAR(20),
    Status VARCHAR(20),
    Price INT,
    Hotel_ID INT,
    PRIMARY KEY(Room_number, Hotel_ID),
	FOREIGN KEY(Hotel_ID)
		references Hotel(Hotel_ID)
		on delete cascade
);

CREATE TABLE has_reservation(
    Student_ID INT,
    Reservation_ID INT,
    PRIMARY KEY(Student_ID, Reservation_ID),
    FOREIGN KEY(Student_ID)
		references Student(Student_ID),
	FOREIGN KEY(Reservation_ID)
		references Reservation(Reservation_ID)
);

CREATE TABLE has_staff(
    Staff_ID INT,
    Hotel_ID INT,
    PRIMARY KEY(Staff_ID, Hotel_ID),
    FOREIGN KEY(Staff_ID)
		references Hotel_staff(Staff_ID),
	FOREIGN KEY(Hotel_ID)
		references Hotel(Hotel_ID)
);

CREATE TABLE assign_room(
    Reservation_ID INT,
    Hotel_ID INT,
    Room_number INT,
    PRIMARY KEY(Room_number, Hotel_ID, Reservation_ID),
	FOREIGN KEY(Hotel_ID)
		references Hotel(Hotel_ID),
	FOREIGN KEY(Reservation_ID)
		references Reservation(Reservation_ID),
	FOREIGN KEY(Hotel_ID,Room_number)
		references has_room(Hotel_ID,Room_number)
);

SHOW TABLES;
SELECT * FROM assign_room;
SELECT * FROM has_reservation;
SELECT * FROM has_room;
SELECT * FROM has_staff;
SELECT * FROM Hotel;
SELECT * FROM hotel_staff;
SELECT * FROM hotelcontact;
SELECT * FROM Preference;
SELECT * FROM reservation;
SELECT * FROM stafflanguage;
SELECT * FROM Student;

SELECT Student_name
FROM Student
WHERE Expected_price > 100;

SELECT Hotel_Name
FROM Hotel
WHERE Rating > 3;


SELECT reservation_id
FROM assign_room, Hotel, has_staff, Hotel_staff, StaffLanguage
WHERE assign_room.Hotel_id = Hotel.Hotel_id
       	AND has_staff.hotel_id = Hotel. Hotel_id
AND Hotel_staff.staff_id = has_staff. staff_id
AND StaffLanguage.staff_id = Hotel_staff. Staff_id
AND StaffLanguage.Languages = 'French';


INSERT INTO Student VALUES(1, 'Walter', 'Male',  150);
INSERT INTO Student VALUES(2, 'Xiaoyao', 'Male',  100);
INSERT INTO Student VALUES(3, 'Robert', 'Male',  100);
INSERT INTO Student VALUES(4, 'Haihan', 'Male',  150);

INSERT INTO Preference VALUES(1,'Balcony');
INSERT INTO Preference VALUES(1,'King-size bed');
INSERT INTO Preference VALUES(1,'Front-view');
INSERT INTO Preference VALUES(2,'Balcony');
INSERT INTO Preference VALUES(2,'Ocean-View');
INSERT INTO Preference VALUES(3,'Balcony');
INSERT INTO Preference VALUES(4,'Ocean-View');

INSERT INTO Reservation VALUES(100, '4/20/20', '12:40', '15:20');
INSERT INTO Reservation VALUES(101, '4/20/20', '06:30', '11:00');
INSERT INTO Reservation VALUES(102, '4/20/20', '22:00', '07:00');
INSERT INTO Reservation VALUES(103, '4/20/20', '21:00', '18:00');

INSERT INTO Hotel VALUES(1, 'Best Western', 'Cleveland Hopkins', 3.0);
INSERT INTO Hotel VALUES(2, 'Holiday Inn', 'Cleveland Clinic', 3.0);
INSERT INTO Hotel VALUES(3, 'Doubletree', 'Downtown', 4.0);
INSERT INTO Hotel VALUES(4, 'Marriott', 'University Circle', 3.0);
INSERT INTO Hotel VALUES(5, 'Tudor Arms', 'Cultural District', 3.0);

INSERT INTO HotelContact VALUES(1,'(216) 267-9364');
INSERT INTO HotelContact VALUES(2,'(216) 707-4200');
INSERT INTO HotelContact VALUES(2,'holidayinn@gmail.com');
INSERT INTO HotelContact VALUES(3,'(216) 241-5100');
INSERT INTO HotelContact VALUES(3,'doubletree@gmail.com');
INSERT INTO HotelContact VALUES(4,'(216) 791-5678');
INSERT INTO HotelContact VALUES(5,'tudorarms@gmail.com');
INSERT INTO HotelContact VALUES(5,'(216) 455-1260');

INSERT INTO Hotel_staff VALUES(1, 'Kefan', 'Male');
INSERT INTO Hotel_staff VALUES(2, 'Lucy', 'Female');
INSERT INTO Hotel_staff VALUES(3, 'Lily', 'Female');
INSERT INTO Hotel_staff VALUES(4, 'Tom', 'Male');
INSERT INTO Hotel_Staff VALUES(5,'Jared','Male');
INSERT INTO Hotel_Staff VALUES(6,'Sherice','Female');
INSERT INTO Hotel_Staff VALUES(7,'Kristina W','Female');
INSERT INTO Hotel_Staff VALUES(8,'Daniel','Male');
INSERT INTO Hotel_Staff VALUES(9,'Lu','Male');

INSERT INTO StaffLanguage VALUES(1,'English');
INSERT INTO StaffLanguage VALUES(1,'Chinese');
INSERT INTO StaffLanguage VALUES(2,'Chinese');
INSERT INTO StaffLanguage VALUES(3,'English');
INSERT INTO StaffLanguage VALUES(3,'Japanese');
INSERT INTO StaffLanguage VALUES(4,'Spanish');
INSERT INTO StaffLanguage VALUES(4,'English');
INSERT INTO StaffLanguage VALUES(4,'French');
INSERT INTO Stafflanguage VALUES(5,'English');
INSERT INTO Stafflanguage VALUES(6,'English');
INSERT INTO Stafflanguage VALUES(6,'French');
INSERT INTO Stafflanguage VALUES(7,'English');
INSERT INTO Stafflanguage VALUES(7,'French');
INSERT INTO Stafflanguage VALUES(8,'English');
INSERT INTO Stafflanguage VALUES(9,'French');

INSERT INTO has_staff VALUES(1,1);
INSERT INTO has_staff VALUES(2,1);
INSERT INTO has_staff VALUES(3,2);
INSERT INTO has_staff VALUES(4,2);
INSERT INTO has_staff VALUES(5,3);
INSERT INTO has_staff VALUES(6,3);
INSERT INTO has_staff VALUES(7,4);
INSERT INTO has_staff VALUES(8,4);
INSERT INTO has_staff VALUES(9,5);

INSERT INTO has_room VALUES(301, 'Queen Suite', 'Occupied', 150, 4);
INSERT INTO has_room VALUES(510,'King Room', 'Available', 100, 4);
INSERT INTO has_Room VALUES(211, 'Queen Deluxe', 'Available', 100, 4);
INSERT INTO has_room VALUES(1701,'Double Room', 'Occupied', 150, 3);
INSERT INTO has_room VALUES(1605, 'King Room', 'Occupied', 127, 5);

INSERT INTO assign_room VALUES(100, 4, 301);
INSERT INTO assign_room VALUES(101, 3, 1701);
INSERT INTO assign_room VALUES(100, 4, 301);
INSERT INTO assign_room VALUES(101, 3, 1701);

INSERT INTO has_reservation VALUES(2, 101);
INSERT INTO has_reservation VALUES(1, 102);
