1. Cari nama belakang "Doe":

SELECT * FROM Employees e WHERE FullName LIKE '%DOE'

2. Cari JobTitle yang mengandung "Developer":

SELECT * FROM Employees e WHERE JobTitle LIKE '%Developer%' 

3. Cari email yang diakhiri "example.com":

SELECT * FROM Employees e WHERE Email LIKE '%example.com'

tableemployees

4. Temukan semua produk yang memiliki kata pertama "Laptop" di ProductName.

SELECT * FROM Products p WHERE ProductName LIKE 'Laptop%'

5. Cari produk dengan nama yang dimulai dengan huruf "S".

SELECT * FROM Products p WHERE ProductName LIKE '%S%'

6. Temukan produk dengan harga di atas 1000 dan nama mengandung "Pro".

SELECT * FROM Products p WHERE Price > 1000 AND ProductName LIKE '%Pro%'

tableproducts

7. Cari pelanggan yang nama depannya dimulai dengan huruf "A" menggunakan LEFT.

SELECT *,LEFT(FullName,5) AS potong FROM Customers c WHERE FullName LIKE 'A%'

8. Cari pelanggan yang memiliki titik (.) dalam alamat email menggunakan CHARINDEX.

SELECT * FROM Customers c WHERE CHARINDEX('.',Email) > 0

9. Cari pelanggan yang nomor teleponnya berisi "1234" menggunakan PATINDEX.

SELECT * FROM Customers c WHERE PATINDEX('%1234%',PhoneNumber) > 0

tablecustomers





