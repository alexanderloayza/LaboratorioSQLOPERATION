/*muestra el nombre, apellido, departamento, estado civil del empleado*/
SELECT Person.FirstName AS nombre, Person.LastName AS Apellidos,
HumanResources.Department.Name AS
departamento,HumanResources.Employee.MaritalStatus AS 'estadocivil'
FROM HumanResources.EmployeeDepartmentHistory
INNER JOIN Person.Person on 
HumanResources.EmployeeDepartmentHistory.DepartmentID = Person.BusinessEntityID
INNER JOIN  HumanResources.Department
on HumanResources.EmployeeDepartmentHistory.DepartmentID = HumanResources.Department.DepartmentID
INNER JOIN  HumanResources.Employee
on HumanResources.EmployeeDepartmentHistory.DepartmentID = HumanResources.Employee.BusinessEntityID
go
/*muestra el listado de clientes que hicieron su orden de compra en los meses de noviembre
y diciembre del año 2012*/
SELECT CONCAT(Person.LastName,', ',Person.firstName) AS cliente
CONCAT(MONTH(orderdate),'/', YEAR(OrderDate)) AS 'Mes y Año'
from Sales.SalesOrderHeader
INNER JOIN Sales.Customer
on SalesOrderHeader.CustomerID = Sales.Customer.CustomerID
INNER JOIN person.Person 
on Customer.PersonID = Person.BusinessEntityID
WHERE YEAR(OrderDate) = 2012 AND (MONTH(OrderDate) BETWEEN 11 and 12 )

SELECT * FROM Sales.SalesOrderHeader
SELECT * FROM Sales.Customer WHERE CustomerID = 29825
SELECT * FROM Sales

/*Muestra la cantidad de ordenes de pedido atendidos por cada medio de envio*/
SELECT Purchasing.ShipMethod.Name AS 'medio de envio',
count(Purchasing.ShipMethod.Name) AS 'cantidad'
FROM Sales.SalesOrderHeader
INNER JOIN Purchasing.ShipMethod
on Sales.SalesOrderHeader.ShipMethodID = Purchasing.ShipMethod.ShipMethodID
GROUP BY Purchasing.ShipMethod.Name

SELECT * FROM Purchasing.ShipMethod

/*muestra la cantidad de ventas realizadas de acuerdo al pais*/
SELECT país = 
          case
          when Sales.SalesTerritory.CountryRegionCode ='AU' then 'australia'
          when Sales.SalesTerritory.CountryRegionCode ='US' then 'estados unidos'
          when Sales.SalesTerritory.CountryRegionCode ='DE' then 'alemania'

SELECT  Sales.SalesTerritory.CountryRegionCode AS 'pais',
COUNT(Sales.SalesOrderHeader.TerritoryID) AS 'total'
from Sales.SalesOrderHeader
INNER JOIN Sales.SalesTerritory
on Sales.SalesOrderHeader.TerritoryID = Sales.SalesTerritory.TerritoryID
GROUP by Sales.SalesTerritory.CountryRegionCode
ORDER BY Sales.SalesTerritory.CountryRegionCode

select count(sales.SalesOrderHeader.TerritoryID)
from Sales.SalesOrderHeader
WHERE SalesOrderHeader.TerritoryID = 5

SELECT Sales.SalesTerritory.Name
from sales.SalesTerritory.AND
