--SORULAR 

--1: calisanların yıllara göre satis dagılımı nedir ? FirstName, LastName, Count(*)
Select e.FirstName, e.LastName, year(o.OrderDate) yil, Count(o.OrderID) 
from Orders o 
inner join Employees e on o.EmployeeID=e.EmployeeID
Group by e.FirstName, e.LastName, year(o.OrderDate)
Order by e.FirstName, yil

--2: Müsterilerimin 1997 1.çeyrekte verdiği siparis sayısı nedir?
Select c.CompanyName, count(o.OrderID) Adet
from Customers c
inner join Orders o on o.CustomerID=c.CustomerID
where year(o.OrderDate)=1997 
and MONTH(o.OrderDate) between 1 and 3
Group By c.CompanyName

--3: kargo firmalarinin tasidigi siparis sayisi nedir?
select s.CompanyName, count(o.OrderID) satisAdedi
       from Shippers s
       inner join Orders o on s.ShipperID= o.ShipVia
       group by s.CompanyName
       order by 1

--4: ürünlerin 1997 yilindaki satis adetleri ve cirolari nedir?
select top 10 * from Orders
select top 10 * from [Order Details]
select top 10 * from Products

select p.ProductName, 
Sum(od.Quantity) Adet, 
SUM(od.quantity * od.UnitPrice) ciro    
from Products p
inner join [Order Details] od on od.ProductID=p.ProductID
inner join Orders o on o.OrderID=od.OrderID
where year(o.OrderDate)=1997
Group by p.ProductName
Order by ciro desc


