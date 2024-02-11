-- 2. Wyszukaj informacje o stanowisku pracowników, których
-- nazwiska zaczynają się na literę z zakresu od B do L

select * from Employees
where LastName like '[B-L]%'
order by LastName