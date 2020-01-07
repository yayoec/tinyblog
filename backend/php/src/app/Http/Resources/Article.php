<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class Article extends JsonResource
{
    /**
     * Transform the resource collection into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        $hasImgs = preg_match('/http(.*?)\.(jpg|png|gif)/', $this->text, $matches);
        if($hasImgs){
            $img = $matches[0];
        } else {
            $img = '';
        }
        $text = $this->text;
        preg_match_all('/<p>.*?<\/p>/', $this->text, $textMatches);
        if (!empty($textMatches[0])){
            if (count($textMatches[0]) > 2){
                $text = $textMatches[0][0].'......';
            }
        }
        return [
            'id' => $this->id,
            'title' => $this->title,
            'meta_id' => $this->meta_id,
            'created' => $this->created,
            'modified' => $this->modified,
            'text' => $text,
            'img' => $img,
            'order' => $this->order,
            'comments_num' => $this->comments_num,
            'read_num' => $this->read_num,
            'like_num' => $this->like_num,
            'support_num' => $this->support_num,
            'allow_comment' => $this->allow_comment,
            'allow_ping' => $this->allow_ping,
            'allow_feed' => $this->allow_feed,
            'parent' => $this->parent
        ];
    }
}
