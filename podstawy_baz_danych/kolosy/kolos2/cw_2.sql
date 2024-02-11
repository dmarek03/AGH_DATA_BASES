-- 2. Znajdź produkt (podaj jego nazwę), który przyniósł najmniejszy
-- dochód (większy od zera) w 1996 roku


select (select ProductName from Products P where P.ProductID = Od.ProductID) as ProductName,
ROUND(SUM((1-Discount)*(Quantity*OD.UnitPrice)),2) from [Order Details] OD
group by (select ProductName from Products P where P.ProductID = Od.ProductID)