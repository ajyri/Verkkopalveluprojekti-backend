create DATABASE kahvila;
use kahvila;

drop table if exists tuoteryhma, tuote;

create table tuoteryhma (
trnro int primary key AUTO_increment,
trnimi varchar (255) NOT NULL UNIQUE
);

create table tuote (
tuotenro int primary key AUTO_increment,
tuotenimi varchar (255) NOT NULL,
kuvaus varchar (255),
hinta float unsigned NOT NULL,
trnro int,
FOREIGN KEY(trnro) REFERENCES tuoteryhma(trnro)
);

insert into tuoteryhma(trnimi) values ('Kahvit'),('Muut juomat'),('Teet'),('Leivokset');
-- Uudet tuotteet lisätty tuonne sekaan. Kannattaa poistaa tuote-taulu, luoda se uudelleen ja ajaa nää tuotteet kaikki kerralla :)
insert into tuote(tuotenimi, kuvaus, hinta, trnro) values ('Kahvi', 'Musta kahvi.', 1.50,1),
('Espresso', 'Espresso kahvi.', 3, 1),('Cappuccino', 'Espressoa, kuumaa maitoa ja maitovaahto.',3.70,1),
('Latte','1/4 Espressoa ja 3/4 maitovaahtoa.',4.10,1),('Americano','Espressoa ja kuumaa vettä.',2.50,1),
('Jäälatte','Jääpaloilla höystetty latte.',2.50,1),('Earl Grey', 'Maustettu musta tee.', 1, 3),
('Kamomillatee', 'Rauhoittava tee.', 2, 3),('Vihreä tee', 'Maailman suosituin teelaji.',1.50, 3),
('Valkoinen tee', 'Vähiten käsitelty ja luonnonmukaisin.', 2.20, 3), ('Oolong','Osittain hapatettu tee.',3.10,3),
('Rooibos', 'Kafeiiniton yrttitee.', 2.50, 3),('Kaakao', 'Suklaakaakao.',2,2), ('Jäävesi', 'Kylmä vesi.', 0.2, 2),
('Jaffa', 'Appelsiinilimsa.', 3, 2),('Cola', 'Colanmakuinen limsa.', 3, 2),('Omenamehu', 'Omenantuoremehu.', 3, 2),
('Appelsiinimehu', 'Appelsiinituoremehu.', 3, 2),('Brownie', 'Suklaaleivos.',3.35,4),
('Viineri','Vaniljan ja mansikan makuinen leivos.',2.7,4),('Chocolate Chip Cookie','Suklaahippukeksi.',3,4),
('Pääsiäisleivos','Keväisesti koristeltu leivos.',4.20,4),('Berliininmunkki','Kuorrutettu hillomunkki.',3.10,4),
('Voisilmäpulla','Perinteinen voisilmäpulla',2.20,4);

ALTER TABLE tuote ADD kuva varchar(255);

UPDATE tuote SET kuva = 'kahvi_place.jpg';

UPDATE tuote SET kuva = 'berliininmunkki.jpg' WHERE tuotenimi = 'Berliininmunkki';
UPDATE tuote SET kuva = 'paasiasleivos.jpg' WHERE tuotenimi = 'Pääsiäisleivos';
UPDATE tuote SET kuva = 'voisilmapulla.jpg' WHERE tuotenimi = 'Voisilmäpulla';
UPDATE tuote SET kuva = 'brownie.jpg' WHERE tuotenimi = 'Brownie';
UPDATE tuote SET kuva = 'viineri.jpg' WHERE tuotenimi = 'Viineri';
UPDATE tuote SET kuva = 'cookie.jpg' WHERE tuotenimi = 'Chocolate Chip Cookie';