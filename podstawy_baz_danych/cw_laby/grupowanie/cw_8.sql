-- 3. Podaj maksymalną i minimalną cenę zamawianego produktu dla każdego zamówienia

select OrderID, MAX(UnitPrice) as max_price, MIN(UnitPrice) as min_price
from [Order Details]
group by OrderID
order by OrderID