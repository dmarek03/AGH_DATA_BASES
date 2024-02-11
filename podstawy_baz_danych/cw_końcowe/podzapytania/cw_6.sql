-- 3. Podaj wszystkie produkty których cena jest mniejsza niż średnia cena produktu
-- danej kategorii

-- a) wersja z podzapytaniami
select p.productid, p.productname, p.UnitPrice,
(select avg(pp.unitprice) from products pp where pp.CategoryID =p.CategoryID) as avg_price from products p
where p.unitprice<(select avg(pp.unitprice) from products pp where pp.CategoryID =p.CategoryID)
order by p.UnitPrice desc

-- b) wersja z joinami
select P.ProductName, P.UnitPrice,P.CategoryID, avg(pp.UnitPrice) as avg from Products P
join Products pp on P.CategoryID = pp.CategoryID
group by P.ProductName, P.UnitPrice, P.CategoryID
having P.UnitPrice < avg(pp.UnitPrice)
order by P.UnitPrice desc

