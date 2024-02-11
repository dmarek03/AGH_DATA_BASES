-- 2. Zmodyfikuj poprzedni przykład, aby pokazać tylko takie zamówienia, dla których
-- łączna liczbę zamówionych jednostek jest większa niż 250
select O.OrderID, C.CompanyName , sum(Quantity) as total_order_quanatity from Customers C
join  Orders O on C.CustomerID = O.CustomerID
join [Order Details] OD on O.OrderID = OD.OrderID
group by O.OrderID, C.CompanyName
having sum(Quantity) > 250
order by total_order_quanatity desc