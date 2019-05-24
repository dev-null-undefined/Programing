/*Adding column
ALTER TABLE Zvire
ADD COLUMN Jmeno VARCHAR
(20) AFTER Nazev;*/

/*Simple select with Joining*/
SELECT *
FROM Zvire
  INNER JOIN Druh ON Zvire.Druh=Druh.Id;

/*MySql show Collumns from table*/
show columns from Zvire;

/*Update value
update Zvire set Druh=2 where Id=2;*/

/*Reference Integrity
ALTER TABLE Zvire add foreign key (Druh) REFERENCES Druh(Id);

/*Adding column
ALTER TABLE Viden
Add COLUMN Osoba int not null;*/

/*Reference Integrity
ALTER TABLE Viden
add foreign key (Osoba) REFERENCES Osoba(Id);*/

/*Better select with more complex Join*/
SELECT Zvire.Id, Zvire.Nazev, Jmeno, Druh.Nazev, Nohy, Potrava
FROM Zvire INNER JOIN Druh ON Zvire.Druh=Druh.Id
ORDER BY Zvire.Id;

/*Cool Select with all data that we know*/
SELECT Osoba.Jmeno, Viden.Cas, Zvire.Nazev, Zvire.Jmeno
as `Jmeno zvirete`, Druh.Nazev as Druh, Nohy, Potrava
FROM Viden
  INNER JOIN Zvire ON Zvire.Id=Viden.IdZvire
  INNER JOIN Druh ON Druh.Id=Zvire.Druh
  INNER JOIN Osoba ON Osoba.Id=Viden.Osoba
ORDER BY Viden.Osoba;
/*Nebo*/
SELECT *
FROM Viden
  INNER JOIN Zvire ON Zvire.Id=Viden.IdZvire
  INNER JOIN Druh ON Druh.Id=Zvire.Druh
  INNER JOIN Osoba ON Osoba.Id=Viden.Osoba
ORDER BY Viden.Osoba;

/*nidko nevidel*/
SELECT *
from Zvire
WHERE NOT EXISTS(SELECT *
from Viden
where Viden.IdZvire=Zvire.Id);
/*secound option*/
SELECT *
from Zvire
  LEFT JOIN Viden ON Viden.IdZvire=Zvire.Id
WHERE Viden.Cas is null;

/*Seznam koho kdo vydel*/
SELECT Zvire.Jmeno, Osoba.Jmeno, Viden.Cas
from Zvire
  INNER JOIN Viden ON Viden.IdZvire=Zvire.Id
  INNER JOIN Osoba ON Osoba.Id=Viden.Osoba
ORDER BY Zvire.Id;
/*upgrade*/
SELECT Zvire.Jmeno, GROUP_CONCAT(Osoba.Jmeno SEPARATOR
',') as Videno
from Zvire
  INNER JOIN Viden ON Viden.IdZvire=Zvire.Id
  INNER JOIN Osoba ON Osoba.Id=Viden.Osoba
GROUP BY Zvire.Id;

/*Seznam zvirat + pocet videni*/
SELECT Zvire.Jmeno, COUNT(Viden.IdZvire)
from Zvire
  LEFT JOIN Viden ON Viden.IdZvire=Zvire.Id
  LEFT JOIN Osoba ON Osoba.Id=Viden.Osoba
GROUP BY Zvire.Id;


/*Reset AUTO_INCREMENT
ALTER TABLE tablename AUTO_INCREMENT = 1*/


/*3306*/



SELECT Zvire.Jmeno, Osoba.Jmeno, Viden.Cas from Zvire INNER JOIN Viden ON Viden.IdZvire=Zvire.Id INNER JOIN Osoba ON Osoba.Id=Viden.Osoba ORDER BY Zvire.Id;


/*MySql index 
ALTER TABLE TABLE_NAME ADD INDEX (COLUMN_NAME);

ALTER TABLE Zvire ADD INDEX (Jmeno);
*/

select * from Osoba LEFT join PhoneNumber on PhoneNumber.Id=Osoba.PhoneNumber;
