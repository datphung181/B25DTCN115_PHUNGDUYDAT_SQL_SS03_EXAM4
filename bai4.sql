-- phân tích vấn đề: 
-- +) nguyên nhân 1: thiếu dấu nháy đơn tại phần values Giao Hàng Nhanh
-- +) nguyên nhân 2: ở phần nhập phone đang thiếu Constraints (NOT NULL) nên khi ko nhập value phone thì bảng hiển thị null

CREATE DATABASE shippers_database;
USE shippers_database;

CREATE TABLE SHIPPERS (
ShipperID INT PRIMARY KEY AUTO_INCREMENT,
ShipperName VARCHAR(255),
Phone VARCHAR(20)
) ;

INSERT INTO SHIPPERS (ShipperName, Phone)
VALUES ('Giao Hàng Nhanh', '0901234567');

INSERT INTO SHIPPERS (ShipperName, Phone)
VALUES ('Viettel Post', '0904234568');

ALTER TABLE SHIPPERS
MODIFY Phone VARCHAR(20) NOT NULL;

SELECT * FROM shippers_database.shippers;