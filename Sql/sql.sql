CREATE TABLE Zvire (
  Id int not null primary key AUTO_INCREMENT,
  Nazev VARCHAR
(50) NOT NULL,
  Druh INT NOT NULL REFERENCES Druh
(Id),
  Nohy INT NOT NULL,
  Potrava ENUM
("Masozravec","Bylozravec")
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
