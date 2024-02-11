-- 5. Wybierz nazwy produktów oraz inf. o stanie magazynu dla produktów
-- dostarczanych przez firmę ‘Tokyo Traders’

select ProductName, UnitsInStock from Products
where SupplierID = (select SupplierID from Suppliers where CompanyName  = 'Tokyo Traders')
order by UnitsInStock desc