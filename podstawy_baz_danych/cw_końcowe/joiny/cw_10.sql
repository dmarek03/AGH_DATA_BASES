-- 1. Dla każdego przewoźnika (nazwa) podaj liczbę zamówień które przewieźli w 1997r

select S.CompanyName, count(O.ShipVia) as number_of_shippped_orders from Shippers S
join Orders O on S.ShipperID = O.ShipVia
where YEAR(O.ShippedDate) = 1997
group by S.CompanyName
order by number_of_shippped_orders desc