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
insert into tuote(tuotenimi, kuvaus, hinta, trnro) values ('Kahvi', 'Musta kahvi.', 1.50,1),
('Espresso', 'Espresso kahvi.', 3, 1), ('Earl Grey', 'Maustettu musta tee.', 1, 3), ('Kamomillatee', 'Rauhoittava tee', 2, 3),
('Kaakao', 'Suklaakaakao.',2,2), ('Jäävesi', 'Kylmä vesi.', 0.2, 2), ('Brownie', 'Suklaaleivos.',3.35,4),('Viineri','Vaniljan ja mansikan makuinen leivos.',2.7,4)

