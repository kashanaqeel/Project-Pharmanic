CREATE Database Pharmanic
go
use Pharmanic
go

create table Customers(
CustomerID int primary key not null,
CustomerCNIC nvarchar(15) unique,
CustomerName nvarchar(30) not null,
Age int,
Gender char,
CustomerAddress nvarchar(30),
City nvarchar(30),
State_ nvarchar(30),
PostalCode nvarchar(20) not null,
Country nvarchar(30) not null,
Phone nvarchar(13) not null,
isDoctor int not null,
Password_ nvarchar(20) not null CHECK(LEN(Password_) >= 8) ,
Email nvarchar(30) not null,

)
insert into Customers values (1,'35202-1223221-2','Aleena',24,'F','DHA,lAHORE','LAHORE','PAKISTAN','234-23720-2','pAKISTAN','0302-4364866',1,'MIR TIPU','Alina@gmail.com
')
insert into Customers values (2,'35202-1224221-2','Samia',27,'F','Johr town,lAHORE','LAHORE','PAKISTAN','234-231320-2','pAKISTAN','0302-4364865',0,'alinaaaa','samia@gmail.com
')
insert into Customers values (3,'35202-1225221-2','laraib',28,'F','faisal town,lAHORE','LAHORE','PAKISTAN','234-232720-2','pAKISTAN','0302-4364844',0,'Myoutrfd','laraiba@gmail.com
')

CREATE TABLE Shippers(
ShipperID int primary key,
CompanyName nvarchar(30),
Phone nvarchar(13) not null,
Email nvarchar(30) not null,
)
insert into Shippers values (1,'PakWheels','0302-4364866','Alina@gmail.com
')
insert into Shippers values (2,'7 VALS','0302-4364865','samia@gmail.com
')
insert into Shippers values (3,'SGS','0302-4364844','laraiba@gmail.com
')

CREATE TABLE Payments(
PaymentID int primary key,
PaymentType varchar(10) not null,
isAllowed int not null
)
insert into Payments values (1,'CASH',1)

insert into Payments values (2,'CARD',0)

insert into Payments values (3,'CARD',1)

CREATE TABLE Categories(
CategoryID int primary key,
CategoryName nvarchar(30) not null,
Description_ nvarchar(250) not null,
Status_ int not null,
)

insert into Categories values (1,'APPARATUS','BP checker thermometer',1)
insert into Categories values (2,'MEDICINE','All type of medicines',1)
insert into Categories values (3,'SANITIZER','hand sanitizer, sterlizer',1)

create table Company
(
   	CompanyID int Primary Key not null,
	CompanyName nvarchar(30) NOT NULL,
	SellerCNIC nvarchar(15) Unique NOT NULL, 
	SellerName nvarchar(30) NOT NULL,
	SellerTitle  nvarchar(30),
	City nvarchar(30),
	State_ nvarchar(30),
	PostalCode  nvarchar(20),
	Country  nvarchar(30),
	PhoneNumber nvarchar(13) not null,
	Email   nvarchar(30) not null,
    CompanyRating float, 
	CurrentOrders int,
	PaymentMethods int Foreign Key references Payments(PaymentID) on delete set null on update cascade,
	Password_ nvarchar(20)  NOT NULL  CHECK(LEN(Password_) >= 8)
)

insert into Company values (1,'PakWheels','35202-1223221-2','Aleena','HEAD','LAHORE','PAKISTAN','234-23720-2','pAKISTAN','0302-4364866','Alina@gmail.com
',3.4,5,1,'MIR TIPUF')
insert into Company values (2,'7 VALS','35202-1224221-2','Samia','JUNIOR','LAHORE','PAKISTAN','234-231320-2','pAKISTAN','0302-4364865','samia@gmail.com
',3,8,2,'SURPRIZE')
insert into Company values (3,'SGS','35202-1225221-2','laraib','STARTER','LAHORE','PAKISTAN','234-232720-2','pAKISTAN','0302-4364844','laraiba@gmail.com
',4.5,76,3,'KEEP IT SECRET')

create table Products
(

    ProductID  int Primary Key not null,
	ProductName nvarchar(30) not null,
	ProductDescription nvarchar(250) not null,
	CompanyID int Foreign Key references Company(CompanyID) on delete cascade  on update cascade,
	CategoryID int Foreign Key references Categories(CategoryID) on delete cascade on update cascade,
	UnitPrice float NOT NULL,
	UnitsinStock int not null,
	UnitsOnOrder int not null,
	DiscountAvailable int not null,
	Ranking float CHECK(Ranking>=1 and Ranking<=5)
)


insert into Products values (1,'Stethoscope','i donot know',1,1,3000,100,3,1,4)
insert into Products values (2,'Vitamin Pills','i donot know',2,2,510,100,6,0,4)
insert into Products values (3,'detol hand sanitizer large','Keeps germs aways lol',3,3,3000,100,1,1,4)
insert into Products values (4,'detol soap','Keeps germs aways lol',3,3,3030,0,1,1,4)
insert into Products values (5,'Panadol','for headache',2,2,300,3,1,1,4)


create Table Orders(
	OrderID int primary key,
	ProductID int Foreign Key references Products(ProductID) on delete cascade on update cascade,
	CustomerID int Foreign Key references Customers (CustomerID) on delete cascade on update cascade,
	PaymentID int Foreign Key references Payments (PaymentID),-- on delete cascade on update cascade,
	ShipperID int Foreign Key references Shippers (ShipperID) on delete cascade on update cascade,
	isCompleted int not null,
	Quantity int
)

insert into Orders values (1,1,3,1,1,0,4)
insert into Orders values (2,2,2,2,2,0,4)
insert into Orders values (3,2,2,2,2,0,4)
insert into Orders values (4,1,1,1,1,0,4)


------------------------------------------------------------------------------------
---------------------2.1:SIGNUPS--------------------------------------------------------
------------------------------------------------------------------------------------
-----------------Add Customer-------------------------------------------------------
create procedure addcustomer
@CustomerCNIC nvarchar(15),
@CustomerName nvarchar(30),
@Age int,
@Gender char,
@CustomerAddress nvarchar(30),
@City nvarchar(30),
@State_ nvarchar(30),
@PostalCode nvarchar(20),
@Country nvarchar(30),
@Phone nvarchar(13),
@isDoctor int,
@Password_ nvarchar(20),
@Email nvarchar(30),
@check int output
as
BEGIN
					  declare @next int
					  select @next=ISNULL(max(CustomerID),0) from Customers
					  PRINT @next
					  insert into Customers values (@next+1 ,@CustomerCNIC,@CustomerName,@Age,@Gender,@CustomerAddress,@City,@State_,@PostalCode,@Country,@Phone,@isDoctor,@Password_,@Email)
					  set @check=1
end
--------------------------Execution through sample data----------------------------------------
Declare @check1 int
execute addcustomer
@CustomerCNIC='35202-3045632-3',@CustomerName='Kashan',@Age=20,@Gender='M',@CustomerAddress='A',@City='Lahore',@State_='Punjab',@PostalCode='54000',@Country='Pak',@Phone='03214523563',@isDoctor=1,@Password_='l200906@gmail.com',@Email='l200906@gmail.com',@check=@check1 output
select @check1 as successfully_added
select*from Customers
drop table Customers

-----------------------------Add Company--------------------------------------------------------
create procedure addcompany
@CompanyName nvarchar(30),
@SellerCNIC nvarchar(15), 
@SellerName nvarchar(30),
@SellerTitle  nvarchar(30),
@City nvarchar(30),
@State_ nvarchar(30),
@PostalCode  nvarchar(20),
@Country  nvarchar(30),
@PhoneNumber nvarchar(13),
@Email nvarchar(30),
@CompanyRating float, 
@CurrentOrders int,
@PaymentMethods int,
@Password_ nvarchar(20),
@check int output
as
BEGIN
					  declare @next int
					  select @next=ISNULL(max(CompanyID),0) from Company
					  PRINT @next
					  insert into Company values (@next+1 ,@CompanyName,@SellerCNIC, @SellerName,@SellerTitle,@City,@State_,@PostalCode,@Country,@PhoneNumber,@Email,@CompanyRating,@CurrentOrders,@PaymentMethods,@Password_)
					  set @check=1
end
drop procedure addcompany
------------------------------------Execution through sample data--------------------------------
Declare @check1 int
execute addcompany
@CompanyName='Pharma2',@SellerCNIC='32234-4567567-8', @SellerName='Ali',@SellerTitle='Manager',@City='Lahore',@State_='Punjab',@PostalCode='54000',@Country='Pak',@PhoneNumber='0375-9648576',@Email='company@gmail.com',@CompanyRating=4,@CurrentOrders=3,@PaymentMethods=1,@Password_='company@gmail',@check=@check1 output
select @check1 as successfully_added
select*from Company
--------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------
--------------------------2.2:LOGINS--------------------------------------------------------------
--------------------------------------------------------------------------------------------------
-------------------------Login Customer-----------------------------------------------------------
create procedure login_customer
@CustomerCNIC nvarchar(15),
@Password nvarchar(20),
@check int output
as
BEGIN
if exists(select CustomerCNIC from Customers where CustomerCNIC=@CustomerCNIC and Password_=@Password)
BEGIN
set @check=1
print 'Login Successful'
BEGIN
select * from Customers where CustomerCNIC=@CustomerCNIC and Password_=@Password
end
end
else
begin
set @check=0
print 'Incorrect ID or Password'
end
end

-------------------------------Execution through sample data--------------------------------------
Declare @check1 int
execute login_customer
@CustomerCNIC='35345-3453252-1',@Password='hellouser123',@check=@check1 output

----------------------------------Login Company---------------------------------------------------
create procedure login_company
@CompanyID int,
@Password nvarchar(20),
@check int output
as
BEGIN
if exists(select CompanyID from Company where @CompanyID=CompanyID and Password_=@Password)
BEGIN
set @check=1
print 'Login Successful'
BEGIN
select * from Company where @CompanyID=CompanyID and Password_=@Password
end
end
else
begin
set @check=0
print 'Incorrect ID or Password'
end
end
drop procedure login_company
---------------------------------Execution through sample data----------------------------------------
Declare @check1 int
execute login_company
@CompanyID=2,@Password='SURPRIZE',@check=@check1 output
------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------
---------------------------------------2.3:Edit Customer/Company--------------------------------------
-----------------------------------------Edit Customer------------------------------------------------
create procedure editcustomer
@newPassword_ nvarchar(20),
@CustomerID int,
@oldPassword nvarchar(20),
@check int output
as
BEGIN
declare @currPassword4DB nvarchar(20)

set @currPassword4DB =(select Password_ from Customers where CustomerID=@CustomerID)
if(@currPassword4DB=@oldPassword)
begin
set @check=1
update Customers set Password_ =@newPassword_ where CustomerID=@CustomerID
print 'Password Changed Successfully'
end
else 
begin
set @check=0
print 'Process Failed'
end
end

declare @check1 int
execute editcustomer
@newPassword_='SURPRIZE',
@CustomerID=2,
@oldPassword= 'alinaaaa',@check=@check1 output
select @check1 as check2

drop procedure editcustomer
-----------------------------Edit Company-----------------------------------------------------------------
create procedure editCompanyDetails
@oldPassword nvarchar(20),
@newPassword nvarchar(20),
@companyID int,
@check int output
as
begin
declare @currPassword4DB nvarchar(20)

set @currPassword4DB =(select Password_ from Company where CompanyID=@CompanyID)
if(@currPassword4DB=@oldPassword)
begin
set @check=1
update Company set Password_ =@newPassword where CompanyID=@CompanyID
print 'Password Changed Successfully'
end
else 
begin
set @check=0
print 'Process Failed'
end
end

declare @check1 int
execute editCompanyDetails
@oldPassword='NOT TIPUF',
@newPassword='MIR TIPUF',
@companyID= 1,@check=@check1 output
select @check1 as check2

drop procedure editCompanyDetails
------------------------------------------------------------------------------------------------------
------------------------------2.4:Add/Remove Products-------------------------------------------------
------------------------AddProduct------------------------------------------------------
create procedure addProduct
	@ProductName nvarchar(30) ,
	@ProductDescription nvarchar(250) ,
	@CompanyID int ,
	@CategoryID int ,
	@UnitPrice float ,
	@UnitsinStock int ,
	@UnitsOnOrder int ,
	@DiscountAvailable int ,
	@Ranking int,
	@check int output
	as
	BEGIN
					  declare @next int
					  select @next=ISNULL(max(ProductID),0) from Products
					  PRINT @next
					  insert into Products values (@next+1 ,@ProductName,@ProductDescription,@CompanyID,@CategoryID,@UnitPrice,@UnitsinStock,@UnitsOnOrder,@DiscountAvailable,@Ranking)
					  set @check=1
	end

----------------Execution----------------------------
	Declare @check1 int
	execute addProduct
	@ProductName='Nothing',@ProductDescription='Nothing',@CompanyID=1,@CategoryID=1,@UnitPrice=30,@UnitsinStock=3,@UnitsOnOrder=0,@DiscountAvailable=0,@Ranking=3,@check=@check1 output
	select @check1 as successfully_added
	drop procedure addProduct
-------------------------------Delete Product-------------------------------------------
	create procedure deleteProduct
	@productID int,
	@companyID int,
	@check int output
	as 
	begin
	if exists(select @productID from Products where @productID=ProductID AND @companyID=CompanyID)
	begin
	set @check=1
	delete from Products where productID=@productID
	end
	else
	set @check=0
	end
----------------Execution-------------------------------------------------------
	declare @check1 int
	execute deleteProduct
	@productID=6,@companyID=1,@check=@check1 output
	select @check1 as successfully_deleted
------------------------------------------------------------------------------------------------------
-------------------------DROP PROCEDURES CUSTOMER/COMPANY---------------------------------------------
------------------------------------------------------------------------------------------------------
--------------------------Drop Customer---------------------------------------------------------------
create procedure dropcustomer
@CustomerID int,
@check int output
as
BEGIN
if exists(select CustomerID from Customers where @CustomerID=CustomerID)
BEGIN
set @check=1
delete from Customers where CustomerID=@CustomerID
end
else
begin
set @check=0
end
end

----------------------------Execution through sample data-----------------------------------------------
Declare @check1 int
execute dropcustomer
@CustomerID=1,@check=@check1 output
select @check1 as successfully_deleted


---------------------------------Drop Company-----------------------------------------------------------
create procedure dropcompany
@CompanyID int,
@check int output
as
BEGIN
if exists(select CompanyID from Company where @CompanyID=CompanyID)
BEGIN
set @check=1
delete from Company where CompanyID=@CompanyID
end
else
begin
set @check=0
end
end

----------------------------------Execution through sample data----------------------------------------------------
Declare @check1 int
execute dropcompany
@CompanyID=1,@check=@check1 output
select @check1 as successfully_deleted
select*from Company

--------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
---------------------------2.5:Products Display--------------------------------------
create procedure display_all_products
as
BEGIN
select * from Products
END

execute display_all_products
--------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------
--------------------------------2.6:FILTERS---------------------------------------------
----------------------------------------------------------------------------------------

-------------------------View price filter----------------------------------------------
-------------------------Ascending Order------------------------------------------------
  create view Ascending_Price_filter
  as
  select TOP 999999999999
    ProductID ,
	ProductName,
	ProductDescription ,
	CompanyID ,
	CategoryID ,
	UnitPrice ,
	UnitsinStock ,
	UnitsOnOrder ,
	DiscountAvailable,
	Ranking 
  from Products order BY UnitPrice ASC
  SELECT *FROM  Ascending_Price_filter
  ----------------------------------------Descending Order----------------------------------
   create view Descending_Price_filter
   as
   select TOP 999999999999
    ProductID ,
	ProductName,
	ProductDescription ,
	CompanyID ,
	CategoryID ,
	UnitPrice ,
	UnitsinStock ,
	UnitsOnOrder ,
	DiscountAvailable,
	Ranking 
  from Products order BY UnitPrice Desc
  SELECT *FROM Descending_Price_filter

  ---------------------------------VIEW by Alphabets A-Z-------------------------------------------------------------
  create view Alphabet_filter
  as
  select TOP 999999999999
    ProductID ,
	ProductName,
	ProductDescription ,
	CompanyID ,
	CategoryID ,
	UnitPrice ,
	UnitsinStock ,
	UnitsOnOrder ,
	DiscountAvailable,
	Ranking 
	from Products order BY ProductName ASC
	select*from Alphabet_filter

  -------------------------VIEW by Rankings-----------------------------------------------------------
  -------------------------Descending Order-----------------------------------------------------------
  create view Descending_Ranking_filter
  as
  select TOP 999999999999
    ProductID ,
	ProductName,
	ProductDescription ,
	CompanyID ,
	CategoryID ,
	UnitPrice ,
	UnitsinStock ,
	UnitsOnOrder ,
	DiscountAvailable,
	Ranking 
	from Products order BY Ranking Desc
    select*from Descending_Ranking_filter
	
------------------------------Ascending Order---------------------------------------------------
  create view Ascending_Ranking_filer
  as
  select TOP 999999999999
    ProductID ,
	ProductName,
	ProductDescription ,
	CompanyID ,
	CategoryID ,
	UnitPrice ,
	UnitsinStock ,
	UnitsOnOrder ,
	DiscountAvailable,
	Ranking 
	from Products order BY Ranking Asc
    select*from Ascending_Ranking_filer
-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------
---------------------2.7:Product Availability--------------------------------------------
	create procedure Product_Availabilty
	as 
	begin
	select   
	ProductID ,
	ProductName,
	ProductDescription ,
	CompanyID ,
	CategoryID ,
	UnitPrice ,
	UnitsinStock ,
	UnitsOnOrder ,
	DiscountAvailable,
	Ranking, 
	'Unavailable' as ProductAvailabilty
	from Products
	where UnitsinStock=0
	end
	exec Product_Availabilty
--------------------------------------------------------------------------------------------------------------------
--------------------------------2.8:Product Ratings-----------------------------------------------------------------

	create procedure Rating_Product
	@Rating float,
	@ProductID int,
	@check int OUTPUT
	as 
	Begin
	if exists (select ProductID from Products where ProductID=@ProductID)
      begin
	   set @check=1
	   Update Products 
	   Set Ranking= (select (Ranking+@Rating)/2  from Products  where ProductID=@ProductID)
	   where ProductID=@ProductID
	   end
  else
	 begin
	 set @check=0
	 end
end


declare @check1 int 
execute Rating_Product @Rating=2,@ProductID=1,@check=@check1 output   --taking new and old one one and find their mean
select @check1 as successfullyadded
/*select*from Orders
SELECT *FROM Products*/
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------------------------
---------------------------------------2.9:View Shopping Cart----------------------------------------------------------------------

create procedure viewcart
@CustomerId int,
@check int output
as 
begin
if exists (select CustomerID from Orders where CustomerID=@CustomerId)
 begin
	 set @check=1
	 
	 select ProductName,ProductDescription,UnitPrice,Quantity,Ranking from Products as P inner join Orders as O on P.ProductID=O.ProductID where O.CustomerID=@CustomerId and O.isCompleted=0
	if exists(select isDoctor as s from Customers where CustomerID=@CustomerId and isDoctor=1)
	    Begin
	                  select Sum(x.prices*x.Amount) as Total ,Sum(x.prices*x.Amount)*0.5 as DiscountTotal from 
	                       (
						       select UnitPrice as prices, Quantity as Amount from Products as P inner join Orders as O on P.ProductID=O.ProductID where O.CustomerID=@CustomerId and O.isCompleted=0
	                       )x
	   End

	  else
	      
		  Begin
	                     select Sum(x.prices*x.Amount) as Total  from 
	                       (
						       select UnitPrice as prices, Quantity as Amount from Products as P inner join Orders as O on P.ProductID=O.ProductID where O.CustomerID=@CustomerId and O.isCompleted=0
	                       )x
	     End
 end
   else
	 begin
	 set @check=0
	 end
end

--drop procedure viewcart
declare @check1 int 
execute viewcart @CustomerId=2, @check=@check1 output
select @check1 as PresenceStatus
/*select*from Customers
 select*from Products
 select*from Orders
*/
-----------------------------------------------------------------------------------------------------
-----------------------PLACE AND DROP ORDERS----------------------------------------------------------
--------------------------PLACE ORDER----------------------------------------------------------------

	   create procedure PLaceOrder
	   @ProductId int,
	   @CustomerId int,
	   @PaymentId int,
	   @ShipperId int,
	   @isCompleted int,
	   @Quantity int,
	   @check int output
		as
		begin
		 If exists(select ProductID,CustomerID from Orders where ProductID=@ProductId and CustomerID=@CustomerId and isCompleted=0)
		     Begin
			      declare @amount int
				  select @amount= UnitsinStock  from Products where ProductID=@ProductId
				 
			      if (@amount>=@Quantity)
				  begin
				     --Updating quantity in Orders 
				     Update Orders
					 set Quantity = (select (Quantity+@Quantity)  from Products  where ProductID=@ProductID and CustomerID=@CustomerId  )
					 where  ProductID=@ProductId and CustomerID=@CustomerId
					 

					 ---updting quantity in products
                     Update Products
                     set UnitsinStock= @amount-@Quantity        
                     where ProductID=@ProductID
					 set @check=1
				
				  end
				  else
					  begin 
					      Print 'Product OutofStock'
						   set @check=0
					  end
			 
			 End
	       Else
		     Begin
			   
				  select @amount= UnitsinStock  from Products where ProductID=@ProductId
			      if (@amount>=@Quantity)
				  begin
					  declare @next int
					  select @next=ISNULL(max(OrderID),0) from Orders
					  PRINT @next
					  insert into Orders values (@next+1 ,@ProductId ,@CustomerId ,@PaymentId ,@ShipperId ,@isCompleted ,@Quantity)
					  set @check=1
					   ---updting quantity in products

                     Update Products
                     set UnitsinStock= @amount-@Quantity
					 where ProductID=@ProductID

				 end
				  else
					  begin 
					      Print 'Product OutofStock'
						   set @check=0
					  end
			 End
		End


		
declare @check1 int 
execute PLaceOrder @ProductId=2, @CustomerId=1 ,@PaymentId=2 ,@ShipperId=1 ,@isCompleted=0 ,@Quantity=3, @check=@check1 output
select @check1 as successfullyadded

delete from Orders where ProductID=2 and CustomerID=1
drop procedure PLaceOrder
--select*from Orders
--select*from Products

---------------------------------------------Delete Order-------------------------------------------------------------------------------
create procedure deleteorder
@OrderId int,
@check int output
as 
begin
if exists (select OrderID from Orders where OrderID=@OrderId)
 begin
	 set @check=1
	 declare @pid int
	 declare @qty int
	 declare @amt int
	 select @pid=ProductID,@qty=Quantity from Orders where OrderID=@OrderId
	 select @amt=UnitsinStock from Products where ProductID=@pid
	 delete from Orders where OrderID=@OrderId
	 Update Products
	 set UnitsinStock=@amt+@qty
	 where ProductID=@pid          --if an order delete then qty of that product is refilled
	 end
 else
	 begin
	 set @check=0
	 end
end

declare @check1 int 
execute deleteorder @OrderId=4, @check=@check1 output
select @check1 as deletestatus
select*from Orders
select*from Products

--------------------------------------------------------------------------------------------------------------------------------
------------------------------------2.11:CheckOut-------------------------------------------------------------------------------
create procedure Checkout
  @OrderId int
  as
  begin
  if exists (select * from Orders where OrderID=@OrderId)
	  begin
	   select Customers.CustomerID,Customers.CustomerCNIC,Customers.CustomerName,Customers.CustomerAddress as Destination,P.ProductName,P.ProductName,P.ProductDescription,P.UnitPrice, Orders.Quantity  from Customers inner join Orders on Orders.CustomerID=Customers.CustomerID inner join Products as P on Orders.ProductID=P.ProductID where OrderID=@OrderId 
	   select Sum(Products.UnitPrice*Orders.Quantity) as TotalAmount from Products inner join Orders on Orders.ProductID=Products.ProductID inner join Customers on Orders.CustomerID=Customers.CustomerID
	   where OrderID=@OrderId 
	   print 'Ordered Successfully'
	   end
else
	   begin 
	   print 'Wrong Order Id entered!'
	   end
  end

---Execution
  execute Checkout @OrderId=2
--------------------------------------------------------------------------------------------------------------------
--------------------------------2.12:FREQUENTLY BOUGHT PRODUCTS-----------------------------------------------------
create procedure frequent_products
@CustomerID int,
@check int output
as
Begin
if exists (select * from Products where ProductID=(select top 3 ProductID from Orders where CustomerID=@CustomerID group by ProductID having count(ProductID)>1 order by count(ProductID) desc))
begin
select * from Products where ProductID=(select top 3 ProductID from Orders where CustomerID=@CustomerID group by ProductID having count(ProductID)>1 order by count(ProductID) desc)
set @check=1
end
else
set @check=0
end
--select top 3 ProductID,count(ProductID) as Count_ from Orders where CustomerID=@CustomerID group by ProductID having count(ProductID)>1 order by Count_ desc
---Execution
declare @check1 int
execute frequent_products
@CustomerID=2,@check=@check1 output
select @check1 as check2
drop procedure frequent_products
------------------------------------------------------------------------------------------------------------------------
-----------------------------Products List------------------------------------------------------------------------------
create procedure productslist
@CompanyID int,
@check int output
as
Begin
if exists (select * from Products where CompanyID=@CompanyID)
begin
select * from Products where CompanyID=@CompanyID
set @check=1
end
else
set @check=0
end
---Execution
declare @check1 int
execute productslist
@CompanyID=2,@check=@check1 output
select @check1 as check2
------------------------------------------------------------------------------------------------------------------------
--------------------------------UPDATING ORDER STATUS IS COMPLETED-----------------------------------------------------
create procedure OrderIsCompleted
@CustomerID int
as 
begin
 update Orders set isCompleted=1 where CustomerID=@CustomerID
 end