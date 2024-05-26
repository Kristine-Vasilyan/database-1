create database Tourist_Agency
use Tourist_Agency

create table Customer(
	Cus_ID int identity(1,1),
	Cus_Name varchar(100) not null,
	Birthdate date not null,
	Constraint PK_Customer Primary Key(Cus_ID))

create table Passport(
	Pass_Number varchar(25) Unique,
	Cus_ID int ,
	S_date date not null,
	E_date date not null,
	Constraint PK_Passport Primary Key(Pass_Number,Cus_ID),
	Constraint FK_Cus_ID Foreign Key(Cus_ID) 
	References Customer(Cus_ID))

create table Visa(
	Country varchar(25),
	Visa_type varchar(25),
	Price money not null,
	Constraint PK_Visa Primary Key(Country, Visa_type))

create table Trip(
	Cus_ID int,
	Dep_day date,
	Country varchar(25) not null,
	Visa_type varchar(25) not null,
	Day_price money not null,
	Day_count int not null,
	Transport_price money not null,
	Constraint PK_Trip Primary Key(Cus_ID, Dep_day),
	Constraint FK_Trip_Visa Foreign Key(Country ,Visa_type) 
	References Visa(Country,Visa_type),
	Constraint FK_Trip_Cus Foreign Key(Cus_ID)
	References Customer(Cus_ID))

---inserts------------------
insert into Customer(Cus_Name,Birthdate )
values 
('Aram Karapetyan Armeni','19970515'),
('Karine Martirosyan Arami','20001218'),
('Hovhannes Hovhannisyan Ashoti','19700314'),
('Petros Poghosyan Daviti','19991231')

insert into Passport(Cus_ID, Pass_Number,S_date, E_date)
values 
(1, 'AR1112223','20180212','20280212'),
(2, 'AK1122223','20130311','20230313'),
(3, 'AM1112323','20200201','20250215'),
(4, 'AR1552223','20180212','20220212'),
(4, '4577695122','20210310','20280212'),
(2, 'C04627109','20200315','20300315')
 
 insert into Visa(Country, Visa_type, Price)
 values 
 ('USA', 'Student',20),
 ('USA', 'Tourist', 30),
 ('Germany', 'Student', 25),
 ('Germany', 'Medical', 35),
 ('Spain', 'Tourist', 30),
 ('France', 'Tourist', 40),
 ('Italy', 'Tourist', 30),
 ('Greece', 'Tourist', 30)

insert into Trip(Cus_ID, Dep_day, Country, Visa_type, Day_price, Day_count, Transport_price)
values 
(1,'20200315','Germany', 'Medical',30,30,200),
(2,'20221203', 'Italy','Tourist', 30, 5, 300), 
(3, '20230320', 'Germany', 'Student',20,30,200),
(1,'20230115','USA','Tourist',30,20,1000),
(3,'20221203', 'Italy','Tourist', 30, 5, 200),
(2, '20201115','USA', 'Tourist', 30,15,800),
(4,'20220813', 'Greece','Tourist', 40, 10, 120),
(4, '20230126', 'France', 'Tourist', 40,7,200),
(3, '20230126', 'France', 'Tourist', 40,7,150)


