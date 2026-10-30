<?php

namespace App\Models;

use Illuminate\Support\Facades\DB;
use PDO;
use stdClass;

/** PDO-gegevenslaag voor de leveranciersschermen van opdracht 2. */
class Leverancier
{
    private PDO $database;

    public function __construct()
    {
        $this->database = DB::connection()->getPdo();
    }

    public function overzicht(): array
    {
        if ($this->database->getAttribute(PDO::ATTR_DRIVER_NAME) === 'mysql') {
            $statement = $this->database->query('CALL sp_GetLeveranciersOverzicht()');
            $resultaat = $statement->fetchAll(PDO::FETCH_OBJ);
            $statement->closeCursor();

            return $resultaat;
        }

        return $this->database->query(
            'SELECT l.Id, l.Naam, l.ContactPersoon, l.LeverancierNummer, l.Mobiel,
                    COUNT(DISTINCT ppl.ProductId) AS AantalVerschillendeProducten
             FROM Leverancier l
             LEFT JOIN ProductPerLeverancier ppl
               ON ppl.LeverancierId = l.Id AND ppl.IsActief = 1
             WHERE l.IsActief = 1
             GROUP BY l.Id, l.Naam, l.ContactPersoon, l.LeverancierNummer, l.Mobiel
             ORDER BY AantalVerschillendeProducten DESC, l.Naam ASC'
        )->fetchAll(PDO::FETCH_OBJ);
    }

    public function vind(int $id): ?stdClass
    {
        $statement = $this->database->prepare(
            'SELECT Id, Naam, ContactPersoon, LeverancierNummer, Mobiel
             FROM Leverancier WHERE Id = :id AND IsActief = 1'
        );
        $statement->execute(['id' => $id]);

        return $statement->fetch(PDO::FETCH_OBJ) ?: null;
    }

    public function producten(int $id): array
    {
        if ($this->database->getAttribute(PDO::ATTR_DRIVER_NAME) === 'mysql') {
            $statement = $this->database->prepare('CALL sp_GetGeleverdeProducten(:id)');
            $statement->execute(['id' => $id]);
            $resultaat = $statement->fetchAll(PDO::FETCH_OBJ);
            $statement->closeCursor();

            return $resultaat;
        }

        $statement = $this->database->prepare(
            'SELECT p.Id, p.Naam, p.IsActief, m.AantalAanwezig, m.VerpakkingsEenheid,
                    MAX(ppl.DatumLevering) AS LaatsteLevering
             FROM ProductPerLeverancier ppl
             JOIN Product p ON p.Id = ppl.ProductId
             LEFT JOIN Magazijn m ON m.ProductId = p.Id AND m.IsActief = 1
             WHERE ppl.LeverancierId = :id AND ppl.IsActief = 1
             GROUP BY p.Id, p.Naam, p.IsActief, m.AantalAanwezig, m.VerpakkingsEenheid
             ORDER BY m.AantalAanwezig DESC, p.Naam ASC'
        );
        $statement->execute(['id' => $id]);

        return $statement->fetchAll(PDO::FETCH_OBJ);
    }

    public function product(int $leverancierId, int $productId): ?stdClass
    {
        $statement = $this->database->prepare(
            'SELECT DISTINCT p.Id, p.Naam, p.IsActief
             FROM Product p
             JOIN ProductPerLeverancier ppl ON ppl.ProductId = p.Id
             WHERE p.Id = :productId AND ppl.LeverancierId = :leverancierId
               AND ppl.IsActief = 1'
        );
        $statement->execute([
            'productId' => $productId,
            'leverancierId' => $leverancierId,
        ]);

        return $statement->fetch(PDO::FETCH_OBJ) ?: null;
    }
}
