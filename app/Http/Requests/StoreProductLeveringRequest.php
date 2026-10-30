<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreProductLeveringRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        return [
            'aantal' => ['required', 'integer', 'min:1', 'max:100000'],
            'datum_eerstvolgende_levering' => ['required', 'date_format:Y-m-d'],
        ];
    }

    public function messages(): array
    {
        return [
            'aantal.required' => 'Vul het aantal producteenheden in.',
            'aantal.integer' => 'Het aantal moet een heel getal zijn.',
            'aantal.min' => 'Het aantal moet minimaal 1 zijn.',
            'datum_eerstvolgende_levering.required' => 'Kies de datum van de eerstvolgende levering.',
            'datum_eerstvolgende_levering.date_format' => 'Vul een geldige datum in.',
        ];
    }
}
