-- Dla każdej kategorii podaj maksymalną i minimalną cenę produktu w tej kategorii
select CategoryID, MAX(UnitPrice) as max_price, MIN(UnitPrice) as min_price from Products
group by CategoryID with cube
