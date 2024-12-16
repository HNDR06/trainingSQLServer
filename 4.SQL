1.Buatlah sebuah CTE untuk menghitung total penjualan bulanan dari tabel Sales dan mencari bulan dengan total penjualan tertinggi. Tampilkan kolom:
Bulan
Total Penjualan Bulanan
Indikasi apakah bulan tersebut memiliki penjualan tertinggi ("Ya" atau "Tidak").
tablesalesdate

WITH CTE1 AS (
	SELECT SUM(Amount) AS Jumlah,FORMAT(SaleDate,'yyyyMM') as Date FROM Sales s
	GROUP BY FORMAT(SaleDate,'yyyyMM')
),
CTE2 AS (
	SELECT MAX(Jumlah) As Max FROM CTE1
)
SELECT *,
CASE 
	WHEN Jumlah = (SELECT Max FROM CTE2) THEN
	'YA'
	ELSE
	'TIDAK'
END
AS MaxTinggi
FROM CTE1

2.Buatlah sebuah query untuk menghitung total penjualan per karyawan, termasuk hanya karyawan yang memiliki penjualan lebih besar dari rata-rata semua penjualan.

WITH CTE1 AS (
	SELECT se.EmployeeID,se.Name,SUM(SaleAmount) AS Total FROM SalesEmployees se
	INNER JOIN EmployeeSales es 
	ON se.EmployeeID = es.EmployeeID
	GROUP BY se.EmployeeID,se.Name
),
	CTE2 AS (
	SELECT AVG(Total) AS Rata FROM CTE1 es
)
SELECT * FROM CTE1 
WHERE Total > (SELECT Rata FROM CTE2)
