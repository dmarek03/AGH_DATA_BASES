-- 3. Wybierz nazwy i numery telefonów klientów , którym w 1997 roku przesyłki
-- dostarczała firma ‘United Package’

select  distinct C.CompanyName, C.Phone,
year(ShippedDate) as year, S.CompanyName from Customers C
join Orders O on C.CustomerID = O.CustomerID
join dbo.Shippers S on O.ShipVia = S.ShipperID
where year(ShippedDate) =1997 and S.CompanyName = 'United Package'

