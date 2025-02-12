create database LibraryDatabaseManagementSystem;
use LibraryDatabaseManagementSystem

CREATE TABLE Library_Staff (
  ID INT PRIMARY KEY identity,
  Name VARCHAR(100) NOT NULL,
  Contact VARCHAR(100) NOT NULL,
  Assigned_Section VARCHAR(100) NOT NULL,
  Employment_date DATE NOT NULL
);



INSERT INTO Library_Staff ( Name, Contact, Assigned_Section, Employment_date) VALUES
( 'James Bond', 'bond@example.com', 'Circulation', '2020-01-15'),
( 'Natasha Romanoff', 'natasha@example.com', 'Reference', '2019-02-20'),
( 'Peter Parker', 'peter@example.com', 'Children', '2021-03-10'),
( 'Clark Kent', 'clark@example.com', 'Technical Services', '2018-04-05'),
( 'Bruce Wayne', 'bruce@example.com', 'Administration', '2022-05-22');


CREATE TABLE Books (
  ID INT PRIMARY KEY identity,
  Tittle VARCHAR(100) NOT NULL,
  Author VARCHAR(100) NOT NULL,
  Genre VARCHAR(100) NOT NULL,
  Publication_year VARCHAR(100) NOT NULL,
  Status VARCHAR(100) NOT NULL,
);

INSERT INTO Books (Tittle, Author, Genre, Publication_Year, Status) VALUES
( 'To Kill a Mockingbird', 'Harper Lee', 'Fiction', '1960', 'Available'),
( '1984', 'George Orwell', 'Dystopian', '1949', 'Available'),
( 'The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', '1925', 'Checked Out'),
( 'Moby Dick', 'Herman Melville', 'Adventure', '1851', 'Available'),
( 'War and Peace', 'Leo Tolstoy', 'Historical Fiction', '1869', 'Available');

CREATE TABLE Members (
  ID INT PRIMARY KEY identity,
  Nme VARCHAR(100) NOT NULL,
  Contact VARCHAR(100) NOT NULL,
  Membership VARCHAR(100) NOT NULL,
  Registration DATE NOT NULL,
);

INSERT INTO Members ( Nme, Contact, Membership, Registration) VALUES
( 'Alice Smith', 'alice@example.com', 'Regular', '2023-01-15'),
( 'Bob Johnson', 'bob@example.com', 'Premium', '2023-02-20'),
( 'Charlie Brown', 'charlie@example.com', 'Regular', '2023-03-10'),
( 'Diana Prince', 'diana@example.com', 'Premium', '2023-04-05'),
( 'Ethan Hunt', 'ethan@example.com', 'Regular', '2023-05-22');





CREATE TABLE Financial_fines (
  ID INT PRIMARY KEY identity ,
  Amount INT,
  Payment_status_ VARCHAR(100),
  MembersID int unique ,
  FOREIGN KEY (MembersID) REFERENCES Members(ID),
);

CREATE TABLE Borrowing (
  ID INT PRIMARY KEY identity,
  Borrowing_ DATE NOT NULL,
  Due_date DATE NOT NULL,
  return_date DATE NOT NULL,
  BooksID int,
  MembersID int ,
  Financial_finesID int ,
  FOREIGN KEY (BooksID) REFERENCES Books(ID),
  FOREIGN KEY (MembersID) REFERENCES Members(ID),
  FOREIGN KEY (Financial_finesID) REFERENCES Financial_fines(ID),
);

INSERT INTO Borrowing (Borrowing_, Due_date, return_date, BooksID, MembersID, Financial_finesID) VALUES
('2023-01-20', '2023-02-20', '2023-02-20', 5, 2, 2),
('2023-02-10', '2023-03-10', '2023-03-01', 4, 2, 2),
('2023-03-15', '2023-04-15', '2023-03-20', 3, 3, 3),
('2023-04-01', '2023-05-01', '2023-04-25', 2, 4, 4),
('2023-05-05', '2023-06-05', '2023-05-20', 1, 5, 5);


