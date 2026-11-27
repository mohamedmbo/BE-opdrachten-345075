-- Alleen nodig als de twee procedures uit opdracht 4 los bijgewerkt moeten worden.
-- Uitvoeren in MySQL Workbench, database jamin_opdracht2 geselecteerd.
USE jamin_opdracht2;
DROP PROCEDURE IF EXISTS sp_GetOverzichtAllergenen;
DROP PROCEDURE IF EXISTS sp_GetAantalOverzichtAllergenen;
DELIMITER $$
CREATE PROCEDURE sp_GetOverzichtAllergenen(
    IN p_AllergeenId INT UNSIGNED,
    IN p_Limiet INT UNSIGNED,
    IN p_Offset INT UNSIGNED
)
BEGIN
    SELECT p.Id AS ProductId, p.Naam AS ProductNaam,
           GROUP_CONCAT(DISTINCT a.Naam ORDER BY a.Naam SEPARATOR ', ') AS AllergeenNamen,
           GROUP_CONCAT(DISTINCT a.Omschrijving ORDER BY a.Naam SEPARATOR '; ') AS Omschrijving,
           m.AantalAanwezig, MAX(l.Id) AS LeverancierId
    FROM Product p
    INNER JOIN ProductPerAllergeen pa ON pa.ProductId = p.Id AND pa.IsActief = b'1'
    INNER JOIN Allergeen a ON a.Id = pa.AllergeenId AND a.IsActief = b'1'
    LEFT JOIN Magazijn m ON m.ProductId = p.Id AND m.IsActief = b'1'
    LEFT JOIN ProductPerLeverancier pl ON pl.ProductId = p.Id AND pl.IsActief = b'1'
    LEFT JOIN Leverancier l ON l.Id = pl.LeverancierId AND l.IsActief = b'1'
    WHERE p.IsActief = b'1' AND (p_AllergeenId IS NULL OR a.Id = p_AllergeenId)
    GROUP BY p.Id, p.Naam, m.AantalAanwezig
    ORDER BY p.Naam ASC
    LIMIT p_Limiet OFFSET p_Offset;
END$$
CREATE PROCEDURE sp_GetAantalOverzichtAllergenen(IN p_AllergeenId INT UNSIGNED)
BEGIN
    SELECT COUNT(DISTINCT p.Id) AS Aantal
    FROM Product p
    INNER JOIN ProductPerAllergeen pa ON pa.ProductId = p.Id AND pa.IsActief = b'1'
    INNER JOIN Allergeen a ON a.Id = pa.AllergeenId AND a.IsActief = b'1'
    WHERE p.IsActief = b'1' AND (p_AllergeenId IS NULL OR a.Id = p_AllergeenId);
END$$
DELIMITER ;
