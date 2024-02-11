-- 1. Dla każdego produktu podaj jego nazwę, cenę, średnią cenę wszystkich
-- produktów oraz różnicę między ceną produktu a średnią ceną wszystkich
-- produktów

-- a) wersja z podzapytaniami
select  P.ProductName, P.UnitPrice, (select avg(PP.UnitPrice) from Products PP) as avg_price,
(UnitPrice - (select avg(PP.UnitPrice) from Products PP)) as diff
from Products P
order by diff desc

-- b) wersja z joinami
select P.ProductName, P.UnitPrice, avg(PP.UnitPrice) as avg,
(P.UnitPrice -avg(PP.UnitPrice) ) as diff
from Products P
cross join Products PP
group by P.ProductName, P.UnitPrice
order by diff desc
