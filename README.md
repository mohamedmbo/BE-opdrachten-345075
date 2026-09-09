# Jamin - Backend leerjaar 2

Project voor onderdeel **2. Projectmap inrichten** in Canvas.
Laravel 12 met Laravel Breeze (Blade) voor registreren, inloggen en profielbeheer.

## Opstarten op deze computer

1. Start Wamp. Het icoontje moet groen zijn.
2. Open `C:\backend lj2\jamin` in VS Code.
3. Open de terminal en voer `composer run dev` uit.
4. Open http://localhost:8000.
5. Kies **Registreren**, maak je eigen account en log in.
6. Stop de app met Ctrl+C in de terminal.

De bestanden zijn al gebouwd. Als je alleen de website wilt starten, werkt ook `php artisan serve`.

## Wat is ingericht?

- Laravel 12, met Breeze Blade voor authenticatie.
- MySQL op 127.0.0.1:3306, database `laravel`, lokale Wamp-gebruiker `root` zonder wachtwoord volgens de les.
- InnoDB als blijvende MySQL-standaard en expliciet in de Laravel-configuratie.
- Laravel-migraties voor onder meer users en sessions.
- De zes Jamin-tabellen, hun sleutels, systeemvelden en alle gegeven oefengegevens.
- `db`: het createscript voor opdracht 2.4.
- `docs`: databasespecificatie en video-instructies.
- `vids`: plek voor je eigen opname.

Het ontwikkelcommando is aangepast voor Windows: de Pail-logviewer vereist pcntl, dat op Windows niet beschikbaar is. De webserver, wachtrij en Vite starten wel samen.

## Welke map is waarvoor?

| Map | Betekenis |
|---|---|
| app/Models | PHP-modellen voor gegevens |
| app/Http/Controllers | Verwerken van verzoeken |
| resources/views | Blade-pagina's |
| routes/web.php | Adressen van pagina's |
| database/migrations | Laravel-tabellen maken |
| db/createscript.sql | De zes schooltabellen plus oefengegevens |
| docs | Uitleg en databasespecificatie |
| vids | Zelf opgenomen inlevervideo |

## Database bekijken

Open http://localhost/phpmyadmin. Kies MySQL, gebruiker `root` en een leeg wachtwoord als Wamp om inloggen vraagt. Open database `laravel`. Bij `users` zie je je account na registratie; het wachtwoord is gehasht.

Het createscript is al uitgevoerd. Importeer het niet opnieuw in dezelfde gevulde database. Het verwijdert geen bestaande tabellen. De tabellen van Laravel staan naast de zes Jamin-tabellen.

## Opnieuw installeren op een andere computer

```powershell
composer install
Copy-Item .env.example .env
php artisan key:generate
npm.cmd ci
npm.cmd run build
```

Maak een lege MySQL-database `laravel`, controleer de DB-instellingen in `.env`, voer `php artisan migrate` uit en importeer daarna eenmalig `db/createscript.sql` via phpMyAdmin.

## Controleren

```powershell
php artisan test
php artisan migrate:status
```

De geautomatiseerde tests gebruiken een tijdelijke SQLite-database in het geheugen en wijzigen je MySQL-gegevens niet.

## Inleveren

- **2.3:** neem zelf de video op volgens `docs/video-opdracht-2.3.md` en lever hem in bij opdracht 2.3 in Canvas.
- **2.4:** lever `db/createscript.sql` in bij opdracht 2.4 in Canvas.

De userstories van onderdeel 3 vallen buiten deze projectinrichting.

Bronnen: [Canvas 2.3](https://mboutrecht.instructure.com/courses/6142/assignments/50311), [Canvas 2.4](https://mboutrecht.instructure.com/courses/6142/assignments/50315), [Laravel 12 installatie](https://laravel.com/docs/12.x/installation).
