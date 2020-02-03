<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Metas;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\DB;

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

    public function archiveList() {
        $table = config('app.table_prefix') . 'contents';
        $dates = DB::table($table)->select(DB::raw('date_format(created, "%Y/%m") as archive_date'))
            ->where('type', '=', 'post')
            ->where('status', '=', 'published')
            ->where('created', '<', date('Y-m-d H:i:s'))
            ->orderBy('created', 'desc')
            ->get();
        $res = [];
        collect($dates)->map(function ($date) use ( & $res) {
            if(!in_array($date->archive_date, $res)) {
                array_push($res, $date->archive_date);
            }
        });
        return $res;
    }
}
