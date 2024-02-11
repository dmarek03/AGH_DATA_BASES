-- 3. Wyszukaj informacje o stanowisku pracowników, których nazwiska zaczynają się na literę B lub L

select * from Employees
where LastName like '[BL]%'