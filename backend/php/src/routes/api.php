<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    $user =  $request->user();
    $table_name = config('app.table_prefix') . "options";
    $result = DB::table($table_name)
        ->whereIn('name', ['github', 'weibo', 'avatar', 'nickname', 'slogan'])->get();
    $res = [];
    collect($result)->map(function ($val) use (& $res) {
        $res[$val->name] = $val->value;
    });
    $user['roles'] = ['admin'];
    $user['name'] = $user['username'];
    if (isset($res['avatar'])) {
        $user['avatar'] = $res['avatar'];
    } else {
        $user['avatar'] = 'http://tva3.sinaimg.cn/crop.0.0.180.180.180/5eeebb12jw1e8qgp5bmzyj2050050aa8.jpg';
    }
    $user['introduction'] = 'screen_name';
    return ['data' => $user, 'code' => 200];
});

Route::middleware('auth:api')->group(function() {
    Route::get('admin/metas', 'AdminController@metas');
    Route::post('admin/article', 'AdminController@article');
    Route::get('admin/article/list', 'AdminController@articleList');
    Route::get('admin/article/{id}', 'AdminController@getArticle');
    Route::post('admin/upload', 'AdminController@upload');
    Route::post('admin/meta', 'AdminController@meta');
    Route::get('admin/meta/{id}', 'AdminController@getMeta');
    Route::get('admin/user/settings', 'AdminController@fetchUserSettings');
    Route::post('admin/user/settings', 'AdminController@postUserSettings');
    Route::get('admin/site/settings', 'AdminController@fetchSiteSettings');
    Route::post('admin/site/settings', 'AdminController@postSiteSettings');
});

Route::get('/infos', 'InfosController@infos');
Route::get('/article', 'ArticleController@index');
Route::get('/articles', 'ArticleController@articleList');
Route::get('/article/{articleId}', 'ArticleController@article');
Route::get('/metas', 'CategoryController@metas');
Route::get('/meta/{metaId}', 'CategoryController@metaInfo');
Route::get('/meta/articles/{metaId}', 'CategoryController@getMetaArticles');
Route::get('/archive/dates', 'CategoryController@archiveList');
Route::get('/archive/{year}/{month}', 'ArchiveController@articleList');