<?php

namespace Tests\Feature;

use App\Models\User;
use Illuminate\Support\Facades\DB;
use Tests\Support\MagazijnTestCase;

class LeverancierWijzigenTest extends MagazijnTestCase
{
    public function test_routes_vereisen_inloggen(): void
    {
        $this->get('/manager/leveranciers')->assertRedirect('/login');
        $this->get('/manager/leveranciers/2')->assertRedirect('/login');
        $this->get('/manager/leveranciers/2/wijzigen')->assertRedirect('/login');
    }

    public function test_overzicht_volgt_wireframe_en_toont_maximaal_vier_leveranciers(): void
    {
        $this->actingAs(User::factory()->create());

        $this->get('/manager/leveranciers')->assertOk()
            ->assertSee('Overzicht Leveranciers')
            ->assertSeeInOrder(['Naam', 'Contactpersoon', 'Leveranciernummer', 'Mobiel', 'Leverancier Details'])
            ->assertSee('Venco')
            ->assertSee('Astra Sweets')
            ->assertSee('Haribo')
            ->assertSee('Basset')
            ->assertDontSee('De Bron')
            ->assertSee('Pagina 1 van 2');

        $this->get('/manager/leveranciers?page=2')->assertOk()
            ->assertSee('De Bron')
            ->assertSee('Quality Street')
            ->assertDontSee('Venco');
    }

    public function test_succes_scenario_wijzigt_astra_sweets_en_redirect_na_drie_seconden(): void
    {
        $this->actingAs(User::factory()->create());

        $this->get('/manager/leveranciers/2')->assertOk()
            ->assertSee('Leverancier Details')
            ->assertSee('Den Dolderpad');
        $this->get('/manager/leveranciers/2/wijzigen')->assertOk()
            ->assertSee('Wijzig Leveranciergegevens');

        $response = $this->patch('/manager/leveranciers/2', $this->gegevens([
            'mobiel' => '06-39398825',
            'straatnaam' => 'Den Dolderlaan',
        ]));

        $response->assertOk()
            ->assertSee('De wijzigingen zijn doorgevoerd')
            ->assertSee('3000', false)
            ->assertSee(route('leveranciers.wijzigen.details', 2), false);
        $this->assertDatabaseHas('Leverancier', ['Id' => 2, 'Mobiel' => '06-39398825']);
        $this->assertDatabaseHas('Contact', ['Id' => 2, 'Straatnaam' => 'Den Dolderlaan']);
    }

    public function test_fout_scenario_laat_de_bron_ongewijzigd_en_redirect_na_drie_seconden(): void
    {
        $this->actingAs(User::factory()->create());

        $response = $this->patch('/manager/leveranciers/5', $this->gegevens([
            'naam' => 'De Bron',
            'contactpersoon' => 'Remco Veenstra',
            'leveranciernummer' => 'L1023857736',
            'mobiel' => '06-39398825',
            'straatnaam' => 'Leon van Bonstraat',
            'huisnummer' => '213',
            'postcode' => '145XC',
            'stad' => 'Lunteren',
        ]));

        $response->assertOk()
            ->assertSee('Door een technische storing is het niet mogelijk de wijziging door te voeren. Probeer het op een later moment nog eens')
            ->assertSee('3000', false)
            ->assertSee(route('leveranciers.wijzigen.details', 5), false);
        $this->assertSame('06-34291234', DB::table('Leverancier')->where('Id', 5)->value('Mobiel'));
    }

    private function gegevens(array $overschrijvingen = []): array
    {
        return array_merge([
            'naam' => 'Astra Sweets',
            'contactpersoon' => 'Jasper del Monte',
            'leveranciernummer' => 'L1029284315',
            'mobiel' => '06-39398734',
            'straatnaam' => 'Den Dolderpad',
            'huisnummer' => '2',
            'postcode' => '1067RC',
            'stad' => 'Utrecht',
        ], $overschrijvingen);
    }
}
