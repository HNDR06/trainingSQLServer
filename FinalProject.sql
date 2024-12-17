--Tugas 1
--No 1

CREATE TABLE Employees (
	EmployeeID int PRIMARY KEY,
	FirstName Varchar(50),
	LastName Varchar(50),
	DepartmentID int,
	Salary money,
	HireDate date,
	FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
	)
	
CREATE TABLE Departments (
	DepartmentID int PRIMARY KEY,
	DepartmentName Varchar(50),
	ManagerID int,
	)
	
CREATE TABLE Salaries (
	SalaryID int PRIMARY KEY,
	EmployeeID int,
	Amount money,
	SalaryDate date,
	FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
	)
	
CREATE TABLE Sales (
	SaleID int PRIMARY KEY,
	EmployeeID int,
	SaleAmount money,
	SaleDate date,
	)
	
--No 2
	
INSERT INTO Employees 
VALUES 
(1, 'Hendrawan','Oktavianto',1,2500000,'2024-02-01'),
(2,'Faisya', 'Syafadilla',2,2500000,'2024-02-01'),
(3,'Helmi', 'Yuliardi',2,2500000,'2024-02-01')

--NO 3

INSERT INTO Departments
VALUES 
(1, 'Information System',1),
(2, 'DX',1),
(3, 'Training System',1)

INSERT INTO Salaries 
VALUES
(1,1,2500000,'20240301'),
(2,2,2500000,'20240301'),
(3,3,2500000,'20240301')

INSERT INTO Sales 
VALUES
(1,1,3000000,'20240401'),
(2,2,3000000,'20240401'),
(3,3,3000000,'20240401')


--NO 4
SELECT CONCAT(DATEDIFF(DAY,HireDate,GETDATE()),' HARI') as LamaKerja, CONCAT(FirstName,' ',LastName) as NamaLengkap FROM Employees e 


--TUGAS 2
--NO 1
SELECT * FROM Employees e WHERE LastName LIKE 'O%'

--NO 2
SELECT *, CASE
	WHEN Salary > 10000000 THEN 'High'
	WHEN Salary BETWEEN 5000000 AND 10000000 THEN 'Medium'
	WHEN Salary < 5000000 THEN 'Low'
END as KategoriGaji
FROM Employees e

--NO 3
SELECT 	* FROM Employees e 
WHERE Salary > ( SELECT AVG(Salary) FROM Employees e2)

--TUGAS 3
--NO 1
SELECT * INTO #TempTable FROM Employees e WHERE DepartmentID = 1;
SELECT * FROM #TempTable

--NO 2
WITH CTE1 AS(
	SELECT SUM(Salary) as Totalgaji,DepartmentID FROM Employees e GROUP BY DepartmentID
)

SELECT * FROM CTE1

--Tugas 6
--NO 1

ALTER PROCEDURE TotalPenjualan
AS 
BEGIN
	SELECT SUM(Salary) AS TotalGaji FROM Employees
END

EXEC TotalPenjualan

--NO 2
CREATE TRIGGER trg_AfterEmployeeUpdateHendra
ON Employees
AFTER UPDATE 
AS
BEGIN
	INSERT INTO EmployeeAudit (EmployeeID,ChangeDate,OldSalary,NewSalary)
	SELECT i.EmployeeID, GETDATE() as datee,d.Salary,i.Salary 
	FROM deleted d
	JOIN inserted i ON i.EmployeeID = d.EmployeeID
END

CREATE TABLE EmployeeAudit

--TUGAS 7
--NO 1
CREATE LOGIN SalesUser WITH PASSWORD = '1234'
CREATE USER SalesUser FOR LOGIN SalesUser
GRANT SELECT ON Sales TO SalesUser

--NO 2
CREATE ROLE Manager;
GRANT SELECT, UPDATE ON Employees TO Manager
GRANT SELECT, UPDATE ON Salaries TO Manager

--NO 3
REVOKE UPDATE ON Salaries TO Manager
DENY DELETE ON Sales TO SalesUser


