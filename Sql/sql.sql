--Adding column
ALTER TABLE Zvire
ADD COLUMN Jmeno VARCHAR
(20) AFTER Nazev;

--Simple select with Joining
SELECT *
FROM Zvire
  INNER JOIN Druh ON Zvire.Druh=Druh.Id;

--MySql show Collumns from table
show columns from Zvire;

--Update value
update Zvire set Druh=2 where Id=2;

--Reference Integrity
ALTER TABLE Zvire add foreign key (Druh) REFERENCES Druh(Id);


--Adding column
ALTER TABLE Viden
Add COLUMN Osoba int not null;

--Reference Integrity
ALTER TABLE Viden
add foreign key (Osoba) REFERENCES Osoba(Id);

INSERT INTO Zvire(Nazev,Jmeno,Druh,Nohy,Potrava)VALUES('Kocka', 'Angie', 1, 3, 'Vsezravec');
INSERT INTO Zvire(Nazev,Jmeno,Druh,Nohy,Potrava)VALUES('Kocka', 'Charlie', 2, 4, 'Masozravec');
INSERT INTO Zvire(Nazev,Jmeno,Druh,Nohy,Potrava)VALUES('Pes', 'Karel', 2, 4, 'Masozravec');
INSERT INTO Zvire(Nazev,Jmeno,Druh,Nohy,Potrava)VALUES('Kun', 'Stoupa', 3, 3, 'Bylozravec');
INSERT INTO Zvire(Nazev,Jmeno,Druh,Nohy,Potrava)VALUES('Opice', 'Petr', 2, 4, 'Vsezravec');
INSERT INTO Zvire(Nazev,Jmeno,Druh,Nohy,Potrava)VALUES('Zizala', 'Julie', 1, 0, 'Vsezravec');
INSERT INTO Zvire(Nazev,Jmeno,Druh,Nohy,Potrava)VALUES('Yetty', 'SnowMan', 1, 2, 'Vsezravec')

INSERT INTO Osoba(Jmeno)VALUES("Misa");
INSERT INTO Osoba(Jmeno)VALUES("Petr");
INSERT INTO Osoba(Jmeno)VALUES("Zuzka");
INSERT INTO Osoba(Jmeno)VALUES("Martin");
INSERT INTO Osoba(Jmeno)VALUES("Verca");

--Better select with more complex Join
SELECT Zvire.Id, Zvire.Nazev, Jmeno, Druh.Nazev, Nohy, Potrava
FROM Zvire INNER JOIN Druh ON Zvire.Druh=Druh.Id
ORDER BY Zvire.Id;


INSERT INTO Viden(IdZvire,Cas,Osoba)VALUES(5, CURDATE(), 4);
INSERT INTO Viden(IdZvire,Cas,Osoba)VALUES(2, CURDATE(), 4);
INSERT INTO Viden(IdZvire,Cas,Osoba)VALUES(0, CURDATE(), 1);
INSERT INTO Viden(IdZvire,Cas,Osoba)VALUES(1, CURDATE(), 1);
INSERT INTO Viden(IdZvire,Cas,Osoba)VALUES(0, CURDATE(), 2);
INSERT INTO Viden(IdZvire,Cas,Osoba)VALUES(1, CURDATE(), 2);
INSERT INTO Viden(IdZvire,Cas,Osoba)VALUES(0, CURDATE(), 3);
INSERT INTO Viden(IdZvire,Cas,Osoba)VALUES(1, CURDATE(), 3);
INSERT INTO Viden(IdZvire,Cas,Osoba)VALUES(0, CURDATE(), 5);
INSERT INTO Viden(IdZvire,Cas,Osoba)VALUES(1, CURDATE(), 5);

INSERT INTO Viden(IdZvire,Cas,Osoba)VALUES(3, CURDATE(), 5);

INSERT INTO Viden(IdZvire,Cas,Osoba)VALUES(4, CURDATE(), 3);




--Cool Select with all data that we know
SELECT Osoba.Jmeno, Viden.Cas, Zvire.Nazev, Zvire.Jmeno
as `Jmeno zvirete`, Druh.Nazev as Druh, Nohy, Potrava
FROM Viden
  INNER JOIN Zvire ON Zvire.Id=Viden.IdZvire
  INNER JOIN Druh ON Druh.Id=Zvire.Druh
  INNER JOIN Osoba ON Osoba.Id=Viden.Osoba
ORDER BY Viden.Osoba;

--nidko nevidel
SELECT *
from Zvire
WHERE NOT EXISTS(SELECT *
from Viden
where Viden.IdZvire=Zvire.Id);
--secound option
SELECT *
from Zvire
  LEFT JOIN Viden ON Viden.IdZvire=Zvire.Id
WHERE Viden.Cas is null;


--Seznam koho kdo vydel
SELECT Zvire.Jmeno, Osoba.Jmeno, Viden.Cas
from Zvire
  INNER JOIN Viden ON Viden.IdZvire=Zvire.Id
  INNER JOIN Osoba ON Osoba.Id=Viden.Osoba
ORDER BY Zvire.Id
--upgrade
SELECT Zvire.Jmeno, GROUP_CONCAT(Osoba.Jmeno SEPARATOR
',') as Videno
from Zvire
  INNER JOIN Viden ON Viden.IdZvire=Zvire.Id
  INNER JOIN Osoba ON Osoba.Id=Viden.Osoba
GROUP BY Zvire.Id

--Seznam zvirat + pocet videni
SELECT Zvire.Jmeno, COUNT(Viden.IdZvire)
from Zvire
  LEFT JOIN Viden ON Viden.IdZvire=Zvire.Id
GROUP BY Zvire.Id