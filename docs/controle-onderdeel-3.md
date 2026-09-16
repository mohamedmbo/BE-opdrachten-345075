# Controle van periode 1 onderdeel 3

Datum: 16 september 2026.

- Alle geautomatiseerde tests zijn geslaagd. Daaronder vallen alle vier de scenario's en de bestaande authenticatietests.
- De tests gebruiken SQLite in het geheugen, met dezelfde INSERT-gegevens als het MySQL-createscript.
- Frontendbuild geslaagd.
- In de browser met echte MySQL-data gecontroleerd: login, magazijnoverzicht, Mintnopjes, Winegums, Zoute Ruitjes en Cola Flesjes.
- Winegums toont de verwachte leverdatum 30-10-2024 uit de gegeven tabel en keert automatisch terug.
- Zoute Ruitjes toont Gluten, Lactose en Soja, alfabetisch.
- Cola Flesjes toont de voorgeschreven melding en keert automatisch terug.
- De app gebruikt PDO prepared statements, gebonden productnummers en geescapete HTML.
- De export bevat alleen schoolgegevens. Accountgegevens en lokale instellingen worden niet meegenomen.

De controleaccount is alleen gebruikt voor lokale verificatie. De definitieve video staat in `vids/opdracht-1.mp4`, duurt 49 seconden en blijft daarmee onder de eis van maximaal 60 seconden. De openbare GitHub-publicatie en Canvas-inlevering zijn afzonderlijke externe stappen.
