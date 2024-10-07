create database onlinebookstore;
use onlinebookstore;
show tables;
-- drop database onlinebookstore;


create table Customers(
customerID varchar(50) primary key,
firstName varchar(30),
lastName varchar(30),
emailID varchar(30),
password varchar(40),
phone int(10),
country varchar(25),
state varchar(25),
pincode int,
address varchar(50)
);

create table Admins(
adminID varchar (50) primary key,
firstName varchar(30),
lastName varchar(30),
emailID varchar(30),
password varchar(40),
address varchar(50)
);

create table Books(
bookID int primary key,
authorID int,
publisherID int,
title varchar(50),
genre varchar(20),
publicationYear int,
price int
);

create table Authors(
authorID int primary key AUTO_INCREMENT,
firstName varchar(30),
lastName varchar(30)
);

create table Publishers(
publisherID int primary key AUTO_INCREMENT,
country varchar(25)
);

create table Inventory(
bookID int primary key,
totalStock int,
soldStock int
);

create table Orders(
orderID int AUTO_INCREMENT,
customerID varchar(30),
bookID int,
quantity int not null,
total int,
timestamp datetime,
primary key(orderID,customerID,timestamp,bookID)
);

create table Payment(
paymentID int primary key AUTO_INCREMENT,
customerID varchar(30),
paymentInfo int not null
);

create table ContactUs(
id int primary key AUTO_INCREMENT,
firstName varchar(30),
lastName varchar(30),
emailId varchar(30),
message varchar(1000),
timestamp datetime
);


alter table Authors AUTO_INCREMENT=500;
alter table Publishers AUTO_INCREMENT=7000;



-- Foreign key in Books Table
alter table Books add foreign key (authorID) references Authors(authorID);
alter table Books add foreign key (publisherID) references Publishers(publisherID);

-- Foreign key in Inventory
alter table Inventory add foreign key (bookID) references Books(bookID);

-- Foreign keys in Orders
alter table Orders add foreign key (CustomerID) references Customers(customerID);

-- Foreign keys in Payment
alter table Payment add foreign key (customerID) references Customers(customerID);




-- Admins
insert into Admins(adminID,firstName,lastName,emailID,password) values('admin1','Hermoine','Granger','hermoine@gmail.com','abc123');
insert into Admins(adminID,firstName,lastName,emailID,password) values('admin2','Harry','Potter','harry@gmail.com','adv143');


-- Authors
insert into Authors(firstName,lastName) values('Robert','Pattrison');
insert into Authors(firstName,lastName) values('John','Cedric');
insert into Authors(firstName,lastName) values('Peter','Stevenson');
insert into Authors(firstName,lastName) values('Harry','Williamson');
insert into Authors(firstName,lastName) values('Ron','Weaseley');
insert into Authors(firstName,lastName) values('Peter','Straub');
insert into Authors(firstName,lastName) values('Draco','Malfoy');

-- Publishers
insert into Publishers(country) values('UK');
insert into Publishers(country) values('USA');
insert into Publishers(country) values('Australia');

-- Books
insert into Books(bookID,authorID,publisherID,title,genre,publicationYear,price) values(1,500,7000,'Treasure Island','Adventure',1964,350);
insert into Books(bookID,authorID,publisherID,title,genre,publicationYear,price) values(2,500,7000,'Life of Pi','Adventure',2001,230);
insert into Books(bookID,authorID,publisherID,title,genre,publicationYear,price) values(3,506,7001,'Shadow House','Horror',2005,215);
insert into Books(bookID,authorID,publisherID,title,genre,publicationYear,price) values(4,506,7001,'Ghost Story','Horror',1976,750);
insert into Books(bookID,authorID,publisherID,title,genre,publicationYear,price) values(5,505,7001,'The Grownup','Horror',2009,800);
insert into Books(bookID,authorID,publisherID,title,genre,publicationYear,price) values(6,505,7001,'Gone Girl','Mystery',2014,450);
insert into Books(bookID,authorID,publisherID,title,genre,publicationYear,price) values(7,502,7001,'Paper Town','Mystery',2016,500);
insert into Books(bookID,authorID,publisherID,title,genre,publicationYear,price) values(8,502,7001,'In the Stars','Romance',2019,600);
insert into Books(bookID,authorID,publisherID,title,genre,publicationYear,price) values(9,503,7001,'Black and White love','Romance',2020,800);
insert into Books(bookID,authorID,publisherID,title,genre,publicationYear,price) values(10,503,7001,'Ugly Love','Romance',2016,500);
insert into Books(bookID,authorID,publisherID,title,genre,publicationYear,price) values(11,504,7000,'Layla','Mystery',2006,250);
insert into Books(bookID,authorID,publisherID,title,genre,publicationYear,price) values(12,504,7000,'Into the Nature','Adventure',2003,350);
insert into Books(bookID,authorID,publisherID,title,genre,publicationYear,price) values(13,501,7002,'Mysteries of Udolpho','Mystery',1994,950);

