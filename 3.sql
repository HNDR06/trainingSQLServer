1. Subquery: Tampilkan nama produk dan kategori untuk produk yang memiliki harga lebih tinggi daripada rata-rata harga semua produk.
2. Conditional Expression: Tambahkan kolom Ketersediaan (Virtual Column) untuk menampilkan status produk:
Tersedia jika stok lebih dari 10.
Habis jika stok 0.
Terbatas untuk stok antara 1 hingga 10.
tableproduk

SELECT NamaProduk,Kategori,Harga FROM Produk WHERE Harga < (SELECT AVG(Harga) FROM Produk)

SELECT *,CASE
WHEN Stok > 10 THEN 'Tersedia'
WHEN Stok = 0 THEN 'Habis'
ELSE 'Terbatas'
END as Hasil1
FROM Produk WHERE Stok >= 0


3. Subquery dan Join: Tampilkan nama produk, kategori, jumlah terjual untuk semua transaksi.
4. Analisis Conditional Expression: Hitung total pendapatan per kategori. 
tableproduk&Penjualan

SELECT Produk.NamaProduk, Produk.Kategori, Penjualan.JumlahTerjual FROM Produk
INNER JOIN Penjualan ON Produk.ProdukId = Penjualan.ProdukID

SELECT g.NamaProduk,g.Kategori, p.JumlahTerjual, g.Harga, (p.JumlahTerjual * g.Harga) as Profit FROM produk g
INNER JOIN Penjualan p ON g.ProdukID = p.ProdukID


5. CTE: Buat query untuk menghitung total stok per kategori menggunakan CTE.
6. CTE dan Join: Gunakan CTE untuk menghitung penjualan per produk, lalu gabungkan dengan tabel produk untuk menampilkan nama produk, kategori.




