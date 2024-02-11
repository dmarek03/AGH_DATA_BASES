-- 2. Posortuj zamówienia wg maksymalnej ceny produktu

select OrderID, max(UnitPrice) as max_price from [Order Details]
group by OrderID
order by max_price desc