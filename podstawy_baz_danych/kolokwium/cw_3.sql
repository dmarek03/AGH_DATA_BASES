--zamówienia z freight > avg(freight) danego roku

select OrderID from Orders O
where Freight > (Select AVG(OO.Freight) from Orders OO
where YEAR(OO.OrderDate) = YEAR(O.OrderDate))
