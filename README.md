# BE-opdracht-2-345075 – Jamin backend

Laravel 12 MVC-applicatie voor Backend leerjaar 2. De applicatie bevat de
leveranciersopdrachten en het allergenenoverzicht voor opdracht 4, volgens de
user story en wireframes uit de officiële Canvas-bijlage.

## Techniek

- Laravel MVC en objectgeoriënteerde PHP
- PDO met gebonden parameters
- MySQL/InnoDB via MySQL Workbench
- Stored procedures en transacties
- Laravel Breeze-authenticatie
- Geautomatiseerde tests voor voorraad, leveranciers, allergenen en inloggen

## Installeren

1. Voer `db/createscript.sql` uit in MySQL Workbench.
2. Kopieer `.env.example` naar `.env` en gebruik `DB_DATABASE=jamin_opdracht2`.
3. Voer `composer install`, `php artisan key:generate` en `php artisan migrate` uit.
4. Voer `npm install` en `npm run build` uit.
5. Start met `composer run dev`.

De officiële opdrachtbijlagen, opdracht-4-testdocumenten en klassendiagram staan in `docs`.
De gecontroleerde inlevervideo van 54 seconden staat volgens de opdracht in
`vids/Jamin-opdracht-2-345075.mp4`. Een identieke werkkopie staat ook in
`docs/Jamin-opdracht-2-345075.mp4`.

## Git-workflow

De eerdere features zijn ontwikkeld op `feature_overzicht_leverancier` en
`feature_toevoegen_product`, gemerged naar `dev` en na testen naar `main`.
Voor opdracht 4 is de feature `feature_overzicht_allergenen`.
