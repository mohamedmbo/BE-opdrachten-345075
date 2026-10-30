<x-magazijn-layout title="Levering Product">
    <dl class="leverancier-info levering-info">
        <div><dt>Product</dt><dd>{{ $product->Naam }}</dd></div>
        <div><dt>Leverancier</dt><dd>{{ $leverancier->Naam }}</dd></div>
        <div><dt>Contactpersoon</dt><dd>{{ $leverancier->ContactPersoon }}</dd></div>
        <div><dt>Mobiel</dt><dd>{{ $leverancier->Mobiel }}</dd></div>
    </dl>

    @if (!empty($productNietActief))
        <div class="status-melding status-fout" role="alert">
            Het product {{ $product->Naam }} van de leverancier {{ $leverancier->Naam }} wordt niet meer geproduceerd
        </div>
        <script>window.setTimeout(() => window.location.href = @json(route('leveranciers.producten', $leverancier->Id)), 4000);</script>
    @else
        <form class="levering-formulier" method="POST"
              action="{{ route('leveringen.store', [$leverancier->Id, $product->Id]) }}">
            @csrf
            <div>
                <label for="aantal">Aantal producteenheden</label>
                <input id="aantal" name="aantal" type="number" min="1" max="100000"
                       value="{{ old('aantal') }}" required autofocus>
                @error('aantal')<p class="veld-fout">{{ $message }}</p>@enderror
            </div>
            <div>
                <label for="datum_eerstvolgende_levering">Datum eerstvolgende levering</label>
                <input id="datum_eerstvolgende_levering" name="datum_eerstvolgende_levering" type="date"
                       value="{{ old('datum_eerstvolgende_levering') }}" required>
                @error('datum_eerstvolgende_levering')<p class="veld-fout">{{ $message }}</p>@enderror
            </div>
            <button class="opslaan-knop" type="submit">Sla op</button>
        </form>
    @endif

    <div class="actie-balk">
        <a class="actie-knop" href="{{ route('leveranciers.producten', $leverancier->Id) }}">Terug</a>
        <a class="actie-knop actie-knop-donker" href="{{ route('dashboard') }}">Home</a>
    </div>
</x-magazijn-layout>
