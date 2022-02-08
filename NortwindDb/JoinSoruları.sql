--SORULAR 

--1: calisanların yıllara göre satis dagılımı nedir ? FirstName, LastName, Count(*)
Select e.FirstName, e.LastName, year(o.OrderDate) yil, Count(o.OrderID) 
from Orders o 
inner join Employees e on o.EmployeeID=e.EmployeeID
Group by e.FirstName, e.LastName, year(o.OrderDate)
Order by e.FirstName, yil

--2: Müsterilerimin 1997 1.çeyrekte verdiği siparis sayısı nedir?
