<?php

namespace App\Http\Controllers;

use App\Http\Requests\UpdateLeverancierRequest;
use App\Models\Leverancier;
use App\Support\LeverancierGegevens;
use Illuminate\Http\Request;
use Illuminate\View\View;

class LeverancierController extends Controller
{
    public function index(Leverancier $leveranciers): View
    {
        return view('leveranciers.index', [
            'leveranciers' => $leveranciers->overzicht(),
        ]);
    }

    public function show(int $leverancier, Leverancier $leveranciers): View
    {
        $gevondenLeverancier = $leveranciers->vind($leverancier);
        abort_if($gevondenLeverancier === null, 404);

        return view('leveranciers.producten', [
            'leverancier' => $gevondenLeverancier,
            'producten' => $leveranciers->producten($leverancier),
        ]);
    }

    public function wijzigIndex(Request $request, Leverancier $leveranciers): View
    {
        return view('leveranciers.wijzigen-index', [
            'leveranciers' => $leveranciers->wijzigOverzicht(max(1, $request->integer('page', 1))),
        ]);
    }

    public function details(int $leverancier, Leverancier $leveranciers): View
    {
        $gevondenLeverancier = $leveranciers->details($leverancier);
        abort_if($gevondenLeverancier === null, 404);

        return view('leveranciers.details', ['leverancier' => $gevondenLeverancier]);
    }

    public function edit(int $leverancier, Leverancier $leveranciers): View
    {
        $gevondenLeverancier = $leveranciers->details($leverancier);
        abort_if($gevondenLeverancier === null, 404);

        return view('leveranciers.wijzigen', ['leverancier' => $gevondenLeverancier]);
    }

    public function update(
        UpdateLeverancierRequest $request,
        int $leverancier,
        Leverancier $leveranciers,
    ): View {
        $gegevens = $request->validated();
        $gegevens['postcode'] = LeverancierGegevens::normaliseerPostcode($gegevens['postcode']);
        $gelukt = $leveranciers->wijzig($leverancier, $gegevens);
        $gevondenLeverancier = $leveranciers->details($leverancier);
        abort_if($gevondenLeverancier === null, 404);

        return view('leveranciers.wijzigen', [
            'leverancier' => $gevondenLeverancier,
            'melding' => $gelukt
                ? 'De wijzigingen zijn doorgevoerd'
                : 'Door een technische storing is het niet mogelijk de wijziging door te voeren. Probeer het op een later moment nog eens',
            'meldingType' => $gelukt ? 'succes' : 'fout',
            'redirectUrl' => route('leveranciers.wijzigen.details', $leverancier),
        ]);
    }
}
