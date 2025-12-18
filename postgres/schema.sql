-- Tabela Employees
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    LastName VARCHAR(50),
    FirstName VARCHAR(50),
    Title VARCHAR(100),
    TitleOfCourtesy VARCHAR(10),
    BirthDate TIMESTAMP,
    HireDate TIMESTAMP,
    Address VARCHAR(200),
    City VARCHAR(50),
    Region VARCHAR(50),
    PostalCode VARCHAR(20),
    Country VARCHAR(50),
    HomePhone VARCHAR(20),
    Extension VARCHAR(10),
    Notes TEXT,
    ReportsTo INT,
    PhotoPath VARCHAR(200),
    Salary NUMERIC(10,2)
);

-- Tabela Customers
CREATE TABLE Customers (
    CustomerID VARCHAR(10) PRIMARY KEY,
    CompanyName VARCHAR(100),
    ContactName VARCHAR(100),
    ContactTitle VARCHAR(50),
    Address VARCHAR(200),
    City VARCHAR(50),
    Region VARCHAR(50),
    PostalCode VARCHAR(20),
    Country VARCHAR(50),
    Phone VARCHAR(20)
);

-- Tabela Suppliers
CREATE TABLE Suppliers (
    SupplierID SERIAL PRIMARY KEY,
    CompanyName VARCHAR(100),
    ContactName VARCHAR(100),
    ContactTitle VARCHAR(50),
    Address VARCHAR(200),
    City VARCHAR(50),
    Region VARCHAR(50),
    PostalCode VARCHAR(20),
    Country VARCHAR(50),
    Phone VARCHAR(20),
    Fax VARCHAR(20),
    HomePage TEXT
);

-- Tabela Categories
CREATE TABLE Categories (
    CategoryID SERIAL PRIMARY KEY,
    CategoryName VARCHAR(50),
    Description TEXT
);

-- Tabela Products
CREATE TABLE Products (
    ProductID SERIAL PRIMARY KEY,
    ProductName VARCHAR(100),
    SupplierID INT,
    CategoryID INT,
    QuantityPerUnit VARCHAR(50),
    UnitPrice NUMERIC(10,2),
    UnitsInStock INT,
    UnitsOnOrder INT,
    ReorderLevel INT,
    Discontinued BOOLEAN
);

-- Tabela Shippers
CREATE TABLE Shippers (
    ShipperID SERIAL PRIMARY KEY,
    CompanyName VARCHAR(100),
    Phone VARCHAR(20)
);

-- Tabela Orders
CREATE TABLE Orders (
    OrderID SERIAL PRIMARY KEY,
    CustomerID VARCHAR(10),
    EmployeeID INT,
    OrderDate TIMESTAMP,
    RequiredDate TIMESTAMP,
    ShippedDate TIMESTAMP,
    ShipVia INT,
    Freight NUMERIC(10,2),
    ShipName VARCHAR(100),
    ShipAddress VARCHAR(200),
    ShipCity VARCHAR(50),
    ShipRegion VARCHAR(50),
    ShipPostalCode VARCHAR(20),
    ShipCountry VARCHAR(50)
);

-- Tabela OrderDetails
CREATE TABLE OrderDetails (
    OrderID INT,
    ProductID INT,
    UnitPrice NUMERIC(10,2),
    Quantity INT,
    Discount NUMERIC(3,2),
    PRIMARY KEY (OrderID, ProductID)
);



