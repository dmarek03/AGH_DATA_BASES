-- 3. Klienci, którzy nie zamówili nigdy nic z kategorii 'Seafood' w trzech wersjach.

-- exists)
select CompanyName from Customers C
where not  exists(select * from Orders O where O.CustomerID = C.CustomerID and exists(
     select * from [Order Details] OD where OD.OrderID = O.OrderID and exists(
         select * from Products P  where P.ProductID = OD.ProductID and exists(
             select * from Categories CC where P.CategoryID = CC.CategoryID
              and CategoryName= 'Seafood'))))

-- join)
select CompanyName from Customers C
left join Orders O on C.CustomerID = O.CustomerID
left join [Order Details] OD on O.OrderID = OD.OrderID
left join dbo.Products P on OD.ProductID = P.ProductID
left join Categories CC on P.CategoryID = CC.CategoryID and CategoryName = 'Seafood'
group by CompanyName having count(CC.CategoryName) = 0

--not in)

select CompanyName from Customers C
where CustomerID not in (select CustomerID from Orders  where OrderID in
                         (select OrderID from [Order Details] where ProductID in
                         (select ProductID from Products where CategoryID in
                          ( select CategoryID from Categories where CategoryName='Seafood')
                         )))
























