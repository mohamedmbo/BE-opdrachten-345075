# Periode 1 onderdeel 3

De twee userstories van opdracht 1 zijn gerealiseerd met Laravel, MVC, OOP en PDO. De functionaliteit van periode 2 is niet toegevoegd.

## Scenario's

| Scenario | Handeling | Resultaat |
|---|---|---|
| 1.1 | Vraagteken bij Mintnopjes | Venco, contactpersoon, nummer en mobiel; twee leveringen op datum oplopend |
| 1.2 | Vraagteken bij Winegums | Voorraadmelding met verwachte leverdatum; na 4 seconden terug |
| 2.1 | Rood kruis bij Zoute Ruitjes | Naam en barcode; Gluten, Lactose en Soja alfabetisch |
| 2.2 | Rood kruis bij Cola Flesjes | Melding dat er geen allergenen zijn; na 4 seconden terug |

De homepage en het dashboard bevatten een link naar **Overzicht Magazijn Jamin**. Het overzicht toont alle actieve producten, inclusief Winegums zonder voorraad, gesorteerd op barcode oplopend. Alle magazijnroutes vereisen een ingelogde gebruiker.

## Hoe de code werkt

1. Een adres in `routes/web.php` verwijst naar een controller.
2. De controller vraagt de gegevens op bij `app/Models/Product.php`.
3. Dit model gebruikt de PDO-verbinding van Laravel. Productnummers worden als parameters gebonden aan voorbereide SQL-queries.
4. De controller kiest de normale weergave of de melding.
5. Een Blade-view toont de gegevens met automatische HTML-escaping.
6. Bij de twee lege scenario's stuurt de gedeelde terugmelding de browser na vier seconden terug. Zonder JavaScript is er een meta-refresh als alternatief.

De datum komt uit de meest recente geregistreerde levering, zodat ook de historische gegevens uit de les bruikbaar zijn. Onbekende producten geven 404. Een NULL-voorraad en een voorraad van nul worden beide als geen voorraad behandeld.

## Verschil in de opdrachttekst

De tekst van scenario 1.2 noemt **30-04-2023**. De meegeleverde specificatietabel noemt bij Winegums **2024-10-30**. De app toont **30-10-2024**, rechtstreeks uit die tabel. Er staat geen vaste datum in de schermcode.

In ProductPerLeverancier staat tweemaal Id 14. In de SQL-bestanden zijn de laatste drie Id's 15, 16 en 17; alle leveringen zijn behouden.

## Databasebestanden

- `db/createscript.sql`: zelfgeschreven createscript met alle zes tabellen en oefengegevens.
- `db/jamin-export.sql`: echte MySQL-export van de zes tabellen, inclusief relaties en gegevens.
- `db/laravel-structuur.sql`: export van de Laravel-tabellen zonder persoonlijke accountgegevens.
- `docs/database-specificatie.html`: volledige specificatie volgens de vijf kolommen van het schoolvoorbeeld.

Gebruik bij een nieuwe installatie de Laravel-migraties en daarna **ofwel** het createscript **ofwel** de Jamin-export. Importeer beide niet over elkaar. De extra structuur-export is ter documentatie; wie de migraties heeft uitgevoerd hoeft die niet te importeren.

## Git

Er zijn twee featurebranches volgens de opdracht: `feature_leveringsinformatie_product` en `feature_allergeneninformatie_product`. De wijzigingen worden na controle samengevoegd in `main`. De geschiedenis bevat meer dan twintig inhoudelijke commits.

## Video en inleveren

Maak een opname van maximaal 60 seconden. Volg `docs/video-opdracht-3.md` en bewaar de opname in `vids`. Publiceer de projectmap met Git-geschiedenis in een publieke GitHub-repository genaamd `BE-opdracht-1-STUDENTNUMMER`. Lever video en repositorylink in bij Canvas 3.3, uiterlijk **4 oktober 2026 om 23:00**.

Bronnen: [Lesmateriaal 3.2](https://mboutrecht.instructure.com/courses/6142/pages/3-dot-2-lesmateriaal-realiseren-userstories-opdracht-1), [Inleveropdracht 3.3](https://mboutrecht.instructure.com/courses/6142/assignments/50354).
