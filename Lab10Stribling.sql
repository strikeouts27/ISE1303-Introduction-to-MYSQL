
-- Describe to me the role of each user, the access needed, the views created and why. This may be in a text file or typed into the comments for the assignment.

-- Store Clerk 
-- create user clerk identified by 'clk'; 

-- A store clerk will need to sell products to a customer. They will also need to update customer accounts as customers are most likely to work with the clerk first. 
-- So we need to create views that allow the clerk to see the customers account and create new accounts and update existing accounts 

-- Clerkview 
-- grant select, insert, update(AccountID, FirstName, LastName, Address, City, State, PhoneNumber, ReceiptID, OrderID) ON customer to clerk; 

-- Manager 'mgr'; 
-- Customers may interact with the manager when there are problems. They may want the manager to do everything the clerk can do in addition to billing balance settiling and refunds.
-- They may want to close their acocunts as well. So the manager is given access to do that. 

-- GRANT SELECT, INSERT, UPDATE, DELETE ON boardgames TO manager;
-- GRANT SELECT, INSERT, UPDATE, DELETE ON boardgametype TO manager;
-- GRANT SELECT, INSERT, UPDATE, DELETE ON customer TO manager;
-- GRANT SELECT, INSERT, UPDATE, DELETE ON orders TO manager;
-- GRANT SELECT, INSERT, UPDATE, DELETE ON publisher TO manager;
-- GRANT SELECT, INSERT, UPDATE, DELETE ON receipt TO manager;

-- create user administrator identified by 'admin'; 
-- The directors may want reports of how the stores are doing. Thats when they send in the admdin to collect data about how the store is doing. The admin should have the most access. 

-- GRANT SELECT (AccountID, FirstName, LastName, Address, City, State, PhoneNumber, ReceiptID, OrderID, Balance), 
--       INSERT (AccountID, FirstName, LastName, Address, City, State, PhoneNumber, ReceiptID, OrderID, Balance), 
--       UPDATE (AccountID, FirstName, LastName, Address, City, State, PhoneNumber, ReceiptID, OrderID, Balance),
--       DELETE 
-- ON customer 
-- TO administrator;

-- Granting full powers to the admdin the most powerful user in the database. 
-- GRANT SELECT, INSERT, UPDATE, DELETE ON boardgames TO administrator;
-- GRANT SELECT, INSERT, UPDATE, DELETE ON boardgametype TO administrator;
-- GRANT SELECT, INSERT, UPDATE, DELETE ON customer TO administrator;
-- GRANT SELECT, INSERT, UPDATE, DELETE ON orders TO administrator;
-- GRANT SELECT, INSERT, UPDATE, DELETE ON publisher TO administrator;
-- GRANT SELECT, INSERT, UPDATE, DELETE ON receipt TO administrator;

-- CREATE VIEWS FOR EACH USER 

-- clerk view to create a customer. 
-- Create account view
-- CREATE VIEW CustomerAccountView AS
-- SELECT 
--     AccountID, 
--     FirstName, 
--     LastName, 
--     Address, 
--     City, 
--     State, 
--     PhoneNumber, 
--     Balance,
--     ReceiptID, 
--     OrderID,
--     CASE
--         WHEN Balance < 0 THEN 'Customer Is Owed Money' 
--         WHEN Balance = 0 THEN 'Customer is current on debts' 
--         WHEN Balance <= 50 THEN 'Low Balance' 
--         ELSE 'Customer account locked due to nonpayment' 
--     END AS `Account Status`
-- FROM customer;

-- manager view 
-- Managers need a view to see how much product is left and how much they need to order. 

-- CREATE VIEW ManagerInventoryView AS
-- SELECT 
--     BoardgamesID,
--     BoardgameName,
--     Publisher,
--     BoardgameType,
--     Price,
--     Inventory,
--     CASE 
--         WHEN Inventory = 0 THEN 'Out of Stock'
--         WHEN Inventory <= 5 THEN 'Low Stock'
--         WHEN Inventory <= 20 THEN 'Normal Stock'
--         ELSE 'High Stock'
--     END AS StockStatus
-- FROM boardgames;INSERT INTO `boardgames`.`orders`


-- admin view 
-- sometimes the admin needs to speak with the manager regarding correcting a bill. This view would help them see the bill. 

