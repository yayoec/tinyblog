<?php

namespace App\Http\Controllers;

use App\Http\Resources\Article as ArticleResource;
use App\Models\Content;
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

    public function article(Request $request) {
        $content = $request->post();
        if (isset($content['id']) && !empty($content['id'])) {
            $post = Content::find($content['id']);
        } else {
            $post = new Content();
        }
        $post->author_id = 1;
        $post->title = $content['title'];
        $post->status = $content['status'];
        $post->content = $content['content'];
        $post->summary = $content['summary'];
        $post->image_uri = $content['image_uri'];
        $post->display_time = date("Y-m-d H:i:s", strtotime($content['display_time']));
        $post->meta_id = $content['meta_id'];
        $post->allow_comment = $content['allow_comment'];
        $post->order = $content['order'];
        $new = $post->save($content);
        return [
            'code' => 200,
            'data' => $new
        ];
    }

    public function articleList() {
        $articles = [];
        Content::all()->sortByDesc('created')->map(function($row) use (&$articles){
            array_push($articles, $row);
        });
        $count = Content::all()->where('parent', '=', 0)->count();
        return [
            'code' => 200,
            'items' => $articles,
            'total' => $count
        ];
    }

    public function getArticle($article_id) {
        return [
            'code' => 200,
            'data' => Content::find($article_id)
        ];
    }
}
