USE University;

CREATE TABLE Employee(
Employee_Name VARCHAR(50),
Street VARCHAR(50),
City VARCHAR(50)
);

INSERT INTO Employee (Employee_Name, Street, City) VALUES
('Arif', '51 Upashahar', 'Rajshahi'),
('Sumon', '52 East', 'Moynamati'),
('Sagor', 'Neemgachhi', 'Sirajgong'),
('Abdul', 'Binodpur', 'Rajshahi'),
('Himesh', 'Nazrul Avenue', 'Dhaka'),
('Aminul', 'Chawk Bazar', 'Sylhet'),
('Sajib', '99 North', 'Chittagong');

CREATE TABLE Works(
Employee_Name VARCHAR(50),
Company_Name VARCHAR(50),
Salary INT
);

INSERT INTO Works(Employee_Name, Company_Name, Salary) VALUES
('Sumon', 'Agrani', 12000),
('Abdul', 'Sonali', 13000),
('Himesh', 'Agrani', 6000),
('Amirul', 'Sonali', 20000),
('Sagor', 'Sonali', 8000),
('Arif', 'Janata', 13000),
('Sajib', 'Janata', 9000);

SELECT Employee_Name FROM Employee WHERE City = 'Rajshahi';
SELECT Employee_Name, Street FROM Employee WHERE City = 'Rajshahi';
SELECT Employee_Name FROM Works WHERE Company_Name = 'Sonali';
SELECT Employee_Name FROM Works WHERE Company_Name = 'Agrani';
SELECT Employee_Name FROM Works WHERE Company_Name = 'Janata';
SELECT Employee_Name, Salary FROM Works WHERE Company_Name = 'Sonali';
SELECT Employee_Name, Salary FROM Works WHERE Company_Name = 'Agrani';
SELECT Employee_Name, Salary FROM Works WHERE Company_Name = 'Janata';
SELECT Employee_Name FROM Works WHERE Salary = 12000;
SELECT Employee_Name FROM Works WHERE Salary >= 12000;
SELECT Employee_Name FROM Works WHERE Salary < 12000;
SELECT Employee_Name, Company_Name FROM Works WHERE Salary = 12000;
SELECT Employee_Name, Company_Name FROM Works WHERE Salary >= 12000;
SELECT Employee_Name, Company_Name FROM Works WHERE Salary < 12000;
SELECT E.Employee_Name, E.Street, E.City 
FROM Employee E 
JOIN Works W ON E.Employee_Name = W.Employee_Name 
WHERE W.Company_Name = 'Agrani';

SELECT E.Employee_Name, E.Street, E.City
FROM Employee E
JOIN Works W ON E.Employee_Name = W.Employee_Name
Where W.Salary >= 10000;

SELECT W.Employee_Name, W.Company_Name, W.Salary
FROM Works W
JOIN Employee E ON W.Employee_Name = E.Employee_Name
WHERE E.City = 'Rajshahi';

SELECT E.Employee_Name, E.Street, E.City, W.Company_Name
FROM Employee E
JOIN Works W ON E.Employee_Name = W.Employee_Name
WHERE W.Salary >= 10000;

SELECT E.Employee_Name, E.Street, E.City
From Employee E
JOIN Works W ON E.Employee_Name = W.Employee_Name
WHERE W.Company_Name = 'Sonali' AND W.Salary > 12000;

SELECT Employee_Name
FROM Works
WHERE Company_Name <> 'Sonali';

UPDATE Employee
SET City = 'Natore'
WHERE Employee_Name = 'Arif';

UPDATE Works
SET Salary = Salary * 1.10
WHERE Company_Name = 'Agrani';
