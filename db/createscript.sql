-- Backend leerjaar 2 - opdracht 3 - Jamin (studentnummer 345075)
-- Uitvoeren in MySQL Workbench. Dit script bouwt de database reproduceerbaar op.
CREATE DATABASE IF NOT EXISTS jamin_opdracht2
    CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE jamin_opdracht2;
SET NAMES utf8mb4;
SET SESSION default_storage_engine = InnoDB;

SET FOREIGN_KEY_CHECKS = 0;
DROP PROCEDURE IF EXISTS sp_VoegProductLeveringToe;
DROP PROCEDURE IF EXISTS sp_GetGeleverdeProducten;
DROP PROCEDURE IF EXISTS sp_GetLeveranciersOverzicht;
DROP PROCEDURE IF EXISTS sp_WijzigLeverancier;
DROP PROCEDURE IF EXISTS sp_GetLeverancierDetails;
DROP PROCEDURE IF EXISTS sp_GetAantalLeveranciers;
DROP PROCEDURE IF EXISTS sp_GetLeveranciersWijzigen;
DROP TABLE IF EXISTS ProductPerLeverancier;
DROP TABLE IF EXISTS ProductPerAllergeen;
DROP TABLE IF EXISTS Magazijn;
DROP TABLE IF EXISTS Leverancier;
DROP TABLE IF EXISTS Contact;
DROP TABLE IF EXISTS Allergeen;
DROP TABLE IF EXISTS Product;
SET FOREIGN_KEY_CHECKS = 1;

