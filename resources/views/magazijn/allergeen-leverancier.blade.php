<x-magazijn-layout title="Overzicht Leverancier Gegevens">
    <p class="intro">Leveranciersinformatie voor {{ $productGegevens->Naam }}.</p>
    <div class="table-wrap">
        <table class="voorraad-table">
            <thead><tr><th>Naam Leverancier</th><th>Contactpersoon</th><th>Mobiel</th><th>Stad</th><th>Straat</th><th>Huisnummer</th></tr></thead>
            <tbody><tr>
                <td class="font-semibold">{{ $leverancier->Naam }}</td>
                <td>{{ $leverancier->ContactPersoon }}</td>
                <td>{{ $leverancier->Mobiel }}</td>
                @if ($leverancier->Straatnaam === null)
                    <td colspan="3" class="leverancier-melding">Er is zijn geen adresgegevens bekend</td>
                @else
                    <td>{{ $leverancier->Stad }}</td><td>{{ $leverancier->Straatnaam }}</td><td>{{ $leverancier->Huisnummer }}</td>
                @endif
            </tr></tbody>
        </table>
    </div>
    <div class="actie-balk"><a class="actie-knop" href="{{ url()->previous() }}">Terug naar overzicht allergenen</a><a class="actie-knop actie-knop-donker" href="{{ route('dashboard') }}">Home</a></div>
</x-magazijn-layout>
