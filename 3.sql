1. Subquery: Tampilkan nama produk dan kategori untuk produk yang memiliki harga lebih tinggi daripada rata-rata harga semua produk.

SELECT * FROM Produk

SELECT NamaProduk, Kategori, Harga  FROM Produk p WHERE Harga > (
SELECT AVG(Harga) FROM Produk p2 
) 

2. Conditional Expression: Tambahkan kolom Ketersediaan (Virtual Column) untuk menampilkan status produk:
Tersedia jika stok lebih dari 10.
Habis jika stok 0.
Terbatas untuk stok antara 1 hingga 10.

SELECT *,
CASE
	WHEN Stok > 10 THEN 'Tersedia'
	WHEN Stok = 0 THEN 'Habis'
	WHEN Stok Between 1 AND 10 THEN 'Terbatas'
END
as Ketersediaan
FROM Produk p

tableproduk

3. Subquery dan Join: Tampilkan nama produk, kategori, jumlah terjual untuk semua transaksi.

SELECT p.NamaProduk,p.Kategori,p2.JumlahTerjual FROM Produk p
INNER JOIN Penjualan p2 
ON p.ProdukID = p2.ProdukID

4. Analisis Conditional Expression: Hitung total pendapatan per kategori.

SELECT SUM(p.Harga * p.Stok) as Omzet, Kategori FROM Produk p 
INNER JOIN Penjualan p2 
ON p.ProdukID = p2.ProdukID
GROUP BY p.Kategori 

tableproduk&Penjualan

5. CTE: Buat query untuk menghitung total stok per kategori menggunakan CTE.

WITH CTE1 AS (
	SELECT SUM(Stok) as TotalStok, Kategori FROM Produk GROUP BY Kategori
)
SELECT * FROM CTE1

6. CTE dan Join: Gunakan CTE untuk menghitung penjualan per produk, lalu gabungkan dengan tabel produk untuk menampilkan nama produk, kategori.

WITH CTE1 AS (
	SELECT * FROM Penjualan p
)
SELECT JumlahTerjual,NamaProduk,Kategori FROM CTE1 p2
INNER JOIN Produk p 
ON p2.ProdukID = p.ProdukID



