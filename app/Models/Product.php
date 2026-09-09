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

