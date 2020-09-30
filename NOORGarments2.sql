

create Database NG
use NG

/*
-----------------------
TABLE CREATION PORTION

-----------------------*/

/*DONE*/
CREATE TABLE Client (
  Cl_id int Primary Key,
  Cl_name varchar(30) Not null,
  Cl_phone varchar(50),
);

/*DONE*/
CREATE TABLE Company (
  C_ID int PRIMARY KEY,
  C_name varchar(30),
  C_address varchar(70)
);

/*DONE*/
CREATE TABLE belong (
  ID int Primary Key,
  Client_id int Foreign Key references Client(Cl_id),
  Company_ID int Foreign Key references Company(C_ID)
);

/*DONE*/
CREATE TABLE [ORDER] (
  Order_no int Primary Key,
  ID int Foreign Key references belong(ID),
  [Due_date] DATE
  );

/*DONE*/
CREATE TABLE Products(
  P_iD int Primary Key,
  P_name varchar(40),
  P_price int
  );

/*DONE*/  
CREATE TABLE Order_itm (
  o_id int Primary Key,
  Product_ID int Foreign Key references Products(P_iD),
  Order_no int Foreign Key references [ORDER](Order_no),
  QTY int,
  COLOR varchar(40)
  );

/*DONE*/
CREATE TABLE Cloth (
  CLoth_id int PRIMARY KEY,
  Clot_type varchar(40),
  Clot_size int,
  Clot_color varchar(40)
);

/*DONE*/
CREATE TABLE [Raw] (
  R_id int Primary Key,
  ProductID int foreign key references Products(P_iD),
  CLoth_id int foreign key references Cloth(CLoth_id),
  R_name varchar(30),
);

/*DONE*/
CREATE TABLE Workers(
  W_ID int Primary Key,
  W_name varchar(40),
  W_phone varchar(50),
  W_Address varchar(50)
  );

/*DONE*/
CREATE TABLE Payment_Master(
  Pay_slip int Primary Key,
  Worker_ID int foreign key references Workers(W_ID),
  [Date] Date
);


/*DONE*/
CREATE TABLE Payment_Detail (
  serial_no int Primary Key,
  Pay_slip int foreign key references Payment_Master(Pay_slip),
  Product_iD int foreign key references Products(P_iD),
  Payment int
);

/*DONE*/
CREATE TABLE Sellers(
  Seller_id int Primary Key,
  Sell_name varchar(50),
  Sell_phone varchar(30),
  Sell_address varchar(50)
);

/*DONE*/
CREATE TABLE purchase_master (
  p_id int Primary Key,
  seller_id int foreign key references Sellers(Seller_id),
  [Date] Date
);

/*DONE*/
CREATE TABLE Purchase_detail(
  [NO] int Primary key, 
  Purchase_no int foreign key references purchase_master(p_id),
  Raw_id int foreign key references [Raw](R_id),
  QTY int,
  Actual_price int,
  Saled_price int
);


/*DONE*/
CREATE TABLE Created (
  batch_no int Primary Key,
  Worker_ID int Foreign Key references Workers(W_ID),
  Product_iD int Foreign Key references Products(P_iD),
  Order_id int Foreign Key references [ORDER](Order_no),
  QTY int,
  [Date] Date
);

/*DONE*/
CREATE TABLE Locations(
  L_ID int Primary Key,
  Location varchar(50),
  price int
);

/*DONE*/
CREATE TABLE Given_material (
  serial_no int Primary Key,
  Raw_ID int Foreign Key references [Raw](R_id),
  Worker_ID int Foreign Key references Workers(W_ID),
  Raw_QTY int,
  [Date] Date
);

/*DONE*/
CREATE TABLE Transport(
  T_ID int PRIMARY key,
  T_name varchar(40),
  Location_ID int Foreign Key references Locations(L_ID),
  Worker_ID int Foreign Key references Workers(W_ID)
  );


/*DONE*/
CREATE TABLE Delivery(
  Delivery_no int Primary key,
  Transport_ID int Foreign Key references Transport(T_ID),
  CLient_ID int Foreign Key references belong(ID),
  Order_no int Foreign Key references [ORDER](Order_no),
  [Date] Date,
  Deliver_Status varchar(40)
);



/*DONE*/
CREATE TABLE Sales_Master (
  Sales_ID int Primary Key,
  Order_no int Foreign Key references [ORDER](Order_no),
  [Date] DATE,
  price int
  );

  Alter table Client
  Alter column Cl_phone varchar(12)

  Alter table Cloth
  Drop column Clot_size


create table STOCK(
RAWID int foreign key references [RAW](R_id),
RawStock int,
QTY int
);
alter table STOCK
drop column RawStock

/*
-----------------------
HISTORY TABLE PORTION

-----------------------*/


/*
-----------------------
DATA INSERTION PORTION 

-----------------------*/

/*first the Tables that dont require any FOREIGN KEYS*/
/*INSERTED*/
insert into Client values(1,'Ameen shafiq','0320-2134299');
insert into Client values(2,'Muhammad Asif','0300-5213573');
insert into Client values(3,'Arshad Mehmood','0302-984766');
insert into Client values(4,'Waseem Akram','0333-1110122');
insert into Client values(5,'Altaf Hussain','0303-2097391');
insert into Client values(6,'Iqbal Muneeer','0321-3634113');
insert into Client values(7,'Kareem Hussain','0301-0998877');
insert into Client values(8,'Wasif Akhtar','0301-0113327');
insert into Client values(9,'Aqeel Hafeez','0310-0228810');
insert into Client values(10,'Sajid Mayo','0311-1380021');

/*INSERTED*/
Insert into belong values (1,1,2);
Insert into belong values (2,2,2);
Insert into belong values (3,3,5);
Insert into belong values (4,3,7);
Insert into belong values (5,4,9);
Insert into belong values (6,5,8);
Insert into belong values (7,6,1);
Insert into belong values (8,6,5);
Insert into belong values (9,6,4);
Insert into belong values (10,8,1);
Insert into belong values (11,9,10);
Insert into belong values (12,10,3);
Insert into belong values (13,7,6);

/*INSERTED*/
Alter Table Company 
ADD  CITY varchar(30) null


