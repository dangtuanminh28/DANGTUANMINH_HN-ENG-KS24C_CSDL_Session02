-- Tạo database quản lý sinh viên
CREATE DATABASE IF NOT EXISTS ql_sinhvien CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Sử dụng database vừa tạo
USE ql_sinhvien;

-- Tạo bảng Class
CREATE TABLE Class (
    ma_lop VARCHAR(10) PRIMARY KEY,
    ten_lop VARCHAR(50) NOT NULL,
    nam_hoc YEAR NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tạo bảng Student
CREATE TABLE Student (
    ma_sv VARCHAR(10) PRIMARY KEY,
    ho_ten VARCHAR(100) NOT NULL,
    ngay_sinh DATE NOT NULL,
    ma_lop VARCHAR(10),
    
    CONSTRAINT fk_student_class 
        FOREIGN KEY (ma_lop) 
        REFERENCES Class(ma_lop)
        ON DELETE SET NULL
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- (Tùy chọn) Thêm dữ liệu mẫu
INSERT INTO Class (ma_lop, ten_lop, nam_hoc) VALUES
('10A1', 'Lớp 10A1', 2025),
('11B2', 'Lớp 11B2', 2025),
('12C3', 'Lớp 12C3', 2025);

INSERT INTO Student (ma_sv, ho_ten, ngay_sinh, ma_lop) VALUES
('SV001', 'Nguyễn Văn An', '2007-05-15', '10A1'),
('SV002', 'Trần Thị Bình', '2006-08-20', '11B2');