CREATE DATABASE IF NOT EXISTS nhs_tutoring;
USE nhs_tutoring;

create table Tutors( --Basic information about every member of the tutoring program
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL,
    strong_subj1 VARCHAR(50) NOT NULL,
    strong_subj2 VARCHAR(50) NOT NULL,
)

create table Tutor_availability( --Separate table to store the availability of tutors
    tutor_id INT NOT NULL,
    period VARCHAR(50) NOT NULL,

    FOREIGN KEY (tutor_id) REFERENCES Tutors(student_id)
)
