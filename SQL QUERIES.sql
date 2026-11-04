-- 1. JOIN QUERIES

-- Orders with customer names and total amounts
SELECT o.OrderID, c.Name AS CustomerName, o.Date, o.TotalAmount
FROM `Order` o
JOIN Customer c ON o.CustomerID = c.CustomerID;

-- Ordered menu items in each order
SELECT oi.OrderID, m.ItemName, oi.Quantity, oi.PricePerItem, oi.TotalPrice
FROM OrderedItem oi
JOIN Menu m ON oi.ItemID = m.MenuID;

-- Restaurants with their managers
SELECT r.Name AS RestaurantName, m.Name AS ManagerName
FROM Restaurant r
JOIN Manager m ON r.RestaurantID = m.RestaurantID;

-- Employees with the restaurant they work at
SELECT e.Name AS EmployeeName, e.Role, r.Name AS RestaurantName
FROM Employee e
JOIN Restaurant r ON e.RestaurantID = r.RestaurantID;

-- Bills with customer names and payment info
SELECT b.BillID, c.Name AS CustomerName, b.TotalAmount, b.Discount, b.FinalAmount
FROM Bill b
JOIN `Order` o ON b.OrderID = o.OrderID
JOIN Customer c ON o.CustomerID = c.CustomerID;

-- 2. DML QUERIES

-- Insert a new customer
INSERT INTO Customer (
    CustomerID, Name, PhoneNumber, Email, Address, LoyaltyPoints, PreferredPayment
) VALUES (
    6, 'Brian Stone', '555-4060', 'brian.stone@example.com', '606 Rain St, Miami', 80, 'Debit Card'
);

-- Update loyalty points of a customer
UPDATE Customer
SET LoyaltyPoints = 180
WHERE CustomerID = 1;

-- Delete an employee by ID
DELETE FROM Employee
WHERE EmployeeID = 4;

-- Insert a new menu item
INSERT INTO Menu (
    MenuID, ItemName, Price, Category, RestaurantID
) VALUES (
    6, 'Spicy Tacos', 10.99, 'Main Course', 3
);

-- Update the price of a menu item
UPDATE Menu
SET Price = 13.50
WHERE MenuID = 4;

-- 3. SELECT QUERIES

-- Top 3 customers by loyalty points
SELECT Name, LoyaltyPoints
FROM Customer
ORDER BY LoyaltyPoints DESC
LIMIT 3;

-- Count of employees per restaurant
SELECT r.Name AS RestaurantName, COUNT(e.EmployeeID) AS EmployeeCount
FROM Restaurant r
LEFT JOIN Employee e ON r.RestaurantID = e.RestaurantID
GROUP BY r.RestaurantID;

-- Total revenue from all orders
SELECT SUM(TotalAmount) AS TotalRevenue
FROM `Order`;

-- Orders with total amount greater than 25
SELECT *
FROM `Order`
WHERE TotalAmount > 25;

-- Waiters with the restaurants they work in
SELECT w.Name AS WaiterName, r.Name AS RestaurantName
FROM Waiter w
JOIN Restaurant r ON w.RestaurantID = r.RestaurantID;


