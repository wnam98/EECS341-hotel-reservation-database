DROP DATABASE IF EXISTS Project;
CREATE DATABASE Project;

USE Project;

DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS Reservation;
DROP TABLE IF EXISTS Hotel;
DROP TABLE IF EXISTS Hotel_staff;
DROP TABLE IF EXISTS Preference;
DROP TABLE IF EXISTS HotelContact;
DROP TABLE IF EXISTS StaffLanguage;
DROP TABLE IF EXISTS has_staff;
DROP TABLE IF EXISTS has_room;
DROP TABLE IF EXISTS has_reservation;
DROP TABLE IF EXISTS assign_room;

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

CREATE TABLE has_staff(
    Staff_ID INT,
    Hotel_ID INT,
    PRIMARY KEY(Staff_ID, Hotel_ID),
    FOREIGN KEY(Staff_ID)
		references Hotel_staff(Staff_ID),
	FOREIGN KEY(Hotel_ID)
		references Hotel(Hotel_ID)
);

CREATE TABLE has_room(
    Room_number INT,
    Hotel_ID INT,
    Room_type VARCHAR(20),
    Status VARCHAR(20),
    Price INT,
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

INSERT INTO Student VALUES(1, 'Walter', 'Male',  150);
INSERT INTO Student VALUES(2, 'Xiaoyao', 'Male',  100);
INSERT INTO Student VALUES(3, 'Robert', 'Male',  100);
INSERT INTO Student VALUES(4, 'Haihan', 'Male',  150);
INSERT INTO Student VALUES(5, 'Leo', 'Male',  150);
INSERT INTO Student VALUES(6, 'Gloria', 'Female',  50);
INSERT INTO Student VALUES(7, 'Cecile', 'Female',  200);
INSERT INTO Student VALUES(8, 'David', 'Male',  80);

INSERT INTO Preference VALUES(1,'Balcony');
INSERT INTO Preference VALUES(1,'King-size bed');
INSERT INTO Preference VALUES(1,'Front-view');
INSERT INTO Preference VALUES(2,'Balcony');
INSERT INTO Preference VALUES(2,'Ocean-View');
INSERT INTO Preference VALUES(3,'Balcony');
INSERT INTO Preference VALUES(4,'Ocean-View');
INSERT INTO Preference VALUES(5,'Front-View');
INSERT INTO Preference VALUES(6,'Ocean-View');
INSERT INTO Preference VALUES(7,'Ocean-View');
INSERT INTO Preference VALUES(7,'Queen-size bed');
INSERT INTO Preference VALUES(8,'Balcony');

INSERT INTO Reservation VALUES(100, '4/20/20', '12:40', '15:20');
INSERT INTO Reservation VALUES(101, '4/19/20', '06:30', '11:00');
INSERT INTO Reservation VALUES(102, '1/22/20', '22:00', '07:00');
INSERT INTO Reservation VALUES(103, '3/20/20', '21:00', '18:00');
INSERT INTO Reservation VALUES(104, '4/25/20', '16:00', '21:00');
INSERT INTO Reservation VALUES(105, '4/29/20', '21:00', '18:00');
INSERT INTO Reservation VALUES(106, '4/21/20', '21:00', '18:00');

INSERT INTO Hotel VALUES(1, 'Best Western', 'Cleveland Hopkins', 3.0);
INSERT INTO Hotel VALUES(2, 'Holiday Inn', 'Cleveland Clinic', 2.5);
INSERT INTO Hotel VALUES(3, 'Doubletree', 'Downtown', 4.0);
INSERT INTO Hotel VALUES(4, 'Marriott', 'University Circle', 3.5);
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
INSERT INTO Stafflanguage VALUES(7,'German');
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

INSERT INTO has_room VALUES(301, 4, 'Queen Suite', 'Occupied', 150);
INSERT INTO has_room VALUES(510, 4, 'King Room', 'Available', 100);
INSERT INTO has_Room VALUES(211, 4, 'Queen Deluxe', 'Available', 100);
INSERT INTO has_room VALUES(1701, 3, 'Double Room', 'Occupied', 150);
INSERT INTO has_room VALUES(1605, 5, 'King Room', 'Occupied', 127);
INSERT INTO has_room VALUES(110, 1, 'King Room', 'Occupied', 228);
INSERT INTO has_room VALUES(220, 1, 'Queen Room', 'Occupied', 128);
INSERT INTO has_room VALUES(330, 1, 'King Room', 'Occupied', 228);
INSERT INTO has_room VALUES(110, 2, 'King Room', 'Available', 280);
INSERT INTO has_room VALUES(220, 2, 'Queen Deluxe', 'Occupied', 250);
INSERT INTO has_room VALUES(1801, 3, 'Queen Room', 'Occupied', 180);

INSERT INTO assign_room VALUES(100, 4, 301);
INSERT INTO assign_room VALUES(101, 3, 1701);
INSERT INTO assign_room VALUES(102, 1, 330);
INSERT INTO assign_room VALUES(103, 5, 1605);
INSERT INTO assign_room VALUES(104, 1, 110);
INSERT INTO assign_room VALUES(105, 2, 220);
INSERT INTO assign_room VALUES(106, 3, 1801);

INSERT INTO has_reservation VALUES(2, 101);
INSERT INTO has_reservation VALUES(1, 102);
INSERT INTO has_reservation VALUES(1, 103);
INSERT INTO has_reservation VALUES(4, 104);
INSERT INTO has_reservation VALUES(6, 105);
INSERT INTO has_reservation VALUES(7, 106);
INSERT INTO has_reservation VALUES(2, 100);
