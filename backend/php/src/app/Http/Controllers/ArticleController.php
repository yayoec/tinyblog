<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Content;
use App\Models\Metas;
use App\Http\Resources\Article as ArticleResource;

class ArticleController extends Controller
{
    public function index() {
        return Metas::find(1)->contents;
    }

    public function article($articleId) {
        return new ArticleResource(Content::find($articleId));
    }

    public function articleList() {
        return ArticleResource::collection(Content::all()->sortByDesc('created')
            ->take(10));
    }

}
