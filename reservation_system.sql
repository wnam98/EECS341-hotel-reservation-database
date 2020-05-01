DROP DATABASE IF EXISTS Project;
CREATE DATABASE Project;

USE Project;

DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS Reservation;
DROP TABLE IF EXISTS Room;
DROP TABLE IF EXISTS Hotel;
DROP TABLE IF EXISTS Hotel_staff;

CREATE TABLE Student(
    Student_ID INT,
    Student_name VARCHAR(20),
    Gender VARCHAR(20),
    Preference VARCHAR(20),
    Expected_price INT,
    PRIMARY KEY(Student_ID)
);


CREATE TABLE Reservation(
    Reservation_id INT,
    Date VARCHAR(20),
    Check_in_time VARCHAR(20),
    Check_out_time VARCHAR(20),
    PRIMARY KEY(Reservation_id)
);

CREATE TABLE Room(
    Room_number INT,
    Room_type VARCHAR(20),
    Status VARCHAR(20),
    Price INT,
    PRIMARY KEY(Room_number)
);

CREATE TABLE Hotel(
    Hotel_ID INT,
    Hotel_name VARCHAR(20),
    Location VARCHAR(20),
    Rating INT,
    Contact_info VARCHAR(20),
    PRIMARY KEY(Hotel_ID)
);

CREATE TABLE Hotel_staff(
    Staff_ID INT,
    Staff_Name VARCHAR(20),
    Gender VARCHAR(20),
    Language VARCHAR(20),
    PRIMARY KEY(Staff_ID)
);


SELECT * FROM Student;
SELECT * FROM Reservation;
SELECT * FROM Room;
SELECT * FROM Hotel;


SELECT *
FROM Student
WHERE ID IN (SELECT ID FROM Student
WHERE Expected_price > 100);


SELECT DISTINCT Hotel_Names
FROM Hotel
WHERE Rating > 3;


INSERT INTO Student VALUES(1, 'Walter', 'Male', 'Balcony', 150);
INSERT INTO Student VALUES(2, 'Xiaoyao', 'Male', 'Front-View', 100);
INSERT INTO Student VALUES(3, 'Robert', 'Male', 'Ocean-View', 100);
INSERT INTO Student VALUES(4, 'Haihan', 'Male', 'Balcony', 150);

INSERT INTO Reservation VALUES(100, '4/20/20', '12:40', '15:20');
INSERT INTO Reservation VALUES(101, '4/20/20', '06:30', '11:00');
INSERT INTO Reservation VALUES(102, '4/20/20', '22:00', '07:00');
INSERT INTO Reservation VALUES(103, '4/20/20', '21:00', '18:00');

INSERT INTO Room VALUES(301, 'Queen Suite', 'Occupied', 150);
INSERT INTO Room VALUES(510, 'King Room', 'Available', 100);
INSERT INTO Room VALUES(211, 'Queen Deluxe', 'Available', 100);
INSERT INTO Room VALUES(1701, 'Double Room', 'Occupied', 150);

INSERT INTO Hotel VALUES(1, 'Best Western', 'Cleveland Hopkins', 3.0, '(216) 267-9364');
INSERT INTO Hotel VALUES(2, 'Holiday Inn', 'Cleveland Clinic', 3.0, '(216) 707-4200');
INSERT INTO Hotel VALUES(3, 'Doubletree', 'Downtown', 4.0, '(216) 241-5100');
INSERT INTO Hotel VALUES(4, 'Marriott', 'University Circle', 3.0, '(216) 791-5678');
