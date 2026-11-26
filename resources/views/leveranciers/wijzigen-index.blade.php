<x-magazijn-layout title="Overzicht Leveranciers">
    <div class="table-wrap">
        <table class="voorraad-table">
            <thead>
                <tr>
                    <th>Naam</th>
                    <th>Contactpersoon</th>
                    <th>Leveranciernummer</th>
                    <th>Mobiel</th>
                    <th>Leverancier Details</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($leveranciers as $leverancier)
                    <tr>
                        <td>{{ $leverancier->Naam }}</td>
                        <td>{{ $leverancier->ContactPersoon }}</td>
                        <td>{{ $leverancier->LeverancierNummer }}</td>
                        <td>{{ $leverancier->Mobiel }}</td>
                        <td>
                            <a class="icon-link icon-wijzigen"
                               href="{{ route('leveranciers.wijzigen.details', $leverancier->Id) }}"
                               aria-label="Bekijk {{ $leverancier->Naam }}" title="Leverancier details">✎</a>
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>

    @if ($leveranciers->hasPages())
        <nav class="paginering" aria-label="Paginering">
            @if ($leveranciers->onFirstPage())
                <span aria-disabled="true">Vorige</span>
            @else
                <a href="{{ $leveranciers->previousPageUrl() }}">Vorige</a>
            @endif

            <span>Pagina {{ $leveranciers->currentPage() }} van {{ $leveranciers->lastPage() }}</span>

            @if ($leveranciers->hasMorePages())
                <a href="{{ $leveranciers->nextPageUrl() }}">Volgende</a>
            @else
                <span aria-disabled="true">Volgende</span>
            @endif
        </nav>
    @endif

    <div class="actie-balk">
        <a class="actie-knop actie-knop-donker" href="{{ route('dashboard') }}">Home</a>
    </div>
</x-magazijn-layout>
