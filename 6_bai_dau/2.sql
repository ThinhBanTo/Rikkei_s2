create schema university;
set search_path to university,public; --tu dong vao schema university

create table Students(
    student_id serial primary key,
    first_name varchar(50) not null,
    last_name varchar(50) not null ,
    birth_date date,
    email text not null unique
);

create table Courses(
    course_id serial primary key,
    course_name varchar(100) not null ,
    credits int
);

create table Enrollments (
    enrollment_id serial primary key,
    student_id int not null, foreign key (student_id) references Students(student_id),
    course_id int not null, foreign key (course_id) references Courses(course_id),
    enroll_date date
);
