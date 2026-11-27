# Testplan opdracht 4 – Overzicht Allergenen

## Doel en testomgeving

Controleren dat een ingelogde manager producten met allergenen kan vinden, op
allergeen kan filteren en de bijbehorende leveranciersinformatie kan openen.
De applicatie gebruikt Laravel MVC, PDO en MySQL/InnoDB. De database heet
`jamin_opdracht2`; de herhaalbare tabellen en oefengegevens staan in
`db/createscript.sql`. De geautomatiseerde controles gebruiken een tijdelijke
SQLite-testdatabase en laden dezelfde gegevens uit het SQL-script.

## Testgevallen

| ID | Scenario / actie | Verwacht resultaat |
|---|---|---|
| T01 | Open allergenenoverzicht zonder filter | Alleen actieve producten met allergenen, alfabetisch op productnaam; maximaal vier regels per pagina. |
| T02 | Kies Lactose en klik Maak selectie | Alleen producten met Lactose, waaronder Kruis Drop en Zoute Ruitjes. |
| T03 | Open informatie bij Kruis Drop | Leverancier De Bron, contact Remco Veenstra en adresgegevens zijn zichtbaar. |
| T04 | Kies Soja en open informatie bij Drop Ninja’s | Leveranciersgegevens en mobiel 06-23458477 zijn zichtbaar; exacte melding “Er is zijn geen adresgegevens bekend”. |
| T05 | Vraag een onbekende allergeenfilter of productpagina op | De applicatie geeft een 404-fout, geen onbedoelde databasegegevens. |
| T06 | Open overzicht zonder login | De bezoeker wordt naar de inlogpagina gestuurd. |

## Eenheidstests

`tests/Unit/LeverancierGegevensTest.php` bevat twee tests voor de methode
`LeverancierGegevens::normaliseerPostcode`: met en zonder spatie. De
featuretests voor de allergenenscenario’s staan in
`tests/Feature/AllergeenTest.php`.
