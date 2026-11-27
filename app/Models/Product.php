<?php

namespace App\Models;

use Illuminate\Support\Facades\DB;
use Illuminate\Pagination\LengthAwarePaginator;
use PDO;
use stdClass;

/** Leest de schooltabellen met PDO en gebonden parameters. */
class Product
{
    private PDO $database;

    public function __construct()
    {
        $this->database = DB::connection()->getPdo();
    }

    public function overzicht(): array
    {
        return $this->database->query(
            'SELECT p.Id, p.Naam, p.Barcode, m.VerpakkingsEenheid, m.AantalAanwezig
             FROM Product p
             LEFT JOIN Magazijn m ON m.ProductId = p.Id AND m.IsActief = 1
             WHERE p.IsActief = 1 ORDER BY p.Barcode ASC'
        )->fetchAll(PDO::FETCH_OBJ);
    }

    public function leveringen(int $id): array
    {
        $query = $this->database->prepare(
            'SELECT pl.Id, pl.DatumLevering, pl.Aantal, pl.DatumEerstVolgendeLevering,
                    l.Id AS LeverancierId, l.Naam AS LeverancierNaam,
                    l.ContactPersoon, l.LeverancierNummer, l.Mobiel
             FROM ProductPerLeverancier pl
             JOIN Leverancier l ON l.Id = pl.LeverancierId
             WHERE pl.ProductId = :id AND pl.IsActief = 1 AND l.IsActief = 1
             ORDER BY pl.DatumLevering ASC, pl.Id ASC'
        );
        $query->execute(['id' => $id]);

        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    public function allergenen(int $id): array
    {
        $query = $this->database->prepare(
            'SELECT a.Id, a.Naam, a.Omschrijving
             FROM Allergeen a
             JOIN ProductPerAllergeen pa ON pa.AllergeenId = a.Id
             WHERE pa.ProductId = :id AND pa.IsActief = 1 AND a.IsActief = 1
             ORDER BY a.Naam ASC, a.Id ASC'
        );
        $query->execute(['id' => $id]);

        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    public function lijstAllergenen(): array
    {
        return $this->database->query(
            'SELECT Id, Naam FROM Allergeen WHERE IsActief = 1 ORDER BY Naam ASC'
        )->fetchAll(PDO::FETCH_OBJ);
    }

    public function overzichtAllergenen(?int $allergeenId, int $pagina, int $perPagina = 4): LengthAwarePaginator
    {
        $offset = ($pagina - 1) * $perPagina;

        if ($this->database->getAttribute(PDO::ATTR_DRIVER_NAME) === 'mysql') {
            $statement = $this->database->prepare('CALL sp_GetOverzichtAllergenen(:allergeen, :limiet, :offset)');
            $statement->bindValue('allergeen', $allergeenId, $allergeenId === null ? PDO::PARAM_NULL : PDO::PARAM_INT);
            $statement->bindValue('limiet', $perPagina, PDO::PARAM_INT);
            $statement->bindValue('offset', $offset, PDO::PARAM_INT);
            $statement->execute();
            $resultaat = $statement->fetchAll(PDO::FETCH_OBJ);
            $statement->closeCursor();

            $aantalStatement = $this->database->prepare('CALL sp_GetAantalOverzichtAllergenen(:allergeen)');
            $aantalStatement->bindValue('allergeen', $allergeenId, $allergeenId === null ? PDO::PARAM_NULL : PDO::PARAM_INT);
            $aantalStatement->execute();
            $aantal = (int) $aantalStatement->fetch(PDO::FETCH_OBJ)->Aantal;
            $aantalStatement->closeCursor();
        } else {
            $filter = $allergeenId === null ? '' : ' AND a.Id = :allergeen';
            $statement = $this->database->prepare(
                'SELECT p.Id AS ProductId, p.Naam AS ProductNaam,
                        GROUP_CONCAT(DISTINCT a.Naam) AS AllergeenNamen,
                        GROUP_CONCAT(DISTINCT a.Omschrijving) AS Omschrijving,
                        m.AantalAanwezig, MAX(l.Id) AS LeverancierId
                 FROM Product p
                 JOIN ProductPerAllergeen pa ON pa.ProductId = p.Id AND pa.IsActief = 1
                 JOIN Allergeen a ON a.Id = pa.AllergeenId AND a.IsActief = 1
                 LEFT JOIN Magazijn m ON m.ProductId = p.Id AND m.IsActief = 1
                 LEFT JOIN ProductPerLeverancier pl ON pl.ProductId = p.Id AND pl.IsActief = 1
                 LEFT JOIN Leverancier l ON l.Id = pl.LeverancierId AND l.IsActief = 1
                 WHERE p.IsActief = 1'.$filter.'
                 GROUP BY p.Id, p.Naam, m.AantalAanwezig
                 ORDER BY p.Naam ASC LIMIT :limiet OFFSET :offset'
            );
            if ($allergeenId !== null) $statement->bindValue('allergeen', $allergeenId, PDO::PARAM_INT);
            $statement->bindValue('limiet', $perPagina, PDO::PARAM_INT);
            $statement->bindValue('offset', $offset, PDO::PARAM_INT);
            $statement->execute();
            $resultaat = $statement->fetchAll(PDO::FETCH_OBJ);

            $count = $this->database->prepare(
                'SELECT COUNT(DISTINCT p.Id) FROM Product p
                 JOIN ProductPerAllergeen pa ON pa.ProductId = p.Id AND pa.IsActief = 1
                 JOIN Allergeen a ON a.Id = pa.AllergeenId AND a.IsActief = 1
                 WHERE p.IsActief = 1'.($allergeenId === null ? '' : ' AND a.Id = :allergeen')
            );
            if ($allergeenId !== null) $count->bindValue('allergeen', $allergeenId, PDO::PARAM_INT);
            $count->execute();
            $aantal = (int) $count->fetchColumn();
        }

        return new LengthAwarePaginator($resultaat, $aantal, $perPagina, $pagina, [
            'path' => request()->url(), 'pageName' => 'page',
            'query' => array_filter(['allergeen' => $allergeenId], fn ($value) => $value !== null),
        ]);
    }

    public function leverancierVoorProduct(int $productId): ?stdClass
    {
        $statement = $this->database->prepare(
            'SELECT l.Id, l.Naam, l.ContactPersoon, l.Mobiel,
                    c.Straatnaam, c.Huisnummer, c.Postcode, c.Stad
             FROM ProductPerLeverancier pl
             JOIN Leverancier l ON l.Id = pl.LeverancierId AND l.IsActief = 1
             LEFT JOIN Contact c ON c.Id = l.ContactId AND c.IsActief = 1
             WHERE pl.ProductId = :productId AND pl.IsActief = 1
             ORDER BY pl.Id DESC LIMIT 1'
        );
        $statement->execute(['productId' => $productId]);

        return $statement->fetch(PDO::FETCH_OBJ) ?: null;
    }

    public function vind(int $id): ?stdClass
    {
        $query = $this->database->prepare(
            'SELECT p.Id, p.Naam, p.Barcode, m.VerpakkingsEenheid, m.AantalAanwezig
             FROM Product p
             LEFT JOIN Magazijn m ON m.ProductId = p.Id AND m.IsActief = 1
             WHERE p.Id = :id AND p.IsActief = 1'
        );
        $query->execute(['id' => $id]);

        return $query->fetch(PDO::FETCH_OBJ) ?: null;
    }
}
