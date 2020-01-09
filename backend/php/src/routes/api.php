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
    return $request->user();
});

Route::get('/article', 'ArticleController@index');
Route::get('/articles', 'ArticleController@articleList');
Route::get('/article/{articleId}', 'ArticleController@article');
Route::get('/metas', 'CategoryController@metas');
Route::get('/meta/{metaId}', 'CategoryController@metaInfo');
Route::get('/meta/articles/{metaId}', 'CategoryController@getMetaArticles');
Route::get('/archive/dates', 'CategoryController@archiveList');
Route::get('/archive/{year}/{month}', 'ArchiveController@articleList');