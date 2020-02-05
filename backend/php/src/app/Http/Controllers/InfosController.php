<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;

class InfosController extends Controller
{
    protected $table_name;
    public function __construct()
    {
        $this->table_name = config('app.table_prefix') . "options";
    }

    public function infos() {
        $table_name = $this->table_name;
        $result = DB::table($table_name)
            ->whereIn('name', ['github', 'weibo', 'avatar', 'nickname', 'slogan'])->get();
        $res = [];
        collect($result)->map(function ($val) use (& $res) {
            $res[$val->name] = $val->value;
        });
        return $res;
    }
}
