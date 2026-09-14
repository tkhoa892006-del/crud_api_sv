# Student API

## Chay voi SQL Server Express

### 1. Tao database va bang

Mo SQL Server Management Studio (hoac Azure Data Studio), ket noi den:

```text
.\SQLEXPRESS
```

Mo file [sql/student_db.sql](sql/student_db.sql), chon **Execute**. Script se tao database
`student_db`, bang `dbo.students` va du lieu mau neu cac doi tuong chua ton tai.

### 2. Bat ket noi tu Spring Boot

Ung dung dang dung instance SQL Server Express:

```text
jdbc:sqlserver://localhost;instanceName=SQLEXPRESS;databaseName=student_db;encrypt=true;trustServerCertificate=true
```

Neu gap loi `named instance SQLEXPRESS failed`, hay lam mot trong hai cach sau:

- Mo **SQL Server Configuration Manager** > **SQL Server Network Configuration** >
  **Protocols for SQLEXPRESS**, enable **TCP/IP**, sau do restart service
  **SQL Server (SQLEXPRESS)**.
- Hoac chay service **SQL Server Browser** voi quyen Administrator.

Neu SQL Server duoc cau hinh cong co dinh, co the ghi de URL khi chay:

```powershell
$env:DB_URL="jdbc:sqlserver://localhost:1433;databaseName=student_db;encrypt=true;trustServerCertificate=true"
```

Tai khoan va mat khau duoc doc tu cac bien moi truong `DB_USERNAME` va `DB_PASSWORD`.
Khong commit mat khau vao Git. Vi du voi PowerShell:

```powershell
$env:DB_USERNAME="sa"
$env:DB_PASSWORD="mat-khau-sa-cua-ban"
```

Neu dung cong ket noi khac, co the ghi de URL:

```powershell
$env:DB_URL="jdbc:sqlserver://localhost:1433;databaseName=student_db;encrypt=true;trustServerCertificate=true"
```

### 3. Chay ung dung trong VS Code

Mo terminal tai thu muc project va chay:

```powershell
.\mvnw.cmd spring-boot:run
```

Khi thay log `Started SpringApiApplication`, mo:

- API: <http://localhost:8080/api/students>
- Trang quan ly sinh vien: <http://localhost:8080/students>
- Swagger: <http://localhost:8080/swagger-ui/index.html>

API danh sach ho tro tim kiem theo ma sinh vien, ho ten, email hoac so dien thoai:

```text
GET http://localhost:8080/api/students?keyword=SV0001
```

Trang `students` cho phep tim kiem, them, sua va xoa sinh vien thong qua cac API CRUD.

### 4. Kiem tra truoc khi chay

Lenh test khong can SQL Server vi test dung H2:

```powershell
.\mvnw.cmd test
```
