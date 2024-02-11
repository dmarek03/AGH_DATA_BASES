-- 4. Podaj produkty kupowane przez więcej niż jednego klienta

select p.productid, ProductName from products p
where (select count(distinct customerid) from orders o
		inner join [Order Details] oo on oo.ProductID=p.ProductID and o.OrderID=oo.OrderID
		group by productid)>2
