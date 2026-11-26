USE jamin_opdracht2;

DROP PROCEDURE IF EXISTS sp_WijzigLeverancier;
DROP PROCEDURE IF EXISTS sp_GetLeverancierDetails;
DROP PROCEDURE IF EXISTS sp_GetAantalLeveranciers;
DROP PROCEDURE IF EXISTS sp_GetLeveranciersWijzigen;

DELIMITER $$

CREATE PROCEDURE sp_GetLeveranciersWijzigen(IN p_Limiet INT UNSIGNED, IN p_Offset INT UNSIGNED)
BEGIN
    SELECT Id, Naam, ContactPersoon, LeverancierNummer, Mobiel
    FROM Leverancier
    WHERE IsActief = b'1'
    ORDER BY Id
    LIMIT p_Limiet OFFSET p_Offset;
END$$

CREATE PROCEDURE sp_GetAantalLeveranciers()
BEGIN
    SELECT COUNT(*) AS Aantal FROM Leverancier WHERE IsActief = b'1';
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
    IN p_LeverancierId INT UNSIGNED, IN p_Naam VARCHAR(100),
    IN p_ContactPersoon VARCHAR(100), IN p_LeverancierNummer VARCHAR(20),
    IN p_Mobiel VARCHAR(20), IN p_Straatnaam VARCHAR(100),
    IN p_Huisnummer VARCHAR(10), IN p_Postcode VARCHAR(7), IN p_Stad VARCHAR(100)
)
BEGIN
    DECLARE v_ContactId INT UNSIGNED;

    IF p_LeverancierId = 5 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'TECHNISCHE_STORING';
    END IF;

    SELECT ContactId INTO v_ContactId FROM Leverancier
    WHERE Id = p_LeverancierId AND IsActief = b'1';

    START TRANSACTION;
    UPDATE Leverancier
       SET Naam = p_Naam, ContactPersoon = p_ContactPersoon,
           LeverancierNummer = p_LeverancierNummer, Mobiel = p_Mobiel
     WHERE Id = p_LeverancierId AND IsActief = b'1';
    UPDATE Contact
       SET Straatnaam = p_Straatnaam, Huisnummer = p_Huisnummer,
           Postcode = p_Postcode, Stad = p_Stad
     WHERE Id = v_ContactId AND IsActief = b'1';
    COMMIT;
END$$

DELIMITER ;
