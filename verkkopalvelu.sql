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
UPDATE tuote SET kuva = 'paasiaisleivos.jpg' WHERE tuotenimi = 'Pääsiäisleivos';
UPDATE tuote SET kuva = 'voisilmapulla.jpg' WHERE tuotenimi = 'Voisilmäpulla';
UPDATE tuote SET kuva = 'brownie.jpg' WHERE tuotenimi = 'Brownie';
UPDATE tuote SET kuva = 'viineri.jpg' WHERE tuotenimi = 'Viineri';
UPDATE tuote SET kuva = 'cookie.jpg' WHERE tuotenimi = 'Chocolate Chip Cookie';
UPDATE tuote SET kuva = 'mustakahvi.jpg' WHERE tuotenimi = 'Kahvi';
UPDATE tuote SET kuva = 'espresso.jpg' WHERE tuotenimi = 'Espresso';
UPDATE tuote SET kuva = 'cappuccino.jpg' WHERE tuotenimi = 'Cappuccino';
UPDATE tuote SET kuva = 'latte.jpg' WHERE tuotenimi = 'Latte';
UPDATE tuote SET kuva = 'americano.jpg' WHERE tuotenimi = 'Americano';
UPDATE tuote SET kuva = 'jaalatte.jpg' WHERE tuotenimi = 'Jäälatte';
UPDATE tuote SET kuva = 'earlgrey.jpg' WHERE tuotenimi = 'Earl Grey';
UPDATE tuote SET kuva = 'kamomillatee.jpg' WHERE tuotenimi = 'Kamomillatee';
UPDATE tuote SET kuva = 'vihreatee.jpg' WHERE tuotenimi = 'Vihreä tee';
UPDATE tuote SET kuva = 'valkoinentee.jpg' WHERE tuotenimi = 'Valkoinen tee';
UPDATE tuote SET kuva = 'oolong.jpg' WHERE tuotenimi = 'Oolong';
UPDATE tuote SET kuva = 'rooibos.jpg' WHERE tuotenimi = 'Rooibos';
UPDATE tuote SET kuva = 'jaavesi.jpg' WHERE tuotenimi = 'Jäävesi';
UPDATE tuote SET kuva = 'kaakao.jpg' WHERE tuotenimi = 'Kaakao';
UPDATE tuote SET kuva = 'jaffa.jpg' WHERE tuotenimi = 'Jaffa';
UPDATE tuote SET kuva = 'cola.jpg' WHERE tuotenimi = 'Cola';
UPDATE tuote SET kuva = 'omenamehu.jpg' WHERE tuotenimi = 'Omenamehu';
UPDATE tuote SET kuva = 'appelsiinimehu.jpg' WHERE tuotenimi = 'Appelsiinimehu';

