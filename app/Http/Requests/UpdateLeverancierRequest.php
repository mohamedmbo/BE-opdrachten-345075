<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdateLeverancierRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        return [
            'naam' => ['required', 'string', 'max:100'],
            'contactpersoon' => ['required', 'string', 'max:100'],
            'leveranciernummer' => ['required', 'string', 'max:20'],
            'mobiel' => ['required', 'regex:/^06-[0-9]{8}$/'],
            'straatnaam' => ['required', 'string', 'max:100'],
            'huisnummer' => ['required', 'string', 'max:10'],
            'postcode' => ['required', 'regex:/^[0-9]{3,4}\s?[A-Za-z]{2}$/'],
            'stad' => ['required', 'string', 'max:100'],
        ];
    }
}
