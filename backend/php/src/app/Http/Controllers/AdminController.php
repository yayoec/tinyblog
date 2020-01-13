<?php

namespace App\Http\Controllers;

use App\Models\Metas;
use Illuminate\Http\Request;

class AdminController extends Controller
{
    public function metas() {
        $metas = Metas::all()->where('type', 'category')
            ->sortBy('order', SORT_DESC);
        return [
            'code' => 200,
            'data' => $metas
        ];
    }
}
