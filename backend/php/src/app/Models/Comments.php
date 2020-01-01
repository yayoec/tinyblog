<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Comments extends Model
{
    protected $table;

    public function __construct()
    {
        parent::__construct();
        $this->table = config('app.table_prefix') . "_comments";
    }
}