insert into Company values(1,'DAWN BREAD','Industrial Estate,Kot Lakhpat, Lahore');
insert into Company values(2,'DAWN BREAD','Ayub Colony, Faisalabad');
insert into Company values(3,'DAWN BREAD','15 E naseerabad? Peshawar Rd, H-13, Rawalpindi, Islamabad');
insert into Company values(4,'BUNDU KHAN','Tibba, Lahore');
insert into Company values(5,'MORGAN BREAD','Quaid-e-Azam Industrial Estate Quaid e Azam Industrial Estate, Lahore');
insert into Company values(6,'CRUMBZ','1.4 KM Defence Road? Off Raiwand Rd, Lahore');
insert into Company values(7,'MARYGOLD','Quaid-e-Azam Industrial Estate Quaid e Azam Industrial Estate, Lahore');
insert into Company values(8,'SPECIAL','Aiwaan Market, Ferozpur Road, Lahore');
insert into Company values(9,'MERIT','Kala Shakaku, Lahore');
insert into Company values(10,'MERIT','Islah Food, Faisalabad');



/*FUNCTIOON to ENter CIty)*/
create procedure CITY
@id int,
@City varchar(30)
As
	BEGIN
		update Company set CITY=@City where C_ID=@id;
	END
GO
EXEC CITY 4,'Lahore'

Alter Table [ORDER]
Add [Status] varchar(9) NOT NULL

Alter Table [ORDER]
Alter column Completed_Date DATE /*NONE OF CONCERN*/ 

Alter Table [ORDER]              /*NONE OF CONCERN*/
ADD Foreign Key(COMPLETED_DATE) References COMPLETED([DAte])        /*NONE OF CONCERN*/

Alter Table [ORDER]            /*NONE OF CONCERN*/
Drop COnstraint ID

Truncate Table [ORDER]        /*NONE OF CONCERN*/
Drop Table [ORDER]

select * from [ORDER]
sp_rename '[ORDER].Due_date', 'Order_date'

/*INSERTED*/
Insert into [ORDER] values (1,1,'2019-10-01','Completed','2019-10-10');
Insert into [ORDER] values (2,2,'2019-10-11','Completed','2019-10-15');
Insert into [ORDER] values (3,3,'2019-10-17','Completed','2019-10-21');
Insert into [ORDER] values (4,1,'2019-10-20','Completed','2019-10-24');
Insert into [ORDER] values (5,4,'2019-10-25','Completed','2019-11-01');
Insert into [ORDER] values (6,5,'2019-10-30','Completed','2019-11-04');
Insert into [ORDER] values (7,6,'2019-11-03','Completed','2019-11-09');
Insert into [ORDER] values (8,7,'2019-11-03','Completed','2019-11-07');
Insert into [ORDER] values (9,8,'2019-11-04','Completed','2019-11-08');
Insert into [ORDER] values (10,9,'2019-11-07','Completed','2019-11-14');
Insert into [ORDER] values (11,10,'2019-11-08','Completed','2019-11-14');
Insert into [ORDER] values (12,11,'2019-11-09','Completed','2019-11-14');
Insert into [ORDER] values (13,12,'2019-11-10','Completed','2019-11-15');
Insert into [ORDER] values (14,13,'2019-11-10','Completed','2019-11-15');
Insert into [ORDER] values (15,1,'2019-11-10','Completed','2019-11-15');
Insert into [ORDER] values (16,4,'2019-11-17','Completed','2019-11-20');
Insert into [ORDER] values (17,6,'2019-11-18','Completed','2019-11-20');
Insert into [ORDER] values (18,2,'2019-11-20','Completed','2019-11-25');
Insert into [ORDER] values (19,3,'2019-11-23','Completed','2019-11-27');
Insert into [ORDER] values (20,8,'2019-11-23','Completed','2019-11-26');
Insert into [ORDER] values (21,9,'2019-11-25','Completed','2019-11-28');
Insert into [ORDER] values (22,10,'2019-11-27','Completed','2019-11-30');
Insert into [ORDER] values (23,11,'2019-11-30','Completed','2019-12-01');
Insert into [ORDER] values (24,13,'2019-12-02','Completed','2019-12-10');
Insert into [ORDER] values (25,4,'2019-12-10','Pending',nULL);
Insert into [ORDER] values (26,2,'2019-12-11','Pending',nULL);
Insert into [ORDER] values (27,3,'2019-12-12','Pending',nULL);
Insert into [ORDER] values (28,1,'2019-12-13','Pending',nULL);

Create Table COMPLETED(
[DAte] int Primary Key,
Completed_Date date);
DROP Table COMPLETED

select * from [ORDER]

select * from Order_itm
/*INSERTed*/
insert into Order_itm values (1,2,1,500,'RED');
insert into Order_itm values (2,5,1,100,'Blue');
insert into Order_itm values (3,1,1,1600,null);
insert into Order_itm values (4,4,1,50,'RED');
insert into Order_itm values (5,5,2,300,'RED');
insert into Order_itm values (6,2,2,20,'white');
insert into Order_itm values (7,3,2,20,'Black');
insert into Order_itm values (8,1,2,1000,null);
insert into Order_itm values (9,2,3,100,'RED');
insert into Order_itm values (10,3,3,200,'RED');
insert into Order_itm values (11,2,4,100,'Black');
insert into Order_itm values (12,2,5,400,'Black');
insert into Order_itm values (13,4,5,200,'White');
insert into Order_itm values (14,4,6,1000,'White');
insert into Order_itm values (15,7,7,120,NULL);
insert into Order_itm values (16,8,7,10,NULL);

insert into Order_itm values (17,1,8,1600,NULL);
insert into Order_itm values (18,1,9,400,NULL);
insert into Order_itm values (19,1,10,600,NULL);
insert into Order_itm values (20,1,11,800,NULL);
insert into Order_itm values (21,2,12,30,'Black');
insert into Order_itm values (22,4,13,65,'White');
insert into Order_itm values (23,3,14,150,'RED');
insert into Order_itm values (24,4,15,20,'Black');
insert into Order_itm values (25,4,16,164,'White');
insert into Order_itm values (26,1,17,2000,NULL);

insert into Order_itm values (27,1,18,2000,NULL);
insert into Order_itm values (28,1,19,900,NULL);
insert into Order_itm values (29,3,20,540,'RED');
insert into Order_itm values (30,1,21,200,NULL);
insert into Order_itm values (31,8,22,10,NULL);
insert into Order_itm values (32,7,22,15,NULL);
insert into Order_itm values (33,1,23,300,NULL);
insert into Order_itm values (34,2,23,100,'White');
insert into Order_itm values (35,1,24,400,NULL);
insert into Order_itm values (36,5,25,300,'Blue');
insert into Order_itm values (37,4,26,500,'white');
insert into Order_itm values (38,4,27,140,'Black');
insert into Order_itm values (39,4,28,160,'RED');
insert into Order_itm values (40,5,22,160,'RED');

