/*poner en uso la base datos*/
  use  AdventureWorks2016
  GO 

  /* listado de esquemas pertenecientes a esa base de datos*/

  SELECT Name 
  from sys.schemas
  GO 

  /*ver estructura de tabla */
   select name from sys.tables;
   GO

   /*VER LA ESTRUCTURA DE UNA TABLA ESPECIFICA*/

   EXEC sp_help 'humanResources.employee'
   go

   /* ver listado de departamentos de la empresa*/
select *
from HumanResources.Department
GO

/*visualisar solo los departamentos que pertenecen al grupo de marketing y ventas */
SELECT *
FROM HumanResources.Department 
where HumanResources.Department.GroupName like 'sales and marketing'
GO

/*ver listado de todos los empleados cuyo estado civil es casado */
SELECT HumanResources.Employee.BusinessEntityID AS 'CÓDIGO DE EMPLEADO',
HumanResources.Employee.MaritalStatus AS 'ESTADO CIVIL'
FROM HumanResources.Employee
where HumanResources.Employee.MaritalStatus like 'M'
GO 

/*ver el codigo de las ordenes de ventas y su respectivo mes y año */
SELECT SalesOrderHeader.SalesOrderID AS 'codigo de orden',
DATENAME(MONTH, Sales.SalesOrderHeader.OrderDate) AS 'mes',
YEAR(SalesOrderHeader.OrderDate) as 'año'
from Sales.SalesOrderHeader
where YEAR(Sales.SalesOrderHeader.OrderDate) = 2013
GO

/*visualizar la cantidad de ordenes de ventas del año 2013*/
SELECT YEAR(Sales.SalesOrderHeader.OrderDate) AS 'año',
COUNT(Sales.SalesOrderHeader.SalesOrderID) as 'cantidad'
from Sales.SalesOrderHeader
where YEAR(Sales.SalesOrderHeader.OrderDate) = 2011
group BY YEAR(Sales.SalesOrderHeader.OrderDate)
GO

/*visualizar la cantidad de ventas por mes del año 2011*/
select  DATENAME(MONTH,Sales.SalesOrderHeader.OrderDate) AS 'mes',
YEAR(Sales.SalesOrderHeader.OrderDate) AS 'año',
COUNT(Sales.SalesOrderHeader.SalesOrderID) as 'cantidad'
from Sales.SalesOrderHeader
where YEAR(Sales.SalesOrderHeader.OrderDate) = 2011
group BY YEAR(Sales.SalesOrderHeader.OrderDate)
GO

/*CANTIDAD DE EMPLEADOS POR CARGO*/
SELECT  count(HumanResources.Employee.BusinessEntityID) as 'total',
HumanResources.Employee.JobTitle as 'cargo'
FROM HumanResources.Employee
GROUP by humanResources.Employee.jobtitle
order BY COUNT(HumanResources.Employee.BusinessEntityID) DESC
GO

/*listado de empleados nombre, apellidos y su cargo*/
SELECT Person.FirstName as nombre, Person.LastName as apellido,
HumanResources.Department.Name as Departamento
FROM HumanResources.EmployeeDepartmentHistory
inner JOIN Person.Person
on HumanResources.EmployeeDepartmentHistory.BusinessEntityID = Person.BusinessEntityID
INNER JOIN HumanResources.Department
on HumanResources.EmployeeDepartmentHistory.DepartmentID = HumanResources.Department.DepartmentID
GO

/*muestra la cantidad de empleados por departamentos */
SELECT COUNT(HumanResources.EmployeeDepartmentHistory.BusinessEntityID) AS 'total',
HumanResources.Department.Name as Departamento
FROM HumanResources.EmployeeDepartmentHistory
inner JOIN Person.Person
on HumanResources.EmployeeDepartmentHistory.BusinessEntityID = Person.BusinessEntityID
INNER JOIN HumanResources.Department
on HumanResources.EmployeeDepartmentHistory.DepartmentID = HumanResources.Department.DepartmentID
GROUP by humanResources.Department.name
GO

/*muestrame la cantidad de empleados ppor estados civil en cada departamento */

SELECT HumanResources.Employee.MaritalStatus as 'Department',
HumanResources.Employee.MaritalStatus as 'estdo civil',
COUNT(HumanResources.Employee.BusinessEntityID) as 'cantidad'
FROM HumanResources.Employee
INNER JOIN humanResources.EmployeeDepartmentHistory
on humanResources.employee.BusinessEntityID = humanResources.EmployeeDepartmentHistory.BusinessEntityID
INNER JOIN HumanResources.Department
on HumanResources.EmployeeDepartmentHistory.DepartmentID = HumanResources.Department.DepartmentID
GROUP BY HumanResources.Employee.MaritalStatus, HumanResources.EmployeeDepartmentHistory.DepartmentID,
HumanResources.Department.Name
GO

/*muestrame el nombre, apellido, departamento, estado civil del empleado*/
 select Person.FirstName as nombre, Person.LastName as apellido
HumanResources.Department.Name as Departamento 
FROM HumanResources.EmployeeDepartmentHistory
 

 /*muestrame el listado de clientes que hicieron su orden de compra en los meses de noviembre y diciembre del año 2012 */

 /*muestrame la cantidad de ordenes de pedido atendidos por cada medio de envio*/ 

