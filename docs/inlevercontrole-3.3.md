# Inlevercontrole 3.3

Deze controle koppelt ieder voorschrift uit de bijlage aan het opgeleverde onderdeel.

| Eis | Bewijs in het project |
|---|---|
| MVC-framework, OOP en PDO | Laravel-routes sturen naar controllers; `app/Models/Product.php` is een klasse met PDO en gebonden parameters; Blade-bestanden zijn de views. |
| Link op homepage | `Overzicht Magazijn Jamin` staat op de homepage en het dashboard. |
| Zes specificatietabellen | `db/createscript.sql` maakt Product, Magazijn, Allergeen, ProductPerAllergeen, Leverancier en ProductPerLeverancier. |
| Sleutels, relaties en systeemvelden | Het createscript bevat primary keys, vijf foreign keys en in iedere tabel IsActief, Opmerking, DatumAangemaakt en DatumGewijzigd. |
| Userstory 1, scenario 1 | Mintnopjes toont leverancier Venco, contactpersoon, nummer, mobiel en twee leveringen op datum oplopend. |
| Userstory 1, scenario 2 | Winegums toont de voorraadmelding en keert na vier seconden terug. |
| Userstory 2, scenario 1 | Zoute Ruitjes toont productnaam, barcode en Gluten, Lactose en Soja alfabetisch. |
| Userstory 2, scenario 2 | Cola Flesjes toont de voorgeschreven melding en keert na vier seconden terug. |
| Minimaal twintig commits | `main` bevat meer dan twintig commits. |
| Twee featurebranches | `feature_leveringsinformatie_product` en `feature_allergeneninformatie_product` bestaan en zijn samengevoegd in `main`. |
| Database-export | `db/jamin-export.sql` bevat de zes tabellen, gegevens en relaties. |
| Database Specificatie Tabel | Staat in `docs/database-specificatie.html` en `docs/database-specificatie.md`. |
| Video maximaal 60 seconden | `vids/opdracht-1.mp4` duurt 49 seconden en toont de vier scenario's plus de MySQL-database `laravel` met tabellen, data en relaties. Het databasegedeelte is duidelijk gemarkeerd als MySQL. |

De scenariotekst noemt voor Winegums 30-04-2023, terwijl de meegeleverde specificatietabel 2024-10-30 bevat. De applicatie leest de datum uit de database en toont daarom 30-10-2024. Dit voorkomt een vaste datum in de view en houdt de applicatie datagestuurd.
