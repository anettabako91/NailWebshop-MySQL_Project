### Proiect NailWebshop - MySQL

#### Descriere

1. DDL - Data Definition Language
Acest proiect reprezinta crearea unei baze de date, ce poate fi folosit de catre un magazin online cu produse destinate manichiurii si unghiilor tehnice.
Instructiunea CREATE DATABASE ne permite crearea unei baze de date noi, in care ulterior putem crea diferite tabele, cu ajutorul instructiunii CREATE TABLE. 
In momentul in care cream tabele, este necesar sa specificam numele acestora, impreuna cu numele coloanelor si definitia acestora - adica este important sa stabilim de pe acum
ce tipuri de caractere vom putea folosi in momentul in care vom completa fiecare coloana.

De exemplu:

![exemplu creare tabel](https://github.com/anettabako91/NailWebshop-MySQL_Project/blob/main/exemplu%20creare%20tabel.png)

In exemplul de mai sus am creat tabela Produsedebaza, care contine urmatoarele coloane:
- ID-ul produselor, acesta fiind de tip INT => Integer - numere intregi,
- numele produselor, cu tipul de date VARCHAR(20) => sir de maxim 20 de caractere,
- gramajul produselor, INT => numere intregi,
- pretul produselor, cu tipul de date FLOAT => numere zecimale,
- stocul disponibil, INT => numere intregi.
Proprietatea NOT NULL a coloanelor inseamna ca acestea nu pot ramane goale.

In cazul in care dorim sa adaugam o coloana la un tabel creat anterior, folosim comanda ALTER TABLE nume_tabela ADD nume_coloana definitie_coloana, 
pentru a modifica proprietatile unei coloane, putem folosi comanda ALTER TABLE nume_tabela MODIFY nume_coloana definite_coloana, iar pentru a sterge o coloana folosim comanda
ALTER TABLE nume_tabela DROP COLUMN nume_coloana. Aceste comenzi fac parte din DDL - Data Definition Language.

2. DML - Data Manipulation Language
Din subsetul DML - Data Manipulation Language , fac parte instructiunile INSERT , UPDATE, DELETE, cu ajutorul carora putem insera unul sau mai multe randuri intr-o tabela creata anterior
(vezi exemplul de mai jos, in care am completat tabela 'produsedebaza' cu mai multe randuri) , updata un rand deja completat, si sterge una sau mai multe inregistrari.

![exemplu completare tabela](https://github.com/anettabako91/NailWebshop-MySQL_Project/blob/main/completare%20tabela%20produsedebaza.png)

3. DQL - Data Query Language
Odata ce am creat si completat toate tabelele necesare, putem folosi instructiunile :
- SELECT => pentru a citi inregistrarile dintr-una sau mai multe tabele
- WHERE => o clauza cu ajutorul careia putem specifica anumite conditii de cautare pentru randurile returnate
- AVG, SUM, MAX, MIN, COUNT => functii agregate cu ajutorul carora putem afla de exemplu dintr-o tabela de comenzi valoarea medie a comenzilor, totalul lor, valoarea cea mai mica/mare,
  si numarul total al comenzilor.
(vezi mai multe interogari in fisierul MySQL atasat)

### Relatii dintre tabele
In baza de date 'NailWebShop' am creat cinci tabele diferite, cum se poate vedea si pe diagrama alaturata:
![diagram](https://github.com/anettabako91/NailWebshop-MySQL_Project/blob/main/diagram_mysql.png)

Intre tabela 'comenzi' si tabela 'accesorii' , 'produsedebaza' , 'clienti' este legatura many-to-many , iar intre tabela 'comenzi' si 'comenzi_produsedebaza' exista relatia de 
one-to-one, 'comenzi_produsedebaza' fiind o tabela creata ulterior, pe baza tabelei 'comenzi' cu comenzile care contin doar elemente din tabela 'produsedebaza' , astfel si intre tabela
'comenzi_produsedebaza' si 'produsedebaza' s-a format o relatie one-to-one.

### Primary and foreign key
Primary key - adica cheia primara este o coloana sau un set de coloane care pot servi drept identificator unic pentru fiecare rand din tabela, 
iar cheia secundara/foreign key este un potential identificator, ea ne ajuta sa facem legatura cu alte tabele; tot timpul va contine valori care exista deja pe cheia primara din 
tabela parinte. 
In cazul bazei de date 'NailWebshop' fiecare tabela are ca primay key id-ul, definit la momentul crearii tabelelor, alaturi de atributul AUTO_INCREMENT, care genereaza automat un numar
intreg ori de cate ori se insereaza un rand nou in tabele, iar ulterior la tabela 'comenzi' am adaugat cheile secundare, facand referire la restul tabelelor, astfel tabela 'comenzi' a
devenit TABELA PARINTE, iar restul sunt TABELE COPIII (vezi mai jos)

![foreign key](https://github.com/anettabako91/NailWebshop-MySQL_Project/blob/main/adaugare%20foreign%20key.png)

### SQL Join
Join-urile sunt folosite pentru a combina date sau randuri din doua sau mai multe tabele. Fiecare instructiune SELECT poate folosi una sau mai multe metode JOIN:
-CROSS JOIN
-INNER JOIN
-LEFT JOIN
-RIGHT JOIN

In cazul bazei de date 'NailWebShop' am folosit inner join, selectand toate randurile din doua sau mai multe tabele atata timp cat conditia a fost indeplinita, si right join, 
care a returnat toate înregistrările din tabela din dreapta și înregistrările potrivite din tabela din stânga, indeplinind anumite conditii (vezi mai jos cateva exemple)

![join](https://github.com/anettabako91/NailWebshop-MySQL_Project/blob/main/inner%20si%20right%20join.png)

Intregul proiect poate fi gasit aici : [ProiectSQL](https://github.com/anettabako91/NailWebshop-MySQL_Project/blob/main/nailwebshop.sql)

