-- zad 1)
-- Dla każdego produktu z kategorii 'confections' podaj wartość przychodu za ten
-- produkt w marcu 1997 (wartość sprzedaży tego produktu bez opłaty za przesyłkę).
-- Jeśli dany produkt (należący do kategorii 'confections') nie był sprzedawany w tym
-- okresie to też powinien pojawić się na liście (wartość sprzedaży w takim przypadku
-- jest równa 0) (baza northwind)

with  t1 as (
select P.ProductID,ProductName, ROUND(SUM((1-Discount)*(Quantity*OD.UnitPrice)), 2)
as total_cost from Products P
join [Order Details] OD on P.ProductID = OD.ProductID
join dbo.Orders O on OD.OrderID = O.OrderID
join Categories C on P.CategoryID = C.CategoryID
where YEAR(OrderDate) = 1997 and MONTH(OrderDate) = 3 and CategoryName = 'Confections'
group by P.ProductID, ProductName)

select PP.ProductName, isnull(total_cost, 0) as total_cost from t1
right join Products PP on  PP.ProductID = t1.ProductID
order by total_cost desc