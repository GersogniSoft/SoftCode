<?php

namespace App\Http\Requests\Back;

use Illuminate\Foundation\Http\FormRequest;

class SoftCodeRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, mixed>
     */
    public function rules()
    {
        return $rules = [
            'name' => 'required|max:50',
            'address' => 'required|max:255',
            'email' => 'required|max:50',
            'homeinfos' => 'required|max:1000',
            'homeinfossub' => 'required|max:1000',
        ];
    }
}
