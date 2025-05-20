CREATE DATABASE Insurance;
USE Insurance;

CREATE TABLE Person(
NID VARCHAR(50) PRIMARY KEY,
Name VARCHAR(50),
Address VARCHAR(50)
);

CREATE TABLE Car(
License VARCHAR(10) PRIMARY KEY,
Year INT,
Model VARCHAR(50)
);

CREATE TABLE Accident(
Date DATE,
Driver VARCHAR(50),
D_amount INT,
PRIMARY KEY(Date, Driver)
);

CREATE TABLE Owns(
NID VARCHAR(50),
License VARCHAR(10),
PRIMARY KEY (NID, License),
FOREIGN KEY (NID) REFERENCES Person(NID),
FOREIGN KEY (License) REFERENCES Car(License)
);

CREATE TABLE Log(
    License VARCHAR(50),
    Date DATE,
    Driver VARCHAR(50),
    PRIMARY KEY (License, Date, Driver),
    FOREIGN KEY (License) REFERENCES Car(License),
    FOREIGN KEY (Date, Driver) REFERENCES Accident(Date, Driver)
);

INSERT INTO Person (NID, Name, Address) VALUES
(123451, 'Arif', 'Rajshahi'),
(123452, 'Sumon', 'Moynamati'),
(123453, 'Sagor', 'Sirajgang'),
(123454, 'Abdul', 'Rajshahi'),
(123455, 'Himesh', 'Dhaka'),
(123456, 'Amirul', 'Sylhet'),
(123457, 'Sajib', 'Chittagang');

INSERT INTO Car (License, Year, Model) VALUES
('12-3000', 2012, 'Axio'),
('11-3000', 2008, 'Corolla'),
('12-4000', 2013, 'Axio'),
('12-5000', 2013, 'Premio'),
('11-5000', 2010, 'Nano'),
('11-6000', 2011, 'Alto'),
('12-6000', 2015, 'Nano Twist');

INSERT INTO Accident (Date, Driver, D_amount) VALUES
('2013-01-12', 'Arif', 10000),
('2015-09-25', 'Komol', 12000),
('2014-06-20', 'Bahadur', 11000),
('2011-12-20', 'Abdul', 8000),
('2015-09-19', 'Akter', 7000),
('2013-05-15', 'Arif', 20000),
('2014-08-20', 'Arif', 15000);

INSERT INTO Owns (NID, License) VALUES
(123451, '11-3000'),
(123452, '12-4000'),
(123453, '12-5000'),
(123454, '11-5000'),
(123455, '11-6000'),
(123456, '12-6000'),
(123457, '12-3000');

INSERT INTO Log (License, Date, Driver) VALUES
('11-3000', '2013-01-12', 'Arif'),
('12-4000', '2015-09-25', 'Komol'),
('11-6000', '2014-06-20', 'Bahadur'),
('11-5000', '2011-12-20', 'Abdul'),
('12-6000', '2015-09-19', 'Akter'),
('11-3000', '2013-05-15', 'Arif'),
('11-3000', '2014-08-20', 'Arif');

SELECT Name FROM Person WHERE Address = 'Rajshahi';
SELECT Model FROM Car WHERE Year = 2013;
SELECT Driver FROM Accident WHERE D_amount >= 10000 AND D_amount <= 15000;

SELECT O.NID
FROM Owns O
JOIN Car C ON O.License = C.License
WHERE C.Model = 'Axio';

SELECT P.Name, P.Address
FROM Person P
JOIN Owns O ON P.NID = O.NID
JOIN Car C ON O.License = C.License
WHERE C.Model = 'Alto';

SELECT Driver FROM Accident WHERE Date = '2011-12-20';
SELECT Driver FROM Log WHERE License = '12-4000';

SELECT DISTINCT P.Name
FROM Log L
JOIN Owns O ON L.License = O.License
JOIN Person P ON O.NID = P.NID
WHERE L.Driver = 'Arif';

SELECT C.Model
FROM Accident A 
JOIN Log L ON A.Date = L.Date AND A.Driver = L.Driver
JOIN Car C ON L.License = C.License
WHERE A.Date = '2015-09-19';


SELECT COUNT(*) AS AccidentCount
FROM Log L 
JOIN Owns O ON L.License = O.License
JOIN Person P ON O.NID = P.NID
WHERE P.Name = 'Arif';

SELECT DISTINCT L.Date
FROM Log L 
JOIN Owns O ON L.License = O.License
JOIN Person P ON O.NID = P.NID
WHERE P.Name = 'Arif';

UPDATE Person
SET Address = 'Natore'
WHERE Name = 'Arif';