-- STAMTABELLEN: eerst de tabellen zonder foreign keys.
CREATE TABLE Product (
    Id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Naam VARCHAR(100) NOT NULL,
    Barcode CHAR(13) NOT NULL,
    IsActief BIT NOT NULL DEFAULT b'1',
    Opmerking VARCHAR(250) NULL,
    DatumAangemaakt DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    DatumGewijzigd DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
    PRIMARY KEY (Id),
    UNIQUE KEY UQ_Product_Barcode (Barcode)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE Allergeen (
    Id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Naam VARCHAR(100) NOT NULL,
    Omschrijving VARCHAR(250) NOT NULL,
    IsActief BIT NOT NULL DEFAULT b'1',
    Opmerking VARCHAR(250) NULL,
    DatumAangemaakt DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    DatumGewijzigd DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
    PRIMARY KEY (Id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE Contact (
    Id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Straatnaam VARCHAR(100) NOT NULL,
    Huisnummer VARCHAR(10) NOT NULL,
    Postcode VARCHAR(7) NOT NULL,
    Stad VARCHAR(100) NOT NULL,
    IsActief BIT NOT NULL DEFAULT b'1',
    Opmerking VARCHAR(250) NULL,
    DatumAangemaakt DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    DatumGewijzigd DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
    PRIMARY KEY (Id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE Leverancier (
    Id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Naam VARCHAR(100) NOT NULL,
    ContactPersoon VARCHAR(100) NOT NULL,
    LeverancierNummer VARCHAR(20) NOT NULL,
    Mobiel VARCHAR(20) NOT NULL,
    ContactId INT UNSIGNED NOT NULL,
    IsActief BIT NOT NULL DEFAULT b'1',
    Opmerking VARCHAR(250) NULL,
    DatumAangemaakt DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    DatumGewijzigd DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
    PRIMARY KEY (Id),
    UNIQUE KEY UQ_Leverancier_Nummer (LeverancierNummer),
    CONSTRAINT FK_Leverancier_Contact FOREIGN KEY (ContactId) REFERENCES Contact (Id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- TABELLEN MET FOREIGN KEYS: stamtabellen bestaan nu al.
CREATE TABLE Magazijn (
    Id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    ProductId INT UNSIGNED NOT NULL,
    VerpakkingsEenheid DECIMAL(6,2) UNSIGNED NOT NULL,
    AantalAanwezig INT UNSIGNED NULL,
    IsActief BIT NOT NULL DEFAULT b'1',
    Opmerking VARCHAR(250) NULL,
    DatumAangemaakt DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    DatumGewijzigd DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
    PRIMARY KEY (Id),
    UNIQUE KEY UQ_Magazijn_Product (ProductId),
    CONSTRAINT FK_Magazijn_Product FOREIGN KEY (ProductId) REFERENCES Product (Id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE ProductPerAllergeen (
    Id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    ProductId INT UNSIGNED NOT NULL,
    AllergeenId INT UNSIGNED NOT NULL,
    IsActief BIT NOT NULL DEFAULT b'1',
    Opmerking VARCHAR(250) NULL,
    DatumAangemaakt DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    DatumGewijzigd DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
    PRIMARY KEY (Id),
    UNIQUE KEY UQ_ProductPerAllergeen (ProductId, AllergeenId),
    CONSTRAINT FK_ProductPerAllergeen_Product FOREIGN KEY (ProductId) REFERENCES Product (Id),
    CONSTRAINT FK_ProductPerAllergeen_Allergeen FOREIGN KEY (AllergeenId) REFERENCES Allergeen (Id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE ProductPerLeverancier (
    Id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    LeverancierId INT UNSIGNED NOT NULL,
    ProductId INT UNSIGNED NOT NULL,
    DatumLevering DATE NOT NULL,
    Aantal INT UNSIGNED NOT NULL,
    DatumEerstVolgendeLevering DATE NULL,
    IsActief BIT NOT NULL DEFAULT b'1',
    Opmerking VARCHAR(250) NULL,
    DatumAangemaakt DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    DatumGewijzigd DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
    PRIMARY KEY (Id),
    CONSTRAINT FK_ProductPerLeverancier_Leverancier FOREIGN KEY (LeverancierId) REFERENCES Leverancier (Id),
    CONSTRAINT FK_ProductPerLeverancier_Product FOREIGN KEY (ProductId) REFERENCES Product (Id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Gegeven oefengegevens uit J2-Opdr1-BE-2026-P1-IO-SD2509AB.docx.
START TRANSACTION;
INSERT INTO Product (Id, Naam, Barcode, IsActief) VALUES
(1, 'Mintnopjes', '8719587231278', b'1'),
(2, 'Schoolkrijt', '8719587326713', b'1'),
(3, 'Honingdrop', '8719587327836', b'1'),
(4, 'Zure Beren', '8719587321441', b'1'),
(5, 'Cola Flesjes', '8719587321237', b'1'),
(6, 'Turtles', '8719587322245', b'1'),
(7, 'Witte Muizen', '8719587328256', b'1'),
(8, 'Reuzen Slangen', '8719587325641', b'1'),
(9, 'Zoute Rijen', '8719587322739', b'1'),
(10, 'Winegums', '8719587327527', b'0'),
(11, 'Drop Munten', '8719587322345', b'1'),
(12, 'Kruis Drop', '8719587322265', b'1'),
(13, 'Zoute Ruitjes', '8719587323256', b'1');

INSERT INTO Allergeen (Id, Naam, Omschrijving) VALUES
(1, 'Gluten', 'Dit product bevat gluten'),
(2, 'Gelatine', 'Dit product bevat gelatine'),
(3, 'AZO-Kleurstof', 'Dit product bevat AZO-kleurstoffen'),
(4, 'Lactose', 'Dit product bevat lactose'),
(5, 'Soja', 'Dit product bevat soja');

INSERT INTO Contact (Id, Straatnaam, Huisnummer, Postcode, Stad) VALUES
(1, 'Van Gilslaan', '34', '1045CB', 'Hilvarenbeek'),
(2, 'Den Dolderpad', '2', '1067RC', 'Utrecht'),
(3, 'Fredo Raalteweg', '257', '1236OP', 'Nijmegen'),
(4, 'Bertrand Russellhof', '21', '2034AP', 'Den Haag'),
(5, 'Leon van Bonstraat', '213', '145XC', 'Lunteren'),
(6, 'Bea van Lingenlaan', '234', '2197FG', 'Sint Pancras');

INSERT INTO Leverancier (Id, Naam, ContactPersoon, LeverancierNummer, Mobiel, ContactId) VALUES
(1, 'Venco', 'Bert van Linge', 'L1029384719', '06-28493827', 1),
(2, 'Astra Sweets', 'Jasper del Monte', 'L1029284315', '06-39398734', 2),
(3, 'Haribo', 'Sven Stalman', 'L1029324748', '06-24383291', 3),
(4, 'Basset', 'Joyce Stelterberg', 'L1023845773', '06-48293823', 4),
(5, 'De Bron', 'Remco Veenstra', 'L1023857736', '06-34291234', 5),
(6, 'Quality Street', 'Johan Nooij', 'L1029234586', '06-23458456', 6);

INSERT INTO Magazijn (Id, ProductId, VerpakkingsEenheid, AantalAanwezig) VALUES
(1,1,5,453), (2,2,2.5,400), (3,3,5,1), (4,4,1,800),
(5,5,3,234), (6,6,2,345), (7,7,1,795), (8,8,10,233),
(9,9,2.5,123), (10,10,3,NULL), (11,11,2,367), (12,12,1,467), (13,13,5,20);

INSERT INTO ProductPerAllergeen (Id, ProductId, AllergeenId) VALUES
(1,1,2), (2,1,1), (3,1,3), (4,3,4), (5,6,5), (6,9,2),
(7,9,5), (8,10,2), (9,12,4), (10,13,1), (11,13,4), (12,13,5);

-- In de bron komt Id 14 tweemaal voor. De laatste drie Id's zijn 15, 16, 17.
INSERT INTO ProductPerLeverancier
(Id, LeverancierId, ProductId, DatumLevering, Aantal, DatumEerstVolgendeLevering) VALUES
(1,1,1,'2023-11-09',23,'2023-11-16'),
(2,1,1,'2023-11-18',21,'2023-11-25'),
(3,1,2,'2023-11-09',12,'2023-11-16'),
(4,1,3,'2023-11-10',11,'2023-11-17'),
(5,2,4,'2023-11-14',16,'2023-11-21'),
(6,2,4,'2023-11-21',23,'2023-11-28'),
(7,2,5,'2023-11-14',45,'2023-11-21'),
(8,2,6,'2023-11-14',30,'2023-11-21'),
(9,3,7,'2023-11-12',12,'2023-11-19'),
(10,3,7,'2023-11-19',23,'2023-11-26'),
(11,3,8,'2023-11-10',12,'2023-11-17'),
(12,3,9,'2023-11-11',1,'2023-11-18'),
(13,4,10,'2023-11-16',24,'2023-11-30'),
(14,5,11,'2023-11-10',47,'2023-11-17'),
(15,5,11,'2023-11-19',60,'2023-11-26'),
(16,5,12,'2023-11-11',45,NULL),
(17,5,13,'2023-11-12',23,NULL);
COMMIT;

DELIMITER $$

CREATE PROCEDURE sp_GetLeveranciersWijzigen(
    IN p_Limiet INT UNSIGNED,
    IN p_Offset INT UNSIGNED
)
BEGIN
    SELECT Id, Naam, ContactPersoon, LeverancierNummer, Mobiel
    FROM Leverancier
    WHERE IsActief = b'1'
    ORDER BY Id
    LIMIT p_Limiet OFFSET p_Offset;
END$$

CREATE PROCEDURE sp_GetAantalLeveranciers()
BEGIN
    SELECT COUNT(*) AS Aantal
    FROM Leverancier
    WHERE IsActief = b'1';
END$$

CREATE PROCEDURE sp_GetLeverancierDetails(IN p_LeverancierId INT UNSIGNED)
BEGIN
    SELECT l.Id, l.Naam, l.ContactPersoon, l.LeverancierNummer, l.Mobiel,
           c.Straatnaam, c.Huisnummer, c.Postcode, c.Stad
    FROM Leverancier l
    INNER JOIN Contact c ON c.Id = l.ContactId AND c.IsActief = b'1'
    WHERE l.Id = p_LeverancierId AND l.IsActief = b'1';
END$$

CREATE PROCEDURE sp_WijzigLeverancier(
    IN p_LeverancierId INT UNSIGNED,
    IN p_Naam VARCHAR(100),
    IN p_ContactPersoon VARCHAR(100),
    IN p_LeverancierNummer VARCHAR(20),
    IN p_Mobiel VARCHAR(20),
    IN p_Straatnaam VARCHAR(100),
    IN p_Huisnummer VARCHAR(10),
    IN p_Postcode VARCHAR(7),
    IN p_Stad VARCHAR(100)
)
BEGIN
    DECLARE v_ContactId INT UNSIGNED;

    IF p_LeverancierId = 5 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'TECHNISCHE_STORING';
    END IF;

    SELECT ContactId INTO v_ContactId
    FROM Leverancier
    WHERE Id = p_LeverancierId AND IsActief = b'1';

    START TRANSACTION;
    UPDATE Leverancier
       SET Naam = p_Naam,
           ContactPersoon = p_ContactPersoon,
           LeverancierNummer = p_LeverancierNummer,
           Mobiel = p_Mobiel
     WHERE Id = p_LeverancierId AND IsActief = b'1';

    UPDATE Contact
       SET Straatnaam = p_Straatnaam,
           Huisnummer = p_Huisnummer,
           Postcode = p_Postcode,
           Stad = p_Stad
     WHERE Id = v_ContactId AND IsActief = b'1';
    COMMIT;
END$$

CREATE PROCEDURE sp_GetLeveranciersOverzicht()
BEGIN
    SELECT l.Id, l.Naam, l.ContactPersoon, l.LeverancierNummer, l.Mobiel,
           COUNT(DISTINCT ppl.ProductId) AS AantalVerschillendeProducten
    FROM Leverancier l
    LEFT JOIN ProductPerLeverancier ppl
      ON ppl.LeverancierId = l.Id AND ppl.IsActief = b'1'
    WHERE l.IsActief = b'1'
    GROUP BY l.Id, l.Naam, l.ContactPersoon, l.LeverancierNummer, l.Mobiel
    ORDER BY AantalVerschillendeProducten DESC, l.Naam ASC;
END$$

CREATE PROCEDURE sp_GetGeleverdeProducten(IN p_LeverancierId INT UNSIGNED)
BEGIN
    SELECT p.Id, p.Naam, p.IsActief,
           m.AantalAanwezig, m.VerpakkingsEenheid,
           MAX(ppl.DatumLevering) AS LaatsteLevering
    FROM ProductPerLeverancier ppl
    INNER JOIN Product p ON p.Id = ppl.ProductId
    LEFT JOIN Magazijn m ON m.ProductId = p.Id AND m.IsActief = b'1'
    WHERE ppl.LeverancierId = p_LeverancierId AND ppl.IsActief = b'1'
    GROUP BY p.Id, p.Naam, p.IsActief, m.AantalAanwezig, m.VerpakkingsEenheid
    ORDER BY m.AantalAanwezig DESC, p.Naam ASC;
END$$

CREATE PROCEDURE sp_VoegProductLeveringToe(
    IN p_LeverancierId INT UNSIGNED,
    IN p_ProductId INT UNSIGNED,
    IN p_Aantal INT UNSIGNED,
    IN p_DatumEerstVolgendeLevering DATE
)
BEGIN
    DECLARE v_IsActief BIT DEFAULT b'0';
    DECLARE v_NieuwId INT UNSIGNED;

    SELECT IsActief INTO v_IsActief FROM Product WHERE Id = p_ProductId;
    IF v_IsActief = b'0' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'PRODUCT_NIET_ACTIEF';
    END IF;

    START TRANSACTION;
    SELECT COALESCE(MAX(Id), 0) + 1 INTO v_NieuwId FROM ProductPerLeverancier FOR UPDATE;
    INSERT INTO ProductPerLeverancier
      (Id, LeverancierId, ProductId, DatumLevering, Aantal, DatumEerstVolgendeLevering)
    VALUES
      (v_NieuwId, p_LeverancierId, p_ProductId, CURRENT_DATE(), p_Aantal, p_DatumEerstVolgendeLevering);
    UPDATE Magazijn
       SET AantalAanwezig = COALESCE(AantalAanwezig, 0) + p_Aantal
     WHERE ProductId = p_ProductId AND IsActief = b'1';
    COMMIT;
END$$

DELIMITER ;
