/*
*
* inserting some data
*
*/ 
alter table Department ADD UNIQUE(Department_ID)

INSERT INTO `Department`(`Department_ID`, `Name`) VALUES (1 , "Computer");

INSERT INTO `Department`(`Department_ID`, `Name`) VALUES (2 , "Communication");

INSERT INTO `Professor`(`first_name`, `last_name`, `salary`, `professor_ID`, `Department_ID`) VALUES ("tom" , "tom" , 22 , 1 , 1);

INSERT INTO `Professor`(`first_name`, `last_name`, `salary`, `professor_ID`, `Department_ID`) VALUES ("Chris" , "Jerico" , 3333.8 , 2 , 2);

INSERT INTO `Student`(`Student_ID`, `Semester`, `GPA`, `last_name`, `first_name`, `total_credit`, `Department_ID`) VALUES (123 , 1 , 3.8 , "Ahmed" , "Mohamed" , 21 , 1);

INSERT INTO `Student`(`Student_ID`, `Semester`, `GPA`, `last_name`, `first_name`, `total_credit`, `Department_ID`) VALUES (1234 , 3 , 3.7 , "mohamed" , "ahmed" , 33 , 2);

INSERT INTO `Course`(`Name`, `Course_ID`, `credit`, `Department_ID`, `ProfCoordinator`) VALUES ("Mathematics" , 1 , 3 , 1 , 1)

INSERT INTO `Class`(`Class_ID`, `professor_ID`, `Course_ID`) VALUES (1 , 1 , 1)

INSERT INTO `Course`(`Name`, `Course_ID`, `credit`, `Department_ID`, `ProfCoordinator`) VALUES ("Artificial intelligence" , 2 , 3 , 1 , 1)

INSERT INTO `Course`(`Name`, `Course_ID`, `credit`, `Department_ID`, `ProfCoordinator`) VALUES ("Mathematics2" , 3 , 3 , 1 , 1);

INSERT INTO `attends`(`Student_ID`, `Class_ID`) VALUES (3 , 1)

INSERT INTO `attends`(`Student_ID`, `Class_ID`) VALUES (123 ,1)

INSERT INTO `Prerequisites`(`courseId`, `requireId`) VALUES (3,2);

INSERT INTO `enrolls_in`(`Course_ID`, `Student_ID`) VALUES (1 , 123);

INSERT INTO `enrolls_in`(`Course_ID`, `Student_ID`) VALUES (2 , 3);

INSERT INTO `enrolls_in`(`Course_ID`, `Student_ID`) VALUES (2 , 123 )




/*
*
* retrieving some data 
*
*/ 
create table Dep_1 
	select * from Student where Student.Department_ID = 1;

select * from Student where 
	Student.Student_ID IN (select Student_ID AS id from enrolls_in WHERE Course_ID = 2) 
   AND Student.Department_ID = 1;

SELECT * FROM `Professor` having salary > 220;

SELECT count(Student_ID) , Student_ID from 
	enrolls_in GROUP BY Student_ID;

