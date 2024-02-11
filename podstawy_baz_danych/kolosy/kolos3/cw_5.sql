-- 1. Podział na company, year month i suma freight

select CompanyName, SUM(Freight) as total_freight,
YEAR(ShippedDate) as year, MONTH(ShippedDate) as month from Shippers
join dbo.Orders O on Shippers.ShipperID = O.ShipVia
group by CompanyName, YEAR(ShippedDate), MONTH(ShippedDate)