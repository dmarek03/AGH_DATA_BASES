-- 1. Wybierz nazwy i kraje wszystkich klientów, wyniki posortuj
-- według kraju, w ramach danego kraju nazwy firm posortuj alfabetycznie

select CompanyName, Country from Customers
order by Country, CompanyName