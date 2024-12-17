Soal 1: Membuat Stored Procedure
Buat stored procedure bernama GetTotalSalaryByDepartment yang menghitung total gaji semua karyawan di sebuah departemen.

Jalankan stored procedure ini untuk Departemen IT (@DepartmentID = 3)

CREATE PROCEDURE GetTotalSalaryByDepartmentHendra
@DepartmentID INT
AS
BEGIN
	SELECT SUM(Salary) AS Total FROM Employees WHERE DepartmentID = @DepartmentID GROUP BY DepartmentID
END;

ALTER PROCEDURE GetTotalSalaryByDepartmentHendra
@DepartmentID INT
AS
BEGIN
	SELECT DepartmentID,SUM(Salary) AS Total FROM Employees WHERE DepartmentID = @DepartmentID GROUP BY DepartmentID
END;

EXEC GetTotalSalaryByDepartmentHendra @DepartmentID = 3;

SELECT * FROM Employees e 

Soal 2: Membuat Stored Procedure untuk Update Data
Buat stored procedure UpdateEmployeeSalary untuk memperbarui gaji karyawan berdasarkan EmployeeID.

Ubah gaji karyawan dengan EmployeeID = 100 menjadi 20.000.000.

CREATE PROCEDURE UpdateEmployeeSalaryHendra1
@EmployeeID INT,
@NewSalary DECIMAL
AS
BEGIN
	UPDATE Employees SET Salary = @NewSalary WHERE EmployeeID = @EmployeeID
END;

EXEC UpdateEmployeeSalaryHendra1 @EmployeeID = 99, @NewSalary = 20000000



Soal 3: Membuat Trigger untuk Audit
Buat trigger trg_AfterEmployeeUpdate untuk mencatat perubahan gaji ke tabel EmployeeAudit.

Ubah gaji karyawan dengan EmployeeID = 200 menjadi 25.000.000 dan periksa tabel EmployeeAudit.

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

UPDATE Employees SET Salary = WHERE EmployeeID = 


SELECT * FROM EmployeeAudit ea 



Soal 4: Membuat INSTEAD OF Trigger
Buat trigger trg_CheckSalary untuk memastikan gaji tidak boleh lebih dari 100 juta.

Coba masukkan data karyawan baru dengan gaji 120 juta dan amati error-nya.

CREATE TRIGGER trg_CheckSalaryHendra
ON Employees
INSTEAD OF INSERT, UPDATE 
AS
BEGIN
	IF EXISTS (
		SELECT * FROM inserted WHERE Salary > 100000000
	)
	BEGIN 
		RAISERROR ('Gaji Tidak Boleh Melebihi 100 Juta',16,1);
		ROLLBACK TRANSACTION;
	END
	ELSE
	BEGIN
		INSERT INTO Employees (EmployeeID,Name,DepartmentID,Salary)
		SELECT EmployeeID, Name, DepartmentID, Salary
		FROM inserted;
	END
END;

UPDATE Employees SET Salary = 125000000 WHERE EmployeeID = 1
SELECT * FROM Employees

3. Gabungan Stored Procedure dan Trigger
Buat stored procedure GetHighEarnerEmployees untuk mendapatkan daftar karyawan dengan gaji di atas rata-rata per departemen.

Jalankan:

Tambahkan trigger trg_AfterEmployeeInsert untuk mencatat data karyawan baru yang ditambahkan ke tabel log khusus.







