<?php

namespace App\Support;

class LeverancierGegevens
{
    public static function normaliseerPostcode(string $postcode): string
    {
        return strtoupper(str_replace(' ', '', trim($postcode)));
    }
}
