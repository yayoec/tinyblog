<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ArticleController extends Controller
{
    public function index() {
        return json_encode([1,2,23]);
    }

    public function article($articleId) {

    }

}
