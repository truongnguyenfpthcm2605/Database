CREATE DATABASE FoodSystemOnline

ON
(
	NAME = FoodSystemOnline_dat,
	FILENAME = 'D:\JAVA6\SQL\FoodSystemOnline.mdf'

)
LOG ON
(
	NAME = FoodSystemOnline_ldf,
	FILENAME = 'D:\JAVA6\SQL\FoodSystemOnline.ldf'
)
GO
USE FoodSystemOnline
GO
CREATE TABLE [GroupProduct] (
  [id] int IDENTITY(1,1) PRIMARY KEY,
  [title] nvarchar(30) NOT NULL,
  [icon] varchar(20) 
)
GO

CREATE TABLE [Product] (
  [id] int IDENTITY(1,1) PRIMARY KEY,
  [title] nvarchar(100) not null,
  [discount] float not null,
  [price] float not null,
  [ram] int not null,
  [rom] int not null,
  [pin] int not null,
  [chip] nvarchar(30)  not null,
  [camera] int not null,
  [screen] float not null,
  [createDate] datetime default getdate(),
  [updateDate] datetime null ,
  [quanityfinal] int not null,
  [quantitysold] int  not null,
  [imgproduct] nvarchar(50)  not null,
  [thumnail] nvarchar(256)  not null,
  [description] nvarchar(500)  not null,
  [isActive] bit  default 1,
  [views] bigint default 0 ,
  [idGroup] int
)
GO

CREATE TABLE [Account] (
  [email] nvarchar(30) PRIMARY KEY,
  [password] nvarchar(100) not null,
  [fullname] nvarchar(30) not null,
  [address] nvarchar(100) not null,
  [phoneNumbers] varchar(11) not null,
  [createDate] datetime,
  [updateDate] datetime,
  [img] nvarchar(30),
  [gender] bit not null,
  [isActive] bit
)
GO

CREATE TABLE [Order] (
  [id] int IDENTITY(1,1) PRIMARY KEY,
  [status] nvarchar(30),
  [createDate] datetime,
  [createUpdate] datetime,
  [address] nvarchar(100) not null,
  [phoneNumbers] varchar(11) not null,
  [description] nvarchar(256) ,
  [idCustomer] nvarchar(30)
)
GO

CREATE TABLE [OrderDetails] (
  [id] int IDENTITY(1,1) PRIMARY KEY,
  [idProduct] int,
  [idOrder] int,
  [quanity] int not null,
  [price] float not null
)
GO

CREATE TABLE [Roles] (
  [id] char(10) PRIMARY KEY,
  [name] nvarchar(30)
)
GO

CREATE TABLE [Authorities] (
  [id] int IDENTITY(1,1) PRIMARY KEY,
  [username] nvarchar(30),
  [role] char(10)
)
GO


ALTER TABLE [Product] ADD FOREIGN KEY ([idGroup]) REFERENCES [GroupProduct] ([id])
GO

ALTER TABLE [Order] ADD FOREIGN KEY ([idCustomer]) REFERENCES [Account] ([email])
GO

ALTER TABLE [OrderDetails] ADD FOREIGN KEY ([idOrder]) REFERENCES [Order] ([id])
GO

ALTER TABLE [OrderDetails] ADD FOREIGN KEY ([idProduct]) REFERENCES [Product] ([id])
GO

ALTER TABLE [Authorities] ADD FOREIGN KEY ([role]) REFERENCES [Roles] ([id])
GO

ALTER TABLE [Authorities] ADD FOREIGN KEY ([username]) REFERENCES [Account] ([email])
GO




