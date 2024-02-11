-- 1. Podaj maksymalną cenę zamawianego produktu dla każdego zamówienia

select OrderID, max(UnitPrice) as max_price from [Order Details]
group by OrderID
order by max_price desc
