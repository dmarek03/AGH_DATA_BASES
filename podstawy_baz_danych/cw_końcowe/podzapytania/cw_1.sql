-- 1. Wybierz nazwy i numery telefonów klientów , którym w 1997 roku przesyłki dostarczała firma United Package.

--a) wersja z podzapytaniami
SELECT CompanyName,Phone  from Customers
where exists (select * from orders where orders.CustomerID=customers.CustomerID and year(orders.ShippedDate)=1997
and orders.ShipVia=(select shipperid from shippers where CompanyName='United Package'))

-- b) wersja z joinami
select distinct C.CompanyName, C.Phone from Customers C
join Orders O on C.CustomerID = O.CustomerID
join Shippers S on O.ShipVia = S.ShipperID
where year(O.ShippedDate) = 1997 and S.CompanyName = 'United Package'