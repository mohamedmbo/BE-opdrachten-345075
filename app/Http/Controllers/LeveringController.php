<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\View\View;

class LeveringController extends Controller
{
    public function show(int $id, Product $producten): View
    {
        $product = $producten->vind($id);
        abort_if($product === null, 404);
        $leveringen = $producten->leveringen($id);
        $geenVoorraad = ($product->AantalAanwezig ?? 0) <= 0;

        // Neem de planning van de laatste levering, niet de huidige kalenderdatum:
        // de schoolopdracht werkt met historische oefengegevens.
        $laatsteLevering = $leveringen === [] ? null : $leveringen[array_key_last($leveringen)];
        $volgendeLevering = $laatsteLevering?->DatumEerstVolgendeLevering;
        $leveranciers = collect($leveringen)->unique('LeverancierId');

        return view('magazijn.leveringen', compact(
            'product', 'leveringen', 'geenVoorraad', 'volgendeLevering', 'leveranciers'
        ));
    }
}
