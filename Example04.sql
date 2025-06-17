CREATE DATABASE Company;
USE Company;

CREATE TABLE Employee(
Employee_Name VARCHAR(50) PRIMARY KEY, 
Street VARCHAR(50),
City VARCHAR(50)
);

CREATE TABLE Company(
Company_Name VARCHAR(50) PRIMARY KEY, 
City VARCHAR(50)
);

CREATE TABLE Works(
Employee_Name VARCHAR(50), 
Company_Name VARCHAR(50),
Salary INT,
PRIMARY KEY (Employee_Name, Company_Name),
FOREIGN KEY (Employee_Name) REFERENCES Employee(Employee_Name),
FOREIGN KEY (Company_Name) REFERENCES Company(Company_Name)
);

CREATE TABLE Manages(
Employee_Name VARCHAR(50) PRIMARY KEY, 
Manager_Name VARCHAR(50),
FOREIGN KEY (Employee_Name) REFERENCES Employee(Employee_Name),
FOREIGN KEY (Manager_Name) REFERENCES Employee(Employee_Name)
);

INSERT INTO Employee (Employee_name, Street, City) VALUES
('Arif', '51 Upashahar', 'Rajshahi'),
('Sumon', '52 East', 'Moynamati'),
('Sagor', 'Neemgachhi', 'Sirajgong'),
('Abdul', 'Binodpur', 'Rajshahi'),
('Himesh', 'Nazrul avenue', 'Dhaka'),
('Amirul', 'Chawk bazar', 'Sylhet'),
('Sajib', '99 North', 'Chittagong');

INSERT INTO Company (Company_Name, City) VALUES
('Agrani', 'Rajshahi'),
('Sonali', 'Sylhet'),
('Janata', 'Dhaka');

INSERT INTO Works (Employee_Name, Company_Name, Salary) VALUES
('Sumon', 'Agrani', 12000),
('Abdul', 'Sonali', 13000),
('Himesh', 'Agrani', 6000),
('Amirul', 'Sonali', 20000),
('Sagor', 'Sonali', 8000),
('Arif', 'Janata', 13000),
('Sajib', 'Janata', 9000); 

INSERT INTO Manages (Employee_Name, Manager_Name) VALUES
('Amirul', 'Amirul'),
('Abdul', 'Amirul'),
('Sagor', 'Amirul'),
('Sumon', 'Sumon'),
('Himesh', 'Sumon'),
('Arif', 'Arif'),
('Sajib', 'Arif');  

SELECT Employee_Name FROM Works Where Company_Name = 'Sonali';

SELECT E.Employee_Name, E.Street, E.City 
FROM Employee E
JOIN Works W ON E.Employee_Name = W.Employee_Name
WHERE W.Company_Name = 'Agrani';

SELECT E.Employee_Name, E.Street, E.City 
FROM Employee E
JOIN Works W ON E.Employee_Name = W.Employee_Name
WHERE W.Company_Name = 'Sonali' AND W.Salary * 12 > 120000;

SELECT E.Employee_Name
FROM Employee E
JOIN Works W ON E.Employee_Name = W.Employee_Name
JOIN Company C ON W.Company_Name = C.Company_Name
WHERE E.City = C.City;

SELECT E.Employee_Name
FROM Employee E
JOIN Manages M ON E.Employee_Name = M.Employee_Name
JOIN Employee En ON M.Manager_Name = En.Employee_Name
WHERE E.City = En.City AND E.Street = En.Street;

SELECT DISTINCT E.Employee_Name
FROM Employee E
JOIN Works W ON E.Employee_Name = W.Employee_Name
WHERE W.Company_Name != 'Sonali';

SELECT W1.Employee_Name
FROM Works W1
WHERE W1.Salary > ALL (
	SELECT W2.Salary
    FROM Works W2
    WHERE W2.Company_Name = 'Janata'
);

SELECT W.Employee_Name
FROM Works W
JOIN (
    SELECT Company_Name, AVG(Salary) AS AvgSalary
    FROM Works
    GROUP BY Company_Name
) AS A
ON W.Company_Name = A.Company_Name
WHERE W.Salary > A.AvgSalary;

SELECT Company_Name
FROM Works
GROUP BY Company_Name
ORDER BY COUNT(*) DESC
LIMIT 1;

SELECT Company_Name
FROM Works
GROUP BY Company_Name
ORDER BY SUM(Salary) ASC
LIMIT 1;

SELECT Company_Name
FROM Works
GROUP BY Company_Name
HAVING AVG(Salary) > (
	SELECT AVG(Salary)
    FROM Works 
    WHERE Company_Name = 'Agrani'
);

UPDATE Employee
SET City = 'Natore'
WHERE Employee_Name = 'Arif';

UPDATE Works
SET Salary = Salary * 1.10
WHERE Company_Name = 'Agrani';

UPDATE Works
SET Salary = Salary * 1.10
WHERE Employee_Name IN (
    SELECT Temp.Employee_Name
    FROM (
        SELECT M.Employee_Name
        FROM Manages M
        JOIN Works W ON M.Employee_Name = W.Employee_Name
        WHERE W.Company_Name = 'Agrani' AND W.Employee_Name = M.Manager_Name
    ) AS Temp
);

UPDATE Works
SET Salary = CASE 
	WHEN Salary * 1.10 > 19000 THEN Salary * 1.03
	ELSE Salary * 1.10
END
WHERE Employee_Name IN (
	SELECT DISTINCT Manager_Name
    FROM Manages
);

DELETE FROM Works WHERE Company_Name = "Janata";

CREATE VIEW Avg_Manager_Salary AS
SELECT m.Manager_Name, AVG(w.Salary) AS Avg_Salary
FROM Manages m
JOIN Works w ON m.Employee_Name = w.Employee_Name
GROUP BY m.Manager_Name;

SELECT * FROM Avg_Manager_Salary;




