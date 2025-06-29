IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'ecommerce')
BEGIN
    CREATE DATABASE ecommerce;
END;
GO

USE ecommerce;
GO

IF OBJECT_ID('Departments', 'U') IS NULL
BEGIN
    CREATE TABLE Departments (
        DepartmentID INT PRIMARY KEY,
        DepartmentName VARCHAR(100)
    );
END;
GO

IF OBJECT_ID('Employees', 'U') IS NULL
BEGIN
    CREATE TABLE Employees (
        EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
        FirstName VARCHAR(50),
        LastName VARCHAR(50),
        DepartmentID INT FOREIGN KEY REFERENCES Departments(DepartmentID),
        Salary DECIMAL(10,2),
        JoinDate DATE
    );
END;
GO

INSERT INTO Departments (DepartmentID, DepartmentName)
SELECT 1, 'HR' UNION ALL
SELECT 2, 'Finance' UNION ALL
SELECT 3, 'IT' UNION ALL
SELECT 4, 'Marketing';
GO

INSERT INTO Employees (FirstName, LastName, DepartmentID, Salary, JoinDate)
SELECT 'John', 'Doe', 1, 5000.00, '2020-01-15' UNION ALL
SELECT 'Jane', 'Smith', 2, 6000.00, '2019-03-22' UNION ALL
SELECT 'Michael', 'Johnson', 3, 7000.00, '2018-07-30' UNION ALL
SELECT 'Emily', 'Davis', 4, 5500.00, '2021-11-05';
GO

IF OBJECT_ID('sp_CountEmployeesByDepartment', 'P') IS NOT NULL
    DROP PROCEDURE sp_CountEmployeesByDepartment;
GO

CREATE PROCEDURE sp_CountEmployeesByDepartment
    @DepartmentID INT
AS
BEGIN
    SELECT COUNT(*) AS TotalEmployees
    FROM Employees
    WHERE DepartmentID = @DepartmentID;
END;
GO
SELECT * FROM Employees WHERE DepartmentID = 3;
DELETE FROM Employees;
GO

INSERT INTO Employees (FirstName, LastName, DepartmentID, Salary, JoinDate)
SELECT 'John', 'Doe', 1, 5000.00, '2020-01-15' UNION ALL
SELECT 'Jane', 'Smith', 2, 6000.00, '2019-03-22' UNION ALL
SELECT 'Michael', 'Johnson', 3, 7000.00, '2018-07-30' UNION ALL
SELECT 'Emily', 'Davis', 4, 5500.00, '2021-11-05';

EXEC sp_CountEmployeesByDepartment @DepartmentID = 3;
