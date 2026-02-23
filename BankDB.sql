SHOW DATABASES;
USE BankDB;
CREATE TABLE Customers (
customer_id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(50),
last_name VARCHAR(50),
dob DATE,
phone VARCHAR(15),
email VARCHAR(100),
address VARCHAR(100)
);
CREATE TABLE Branch (
branch_id INT PRIMARY KEY AUTO_INCREMENT,
branch_name VARCHAR(100),
city VARCHAR(50),
ifsc_code VARCHAR(20) UNIQUE
    );
CREATE TABLE Accounts (
account_id INT PRIMARY KEY AUTO_INCREMENT,
customer_id INT,
branch_id INT,
account_type VARCHAR(20),
balance DECIMAL(10,2),
open_date DATE,
status VARCHAR(20),
FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
FOREIGN KEY (branch_id) REFERENCES Branch(branch_id)
    );
CREATE TABLE Transactions (
transaction_id INT PRIMARY KEY AUTO_INCREMENT,
account_id INT,
transaction_type VARCHAR(20),
amount DECIMAL(10,2),
transaction_date DATETIME,
FOREIGN KEY (account_id) REFERENCES Accounts(account_id)
);
SHOW TABLES;
DESC Customers;
DESC accounts;
DESC branch;
DESC transactions;
INSERT INTO Customers(first_name,last_name,dob,phone,email,address) VALUES
('Amit','Sharma','1995-01-02','9811111111','amit@mail.com','Mumbai'),
('Neha','Verma','1996-02-03','9822222222','neha@mail.com','Delhi'),
('Raj','Patel','1994-03-04','9833333333','raj@mail.com','Pune'),
('Sara','Khan','1997-04-05','9844444444','sara@mail.com','Jaipur'),
('Vikram','Singh','1993-05-06','9855555555','vikram@mail.com','Surat');
INSERT INTO Branch(branch_name,city,ifsc_code) VALUES
('Main Branch','Mumbai','BANK0001'),
('City Branch','Delhi','BANK0002'),
('West Branch','Pune','BANK0003'),
('North Branch','Jaipur','BANK0004'),
('Central Branch','Surat','BANK0005');
INSERT INTO Accounts(customer_id,branch_id,account_type,balance,open_date,status) VALUES
(1,1,'Savings',25000,'2022-01-01','Active'),
(2,2,'Current',30000,'2022-01-02','Active'),
(3,3,'Savings',28000,'2022-01-03','Active'),
(4,4,'Current',35000,'2022-01-04','Active'),
(5,5,'Savings',40000,'2022-01-05','Active');
INSERT INTO Transactions(account_id,transaction_type,amount,transaction_date) VALUES
(1,'Deposit',5000,NOW()),
(2,'Withdrawal',2000,NOW()),
(3,'Deposit',3000,NOW()),
(4,'Withdrawal',1500,NOW()),
(5,'Deposit',7000,NOW());
select * from Customers;
select * from branch;
select * from accounts;
select * from transactions;
UPDATE Customers
SET address = 'Pune'
WHERE customer_id = 1;
SELECT * FROM Customers WHERE customer_id=1;
DELETE FROM transactions WHERE transaction_id = 9999;
START TRANSACTION;
UPDATE accounts
 SET balance = balance-1000
 WHERE account_id=2;
ROLLBACK;
SELECT * FROM accounts WHERE account_id=2;
SELECT c.first_name, c.last_name, a.account_type, a.balance
FROM customers c
JOIN accounts a ON c.customer_id=a.customer_id;
START TRANSACTION;
UPDATE Accounts
 SET balance = balance - 1000 
 WHERE account_id=1;
START TRANSACTION;
UPDATE Accounts
SET balance = balance - 500
WHERE account_id = 1;
SELECT * FROM Accounts WHERE account_id=1;
COMMIT;