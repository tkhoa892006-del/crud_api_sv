IF DB_ID(N'student_db') IS NULL
BEGIN
    CREATE DATABASE student_db;
END
GO

USE student_db;
GO

IF OBJECT_ID(N'dbo.students', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.students (
        id UNIQUEIDENTIFIER NOT NULL
            CONSTRAINT DF_students_id DEFAULT NEWID(),
        student_code NVARCHAR(50) NOT NULL,
        full_name NVARCHAR(255) NOT NULL,
        email NVARCHAR(255) NOT NULL,
        phone NVARCHAR(255) NOT NULL,
        class_name NVARCHAR(255) NULL,
        CONSTRAINT PK_students PRIMARY KEY (id),
        CONSTRAINT UQ_students_student_code UNIQUE (student_code)
    );
END
GO

IF NOT EXISTS (SELECT 1 FROM dbo.students)
BEGIN
    INSERT INTO dbo.students
        (id, student_code, full_name, email, phone, class_name)
    VALUES
        (N'E78A09ED-6A65-48CE-BE7E-410F6DE63C89', N'SV0007', N'Đặng Nhật Anh', N'g@gmail.com', N'0966789012', N'C2024A'),
        (N'0C8EE030-18B4-4D12-88B4-6234F1CB5351', N'SV0004', N'Phạm Minh Dũng', N'd@gmail.com', N'0933456789', N'C2024A'),
        (N'99F77886-B335-4D11-94BF-6240D2383114', N'SV0005', N'Hoàng Thị Em', N'e@gmail.com', N'0944567890', N'C2024B'),
        (N'75C9818A-FBDA-421E-B937-654869D09EAC', N'SV0008', N'Bùi Thảo Hề', N'h@gmail.com', N'0977900123', N'C2024B'),
        (N'5B599794-18E8-4A45-A6C2-755DCAF3881A', N'SV0001', N'Nguyễn Văn A', N'a@gmail.com', N'0901234567', N'C2024A'),
        (N'D4E253C6-948E-4500-B822-87D5D3FED96D', N'SV0009', N'Ngô Quốc I', N'i@gmail.com', N'0988901234', N'C2024C'),
        (N'422FB893-970A-47B5-B093-950BD08CC96B', N'SV0002', N'Trần Thị B', N'b@gmail.com', N'0912345678', N'C2024B'),
        (N'49C77B9E-E56B-49A3-B89D-A2F6BB578C02', N'SV0003', N'Lê Hoàng C', N'c@gmail.com', N'0923456789', N'C2024C'),
        (N'67A64038-D7A0-47F7-B536-BCC0B1D50364', N'SV0010', N'Mai Lan K', N'k@gmail.com', N'0999012345', N'C2024A'),
        (N'35685ADF-D811-491E-96C9-D858E5474C9D', N'SV0006', N'Vũ Đức F', N'f@gmail.com', N'0955678901', N'C2024C');
END
GO

SELECT *
FROM dbo.students;
GO
