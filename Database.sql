-- Step 1: Create Database
CREATE DATABASE caredesk_db;
USE caredesk_db;

-- Step 2: Create Tables

-- Users (Customers)
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL
);

-- Admins (Admins and Agents)
CREATE TABLE admins (
    admin_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    role ENUM('Admin', 'Agent') NOT NULL
);

-- Tickets
CREATE TABLE tickets (
    ticket_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    subject VARCHAR(150) NOT NULL,
    description TEXT,
    category VARCHAR(50),
    status ENUM('Open', 'In Progress', 'Resolved', 'Closed') DEFAULT 'Open',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- Responses
CREATE TABLE responses (
    response_id INT AUTO_INCREMENT PRIMARY KEY,
    ticket_id INT NOT NULL,
    admin_id INT NOT NULL,
    message TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ticket_id) REFERENCES tickets(ticket_id) ON DELETE CASCADE,
    FOREIGN KEY (admin_id) REFERENCES admins(admin_id) ON DELETE CASCADE
);

-- Feedback
CREATE TABLE feedback (
    feedback_id INT AUTO_INCREMENT PRIMARY KEY,
    response_id INT NOT NULL,
    user_id INT NOT NULL,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    FOREIGN KEY (response_id) REFERENCES responses(response_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- Step 3: Insert Sample Data

-- Users
INSERT INTO users (full_name, email, password) VALUES
('Alice Smith', 'alice@example.com', 'pass123'),
('Bob Johnson', 'bob@example.com', 'pass456');

-- Admins
INSERT INTO admins (full_name, email, password, role) VALUES
('Jane Admin', 'jane@caredesk.com', 'adminpass', 'Admin'),
('Mike Agent', 'mike@caredesk.com', 'agentpass', 'Agent');

-- Tickets
INSERT INTO tickets (user_id, subject, description, category, status) VALUES
(1, 'Login issue', 'Cannot log into my account.', 'Login', 'Open'),
(2, 'Payment failed', 'Transaction did not go through.', 'Billing', 'In Progress');

-- Responses
INSERT INTO responses (ticket_id, admin_id, message) VALUES
(1, 2, 'Hello Alice, please try resetting your password.'),
(2, 2, 'Hi Bob, we are checking the payment gateway.');

-- Feedback
INSERT INTO feedback (response_id, user_id, rating, comment) VALUES
(1, 1, 4, 'Helpful response, thanks.'),
(2, 2, 5, 'Fast and clear support!');

-- Step 4: Create Views

-- View: Tickets + User Info (without customer email)
CREATE VIEW view_tickets AS
SELECT 
    t.ticket_id,
    t.user_id,
    u.full_name AS customer_name,
    t.subject,
    t.description,
    t.category,
    t.status,
    t.created_at
FROM tickets t
JOIN users u ON t.user_id = u.user_id;

-- View: Responses + Admin Info
CREATE VIEW view_responses AS
SELECT 
    r.response_id,
    r.ticket_id,
    r.admin_id,
    a.full_name AS responder_name,
    a.role AS responder_role,
    r.message,
    r.created_at
FROM responses r
JOIN admins a ON r.admin_id = a.admin_id;

-- View: Feedback + User Info
CREATE VIEW view_feedback AS
SELECT 
    f.feedback_id,
    f.response_id,
    f.user_id,
    u.full_name AS user_name,
    f.rating,
    f.comment
FROM feedback f
JOIN users u ON f.user_id = u.user_id;