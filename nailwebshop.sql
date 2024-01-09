create database NailWebShop;

create table Produsedebaza
( id int not null auto_increment primary key,
numeProdus varchar (20) not null,
gramaj int not null,
pret float not null,
nrBucDisponibile int not null );

alter table produsedebaza modify numeProdus varchar (30);

insert into produsedebaza (numeProdus,gramaj,pret,nrBucDisponibile) values 
('gel constructie platinum' , 15 , 72.00 , 6),
('gel constructie platinum' , 50 , 160.00 , 7),
('elastic hard gel clear' , 15 , 71.00 , 12),
('cream pink gel' , 15 , 65.00 , 8),
('white babe gel' , 15 , 60.00 , 4),
('cover blush gel' , 15 , 65.00 , 7),
('cover blush gel' , 50 , 150.00 , 11),
('fiber gel latte' , 15 , 65.00 , 14),
('fiber gel rose quartz ' , 15, 65.00 , 4),
('fiber gel nude shine' , 15 , 65.00 , 7),
('elastic cover blossom' , 15 , 71.00 , 9),
('elastic cover blush' , 15 , 71.00 , 8);

select * from produsedebaza;

create table Accesorii
( id int not null auto_increment primary key,
numeProdus varchar (20) not null,
pret float not null,
nrBucDisponibile int not null ) ;

insert into accesorii (numeProdus, pret, nrBucDisponibile) values 
('pila 100/180' , 7.5 , 24 ),
('pila 100/100' , 7.5 , 19),
('pila 150/150' , 7.5 , 22),
('pila 180/180' , 7.5 , 16),
('rola sabloane' , 90.00 , 16),
('pensula gel' , 49.00 , 20),
('pensula short' , 36.00 , 9),
('pensula art&paint' , 36.00 , 4),
('capat carbid' , 69.00 , 17),
('capat cuticule' , 30.00 , 13);

select * from accesorii;

create table clienti
( id int not null auto_increment primary key,
nume varchar (15) not null,
prenume varchar (15) not null,
nrTel int not null );

insert into clienti (nume,prenume,nrTel) values
('Pop' , 'Maria' , 0742568741),
('Chis' , 'Andreea' , 0725879632),
('Sandu' , 'Cristina' , 0754879632),
('Kiss' , 'Viktoria' , 0744875321),
('Roman' , 'Daniela' , 0745875214),
('Baciu' , 'Romina' , 0745896321),
('Roman' , 'Ioana' , 0725874563),
('Cimpean' , 'Ramona' , 0744124875),
('Lung' , 'Ionela' , 0741578414),
('Rizea' , 'Cristina' , 0743558847);

select * from clienti;

create table comenzi
(id int not null auto_increment primary key,
datacomenzii date not null,
idProdusdebaza int,
nrBucProdBaza int ,
idaccesorii int,
nrBucAccesorii int ,
valoarecomanda int,
idClient int
);

alter table comenzi modify valoarecomanda float;

insert into comenzi (datacomenzii, idProdusdebaza, nrBucProdBaza, idaccesorii, nrBucAccesorii , valoarecomanda, idClient) values
('2023-10-03' , 3 , 2 , 2 , 5 , 179.5 , 6),
('2023-11-01' , 5 , 3 , 7 , 2 , 312.00 , 4),
('2023-09-14' , 11 , 4 , 4 , 1 , 291.5 , 2),
('2023-09-25' , 9 , 1 , 9, 3 , 272.00 , 3),
('2023-10-14' , 7 , 2 , 6 , 3 , 447.00 , 5),
('2023-10-24' , 2 , 3 , 3 , 10 , 555.00 , 8),
('2023-11-03' , 8 , 3 , 5 , 2 , 375.00 , 3),
('2023-08-26' , 3 , 3 , 10 , 2 , 273.00 , 2),
('2023-08-19' , 7 , 2 , 6 , 1 , 349.00 , 8),
('2023-07-15' , 4 , 5 , 3 , 9 , 392.5 , 6),
('2023-08-17' , 12 , 5 , 4 , 11 , 4437.5 , 10);

update comenzi set valoarecomanda = 437.5  where datacomenzii = '2023-08-17';

insert into comenzi (datacomenzii, idProdusdebaza, nrBucProdBaza, idaccesorii, nrBucAccesorii , valoarecomanda, idClient) values
('2023-10-18' , 3 , 4 , 3 , 2 , 299 , 10);

alter table comenzi add foreign key (idProdusdebaza) references produsedebaza (id);

alter table comenzi add foreign key (idaccesorii) references accesorii (id);

alter table comenzi add foreign key (idclient) references clienti (id);

select * from comenzi;

select * from comenzi where idProdusdebaza = 3; -- comenzile care includ produsul de baza cu id-ul 3

