<template>
  <div id="list-container">

    <ul
      class="sort-nav"
      id="tags-nav"
      data-js-module="collection-tags"
      data-fetch-url=""
    >
      <li
        v-for="tag in tags"
        :key="tag.id"
        class="bonus"
      >
        <router-link
          :to="{name: 'tags', params: {name: tag.name}}"
          :class="{active: hovering == '/tags/' + tag.name}"
          exact-active-class="active"
          @mouseover.native="hovering = '/tags/' + tag.name"
          @mouseout.native="hovering = null"
        >
          {{ tag.name }}
        </router-link>
      </li>
      <!-- todo tag function 暂时注释掉标签功能
          <?php while($this->next()): ?>
            <li><?php $this->tags()?>
          <?php endwhile;?>  
        -->
    </ul>

    <ul class="article-list thumbnails clearfix">
      <?php while($this->next()):?>
      <li class="<?php if($this->contentImg()):?>have-img<?php endif;?>">
        <?php if($this->contentImg()):?>
        <a
          class="wrap-img"
          href="javascript:void(0);"
        ><img
            src="<?php echo $this->contentImg()?>"
            alt="300"
          ></a>
        <?php endif;?>
        <div>

          <p class="list-top">
            <?php $this->category();?>
            <em>·</em>
            <span
              class="time"
              data-shared-at="<?php $this->date('c'); ?>"
            ><?php $this->date('m.d.Y')?></span>
          </p>
          <h4 class="title"><a
              target="_blank"
              href="<?php $this->permalink() ?>"
            ><?php $this->title() ?></a></h4>
          <div
            class="post-content"
            itemprop="articleBody"
          >
            <?php $this->trimImgContents('- 阅读剩余部分 -'); ?>
          </div>
          <div class="list-footer">
            <span>
              <?php $this->readNum('阅读 0', '阅读 1', '阅读 %d'); ?>
            </span>
            <span> ·
              <?php $this->commentsNum('评论 0', '评论 1', '评论 %d'); ?>

            </span>
            <span> · <?php $this->likeNum('喜欢 0', '喜欢 1', '喜欢 %d'); ?></span>

          </div>

        </div>
      </li>
      <?php endwhile;?>

    </ul>

    <!-- 
      <div class="load-more"><button class="ladda-button " data-style="slide-left" data-type="script" data-remote="" data-size="medium" data-url="/top/daily?note_ids%5B%5D=6227346&amp;note_ids%5B%5D=6289172&amp;note_ids%5B%5D=6300432&amp;note_ids%5B%5D=6295059&amp;note_ids%5B%5D=6296966&amp;note_ids%5B%5D=6296805&amp;note_ids%5B%5D=6296170&amp;note_ids%5B%5D=6290414&amp;note_ids%5B%5D=6295531&amp;note_ids%5B%5D=5948743&amp;note_ids%5B%5D=6300458&amp;note_ids%5B%5D=6193462&amp;note_ids%5B%5D=6070807&amp;note_ids%5B%5D=6237712&amp;note_ids%5B%5D=6267848&amp;note_ids%5B%5D=6283858&amp;note_ids%5B%5D=6296299&amp;note_ids%5B%5D=6276428&amp;note_ids%5B%5D=6281166&amp;note_ids%5B%5D=6303314&amp;page=2" data-color="maleskine" data-method="get">
      <span class="ladda-label">点击查看更多</span>
      <span class="ladda-spinner"></span></button></div>
       -->
    <Page/>
  </div>
</template>
<script>
import Page from './Page.vue'
import { articles } from '../services/Apis'
export default {
  name: 'ListContainer',
  data() {
    return {
      tags: [],
      articles: []
    }
  },
  mounted() {
    articles().then((result) => {
      this.articles = result.data
    }).catch((err) => {
      console.log(err)
    })
  }
}
</script>
