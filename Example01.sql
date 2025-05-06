CREATE DATABASE IF NOT EXISTS University;
Use University;

CREATE TABLE Student(
Roll VARCHAR(10) PRIMARY KEY,
Name VARCHAR(50),
Dept VARCHAR(10),
Year VARCHAR(10),
Semester VARCHAR(10)
);

INSERT INTO Student(Roll, Name, Dept, Year, Semester) VALUES 
('06543201', 'Rahim', 'BBA', '2nd', '1st'),
('06543202', 'Karim', 'ICE', '2nd', '1st'),
('06543203', 'Motin', 'CSE', '1st', '2nd'),
('05654456', 'Swadhin', 'CSE', '1st', '2nd'),
('05654457', 'Hena', 'BBA', '4th', '2nd'),
('05654458', 'Sohag', 'CSE', '3rd', '1st');

CREATE TABLE StudentInfo(
Roll VARCHAR(10) PRIMARY KEY,
Name VARCHAR(50),
FatherName VARCHAR(50),
Address VARCHAR(50),
Mobile VARCHAR(15)
);

INSERT INTO StudentInfo (Roll, Name, FatherName, Address, Mobile) VALUES
('06543201', 'Rahim', 'Ataur', 'Rajshahi', '01719201233'),
('06543202', 'Karim', 'Tareq', 'Dhaka', '01719202020'),
('06543203', 'Motin', 'Rahman', 'Khulna', '01719202678'),
('05654456', 'Swadhin', 'Fazlu', 'Rajshahi', '01719204564'),
('05654457', 'Hena', 'Rahman', 'Rajshahi', '01119212020'),
('05654458', 'Sohag', 'Fazlul', 'Natore', '01719202222');

SELECT Name FROM Student WHERE Semester = '1st';
SELECT Name FROM Student WHERE Year = '2nd';
SELECT Name FROM Student WHERE Dept = 'CSE';
SELECT Name FROM Student WHERE Roll = '06543201';

SELECT Name, Address, Mobile FROM StudentInfo WHERE FatherName = 'Rahman';
SELECT Name, Address, Mobile FROM StudentInfo WHERE Mobile = '01719202020';
SELECT Name, Address, Mobile FROM StudentInfo WHERE Address = 'Rajshahi';
SELECT Name, Address, Mobile FROM StudentInfo WHERE Address = 'Rajshahi' AND FatherName = 'Rahman';
SELECT Name, Address, Mobile FROM StudentInfo WHERE Roll = '05654456';

