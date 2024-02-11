-- 3. Napisz polecenie które zwraca o użytkownikach biblioteki o nr 250, 342, i 1675
-- (dla każdego użytkownika: nr, imię i nazwisko członka biblioteki), oraz informację
-- o zarezerwowanych książkach (isbn, data)

select m.member_no, firstname, lastname, isbn, log_date from member m
left join dbo.reservation r on m.member_no = r.member_no
where m.member_no in ('250', '342', '1675')
