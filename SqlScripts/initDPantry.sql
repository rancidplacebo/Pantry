USE DPantry
GO

DROP TABLE IF EXISTS tblEvents;
DROP TABLE IF EXISTS tblEventTypes;
DROP TABLE IF EXISTS tblItemTypes;
DROP TABLE IF EXISTS tblBrands;
DROP TABLE IF EXISTS tblStorageTypes;
DROP TABLE IF EXISTS tblUnitTypes;
DROP TABLE IF EXISTS tblCategoryTypes;
DROP TABLE IF EXISTS tblFoodCsvStaging;

CREATE TABLE tblFoodCsvStaging (	
	ActionDate date,
    Action varchar(10) NOT NULL,
    Quantity int NOT NULL,
    Brand varchar(100) NOT NULL,
    Storage varchar(25) NOT NULL,
    Description varchar(250) NOT NULL,
    Size decimal(18,2) NOT NULL,
    Units varchar(25) NOT NULL,
    ExpirationDate date NOT NULL,
    Cost decimal(18,2),
    Category varchar(25) NOT NULL,
    Notes varchar(1000)
)

CREATE TABLE tblBrands (
	Id int IDENTITY(1,1) PRIMARY KEY,
	Description varchar(100) NOT NULL
);
GO

CREATE TABLE tblStorageTypes (
	Id int IDENTITY(1,1) PRIMARY KEY,
	Description varchar(25) NOT NULL
);
GO

CREATE TABLE tblUnitTypes (
	Id int IDENTITY(1,1) PRIMARY KEY,
	Description varchar(25) NOT NULL
);
GO

CREATE TABLE tblCategoryTypes (
	Id int IDENTITY(1,1) PRIMARY KEY,
	Description varchar(25) NOT NULL
);
GO

CREATE TABLE tblEventTypes (
	Id int IDENTITY(1,1) PRIMARY KEY,
	Description varchar(10) NOT NULL
);
GO

CREATE TABLE tblItemTypes (
	Id int IDENTITY(1,1) PRIMARY KEY,
	BrandId int FOREIGN KEY REFERENCES tblBrands(Id) NOT NULL,
	StorageId int FOREIGN KEY REFERENCES tblStorageTypes(Id) NOT NULL,
	UnitId int FOREIGN KEY REFERENCES tblUnitTypes(Id) NOT NULL,
	CategoryId int FOREIGN KEY REFERENCES tblCategoryTypes(Id) NOT NULL,
	Description varchar(250) NOT NULL,
	Size decimal(18,2) NOT NULL,
	AdditionalInfo varchar(1000)
)
GO

CREATE TABLE tblEvents (
	Id int IDENTITY(1,1) PRIMARY KEY,
	TypeId int FOREIGN KEY REFERENCES tblEventTypes(Id) NOT NULL,
	ItemId int FOREIGN KEY REFERENCES tblItemTypes(Id) NOT NULL,
	Quantity int NOT NULL,
	Expiration Date NOT NULL,
	Cost decimal(18,2),
);
GO

--INSERT INTO tblStorageTypes (Description)
--VALUES ('jar'), ('can'), ('box'), ('bag'), ('bottle');

--INSERT INTO tblUnitTypes (Description)
--VALUES ('oz'), ('fl oz'), ('bars');

--INSERT INTO tblCategoryTypes (Description)
--VALUES ('vegetable'),('meat'),('fruit'),('pasta'),('soup'),
--       ('beans'),('snack'),('sauce'),('condiment'),('rice'),
--	   ('grain'),('meal');

--INSERT INTO tblEventTypes (Description) 
--VALUES ('Add'),('Use'),('Give');
