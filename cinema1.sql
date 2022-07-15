create database cinema1;
use cinema1;
create table filme (
idFilm int primary key auto_increment not null,
numeFilm varchar (50),
genFilm varchar (50),
durataFilm varchar (10),
anLansare smallint,
clasificare varchar (25),
modPrezentare char (10),
modDifuzare varchar (25),
pret float,
taraOrigine varchar (50),
activ varchar (15));

create table clienti (
idClient int primary key auto_increment not null,
numeClient varchar (50),
student varchar (15),
idCarnet int,
adresaEmail varchar (50),
numarTelefon bigint,
dataNasterii date,
cardCredit bigint);

create table rezervari (
idRezervare int primary key auto_increment not null,
idFilm int,
idClient int,
idProgramDifuzare int,
dataDifuzare date,
idSala int,
idLoc int,
metodaDePlata char (20),
constraint fk_rezervari_filme foreign key (idFilm) references filme (idFilm));

alter table rezervari
add constraint fk_rezervari_clienti foreign key (idClient) references Clienti (idClient);

alter table rezervari
add constraint fk_rezervari_programDifuzare foreign key (idProgramDifuzare) references programDifuzare (idprogramDifuzare);

alter table rezervari
add constraint fk_rezervari_sali foreign key (idSala) references sali (idSala);

create table programDifuzare (
idProgramDifuzare int primary key auto_increment not null,
idFilm int,
ziRulare char (15),
oraRulare time,
idSala int,
constraint fk_progaramDifuzare_filme foreign key (idFilm) references filme (idFilm));

alter table programDifuzare
add constraint fk_programDifuzare_sali foreign key (idSala) references sali (idSala);

create table sali(
idSala int primary key auto_increment not null,
numeSala varchar (25),
nrTotalLocuri int,
nrLocuriVip int,
nrUsiUrgenta int,
tipulSalii varchar (20),
activa char (5));

create table saliScaune (
idScaun int primary key auto_increment not null,
idSala int,
nrRand char (10),
activ char (15),
constraint fk_saliScaune_sali foreign key (idSala) references sali (idSala));

insert into filme (numeFilm, genFilm, durataFilm, anLansare, clasificare, modPrezentare, modDifuzare, pret, taraOrigine, activ)
values ('Batman', 'Actiune', '1h50min', '2022', 'AP', 'vip_2D', 'Subtitrat', '22', 'SUA', 'ruleaza'),
('Titanic', 'Drama', '2h20min', '1997', 'AP', '2D', 'Subtitrat','21', 'SUA', 'urmeaza'),
('Encanto', 'Animatie', '1h30min', '2020', 'AG', '2D', 'Dublat', '20', 'SUA', 'ruleaza'),
('Luca', 'Animatie', '1h30min', '2021', 'AG', '3D', 'Dublat', '25', 'SUA', 'ruleaza'),
('Blue Moon', 'Drama', '1h25min','2020','N_15','2D','Subtitrat','22','Romania','urmeaza'),
('Petite Maman', 'Fantastic', '1h15min', '2021','AG', '2D', 'Dublat', '19', 'Franta', 'ruleaza'),
('West Side Story', 'Comedie','1h30min', '2021', 'AP_12', '2D', 'Subtitrat', '22','SUA', 'ruleaza'),
('Marry Me', 'Romance', '1h45', '2020', 'AP_12','2D_vip', 'Subtitrat', '25','SUA','urmeaza'),
('Spencer', 'Biografie', '1h50', '2020', 'AP_12','2D', 'Subtitrat', '23','Anglia', 'ruleaza'),
('The Aviator', 'Biografie', '2h50min', '1994', 'AP_12','2D', 'Subtitrat', '21','SUA', 'inactiv');
select * from filme;
update filme
set durataFilm = '1h45min' where numeFilm='Marry Me';
update filme 
set durataFilm ='4h50min' where numeFilm ='Spencer';

insert into clienti (numeClient, student, idCarnet, adresaEmail, numarTelefon, dataNasterii, cardCredit)
values ('PopescuIon', 'Nu', '0', 'popescuion@gmail.com', '0759300200', '1979-01-13','455366789145'),
('DanciAlin', 'Da', '123789', 'dancialin@gamil.com','0759301201', '2005-07-31', '489654147896'),
('BrancuMarin', 'Da', '123786','brancualin@gmail.com','0759302202','2002-05-15', '466896258963'),
('LacatusAna', 'Da', '123654', 'lacatusana@gmail.com', '0759303203', '2004-04-15', '489258963321'),
('MaghyarSanda', 'Nu', '0', 'maghyarsanda@gmail.com', '0759300435', '1989-09-21', '568569896569'),
('RusDavid','Da', '123321', 'rusdavid@gamil.com','0758403653', '2006-09-28', '421325632985'),
('MerceDaria', 'Da', '125369', 'mercedaria@gmail.com', '0759963258', '2004-08-18', '456123369852'),
('PopAndra', 'Da', '235698', 'popandra@gmail.com', '0789654123', '2003-05-25', '456963147852'),
('SimaAndrei', 'Da', '123963', 'simaandrei@gmail.com', '0759303305', '2006-12-02', '478951456852'),
('TintasMaria', 'Nu', '0', 'tintasmaria@gmail.com', '0779568965', '1977-10-18', '0759589962148');

