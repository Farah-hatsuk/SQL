create database school ;
use school;


CREATE TABLE Teachers
(
  teacher_ID INT NOT NULL,
  teacher_Name VARCHAR(50) NOT NULL,
  PRIMARY KEY (teacher_ID)
);

INSERT INTO Teachers (teacher_ID, teacher_Name) 
VALUES (1, 'John Doe'), 
       (2, 'Jane Smith'), 
       (3, 'Robert Brown'),
       (4, 'Alice Johnson'),
       (5, 'Michael Clark');




CREATE TABLE TeacherDetails
(
  details_ID INT NOT NULL,
  Email VARCHAR(50) NOT NULL,
  teacher_ID INT NOT NULL,
  PRIMARY KEY (details_ID),
  FOREIGN KEY (teacher_ID) REFERENCES Teachers(teacher_ID)
);

INSERT INTO TeacherDetails (details_ID, Email, teacher_ID)
VALUES (1, 'john.doe@example.com', 1),
       (2, 'jane.smith@example.com', 2),
       (3, 'robert.brown@example.com', 3),
       (4, 'alice.johnson@example.com', 4),
       (5, 'michael.clark@example.com', 5);


CREATE TABLE Courses
(
  courses_ID INT NOT NULL,
  courses_Name VARCHAR(50) NOT NULL,
  teacher_ID INT NOT NULL,
  PRIMARY KEY (courses_ID),
  FOREIGN KEY (teacher_ID) REFERENCES Teachers(teacher_ID)
);

INSERT INTO Courses (courses_ID, courses_Name, teacher_ID)
VALUES (1, 'Mathematics', 1),
       (2, 'Physics', 2),
       (3, 'Chemistry', 3),
       (4, 'Biology', 4),
       (5, 'Computer Science', 5);


CREATE TABLE Students
(
  students_ID INT NOT NULL,
  students_Name VARCHAR(50) NOT NULL,
  PRIMARY KEY (students_ID)
);

INSERT INTO Students (students_ID, students_Name)
VALUES (1, 'Alice Green'),
       (2, 'Bob White'),
       (3, 'Charlie Black'),
       (4, 'David Yellow'),
       (5, 'Emma Blue');


CREATE TABLE Student_Courses
(
  courses_ID INT NOT NULL,
  students_ID INT NOT NULL,
  FOREIGN KEY (courses_ID) REFERENCES Courses(courses_ID),
  FOREIGN KEY (students_ID) REFERENCES Students(students_ID)
);

INSERT INTO Student_Courses (courses_ID, students_ID)
VALUES (1, 1),  
       (2, 2), 
       (3, 3),  
       (4, 4),  
       (5, 5),  
       (1, 2),  
       (3, 1),  
       (5, 3); 

