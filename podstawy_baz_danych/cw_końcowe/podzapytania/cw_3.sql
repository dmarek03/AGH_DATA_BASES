-- Wybierz nazwy i numery telefonów klientów, którzy nie kupowali produktów z kategorii Confections.


select CompanyName, Phone from Customers C
where not exists
    (select * from Orders O where O.CustomerID =C.CustomerID and exists
        (select * from [Order Details] OD where OD.OrderID = O.OrderID and exists
            (select * from Products P where P.ProductID = OD.ProductID and exists
                (select * from Categories CC where P.CategoryID = CC.CategoryID and CategoryName = 'Confections'))))


select distinct CompanyName, Phone from  Customers C
left join dbo.Orders O on C.CustomerID = O.CustomerID
left join [Order Details] OD on O.OrderID = OD.OrderID
left join Products P on OD.ProductID = P.ProductID
left join Categories CC on P.CategoryID = CC.CategoryID and CategoryName = 'Confections'
group by C.CustomerID, CompanyName, Phone having count(CC.CategoryID) = 0