select*from clienti;

insert into programDifuzare (idFilm, ziRulare, oraRulare, idSala)
values ('1', 'Luni', '18:00', '1'),
('2', 'Marti', '20:00', '2'),
('3', 'Miercuri', '14:00', '3'),
('4', 'Miercuri', '18:00', '4'),
('5', 'Sambata', '20:00', '5'),
('6', 'Sambata', '15:00', '6'),
('7', 'Duminica', '18:00', '7'),
('8', 'Duminica', '18:00', '8'),
('9', 'Luni', '19:00', '9'),
('10', 'Vineri', '21:00', '10');

select *from programDifuzare;

update programdifuzare
set idProgramDifuzare= '1' where idProgramDifuzare='11';
update programDifuzare
set idProgramDifuzare= '2' where idProgramDifuzare='12';
update programDifuzare
set idProgramDifuzare= '3' where idProgramDifuzare='13';
update programDifuzare
set idProgramDifuzare= '4' where idProgramDifuzare='14';
update programDifuzare
set idProgramDifuzare= '5' where idProgramDifuzare='15';
update programDifuzare
set idProgramDifuzare= '6' where idProgramDifuzare='16';
update programDifuzare
set idProgramDifuzare= '7' where idProgramDifuzare='17';
update programDifuzare
set idProgramDifuzare= '8' where idProgramDifuzare='18';
update programDifuzare
set idProgramDifuzare= '9' where idProgramDifuzare='19';
update programDifuzare
set idProgramDifuzare= '10' where idProgramDifuzare='20';



insert into sali (numeSala, nrTotalLocuri, nrLocuriVip, nrUsiUrgenta, tipulSalii, activa)
values ('RedRoom', '200', '25', '2', '2D', 'activa'),
('BlackRomm', '250', '25', '2', '2D', 'activa'),
('BlueRoom', '100', '0', '1', '2D', 'activa'),
('YellowRoom', '150', '0','2', '3D', 'inactiva'),
('Star', '100', '100','2', '2D_3D', 'activa'),
('RockRoom', '300', '100','3', '2D_3D', 'inactiva'),
('BigRoom', '500', '0','4', '2D_3D', 'inactiva'),
('Hollywood', '250', '50','2', '2D_3D', 'activa'),
('BigVip', '250', '250','4', '2D_3D', 'inactiva'),
('HappyRoom', '200', '0','2','2D_3D', 'activa');

alter table sali
modify activa char(10);

delete from clienti
where idClient >'10';

alter table saliScaune
modify idScaun char (5);
alter table saliScaune
add idSaliScaune int;

alter table saliScaune                             -- instructiune de stergere primary key--
drop primary key;
alter table saliScaune
add primary key (idSaliScaune);

alter table saliScaune
modify column idSaliScaune int auto_increment first;      -- schimbarea randului de pe ultima pozitie pe prima pozitie--

insert into saliScaune (idSaliScaune, idScaun, idSala, nrRand, activ)
values ('1', 'A', '1', '10','activ'),
('2', 'B', '2', '10', 'activ'),
('3','C', '3', '11', 'inactiv'),
('4', 'F', '4', '17', 'inactiv'),
('5','G', '5', '5', 'activ'),
('6', 'M', '6', '20', 'inactiv'),
('7', 'S', '7', '1', 'inactiv'),
('8', 'A', '8', '8', 'inactiv'),
('9', 'D', '9', '7', 'inactiv'),
('10', 'E', '10', '9', 'activ');

update saliscaune set activ='activ' where idSaliScaune='3';
update saliscaune set activ='activ' where idSaliScaune='4';
update saliscaune set activ='activ' where idSaliScaune='6';
update saliscaune set activ='activ' where idSaliScaune='7';
update saliscaune set activ='activ' where idSaliScaune='8';
update saliscaune set activ='activ' where idSaliScaune='9';

select *from saliScaune;

show variables LIKE 'auto_inc%'; -- rezultatul valorilor curente pentru auto_increment- 

insert into rezervari (idFilm, idClient, idProgramDifuzare, dataDifuzare, idSala, idLoc, metodaDePlata)
values ('1','5', '1','2022-04-04', '1', '10B', 'cash'),
('2', '2','2', '2022-04-05', '2', '10A', 'card'),
('3','7','3', '2022-04-06','3', '11C', 'card'),
('4', '6', '4', '2022-04-06','4','17F', 'cash'),
('5', '3', '5','2022-04-09','5', '5G', 'card'),
('6', '1', '6','2022-04-09','6', '20M', 'cash'),
('7', '4', '7', '2022-04-10','7','1S', 'card'),
('8', '10', '8','2022-04-10','8', '8A', 'card'),
('9', '9', '9', '2022-04-11','9', '7D', 'cash');

select * from rezervari;

alter table rezervari
modify idLoc char (5);

-- de cate ori s-a facut rezervarea la un anumit film in anul 2022-- 
select count(*) from rezervari where idFilm like '2'and dataDifuzare like '2022%';

-- de selectat doar filmele care au fost rezervare de mai putin de 5 ori--

select * from rezervari  inner join filme on rezervari.idFilm=filme.idFilm;











