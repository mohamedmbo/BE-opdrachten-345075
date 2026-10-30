<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\View\View;

class MagazijnController extends Controller
{
    public function index(Product $producten): View
    {
        return view('magazijn.index', ['producten' => $producten->overzicht()]);
    }
}