-- CREATE VIEW AdminCustomerBalanceView AS
-- SELECT 
--     AccountID,
--     FirstName,
--     LastName,
--     City,
--     State,
--     PhoneNumber,
--     Balance,
--     CASE 
--         WHEN Balance < 0 THEN 'Negative Balance'
--         WHEN Balance = 0 THEN 'Zero Balance'
--         WHEN Balance <= 50 THEN 'Low Balance'
--         ELSE 'Good Standing'
--     END AS AccountStatus
-- FROM customer;


-- FOR EACH USER CREATE QUERIES THE USERS WOULD USE. 

-- CLERK QUERIES 
-- VIEW CUSTOMER ACCOUNT
-- CREATE A CUSTOMER ACCOUNT
-- VIEW BOARDGAME INVENTORY TO SEE IF THE STORE HAS STOCK
-- VIEW WHAT THE CUSTOMER BOUGHT 
-- UPDATE CUSTOMER ACCOUNT INFORMATION

-- View the customer account query 
-- SELECT * FROM customer; 

-- CREATE A CUSTOMER ACCOUNT ALSO AN INSERT Query
-- INSERT INTO `boardgames`.`customer`
-- (`AccountID`,
-- `FirstName`,
-- `LastName`,
-- `Address`,
-- `City`,
-- `State`,
-- `PhoneNumber`,
-- `Balance`,
-- `ReceiptID`,
-- `OrderID`)
-- VALUES
-- (111111114,
-- 'Nicholas',
-- 'Hodgson',
-- '404 Geico Street',
-- 'Richardson',
-- 'Texas' ,
-- 888-888-8881,
-- 1,
-- 'REC12347',
-- 123456789104);

-- VIEW BOARDGAME INVENTORY TO SEE IF IT HAS STOCK 
-- SELECT b.boardgamename, b.inventory 
-- FROM boardgames AS b; 

-- VIEW WHAT THE CUSTOMER BOUGHT 
-- SELECT o.OrderID, o.AccountID, o.ReceiptID, o.CustomerName, o.BoardgameID, o.Quantity, o.TotalBalance
-- FROM orders AS o; 

-- UPDATE CUSTOMER ACCOUNT INFORMATION BECAUSE THEY MOVED 

-- UPDATE `boardgames`.`customer`
-- SET
-- `AccountID` = 11111111,
-- `FirstName` = 'Andrew',
-- `LastName` = 'Stribling',
-- `Address` = '404 Frustrated Programmer Ave',
-- `City` ='Frisco',
-- `State` = 'Texas',
-- `PhoneNumber` = '2142057821',
-- `Balance` = '00.00',
-- `ReceiptID` = 666666,
-- `OrderID` = 88888888
-- WHERE `AccountID` = 111111111; 

-- Manager QUERIES 
-- DELETE A CUSTOMER ACCOUNT (DELETE QUERY)
-- DELETE FROM CUSTOMER WHERE ACCOUNTID = 11111114;

-- UPDATE AN INVOICE TOTAL 
-- UPDATE `boardgames`.`customer`
-- SET
-- `AccountID` = 111111112,
-- `FirstName` = 'Stephen',
-- `LastName` = 'Heard',
-- `Address` = '404 Main Street',
-- `City` = 'Brock',
-- `State` = 'Texas',
-- `PhoneNumber` = 888-888-8888,
-- `Balance` = 100.00,
-- `ReceiptID` = 'REC12346',
-- `OrderID` = 123456789103
-- WHERE `AccountID` = 111111112;

-- VIEW CUSTOMER PURCHASE HISTORY (JOIN CUSTOMER WITH ORDER)
SELECT c.AccountID, c.FirstName, c.LastName, c.OrderID
FROM customer AS c
INNER JOIN receipt AS r 
ON c.AccountID = r.AccountID; INSERT INTO `boardgames`.`receipt`
(`AccountID`,
`ReceiptID`,
`CustomerName`,
`BoardgameID`,
`Quantity`,
`TotalBalance`)
VALUES
(11111111,
<{ReceiptID: }>,
<{CustomerName: }>,
<{BoardgameID: }>,
<{Quantity: }>,
<{TotalBalance: }>);


-- SEE CUSTOMER BALANCE
-- UPDATE A CUSTOMER BALANCE (UPDATE QUERY)








