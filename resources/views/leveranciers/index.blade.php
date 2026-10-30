<x-magazijn-layout title="Overzicht leveranciers">
    <p class="intro">Alle actieve leveranciers, gesorteerd op het aantal verschillende geleverde producten.</p>

    <div class="table-wrap">
        <table class="voorraad-table">
            <thead>
                <tr>
                    <th>Naam</th>
                    <th>Contactpersoon</th>
                    <th>Leveranciernummer</th>
                    <th>Mobiel</th>
                    <th>Aantal verschillende producten</th>
                    <th>Toon producten</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($leveranciers as $leverancier)
                    <tr>
                        <td><strong>{{ $leverancier->Naam }}</strong></td>
                        <td>{{ $leverancier->ContactPersoon }}</td>
                        <td class="nummer">{{ $leverancier->LeverancierNummer }}</td>
                        <td>{{ $leverancier->Mobiel }}</td>
                        <td class="table-number">{{ $leverancier->AantalVerschillendeProducten }}</td>
                        <td>
                            <a class="icon-link icon-product" href="{{ route('leveranciers.producten', $leverancier->Id) }}"
                               aria-label="Toon producten van {{ $leverancier->Naam }}" title="Toon producten">▣</a>
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>

    <div class="actie-balk">
        <a class="actie-knop" href="{{ route('dashboard') }}">Home</a>
    </div>
</x-magazijn-layout>
