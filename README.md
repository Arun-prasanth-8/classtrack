# ClassTrack - Student Attendance Management System

## 📌 Project Overview
*ClassTrack* is a simple SQL-based Student Attendance Management System designed to store, manage, and analyze student attendance records efficiently.  
This project helps track attendance status (Present/Absent) for each student and provides reports like total days present, absent lists, and attendance percentage.


## 🎯 Features
- Add and store student details.
- Record daily attendance.
- Retrieve students who are absent/present on a given date.
- Calculate total days present for each student.
- Generate attendance percentage reports.


## 🛠 Technologies Used
- *Database*: MySQL
- *Language*: SQL
- *Tools*: MySQL Workbench / phpMyAdmin / Command Line



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





JOIN attendance a ON s.student_id = a.student_id
GROUP BY s.name;
