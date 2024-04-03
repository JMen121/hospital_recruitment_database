CREATE DATABASE foundation_assessment_i;
USE foundation_assessment_i;


create table students(
Student_ID integer primary key,
Forename varchar (50) not null,
Surname  varchar (50) not null
);

create table exams(
Exam_ID integer primary key,
Exam_Name varchar (100) not null,
Max_Mark integer not null
);

create table results (
Result_ID integer primary key,
Student_ID integer,
Exam_ID integer,
foreign key (Student_ID) references students (Student_ID),
foreign key (Exam_ID) references exams (Exam_ID),
Mark integer not null
);

INSERT INTO students(Student_ID, FORENAME, SURNAME)
VALUES
   (1, "Alice", "Adams"),
   (2, "Belen", "Badillo"),
   (3, "Ciara", "Connelly"),
   (4, "Delia", "Dodds"),
   (5, "Everly", "Evans"),
   (6, "Fabia", "Fahim"),
   (7, "Grace", "Gonzalez")
;

INSERT INTO exams(Exam_ID, Exam_Name, Max_Mark)
VALUES
   (1, "Algorithms", 100),
   (2, "Cyber Security", 80)
;

INSERT INTO results(Result_ID, Student_ID, Exam_ID, Mark)
VALUES
   # the results for the first exam
   (1, 1, 1, 0),
   (2, 2, 1, 62),
   (3, 3, 1, 62),
   (4, 4, 1, 39),
   (5, 5, 1, 98),
   (6, 6, 1, 48),
   (7, 7, 1, 23),
   # the results for the second exam
   (8, 1, 2, 43),
   (9, 2, 2, 68),
   (10, 3, 2, 54),
   (11, 4, 2, 21),
   (12, 5, 2, 68),
   (13, 6, 2, 74),
   (14, 7, 2, 14)
;

-- List everyone who took the algorithim exam
Select s.Forename, s.surname, e.exam_name
From students s
inner join results r
on s.student_id = r.student_id
inner join exams e
on r.exam_id = e.exam_id
where exam_name = 'Algorithms';

