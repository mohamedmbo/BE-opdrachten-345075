<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\View\View;
use Illuminate\Http\Request;

class AllergeenController extends Controller
{
    public function index(Request $request, Product $producten): View
    {
        $allergeenId = $request->filled('allergeen') ? $request->integer('allergeen') : null;
        if ($allergeenId !== null && ! collect($producten->lijstAllergenen())->contains(fn ($item) => (int) $item->Id === $allergeenId)) {
            abort(404);
        }

        return view('magazijn.overzicht-allergenen', [
            'allergenen' => $producten->lijstAllergenen(),
            'producten' => $producten->overzichtAllergenen($allergeenId, max(1, $request->integer('page', 1))),
            'geselecteerdAllergeen' => $allergeenId,
        ]);
    }

    public function show(int $id, Product $producten): View
    {
        $product = $producten->vind($id);
        abort_if($product === null, 404);
        $allergenen = $producten->allergenen($id);

        return view('magazijn.allergenen', compact('product', 'allergenen'));
    }

    public function leverancier(int $product, Product $producten): View
    {
        $productGegevens = $producten->vind($product);
        abort_if($productGegevens === null, 404);
        $leverancier = $producten->leverancierVoorProduct($product);
        abort_if($leverancier === null, 404);

        return view('magazijn.allergeen-leverancier', compact('productGegevens', 'leverancier'));
    }
}