/*INSERTed*/
insert into [Raw] values(1,1,NULL,'BORI');
insert into [Raw] values(2,2,NULL,'Lastic');
insert into [Raw] values(3,2,9,'NET');
insert into [Raw] values(4,2,10,'NET');
insert into [Raw] values(5,2,11,'NET');
insert into [Raw] values(6,3,5,'Cloth');
insert into [Raw] values(7,3,6,'Cloth');
insert into [Raw] values(8,3,7,'Cloth');
insert into [Raw] values(9,3,8,'Cloth');
insert into [Raw] values(10,3,12,'Cloth');
insert into [Raw] values(11,4,5,'Cloth');
insert into [Raw] values(12,4,6,'Cloth');
insert into [Raw] values(13,4,7,'Cloth');
insert into [Raw] values(14,4,8,'Cloth');
insert into [Raw] values(15,4,12,'Cloth');
insert into [Raw] values(16,5,1,'Cloth');
insert into [Raw] values(17,5,2,'Cloth');
insert into [Raw] values(18,5,3,'Cloth');
insert into [Raw] values(19,5,4,'Cloth');
insert into [Raw] values(20,5,5,'Cloth');
insert into [Raw] values(21,6,9,'NET');
insert into [Raw] values(22,6,10,'NET');
insert into [Raw] values(23,6,11,'NET');
insert into [Raw] values(24,7,NULL,'GLoves');
insert into [Raw] values(25,8,NULL,'BAGS');

/*INSERTED*/
Insert into Cloth values(1,'parachute','Red');
Insert into Cloth values(2,'parachute','Blue');
Insert into Cloth values(3,'parachute','Black');
Insert into Cloth values(4,'parachute','White');
Insert into Cloth values(5,'Cotton','White');
Insert into Cloth values(6,'Cotton','Blue');
Insert into Cloth values(7,'Cotton','Black');
Insert into Cloth values(8,'Cotton','White');
Insert into Cloth values(12,'Cotton','RED');
Insert into Cloth values(9,'NET','White');
Insert into Cloth values(10,'NET','Black');
Insert into Cloth values(11,'NET','Red');

/*INSERTED*/
Insert Into Locations values (1,'Lahore',200);
Insert Into Locations values (2,'Islamabad',500);
Insert Into Locations values (3,'Faislabad',400);
Insert Into Locations values (4,'Sialkot',300);
Insert Into Locations values (5,'Pindi',800);

/*INSERTED*/
Insert INto Products values (1,'Taat',8);
Insert INto Products values (2,'Worker Caps(Lastic)',20);
Insert INto Products values (3,'Worker Caps(Band)',30);
Insert INto Products values (4,'Apren(Cotton)',100);
Insert INto Products values (5,'Apren(Parachute)',80);
Insert INto Products values (6,'Masks',20);
Insert INto Products values (7,'Gloves',10);
Insert INto Products values (8,'Bags',5);

Update Products 
SET P_makePrice=10
where P_iD=8

Alter Table Products 
add P_makePrice int

select * from Products

/*INSERTED*/
Insert into Workers values (1,'Shehnaz','0301-4325222','kahna');
Insert into Workers values (2,'Jameel','0300-1124321','Kanakar Road, Gajjumata Sua');
Insert into Workers values (3,'Ganda Gate',NULL,'Gajjumata Sua');
Insert into Workers values (4,'Blue Gate',NULL,'Gajjumata Sua');
Insert into Workers values (5,'Amrood Wale',Null,'Gajjumata Sua');
Insert into Workers values (6,'Sabzi Wale',NULL,'Gajjumata Sua');
Insert into Workers values (7,'Kahna','0322-9887531','Kahna');
Insert into Workers values (8,'Pyaaz wale',NULL,'Gajjumata Sua');
Insert into Workers values (9,'Shehbaz','0302-2239222','Gajjumata Sua');

/*INSERTED*/
Insert into Sellers values (1,'Awais','0305-3900222','Ferozpur road, Kahna, Lahore');
Insert into Sellers values (2,'Bhutta','0322-30422033','Anarkali, Lahore');
Insert into Sellers values (3,'Bhao','0311-9855322','Ferozpur Road, Kahna, Lahore');
Insert into Sellers values (4,'Tariq','0300-1123990','Awaan Market,Ferozpur Road, Lahore');
Insert into Sellers values (5,'Nasir','0333-0998711','Faiasalabad');
Insert into Sellers values (6,'Chima','0305-3900222','Anarkali,Lahore');


/*INSERTED*/
Insert into purchase_master values(1,1,'2019-10-02');
Insert into purchase_master values(2,5,'2019-10-02');
Insert into purchase_master values(3,5,'2019-10-02');
Insert into purchase_master values(4,2,'2019-10-02');
Insert into purchase_master values(5,1,'2019-10-12');
Insert into purchase_master values(6,5,'2019-10-12');
Insert into purchase_master values(7,3,'2019-10-12');
Insert into purchase_master values(8,2,'2019-10-12');
Insert into purchase_master values(9,6,'2019-10-18');
Insert into purchase_master values(10,5,'2019-10-18');
Insert into purchase_master values(11,6,'2019-10-21');
Insert into purchase_master values(12,6,'2019-10-26');
Insert into purchase_master values(13,5,'2019-10-26');
Insert into purchase_master values(14,2,'2019-10-01');
Insert into purchase_master values(15,3,'2019-10-04');
Insert into purchase_master values(16,3,'2019-10-04');
Insert into purchase_master values(17,1,'2019-10-04');
Insert into purchase_master values(18,1,'2019-10-04');
Insert into purchase_master values(19,1,'2019-10-09');
Insert into purchase_master values(20,1,'2019-10-09');
Insert into purchase_master values(21,3,'2019-10-09');
Insert into purchase_master values(22,5,'2019-10-11');
Insert into purchase_master values(23,6,'2019-10-11');
Insert into purchase_master values(24,5,'2019-10-11');
Insert into purchase_master values(25,5,'2019-10-18');
Insert into purchase_master values(26,1,'2019-10-18');
Insert into purchase_master values(27,1,'2019-10-21');
Insert into purchase_master values(28,1,'2019-10-24');
Insert into purchase_master values(29,2,'2019-10-24');
Insert into purchase_master values(30,1,'2019-10-27');
Insert into purchase_master values(31,2,'2019-10-27');
Insert into purchase_master values(32,2,'2019-10-27');
Insert into purchase_master values(33,1,'2019-10-02');
Insert into purchase_master values(34,6,'2019-10-02');
Insert into purchase_master values(35,5,'2019-10-13');
Insert into purchase_master values(36,5,'2019-10-13');
Insert into purchase_master values(37,5,'2019-10-13');
Insert into purchase_master values(38,1,'2019-10-13');
Insert into purchase_master values(39,1,'2019-12-25');

select * from purchase_master

