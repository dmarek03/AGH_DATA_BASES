-- Dla każdej kategorii produktu (nazwa), podaj łączną liczbę zamówionych przez
-- klientów jednostek towarów z tej kategorii.
select C.CategoryName, sum(Quantity) as total_ordered_quantity from Categories C
join Products P on C.CategoryID = P.CategoryID
join dbo.[Order Details] OD on P.ProductID = OD.ProductID
group by C.CategoryName
order by total_ordered_quantity desc
