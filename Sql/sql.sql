CREATE TABLE Zvire (
  Id int not null primary key AUTO_INCREMENT,
  Nazev VARCHAR
(50) NOT NULL,
  Druh INT NOT NULL REFERENCES Druh
(Id),
  Nohy INT NOT NULL,
  Potrava ENUM
("Masozravec","Bylozravec")

  CONSTRAINT `Zvire_ibfk_2` FOREIGN KEY
(`Druh`) REFERENCES `Druh`
(`Id`)
)

CREATE TABLE Druh(
    Id int not null primary key AUTO_INCREMENT,
    Nazev ENUM
("Domaci","Divoke")
)

ALTER TABLE Zvire
ADD COLUMN Jmeno VARCHAR
(20) AFTER Nazev;

SELECT *
FROM Zvire
  INNER JOIN Druh ON Zvire.Druh=Druh.Id;

show columns from Zvire;

update Zvire set Druh=2 where Id=2;


ALTER TABLE Zvire
MODIFY COLUMN Druh INT NOT NULL REFERENCES Druh
(Id);

ALTER TABLE Zvire add foreign key (Druh) REFERENCES Druh(Id);

INSERT INTO Zvire
  (Nazev,Jmeno,Druh,Nohy,Potrava)
VALUES
  ('Kocka', 'Angie', 1, 3, 'Vsezravec');


INSERT INTO Zvire
  (Nazev,Jmeno,Druh,Nohy,Potrava)
VALUES
  ('Kocka', 'Charlie', 2, 4, 'Masozravec');


INSERT INTO Zvire
  (Nazev,Jmeno,Druh,Nohy,Potrava)
VALUES
  ('Pes', 'Karel', 2, 4, 'Masozravec');


INSERT INTO Zvire
  (Nazev,Jmeno,Druh,Nohy,Potrava)
VALUES
  ('Kun', 'Stoupa', 3, 3, 'Bylozravec');



INSERT INTO Zvire
  (Nazev,Jmeno,Druh,Nohy,Potrava)
VALUES
  ('Opice', 'Petr', 2, 4, 'Vsezravec');



INSERT INTO Zvire
  (Nazev,Jmeno,Druh,Nohy,Potrava)
VALUES
  ('Zizala', 'Julie', 1, 0, 'Vsezravec');

CREATE TABLE Druh(
    Id int not null primary key AUTO_INCREMENT,
    Nazev ENUM
("Domaci","Divoke")
)

CREATE TABLE Viden(
  IdZvire int not null,
  CONSTRAINT `Viden_ibfk` FOREIGN KEY
(`IdZvire`) REFERENCES `Zvire`
(`Id`),
  Cas DATE not null
)

CREATE TABLE Osoba(
  Id INT not null primary key AUTO_INCREMENT,
  Jmeno VARCHAR
(20)
)

ALTER TABLE Viden
Add COLUMN Osoba int not null;


ALTER TABLE Viden
add foreign key (Osoba) REFERENCES Osoba(Id);

INSERT INTO Osoba
  (Jmeno)
VALUES
  ("Misa");
INSERT INTO Osoba
  (Jmeno)
VALUES
  ("Petr");
INSERT INTO Osoba
  (Jmeno)
VALUES
  ("Zuzka");
INSERT INTO Osoba
  (Jmeno)
VALUES
  ("Martin");
INSERT INTO Osoba
  (Jmeno)
VALUES
  ("Verca");

SELECT Zvire.Id, Zvire.Nazev, Jmeno, Druh.Nazev, Nohy, Potrava
FROM Zvire INNER JOIN Druh ON Zvire.Druh=Druh.Id
ORDER BY Zvire.Id;


INSERT INTO Viden
  (IdZvire,Cas,Osoba)
VALUES
  (5, CURDATE(), 4);

INSERT INTO Viden
  (IdZvire,Cas,Osoba)
VALUES
  (2, CURDATE(), 4);

INSERT INTO Viden
  (IdZvire,Cas,Osoba)
VALUES
  (0, CURDATE(), 1);
INSERT INTO Viden
  (IdZvire,Cas,Osoba)
VALUES
  (1, CURDATE(), 1);
INSERT INTO Viden
  (IdZvire,Cas,Osoba)
VALUES
  (0, CURDATE(), 2);
INSERT INTO Viden
  (IdZvire,Cas,Osoba)
VALUES
  (1, CURDATE(), 2);
INSERT INTO Viden
  (IdZvire,Cas,Osoba)
VALUES
  (0, CURDATE(), 3);
INSERT INTO Viden
  (IdZvire,Cas,Osoba)
VALUES
  (1, CURDATE(), 3);
INSERT INTO Viden
  (IdZvire,Cas,Osoba)
VALUES
  (0, CURDATE(), 5);
INSERT INTO Viden
  (IdZvire,Cas,Osoba)
VALUES
  (1, CURDATE(), 5);

INSERT INTO Viden
  (IdZvire,Cas,Osoba)
VALUES
  (3, CURDATE(), 5);

INSERT INTO Viden
  (IdZvire,Cas,Osoba)
VALUES
  (4, CURDATE(), 3);

INSERT INTO Zvire
  (Id,Nazev,Jmeno,Druh,Nohy,Potrava)
VALUES(6, 'Yetty', 'SnowMan', 1, 2, 'Vsezravec')


//nidko nevidel
//Seznam koho kdo vydel
//Seznam zvirat + pocet videni

SELECT Osoba.Jmeno, Viden.Cas, Zvire.Nazev, Jmeno, Druh.Nazev, Nohy, Potrava
FROM Viden
  INNER JOIN Zvire ON Zvire.Id=Viden.IdZvire
  INNER JOIN Druh ON Druh.Id=Zvire.Druh
  INNER JOIN Osoba ON Osoba.Id=Viden.Osoba
ORDER BY Viden.Osoba;