<?php

namespace Tests\Feature;

use App\Models\User;
use Tests\Support\MagazijnTestCase;

class LeverancierOverzichtTest extends MagazijnTestCase
{
    public function test_leveranciersroutes_vereisen_inloggen(): void
    {
        $this->get('/leveranciers')->assertRedirect('/login');
        $this->get('/leveranciers/1/producten')->assertRedirect('/login');
    }

    public function test_overzicht_volgt_wireframe_en_sorteert_op_aantal_producten(): void
    {
        $this->actingAs(User::factory()->create());

        $this->get('/leveranciers')->assertOk()
            ->assertSee('Overzicht leveranciers')
            ->assertSeeInOrder(['Astra Sweets', 'De Bron', 'Venco'])
            ->assertSee('Aantal verschillende producten')
            ->assertSee('Quality Street')
            ->assertSee('Johan Nooij')
            ->assertSee('L1029234586')
            ->assertSee('06-23458456');
    }

    public function test_producten_van_venco_staan_op_voorraad_aflopend(): void
    {
        $this->actingAs(User::factory()->create());

        $this->get('/leveranciers/1/producten')->assertOk()
            ->assertSee('Geleverde producten')
            ->assertSee('Bert van Linge')
            ->assertSeeInOrder(['Mintnopjes', 'Schoolkrijt', 'Honingdrop'])
            ->assertSee('Nieuwe levering');
    }

    public function test_quality_street_toont_voorgeschreven_melding_en_drie_seconden_redirect(): void
    {
        $this->actingAs(User::factory()->create());

        $this->get('/leveranciers/6/producten')->assertOk()
            ->assertSee('Dit bedrijf heeft tot nu toe geen producten geleverd aan Jamin')
            ->assertSee('3000', false)
            ->assertSee(route('leveranciers.index'), false);
    }
}
