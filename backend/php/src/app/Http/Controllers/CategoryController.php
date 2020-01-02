<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Metas;
use Illuminate\Support\Collection;

class CategoryController extends Controller
{
    public function metas() {
        return Metas::all()->where('type', 'category')
            ->sortBy('order', SORT_DESC);
    }

    public function metaInfo($metaId) {
        return Metas::find($metaId);
    }

    public function getMetaArticles($metaId) {
        $allContents = Metas::find($metaId)->contents;
        collect($allContents)->map(function($content) {
            $hasImgs = preg_match('/http(.*?)\.(jpg|png|gif)/', $content['text'], $matches);
            if($hasImgs){
                $content['img'] = $matches[0];
            } else {
                $content['img'] = '';
            }
            preg_match_all('/<p>.*?<\/p>/', $content['text'], $textMatches);
            if (!empty($textMatches[0])){
                if (count($textMatches[0]) > 2){
                    $content['text'] = $textMatches[0][0].'......';
                }
            }
        });
        return $allContents;
    }
}
