-- Posortuj wyniki w zapytaniu z poprzedniego punktu wg:
-- a) łącznej wartości zamówień
-- b) łącznej liczby zamówionych przez klientów jednostek towarów.

--a)
select C.CategoryName, ROUND(sum((1-OD.Discount)*(OD.UnitPrice*OD.Quantity)), 2) as total_cost from Categories C
join Products P on C.CategoryID = P.CategoryID
join dbo.[Order Details] OD on P.ProductID = OD.ProductID
group by C.CategoryName
order by total_cost desc

--b)
select C.CategoryName,sum(OD.Quantity) as total_quantity ,
ROUND(sum((1-OD.Discount)*(OD.UnitPrice*OD.Quantity)), 2) as total_cost from Categories C
join Products P on C.CategoryID = P.CategoryID
join dbo.[Order Details] OD on P.ProductID = OD.ProductID
group by C.CategoryName
order by total_quantity desc