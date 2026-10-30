<?php

namespace Tests\Support;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Support\Facades\DB;
use Tests\TestCase;

abstract class MagazijnTestCase extends TestCase
{
    use RefreshDatabase;

    protected function setUp(): void
    {
        parent::setUp();

        // Alleen de tijdelijke SQLite-testdatabase. Productie gebruikt het createscript.
        DB::unprepared('
            CREATE TABLE Product (Id INTEGER PRIMARY KEY, Naam TEXT NOT NULL, Barcode TEXT NOT NULL UNIQUE, IsActief INTEGER DEFAULT 1);
            CREATE TABLE Magazijn (Id INTEGER PRIMARY KEY, ProductId INTEGER REFERENCES Product(Id), VerpakkingsEenheid DECIMAL(6,2), AantalAanwezig INTEGER NULL, IsActief INTEGER DEFAULT 1);
            CREATE TABLE Leverancier (Id INTEGER PRIMARY KEY, Naam TEXT, ContactPersoon TEXT, LeverancierNummer TEXT, Mobiel TEXT, IsActief INTEGER DEFAULT 1);
            CREATE TABLE ProductPerLeverancier (Id INTEGER PRIMARY KEY, LeverancierId INTEGER REFERENCES Leverancier(Id), ProductId INTEGER REFERENCES Product(Id), DatumLevering TEXT, Aantal INTEGER, DatumEerstVolgendeLevering TEXT NULL, IsActief INTEGER DEFAULT 1);
            CREATE TABLE Allergeen (Id INTEGER PRIMARY KEY, Naam TEXT, Omschrijving TEXT, IsActief INTEGER DEFAULT 1);
            CREATE TABLE ProductPerAllergeen (Id INTEGER PRIMARY KEY, ProductId INTEGER REFERENCES Product(Id), AllergeenId INTEGER REFERENCES Allergeen(Id), IsActief INTEGER DEFAULT 1);
        ');

        // Test exact het gegevensblok uit het MySQL Workbench-createscript.
        $script = file_get_contents(base_path('db/createscript.sql'));
        preg_match('/START TRANSACTION;(.*?)COMMIT;/s', $script, $gegevensblok);
        preg_match_all('/INSERT INTO .*?;/s', $gegevensblok[1], $inserts);
        foreach ($inserts[0] as $insert) {
            DB::unprepared(str_replace(["b'1'", "b'0'"], ['1', '0'], $insert));
        }
    }
}

