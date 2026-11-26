<x-magazijn-layout title="Leverancier Details">
    <dl class="leverancier-details">
        <div><dt>Naam</dt><dd>{{ $leverancier->Naam }}</dd></div>
        <div><dt>Contactpersoon</dt><dd>{{ $leverancier->ContactPersoon }}</dd></div>
        <div><dt>Leveranciernummer</dt><dd>{{ $leverancier->LeverancierNummer }}</dd></div>
        <div><dt>Mobiel</dt><dd>{{ $leverancier->Mobiel }}</dd></div>
        <div><dt>Straatnaam</dt><dd>{{ $leverancier->Straatnaam }}</dd></div>
        <div><dt>Huisnummer</dt><dd>{{ $leverancier->Huisnummer }}</dd></div>
        <div><dt>Postcode</dt><dd>{{ $leverancier->Postcode }}</dd></div>
        <div><dt>Stad</dt><dd>{{ $leverancier->Stad }}</dd></div>
    </dl>

    <div class="actie-balk">
        <a class="actie-knop actie-knop-rood" href="{{ route('leveranciers.wijzigen.edit', $leverancier->Id) }}">Wijzig</a>
        <a class="actie-knop" href="{{ route('leveranciers.wijzigen.index') }}">Terug</a>
        <a class="actie-knop actie-knop-donker" href="{{ route('dashboard') }}">Home</a>
    </div>
</x-magazijn-layout>