delete from Purchase_detail
insert into Purchase_detail values(1,1,1,250,35,34);
insert into Purchase_detail values(2,2,3,100,2000,1200);
insert into Purchase_detail values(3,3,4,40,1500,1222);
insert into Purchase_detail values(4,4,2,500,1700,1700);
insert into Purchase_detail values(5,5,3,200,1800,1700);
insert into Purchase_detail values(6,6,1,100,500,400);
insert into Purchase_detail values(7,7,2,30,3000,2900);
insert into Purchase_detail values(8,8,7,20,1544,1433);
insert into Purchase_detail values(9,9,3,50,1500,1400);
insert into Purchase_detail values(10,10,21,230,500,500);
insert into Purchase_detail values(11,11,22,250,120,100);
insert into Purchase_detail values(12,12,24,30,150,130);
insert into Purchase_detail values(13,13,14,20,1500,1222);
insert into Purchase_detail values(14,14,9,210,2000,2000);
insert into Purchase_detail values(15,15,19,130,3500,3200);
insert into Purchase_detail values(16,16,20,298,1500,1100);
insert into Purchase_detail values(17,17,2,22,3500,3400);
insert into Purchase_detail values(18,18,1,450,200,200);
insert into Purchase_detail values(19,19,1,150,305,304);
insert into Purchase_detail values(20,20,9,450,325,314);
insert into Purchase_detail values(21,21,11,550,3665,3554);
insert into Purchase_detail values(22,22,10,580,3115,3224);
insert into Purchase_detail values(23,23,12,240,3500,3114);
insert into Purchase_detail values(24,24,15,30,533,433);
insert into Purchase_detail values(25,25,14,20,522,420);
insert into Purchase_detail values(26,26,09,43,522,344);
insert into Purchase_detail values(27,27,24,55,3335,3114);
insert into Purchase_detail values(28,28,25,98,6788,6700);
insert into Purchase_detail values(29,29,21,87,6788,6740);
insert into Purchase_detail values(30,30,14,45,3500,3302);
insert into Purchase_detail values(31,31,11,34,3521,3434);
insert into Purchase_detail values(32,32,10,56,3625,3432);
insert into Purchase_detail values(33,33,1,34,3533,3499);
insert into Purchase_detail values(34,34,1,76,3500,3400);
insert into Purchase_detail values(35,35,3,246,5795,3994);
insert into Purchase_detail values(36,36,4,290,900,800);
insert into Purchase_detail values(37,37,7,300,355,233);
insert into Purchase_detail values(38,38,5,150,322,312);
 
insert into Transport values(1,'Raftar Goods',2,9)
insert into Transport values(2,'Daewoo Goods',3,9)
insert into Transport values(3,'Five Star Goods',3,9)
insert into Transport values(4,'Raftar Goods',5,9)
insert into Transport values(5,'Raftar Goods',3,9)
insert into Transport values(6,'Raftar Goods',3,9)
insert into Transport values(7,'Raftar Goods',2,9)
insert into Transport values(8,'Raftar Goods',4,9)
insert into Transport values(9,'Raftar Goods',2,9)
insert into Transport values(10,'Raftar Goods',1,9)
insert into Transport values(11,'Raftar Goods',2,9)


insert into Given_material values(1,1,2,100,'2019-10-15');
insert into Given_material values(2,2,3,34,'2019-10-20');
insert into Given_material values(3,2,1,24,'2019-10-22');
insert into Given_material values(4,4,3,21,'2019-10-30');
insert into Given_material values(5,4,5,42,'2019-11-07');
insert into Given_material values(6,3,7,12,'2019-11-11');
insert into Given_material values(7,1,2,200,'2019-11-16');
insert into Given_material values(8,1,2,200,'2019-11-20');
insert into Given_material values(9,1,2,150,'2019-11-23');
insert into Given_material values(10,4,4,57,'2019-11-29');
insert into Given_material values(11,4,5,300,'2019-12-01');
insert into Given_material values(12,1,2,13,'2019-12-5');
insert into Given_material values(13,2,5,087,'2019-12-13');
insert into Given_material values(14,2,8,304,'2019-12-16');

/*we will create a stock table as well to save the leftovers */

insert into STOCK values(1,0);
insert into STOCK values(2,0);
insert into STOCK values(3,0);
insert into STOCK values(4,0);
insert into STOCK values(5,0);
insert into STOCK values(6,0);
insert into STOCK values(7,0);
insert into STOCK values(8,0);
insert into STOCK values(9,0);
insert into STOCK values(10,0);
insert into STOCK values(11,0);
insert into STOCK values(12,0);
insert into STOCK values(13,0);
insert into STOCK values(14,0);
insert into STOCK values(15,0);
insert into STOCK values(16,0);
insert into STOCK values(17,0);
insert into STOCK values(18,0);
insert into STOCK values(19,0);
insert into STOCK values(20,0);
insert into STOCK values(21,0);
insert into STOCK values(22,0);
insert into STOCK values(23,0);
insert into STOCK values(24,0);
insert into STOCK values(25,0);


drop table Created

insert into Created values(1,1,2,1,500,'2019-10-16');
insert into Created values (2,3,5,1,100,'2019-10-16');
insert into Created values (3,1,1,1,1600,'2019-10-16');
insert into Created values (4,5,4,1,50,'2019-10-16');
insert into Created values (5,3,3,2,300,'2019-10-20');
insert into Created values (6,3,2,2,20,'2019-10-20');
insert into Created values (7,3,2,2,20,'2019-10-20');
insert into Created values (8,2,1,2,1000,'2019-10-20');
insert into Created values (9,3,2,3,100,'2019-10-22');
insert into Created values (10,4,3,3,200,'2019-10-22');
insert into Created values (11,3,2,4,100,'2019-10-25');
insert into Created values (12,2,2,5,400,'2019-10-26');
insert into Created values (13,3,4,5,200,'2019-10-26');
insert into Created values (14,1,4,6,1000,'2019-10-26');
insert into Created values (15,5,7,7,120,'2019-10-29');
insert into Created values (16,8,8,7,10,'2019-10-29');
insert into Created values (17,5,1,8,1600,'2019-11-01');
insert into Created values (18,1,1,9,400,'2019-11-05');
insert into Created values (19,1,1,10,600,'2019-11-06');
insert into Created values (20,3,1,11,800,'2019-11-09');
insert into Created values (21,4,2,12,30,'2019-11-12');
insert into Created values (22,5,4,13,65,'2019-11-16');
insert into Created values (23,3,3,14,150,'2019-11-20');
insert into Created values (24,7,4,15,20,'2019-11-21');
insert into Created values (25,8,4,16,164,'2019-11-22');
insert into Created values (26,1,1,17,2000,'2019-11-22');
insert into Created values (27,1,1,18,2000,'2019-11-24');
insert into Created values (28,3,1,19,900,'2019-11-26');
insert into Created values (29,2,3,20,540,'2019-11-30');
insert into Created values (30,5,1,21,200,'2019-12-02');
insert into Created values (31,6,8,22,10,'2019-12-04');
insert into Created values (32,6,7,22,15,'2019-12-07');
insert into Created values (33,2,1,23,300,'2019-12-08');
insert into Created values (34,3,2,23,100,'2019-12-10');
insert into Created values (35,5,1,24,400,'2019-12-12');
insert into Created values (36,6,5,25,300,'2019-12-15');
insert into Created values (37,7,4,26,500,'2019-12-16');
insert into Created values (38,3,4,27,140,'2019-12-17');
insert into Created values (39,1,4,28,160,'2019-12-18');

