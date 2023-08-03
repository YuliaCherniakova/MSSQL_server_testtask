-- Создание таблицы dbo.SKU
CREATE TABLE dbo.SKU (
    ID INT IDENTITY PRIMARY KEY,
    Code VARCHAR(50) UNIQUE,
    Name VARCHAR(50),
    ComputedCode AS 's' + CONVERT(VARCHAR(50), ID) PERSISTED
);

-- Создание таблицы dbo.Family
CREATE TABLE dbo.Family (
    ID INT IDENTITY PRIMARY KEY,
    SurName VARCHAR(50),
    BudgetValue DECIMAL(10, 2)
);

-- Создание таблицы dbo.Basket
CREATE TABLE dbo.Basket (
    ID INT IDENTITY PRIMARY KEY,
    ID_SKU INT FOREIGN KEY REFERENCES dbo.SKU(ID),
    ID_Family INT FOREIGN KEY REFERENCES dbo.Family(ID),
    Quantity INT CHECK (Quantity >= 0),
    Value DECIMAL(10, 2) CHECK (Value >= 0),
    PurchaseDate DATE DEFAULT GETDATE(),
    DiscountValue DECIMAL(10, 2)
);