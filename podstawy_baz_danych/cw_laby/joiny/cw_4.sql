-- 4. Wybierz nazwy i numery telefonów dostawców, dostarczających produkty, których aktualnie nie ma w magazynie

select CompanyName, Phone, UnitsInStock from Suppliers S
join Products P on S.SupplierID = P.SupplierID
where isnull(UnitsInStock, 0) = 0