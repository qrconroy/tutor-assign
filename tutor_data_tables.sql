CREATE DATABASE IF NOT EXISTS nhs_tutoring;
USE nhs_tutoring;

create table Tutors( --Basic information about every member of the tutoring program
    student_id INT NOT NULL PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL,
    strong_subj1 VARCHAR(50) NOT NULL,
    strong_subj2 VARCHAR(50) NOT NULL,
)

create table Tutor_availability( --Separate table to store the availability of tutors
    tutor_id INT NOT NULL,
    period VARCHAR(50) NOT NULL,

    FOREIGN KEY (tutor_id) REFERENCES Tutors(student_id)
)

create table Tutees(--Basic information about every student who requests tutoring
    request_id INT NOT NULL PRIMARY KEY, --Unique ID for each tutoring request, one student can have multiple requests
    tutee_id INT NOT NULL,
    tutee_name VARCHAR(50) NOT NULL,
    subject_needed VARCHAR(50) NOT NULL,
    period INT NOT NULL
)

create table Matches(
    match_id INT PRIMARY KEY AUTO_INCREMENT,
    tutor_id INT NOT NULL,
    request_id INT NOT NULL,
    week_of DATE NOT NULL, --The week of the tutoring session(important to put people who tutored prior week on low priority matching)
    status ENUM('possible', 'completed') NOT NULL DEFAULT 'possible', --Important to keep track of whether the tutoring session was completed or not, so that we can prioritize students who have not been tutored yet

    FOREIGN KEY (tutor_id) REFERENCES Tutors(student_id),
    FOREIGN KEY (request_id) REFERENCES Tutees(request_id)
)