CREATE DATABASE RestaurantManagement;
USE RestaurantManagement;

CREATE TABLE Owner (
    OwnerID INT PRIMARY KEY,
    Name VARCHAR(100),
    PhoneNumber VARCHAR(20),
    Email VARCHAR(100),
    Address VARCHAR(255)
);

CREATE TABLE Restaurant (
    RestaurantID INT PRIMARY KEY,
    Name VARCHAR(100),
    Address VARCHAR(255),
    PhoneNumber VARCHAR(20),
    CuisineType VARCHAR(50)
);

CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY,
    ItemName VARCHAR(100),
    QuantityAvailable INT,
    UnitPrice DECIMAL(10, 2),
    SupplierID INT
);

CREATE TABLE Manager (
    ManagerID INT PRIMARY KEY,
    Name VARCHAR(100),
    PhoneNumber VARCHAR(20),
    Email VARCHAR(100),
    RestaurantID INT,
    FOREIGN KEY (RestaurantID) REFERENCES Restaurant(RestaurantID)
);

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    Role VARCHAR(50),
    PhoneNumber VARCHAR(20),
    Email VARCHAR(100),
    RestaurantID INT,
    FOREIGN KEY (RestaurantID) REFERENCES Restaurant(RestaurantID)
);

CREATE TABLE Menu (
    MenuID INT PRIMARY KEY,
    ItemName VARCHAR(100),
    Price DECIMAL(10, 2),
    Category VARCHAR(50),
    RestaurantID INT,
    FOREIGN KEY (RestaurantID) REFERENCES Restaurant(RestaurantID)
);

CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    PhoneNumber VARCHAR(20),
    Email VARCHAR(100),
    Address VARCHAR(255),
    LoyaltyPoints INT,
    PreferredPayment VARCHAR(50)
);

