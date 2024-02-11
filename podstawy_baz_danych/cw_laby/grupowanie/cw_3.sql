-- 3. Podaj maksymalną i minimalną i średnią cenę produktu dla produktów o
-- produktach sprzedawanych w butelkach (‘bottle’)

select MAX(UnitPrice) as max_price , MIN(UnitPrice) as min_price from Products
where QuantityPerUnit like '%bottle%'