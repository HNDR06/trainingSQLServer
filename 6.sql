Soal 
1.Pencarian Kamar yang Tersedia Tampilkan semua kamar yang saat ini tersedia untuk dipesan.

SELECT * FROM Rooms r
WHERE Status = 'Available'

2.Laporan Pemesanan Per Pelanggan Tampilkan laporan daftar pemesanan untuk setiap pelanggan, termasuk nama pelanggan, jenis kamar, tanggal check-in, dan tanggal check-out.

SELECT c.FullName,r.RoomType,b.CheckInDate,b.CheckOutDate FROM Bookings b
INNER JOIN Customer c
ON b.CustomerID = c.CustomerID 
INNER JOIN Rooms r 
ON r.RoomID = b.RoomID

3.Validasi Ketersediaan Kamar Sebelum Pemesanan Tulis query untuk memeriksa apakah kamar tertentu tersedia pada rentang tanggal tertentu.

DECLARE @roomid INT = 1, @chekin DATE = '2024-12-19', @chekout DATE = '2024-12-19';

IF EXISTS(
SELECT * FROM Bookings b WHERE RoomID = @roomid AND (@chekin BETWEEN CheckInDate AND CheckOutDate) OR (@chekout BETWEEN CheckInDate AND CheckOutDate)
)
PRINT 'Sedang Terisi'
ELSE
PRINT 'Kosong'




