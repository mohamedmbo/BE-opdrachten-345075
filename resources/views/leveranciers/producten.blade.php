<x-magazijn-layout title="Geleverde producten">
    <dl class="leverancier-info">
        <div><dt>Naam leverancier</dt><dd>{{ $leverancier->Naam }}</dd></div>
        <div><dt>Contactpersoon</dt><dd>{{ $leverancier->ContactPersoon }}</dd></div>
        <div><dt>Leverancier NR</dt><dd>{{ $leverancier->LeverancierNummer }}</dd></div>
        <div><dt>Mobiel</dt><dd>{{ $leverancier->Mobiel }}</dd></div>
    </dl>

    <div class="table-wrap">
        @if (count($producten) === 0)
            <div class="lege-leverancier" role="status">
                Dit bedrijf heeft tot nu toe geen producten geleverd aan Jamin
            </div>
            <script>window.setTimeout(() => window.location.href = @json(route('leveranciers.index')), 3000);</script>
        @else
            <table class="voorraad-table">
                <thead>
                    <tr>
                        <th>Naam product</th>
                        <th>Aantal in Magazijn</th>
                        <th>Verpakkingseenheid</th>
                        <th>Laatste levering</th>
                        <th>Nieuwe levering</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($producten as $product)
                        <tr>
                            <td><strong>{{ $product->Naam }}</strong></td>
                            <td class="table-number">{{ $product->AantalAanwezig ?? 0 }}</td>
                            <td>{{ number_format((float) $product->VerpakkingsEenheid, 1, ',', '.') }} kg</td>
                            <td>{{ \Carbon\Carbon::parse($product->LaatsteLevering)->format('d-m-Y') }}</td>
                            <td>
                                <a class="icon-link icon-toevoegen"
                                   href="{{ route('leveringen.create', [$leverancier->Id, $product->Id]) }}"
                                   aria-label="Nieuwe levering voor {{ $product->Naam }}" title="Nieuwe levering">＋</a>
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        @endif
    </div>

    <div class="actie-balk">
        <a class="actie-knop" href="{{ route('leveranciers.index') }}">Terug</a>
        <a class="actie-knop actie-knop-donker" href="{{ route('dashboard') }}">Home</a>
    </div>
</x-magazijn-layout>
