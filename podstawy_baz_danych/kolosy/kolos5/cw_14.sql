-- zad 2)
-- Napisz polecenie które wyświetla imiona i nazwiska dorosłych członków biblioteki,
-- mieszkających w Arizonie (AZ) lub Kalifornii (CA), których wszystkie dzieci są
-- urodzone przed '2000-10-14'

select firstname, lastname, state, j.birth_date from member m
join adult a on m.member_no = a.member_no
join dbo.juvenile j on a.member_no = j.adult_member_no
where state  in ('AZ' , 'CA')  and j.birth_date <'2000.10.14'
group by firstname, lastname,state, birth_date
order by j.birth_date desc