insert into Payment_Master select batch_no,Worker_ID,[Date] from Created
 

insert into Payment_Detail select batch_no,batch_no,Product_iD,(select P_price from Products where Created.Product_iD=Products.P_iD) from Created

select SUM(Payment) as total_Payment from Payment_Detail where Pay_slip IN (select Pay_slip from Payment_Master where Worker_ID = (select W_ID from Workers where W_ID=2 ))


insert into Delivery values (1,1,2,18,'2019-11-25','Delivered');
insert into Delivery values (2,2,2,19,'2019-11-27','Delivered');
insert into Delivery values (3,3,2,20,'2019-11-26','Delivered');
insert into Delivery values (4,4,2,21,'2019-11-28','Delivered');
insert into Delivery values (5,5,2,22,'2019-11-30','Delivered');
insert into Delivery values (6,6,2,23,'2019-12-01','Delivered');
insert into Delivery values (7,7,2,24,'2019-12-10','Delivered');
insert into Delivery values (8,8,2,25,'2019-12-15','ON_route');

/*
create table Transport_co(
id int Primary KEy,
T_name varchar(50),
Loc_ID int foreign Key references Locations(L_ID)
);

insert into Transport_co values(1,'Raftar',3);
insert into Transport_co values(2,'Raftar',2);
insert into Transport_co values(3,'Raftar',1);
insert into Transport_co values(4,'Raftar',5);
insert into Transport_co values(5,'Raftar',4);
*/
/*MUST DROP THE TRANSPORT Table*/

insert into Sales_Master select Order_no,Order_no,Completed_Date,ID from [ORDER] where [ORDER].Status ='Completed' 
/*for early stages iput i used ID just to enter data
this calculation of price in sale will be done at the runtime*/

/*Procedure no 1*/
ALTER Procedure PriceInSalesMaster
@OrdNO int
as
	begin
	  Update Sales_Master set price=( 
	  select SUM(c.SALES) as sales from 
	 (select (a.P_price*b.Quantity) as SALES from  (select P_iD,P_price from Products where P_iD IN(select Product_ID from Order_itm where Order_no=@OrdNO))a
								inner join	
	 (select Product_ID as ProductNO,QTY as Quantity from Order_itm where Order_no = (select Order_no from Sales_Master where Order_no=@OrdNO))b
	 ON a.P_iD=b.ProductNO )c) where Sales_ID=@OrdNO
	end
go

/*Procedure 2(To get the Client who gave order at a certain date)*/
alter procedure GETID
@Day int,
@Month int,
@year int,
@ordr int OUTPUT
as
	BEGIN

		select Cl_name,Cl_phone,C_name,CITY from Client,Company where Cl_id =(select Client_id from belong where ID=(select ID from [ORDER] where order_no=(select order_no from [ORDER] where DAY(Order_date)=@Day and MONTH(Order_date)= @Month and YEAR(Order_date)=@year))) 
		and
		 C_ID=(select Company_ID from belong where ID=(select ID from [ORDER] where order_no=(select order_no from [ORDER] where DAY(Order_date)=@Day and MONTH(Order_date)= @Month and YEAR(Order_date)=@year)))
		set @ordr=(select order_no from [ORDER] where DAY(Order_date)=@Day and MONTH(Order_date)= @Month and YEAR(Order_date)=@year)
		if(@ordr is null)
			print('NO Data exists')
	END
GO
/*Procedure 3 insertion of client*/
create Trigger TG_belongforClient
on Client
after insert
as
	begin
		insert into belong values ((select top 1 ID+1 from belong order by ID Desc),(select top 1 Cl_id from Client order by Cl_id desc),null)
	end


create Trigger TG_belongforboth
on Company
after insert
as 
	begin
		Update belong set Company_ID=(select top 1 C_ID from Company order by C_ID desc) where belong.Client_id=(select top 1 Cl_id from Client order by Cl_id desc)
	end

insert into Sales_Master (Sales_ID,Order_no,Date) values (28,28,GETDATE())
exec PriceInSalesMaster 28
select * from ledger
select * from Sales_Master


alter procedure INclient
@Name varchar(30),
@phone varchar(12),
@CompanyName varchar(30),
@address varchar(40),
@CIty varchar(40)
as
	begin
		
		begin try

		begin transaction
		if(@CompanyName is null)
		begin/*IF*/
			insert into Client values ((select top 1 Cl_id +1 from Client order by Cl_id desc),@Name,@phone)
		end/*IF*/
		else	
		begin/*else*/
			insert into Client values ((select top 1 Cl_id +1 from Client order by Cl_id desc),@Name,@phone)
			insert into Company values((select top 1 C_ID +1 from Company order by C_ID Desc),@CompanyName,@address,@CIty)
		end/*else*/
		commit Transaction
		end try
		begin catch
		print('DATA was not entered')
		rollback transaction
		end catch
	end
go
/*PROCEDURE 4*/
alter procedure showProducts
@orderId int
as
	begin
	select Product_ID,QTY,COLOR from Order_itm where Order_no=@orderId and Product_ID in(select P_iD from Products)
	end
go

/*PROCEDURE 5*/
Alter Procedure MOSTpurchasefromseller
as
begin
select sell_name from Sellers where seller_id=
(select Seller_id from Purchase_Master where P_ID=
(select Purchase_no  from Purchase_detail where saled_price = ( select top 1 saled_Price from Purchase_detail order by Saled_price desc) )
)
end
go
/*Procedure 6*/
Alter Procedure Totalpurchasefromseller
@id int
as
	begin
	select A.Sell_name,M.TOTAL from (select Sell_name,Seller_id from Sellers)A
								inner join	
	(select SUM(Saled_price) as TOTAL from purchase_detail where Purchase_no IN
	(select p_id from Purchase_master where Seller_id=(select seller_id from Sellers where Seller_id=1)))M on A.Seller_id=@id
	end