select * from comenzi where idaccesorii = 6; -- comenzile care includ accesoriul cu id-ul 6

select comenzi.datacomenzii , produsedebaza.numeProdus from comenzi 
inner join produsedebaza on comenzi.idProdusdebaza=produsedebaza.id ;

select comenzi.datacomenzii , produsedebaza.numeProdus, comenzi.nrBucProdBaza from comenzi 
inner join produsedebaza on comenzi.idProdusdebaza=produsedebaza.id ;

select comenzi.datacomenzii , comenzi.valoarecomanda , comenzi.idClient from comenzi 
inner join clienti on comenzi.idClient=clienti.id;

select comenzi.datacomenzii , clienti.nume , clienti.prenume , comenzi.valoarecomanda from comenzi
inner join clienti on comenzi.idClient = clienti.id 
order by comenzi.valoarecomanda desc;

select comenzi.datacomenzii , clienti.nume , clienti.prenume , comenzi.valoarecomanda from comenzi
inner join clienti on comenzi.idClient = clienti.id 
order by comenzi.datacomenzii desc;

select * from comenzi where idClient = 8; -- comenzile facute de clientul 8

select sum(valoarecomanda) from comenzi where idClient = 6; -- valoare totala a comenzilor facute de clientul 6

select * from comenzi right join clienti on comenzi.idClient=clienti.id where idClient is null; -- clientii care nu au facut nici o comanda

select * from comenzi right join produsedebaza on comenzi.idProdusdebaza = produsedebaza.id where idProdusdebaza is null; -- produsele de baza care nu au fost comandate deloc

select * from comenzi right join accesorii on comenzi.idaccesorii = accesorii.id where idaccesorii is null; -- accesoriile care nu au fost comandate deloc

select max(valoarecomanda) from comenzi; -- comanda cea mai mare

select sum(valoarecomanda) from comenzi where idProdusdebaza = 7 and idaccesorii = 6; -- valoarea totala a comenzilor in care apare produsul 7 si accesoriul 6

select sum(nrBucProdBaza) from comenzi where idProdusdebaza = 3; -- nr total comandat al produsului 3

select sum(nrBucAccesorii) from comenzi where idaccesorii = 3;

-- crearea unei alte tabele in care sa apara doar comenzile cu produsele de baza
create table comenzi_produsedebaza
(id int auto_increment primary key,
idcomanda int,
idprodusdebaza int,
nrbuc int,
pret float );

insert into comenzi_produsedebaza (idcomanda,idprodusdebaza,nrbuc,pret) values
(1 , 3 , 2 , 71.00 ),
(2 , 5 , 3 , 60.00),
(3 , 11 , 4 , 71.00),
(4 , 9 , 1 , 65.00),
(8 , 3 , 3 , 71.00),
(12 , 3 , 4 , 71.00);

alter table comenzi_produsedebaza add foreign key (idcomanda) references comenzi (id);

alter table comenzi_produsedebaza add foreign key (idprodusdebaza) references produsedebaza (id);

alter table comenzi_produsedebaza change pret pretProdus float;

select * from comenzi_produsedebaza;

select sum(nrbuc) from comenzi_produsedebaza where idprodusdebaza = 3; -- cate produse cu id-ul 3 au fost comandate in totalitate

select sum(nrbuc*pretProdus) from comenzi_produsedebaza where idprodusdebaza = 5; -- valoarea toatala a produsului cu id-ul 5 din toate comenzile

select sum(nrbuc*pretProdus) from comenzi_produsedebaza where idprodusdebaza = 3; -- valoarea toatala a produsului cu id-ul 3 din toate comenzile

select sum(nrbuc*pretProdus) , produsedebaza.numeProdus from comenzi_produsedebaza
inner join produsedebaza on comenzi_produsedebaza.idprodusdebaza = produsedebaza.id where idprodusdebaza = 11;

select sum(nrbuc*pretProdus) , produsedebaza.numeProdus from comenzi_produsedebaza
inner join produsedebaza on comenzi_produsedebaza.idprodusdebaza = produsedebaza.id where idprodusdebaza = 3;

select sum(nrbuc*pretProdus) , produsedebaza.numeProdus from comenzi_produsedebaza
inner join produsedebaza on comenzi_produsedebaza.idprodusdebaza = produsedebaza.id;

select comenzi.datacomenzii, clienti.nume, clienti.prenume , produsedebaza.numeProdus, comenzi_produsedebaza.nrbuc from comenzi_produsedebaza
inner join comenzi on comenzi_produsedebaza.id = comenzi.id 
inner join produsedebaza on comenzi_produsedebaza.idprodusdebaza = produsedebaza.id
inner join clienti on comenzi.idClient = clienti.id;

alter table comenzi_produsedebaza drop foreign key comenzi_produsedebaza_ibfk_3;

