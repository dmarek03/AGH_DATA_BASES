-- 5. Znajdź klientów, którzy w swojej nazwie mają w którymś miejscu słowo ‘Store’

select CustomerID,CompanyName from Customers
where CompanyName like '%Store%'