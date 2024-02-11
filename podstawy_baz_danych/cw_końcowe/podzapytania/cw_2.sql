-- 2. Wybierz nazwy i numery telefonów klientów, którzy kupowali produkty z kategorii
-- Confections.

select companyname, phone from customers c
where exists
(select * from orders o where o.CustomerID=c.CustomerID and exists
	(select * from [Order Details] oo where oo.OrderID=o.OrderID and exists
		(select * from products p where p.ProductID=oo.ProductID and exists
			(select * from categories cc where cc.CategoryID=p.CategoryID and categoryname='Confections'))))