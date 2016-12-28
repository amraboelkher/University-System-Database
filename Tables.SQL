/*
*
* author : Amr AboElKher
*
*/
CREATE TABLE Department
(
  Department_ID INT NOT NULL,
  Name varchar(20) NOT NULL,
  PRIMARY KEY (Department_ID)
);
CREATE TABLE Professor
(
  first_name varchar(20) NOT NULL,
  last_name varchar(20) NOT NULL,
  salary FLOAT NOT NULL,
  professor_ID INT NOT NULL,
  Department_ID INT NOT NULL,
  PRIMARY KEY (professor_ID),
  FOREIGN KEY (Department_ID) REFERENCES Department(Department_ID)
);
CREATE TABLE Student
(
  Student_ID INT NOT NULL,
  Semester INT NOT NULL,
  GPA FLOAT NOT NULL,
  last_name varchar(20) NOT NULL,
  first_name varchar(20) NOT NULL,
  total_credit INT NOT NULL,
  Department_ID INT NOT NULL,
  PRIMARY KEY (Student_ID),
  FOREIGN KEY (Department_ID) REFERENCES Department(Department_ID)
);

CREATE TABLE Course
(
  Name varchar(30) NOT NULL,
  Course_ID INT NOT NULL,
  credit FLOAT NOT NULL,
  Department_ID INT NOT NULL,
  ProfCoordinator INT ,
  PRIMARY KEY (Course_ID),
  FOREIGN KEY (ProfCoordinator) REFERENCES Professor(professor_ID),
  FOREIGN KEY (Department_ID) REFERENCES Department(Department_ID)
);
CREATE TABLE Class
(
  Class_ID INT NOT NULL,
  professor_ID INT NOT NULL,
  Course_ID INT NOT NULL,
  PRIMARY KEY (Class_ID),
  FOREIGN KEY (professor_ID) REFERENCES Professor(professor_ID),
  FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID)
);



CREATE TABLE Prerequisites
(
  courseId INT NOT NULL,
  requireId INT NOT NULL,
  PRIMARY KEY (courseId, requireId),
  FOREIGN KEY (courseId) REFERENCES Course(Course_ID),
  FOREIGN KEY (requireId) REFERENCES Course(Course_ID)
);

CREATE TABLE ProfessorCourses
(
  professor_ID INT NOT NULL,
  Course_ID INT NOT NULL,
  PRIMARY KEY (professor_ID, Course_ID),
  FOREIGN KEY (professor_ID) REFERENCES Professor(professor_ID),
  FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID)
);

CREATE TABLE enrolls_in
(
  Course_ID INT NOT NULL,
  Student_ID INT NOT NULL,
  PRIMARY KEY (Course_ID, Student_ID),
  FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID),
  FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID)
);

CREATE TABLE attends
(
  Student_ID INT NOT NULL,
  Class_ID INT NOT NULL,
  PRIMARY KEY (Student_ID, Class_ID),
  FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID),
  FOREIGN KEY (Class_ID) REFERENCES Class(Class_ID)
);



