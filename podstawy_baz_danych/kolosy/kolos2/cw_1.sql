-- 1. Wypisz te produkty które kupiło conajmniej 2 klientów
-- a) podzapytaniem
-- b) bez podzapytań
--a)
select ProductName from Products P
where ( select count(distinct customerid) from orders o
		inner join [Order Details] od on od.ProductID=p.ProductID and o.OrderID=od.OrderID
		group by productid)>=2
order by ProductName


--b)
select ProductName from Products P
join dbo.[Order Details] OD on P.ProductID = OD.ProductID
join dbo.Orders O on OD.OrderID = O.OrderID
group by ProductName
having count(O.CustomerID) >= 2
order by ProductName