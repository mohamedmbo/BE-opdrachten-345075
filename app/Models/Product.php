<?php

namespace App\Models;

use Illuminate\Support\Facades\DB;
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
