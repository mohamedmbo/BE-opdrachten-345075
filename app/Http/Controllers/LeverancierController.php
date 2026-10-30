<?php

namespace App\Http\Controllers;

use App\Models\Leverancier;
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
}
