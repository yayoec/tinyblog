<template>
  <div>
    <article v-for="article in articlesData" :key="article.id">
      <h1><a :href="article.permalLink" itemtype="url"> {{ article.title }} </a></h1>
      <div class="meta-top">
        <span class="views-count">阅读{{ article.readNum }}</span>
        <span class="comments-count">评论{{ article.commentNum }}</span>
        <span class="likes-count">喜欢{{ article.likeNum }}</span>
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
  data() {
    return {
      articlesData: this.articles
    }
  }
}
</script>