INSERT INTO Financial_fines ( Amount, Payment_status_, MembersID) VALUES
( 5, 'Unpaid',1),
( 10, 'Paid',2),
( 25, 'Unpaid',3),
( 15, 'Paid',4),
( 75, 'Unpaid',5);

CREATE TABLE Reservation (
  ID INT PRIMARY KEY identity,
  Resernation DATE ,
  Status VARCHAR(100) ,
 BooksID int,
 MembersID int ,
 FOREIGN KEY (BooksID) REFERENCES Books(ID),
 FOREIGN KEY (MembersID) REFERENCES Members(ID), 
);



INSERT INTO Reservation ( Resernation, Status, BooksID, MembersID) VALUES
( '2023-01-10', 'Active', 1, 1),
( '2023-02-15', 'Completed', 2, 2),
( '2023-03-20', 'Active', 3, 3),
( '2023-04-25', 'Cancelled', 4, 4),
( '2023-05-30', 'Active', 5, 5);


CREATE TABLE Categories (
  ID INT PRIMARY KEY identity,
  Name VARCHAR(100) NOT NULL,
  Description VARCHAR NOT NULL,
);



INSERT INTO Categories ( Name, Description) VALUES
( 'Fiction', 'Literary works based on the imagination'),
( 'Non-Fiction', 'Informative works based on facts'),
( 'Dystopian', 'Fiction set in a repressive society'),
( 'Adventure', 'Works that feature exciting journeys'),
( 'Historical Fiction', 'Fiction set in the past');


CREATE TABLE Books_Categories (
  ID INT PRIMARY KEY identity,
  BooksID int,
  CategoriesID int,
  FOREIGN KEY (BooksID) REFERENCES Books(ID),
  FOREIGN KEY (CategoriesID) REFERENCES Categories(ID)
);


INSERT INTO Books_Categories ( BooksID, CategoriesID) VALUES
( 1, 5),
( 2, 4),
( 3,  3),
( 4,2),
(5,1);







select * from 
Members where
Registration = '2023-01-15' ;



select * from
Books where Tittle = 'To Kill a Mockingbird' ;




alter table Members add Email varchar(100);




insert into Members ( Nme, Contact, Membership, Registration, Email ) 
VALUES( 'farah hatsuk', 'farah@example.com', 'Premium', '2023-05-03','farah@example.com');




select *
from Members
inner join Reservation on Members.ID = Reservation.MembersID;




select Members.Nme 
from Members 
inner join Borrowing on Members.ID = Borrowing.MembersID
inner join Books on Borrowing.BooksID = Books.ID
where Books.Tittle = 'To Kill a Mockingbird' ;




INSERT INTO Borrowing (Borrowing_, Due_date, return_date, BooksID, MembersID, Financial_finesID) VALUES
('2023-01-20', '2023-02-20', '2023-02-21', 5, 2, 2);

select Members.Nme
from Members
inner join Borrowing on Members.ID = Borrowing.MembersID
where Borrowing.return_date > Borrowing.Borrowing_ ;





INSERT INTO Borrowing (Borrowing_, Due_date, return_date, BooksID, MembersID, Financial_finesID) VALUES
('2023-01-20', '2023-02-20', '2023-02-21', 5, 2, 2),
('2023-01-20', '2023-02-20', '2023-02-21', 5, 2, 2),
('2023-01-20', '2023-02-20', '2023-02-21', 5, 2, 2);

select BooksID , Books.Tittle
from Books
inner join Borrowing on Borrowing.BooksID= Books.ID

select Books.Tittle , count(Borrowing.ID) as CountBorrow 
from Books
inner join Borrowing on Books.ID = Borrowing.BooksID
group by Books.Tittle
having count(Borrowing.ID) > 3; 




select Members.Nme
from Members
inner join Borrowing on Members.ID = Borrowing.MembersID
where Borrowing.Borrowing_ between '2024-01-01' and  '2024-01-10';





select count(*) as totalBooks 
from Books 
where Books.Status= 'Available' ;