-- 2. Dla każdej kategorii produktu (nazwa), podaj łączną wartość zamówionych przez
-- klientów jednostek towarów z tek kategorii

select C.CategoryName, ROUND(sum((1-OD.Discount)*(OD.UnitPrice*OD.Quantity)), 2) as total_cost from Categories C
join Products P on C.CategoryID = P.CategoryID
join dbo.[Order Details] OD on P.ProductID = OD.ProductID
group by C.CategoryName
order by total_cost desc