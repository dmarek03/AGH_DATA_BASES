-- 2. Który z przewoźników był najaktywniejszy (przewiózł największą liczbę
-- zamówień) w 1997r, podaj nazwę tego przewoźnik

select top 1 S.CompanyName, count(O.ShipVia) as number_of_shippped_orders from Shippers S
join Orders O on S.ShipperID = O.ShipVia
where YEAR(O.ShippedDate) = 1997
group by S.CompanyName
order by number_of_shippped_orders desc