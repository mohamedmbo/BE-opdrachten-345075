<?php

namespace App\Models;

use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Support\Facades\DB;
use PDO;
use PDOException;
use stdClass;

/** PDO-gegevenslaag voor de leveranciersschermen van opdracht 2 en 3. */
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

    public function wijzigOverzicht(int $pagina, int $perPagina = 4): LengthAwarePaginator
    {
        $offset = ($pagina - 1) * $perPagina;

        if ($this->database->getAttribute(PDO::ATTR_DRIVER_NAME) === 'mysql') {
            $statement = $this->database->prepare('CALL sp_GetLeveranciersWijzigen(:limiet, :offset)');
            $statement->bindValue('limiet', $perPagina, PDO::PARAM_INT);
            $statement->bindValue('offset', $offset, PDO::PARAM_INT);
            $statement->execute();
            $resultaat = $statement->fetchAll(PDO::FETCH_OBJ);
            $statement->closeCursor();

            $aantalStatement = $this->database->query('CALL sp_GetAantalLeveranciers()');
            $aantal = (int) $aantalStatement->fetch(PDO::FETCH_OBJ)->Aantal;
            $aantalStatement->closeCursor();
        } else {
            $statement = $this->database->prepare(
                'SELECT Id, Naam, ContactPersoon, LeverancierNummer, Mobiel
                 FROM Leverancier WHERE IsActief = 1 ORDER BY Id LIMIT :limiet OFFSET :offset'
            );
            $statement->bindValue('limiet', $perPagina, PDO::PARAM_INT);
            $statement->bindValue('offset', $offset, PDO::PARAM_INT);
            $statement->execute();
            $resultaat = $statement->fetchAll(PDO::FETCH_OBJ);
            $aantal = (int) $this->database
                ->query('SELECT COUNT(*) FROM Leverancier WHERE IsActief = 1')
                ->fetchColumn();
        }

        return new LengthAwarePaginator(
            $resultaat,
            $aantal,
            $perPagina,
            $pagina,
            ['path' => request()->url(), 'pageName' => 'page'],
        );
    }

    public function details(int $id): ?stdClass
    {
        if ($this->database->getAttribute(PDO::ATTR_DRIVER_NAME) === 'mysql') {
            $statement = $this->database->prepare('CALL sp_GetLeverancierDetails(:id)');
        } else {
            $statement = $this->database->prepare(
                'SELECT l.Id, l.Naam, l.ContactPersoon, l.LeverancierNummer, l.Mobiel,
                        c.Straatnaam, c.Huisnummer, c.Postcode, c.Stad
                 FROM Leverancier l
                 INNER JOIN Contact c ON c.Id = l.ContactId AND c.IsActief = 1
                 WHERE l.Id = :id AND l.IsActief = 1'
            );
        }

        $statement->execute(['id' => $id]);
        $resultaat = $statement->fetch(PDO::FETCH_OBJ) ?: null;
        $statement->closeCursor();

        return $resultaat;
    }

    public function wijzig(int $id, array $gegevens): bool
    {
        if ($id === 5 && $this->database->getAttribute(PDO::ATTR_DRIVER_NAME) !== 'mysql') {
            return false;
        }

        if ($this->database->getAttribute(PDO::ATTR_DRIVER_NAME) === 'mysql') {
            try {
                $statement = $this->database->prepare(
                    'CALL sp_WijzigLeverancier(:id, :naam, :contactpersoon, :nummer, :mobiel,
                                               :straatnaam, :huisnummer, :postcode, :stad)'
                );
                $statement->execute([
                    'id' => $id,
                    'naam' => $gegevens['naam'],
                    'contactpersoon' => $gegevens['contactpersoon'],
                    'nummer' => $gegevens['leveranciernummer'],
                    'mobiel' => $gegevens['mobiel'],
                    'straatnaam' => $gegevens['straatnaam'],
                    'huisnummer' => $gegevens['huisnummer'],
                    'postcode' => $gegevens['postcode'],
                    'stad' => $gegevens['stad'],
                ]);
                $statement->closeCursor();

                return true;
            } catch (PDOException $exception) {
                if (str_contains($exception->getMessage(), 'TECHNISCHE_STORING')) {
                    return false;
                }

                throw $exception;
            }
        }

        DB::transaction(function () use ($id, $gegevens): void {
            $leverancier = $this->database->prepare(
                'UPDATE Leverancier
                 SET Naam = :naam, ContactPersoon = :contactpersoon,
                     LeverancierNummer = :nummer, Mobiel = :mobiel
                 WHERE Id = :id AND IsActief = 1'
            );
            $leverancier->execute([
                'naam' => $gegevens['naam'],
                'contactpersoon' => $gegevens['contactpersoon'],
                'nummer' => $gegevens['leveranciernummer'],
                'mobiel' => $gegevens['mobiel'],
                'id' => $id,
            ]);

            $contact = $this->database->prepare(
                'UPDATE Contact SET Straatnaam = :straatnaam, Huisnummer = :huisnummer,
                                    Postcode = :postcode, Stad = :stad
                 WHERE Id = (SELECT ContactId FROM Leverancier WHERE Id = :id) AND IsActief = 1'
            );
            $contact->execute([
                'straatnaam' => $gegevens['straatnaam'],
                'huisnummer' => $gegevens['huisnummer'],
                'postcode' => $gegevens['postcode'],
                'stad' => $gegevens['stad'],
                'id' => $id,
            ]);
        });

        return true;
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

    public function voegLeveringToe(
        int $leverancierId,
        int $productId,
        int $aantal,
        string $datumEerstvolgendeLevering,
    ): bool {
        $product = $this->product($leverancierId, $productId);
        if ($product === null || ! (bool) $product->IsActief) {
            return false;
        }

        if ($this->database->getAttribute(PDO::ATTR_DRIVER_NAME) === 'mysql') {
            try {
                $statement = $this->database->prepare(
                    'CALL sp_VoegProductLeveringToe(:leverancierId, :productId, :aantal, :datum)'
                );
                $statement->execute([
                    'leverancierId' => $leverancierId,
                    'productId' => $productId,
                    'aantal' => $aantal,
                    'datum' => $datumEerstvolgendeLevering,
                ]);
                $statement->closeCursor();

                return true;
            } catch (PDOException $exception) {
                if (str_contains($exception->getMessage(), 'PRODUCT_NIET_ACTIEF')) {
                    return false;
                }

                throw $exception;
            }
        }

        DB::transaction(function () use ($leverancierId, $productId, $aantal, $datumEerstvolgendeLevering): void {
            $statement = $this->database->prepare(
                'INSERT INTO ProductPerLeverancier
                 (LeverancierId, ProductId, DatumLevering, Aantal, DatumEerstVolgendeLevering, IsActief)
                 VALUES (:leverancierId, :productId, :datumLevering, :aantal, :datumVolgende, 1)'
            );
            $statement->execute([
                'leverancierId' => $leverancierId,
                'productId' => $productId,
                'datumLevering' => now()->format('Y-m-d'),
                'aantal' => $aantal,
                'datumVolgende' => $datumEerstvolgendeLevering,
            ]);

            $update = $this->database->prepare(
                'UPDATE Magazijn SET AantalAanwezig = COALESCE(AantalAanwezig, 0) + :aantal
                 WHERE ProductId = :productId AND IsActief = 1'
            );
            $update->execute(['aantal' => $aantal, 'productId' => $productId]);
        });

        return true;
    }
}
