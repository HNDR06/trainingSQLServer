1. Cari nama belakang "Doe":
2. Cari JobTitle yang mengandung "Developer":
3. Cari email yang diakhiri "example.com":
tableemployees

4. Temukan semua produk yang memiliki kata pertama "Laptop" di ProductName.
5. Cari produk dengan nama yang dimulai dengan huruf "S".
6. Temukan produk dengan harga di atas 1000 dan nama mengandung "Pro".
tableproducts

7. Cari pelanggan yang nama depannya dimulai dengan huruf "A" menggunakan LEFT.
8. Cari pelanggan yang memiliki titik (.) dalam alamat email menggunakan CHARINDEX.
9. Cari pelanggan yang nomor teleponnya berisi "1234" menggunakan PATINDEX.
tablecustomers

SELECT * FROM Employees e WHERE e.FullName LIKE '%Doe'

SELECT * FROM Employees e WHERE JobTitle LIKE '%Developer%'

SELECT * FROM Employees e WHERE Email LIKE '%example.com'

SELECT * FROM products e WHERE ProductName LIKE 'Laptop%'

SELECT * FROM products e WHERE ProductName LIKE 'S%'

SELECT * FROM products e WHERE Price > 1000 AND ProductName LIKE '%Pro%'

SELECT LEFT(FullName,5 ) as NamaPotong FROM Customers c WHERE FullName LIKE 'A%'

SELECT * ,CHARINDEX('.',Email) as IndexEmailEdit FROM Customer c WHERE EMAIL LIKE '.'

SELECT * ,PATINDEX('%1234%',PhoneNumber) as PhoneNumberlEdit FROM Customer c WHERE PhoneNumber LIKE '%1234%'