-- Inventory
insert into Inventory(bookID,totalStock,soldStock) values(1,100,0);
insert into Inventory(bookID,totalStock,soldStock) values(2,100,0);
insert into Inventory(bookID,totalStock,soldStock) values(3,100,0);
insert into Inventory(bookID,totalStock,soldStock) values(4,100,0);
insert into Inventory(bookID,totalStock,soldStock) values(5,100,0);
insert into Inventory(bookID,totalStock,soldStock) values(6,100,0);
insert into Inventory(bookID,totalStock,soldStock) values(7,100,0);
insert into Inventory(bookID,totalStock,soldStock) values(8,100,0);
insert into Inventory(bookID,totalStock,soldStock) values(9,100,0);
insert into Inventory(bookID,totalStock,soldStock) values(10,100,0);
insert into Inventory(bookID,totalStock,soldStock) values(11,100,0);
insert into Inventory(bookID,totalStock,soldStock) values(12,100,0);
insert into Inventory(bookID,totalStock,soldStock) values(13,100,0);


select*from Admins;
select*from Customers;
select*from Authors;
select*from Publishers;
select*from Inventory;
select*from Books;
select*from Orders;
select*from Payment;
select*from ContactUs;

-- Login Customers
select*from Admins
where adminID="and passwaord =";

-- Login Admins
select*from Customers
where customerID ="and password =";

-- Get Book,Authors Information from Books and Authors Table
select b.bookID,a.authorID,b.publisherID,b.title,b.genre,b.publicationYear,b.price,a.firstName,a.lastName
from Books as b inner join Authors as a on b.authorID=a.authorID
order by bookID;

-- Display book,author,publishers details from Books,Authors and Publishers table by booksID
select b.bookID,b.title,b.genre,b.price,b.publicationYear,a.firstName,a.lastName,p.country
from Books as b
join Authors as a on b.authorID=a.authorID
join Publishers as p on b.publisherID=p.publisherID
where b.bookID='';

-- get distinct genre from Books Table
select distinct genre from Books;

-- Select PublisherID from country in Publishers Table
select publisherID from Publishers 
where country='';

-- select authorID from Authors name in Authors Table
select authorID from Authors
where firstName=''and lastName='';

-- Count number of books published by author
select count(authorID) from Books where authorID='';

-- count number of books published by a specific country
select count(authorID) from Books where publisherID='';

-- Display book stock from Inventory table
select b.bookID,b.title,i.totalStock,i.soldStock
from Books as b,Inventory as i where b.bookID=i.bookID;

-- Display books price,id and title from Books table
select bookID,price,title from Books where bookID='';

-- Search books by book title
Select b.bookID,a.authoeID,b.publisherID,b.title,b.genre,b.publicationYear,b.price,a.firstName,a.lastName
from Books as b,Authors as a
where title LIKE '% %' and b.authorID=a.authorID;

-- Serach books by book author's first name
select b.bookID,a.authorID,b.publisherID,b.title,b.genre,b.publicationYear,b.price,a.firstName,a.lastName
from Books as b,Authors as a
where a.firstName LIKE '% %' and b.authorID=a.authorID;

-- Search books by book author's lastname
select b.bookID,a.authorID,b.publisherID,b.title,b.genre,b.publicationYear,b.price,a.firstName,a.lastName
from Books as b,Authors as a
where a.lastName LIKE '% %' and b.authorID=a.authorID;

-- Search books by book genre
select b.bookID,a.authorID,b.publisherID,b.title,b.genre,b.publicationYear,b.price,a.firstName,a.lastName
from Books as b,Authors as a
where b.genre LIKE '% %' and b.authorID=a.authorID;

