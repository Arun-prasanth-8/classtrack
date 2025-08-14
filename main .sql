-- Create Database
CREATE DATABASE IF NOT EXISTS attendance_db;
USE attendance_db;

-- Drop tables if they already exist
DROP TABLE IF EXISTS attendance;
DROP TABLE IF EXISTS students;

-- Create Students Table
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    year INT
);

-- Create Attendance Table
CREATE TABLE attendance (
    attendance_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    date DATE,
    status VARCHAR(10), -- Changed from ENUM to VARCHAR to avoid syntax errors
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

-- Insert Sample Students
INSERT INTO students (student_id, name, department, year) VALUES
(1, 'Arun', 'ECE', 3),
(2, 'Karthik', 'CSE', 2),
(3, 'Priya', 'IT', 1),
(4, 'Mani', 'ECE', 3);

-- Insert Sample Attendance Records
INSERT INTO attendance (student_id, date, status) VALUES
(1, '2025-08-12', 'Present'),
(2, '2025-08-12', 'Absent'),
(3, '2025-08-12', 'Present'),
(4, '2025-08-12', 'Absent'),

(1, '2025-08-13', 'Absent'),
(2, '2025-08-13', 'Present'),
(3, '2025-08-13', 'Present'),
(4, '2025-08-13', 'Present');

-- Query: Count Days Present
SELECT s.name, COUNT(*) AS days_present
FROM students s
JOIN attendance a ON s.student_id = a.student_id
WHERE a.status = 'Present'
GROUP BY s.name;

-- Query: List Absent Students on a specific date
SELECT s.name
FROM students s
JOIN attendance a ON s.student_id = a.student_id
WHERE a.date = '2025-08-12' AND a.status = 'Absent';

-- Query: Attendance Percentage
SELECT s.name,
       CONCAT(ROUND(
           (SUM(CASE WHEN a.status = 'Present' THEN 1 ELSE 0 END) / COUNT(*)) * 100, 2
       ), '%') AS attendance_percentage
FROM students s
JOIN attendance a ON s.student_id = a.student_id
GROUP BY s.name;
