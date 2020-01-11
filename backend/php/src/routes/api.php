<?php

use Illuminate\Http\Request;

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
    $user['roles'] = ['admin'];
    $user['name'] = $user['username'];
    $user['avatar'] = 'http://tva3.sinaimg.cn/crop.0.0.180.180.180/5eeebb12jw1e8qgp5bmzyj2050050aa8.jpg';
    $user['introduction'] = 'screen_name';
    return ['data' => $user, 'code' => 200];
});

Route::get('/article', 'ArticleController@index');
Route::get('/articles', 'ArticleController@articleList');
Route::get('/article/{articleId}', 'ArticleController@article');
Route::get('/metas', 'CategoryController@metas');
Route::get('/meta/{metaId}', 'CategoryController@metaInfo');
Route::get('/meta/articles/{metaId}', 'CategoryController@getMetaArticles');
Route::get('/archive/dates', 'CategoryController@archiveList');
Route::get('/archive/{year}/{month}', 'ArchiveController@articleList');