
Select ASCII ('a')
Select char (97)
--Aratmak istedigimiz metin icerisindeki karakterin index'ini verir
select CHARINDEX('@','ali@gmail')
--Soldan itibaren verilen deger kadar karakteri alir
select left('Bugun Gunlerden Cuma',5)
select right('Bugun Gunlerden Cuma',5)
select len('Bugun Gunlerden Cuma',5) -- uzunlugunu verir
Select lower('Bugun Gunlerden Cuma',5) --verilen degeri kucuk harfe cevirir
Select lower('Bugun Gunlerden Cuma',5) as [Buyuk harfe cevirir]
Select LTRIM('                Bugun Gunlerden Cuma',5)
Select RTRIM('Bugun Gunlerden Cuma',5                )
Select RTRIM(LTRIM('     Bugun Gunlerden Cuma     ')) 
sELECT REPLACE('birbirbirilerine','bir','üç')

-- substring verilen baslangıc index'inden baslayarak verilen deger kadarini alir
select substring('Bugun Gunlerden Cuma',7,3)

select reverse('Bugun Gunlerden Cuma') 
select replicate('Bugun Gunlerden Cuma',2) 
select concat(FirstName+Space(1), LastName) from Employees

select CONVERT(int,25.50) 
select CEILING(25.1) -- HERZAMAN YUKARI YUVARLAR
SELECT FLOOR (25.9) -- HERZAMAN ASAJI YUVARLAR

SELECT @@VERSION

SELECT @@SERVERNAME

SELECT top 2 FirstName, len(FirstName) 
FROM Employees
Order by 2


-- En pahali urunum hangisidir

Select top 1 * from Products
order by UnitPrice desc


select * from Products
where UnitPrice = (select max(UnitPrice) from Products)

--fiyat ortalamasının uzerinde olan urunlerim hangileri

select * from Products
where UnitPrice > (SELECT AVG(UnitPrice) FROM Products)

select * from Products
where ProductID not in (select ProductID from [Order Details])

--Subquery'lerde herzaman tek sutun cagrilabilir

select ProductName,
(select categoryName from Categories where categoryID = Products.CategoryID) CategoryName,UnitPrice
from Products


