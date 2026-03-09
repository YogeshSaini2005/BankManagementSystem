-- =============================================
-- BANK MANAGEMENT SYSTEM - DATABASE SCHEMA
-- =============================================
CREATE DATABASE IF NOT EXISTS bank_management;
USE bank_management;

-- Customers Table
CREATE TABLE IF NOT EXISTS customers (
    customer_id     INT AUTO_INCREMENT PRIMARY KEY,
    full_name       VARCHAR(100) NOT NULL,
    email           VARCHAR(100) UNIQUE NOT NULL,
    phone           VARCHAR(15) NOT NULL,
    address         TEXT,
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Accounts Table
CREATE TABLE IF NOT EXISTS accounts (
    account_number  VARCHAR(20) PRIMARY KEY,
    customer_id     INT NOT NULL,
    account_type    ENUM('SAVINGS', 'CURRENT') DEFAULT 'SAVINGS',
    balance         DECIMAL(15,2) DEFAULT 0.00,
    pin             VARCHAR(64) NOT NULL,  -- SHA-256 hashed
    is_active       BOOLEAN DEFAULT TRUE,
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE
);

-- Transactions Table
CREATE TABLE IF NOT EXISTS transactions (
    transaction_id   INT AUTO_INCREMENT PRIMARY KEY,
    account_number   VARCHAR(20) NOT NULL,
    transaction_type ENUM('DEPOSIT','WITHDRAWAL','INTEREST') NOT NULL,
    amount           DECIMAL(15,2) NOT NULL,
    balance_after    DECIMAL(15,2) NOT NULL,
    description      VARCHAR(255),
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (account_number) REFERENCES accounts(account_number)
);

-- Sample Data
INSERT INTO customers (full_name, email, phone, address) VALUES
('Admin User', 'admin@bank.com', '9999999999', 'Bank HQ');

INSERT INTO accounts (account_number, customer_id, account_type, balance, pin) VALUES
('ACC0000001', 1, 'SAVINGS', 50000.00,
 SHA2('1234', 256));