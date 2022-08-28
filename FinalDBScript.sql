USE SuperMarioGaming_Database

INSERT INTO [dbo].[Customers]
([CustomerID]
,[FirstName]
,[LastName]
,[EmailAddress]
,[PhoneNumber]
,[StreetLine1]
,[City]
,[State]
,[ZipCode])

VALUES

(1, 'Patrick', 'Flood', 'patrick@pdiddles.com', '8018018011', '67 E 6000 S', 'Big 
City', 'Utah', '89994'),
(2, 'Johnny', 'Bigboyguy', 'bigguy@gmail.com', '8013113131', '90 E 60 S', 'Salt Lake City', 
'Utah', '89094'),
(3, 'Dude', 'Johnson', 'johnsonboy@gmail.com', '8019808041', '700 E 49 S', 'Midvale', 'Utah', 
'87694'),
(4, 'Darren', 'Davis', 'judgedude@gmail.com', '8043113351', '540 W 4090 N', 'Hurricane', 'Utah', 
'89994'),
(5, 'Zach', 'Vernon', 'emailexample@gmail.com', '8012345678', '500 E 30 S', 'Saint George', 
'Utah', '87694'),
(6, 'Lily', 'Wilson', 'goodemail@gmail.com', '8012323434', '1000 W 1000 N', 'Kaysville', 'Utah', 
'84037');

GO

USE SuperMarioGaming_Database

INSERT INTO [dbo].[Products]
([ProductID]
,[ProductName]
,[BrandName]
,[Price])

VALUES
(1, 'Nintendo Switch', 'Nintendo', '$299.99'),
(2, 'Sony Playstation 5', 'Sony', '$499.99' ),
(3, 'Microsoft Xbox One Series X', 'Microsoft', '$499.99'),
(4, 'Super Smash Bros. Ultimate', 'Nintendo', '$59.99'),
(5, 'The Last of Us', 'Sony', '$69.99' ),
(6, 'Super Mario Odyssey', 'Nintendo', '$59.99'),
(7, 'Nintendo Pro Controller', 'Nintendo', '$69.99'),
(8, 'Playstation VR Headset', 'Sony', '$199.99' ),
(9, 'The Legend of Zelda: Breath of the Wild', 'Nintendo', '$59.99');

GO



USE [SuperMarioGaming_Database]


INSERT INTO [dbo].[Orders]
([OrderID],
[CustomerID],
[PaymentMethod]
,[PurchaseDate])

VALUES
(1, 1, 'Visa Card', GETDATE()),
(2, 1, 'Master Card', GETDATE()),
(3, 3, 'Visa Card', GETDATE()),
(4, 6, 'Master Card', GETDATE()),
(5, 3, 'Cash', GETDATE()),
(6, 2, 'Cash', GETDATE()),
(7, 5, 'Visa Card', GETDATE()),
(8, 2, 'Visa Card', GETDATE()),
(9, 4, 'Master Card', GETDATE())
GO

USE SuperMarioGaming_Database


INSERT INTO [dbo].[Employees]
([EmployeeID]
,[EmployeeFName]
,[EmployeeLName])

VALUES
(1, 'Patrick', 'Flood'),
(2, 'John', 'Smithers'),
(3, 'Coolman', 'Davis'),
(4, 'Jess', 'Gamerman'),
(5, 'Luigi', 'Mario');
GO


USE SuperMarioGaming_Database

SELECT        dbo.Customers.*
FROM            dbo.Customers
ORDER BY LastName DESC


USE SuperMarioGaming_Database

SELECT        dbo.Employees.*
FROM            dbo.Employees
ORDER BY EmployeeLName

USE SuperMarioGaming_Database

SELECT        PaymentMethod, OrderID, PurchaseDate
FROM            dbo.Orders
WHERE PaymentMethod = 'Visa Card'

USE SuperMarioGaming_Database

SELECT        *
FROM            dbo.Products
WHERE Price < 100.00

USE SuperMarioGaming_Database

SELECT        ReturnID, CustomerID, PaymentMethod
FROM            dbo.[Returns]
ORDER BY CustomerID ASC

SELECT        TOP (100) PERCENT dbo.Orders.*, dbo.Products.ProductID, dbo.Products.ProductName, dbo.Products.Price
FROM            dbo.Orders CROSS JOIN
                         dbo.Products
ORDER BY ProductName ASC


USE SuperMarioGaming_Database

SELECT OrderID, AVG(Price) AS AverageCostPerPurchases
FROM Orders
GROUP BY OrderID
HAVING AVG(Price) < $99.99
ORDER BY AverageCostPerPurchases DESC;
GO


SELECT RefundID, SUM(RefundAmount) AS TotalRefundAmount
FROM Returns
GROUP BY RefundID
HAVING SUM(RefundAmount) > $99.99
ORDER BY TotalRefundAmount DESC;
GO
