<?php

require __DIR__.'/../vendor/autoload.php';
$app = require __DIR__.'/../bootstrap/app.php';
$app->make(Illuminate\Contracts\Console\Kernel::class)->bootstrap();

$pdo = Illuminate\Support\Facades\DB::connection()->getPdo();
$tabellen = ['Product', 'Allergeen', 'Leverancier', 'Magazijn', 'ProductPerAllergeen', 'ProductPerLeverancier'];
$html = '<!doctype html><html lang="nl"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1"><title>Database specificatie Jamin</title><style>
body{font:15px/1.5 Arial,sans-serif;color:#222;background:#f5f5f4;margin:0}
main{max-width:1100px;margin:32px auto;padding:32px;background:white}
h1{font-size:30px;margin:0 0 16px}h2{font-size:24px;margin-top:36px}
table{border-collapse:collapse;width:100%;table-layout:fixed;margin:16px 0}
th,td{border:1px solid #ccc;text-align:left;padding:10px;vertical-align:top;overflow-wrap:anywhere}
th{background:#eee}th:nth-child(1){width:23%}th:nth-child(2){width:19%}th:nth-child(3){width:10%}th:nth-child(4){width:10%}
section{break-inside:avoid}code{background:#f3f3f3;padding:2px 4px}
@media(max-width:600px){main{margin:0;padding:16px}table{font-size:12px}th,td{padding:6px}}
@media print{body{background:white}main{padding:0;margin:0}section{break-before:page}thead{display:table-header-group}}
</style></head><body><main><h1>Database specificatie Jamin</h1>
<p>Periode 1 opdracht 1. Deze specificatie beschrijft de zes schooltabellen in de MySQL-database laravel. Alle tabellen gebruiken InnoDB. De kolommen volgen het voorbeeld van school.</p>
<p>PK = primaire sleutel; FK = verwijzing naar een andere tabel. Id is automatisch oplopend. IsActief is standaard 1, Opmerking mag leeg zijn en de datumvelden registreren het aanmaak- en wijzigingsmoment.</p>';
$markdown = "# Database specificatie Jamin\n\nPeriode 1 opdracht 1. Alle zes tabellen gebruiken InnoDB. PK = primaire sleutel; FK = foreign key. Dit bestand is uit de werkende database gegenereerd.\n";

foreach ($tabellen as $tabel) {
    $query = $pdo->prepare('SELECT COLUMN_NAME, DATA_TYPE, COLUMN_TYPE, CHARACTER_MAXIMUM_LENGTH, NUMERIC_PRECISION, NUMERIC_SCALE, DATETIME_PRECISION, IS_NULLABLE, COLUMN_KEY, EXTRA FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = :tabel ORDER BY ORDINAL_POSITION');
    $query->execute(['tabel' => $tabel]);
    $kolommen = $query->fetchAll(PDO::FETCH_ASSOC);
    if ($kolommen === []) {
        throw new RuntimeException('Tabel ontbreekt: '.$tabel);
    }
    $html .= '<section><h2>'.htmlspecialchars($tabel).'</h2><table><thead><tr>';
    $headers = ['Kolom naam', 'Datatype', 'Lengte', 'Nullable', 'Opmerking'];
    foreach ($headers as $header) {
        $html .= '<th scope="col">'.$header.'</th>';
    }
    $html .= '</tr></thead><tbody>';
    $markdown .= "\n## ".$tabel."\n\n| ".implode(' | ', $headers)." |\n|---|---|---|---|---|\n";
    foreach ($kolommen as $kolom) {
        $naam = $kolom['COLUMN_NAME'];
        $type = strtoupper($kolom['DATA_TYPE']).(str_contains($kolom['COLUMN_TYPE'], 'unsigned') ? ' UNSIGNED' : '');
        $lengte = $kolom['CHARACTER_MAXIMUM_LENGTH'] ?? match ($kolom['DATA_TYPE']) {
            'decimal' => $kolom['NUMERIC_PRECISION'].','.$kolom['NUMERIC_SCALE'],
            'datetime' => $kolom['DATETIME_PRECISION'],
            'bit' => 1,
            default => '-',
        };
        $opmerking = match ($kolom['COLUMN_KEY']) { 'PRI' => 'PK; automatisch oplopend', 'UNI' => 'Uniek', default => '' };
        $fk = $pdo->prepare('SELECT REFERENCED_TABLE_NAME, REFERENCED_COLUMN_NAME FROM information_schema.KEY_COLUMN_USAGE WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = :tabel AND COLUMN_NAME = :kolom AND REFERENCED_TABLE_NAME IS NOT NULL');
        $fk->execute(['tabel' => $tabel, 'kolom' => $naam]);
        if ($relatie = $fk->fetch(PDO::FETCH_ASSOC)) {
            $doel = $relatie['REFERENCED_TABLE_NAME'];
            foreach ($tabellen as $kandidaat) {
                if (strcasecmp($doel, $kandidaat) === 0) {
                    $doel = $kandidaat;
                }
            }
            $opmerking = trim($opmerking.'; FK naar '.$doel.'.'.$relatie['REFERENCED_COLUMN_NAME'], '; ');
        }
        $opmerking = match ($naam) {
            'IsActief' => 'Standaard 1',
            'DatumAangemaakt' => 'Standaard CURRENT_TIMESTAMP(6)',
            'DatumGewijzigd' => 'Standaard CURRENT_TIMESTAMP(6); automatisch bijwerken',
            'VerpakkingsEenheid' => 'In kilogram',
            'AantalAanwezig' => 'NULL bij Winegums volgens specificatie',
            'DatumEerstVolgendeLevering' => 'NULL als nog niet bekend',
            default => $opmerking,
        };
        $cellen = [$naam, $type, (string) $lengte, $kolom['IS_NULLABLE'] === 'YES' ? 'Ja' : 'Nee', $opmerking ?: '-'];
        $html .= '<tr>';
        foreach ($cellen as $cel) {
            $html .= '<td>'.htmlspecialchars($cel, ENT_QUOTES, 'UTF-8').'</td>';
        }
        $html .= '</tr>';
        $markdown .= '| '.implode(' | ', $cellen)." |\n";
    }
    $html .= '</tbody></table></section>';
}
$toelichting = 'ProductPerAllergeen heeft een unieke combinatie van ProductId en AllergeenId. Bij ProductPerLeverancier mogen meerdere leveringen van hetzelfde product en dezelfde leverancier voorkomen. Datums zijn overgenomen uit de tabelgegevens van 2024; het dubbele Id 14 is gecorrigeerd door door te nummeren tot 17.';
$html .= '<p>'.htmlspecialchars($toelichting).'</p><p>Bron: Canvas 3.2, J2-Opdr1-BE-2026-P1-IO-SD2509AB-1.docx en Database specificatie tabel.docx.</p></main></body></html>';
$markdown .= "\n".$toelichting."\n";
file_put_contents(__DIR__.'/../docs/database-specificatie.html', $html);
file_put_contents(__DIR__.'/../docs/database-specificatie.md', $markdown);
echo "Databasespecificatie gemaakt voor zes tabellen.\n";
