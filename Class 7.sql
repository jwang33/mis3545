USE AdventureWorks201; /"Set current database"/
/*1, Display the total amount collected from the orders for each order date. */
SELECT OrderDate, SUM(TotalDue) as DailyAmount, Count(SalesOrderID)as 
Number_of_Orders
FROM Sales.SalesOrderHeader
Group by OrderDate
Order by Sum(TotalDue) DESC;
/*2, Display the total amount collected from selling the products, 774 and 777. */
SELECT ProductID
Sum(LineTotal) as Total_Amount,
Avg(UnitPrice) as Avg_Unit_Price,
Max(UnitPrice) as Max_Unit_Price,
Min(Unit Price) as Min_Unit_Price
From Sales.SalesOrderDetail,
WHERE ProductID=774 OR 777
Group by ProductID;
/*3, Write a query to display the sales person BusinessEntityID, last name and first name of all the sales persons and the name of the territory to which they belong.*/
SELECT P.BusinessEntityID, T.Name as Territory_Name, PP.LastName, PP. FirstName
FROM Sales.SalesPerson as P
Join Sales.SalesTerritory as T
ON P.TerritoryID=T.TerritoryID 
JOIN Person.Person as PP
On P.BusinessEntityID-PP.BusinessEntityID
/*4,  Write a query to display the Business Entities of the customers that have the 'Vista' credit card. (Tables needed are Sales.CreditCard, Sales.PersonCreditCard, Person.Person"/
Select BusinessEntityID,*/
SELECT Person.BusinessEntityID, CardType, LastName,FirstName
FROM Sales.CreditCard
JOIN Sales.PersonCreditCard
ON Sales.CreditCard.CreditCardID=Sales.PersonCreditCard.CreditCardID
JOIN Person.Person
ON Sales.PersonCreditCard.BusinessEntityID=Person.BusinessEntityID;

*/Show the number of customers for each of credit cards*/
SELECT Cardtype, COUNT(BusinessEntityID) as Number_of_Customers
FROM Sales.CreditCard.BusinessEntityID=Person.BusinessEntityID
Where Cardtype ="Vista";

/*5, Write a query to display all the country region codes along with their corresponding territory IDs need tables: Person.CountryRegion, Sales.SalesTerritory" */
SELECT CR.CountryRegionCode, ST.TerritoryID
FROM Person.CountryRegion as CR
Full Outer Join Sales.SalesTerritory as ST
On CR.CountryRegionCode = ST.CountryRegionCode
/*6, Find out the average of the total dues of all the orders.*/
SELECT AVG(TotalDue)
FROM Sales.SalesOrderHeader

/*7, Write a query to report the sales order ID of those orders where the total value is greater than the average of ....use subqury */
SELECT SalesOrderID, TotalDue
FROM Sales.SalesOrderHeader
WHERE TotalDue >
(SELECT AVG(TotalDue)
FROM Sales.SalesOrderHeader);