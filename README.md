# ClassTrack - Student Attendance Management System

## 📌 Project Overview
*ClassTrack* is a simple SQL-based Student Attendance Management System designed to store, manage, and analyze student attendance records efficiently.  
This project helps track attendance status (Present/Absent) for each student and provides reports like total days present, absent lists, and attendance percentage.

---

## 🎯 Features
- Add and store student details.
- Record daily attendance.
- Retrieve students who are absent/present on a given date.
- Calculate total days present for each student.
- Generate attendance percentage reports.

---

## 🛠 Technologies Used
- *Database*: MySQL
- *Language*: SQL
- *Tools*: MySQL Workbench / phpMyAdmin / Command Line

---

## 📂 Database Structure

### Table: students
| Column      | Type        | Description                |
|-------------|------------|----------------------------|
| student_id  | INT (PK)   | Unique ID for each student  |
| name        | VARCHAR(50)| Student Name               |
| department  | VARCHAR(50)| Department Name            |
| year        | INT        | Year of Study              |

### Table: attendance
| Column        | Type         | Description                   |
|---------------|-------------|-------------------------------|
| attendance_id | INT (PK) AI | Unique Attendance Record ID    |
| student_id    | INT (FK)    | Student ID from students     |
| date          | DATE        | Attendance Date                |
| status        | VARCHAR(10) | 'Present' or 'Absent'          |

---

## 📜 SQL Code
```sql
-- Create Database
CREATE DATABASE IF NOT EXISTS attendance_db;
USE attendance_db;

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
    status VARCHAR(10),
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

-- Insert Students
INSERT INTO students (student_id, name, department, year) VALUES
(1, 'Arun', 'ECE', 3),
(2, 'Karthik', 'CSE', 2),
(3, 'Priya', 'IT', 1),
(4, 'Mani', 'ECE', 3);

-- Insert Attendance Records
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

-- Query: List Absent Students on a Date
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
GROUP BY s.name;