-- Display admin account
select*from Admins where adminID='';

-- Display customer account
select*from Customers where customerID='';

-- Display all orders in admin account
select o.orderID,O.customerID,o.bookID,b.title,o.quantity,o.total,o.timestamp
from orders as o,Books as b
where o.bookID=b.bookID order by orderID;

-- Display orders by userID
select o.bookID,b.title,o.quantity,o.total,o.timestamp
from Orders as o,Books as b
where o.bookID=b.bookID and o.customerID='geervani'


-- Register Customers 
INSERT INTO Customers(customerID,firstName,lastName,emailID,password,phone,country,state,address)
VALUES('','','','','','','','','');
 
-- Insert new country in Publisher Table
INSERT INTO Publishers(country) VALUES('');

-- Insert new author in Authors Table
INSERT INTO Authors(firstName,lastName) VALUES('','');

-- Insert book on Books Table
INSERT INTO Books(bookID,authorID,publisherID,title,genre,publicationYear,price)
VALUES ('','','','','','','');

-- Insert book stock in Inventory table
INSERT INTO Inventory(bookID,totalStock,soldStock) values('','','');

-- Insert into contact us form
INSERT INTO ContactUs(firstName,lastName,emailID,message,timestamp)
values('','','','','');

-- Insert Orders
INSERT INTO Orders(customerID,bookID,quamtity,total,timestamp)
VALUES('','','','','');

-- Insert Payments
INSERT INTO Payment(customerID,paymentInfo)
VALUES('','');



-- Update Book Price in Books Table
UPDATE Books SET price='' where bookID='' and authorID='' and publisherID='' and price='';

-- Update sold books in Inventory table
UPDATE Inventory set soldStock = soldStock + '' where bookID ='';

-- Update total books in Inventory table
UPDATE Inventory set totalStock = tatalStock-'' where bookID ='';


-- Delete author from Authors Table
DELETE FROM Authors where authorID='';

-- Delete publisher country from Publishers table
DELETE FROM Publishers where publisherID='';

-- Delete book stock from Inventory table
DELETE FROM Inventory where bookID='';

--  Delete books from Books table
DELETE FROM books where bookID='';

select customerID,phone,country,state,pincode,adminID,phone
from Customers
inner join Admins
on Customers.customerID=Admins.adminID;

select customerID,phone,country,state,pincode,adminID,phone
from Customers
left join Admins
on Customers.customerID=Admins.adminID;

select customerID,phone,country,state,pincode,adminID,phone
from Customers
right join Admins
on Customers.customerID=Admins.adminID;

select customerID,phone,country,state,pincode,adminID,phone
from Customers
cross join Admins
on Customers.customerID=Admins.adminID;

select customerID,phone,country,state,pincode,adminID,phone
from Customers
left join Admins
on Customers.customerID=Admins.adminID
UNION
select customerID,phone,country,state,pincode,adminID,phone
from Customers
right join Admins
on Customers.customerID=Admins.adminID

create view Customerview
as
select Customers.customerID,Customers.country,Customers.state,Customers.pincode,Admins.adminID
from Customers
inner join Admins
on Customers.customerID=Admins.adminID
order by customerID;
-- -----------------------------------------------------Transaction--------------------------------------------------------------------------------

call temp()

delimiter $$
create procedure temp()
begin
   declare _rollback bool default 0;
   declare continue handler for 1051 set _rollback=1;
   declare continue handler for 1048 set _rollback=1;
   declare continue handler for sqlexception set _rollback=1;
   start transaction;
       INSERT into Orders(customerID,bookID,quantity,total,timestamp) values('','','','','');
        UPDATE Inventory set soldStock = soldStock + '' where bookID = '';
        UPDATE Inventory set totalStock = totalStock + '' where bookID = '';
        INSERT into Payment(customerID,paymentInfo) values ('',''); --  throws error if pyamentInfo is incorrect
		if _rollback = 1 then
			rollback;
		else
			commit;
		end if;
END $$
DELIMITER ;
   
delimiter $$
create procedure iinprocedure(in id int)
begin
   select * from Inventory
    where bookID=id;
end $$
delimiter ;

call inprocedure(5);


































































 




































