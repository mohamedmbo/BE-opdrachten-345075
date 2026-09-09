# Database Jamin - onderdeel 2.4

Bron: [opdracht 2.4 in Canvas](https://mboutrecht.instructure.com/courses/6142/assignments/50315), bijlage J2-Opdr1-BE-2026-P1-IO-SD2509AB.docx.

Het uitvoerbare script staat in `db/createscript.sql`. Eerst worden de drie stamtabellen gemaakt, daarna de drie tabellen met foreign keys. Alle tabellen gebruiken InnoDB en utf8mb4.

| Tabel | Velden naast de systeemvelden | Relaties |
|---|---|---|
| Product | Id INT UNSIGNED PK, Naam VARCHAR(100), Barcode CHAR(13) UNIQUE | Geen |
| Allergeen | Id INT UNSIGNED PK, Naam VARCHAR(100), Omschrijving VARCHAR(250) | Geen |
| Leverancier | Id INT UNSIGNED PK, Naam VARCHAR(100), ContactPersoon VARCHAR(100), LeverancierNummer VARCHAR(20) UNIQUE, Mobiel VARCHAR(20) | Geen |
| Magazijn | Id INT UNSIGNED PK, ProductId INT UNSIGNED UNIQUE, VerpakkingsEenheid DECIMAL(6,2) UNSIGNED, AantalAanwezig INT UNSIGNED NULL | ProductId naar Product.Id |
| ProductPerAllergeen | Id INT UNSIGNED PK, ProductId INT UNSIGNED, AllergeenId INT UNSIGNED | Naar Product.Id en Allergeen.Id; combinatie uniek |
| ProductPerLeverancier | Id INT UNSIGNED PK, LeverancierId INT UNSIGNED, ProductId INT UNSIGNED, DatumLevering DATE, Aantal INT UNSIGNED, DatumEerstVolgendeLevering DATE NULL | Naar Leverancier.Id en Product.Id |

## Systeemvelden in alle zes tabellen

- IsActief: BIT, standaard 1.
- Opmerking: VARCHAR(250), mag NULL zijn.
- DatumAangemaakt: DATETIME(6), standaard het moment van toevoegen.
- DatumGewijzigd: DATETIME(6), wordt bij wijzigen bijgewerkt.

Alle overige velden zijn verplicht, tenzij hierboven NULL staat. Id is automatisch oplopend. Een barcode en telefoonnummer zijn tekst: je rekent er niet mee. VerpakkingsEenheid gebruikt decimalen omdat 2,5 kg voorkomt. De voorraad van Winegums blijft NULL zoals in de opdracht. Een onbekende volgende leverdatum mag NULL zijn.

Foreign keys voorkomen verwijzingen naar niet-bestaande records. Verwijderen van gebruikte stamrecords wordt geweigerd. Een product kan meerdere leveringen van dezelfde leverancier hebben, dus die combinatie is daar niet uniek.

## Opmerkingen over de bron

- ProductPerLeverancier bevat in de bron tweemaal Id 14. In dit script krijgen de laatste drie rijen Id 15, 16 en 17. Alle 17 leveringen blijven behouden.
- De datums in de gegeven tabellen zijn uit 2024. Deze zijn letterlijk overgenomen; de tekst van het latere scenario noemt een afwijkende datum uit 2023.
- De bron noemt product 9 'Zoute Rijen'; deze spelling is behouden.
- Verwachte aantallen: 13 producten, 5 allergenen, 5 leveranciers, 13 voorraadregels, 12 allergeenkoppelingen en 17 leveringen.

De Laravel-tabellen (zoals users, sessions en migrations) worden apart aangemaakt door `php artisan migrate`.
