-- 1. Wybierz nazwy i adresy wszystkich klientów mających siedziby w Londynie

select CompanyName, Address, City from Customers
where City = 'London'