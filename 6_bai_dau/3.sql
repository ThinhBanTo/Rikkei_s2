create schema sales;
set search_path to sales,public;

create table Customers (
    customer_id serial primary key,
    first_name varchar(50) not null ,
    last_name varchar(50) not null ,
    email varchar(255) not null unique ,
    phone varchar(20)
);

create table Products(
    product_id serial primary key,
    product_name varchar(100) not null ,
    price real not null ,
    stock_quantity int not null
);

create table Orders(
    order_id serial primary key ,
    order_date date not null ,
    customer_id int not null , foreign key (customer_id) references Customers(customer_id)
);

create table OrderItems(
    order_item_id serial primary key ,
    quantity int check(quantity>=1),
    order_id int not null , foreign key (order_id) references Orders(order_id),
    product_id int not null , foreign key (product_id) references Products(product_id)
);