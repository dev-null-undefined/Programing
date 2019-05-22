CREATE TABLE Zvire (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nazev` varchar(50) NOT NULL,
  `Jmeno` varchar(20) DEFAULT NULL,
  `Druh` int(11) DEFAULT NULL,
  `Nohy` int(11) NOT NULL,
  `Potrava` enum('masozravec','bylozravec','vsezravec') DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Druh` (`Druh`),
  CONSTRAINT `Zvire_ibfk_3` FOREIGN KEY (`Druh`) REFERENCES `Druh` (`Id`),
)
CREATE TABLE Druh(
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nazev` enum('Domaci','Divoke','Ochocene') DEFAULT NULL,
  PRIMARY KEY (`Id`)
)
CREATE TABLE Viden(
  `IdZvire` int(11) NOT NULL,
  `Cas` datetime NOT NULL,
  `Osoba` int(11) NOT NULL,
  KEY `Viden_ibfk` (`IdZvire`),
  KEY `Osoba` (`Osoba`),
  CONSTRAINT `Viden_ibfk_1` FOREIGN KEY (`Osoba`) REFERENCES `Osoba` (`Id`),
  CONSTRAINT `Viden_ibfk` FOREIGN KEY (`IdZvire`) REFERENCES `Zvire` (`Id`)
)
CREATE TABLE Osoba(
  Id INT not null primary key AUTO_INCREMENT,
  Jmeno VARCHAR(20)
)

--Zvirata
INSERT INTO Zvire(Nazev,Jmeno,Druh,Nohy,Potrava)VALUES('Kocka', 'Angie', 1, 3, 'Vsezravec');
INSERT INTO Zvire(Nazev,Jmeno,Druh,Nohy,Potrava)VALUES('Kocka', 'Charlie', 2, 4, 'Masozravec');
INSERT INTO Zvire(Nazev,Jmeno,Druh,Nohy,Potrava)VALUES('Pes', 'Karel', 2, 4, 'Masozravec');
INSERT INTO Zvire(Nazev,Jmeno,Druh,Nohy,Potrava)VALUES('Kun', 'Stoupa', 3, 3, 'Bylozravec');
INSERT INTO Zvire(Nazev,Jmeno,Druh,Nohy,Potrava)VALUES('Opice', 'Petr', 2, 4, 'Vsezravec');
INSERT INTO Zvire(Nazev,Jmeno,Druh,Nohy,Potrava)VALUES('Zizala', 'Julie', 1, 0, 'Vsezravec');
INSERT INTO Zvire(Nazev,Jmeno,Druh,Nohy,Potrava)VALUES('Yetty', 'SnowMan', 1, 2, 'Vsezravec')

--Osoby
INSERT INTO Osoba(Jmeno)VALUES("Misa");
INSERT INTO Osoba(Jmeno)VALUES("Petr");
INSERT INTO Osoba(Jmeno)VALUES("Zuzka");
INSERT INTO Osoba(Jmeno)VALUES("Martin");
INSERT INTO Osoba(Jmeno)VALUES("Verca");

--Viden
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
--
INSERT INTO Viden(IdZvire,Cas,Osoba)VALUES(3, CURDATE(), 5);
--
INSERT INTO Viden(IdZvire,Cas,Osoba)VALUES(4, CURDATE(), 3);