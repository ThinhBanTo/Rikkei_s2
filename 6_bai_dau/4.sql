create schema elearning;
set search_path to elearning,public;

create table Students(
    student_id serial primary key ,
    first_name varchar(50) not null ,
    last_name varchar(50) not null ,
    email varchar(255) not null unique
);

create table Instructors (
    instructor_id serial primary key ,
    first_name varchar(50) not null ,
    last_name varchar(50) not null ,
    email varchar(255) not null unique
);

create table Courses(
    course_id serial primary key ,
    course_name varchar(100) not null ,
    instructor_id int not null , foreign key (instructor_id) references Instructors(instructor_id)
);

create table Enrollments (
    enrollment_id serial primary key ,
    student_id int not null , foreign key (student_id) references Students(student_id),
    course_id int not null ,foreign key (course_id) references Courses(course_id),
    enroll_date date not null
);

create table Assignments(
    assignment_id serial primary key ,
    course_id int not null , foreign key (course_id) references Courses(course_id),
    title varchar(100) not null ,
    due_date date not null
);

create table Submissions(
    submission_id serial primary key ,
    assignment_id int not null ,foreign key (assignment_id) references Assignments(assignment_id),
    student_id int not null ,foreign key (student_id) references Students(student_id),
    submission_date date not null ,
    grade real check(grade between 0 and 100)
);