go

/*Procedure 7(aik worker ne kis order ke against kaam kya ha)*/
Create Procedure getWorker
@id int
As
	begin
		select Order_iD from Created where Worker_ID=@id
	end
go
/*Procedure 8*/
alter Procedure  GiveWho
@workerID int
as
	begin
		select a.WORKER_NAME,b.Raw_name,b.Date from (select W_name as WORKER_NAME from Workers where W_ID=@workerID)a
							inner join
		(select (select R_name from [Raw] where R_id=Given_material.Raw_ID) as Raw_name,Date from Given_material where Worker_ID=@workerID)b
		on a.WORKER_NAME=(select W_name from Workers where W_ID=@workerID)
	end
go

/*Procedure 9*/
alter Procedure GetPaymentofWorker
@workerID int
as
	begin
	
	select a.PAY,b.Date,c.Worker,c.W_phone  from (select Payment as PAY,Pay_slip from Payment_detail)a
			inner join
	(select Pay_slip,Date,Worker_ID from Payment_Master where Worker_ID=@workerID)b
	on a.Pay_slip=b.Pay_slip
			inner join
	(select W_name as Worker,W_phone,W_ID from Workers)c
	on c.W_ID=b.Worker_ID
	end
go

select * from Created
/*Procedure 10*/
create Procedure calculatePay
@workerID int,
@PAYment int Output
as

	begin
	/*(Select W_name from Workers where W_ID=@workerID)as Name,*/
	select SUM(b.PAY) as PAYMENT
	from (select Pay_slip,[Date],Worker_ID from Payment_Master where Worker_ID=@workerID)a
		inner Join
	(select Payment as PAY,Pay_slip from Payment_Detail)b
	on a.Pay_slip=b.Pay_slip
	end
go

/*Procedure 11*/
alter Procedure makeProductPrice
@orderID int,
@workerID int
as
	begin
	IF((select top 1 month(Date)  from Created where Order_id=@orderID and Worker_ID=@workerID)<=month(GETDATE()) or
	(select top 1 Year(Date)  from Created where Order_id=@orderID and Worker_ID=@workerID)<=Year(GETDATE()))
	begin
		insert into Payment_Master values ( (select top 1 Pay_slip+1 from Payment_Master order by Pay_slip desc),@workerID,GETDATE())
		insert into PAyments values	(
									(select top 1 Pay_slip+1 from Payment_Master order by Pay_slip desc),@workerID,
									(select SUM(a.P_makePrice*b.Quantity)
											from	(select P_makePrice,P_iD from Products)a
												inner Join
											(select Product_iD as PPID,QTY as Quantity from Created where Worker_ID=@workerID and Order_id=@orderID)b
											on a.P_iD=b.PPID
									 )
							     )
	end
	end
go
/*Procedure 12*/
alter Procedure INPUTINTRIGGER
as
	begin
		
	
	if((select A_ID from ACC_OUTFLOW)>0)
	begin
		insert into ACC_OutFLOW values ((select top 1 A_ID +1 from ACC_outflow order by A_ID desc)
										,(select workerID from PAyments where PAYNO= (select top 1 PAYNO from PAyments order by PAYNO desc)),
									   (select amount from PAyments where PAYNO= (select top 1 PAYNO from PAyments order by PAYNO desc)),
										GETDATE(),
										null,
								       ((select workerID from PAyments where PAYNO= (select top 1 PAYNO from PAyments order by PAYNO desc))))
	
	end
	else
	begin
		insert into ACC_OutFLOW values (1,(select workerID from PAyments where PAYNO= (select top 1 PAYNO from PAyments order by PAYNO desc)),
									   (select amount from PAyments where PAYNO= (select top 1 PAYNO from PAyments order by PAYNO desc)),
										GETDATE(),
										null,
								       ((select workerID from PAyments where PAYNO= (select top 1 PAYNO from PAyments order by PAYNO desc))))
	
	end
	end
go

/*Procedure 13*/
alter Procedure INPUTINTRIGGEROutflow2
as
	begin
	
	if((select A_ID from ACC_OUTFLOW2)>0)
	begin
		insert into ACC_OutFLOW2 values ((select top 1 A_ID +1 from ACC_outflow2 order by A_ID desc)
										,(select seller_id from purchase_master where p_id= (select top 1 p_id from purchase_master order by p_id desc)),
									   (select SUM(Saled_Price) from Purchase_detail where Purchase_no=(select top 1 p_id from purchase_master order by p_id desc)),
										GETDATE(),
										null,
								       ((select SUM(Saled_Price) from Purchase_detail where Purchase_no=(select top 1 p_id from purchase_master order by p_id desc))))
	
	end
	else 
		begin
			insert into ACC_OutFLOW2 values (1
										,(select seller_id from purchase_master where p_id= (select top 1 p_id from purchase_master order by p_id desc)),
									   (select SUM(Saled_Price) from Purchase_detail where Purchase_no=(select top 1 p_id from purchase_master order by P_id desc)),
										GETDATE(),
										null,
								       ((select SUM(Saled_Price) from Purchase_detail where Purchase_no=(select top 1 p_id from purchase_master order by P_id desc))))
	
		end
	end
go

/*------------------
	INVOICE(PROCEDURE 14)
-------------------*/
create procedure invoice
@orderID int
as
	begin
	select b.P_name,a.QTY,b.P_price,(b.P_price*QTY) as TOTAL
	from(select Product_ID,QTY from Order_itm where Order_no=1)a
		inner join
		(select P_iD,P_name,P_price from Products)b
		on a.Product_ID=b.P_iD
	end
go
/*------------------
Balance Sheet(PROCEDURE 15)
-------------------*/
alter procedure BalanceSheet
@DATE int
as
	begin
	declare @out1 int
	
	set @out1=(select (Credit-Debit) from ledger where month(Date)=@DATE)
	
	
	IF(@out1>0)
	begin
		select BALANCE from ledger where month(Date)=@DATE
    end
	IF(@out1>=0)
	begin
		print('LOSSES in this month')
	end
	end
go

exec BalanceSheet 12
select * from Created 
select * from Payment_Master
select * from Payment_Detail
select * from PAyments
create table PAyments
(
  PAYNO int primary key,
  WorkerID int foreign Key references Workers(W_ID),
  amount int
);

/*____________

	TRIGGER
______________*/
/*TRIGGER 1*/
create Trigger STOCKplus
on payment_detail
After Insert
as
	begin
	Update Stock set QTY=(QTY+(select top 1 QTY from Purchase_detail order by Purchase_no desc))
	where RAWID=
	(select top 1 Raw_id from Purchase_detail order by Purchase_no desc)
	end

