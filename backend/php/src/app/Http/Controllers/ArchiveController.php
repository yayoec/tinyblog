<?php

namespace App\Http\Controllers;

use App\Http\Resources\Article as ArticleResource;
use App\Models\Content;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ArchiveController extends Controller
{
    public function articleList($year, $month) {
//        $dates = Content::all()
//                ->where('date_format(FROM_UNIXTIME(created), "%Y/%m"))', '=', $year .'/' . $month)
//                ->sortByDesc('created')
//                ->take(10);
        $table = config('app.table_prefix') . 'contents';
        $dates = DB::table($table)
            ->where('type', '=', 'post')
            ->where('status', '=', 'published')
            ->where(DB::raw('date_format(created, "%Y/%m")'), '=', $year .'/' . $month)
            ->orderBy('created', 'desc')
            ->get();
        return $dates;
    }
}
