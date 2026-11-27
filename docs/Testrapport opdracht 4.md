# Testrapport opdracht 4 – Overzicht Allergenen

## Uitvoering

De tests zijn uitgevoerd met `php artisan test --compact`. Daarnaast is de
frontend gebouwd met `npm run build`.

## Resultaten

| Onderdeel | Resultaat |
|---|---|
| Applicatietests | 54 geslaagd (202 assertions); één bestaande magazijnassertie is aangepast voor het extra actieve product uit opdracht 4. |
| Productiebuild | Geslaagd met Vite. |
| T01–T06 | Worden afgedekt door `tests/Feature/AllergeenTest.php` en bestaande authenticatietests. |
| Database | MySQL Workbench-script bevat tabellen, relaties, testgegevens en beide opdracht-4-procedures. |

De testsuites gebruiken voor automatische herhaalbaarheid SQLite. De
productieconfiguratie en het SQL-createscript zijn gericht op MySQL/InnoDB.
Een handmatige controle van de lokale MySQL-server en MySQL Workbench is nodig
op de computer waar de opname wordt gemaakt.
