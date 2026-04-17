-- GP1: xóa mềm: chuyển IsDeleted = 1 với đơn 'canceled' rồi tạo bộ lọc để quét IsDeleted=0
-- GP2: sao lưu các đơn canceled vào 1 bảng khác r xóa ở bửn cũ đi

-- GP2 tốt hơn về cả giải phóng dung lượng và tốc độ truy vấn do data dẫ đc xóa bớt



CREATE TABLE ORDERS (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName VARCHAR(100),
    OrderDate DATETIME,
    TotalAmount DECIMAL(18, 2),
    Status VARCHAR(20),
    IsDeleted BIT DEFAULT 0
);


INSERT INTO ORDERS (CustomerName, OrderDate, TotalAmount, Status) VALUES
(N'Nguyễn Văn A', '2023-01-10', 500000, 'Completed'),
(N'Khách hàng vãng lai', '2023-02-15', 1200000, 'Canceled'), 
(N'Trần Thị B', '2023-05-20', 300000, 'Canceled'),        
(N'Lê Văn C', '2024-01-05', 850000, 'Completed');

-- tạo 1 bangr mới chỉ chứa canceled

CREATE TABLE ORDERS_CANCELED (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName VARCHAR(100),
    OrderDate DATETIME,
    TotalAmount DECIMAL(18, 2),
    Status VARCHAR(20),
    IsDeleted BIT DEFAULT 0
);

INSERT INTO ORDERS_CANCELED
SELECT * FROM ORDERS
WHERE Status='Canceled';


-- xóa
DELETE FROM ORDERS
WHERE Status='Canceled'
