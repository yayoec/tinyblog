<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Users extends Model
{
    protected $table;

    protected $primaryKey = 'uid';

    public function __construct()
    {
        parent::__construct();
        $this->table = config('app.table_prefix') . "_users";
    }
}
