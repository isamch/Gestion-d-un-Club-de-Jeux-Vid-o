


-- test join :
SELECT emprunter.epm_id, jeu.titre ,  jeu.genre , jeu.multijoueur, member.user_name , member.email FROM jeu
LEFT JOIN emprunter ON emprunter.jeu_id = jeu.jeu_id
LEFT JOIN member ON member.member_id = emprunter.member_id
;


-- full join :
SELECT  participer.particip_id,
        participer.rang_final, 
        member.user_name, 
        tournoi.tournoi_name  
FROM member
LEFT JOIN participer ON member.member_id = participer.member_id
LEFT JOIN tournoi ON tournoi.tournoi_id = participer.tournoi_id;

UNION
SELECT  participer.particip_id,
        participer.rang_final, 
        member.user_name, 
        tournoi.tournoi_name  
FROM member
RIGHT JOIN participer ON member.member_id = participer.member_id
RIGHT JOIN tournoi ON tournoi.tournoi_id = participer.tournoi_id;


-- affichage by Order incre
SELECT * FROM member
  ORDER BY member.user_name DESC;




--  count of games:
SELECT COUNT(member.member_id) FROM member;

-- group by:
SELECT * FROM member GROUP BY member.date_inscription;


-- update:
UPDATE member 
set date_inscription = '2024-04-14' WHERE member_id = 10;



-- like :
SELECT * FROM member
WHERE user_name LIKE '%ka%';


-- filter
SELECT * FROM jeu
WHERE annee_sortie > 2020;

-- between:
SELECT *
FROM tournoi
WHERE date_tournoi BETWEEN '2024-07-01' AND '2024-07-15';



-- get eeach user total emprunter:
SELECT 
member.user_name, COUNT(*) AS total_emprunter
FROM member
JOIN emprunter ON emprunter.member_id = member.member_id
JOIN jeu ON emprunter.jeu_id = jeu.jeu_id
GROUP BY member.user_name;





-- get eeach user total emprunter:
SELECT 
member.user_name, COUNT(*) AS total_emprunter
FROM member
JOIN emprunter ON emprunter.member_id = member.member_id
JOIN jeu ON emprunter.jeu_id = jeu.jeu_id
GROUP BY member.user_name;



-- get  user with max emprunter:
SELECT 
member.user_name, COUNT(*) AS total_emprunter
FROM member
JOIN emprunter ON emprunter.member_id = member.member_id
JOIN jeu ON emprunter.jeu_id = jeu.jeu_id
GROUP BY member.user_name
ORDER BY total_emprunter DESC
LIMIT 2;


SELECT MAX(total_emprunter) AS max_emprunter
FROM 
(
    SELECT 
    member.user_name, COUNT(*) AS total_emprunter
    FROM member
    JOIN emprunter ON emprunter.member_id = member.member_id
    JOIN jeu ON emprunter.jeu_id = jeu.jeu_id
    GROUP BY member.user_name
) AS subselect;




-- member specific by game:
SELECT jeu.titre , member.user_name FROM jeu
INNER JOIN emprunter ON emprunter.jeu_id = jeu.jeu_id
INNER JOIN member ON emprunter.member_id = member.member_id
WHERE member.user_name = 'Yassine10';
