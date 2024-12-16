1. Agregasi dengan Fungsi String
Soal:
Gabungkan semua nama karyawan dalam satu departemen.
TableNama Karyawan

SELECT 
    UPPER(SUBSTRING(NamaKaryawan, 3, 3)) + '-ACTIVE' AS Hasil
FROM Karyawan
WHERE LEN(NamaKaryawan) > 5;


2. Konversi Format Tanggal
Soal:
Tampilkan TanggalTransaksi dalam format DD-MMM-YYYY HH:MM:SS AM/PM dan hitung jumlah hari hingga tanggal saat ini.
TableTransaksi

SELECT FORMAT(TanggalTransaksi,'dd-MM-yyyy HH:MM:ss tt') as Format1,DATEDIFF(DAY,TanggalTransaksi,GETDATE()) AS BedaHari FROM Transaksi


3. Kalkulasi dengan Fungsi Waktu
Soal:
Hitung total jam kerja setiap karyawan dalam format XX jam YY menit.
TablePresensi

SELECT NamaKaryawan, CONCAT(
DATEDIFF(MINUTE, JamMasuk, JamKeluar) / 60, ' JAM ',
DATEDIFF(MINUTE, JamMasuk, JamKeluar) % 60, ' MENIT ')  as TesJam from Presensi




