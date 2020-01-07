<template>
  <div id="list-container">
    <ul
      id="tags-nav"
      class="sort-nav"
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
      <li v-for="article in articles" :key="article.id" :class="{'have-img': article.img != ''}">
        <a
          v-if="article.img"
          class="wrap-img"
          href="javascript:void(0);"
        >
          <img :src="article.img" alt="300" />
        </a>
        <div>
          <p class="list-top">
            <router-link :to="{name: 'category', params: {mid: article.meta_id}}">
              {{ article.meta_name }}
            </router-link>
            <em>·</em>
            <span
              class="time"
            >{{ article.created }}</span>
          </p>
          <h4 class="title">
            <router-link :to="{name: 'article', params: {aid: article.id}}"
                         :class="{active: hovering == '/article/' + article.id}"
                         exact-active-class="active"
                         @mouseover.native="hovering = '/article/' + article.id"
                         @mouseout.native="hovering = null"
            >
              {{ article.title }}
            </router-link>
          </h4>
          <div
            class="post-content"
            itemprop="articleBody"
          >
            {{ article.text }}
          </div>
          <div class="list-footer">
            <span>
              阅读 {{ article.read_num }}
            </span>
            <span> ·
            评论 {{ article.comments_num }}
            </span>
            <span> · 有用 {{ article.like_num }}</span>

          </div>

        </div>
      </li>
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
  components: { Page },
  data() {
    return {
      tags: [],
      articles: [],
      hovering: null
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
