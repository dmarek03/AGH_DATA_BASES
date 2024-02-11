-- 2. Wyświetl klientów dla których w 1998 roku zrealizowano więcej niż 8 zamówień
-- (wyniki posortuj malejąco wg łącznej kwoty za dostarczenie zamówień dla
-- każdego z klientów)

select CustomerID, COUNT(*) as number_of_orders from Orders
where YEAR(ShippedDate) = 1998
group by CustomerID
having COUNT(*) > 8
order by number_of_orders desc