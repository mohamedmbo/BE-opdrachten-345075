<x-magazijn-layout title="Levering Informatie">
    <p class="intro">{{ $product->Naam }} · <span class="nummer">{{ $product->Barcode }}</span></p>
    @foreach ($leveranciers as $leverancier)
        <dl class="product-info">
            <div><dt>Naam leverancier</dt><dd>{{ $leverancier->LeverancierNaam }}</dd></div>
            <div><dt>Contactpersoon leverancier</dt><dd>{{ $leverancier->ContactPersoon }}</dd></div>
            <div><dt>Leveranciernummer</dt><dd>{{ $leverancier->LeverancierNummer }}</dd></div>
            <div><dt>Mobiel</dt><dd>{{ $leverancier->Mobiel }}</dd></div>
        </dl>
    @endforeach
    <div class="table-wrap">
        <table class="voorraad-table">
            <caption class="sr-only">Leveringen van {{ $product->Naam }}, gesorteerd op datum laatste levering</caption>
            <thead><tr><th scope="col">Naam product</th><th scope="col">Datum laatste levering</th><th scope="col">Aantal</th><th scope="col">Eerstvolgende levering</th></tr></thead>
            <tbody>
            @if ($geenVoorraad)
                <tr><td colspan="4">
                    <p class="melding" role="status">Er is van dit product op dit moment geen voorraad aanwezig, de verwachte eerstvolgende levering is: {{ $volgendeLevering ? \Carbon\Carbon::parse($volgendeLevering)->format('d-m-Y') : 'nog niet bekend' }}</p>
                    <x-terugmelding />
                </td></tr>
            @else
                @forelse ($leveringen as $levering)
                    <tr>
                        <td>{{ $product->Naam }}</td>
                        <td>{{ \Carbon\Carbon::parse($levering->DatumLevering)->format('d-m-Y') }}</td>
                        <td>{{ $levering->Aantal }}</td>
                        <td>{{ $levering->DatumEerstVolgendeLevering ? \Carbon\Carbon::parse($levering->DatumEerstVolgendeLevering)->format('d-m-Y') : 'Nog niet bekend' }}</td>
                    </tr>
                @empty
                    <tr><td colspan="4">Er zijn nog geen leveringen geregistreerd voor dit product.</td></tr>
                @endforelse
            @endif
            </tbody>
        </table>
    </div>
    <a class="terug-link" href="{{ route('magazijn.index') }}">← Terug naar het magazijn</a>
</x-magazijn-layout>

