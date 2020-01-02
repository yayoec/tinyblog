<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Content extends Model
{
    protected $table;

    protected $prefix;

    const CREATED_AT = 'created';

    const UPDATED_AT = 'modified';

    public $timestamps = true;

    protected $primaryKey = 'id';

    protected $casts = [
        'created' => 'date:Y.m.d',
        'modified' => 'date:Y.m.d',
    ];

    public function __construct()
    {
        parent::__construct();
        $this->prefix = config('app.table_prefix');
        $this->table = $this->prefix . "contents";
    }

    public function meta() {
        return $this->belongsTo(
        'App\Models\Metas',
        'meta_id',
        'id'
        );
    }

    public function user(){
        return $this->hasOne(
        'App\Models\Users',
        'id',
        'author_id'
        );
    }
}