CREATE TABLE `Order` (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    Date DATE,
    TotalAmount DECIMAL(10, 2),
    PaymentMethod VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE DiningTable (
    TableID INT PRIMARY KEY,
    Seats INT,
    Shape VARCHAR(20),
    RestaurantID INT,
    FOREIGN KEY (RestaurantID) REFERENCES Restaurant(RestaurantID)
);

CREATE TABLE OrderedItem (
    OrderID INT,
    ItemID INT,
    Quantity INT,
    PricePerItem DECIMAL(10,2),
    TotalPrice DECIMAL(10,2),
    PRIMARY KEY (OrderID, ItemID),
    FOREIGN KEY (OrderID) REFERENCES `Order`(OrderID),
    FOREIGN KEY (ItemID) REFERENCES Menu(MenuID)
);

CREATE TABLE Bill (
    BillID INT PRIMARY KEY,
    OrderID INT,
    TotalAmount DECIMAL(10,2),
    Discount VARCHAR(10),
    FinalAmount DECIMAL(10,2),
    FOREIGN KEY (OrderID) REFERENCES `Order`(OrderID)
);

CREATE TABLE Chef (
    ChefID INT PRIMARY KEY,
    Name VARCHAR(100),
    Specialty VARCHAR(100),
    RestaurantID INT,
    FOREIGN KEY (RestaurantID) REFERENCES Restaurant(RestaurantID)
);

CREATE TABLE Waiter (
    WaiterID INT PRIMARY KEY,
    Name VARCHAR(100),
    PhoneNumber VARCHAR(20),
    RestaurantID INT,
    FOREIGN KEY (RestaurantID) REFERENCES Restaurant(RestaurantID)
);
-- Owner
INSERT INTO Owner VALUES 
(1, 'Sarah Johnson', '555-1234', 'sarah@example.com', '456 Maple Dr, Miami'),
(2, 'Mark Brown', '555-5678', 'markb@example.com', '789 Elm St, Denver'),
(3, 'Emily Davis', '555-9101', 'emily.d@example.com', '123 Oak Ln, New York'),
(4, 'James Taylor', '555-1123', 'james.t@example.com', '321 Birch Ave, Boston'),
(5, 'Laura Wilson', '555-1415', 'laura.w@example.com', '654 Pine Rd, Los Angeles');

-- Restaurant
INSERT INTO Restaurant VALUES 
(1, 'Ocean Dine', '123 Ocean Blvd, Miami', '555-3001', 'Seafood'),
(2, 'Mountain Cafe', '456 Hill St, Denver', '555-3002', 'Continental'),
(3, 'Urban Eats', '789 City Ave, New York', '555-3003', 'Fusion'),
(4, 'Cozy Corner', '321 Maple Dr, Boston', '555-3004', 'Italian'),
(5, 'Bistro Garden', '654 Elm Rd, Los Angeles', '555-3005', 'French');

-- Manager
INSERT INTO Manager VALUES
(1, 'Alice Martin', '555-2010', 'alice.martin@example.com', 1),
(2, 'Bob Evans', '555-2020', 'bob.evans@example.com', 2),
(3, 'Catherine Young', '555-2030', 'cathy.young@example.com', 3),
(4, 'Daniel Lee', '555-2040', 'daniel.lee@example.com', 4),
(5, 'Eva Clark', '555-2050', 'eva.clark@example.com', 5);

-- Employee
INSERT INTO Employee VALUES
(1, 'John Smith', 'Waiter', '555-3010', 'john.smith@example.com', 1),
(2, 'Grace Hall', 'Chef', '555-3020', 'grace.hall@example.com', 2),
(3, 'Tim Cook', 'Server', '555-3030', 'tim.cook@example.com', 3),
(4, 'Rachel Adams', 'Cleaner', '555-3040', 'rachel.adams@example.com', 4),
(5, 'Oscar Knight', 'Host', '555-3050', 'oscar.knight@example.com', 5);

-- Menu
INSERT INTO Menu VALUES
(1, 'Grilled Salmon', 18.99, 'Main Course', 1),
(2, 'Veggie Burger', 9.50, 'Main Course', 2),
(3, 'Mango Smoothie', 4.25, 'Beverage', 3),
(4, 'Pepperoni Pizza', 12.00, 'Main Course', 4),
(5, 'Chocolate Cake', 6.50, 'Dessert', 5);

-- Customer
INSERT INTO Customer VALUES
(1, 'David Ross', '555-4010', 'david.ross@example.com', '101 Sun St, Miami', 120, 'Credit Card'),
(2, 'Angela White', '555-4020', 'angela.white@example.com', '202 Moon St, Denver', 200, 'Cash'),
(3, 'Mike Green', '555-4030', 'mike.green@example.com', '303 Star St, New York', 75, 'Debit Card'),
(4, 'Lucy Gray', '555-4040', 'lucy.gray@example.com', '404 Sky St, Boston', 150, 'Credit Card'),
(5, 'Tom Blue', '555-4050', 'tom.blue@example.com', '505 Cloud St, Los Angeles', 50, 'Cash');

-- Order
INSERT INTO `Order` VALUES
(1, 1, '2025-05-01', 35.49, 'Credit Card'),
(2, 2, '2025-05-02', 15.00, 'Cash'),
(3, 3, '2025-05-03', 22.75, 'Debit Card'),
(4, 4, '2025-05-04', 45.00, 'Credit Card'),
(5, 5, '2025-05-05', 30.00, 'Cash');

-- DiningTable
INSERT INTO DiningTable VALUES
(1, 4, 'Round', 1),
(2, 2, 'Square', 2),
(3, 6, 'Rectangle', 3),
(4, 4, 'Round', 4),
(5, 2, 'Square', 5);

-- OrderedItem
INSERT INTO OrderedItem VALUES
(1, 1, 2, 18.99, 37.98),
(2, 2, 1, 9.50, 9.50),
(3, 3, 2, 4.25, 8.50),
(4, 4, 1, 12.00, 12.00),
(5, 5, 3, 6.50, 19.50);

-- Bill
INSERT INTO Bill VALUES
(1, 1, 37.98, '5%', 36.08),
(2, 2, 9.50, '0%', 9.50),
(3, 3, 8.50, '10%', 7.65),
(4, 4, 12.00, '0%', 12.00),
(5, 5, 19.50, '5%', 18.53);

-- Chef
INSERT INTO Chef VALUES
(1, 'Chef Antonio', 'Italian Cuisine', 1),
(2, 'Chef Mei', 'Asian Fusion', 2),
(3, 'Chef Carlos', 'Mexican Food', 3),
(4, 'Chef Olivia', 'Pastries & Cakes', 4),
(5, 'Chef Liam', 'French Cuisine', 5);

-- Waiter
INSERT INTO Waiter VALUES
(1, 'Steve Rogers', '555-6010', 1),
(2, 'Tony Stark', '555-6020', 2),
(3, 'Natasha Romanoff', '555-6030', 3),
(4, 'Bruce Banner', '555-6040', 4),
(5, 'Peter Parker', '555-6050', 5);

select * From customer
