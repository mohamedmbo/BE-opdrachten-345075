<?php

namespace Tests\Feature;

use App\Models\User;
use Illuminate\Support\Facades\DB;
use Tests\Support\MagazijnTestCase;

class AllergeenTest extends MagazijnTestCase
{
    public function test_zoute_ruitjes_toont_alle_allergenen_alfabetisch(): void
    {
        $this->actingAs(User::factory()->create());
        $this->get('/producten/13/allergenen')->assertOk()
            ->assertSee('Zoute Ruitjes')->assertSee('8719587323256')
            ->assertSeeInOrder(['Gluten', 'Dit product bevat gluten', 'Lactose', 'Dit product bevat lactose', 'Soja', 'Dit product bevat soja'])
            ->assertDontSee('data-terug-url', false);
    }

    public function test_cola_flesjes_toont_melding_en_vier_seconden_terugkeer(): void
    {
        $this->actingAs(User::factory()->create());
        $this->get('/producten/5/allergenen')->assertOk()
            ->assertSee('In dit product zitten geen stoffen die een allergische reactie kunnen veroorzaken')
            ->assertSee('seconden: 4', false)->assertSee('data-terug-url', false);
    }

    public function test_inactieve_koppelingen_worden_niet_getoond(): void
    {
        DB::table('ProductPerAllergeen')->where('ProductId', 13)->where('AllergeenId', 1)->update(['IsActief' => 0]);
        $this->actingAs(User::factory()->create());
        $this->get('/producten/13/allergenen')->assertOk()->assertDontSee('Gluten')->assertSee('Lactose');
    }
}
