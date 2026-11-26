<?php

namespace Tests\Unit;

use App\Support\LeverancierGegevens;
use PHPUnit\Framework\TestCase;

class LeverancierGegevensTest extends TestCase
{
    public function test_postcode_wordt_hoofdletters_zonder_spatie(): void
    {
        $this->assertSame('1067RC', LeverancierGegevens::normaliseerPostcode('1067 rc'));
    }

    public function test_postcode_zonder_spatie_blijft_correct(): void
    {
        $this->assertSame('1045CB', LeverancierGegevens::normaliseerPostcode('1045CB'));
    }
}
