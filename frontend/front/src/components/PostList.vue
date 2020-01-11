<template>
  <div>
    <article v-for="article in articles" :key="article.id">
      <h1>
        <router-link :to="{name: 'article', params: {aid: article.id}}">
          {{ article.title }}
        </router-link>
      </h1>
      <div class="meta-top">
        <span class="views-count">阅读{{ article.read_num }}</span>
        <span class="comments-count">评论{{ article.comment_num }}</span>
        <span class="likes-count">有用{{ article.like_num }}</span>
      </div>
      <div class="post-content" itemprop="articleBody">
        <!-- 阅读剩余部分 -->
      </div>
    </article>
  </div>
</template>
<script>
export default {
  name: 'PostList',
  props: {
    'articles': {
      type: Array,
      default: []
    }
  },
  mounted() {
    console.log(this.articles)
  }
}
</script>
