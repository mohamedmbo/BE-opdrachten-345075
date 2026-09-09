<x-magazijn-layout title="Overzicht Magazijn Jamin">
    <p class="intro">{{ count($producten) }} producten · Gesorteerd op barcode, oplopend.</p>
    <div class="table-wrap">
        <table class="voorraad-table">
            <caption class="sr-only">Producten met voorraad, allergeneninformatie en leverantie-informatie</caption>
            <thead><tr>
                <th scope="col">Barcode</th><th scope="col">Naam</th>
                <th scope="col">Verpakkingseenheid (kg)</th><th scope="col">Aantal aanwezig</th>
                <th scope="col">Allergenen Info</th><th scope="col">Leverantie Info</th>
            </tr></thead>
            <tbody>
                @forelse ($producten as $product)
                    <tr>
                        <td class="nummer">{{ $product->Barcode }}</td>
                        <td class="font-semibold">{{ $product->Naam }}</td>
                        <td>{{ $product->VerpakkingsEenheid === null ? 'Onbekend' : number_format($product->VerpakkingsEenheid, 2, ',', '.') }}</td>
                        <td>
                            @if (($product->AantalAanwezig ?? 0) > 0)
                                {{ $product->AantalAanwezig }}
                            @else
                                <span class="geen-voorraad">Geen voorraad</span>
                            @endif
                        </td>
                        <td><a class="icon-link icon-allergeen" href="{{ route('producten.allergenen', $product->Id) }}" aria-label="Allergenen Info {{ $product->Naam }}"><span aria-hidden="true">×</span></a></td>
                        <td><a class="icon-link icon-levering" href="{{ route('producten.leveringen', $product->Id) }}" aria-label="Leverantie Info {{ $product->Naam }}">?</a></td>
                    </tr>
                @empty
                    <tr><td colspan="6">Er zijn nog geen producten aanwezig.</td></tr>
                @endforelse
            </tbody>
        </table>
    </div>
</x-magazijn-layout>