/*TRIGGER 2*/
create Trigger STockMINUS
on Given_material
After Insert
as
	begin
	if((select QTY from STOCK where RAWID=(select top 1 Raw_ID from Given_material order by serial_no desc))>0)
	BEGIN
	Update Stock set QTY=(QTY-(select top 1 RAW_QTY from Given_material order by serial_no desc))
	where RAWID=
	(select top 1 Raw_ID from Given_material order by serial_no desc)
	END
	end
	
/*TRIGGER 3*/
create TRIGGER COMPLETED
ON Delivery
After Insert
as
	begin
	Update [ORDER] set Completed_Date=GETDATE() where Order_no=
	(select Order_no from Delivery where Delivery_no=(select top 1 Delivery_no from Delivery order by Delivery_no desc))
	Update [ORDER] set Status='Completed' where Order_no=
	(select Order_no from Delivery where Delivery_no=(select top 1 Delivery_no from Delivery order by Delivery_no desc))
	
	end

/*TRIGGER 4*/
alter Trigger DATEINORDER
ON [ORDER]
After insert 
as
	BEGIN
		update [ORDER] set [Order_Date]= (GETDATE()) where order_no=(select top 1 order_no from Payment_Master order by order_no desc )
	
	END

/*TRIGGER 5*/
alter Trigger DATEINPURCHASE
ON Purchase_master
After insert 
as
	BEGIN
		update purchase_master set [Date]= (GETDATE()) where p_id=(select top 1 p_id from Payment_Master order by p_id desc )
	
	END

/*TRIGGER 6*/
alter Trigger DATEINGIVEN
ON Given_material
After insert 
as
	BEGIN
		update Given_material set [Date]= (GETDATE()) where serial_no=(select top 1 serial_no from Given_material order by serial_no desc)
	END

/*TRIGGER 7*/
alter Trigger DATEINPAyment
ON Payment_master
After insert 
as
	BEGIN
		update Payment_Master set [Date]= (GETDATE()) where pay_slip=(select top 1 Pay_slip from Payment_Master order by Pay_slip desc )
	END

/*TRIGGER 8*/
alter Trigger DATEINCreated
ON Created
After insert 
as
	BEGIN
		update Created set [Date]= (GETDATE()) where batch_no=(select top 1 batch_no from Payment_Master order by batch_no desc )
	
	END

/*TRIGGER 9*/
alter Trigger DATEINDelivery
ON Delivery
After insert 
as
	BEGIN
		update Delivery set [Date]= (GETDATE()) where Delivery_no=(select top 1 Delivery_no from Payment_Master order by Delivery_no desc )
		
	END

/*TRIGGER 10*/

alter trigger OUTFLoWSUM
on ACC_OutFLOW
after insert
as
	begin
	
	Update ledger set debit=((select Total from ACC_OutFLOW where A_ID=(select Top 1 A_ID from ACC_OutFLOW))+
							(select Total from ACC_OutFLOW2 where A_ID=(select Top 1 A_ID from ACC_OutFLOW2)))
							
							where ledger.Date=(select [Date] from ACC_OutFLOW2 where A_ID=(select Top 1 A_ID from ACC_OutFLOW2)) or
							 ledger.Date=(select [Date] from ACC_OutFLOW where A_ID=(select Top 1 A_ID from ACC_OutFLOW))
							 							
	end

/*TRIGGER 11*/
create trigger BALANCECHECK
on Ledger
after Update
as
	begin
		if((select balance from ledger where ID=(select top 1 ID from ledger order by ID desc))>
		(select debit from ledger where ID=(select top 1 ID from ledger order by ID desc)))
		begin
		Update ledger set balance=(balance-(select debit from ledger where ID=(select top 1 ID from ledger order by ID desc)))
		end
	end


/*TRIGGER 12*/
alter trigger LEDGERT
on PAyments
after insert
as
	begin
		if((select top 1 ID from ledger order by ID)>0)
		begin
		
		insert into ledger values ((select top 1 ID+1 from ledger order by ID),0,0,0,GetDATe())
		exec INPUTINTRIGGER 
		
		end
		else
		begin
		insert into ledger values (1,0,0,0,GetDATe())
		exec INPUTINTRIGGER 
		end
	end


/*TRIGGER 13*/
alter trigger LEDGERT2
on Purchase_Master
after insert
as
	begin
		if((select top 1 ID from ledger order by ID)>0)
		begin
		
		insert into ledger values ((select top 1 ID+1 from ledger order by ID),0,0,0,GetDATe())
		exec INPUTINTRIGGEROutflow2 
		
		end
		else
		begin
		insert into ledger values (1,0,0,0,GetDATe())
		exec INPUTINTRIGGEROutflow2 
		end
	end

/*TRIGGER 14*/
alter trigger salesinLedge
on Sales_Master
after Update
as
	begin
		Update ledger set ledger.Credit=(select top 1 price from Sales_Master order by Sales_ID desc) where [Date]='2019-12-25'
		end
	/*CAN HANDLE BY getting the DATE WEHRE the updae occur !

create trigger salesinLedge2
on Sales_Master
after Insert
as
	begin
		Update ledger set Credit=(select top 1 price from Sales_Master order by Sales_ID DESC) where ledger.[Date] IN (select Date from Sales_Master)
	end
	/*CAN HANDLE BY getting the DATE WEHRE the updae occur !*/

	*/
/*TRIGGER 15*/
alter trigger BAlnceforcredit
on ledger
after update
as
	begin
		Update ledger set balance=(balance+(select Credit from ledger where ID=(select top 1 ID from ledger order by ID desc))) where Date='2019-12-25'
	end

/*TRIGGER 16*/

create trigger Tinvoice
on Order_itm
after Insert
as
	begin
	 select b.P_name,a.QTY,b.P_price,(b.P_price*QTY) as TOTAL
	 from(select Product_ID,QTY from Order_itm where Order_no=(select top 1 Order_no from [Order] order by order_no desc))a
		inner join
		(select P_iD,P_name,P_price from Products)b
		on a.Product_ID=b.P_iD
	end
/*------------------
Balance Sheet(TRIGGER 17)
-------------------*/
alter trigger TBalanceSheet
on ledger
after Update
as
	begin
	declare @out1 int
	
	set @out1=(select SUM(Balance) from ledger where month(DATE)=(select top 1 month(Date) from Ledger order by ID desc))	
	
	IF(@out1>0)
	begin
		print('Total Balance in this month till now')
		print(@out1)
		select Credit,Debit from ledger where month(Date)=(select top 1 month(Date) from Ledger order by ID desc)
			
    end
	IF(@out1>=0)
	begin
		print('LOSSES in this month')
	end
	end


