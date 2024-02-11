-- 5. Który z spedytorów był najaktywniejszy w 1997 roku

select top 1 ShipVia, COUNT(*) as number_of_orders from Orders
group by ShipVia
order by number_of_orders desc