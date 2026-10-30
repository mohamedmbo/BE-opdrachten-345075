<?php

namespace Tests\Feature;

use App\Models\User;
use Illuminate\Support\Facades\DB;
use Tests\Support\MagazijnTestCase;

class MagazijnTest extends MagazijnTestCase
{
    public function test_alle_magazijnroutes_vereisen_inloggen(): void
    {
        foreach (['/magazijn', '/producten/1/leveringen', '/producten/13/allergenen'] as $url) {
            $this->get($url)->assertRedirect('/login');
        }
    }

    public function test_overzicht_toont_alle_producten_op_barcode_met_beide_acties(): void
    {
        $this->actingAs(User::factory()->create());
        $response = $this->get('/magazijn')->assertOk()->assertSee('12 producten');
        $response->assertSeeInOrder(DB::table('Product')->where('IsActief', 1)->orderBy('Barcode')->pluck('Naam')->all());
        $response->assertSee('Allergenen Info')->assertSee('Leverantie Info');
        $response->assertSee(route('producten.leveringen', 1), false);
        $response->assertSee(route('producten.allergenen', 13), false);
    }

    public function test_onbekende_en_ongeldige_productnummers_geven_404(): void
    {
        $this->actingAs(User::factory()->create());
        foreach (['/producten/999/leveringen', '/producten/999/allergenen', '/producten/1 OR 1=1/leveringen', '/producten/-1/allergenen'] as $url) {
            $this->get($url)->assertNotFound();
        }
    }

    public function test_inactief_product_is_niet_zichtbaar(): void
    {
        DB::table('Product')->where('Id', 1)->update(['IsActief' => 0]);
        $this->actingAs(User::factory()->create());
        $this->get('/magazijn')->assertDontSee('Mintnopjes');
        $this->get('/producten/1/leveringen')->assertNotFound();
    }

    public function test_productnamen_worden_veilig_als_tekst_getoond(): void
    {
        DB::table('Product')->where('Id', 1)->update(['Naam' => '<script>alert(1)</script>']);
        $this->actingAs(User::factory()->create());
        $this->get('/magazijn')->assertSee('&lt;script&gt;alert(1)&lt;/script&gt;', false)
            ->assertDontSee('<script>alert(1)</script>', false);
    }
}

