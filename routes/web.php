<?php

use App\Http\Controllers\ProfileController;
use App\Http\Controllers\MagazijnController;
use App\Http\Controllers\LeveringController;
use App\Http\Controllers\AllergeenController;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/magazijn', [MagazijnController::class, 'index'])->name('magazijn.index');
    Route::get('/producten/{id}/allergenen', [AllergeenController::class, 'show'])
        ->whereNumber('id')->name('producten.allergenen');
    Route::get('/producten/{id}/leveringen', [LeveringController::class, 'show'])
        ->whereNumber('id')->name('producten.leveringen');
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__.'/auth.php';
