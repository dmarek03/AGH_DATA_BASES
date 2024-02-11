-- 4. Napisz polecenie które podaje listę książek (mumery ISBN) zarezerwowanych
-- przez osobę o nazwisku: Stephen A. Graff

select (firstname +' '+middleinitial+'. '+ lastname) as name , isbn from member m
join reservation r on m.member_no = r.member_no
where (firstname +' '+middleinitial+'. '+ lastname) = 'Stephen A. Graff'
--WHERE CONCAT(firstname, middleinitial, lastname) = 'StephenAGraff'