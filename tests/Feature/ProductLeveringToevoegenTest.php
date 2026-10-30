<?php

namespace Tests\Feature;

use App\Models\User;
use Illuminate\Support\Facades\DB;
use Tests\Support\MagazijnTestCase;

class ProductLeveringToevoegenTest extends MagazijnTestCase
{
    public function test_mintnopjes_levering_verhoogt_voorraad_en_slaat_datum_op(): void
    {
        $this->actingAs(User::factory()->create());

        $this->post('/leveranciers/1/producten/1/levering', [
            'aantal' => 25,
            'datum_eerstvolgende_levering' => '2024-05-29',
        ])->assertRedirect('/leveranciers/1/producten');

        $this->assertSame(478, DB::table('Magazijn')->where('ProductId', 1)->value('AantalAanwezig'));
        $this->assertDatabaseHas('ProductPerLeverancier', [
            'LeverancierId' => 1,
            'ProductId' => 1,
            'Aantal' => 25,
            'DatumEerstVolgendeLevering' => '2024-05-29',
        ]);
    }

    public function test_winegums_toont_exacte_melding_en_verandert_database_niet(): void
    {
        $this->actingAs(User::factory()->create());
        $voorraad = DB::table('Magazijn')->where('ProductId', 10)->value('AantalAanwezig');
        $aantalLeveringen = DB::table('ProductPerLeverancier')->count();

        $this->post('/leveranciers/4/producten/10/levering', [
            'aantal' => 30,
            'datum_eerstvolgende_levering' => now()->format('Y-m-d'),
        ])->assertOk()
            ->assertSee('Het product Winegums van de leverancier Basset wordt niet meer geproduceerd')
            ->assertSee('4000', false);

        $this->assertSame($voorraad, DB::table('Magazijn')->where('ProductId', 10)->value('AantalAanwezig'));
        $this->assertSame($aantalLeveringen, DB::table('ProductPerLeverancier')->count());
    }

    public function test_ongeldige_invoer_wordt_geweigerd(): void
    {
        $this->actingAs(User::factory()->create());

        $this->from('/leveranciers/1/producten/1/levering')
            ->post('/leveranciers/1/producten/1/levering', [
                'aantal' => 0,
                'datum_eerstvolgende_levering' => 'geen-datum',
            ])->assertRedirect('/leveranciers/1/producten/1/levering')
            ->assertSessionHasErrors(['aantal', 'datum_eerstvolgende_levering']);
    }
}
