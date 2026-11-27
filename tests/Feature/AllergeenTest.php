<?php

namespace Tests\Feature;

use App\Models\User;
use Illuminate\Support\Facades\DB;
use Tests\Support\MagazijnTestCase;

class AllergeenTest extends MagazijnTestCase
{
    public function test_lactose_selectie_toont_alleen_producten_met_lactose_en_maximaal_vier_per_pagina(): void
    {
        $this->actingAs(User::factory()->create());

        $this->get('/allergenen?allergeen=4')->assertOk()
            ->assertSee('Kruis Drop')
            ->assertSee('Zoute Ruitjes')
            ->assertDontSee('Mintnopjes')
            ->assertSee('Maak selectie');

        $this->get('/allergenen')->assertOk()->assertSee('Pagina 1 van 2');
    }

    public function test_drop_ninjas_toon_supplier_gegevens_en_ontbrekend_adres(): void
    {
        $this->actingAs(User::factory()->create());

        $this->get('/allergenen/product/14/leverancier')->assertOk()
            ->assertSee('Drop Ninja’s')
            ->assertSee('Hom Ken Food')
            ->assertSee('Hom Ken')
            ->assertSee('06-23458477')
            ->assertSee('Er is zijn geen adresgegevens bekend');
    }

    public function test_kruis_drop_link_opent_de_leverancier(): void
    {
        $this->actingAs(User::factory()->create());

        $this->get('/allergenen/product/12/leverancier')->assertOk()
            ->assertSee('De Bron')
            ->assertSee('Remco Veenstra')
            ->assertSee('Lunteren');
    }

    public function test_onbekende_selecties_en_niet_ingelogde_bezoekers_krijgen_geen_data(): void
    {
        $this->get('/allergenen')->assertRedirect('/login');
        $this->actingAs(User::factory()->create());
        $this->get('/allergenen?allergeen=999')->assertNotFound();
        $this->get('/allergenen/product/999/leverancier')->assertNotFound();
    }

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
