<?php

namespace Tests\Feature;

use App\Models\User;
use Illuminate\Support\Facades\DB;
use Tests\Support\MagazijnTestCase;

class LeveringTest extends MagazijnTestCase
{
    public function test_mintnopjes_toont_leverancier_en_leveringen_op_datum(): void
    {
        $this->actingAs(User::factory()->create());
        $this->get('/producten/1/leveringen')->assertOk()
            ->assertSee('Venco')->assertSee('Bert van Linge')
            ->assertSee('L1029384719')->assertSee('06-28493827')
            ->assertSeeInOrder(['09-11-2024', '23', '16-11-2024', '18-11-2024', '21', '25-11-2024'])
            ->assertDontSee('data-terug-url', false);
    }

    public function test_inactieve_winegums_is_niet_bereikbaar_via_oud_productscherm(): void
    {
        $this->actingAs(User::factory()->create());
        $this->get('/producten/10/leveringen')->assertNotFound();
    }

    public function test_nul_voorraad_en_onbekende_planning_worden_afgehandeld(): void
    {
        DB::table('Magazijn')->where('ProductId', 12)->update(['AantalAanwezig' => 0]);
        $this->actingAs(User::factory()->create());
        $this->get('/producten/12/leveringen')->assertOk()
            ->assertSee('geen voorraad aanwezig')->assertSee('nog niet bekend');
    }

    public function test_voorraad_zonder_leveringshistorie_geeft_een_melding(): void
    {
        DB::table('ProductPerLeverancier')->where('ProductId', 1)->delete();
        $this->actingAs(User::factory()->create());
        $this->get('/producten/1/leveringen')->assertOk()
            ->assertSee('Er zijn nog geen leveringen geregistreerd')
            ->assertDontSee('data-terug-url', false);
    }
}
