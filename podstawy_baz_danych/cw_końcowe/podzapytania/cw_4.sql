-- 1. Dla każdego produktu podaj maksymalną liczbę zamówionych jednostek

select ProductName, (select  max(Quantity) from [Order Details] OD where OD.ProductID = P.ProductID)
as max_quantity from Products P
order by max_quantity desc



select ProductName,  max(OD.Quantity) as max_quanitity from Products P
join dbo.[Order Details] OD on P.ProductID = OD.ProductID
group by ProductName
order by max_quanitity desc
