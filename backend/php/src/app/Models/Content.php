<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Content extends Model
{
    protected $table;

    const CREATED_AT = 'created';

    const UPDATED_AT = 'modified';

    public $timestamps = true;

    public function __construct()
    {
        parent::__construct();
        $this->table = config('app.table_prefix') . "_content";
    }
}
