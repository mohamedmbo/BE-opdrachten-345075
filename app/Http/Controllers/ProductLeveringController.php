<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreProductLeveringRequest;
use App\Models\Leverancier;
use Illuminate\Http\RedirectResponse;
use Illuminate\View\View;

class ProductLeveringController extends Controller
{
    public function create(int $leverancier, int $product, Leverancier $leveranciers): View
    {
        $gevondenLeverancier = $leveranciers->vind($leverancier);
        $gevondenProduct = $leveranciers->product($leverancier, $product);
        abort_if($gevondenLeverancier === null || $gevondenProduct === null, 404);

        return view('leveranciers.levering', [
            'leverancier' => $gevondenLeverancier,
            'product' => $gevondenProduct,
        ]);
    }

    public function store(
        StoreProductLeveringRequest $request,
        int $leverancier,
        int $product,
        Leverancier $leveranciers,
    ): RedirectResponse|View {
        $gevondenLeverancier = $leveranciers->vind($leverancier);
        $gevondenProduct = $leveranciers->product($leverancier, $product);
        abort_if($gevondenLeverancier === null || $gevondenProduct === null, 404);

        $opgeslagen = $leveranciers->voegLeveringToe(
            $leverancier,
            $product,
            $request->integer('aantal'),
            $request->string('datum_eerstvolgende_levering')->toString(),
        );

        if (! $opgeslagen) {
            return view('leveranciers.levering', [
                'leverancier' => $gevondenLeverancier,
                'product' => $gevondenProduct,
                'productNietActief' => true,
            ]);
        }

        return redirect()
            ->route('leveranciers.producten', $leverancier)
            ->with('succes', "De levering van {$gevondenProduct->Naam} is opgeslagen.");
    }
}
