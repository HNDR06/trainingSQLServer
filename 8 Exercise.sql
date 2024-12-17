1.Dirty Read Buat transaksi yang menunjukkan data dibaca sebelum di-commit oleh transaksi lain.

--Update Tanpa Commit
BEGIN TRANSACTION;
UPDATE Orders
SET Status = 'Processing' 
WHERE OrderID = 999;

--Select Tanpa Commit
SET TRANSACTION ISOLATION LEVEL
READ UNCOMMITTED;
SELECT * FROM Orders WHERE OrderID = 999;

--Rollback
ROLLBACK;

SELECT * FROM Orders o WITH (NOLOCK) WHERE o.OrderID = 999 

2. Non-repeatable Read Tunjukkan perbedaan hasil baca karena transaksi lain melakukan perubahan.

--Membaca Data
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
BEGIN TRANSACTION;
SELECT * FROM Orders WHERE OrderID = 999

--Melakukan Perubahan
BEGIN TRANSACTION;
UPDATE Orders SET Status = 'Shipped' WHERE OrderID = 999
COMMIT;

--Membaca Data Ke 2
SELECT * FROM Orders o WHERE OrderID = 999
ROLLBACK;


3. Phantom Read Demonstrasikan transaksi yang membaca hasil berbeda karena ada penyisipan data oleh transaksi lain.



4. Serializable Tunjukkan isolasi penuh sehingga transaksi lain tidak dapat menyisipkan data pada rentang yang sedang diakses.

5. Snapshot Tunjukkan bagaimana snapshot isolation memberikan konsistensi tanpa mengunci data.
