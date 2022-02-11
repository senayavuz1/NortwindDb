--Supplier'ların verdigi urun sayisi nedir.
-- yani supplier bana ne kadar urun veriyor.


select s.CompanyName, count(p.ProductID) as Adet
from Products p
inner join Suppliers s on s.SupplierID= p.SupplierID
Group by s.CompanyName

--select * from Suppliers where CompanyName ='Bigfoot Breweries'
--Select * from Products where SupplierID=16


-- Calisanların 1997 yilindaki satislari nedir

