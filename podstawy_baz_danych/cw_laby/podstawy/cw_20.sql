-- Napisz instrukcję select tak aby wybrać numer zlecenia,
-- datę zamówienia, numer klienta dla wszystkich
-- niezrealizowanych jeszcze zleceń, dla których krajem
-- odbiorcy jest Argentyna

select  OrderID, OrderDate, CustomerID from Orders
where (RequiredDate > GETDATE() or ShippedDate is null) and ShipCountry = 'Argentina'

select orderid, orderdate, customers.CustomerID from orders inner join customers on orders.CustomerID=customers.CustomerID
where shippeddate is null and ShipCountry ='argentina'