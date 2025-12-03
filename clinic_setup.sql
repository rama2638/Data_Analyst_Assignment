--clinic tables
CREATE TABLE clinics (
    cid VARCHAR(50) PRIMARY KEY,
    clinic_name VARCHAR(100),
    city VARCHAR(100),
    state VARCHAR(100),
    country VARCHAR(100)
);

INSERT INTO clinics (cid, clinic_name, city, state, country)
VALUES
('cnc-0100001', 'XYZ clinic', 'lorem', 'ipsum', 'dolor'),
('.....', '....', '..', '..', '...');

--customer

CREATE TABLE customers (
    id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(100),
    mobile VARCHAR(20)
);

INSERT INTO customers (id, name, mobile)
VALUES
('cs-9876-95hj', 'John Doe', '9876543210'),
('..', '..', '.....');


--clinic_sales

CREATE TABLE clinic_sales (
    sid VARCHAR(50) PRIMARY KEY,
    cid VARCHAR(50),
    amount DECIMAL(10,2),
    datetime DATETIME,
    sales_channel VARCHAR(50),
    FOREIGN KEY (cid) REFERENCES clinics(cid)
);

INSERT INTO clinic_sales (sid, cid, amount, datetime, sales_channel)
VALUES
('csd-001-010', 'cnc-0100001', 24999, '2021-09-23 10:22:11', 'retail'),
('csd-002-011', 'cnc-0100001', 18000, '2021-10-12 11:22:07', 'online'),
('csd-003-013', 'cnc-0100002', 30000, '2021-12-02 14:45:00', 'retail');


--expenses

CREATE TABLE expenses (
    eid VARCHAR(50) PRIMARY KEY,
    cid VARCHAR(50),
    description VARCHAR(200),
    amount DECIMAL(10,2),
    datetime DATETIME,
    FOREIGN KEY (cid) REFERENCES clinics(cid)
);

INSERT INTO expenses (eid, cid, description, amount, datetime)
VALUES
('exp-010-0010', 'cnc-0100001', 'maintenance', 557, '2021-08-23 12:05:33'),
('exp-010-0011', 'cnc-0100001', 'electricity', 750, '2021-09-20 11:03:25'),
('exp-010-0022', 'cnc-0100002', 'rent', 1200, '2021-12-01 09:18:45');
