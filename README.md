# BE-opdracht-2-345075 – Jamin leveranciers

Laravel 12 MVC-applicatie voor Backend leerjaar 2, opdracht 2. De applicatie
realiseert het leveranciersoverzicht, geleverde producten en het toevoegen van
productleveringen volgens de vier wireframes uit de officiële Canvas-bijlage.

## Techniek

- Laravel MVC en objectgeoriënteerde PHP
- PDO met gebonden parameters
- MySQL/InnoDB via MySQL Workbench
- Stored procedures en transacties
- Laravel Breeze-authenticatie
- 44 geautomatiseerde tests

## Installeren

1. Voer `db/createscript.sql` uit in MySQL Workbench.
2. Kopieer `.env.example` naar `.env` en gebruik `DB_DATABASE=jamin_opdracht2`.
3. Voer `composer install`, `php artisan key:generate` en `php artisan migrate` uit.
4. Voer `npm install` en `npm run build` uit.
5. Start met `composer run dev`.

De officiële opdrachtbijlage en databasespecificatie staan in `docs`.

## Git-workflow

De features zijn ontwikkeld op `feature_overzicht_leverancier` en
`feature_toevoegen_product`, gemerged naar `dev` en na testen naar `main`.
