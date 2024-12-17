Soal 1: Membuat Stored Procedure
Buat stored procedure bernama GetTotalSalaryByDepartment yang menghitung total gaji semua karyawan di sebuah departemen.

Jalankan stored procedure ini untuk Departemen IT (@DepartmentID = 3)



Soal 2: Membuat Stored Procedure untuk Update Data
Buat stored procedure UpdateEmployeeSalary untuk memperbarui gaji karyawan berdasarkan EmployeeID.

Ubah gaji karyawan dengan EmployeeID = 100 menjadi 20.000.000.



Soal 3: Membuat Trigger untuk Audit
Buat trigger trg_AfterEmployeeUpdate untuk mencatat perubahan gaji ke tabel EmployeeAudit.

Ubah gaji karyawan dengan EmployeeID = 200 menjadi 25.000.000 dan periksa tabel EmployeeAudit.



Soal 4: Membuat INSTEAD OF Trigger
Buat trigger trg_CheckSalary untuk memastikan gaji tidak boleh lebih dari 100 juta.

Coba masukkan data karyawan baru dengan gaji 120 juta dan amati error-nya.


3. Gabungan Stored Procedure dan Trigger
Buat stored procedure GetHighEarnerEmployees untuk mendapatkan daftar karyawan dengan gaji di atas rata-rata per departemen.

Jalankan:

Tambahkan trigger trg_AfterEmployeeInsert untuk mencatat data karyawan baru yang ditambahkan ke tabel log khusus.







