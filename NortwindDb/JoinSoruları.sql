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
---------------------------------------------------------------

/*
   Inner Join Kullanimi

*/
Select s.CompanyName, count(o.OrderID)
from Orders o
right join Shippers s on s.ShipperID=o.ShipVia
Group by s.CompanyName

--1997 yilindaki satislarin aylara gore dagilimi
select MONTH(OrderDate) Ay, count(*) Adet
from Orders
where year(OrderDate) = 1997
Group by MONTH(OrderDate)

--1997 yilindaki satislarin urunlere göre dagilimi
select p.productName, 
sum(od.quantity) Adet, 
-- 1.ciro yontemi: Sum(od.quantity*od.UnitPrice) - ((od.quantity*od.UnitPrice)*od.Discount)
-- 2.ciro yontemi:
sum(od.UnitPrice*(1-od.Discount) * od.Quantity) Ciro
from Products p
inner join [Order Details] od on od.ProductID=p.ProductID
inner join Orders o on o.OrderID=od.OrderID
where year(o.OrderDate)=1997 
Group by p.ProductName
having sum(od.UnitPrice*(1-od.Discount) * od.Quantity) < 10000
order by ciro desc
-------------------------------------------------------------------

-- Select Case When Kullanimi

select FirstName , LastName, 
case country
when 'USA' then 'Amerika'
when 'UK' then 'Ingiltere'
end
from Employees

-- SubQuery => iç içe sorgu yada alt sorgu

select top 1 * from Products Order by UnitPrice desc

Select * from Products
where UnitPrice= (select max(UnitPrice) from Products)

-- Ortalama fiyatin altında kalan urunler hangileridir?
Select * from Products
where UnitPrice < (select avg(UnitPrice) from Products)

-- Ürünler tablosunda hiç satisi yapilmayan urun var mi?
select * from Products
where ProductID not in (select ProductID from [Order Details])

select *
from products p
left join [Order Details] od on od.ProductID=p.ProductID
where OrderID is null

-- Hiç siparis almayıp yan gelip yatan personelin listesi
select * from employees e
where not exists e.EmployeeID (select emploeeId from orders)