create TRigger PAymentPlus
ON PAyment_Detail
after Insert
as
	Begin
	Update PAyments set amount=(select SUM(Payment) from Payment_detail where Pay_slip IN(Select top 1 Pay_slip from Payment_master order by Pay_slip desc))
	where WorkerID=(select top 1 Worker_ID from Payment_Master order by Pay_slip desc)
	end


alter TRigger PAymentMINUS
ON GIVEPAYMENT
after Insert
as
	Begin
	if((select amount from PAyments where WorkerID=(select top 1 W_ID from GivePAYMENT order by serial_no desc))>0)
	BEGIN
	Update PAyment set amount=(amount-(select top 1 PAymentAmount from GivePayment order by serial_no desc))
	where WOrkerID=
	(select top 1 W_ID from GivePayment order by serial_no desc)
	END
	ELSE
	begin
		print('NOT ENOUGH AMOUNT')
	end
	end
select * from GIVEPAYMENT
insert into GIVEPAyment select W_ID,W_ID,0 from workers 
select * from Payment_detail
select * from Ledger

/*Procedure */
/*Procedure 1 call*/
EXEC PriceInSalesMaster 24

select * from ledger
/*Procedure 2 call to get the order of a certain date */
declare @ORDER int
EXEC GETID '11','10','2019',@ORDER output
print @ORDER
/*Procedure 3 (inserting the new client or company) with the use of triggers(after)*/

	exec INclient 'RAJA sahab','0300-0020300','BREAD & BEYOND',null,'Lahore'

/*Procedure 4 (get the products name from a given order)*/
	exec showProducts 2
/*Procedure 5*/
	exec MOSTpurchasefromseller
/*Procedure 6*/
	exec Totalpurchasefromseller 1
/*Procedure 7*/

/*Procedure 8*/
exec GiveWho 1
/*Procedure 9*/
exec GetPaymentofWorker 2

/*Procedure 10*/
exec makeProductPrice 24,5
/*ALL TABLES*/
select * from Client/*DONE & history table(DONE)*/
select * from Company/*DONE & history table(DONE)*/
select * from belong/*DONE & history table(DONE)*/
select * from Cloth/*DONE & history table (DONE)*/
select * from Delivery/*DONE*/
select * from Transport_co/*IS TO BE DELETED*/
select * from Given_material/*DONE*/
select * from Locations/*DONE& history table(DONE)*/
select * from [ORDER]/*DONE*/
select * from Payment_Detail/*DONE*/
select * from Payment_Master/*DONE*/
select * from PAyments/*DONE*/
select * from Products/*DONE & history table(DONE)*/
select * from Purchase_detail/*DONE*/
select * from purchase_master/*DONE*/
select * from [Raw]/*DONE & history table (DONE)*/
select * from Sales_Master/*Done*/
select * from Sellers/*DONE & history table(DONE) */
select * from Transport/*DONE*/
select * from Workers/*DONE & history (DONE) */
select * from Created/*DONE*/
select * from Order_itm /*DONE*/
select * from STOCK/*DONE*/

/*----------------------
	HISTORY TABLES
----------------------*/
create table Worker_history(
worker_id int foreign KEy references Workers(W_ID),
W_name varchar(30),
W_phome varchar(40),
W_address varchar(40),
updateTime datetime
);

/*DONE*/
CREATE TABLE Client_HISTORY(
  serial int primary key,
  Cl_id int foreign key references Client(Cl_id),
  Cl_name varchar(30) Not null,
  Cl_phone varchar(50),
  changetime datetime
);

CREATE TABLE Sellers_History(
  serial int primary key, 
  Seller_id int foreign key references Sellers(Seller_id),
  Sell_name varchar(50),
  Sell_phone varchar(30),
  Sell_address varchar(50),
  changeTime datetime
);

/*DONE*/
CREATE TABLE Company_History (
  serial int primary key,
  Company_ID int foreign key references Company(C_ID),
  C_name varchar(30),
  C_address varchar(70),
  changeTime datetime
);

/*DONE*/
CREATE TABLE belong_histroy ( 
  serial int primary key,
  ID int foreign key references belong(ID),
  Client_id int Foreign Key references Client(Cl_id),
  Company_ID int Foreign Key references Company(C_ID),
  changeTime datetime
);

/*DONE*/
CREATE TABLE Products_History(
  serial int primary key,
  P_iD  int foreign key references Products(P_iD),
  P_name varchar(40),
  P_price int,
  changetime datetime
  );

/*DONE*/
CREATE TABLE Cloth_History (
  serial int primary key,
  CLoth_id int foreign key references Cloth(CLoth_id),
  Clot_size int,
  changeTime datetime
);

/*DONE*/
CREATE TABLE Raw_History (
  serial int primary key,
  R_id  int foreign key references [Raw](R_id),
  ProductID int foreign key references Products(P_iD),
  CLoth_id int foreign key references Cloth(CLoth_id),
  R_name varchar(30),
  changeTime datetime
);


/*DONE*/
CREATE TABLE Locations_History(
  serial int primary key,
  Location_ID int foreign key references Locations(L_ID),
  Location varchar(50),
  price int,
  changeTime datetime
);


 



create table ledger(
ID int primary key,
Credit int,
debit int,
balance int,
[Date] date
);


create table ACC_INFLOW(
AC_ID int primary key,
Sales_ID int foreign key references Sales_Master(Sales_ID),
);
 
drop table ACC_INFLOW
create table ACC_OutFLOW(
A_ID int primary KEY,
WorkerID int foreign key References Workers(W_ID),
Salary int,
[Date] Date,
Other_expences int,
Total int);

create table ACC_OutFLOW2(
A_ID int primary KEY,
SellerID int foreign key References Sellers(Seller_ID),
Payment int,
[Date] Date,
Other_expences int,
Total int);

create table ACC_OutFLOW3(
A_ID int primary KEY,
Transport int foreign key References Transport(T_ID),
Payment int,
[Date] Date,
Other_expences int,
Total int);

create table GIVEPAYMENT
(Serial_no int Primary Key,
W_ID int Foreign key references  Workers(W_ID)
,[Date] DATE,
PAymentAmount int);
/*---------------------------
	TRIGGERS ON HISTORY TABLE
---------------------------*/
create Trigger LocationT
on Locations
for Delete
as
	begin
	if((select top 1 serial from Locations_History order by serial desc) is null)
		insert into Locations_History 1, 		
	end


select Purchase_no,Raw_id,QTY from purchase_detail where Purchase_no IN (select p_id from purchase_master where seller_id=5)
select * from purchase_master
select * from Purchase_detail
/*
VIEW*/
 create View VW_Product
 as
	select P_iD,P_name,P_price from Products


select * from VW_Product