-- Muokataan tuotteiden kuvauksia tarkemmiksi:
-- Kahvit:
UPDATE tuote SET kuvaus = 'Presidentti suodatinkahvi, noin 2 dl. Laktoositon. Gluteeniton.' WHERE tuotenimi = 'Kahvi';
UPDATE tuote SET kuvaus = '3,5 cl tummaa, voimakasaromista kahvia. Tarjoillaan suklaapalan kera. Laktoositon. Gluteeniton.' WHERE tuotenimi = 'Espresso';
UPDATE tuote SET kuvaus = 'Espressoa, kuumaa maitoa ja maitovaahto, noin 2,5 dl. Gluteeniton.' WHERE tuotenimi = 'Cappuccino';
UPDATE tuote SET kuvaus = 'Täydellinen yhdistelmä espressoa ja lämmintä, höyryllä kevyesti vaahdotettua maitoa, noin 4 dl. Gluteeniton.' WHERE tuotenimi = 'Latte';
UPDATE tuote SET kuvaus = 'Espressoa, johon on sekoitettu kuumaa vettä, noin 2 dl. Gluteeniton.' WHERE tuotenimi = 'Americano';
UPDATE tuote SET kuvaus = 'Espressoa, maitoa, suklaamakusiirappia ja jääpaloja, noin 4 dl. Gluteeniton.' WHERE tuotenimi = 'Jäälatte';
--Leivokset:
UPDATE tuote SET kuvaus = 'Amerikkalaistyylinen, kostean mehevä suklaaleivonnainen, josta leikataan perinteisesti neliönmuotoisia annospaloja, noin 80 g.' WHERE tuotenimi = 'Brownie';
UPDATE tuote SET kuvaus = 'Pullataikinaan leivottu herkkuviineri, jossa päällä reilusti hilloa. Pehmeä vaniljakreemi ja pomadakoristelu kruunaa viimeistelyn, noin 100 g. Laktoositon.' WHERE tuotenimi = 'Viineri';
UPDATE tuote SET kuvaus = 'Amerikkalaisten leivonnaisten klassikko. Iso, maitosuklaahippuja sisältävä keksi, noin 80 g. Laktoositon.' WHERE tuotenimi = 'Chocolate Chip Cookie';
UPDATE tuote SET kuvaus = 'Pehmeän makuinen, keväisen värikkäästi koristeltu leivos., noin 80 g. Laktoositon.' WHERE tuotenimi = 'Pääsiäisleivos';
UPDATE tuote SET kuvaus = 'Berliinimunkki on lasten ja aikuisten suosikkimunkki. Päällä mansikkainen kuorrute ja sisällä vadelmahillo, noin 80 g.' WHERE tuotenimi = 'Berliininmunkki';
UPDATE tuote SET kuvaus = 'Maistuvasta pullataikinasta valmistettu pulla, jonka kruunaa voisilmä keskellä, kuorrutettuna voi-sokeriseoksella, noin 80 g.' WHERE tuotenimi = 'Voisilmäpulla';
-- Muut juomat:
UPDATE tuote SET kuvaus = 'Täyteläinen Fazer kaakao pehmeäksi vaahdotetulla maidolla, noin 2 dl. Laktoositon. Gluteeniton. ' WHERE tuotenimi = 'Kaakao';
UPDATE tuote SET kuvaus = 'Maailman parasta, suomalaista pohjavettä ja jääpaloja, noin 4 dl.' WHERE tuotenimi = 'Jäävesi';
UPDATE tuote SET kuvaus = 'Hartwall Jaffa on aito ja alkuperäinen suomalainen raikas appelsiinimakuinen virvoitusjuoma jääpaloilla, 5 dl. Laktoositon. Gluteeniton.' WHERE tuotenimi = 'Jaffa';
UPDATE tuote SET kuvaus = 'Suomen ja koko maailman ylivoimaisesti suosituinta virvoitusjuomaa Coca-Colaa sekä jääpaloja, 5 dl. Laktoositon. Gluteeniton.' WHERE tuotenimi = 'Cola';
UPDATE tuote SET kuvaus = 'Herkullinen omenamehu tuorepuristetuista, luonnomukaisesti viljellyistä omenoista, 2 dl. Laktoositon. Gluteeniton.' WHERE tuotenimi = 'Omenamehu';
UPDATE tuote SET kuvaus = 'Raikas sekä luonnonmukainen hedelmämehu tuorepuristetuista appelsiineista, 2 dl. Laktoositon. Gluteeniton.' WHERE tuotenimi = 'Appelsiinimehu';
-- Teet:
UPDATE tuote SET kuvaus = 'Musta teesekoitus, joka maustetaan bergamottiöljyllä. Eräs maailman suosituimmista teesekoituksista, noin 2 dl. Laktoositon. Gluteeniton.' WHERE tuotenimi = 'Earl Grey';
UPDATE tuote SET kuvaus = 'Kamomillasaunion kuivatuista mykeröistä valmistettu tee, jolla mieltä ja kehoa rauhoittava sekä vatsaa vaaliva vaikutus, 2 dl. Laktoositon. Gluteeniton.' WHERE tuotenimi = 'Kamomillatee';
UPDATE tuote SET kuvaus = 'Maailman suosituin teelaatu, jota valmistettaessa ei teelehtiä hapeteta lainkaan, jolloin niiden sisältämät luontaiset aineet säilyvät paremmin, 2 dl. Laktoositon. Gluteeniton.' WHERE tuotenimi = 'Vihreä tee';
UPDATE tuote SET kuvaus = 'Herkkä ja pehmeän makuinen valkoinen tee valmistetaan nuorista teelehdistä, jotka yksinkertaisesti höyrytetään ja kuivataan. Minimalistisesta käsittelystä johtuen, valkoinen tee on luonnonmukaisin teevaihtoehto, 2 dl. Laktoositon. Gluteeniton.' WHERE tuotenimi = 'Valkoinen tee';
UPDATE tuote SET kuvaus = 'Oolong on mustan ja vihreän teen välimuoto. Oolong tunnetaan sen selvän hedelmäisestä mausta. Oolong-lehdet läpikäyvät maltillisen valmistusprosessin, jossa ne lakastuvat, hapettuvat ja kuivuvat, 2 dl. Laktoositon. Gluteeniton.' WHERE tuotenimi = 'Oolong';
UPDATE tuote SET kuvaus = 'Luontaisesti kofeiinitonta Rooibosta kutsutaan myös punaiseksi teeksi, mutta todellisuudessa Rooibos ei ole tee, vaan kuuluu hernekasvien sukuun. Rooibos-tee hapetetaan samaan tapaan kuin musta tee, 2 dl. Laktoositon. Gluteeniton.' WHERE tuotenimi = 'Rooibos';