<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\View\View;

class AllergeenController extends Controller
{
    public function show(int $id, Product $producten): View
    {
        $product = $producten->vind($id);
        abort_if($product === null, 404);
        $allergenen = $producten->allergenen($id);

        return view('magazijn.allergenen', compact('product', 'allergenen'));
    }
}

