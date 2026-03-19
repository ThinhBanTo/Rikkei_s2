create schema shop;
SET search_path TO shop, public;

create table users (
                       user_id serial primary key,
                       username varchar(50) unique not null,
                       email varchar(100) unique not null,
                       password varchar(100) not null,
                       role varchar(20) check(role IN ('Customer','Admin'))
);

create table categories (
                            category_id SERIAL PRIMARY KEY,
                            category_name VARCHAR(100) UNIQUE NOT NULL
);

create table Products (
                          product_id SERIAL PRIMARY KEY,
                          product_name VARCHAR(100) NOT NULL,
                          price NUMERIC(10,2) CHECK (price > 0),
                          stock INT CHECK (stock >= 0),

                          category_id int,
                          foreign key (category_id) references Categories(category_id)
);

create table Orders(
                       order_id SERIAL PRIMARY KEY,
                       user_id INT,
                       foreign key (user_id) references Users(user_id),
                       order_date DATE NOT NULL,
                       status VARCHAR(20) CHECK (status IN ('Pending','Shipped','Delivered','Cancelled'))
);

create table OrderDetails (
                              order_detail_id SERIAL PRIMARY KEY,
                              order_id int,
                              foreign key (order_id) references Orders(order_id),
                              product_id int, foreign key (product_id) references Products(product_id),
                              quantity int check(quantity>0),
                              price_each numeric(10,2) check(price_each>0)
);

create table Payments(
                         payment_id serial primary key,
                         order_id int unique , foreign key (order_id) references Orders(order_id),
                         payment_date date not null,
                         method varchar(30) CHECK (method IN ('Credit Card','Momo','Bank Transfer','Cash'))
);