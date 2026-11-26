<x-magazijn-layout title="Wijzig Leveranciergegevens">
    @isset($melding)
        <div class="status-melding status-{{ $meldingType }}" role="alert">{{ $melding }}</div>
        <script>window.setTimeout(() => window.location.href = @json($redirectUrl), 3000);</script>
    @endisset

    <form class="leverancier-formulier" method="POST"
          action="{{ route('leveranciers.wijzigen.update', $leverancier->Id) }}">
        @csrf
        @method('PATCH')
        @php
            $velden = [
                'naam' => ['Naam', $leverancier->Naam],
                'contactpersoon' => ['Contactpersoon', $leverancier->ContactPersoon],
                'leveranciernummer' => ['Leveranciernummer', $leverancier->LeverancierNummer],
                'mobiel' => ['Mobiel', $leverancier->Mobiel],
                'straatnaam' => ['Straatnaam', $leverancier->Straatnaam],
                'huisnummer' => ['Huisnummer', $leverancier->Huisnummer],
                'postcode' => ['Postcode', $leverancier->Postcode],
                'stad' => ['Stad', $leverancier->Stad],
            ];
        @endphp
        @foreach ($velden as $naam => [$label, $waarde])
            <div>
                <label for="{{ $naam }}">{{ $label }}</label>
                <input id="{{ $naam }}" name="{{ $naam }}" type="text"
                       value="{{ old($naam, $waarde) }}" required>
                @error($naam)<p class="veld-fout">{{ $message }}</p>@enderror
            </div>
        @endforeach

        <div class="actie-balk formulier-acties">
            <button class="actie-knop actie-knop-rood" type="submit">Sla op</button>
            <a class="actie-knop" href="{{ route('leveranciers.wijzigen.details', $leverancier->Id) }}">Terug</a>
            <a class="actie-knop actie-knop-donker" href="{{ route('dashboard') }}">Home</a>
        </div>
    </form>
</x-magazijn-layout>
