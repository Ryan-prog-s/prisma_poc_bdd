BEGIN TRY

BEGIN TRAN;

-- CreateTable
CREATE TABLE [dbo].[AP_ArbreGenealogique] (
    [LastName] VARCHAR(10),
    [FirstName] VARCHAR(10),
    [Age] INT,
    [Dad] INT,
    [Mom] INT,
    [id] INT NOT NULL IDENTITY(1,1),
    CONSTRAINT [PK_AP_ArbreGenealogique] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [dbo].[Categories] (
    [CategoryID] INT NOT NULL IDENTITY(1,1),
    [CategoryName] VARCHAR(50) NOT NULL,
    [Description] TEXT,
    [Picture] IMAGE,
    CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED ([CategoryID])
);

-- CreateTable
CREATE TABLE [dbo].[CustomerCustomerDemo] (
    [CustomerID] CHAR(10) NOT NULL,
    [CustomerTypeID] NCHAR(10) NOT NULL,
    CONSTRAINT [PK_CustomerCustomerDemo] PRIMARY KEY NONCLUSTERED ([CustomerID],[CustomerTypeID])
);

-- CreateTable
CREATE TABLE [dbo].[CustomerDemographics] (
    [CustomerTypeID] NCHAR(10) NOT NULL,
    [CustomerDesc] NTEXT,
    CONSTRAINT [PK_CustomerDemographics] PRIMARY KEY NONCLUSTERED ([CustomerTypeID])
);

-- CreateTable
CREATE TABLE [dbo].[Customers] (
    [CustomerID] CHAR(10) NOT NULL,
    [CompanyName] VARCHAR(50) NOT NULL,
    [ContactName] VARCHAR(50),
    [ContactTitle] VARCHAR(50),
    [Address] VARCHAR(60),
    [City] VARCHAR(50),
    [Region] VARCHAR(50),
    [PostalCode] VARCHAR(50),
    [Country] VARCHAR(50),
    [Phone] VARCHAR(50),
    [Fax] VARCHAR(50),
    CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED ([CustomerID])
);

-- CreateTable
CREATE TABLE [dbo].[db_parti_politique] (
    [id] INT NOT NULL,
    [nom] VARCHAR(1),
    [tendance] VARCHAR(1),
    [fondation] DATETIME,
    CONSTRAINT [KEY_ID] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [dbo].[dg_elues] (
    [id] INT NOT NULL,
    [date_election] DATETIME NOT NULL,
    [suppleant] INT,
    [numero_identification] INT,
    [nom] VARCHAR(1),
    [prenom] VARCHAR(1),
    [adresse] VARCHAR(1),
    [parti_politique] INT,
    [assemblee] VARCHAR(1),
    [group] INT,
    CONSTRAINT [KEYS_ID] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [dbo].[dg_person] (
    [nom] VARCHAR(1) NOT NULL,
    [prenom] VARCHAR(1) NOT NULL,
    [id] INT NOT NULL,
    [pere] INT,
    [mere] INT,
    [conjoint] INT,
    CONSTRAINT [dg_person_pk] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [dbo].[Employees] (
    [EmployeeID] INT NOT NULL IDENTITY(1,1),
    [LastName] VARCHAR(50) NOT NULL,
    [FirstName] VARCHAR(50) NOT NULL,
    [Title] VARCHAR(50),
    [TitleOfCourtesy] VARCHAR(50),
    [BirthDate] DATETIME,
    [HireDate] DATETIME,
    [Address] VARCHAR(60),
    [City] VARCHAR(50),
    [Region] VARCHAR(50),
    [PostalCode] VARCHAR(50),
    [Country] VARCHAR(50),
    [HomePhone] VARCHAR(50),
    [Extension] VARCHAR(50),
    [Notes] TEXT,
    [ReportsTo] INT,
    [PhotoPath] VARCHAR(255),
    CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED ([EmployeeID])
);

-- CreateTable
CREATE TABLE [dbo].[EmployeeTerritories] (
    [EmployeeID] INT NOT NULL,
    [TerritoryID] VARCHAR(50) NOT NULL,
    CONSTRAINT [PK_EmployeeTerritories] PRIMARY KEY NONCLUSTERED ([EmployeeID],[TerritoryID])
);

-- CreateTable
CREATE TABLE [dbo].[group_elues] (
    [id] INT NOT NULL,
    [president] INT,
    [parti_politique] INT,
    CONSTRAINT [PK_ID] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [dbo].[Order Details] (
    [OrderID] INT NOT NULL,
    [ProductID] INT NOT NULL,
    [UnitPrice] MONEY NOT NULL CONSTRAINT [DF_Order_Details_UnitPrice] DEFAULT 0,
    [Quantity] SMALLINT NOT NULL CONSTRAINT [DF_Order_Details_Quantity] DEFAULT 1,
    [Discount] REAL NOT NULL CONSTRAINT [DF_Order_Details_Discount] DEFAULT 0,
    CONSTRAINT [PK_Order_Details] PRIMARY KEY CLUSTERED ([OrderID],[ProductID])
);

-- CreateTable
CREATE TABLE [dbo].[Orders] (
    [OrderID] INT NOT NULL IDENTITY(1,1),
    [CustomerID] CHAR(10),
    [EmployeeID] INT,
    [OrderDate] DATETIME,
    [RequiredDate] DATETIME,
    [ShippedDate] DATETIME,
    [ShipVia] INT,
    [Freight] MONEY CONSTRAINT [DF_Orders_Freight] DEFAULT 0,
    [ShipName] VARCHAR(50),
    [ShipAddress] VARCHAR(60),
    [ShipCity] VARCHAR(50),
    [ShipRegion] VARCHAR(50),
    [ShipPostalCode] VARCHAR(50),
    [ShipCountry] VARCHAR(50),
    CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED ([OrderID])
);

-- CreateTable
CREATE TABLE [dbo].[Parents] (
    [ChildId] INT NOT NULL,
    [ParentId] INT NOT NULL,
    CONSTRAINT [PK_Parents] PRIMARY KEY CLUSTERED ([ChildId],[ParentId])
);

-- CreateTable
CREATE TABLE [dbo].[Persons] (
    [Id] INT NOT NULL,
    [Firstname] VARCHAR(50),
    [Lastname] VARCHAR(50),
    [Born] DATETIME,
    [FatherId] INT,
    [MotherId] INT,
    CONSTRAINT [PK_Persons_1] PRIMARY KEY CLUSTERED ([Id])
);

-- CreateTable
CREATE TABLE [dbo].[Products] (
    [ProductID] INT NOT NULL IDENTITY(1,1),
    [ProductName] VARCHAR(50) NOT NULL,
    [SupplierID] INT,
    [CategoryID] INT,
    [QuantityPerUnit] VARCHAR(50),
    [UnitPrice] MONEY CONSTRAINT [DF_Products_UnitPrice] DEFAULT 0,
    [UnitsInStock] SMALLINT CONSTRAINT [DF_Products_UnitsInStock] DEFAULT 0,
    [UnitsOnOrder] SMALLINT CONSTRAINT [DF_Products_UnitsOnOrder] DEFAULT 0,
    [ReorderLevel] SMALLINT CONSTRAINT [DF_Products_ReorderLevel] DEFAULT 0,
    [Discontinued] BIT NOT NULL CONSTRAINT [DF_Products_Discontinued] DEFAULT 0,
    CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED ([ProductID])
);

-- CreateTable
CREATE TABLE [dbo].[Region] (
    [RegionID] INT NOT NULL,
    [RegionDescription] CHAR(50) NOT NULL,
    CONSTRAINT [PK_Region] PRIMARY KEY NONCLUSTERED ([RegionID])
);

-- CreateTable
CREATE TABLE [dbo].[Shippers] (
    [ShipperID] INT NOT NULL IDENTITY(1,1),
    [CompanyName] VARCHAR(50) NOT NULL,
    [Phone] VARCHAR(50),
    CONSTRAINT [PK_Shippers] PRIMARY KEY CLUSTERED ([ShipperID])
);

-- CreateTable
CREATE TABLE [dbo].[Suppliers] (
    [SupplierID] INT NOT NULL IDENTITY(1,1),
    [CompanyName] VARCHAR(50) NOT NULL,
    [ContactName] VARCHAR(50),
    [ContactTitle] VARCHAR(50),
    [Address] VARCHAR(60),
    [City] VARCHAR(50),
    [Region] VARCHAR(50),
    [PostalCode] VARCHAR(50),
    [Country] VARCHAR(50),
    [Phone] VARCHAR(50),
    [Fax] VARCHAR(50),
    [HomePage] TEXT,
    CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED ([SupplierID])
);

-- CreateTable
CREATE TABLE [dbo].[sysdiagrams] (
    [name] NVARCHAR(128) NOT NULL,
    [principal_id] INT NOT NULL,
    [diagram_id] INT NOT NULL IDENTITY(1,1),
    [version] INT,
    [definition] VARBINARY(max),
    CONSTRAINT [PK__sysdiagr__C2B05B61997ABE38] PRIMARY KEY CLUSTERED ([diagram_id]),
    CONSTRAINT [UK_principal_name] UNIQUE NONCLUSTERED ([principal_id],[name])
);

-- CreateTable
CREATE TABLE [dbo].[Territories] (
    [TerritoryID] VARCHAR(50) NOT NULL,
    [TerritoryDescription] VARCHAR(50) NOT NULL,
    [RegionID] INT NOT NULL,
    CONSTRAINT [PK_Territories] PRIMARY KEY NONCLUSTERED ([TerritoryID])
);

-- CreateIndex
CREATE NONCLUSTERED INDEX [CategoryName] ON [dbo].[Categories]([CategoryName]);

-- CreateIndex
CREATE NONCLUSTERED INDEX [City] ON [dbo].[Customers]([City]);

-- CreateIndex
CREATE NONCLUSTERED INDEX [CompanyName] ON [dbo].[Customers]([CompanyName]);

-- CreateIndex
CREATE NONCLUSTERED INDEX [PostalCode] ON [dbo].[Customers]([PostalCode]);

-- CreateIndex
CREATE NONCLUSTERED INDEX [Region] ON [dbo].[Customers]([Region]);

-- CreateIndex
CREATE NONCLUSTERED INDEX [LastName] ON [dbo].[Employees]([LastName]);

-- CreateIndex
CREATE NONCLUSTERED INDEX [PostalCode] ON [dbo].[Employees]([PostalCode]);

-- CreateIndex
CREATE NONCLUSTERED INDEX [OrderID] ON [dbo].[Order Details]([OrderID]);

-- CreateIndex
CREATE NONCLUSTERED INDEX [OrdersOrder_Details] ON [dbo].[Order Details]([OrderID]);

-- CreateIndex
CREATE NONCLUSTERED INDEX [ProductID] ON [dbo].[Order Details]([ProductID]);

-- CreateIndex
CREATE NONCLUSTERED INDEX [ProductsOrder_Details] ON [dbo].[Order Details]([ProductID]);

-- CreateIndex
CREATE NONCLUSTERED INDEX [CustomerID] ON [dbo].[Orders]([CustomerID]);

-- CreateIndex
CREATE NONCLUSTERED INDEX [CustomersOrders] ON [dbo].[Orders]([CustomerID]);

-- CreateIndex
CREATE NONCLUSTERED INDEX [EmployeeID] ON [dbo].[Orders]([EmployeeID]);

-- CreateIndex
CREATE NONCLUSTERED INDEX [EmployeesOrders] ON [dbo].[Orders]([EmployeeID]);

-- CreateIndex
CREATE NONCLUSTERED INDEX [OrderDate] ON [dbo].[Orders]([OrderDate]);

-- CreateIndex
CREATE NONCLUSTERED INDEX [ShippedDate] ON [dbo].[Orders]([ShippedDate]);

-- CreateIndex
CREATE NONCLUSTERED INDEX [ShippersOrders] ON [dbo].[Orders]([ShipVia]);

-- CreateIndex
CREATE NONCLUSTERED INDEX [ShipPostalCode] ON [dbo].[Orders]([ShipPostalCode]);

-- CreateIndex
CREATE NONCLUSTERED INDEX [CategoriesProducts] ON [dbo].[Products]([CategoryID]);

-- CreateIndex
CREATE NONCLUSTERED INDEX [CategoryID] ON [dbo].[Products]([CategoryID]);

-- CreateIndex
CREATE NONCLUSTERED INDEX [ProductName] ON [dbo].[Products]([ProductName]);

-- CreateIndex
CREATE NONCLUSTERED INDEX [SupplierID] ON [dbo].[Products]([SupplierID]);

-- CreateIndex
CREATE NONCLUSTERED INDEX [SuppliersProducts] ON [dbo].[Products]([SupplierID]);

-- CreateIndex
CREATE NONCLUSTERED INDEX [CompanyName] ON [dbo].[Suppliers]([CompanyName]);

-- CreateIndex
CREATE NONCLUSTERED INDEX [PostalCode] ON [dbo].[Suppliers]([PostalCode]);

-- AddForeignKey
ALTER TABLE [dbo].[AP_ArbreGenealogique] ADD CONSTRAINT [FK_AP_ArbreGenealogique_Dad] FOREIGN KEY ([Dad]) REFERENCES [dbo].[AP_ArbreGenealogique]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[AP_ArbreGenealogique] ADD CONSTRAINT [FK_AP_ArbreGenealogique_Mom] FOREIGN KEY ([Mom]) REFERENCES [dbo].[AP_ArbreGenealogique]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[CustomerCustomerDemo] ADD CONSTRAINT [FK_CustomerCustomerDemo] FOREIGN KEY ([CustomerTypeID]) REFERENCES [dbo].[CustomerDemographics]([CustomerTypeID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[CustomerCustomerDemo] ADD CONSTRAINT [FK_CustomerCustomerDemo_Customers] FOREIGN KEY ([CustomerID]) REFERENCES [dbo].[Customers]([CustomerID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[dg_elues] ADD CONSTRAINT [FK_GROUP] FOREIGN KEY ([group]) REFERENCES [dbo].[group_elues]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[dg_elues] ADD CONSTRAINT [FK_PARTI_POLITIQUE] FOREIGN KEY ([parti_politique]) REFERENCES [dbo].[db_parti_politique]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[dg_elues] ADD CONSTRAINT [FK_SUPPLEANT] FOREIGN KEY ([suppleant]) REFERENCES [dbo].[dg_elues]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[dg_person] ADD CONSTRAINT [FK_PERSON_CONJOINT] FOREIGN KEY ([conjoint]) REFERENCES [dbo].[dg_person]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[dg_person] ADD CONSTRAINT [FK_PERSON_MERE] FOREIGN KEY ([mere]) REFERENCES [dbo].[dg_person]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[dg_person] ADD CONSTRAINT [FK_PERSON_PERE] FOREIGN KEY ([pere]) REFERENCES [dbo].[dg_person]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Employees] ADD CONSTRAINT [FK_Employees_Employees] FOREIGN KEY ([ReportsTo]) REFERENCES [dbo].[Employees]([EmployeeID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[EmployeeTerritories] ADD CONSTRAINT [FK_EmployeeTerritories_Employees] FOREIGN KEY ([EmployeeID]) REFERENCES [dbo].[Employees]([EmployeeID]) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[EmployeeTerritories] ADD CONSTRAINT [FK_EmployeeTerritories_Territories] FOREIGN KEY ([TerritoryID]) REFERENCES [dbo].[Territories]([TerritoryID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[group_elues] ADD CONSTRAINT [FK_PRESIDENT] FOREIGN KEY ([president]) REFERENCES [dbo].[dg_elues]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Order Details] ADD CONSTRAINT [FK_Order_Details_Orders] FOREIGN KEY ([OrderID]) REFERENCES [dbo].[Orders]([OrderID]) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Order Details] ADD CONSTRAINT [FK_Order_Details_Products] FOREIGN KEY ([ProductID]) REFERENCES [dbo].[Products]([ProductID]) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Orders] ADD CONSTRAINT [FK_Orders_Customers] FOREIGN KEY ([CustomerID]) REFERENCES [dbo].[Customers]([CustomerID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Orders] ADD CONSTRAINT [FK_Orders_Employees] FOREIGN KEY ([EmployeeID]) REFERENCES [dbo].[Employees]([EmployeeID]) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Orders] ADD CONSTRAINT [FK_Orders_Shippers] FOREIGN KEY ([ShipVia]) REFERENCES [dbo].[Shippers]([ShipperID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Parents] ADD CONSTRAINT [FK_Parents_Persons] FOREIGN KEY ([ChildId]) REFERENCES [dbo].[Persons]([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Parents] ADD CONSTRAINT [FK_Parents_Persons1] FOREIGN KEY ([ParentId]) REFERENCES [dbo].[Persons]([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Persons] ADD CONSTRAINT [FK_Persons_Persons] FOREIGN KEY ([FatherId]) REFERENCES [dbo].[Persons]([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Persons] ADD CONSTRAINT [FK_Persons_Persons1] FOREIGN KEY ([MotherId]) REFERENCES [dbo].[Persons]([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Products] ADD CONSTRAINT [FK_Products_Categories] FOREIGN KEY ([CategoryID]) REFERENCES [dbo].[Categories]([CategoryID]) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Products] ADD CONSTRAINT [FK_Products_Suppliers] FOREIGN KEY ([SupplierID]) REFERENCES [dbo].[Suppliers]([SupplierID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Territories] ADD CONSTRAINT [FK_Territories_Region] FOREIGN KEY ([RegionID]) REFERENCES [dbo].[Region]([RegionID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

COMMIT TRAN;

END TRY
BEGIN CATCH

IF @@TRANCOUNT > 0
BEGIN
    ROLLBACK TRAN;
END;
THROW

END CATCH
