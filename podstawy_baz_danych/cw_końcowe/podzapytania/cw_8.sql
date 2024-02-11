-- 2. Dla każdego produktu podaj jego nazwę kategorii, nazwę produktu, cenę, średnią
-- cenę wszystkich produktów danej kategorii oraz różnicę między ceną produktu a
-- średnią ceną wszystkich produktów danej kategorii

-- a) wersja z podzapytaniami
select distinct  P.ProductName, P.UnitPrice,
(select C.CategoryName from Categories C where C.CategoryID = P.CategoryID) as category,
(select avg(PP.UnitPrice) from Products PP where P.CategoryID = PP.CategoryID) as avg_category_price,
P.UnitPrice -(select avg(PP.UnitPrice) from Products PP where P.CategoryID = PP.CategoryID) as diff
from Products P
order by diff desc

-- b) wersja z joinami
select P.ProductName, P.UnitPrice,C.CategoryName, avg(PP.UnitPrice) as avg, P.UnitPrice -avg(PP.UnitPrice) as diff
from Products P
join dbo.Categories C on C.CategoryID = P.CategoryID
cross join Products PP
where C.CategoryID = PP.CategoryID
group by P.ProductName, P.UnitPrice,CategoryName
order by diff desc