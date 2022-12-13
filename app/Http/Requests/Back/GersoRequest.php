<?php

namespace App\Http\Requests\Back;

use Illuminate\Foundation\Http\FormRequest;
use App\Rules\Slug;

class GersoRequest extends FormRequest
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
            'title' => 'required|max:255',
            'slug' => 'required', 'max:255',
            'info' => 'required|max:2000',
        ];
    }
}
