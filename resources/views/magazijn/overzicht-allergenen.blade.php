<x-magazijn-layout title="Overzicht Allergenen">
    <p class="intro">Producten met allergenen, alfabetisch gesorteerd op productnaam.</p>

    <form class="filter-formulier" method="GET" action="{{ route('allergenen.index') }}">
        <div>
            <label for="allergeen">Allergeen:</label>
            <select id="allergeen" name="allergeen">
                <option value="">Alle allergenen</option>
                @foreach ($allergenen as $allergeen)
                    <option value="{{ $allergeen->Id }}" @selected($geselecteerdAllergeen === (int) $allergeen->Id)>{{ $allergeen->Naam }}</option>
                @endforeach
            </select>
        </div>
        <button class="actie-knop actie-knop-rood" type="submit">Maak selectie</button>
        @if ($geselecteerdAllergeen !== null)
            <a class="actie-knop" href="{{ route('allergenen.index') }}">Wis selectie</a>
        @endif
    </form>

    <div class="table-wrap">
        <table class="voorraad-table">
            <caption class="sr-only">Producten en bijbehorende allergenen</caption>
            <thead><tr>
                <th scope="col">Naam Product</th><th scope="col">Naam Allergeen</th>
                <th scope="col">Omschrijving</th><th scope="col">Aantal Aanwezig</th><th scope="col">Info</th>
            </tr></thead>
            <tbody>
                @forelse ($producten as $product)
                    <tr>
                        <td class="font-semibold">{{ $product->ProductNaam }}</td>
                        <td>{{ $product->AllergeenNamen }}</td>
                        <td>{{ $product->Omschrijving }}</td>
                        <td>{{ $product->AantalAanwezig ?? 'Onbekend' }}</td>
                        <td><a class="icon-link icon-allergeen" href="{{ route('allergenen.leverancier', $product->ProductId) }}" aria-label="Leveranciersinformatie {{ $product->ProductNaam }}" title="Leveranciersinformatie">?</a></td>
                    </tr>
                @empty
                    <tr><td colspan="5">Er zijn geen producten met dit allergeen gevonden.</td></tr>
                @endforelse
            </tbody>
        </table>
    </div>
    @if ($producten->hasPages())
        <nav class="paginering" aria-label="Pagina's allergenen">
            @if ($producten->onFirstPage()) <span aria-disabled="true">Vorige</span>
            @else <a href="{{ $producten->previousPageUrl() }}">Vorige</a> @endif
            <span>Pagina {{ $producten->currentPage() }} van {{ $producten->lastPage() }}</span>
            @if ($producten->hasMorePages()) <a href="{{ $producten->nextPageUrl() }}">Volgende</a>
            @else <span aria-disabled="true">Volgende</span> @endif
        </nav>
    @endif
</x-magazijn-layout>
