-- 2. Wybierz nazwy i adresy wszystkich klientów mających siedziby we Francji lub w Hiszpanii

select CompanyName, Address, Country from Customers
where Country in ('Spain' , 'France')