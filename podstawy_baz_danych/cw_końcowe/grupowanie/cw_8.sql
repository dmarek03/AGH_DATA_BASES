-- 3. Dla każdego spedytora/przewoźnika podaj wartość "opłata za przesyłkę"
-- przewożonych przez niego zamówień w latach o 1996 do 1997

select ShipVia, SUM(Freight) as freight from Orders
where YEAR(ShippedDate) between 1996 and 1997
group by ShipVia