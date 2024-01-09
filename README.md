la fel si la mysql - detalii despre baza de date pe care am creat-o , introducere cu un screenshot - schema baza de date - reverse engeneering - 
structura si legatura dintre tabele cate tabele, ce tipuri de date, legtura dintre tabele, ce instructiuni - ddl/dml/dql ddl definire - 
creare, primary, foreign key dml - inserare date, stergere dql - interogari , mai simple si mai complexe

la sfarsit link catre fisier de tip sq

### Proiect NailWebshop

#### Descriere

Acest proiect reprezinta crearea unei baze de date, ce poate fi folosit de catre un magazin online cu produse destinate manichiurii si unghiilor tehnice.
Instructiunea CREATE DATABASE ne permite crearea unei baze de date noi, in care ulterior putem crea diferite tabele, cu ajutorul instructiunii CREATE TABLE. 
In momentul in care cream tabele, este necesar sa specificam numele acestora, impreuna cu numele coloanelor si definitia acestora - adica este important sa stabilim de pe acum
ce tipuri de caractere vom putea folosi in momentul in care vom completa fiecare coloana.

De exemplu:

create table Produsedebaza 
( id int not null auto_increment primary key, 
numeProdus varchar (20) not null,
gramaj int not null,
pret float not null,
nrBucDisponibile int not null );

In exemplul de mai sus am creat tabela Produsedebaza, care contine urmatoarele coloane:
- ID-ul produselor, acesta fiind de tip INT => Integer - numere intregi,
- numele produselor, cu tipul de date VARCHAR(20) => sir de maxim 20 de caractere,
- gramajul produselor, INT => numere intregi,
- pretul produselor, cu tipul de date FLOAT => numere zecimale,
- stocul disponibil, INT => numere intregi.
Proprietatea NOT NULL a coloanelor inseamna ca acestea nu pot ramane goale.
