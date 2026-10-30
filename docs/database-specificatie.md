# Database Specificatie – Jamin opdracht 2

Studentnummer: **345075**  
Database: **MySQL / InnoDB** (`jamin_opdracht2`)  
Databasecontrole en videobewijs: **MySQL Workbench**

## Tabellen en relaties

| Tabel | Primaire sleutel | Foreign keys | Doel |
|---|---|---|---|
| Product | Id | – | Productgegevens en actieve status |
| Magazijn | Id | ProductId → Product.Id | Verpakkingseenheid en actuele voorraad |
| Allergeen | Id | – | Allergenen en omschrijvingen |
| ProductPerAllergeen | Id | ProductId → Product.Id, AllergeenId → Allergeen.Id | Koppelt producten aan allergenen |
| Leverancier | Id | – | Leveranciers- en contactgegevens |
| ProductPerLeverancier | Id | LeverancierId → Leverancier.Id, ProductId → Product.Id | Leverhistorie en geplande levering |

Alle zes tabellen hebben de verplichte systeemvelden `IsActief`, `Opmerking`,
`DatumAangemaakt` en `DatumGewijzigd`. De database gebruikt foreign-key-
constraints, unieke indexen en de InnoDB storage engine.

## Stored procedures

- `sp_GetLeveranciersOverzicht`: leveranciers plus aantal verschillende producten,
  aflopend gesorteerd.
- `sp_GetGeleverdeProducten`: geleverde producten per leverancier, aflopend op
  magazijnvoorraad.
- `sp_VoegProductLeveringToe`: controleert actieve status en schrijft levering en
  voorraadwijziging samen in één transactie.

Het volledige, herhaalbaar uitvoerbare Workbench-script staat in
`db/createscript.sql`.
