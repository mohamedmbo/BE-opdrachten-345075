# Database specificatie Jamin

Periode 1 opdracht 1. Alle zes tabellen gebruiken InnoDB. PK = primaire sleutel; FK = foreign key. Dit bestand is uit de werkende database gegenereerd.

## Product

| Kolom naam | Datatype | Lengte | Nullable | Opmerking |
|---|---|---|---|---|
| Id | INT UNSIGNED | - | Nee | PK; automatisch oplopend |
| Naam | VARCHAR | 100 | Nee | - |
| Barcode | CHAR | 13 | Nee | Uniek |
| IsActief | BIT | 1 | Nee | Standaard 1 |
| Opmerking | VARCHAR | 250 | Ja | - |
| DatumAangemaakt | DATETIME | 6 | Nee | Standaard CURRENT_TIMESTAMP(6) |
| DatumGewijzigd | DATETIME | 6 | Nee | Standaard CURRENT_TIMESTAMP(6); automatisch bijwerken |

## Allergeen

| Kolom naam | Datatype | Lengte | Nullable | Opmerking |
|---|---|---|---|---|
| Id | INT UNSIGNED | - | Nee | PK; automatisch oplopend |
| Naam | VARCHAR | 100 | Nee | - |
| Omschrijving | VARCHAR | 250 | Nee | - |
| IsActief | BIT | 1 | Nee | Standaard 1 |
| Opmerking | VARCHAR | 250 | Ja | - |
| DatumAangemaakt | DATETIME | 6 | Nee | Standaard CURRENT_TIMESTAMP(6) |
| DatumGewijzigd | DATETIME | 6 | Nee | Standaard CURRENT_TIMESTAMP(6); automatisch bijwerken |

## Leverancier

| Kolom naam | Datatype | Lengte | Nullable | Opmerking |
|---|---|---|---|---|
| Id | INT UNSIGNED | - | Nee | PK; automatisch oplopend |
| Naam | VARCHAR | 100 | Nee | - |
| ContactPersoon | VARCHAR | 100 | Nee | - |
| LeverancierNummer | VARCHAR | 20 | Nee | Uniek |
| Mobiel | VARCHAR | 20 | Nee | - |
| IsActief | BIT | 1 | Nee | Standaard 1 |
| Opmerking | VARCHAR | 250 | Ja | - |
| DatumAangemaakt | DATETIME | 6 | Nee | Standaard CURRENT_TIMESTAMP(6) |
| DatumGewijzigd | DATETIME | 6 | Nee | Standaard CURRENT_TIMESTAMP(6); automatisch bijwerken |

## Magazijn

| Kolom naam | Datatype | Lengte | Nullable | Opmerking |
|---|---|---|---|---|
| Id | INT UNSIGNED | - | Nee | PK; automatisch oplopend |
| ProductId | INT UNSIGNED | - | Nee | Uniek; FK naar Product.Id |
| VerpakkingsEenheid | DECIMAL UNSIGNED | 6,2 | Nee | In kilogram |
| AantalAanwezig | INT UNSIGNED | - | Ja | NULL bij Winegums volgens specificatie |
| IsActief | BIT | 1 | Nee | Standaard 1 |
| Opmerking | VARCHAR | 250 | Ja | - |
| DatumAangemaakt | DATETIME | 6 | Nee | Standaard CURRENT_TIMESTAMP(6) |
| DatumGewijzigd | DATETIME | 6 | Nee | Standaard CURRENT_TIMESTAMP(6); automatisch bijwerken |

## ProductPerAllergeen

| Kolom naam | Datatype | Lengte | Nullable | Opmerking |
|---|---|---|---|---|
| Id | INT UNSIGNED | - | Nee | PK; automatisch oplopend |
| ProductId | INT UNSIGNED | - | Nee | FK naar Product.Id |
| AllergeenId | INT UNSIGNED | - | Nee | FK naar Allergeen.Id |
| IsActief | BIT | 1 | Nee | Standaard 1 |
| Opmerking | VARCHAR | 250 | Ja | - |
| DatumAangemaakt | DATETIME | 6 | Nee | Standaard CURRENT_TIMESTAMP(6) |
| DatumGewijzigd | DATETIME | 6 | Nee | Standaard CURRENT_TIMESTAMP(6); automatisch bijwerken |

## ProductPerLeverancier

| Kolom naam | Datatype | Lengte | Nullable | Opmerking |
|---|---|---|---|---|
| Id | INT UNSIGNED | - | Nee | PK; automatisch oplopend |
| LeverancierId | INT UNSIGNED | - | Nee | FK naar Leverancier.Id |
| ProductId | INT UNSIGNED | - | Nee | FK naar Product.Id |
| DatumLevering | DATE | - | Nee | - |
| Aantal | INT UNSIGNED | - | Nee | - |
| DatumEerstVolgendeLevering | DATE | - | Ja | NULL als nog niet bekend |
| IsActief | BIT | 1 | Nee | Standaard 1 |
| Opmerking | VARCHAR | 250 | Ja | - |
| DatumAangemaakt | DATETIME | 6 | Nee | Standaard CURRENT_TIMESTAMP(6) |
| DatumGewijzigd | DATETIME | 6 | Nee | Standaard CURRENT_TIMESTAMP(6); automatisch bijwerken |

ProductPerAllergeen heeft een unieke combinatie van ProductId en AllergeenId. Bij ProductPerLeverancier mogen meerdere leveringen van hetzelfde product en dezelfde leverancier voorkomen. Datums zijn overgenomen uit de tabelgegevens van 2024; het dubbele Id 14 is gecorrigeerd door door te nummeren tot 17.
