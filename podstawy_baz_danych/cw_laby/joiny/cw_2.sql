-- 2. Wybierz nazwy produktów oraz inf. o stanie magazynu dla produktów dostarczanych przez firmę ‘Tokyo Traders

select ProductName,UnitsInStock, S.CompanyName from Products P
join Suppliers S on S.SupplierID = P.SupplierID
where S.CompanyName = 'Tokyo Traders'
