<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Users extends Model
{
    protected $table;

    protected $primaryKey = 'id';

    public function __construct()
    {
        parent::__construct();
        $this->table = config('app.table_prefix') . "_users";
    }

    public function contents() {
        return $this->belongsTo('App\Models\Content', 'author_id');
    }
}
