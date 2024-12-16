1.Buatlah sebuah CTE untuk menghitung total penjualan bulanan dari tabel Sales dan mencari bulan dengan total penjualan tertinggi. Tampilkan kolom:
Bulan
Total Penjualan Bulanan
Indikasi apakah bulan tersebut memiliki penjualan tertinggi ("Ya" atau "Tidak").
/*
 * with cte
 * select total sales
 * select bulan, total penjualan, case when MAX 
 * tablesalesselect*sum,date,
tablesalesdate
*/
WITH SalesCTE AS (
	SELECT SUM(Amount) as totalx,FORMAT(SaleDate,'yyyyMM') as BulanWaktu FROM Sales GROUP BY FORMAT(SaleDate,'yyyyMM')
	),
	MaxCTE AS (
	SELECT MAX(totalx)
	as MaxTotalSales FROM SalesCTE
	)
	
	SELECT 
	BulanWaktu,totalx,
	CASE 
		WHEN totalx = (SELECT MaxTotalSales FROM MaxCTE) THEN
		'YA'
		ELSE
		'TIDAK'
	END
	
FROM SalesCTE

2.Buatlah sebuah query untuk menghitung total penjualan per karyawan, termasuk hanya karyawan yang memiliki penjualan lebih besar dari rata-rata semua penjualan.
WITH CTE1 AS (
	SELECT 
	p.EmployeeID,
	p.Name,
	SUM(e.SaleAmount) as total1
	FROM SalesEmployees p
	INNER JOIN EmployeeSales e
	ON p.EmployeeID = e.EmployeeID
	GROUP BY p.EmployeeID,Name
),
	CTE2 AS (
	SELECT AVG(total1) as rata FROM CTE1
	)
	
SELECT EmployeeID,Name,total1 FROM CTE1
WHERE total1 > (SELECT rata FROM CTE2)

SELECT * FROM CTE1

3. CTE: Buat query untuk menghitung total stok per kategori menggunakan CTE.
/*table produk
 * Kategorui total stok > 20
 * 
 */
WITH TesCTE AS (
select SUM(Stok) as Stok1 from Produk GROUP BY Kategori
)
select * from TesCTE
