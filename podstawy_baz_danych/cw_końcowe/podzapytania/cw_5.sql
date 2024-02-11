-- 2. Podaj wszystkie produkty których cena jest mniejsza niż średnia cena produktu


-- a) wersja z podzapytaniami
select P.ProductName,P.UnitPrice, (select avg(PP.UnitPrice) from Products PP) as avg_price
from Products P
where P.UnitPrice < (select avg(PP.UnitPrice) from Products PP)
order by P.UnitPrice desc

-- b) wersja z joinami
select p.productid, p.productname, p.UnitPrice from products p
cross join products pp
group by p.productid, p.productname, p.UnitPrice
having p.unitprice<avg(pp.unitprice)
order by  UnitPrice desc