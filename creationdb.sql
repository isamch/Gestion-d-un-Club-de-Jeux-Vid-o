-- Active: 1733769804947@@127.0.0.1@3306@test_for_join
-- creation tables:

CREATE TABLE JEU (
	jeu_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    titre varchar(100) NOT NULL,
    studio_dev varchar(100) NOT NULL,
    annee_sortie  DATE NOT NULL,
    genre  varchar(100),
   	multijoueur ENUM('oui', 'no') NOT NULL
   
);

CREATE TABLE MEMBER (
	member_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_name varchar(100) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    date_inscription  DATE NOT NULL
);


CREATE TABLE EMPRUNTER (
	epm_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    date_start DATE NOT NULL,
    date_retour_preuve DATE NOT NULL,
    date_retour_reelle  DATE NOT NULL,
    member_id int NOT NULL,
    jeu_id int NOT NULL,
    FOREIGN KEY (member_id) REFERENCES MEMBER(member_id) ON DELETE CASCADE ON 		UPDATE CASCADE,
    FOREIGN KEY (jeu_id) REFERENCES JEU(jeu_id) ON DELETE CASCADE ON 		UPDATE CASCADE
);




CREATE TABLE TOURNOI (
	tournoi_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tournoi_name varchar(100) UNIQUE NOT NULL,
    date_tournoi DATE NOT NULL,
    recomposant  varchar(100) NOT NULL
    
);


CREATE TABLE PARTICIPER (
	particip_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    scor INT NOT NULL,
    rang_final int NOT NULL,
    member_id int NOT NULL,
    tournoi_id int NOT NULL,
    FOREIGN KEY (member_id) REFERENCES MEMBER(member_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (tournoi_id) REFERENCES TOURNOI(tournoi_id) ON DELETE CASCADE ON UPDATE CASCADE  
);


CREATE TABLE ABONNENEMNT (
	abonnement_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    date_start DATE NOT NULL,
    date_fin DATE NOT NULL,
    member_id int NOT NULL,
    FOREIGN KEY (member_id) REFERENCES MEMBER(member_id) ON DELETE CASCADE ON UPDATE CASCADE
);



-- insert data:
-- jeu table :

INSERT INTO JEU (titre, studio_dev, annee_sortie, genre, multijoueur) VALUES
('FIFA 24', 'EA Sports', '2024-09-01', 'Sport', 'oui'),
('Call of Duty: MW2', 'Activision', '2023-10-10', 'Action', 'oui'),
('Minecraft', 'Mojang', '2011-11-18', 'Aventure', 'oui'),
('League of Legends', 'Riot Games', '2009-10-27', 'MOBA', 'oui'),
('Assassin''s Creed Mirage', 'Ubisoft', '2023-10-05', 'Aventure', 'no'),
('Fortnite', 'Epic Games', '2017-07-25', 'Battle Royale', 'oui'),
('Valorant', 'Riot Games', '2020-06-02', 'FPS', 'oui'),
('Tekken 8', 'Bandai Namco', '2024-01-26', 'Combat', 'oui'),
('Red Dead Redemption 2', 'Rockstar Games', '2018-10-26', 'Action/Aventure', 'no'),
('GTA V', 'Rockstar Games', '2013-09-17', 'Monde ouvert', 'oui');




-- member table :
INSERT INTO MEMBER (user_name, email, date_inscription) VALUES
('Yassine10', 'yassine.el@gmail.com', '2024-06-01'),
('Fatima_B', 'fatima.ben@yahoo.com', '2024-05-15'),
('Karim_A', 'karim.amrani@gmail.com', '2024-06-05'),
('Noura23', 'noura.ali@gmail.com', '2024-04-20'),
('Mehdi_C', 'mehdi.chafi@hotmail.com', '2024-06-10'),
('Aya_D', 'aya.daoudi@gmail.com', '2024-05-25'),
('Othman_H', 'othman.haddad@yahoo.com', '2024-06-12'),
('Khadija_T', 'khadija.tazi@gmail.com', '2024-04-15'),
('Said_El', 'said.elmalki@gmail.com', '2024-05-01'),
('Leila_M', 'leila.mehdi@yahoo.com', '2024-03-27');

-- EMPRUNTER TABLE:
INSERT INTO EMPRUNTER (date_start, date_retour_preuve, date_retour_reelle, member_id, jeu_id) VALUES
('2024-06-01', '2024-06-07', '2024-06-06', 1, 2),
('2024-06-03', '2024-06-10', '2024-06-09', 2, 5),
('2024-06-05', '2024-06-12', '2024-06-12', 3, 7),
('2024-06-07', '2024-06-14', '2024-06-14', 4, 8),
('2024-06-10', '2024-06-17', '2024-06-15', 5, 1),
('2024-06-12', '2024-06-19', '2024-06-18', 6, 3),
('2024-06-13', '2024-06-20', '2024-06-20', 7, 6),
('2024-06-14', '2024-06-21', '2024-06-21', 8, 4),
('2024-06-15', '2024-06-22', '2024-06-22', 9, 9),
('2024-06-16', '2024-06-23', '2024-06-23', 10, 10);

-- TOURNOI table:
INSERT INTO TOURNOI (tournoi_name, date_tournoi, recomposant) VALUES
('Tournoi FIFA 2024', '2024-07-01', '10000$ Cash Prize'),
('COD Championship', '2024-07-05', '5000$ Cash Prize'),
('Tournoi Minecraft', '2024-07-10', 'Special Trophy'),
('Valorant Cup 2024', '2024-07-15', '7000$ Cash Prize'),
('Tekken King 2024', '2024-07-20', 'Golden Medal');



-- PARTICIPER table:
INSERT INTO PARTICIPER (scor, rang_final, member_id, tournoi_id) VALUES
(1500, 1, 1, 1),
(2000, 1, 2, 2),
(1700, 2, 3, 3),
(1800, 3, 4, 4),
(2200, 1, 5, 5);  


-- ABONNENEMNT table:
INSERT INTO ABONNENEMNT (date_start, date_fin, member_id) VALUES
('2024-06-01', '2024-09-01', 1),
('2024-06-05', '2024-09-05', 2),
('2024-06-10', '2024-09-10', 3),
('2024-06-15', '2024-09-15', 4),
('2024-06-20', '2024-09-20', 5);




-- -- test join :
-- SELECT emprunter.epm_id, jeu.titre ,  jeu.genre , jeu.multijoueur, member.user_name , member.email FROM jeu
-- LEFT JOIN emprunter ON emprunter.jeu_id = jeu.jeu_id
-- LEFT JOIN member ON member.member_id = emprunter.member_id
-- ;


SELECT  participer.particip_id,
        participer.rang_final, 
        member.user_name, 
        tournoi.tournoi_name  
FROM member
LEFT JOIN participer ON member.member_id = participer.member_id
LEFT JOIN tournoi ON tournoi.tournoi_id = participer.tournoi_id;


-- UNION
-- SELECT  participer.particip_id,
--         participer.rang_final, 
--         member.user_name, 
--         tournoi.tournoi_name  
-- FROM member
-- RIGHT JOIN participer ON member.member_id = participer.member_id
-- RIGHT JOIN tournoi ON tournoi.tournoi_id = participer.tournoi_id;


SELECT * FROM member
  ORDER BY member.user_name DESC;




-- sum count of games:
SELECT COUNT(member.member_id) FROM member;

-- group by:
SELECT * FROM member GROUP BY member.date_inscription;


-- update:
UPDATE member 
set date_inscription = '2024-04-14' WHERE member_id = 10;



-- like :
SELECT * FROM member
WHERE user_name LIKE '%ka%';
