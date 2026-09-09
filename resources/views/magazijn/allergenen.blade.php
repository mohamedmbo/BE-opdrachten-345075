<x-magazijn-layout title="Overzicht Allergenen">
    <dl class="product-info">
        <div><dt>Naam product</dt><dd>{{ $product->Naam }}</dd></div>
        <div><dt>Barcode</dt><dd class="nummer">{{ $product->Barcode }}</dd></div>
    </dl>
    <div class="table-wrap">
        <table class="voorraad-table">
            <caption class="sr-only">Allergenen van {{ $product->Naam }}, alfabetisch op naam</caption>
            <thead><tr><th scope="col">Naam</th><th scope="col">Omschrijving</th></tr></thead>
            <tbody>
                @forelse ($allergenen as $allergeen)
                    <tr><td class="font-semibold">{{ $allergeen->Naam }}</td><td>{{ $allergeen->Omschrijving }}</td></tr>
                @empty
                    <tr><td colspan="2">
                        <p class="melding" role="status">In dit product zitten geen stoffen die een allergische reactie kunnen veroorzaken</p>
                        <x-terugmelding />
                    </td></tr>
                @endforelse
            </tbody>
        </table>
    </div>
    <a class="terug-link" href="{{ route('magazijn.index') }}">← Terug naar het magazijn</a>
</x-magazijn-layout>

