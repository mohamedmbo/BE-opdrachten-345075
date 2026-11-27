# Database specificatie – opdracht 4

Database: `jamin_opdracht2` (MySQL, InnoDB, utf8mb4). Het volledige
reproduceerbare script is `db/createscript.sql`; het bevat DDL, foreign keys,
testgegevens en de opgeslagen procedures. De twee procedures staan ook apart
in `db/stored-procedures-opdracht4.sql`.

| Tabel | Doel | Belangrijkste velden en relatie |
|---|---|---|
| Product | Productgegevens | `Id` PK, `Naam`, `Barcode` uniek, `IsActief`. |
| Allergeen | Allergeensoorten | `Id` PK, `Naam`, `Omschrijving`, `IsActief`. |
| ProductPerAllergeen | Koppeling product en allergeen | `ProductId` FK naar Product; `AllergeenId` FK naar Allergeen; combinatie uniek. |
| Magazijn | Voorraad per product | `ProductId` unieke FK naar Product; `AantalAanwezig` mag leeg zijn. |
| Leverancier | Leveranciersinformatie | `Id` PK, naam, contactpersoon, mobiel; `ContactId` optionele FK naar Contact. |
| Contact | Adresgegevens | `Id` PK, straat, huisnummer, postcode en stad. |
| ProductPerLeverancier | Leveringen en leverancierskoppeling | `ProductId` FK naar Product; `LeverancierId` FK naar Leverancier; leverdatum en aantal. |

`ContactId` is optioneel zodat een leverancier zonder bekend adres toch
contactpersoon en mobiel kan tonen. Voor opdracht 4 zijn `sp_GetOverzichtAllergenen`
en `sp_GetAantalOverzichtAllergenen` toegevoegd. De eerste procedure filtert
optioneel op allergeen, groepeert per product, sorteert alfabetisch en
pagineert; de tweede telt het totaal voor de paginering.
