<?php

namespace App\Http\Controllers;

use App\Http\Resources\Article as ArticleResource;
use App\Models\Content;
use App\Models\Metas;
use Illuminate\Http\Request;
use Illuminate\Http\File;
use Illuminate\Support\Facades\Storage;

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

    public function meta(Request $request) {
        $meta = $request->post();
        if (isset($meta['id']) && !empty($meta['id'])) {
            $post = Metas::find($meta['id']);
        } else {
            $post = new Metas();
        }
        $post->name = $meta['name'];
        $post->type = $meta['type'];
        $post->description = $meta['description'];
        $post->order = $meta['order'];
        $post->parent = $meta['parent'];
        $new = $post->save($meta);
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

    public function upload(Request $request) {
        $file = $request->file('file');

        if (in_array(strtolower($file->getClientOriginalExtension()), ['gif', 'jpeg', 'jpg', 'png', 'bmp'])) {
            $key = 'images/' . md5_file(($file->getRealPath()));
        } else {
            $key = 'files/' . md5_file(($file->getRealPath()));
        }

        if (!Storage::disk('s3')->exists($key)) {
            Storage::disk('s3')->put(
                $key,
                file_get_contents($file->getRealPath())
            );
        }
        $download_url = config('app.minio_url') . config('filesystems.disks')['s3']['bucket'] . '/' .$key;
        return [
            'code' => 200,
            'data' => $download_url
        ];
    }

    public function getMeta($meta_id) {
        return [
            'code' => 200,
            'data' => Metas::find($meta_id)
        ];
    }
}
