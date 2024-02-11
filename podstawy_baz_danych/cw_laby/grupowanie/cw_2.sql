-- 2. Podaj maksymalną cenę produktu dla produktów o cenach poniżej 20$

select MAX(UnitPrice) as max_price from Products
where UnitPrice < 20

