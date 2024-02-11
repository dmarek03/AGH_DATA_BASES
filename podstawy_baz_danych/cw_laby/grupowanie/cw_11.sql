-- 1. Wyświetl zamówienia dla których liczba pozycji zamówienia jest większa niż 5

select OrderID, COUNT(*) number_of_orders from [Order Details]
group by OrderID
order by number_of_orders desc