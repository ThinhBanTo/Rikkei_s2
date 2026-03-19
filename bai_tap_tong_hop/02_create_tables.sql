create table Genres(
    genre_id serial primary key ,
    genre_name varchar(100) not null unique ,
    genre_desc text
);
create table Authors(
    author_id serial primary key ,
    author_name varchar(20) not null ,
    bio text
);

create table Members(
    member_id serial primary key ,
    name varchar(100) not null ,
    email varchar(50) unique ,
    birth_date date ,
    address text,
    state varchar(20) default 'active',
    join_date date not null
);

create table Books(
    book_id serial primary key ,
    isbn varchar(15) not null unique ,
    title text not null ,
    pub_year int not null ,
    copy_amount int not null ,
    copy_current int not null,
    genre_id int not null
);
--lay bang authors_books trung gian
create table Authors_Books
(
    author_id int not null,
    book_id int not null,
    PRIMARY KEY (author_id, book_id)
);

create table Tickets(
    ticket_id serial primary key ,
    borrow_date date not null ,
    due_date date not null ,
    return_date date ,
    member_id int not null
);
--Lay bang trung gian Tickets-Books
create table TicketDetails(
    book_id int not null ,
    ticket_id int not null ,
    PRIMARY KEY (book_id,ticket_id)
);




