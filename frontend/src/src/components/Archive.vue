<template v-if="articleRes">
  <div id="article-container">
    <div id="main" class="post" role="main">
      <h3 v-if="articleRes.data.type == 'category'" class="archive-title">
        专题 <span>%s</span> 下的文章
      </h3>
      <h3 v-else-if="articleRes.data.type == 'search'" class="archive-title">
        包含关键字 <span>{{ articleRes.data.name }}</span> 的文章
      </h3>
      <h3 v-else-if="articleRes.data.type == 'tag'" class="archive-title">
        标签 <span>{{ articleRes.data.name }}</span> 下的文章
      </h3>
      <article v-for="article in articleRes.data.articles" :key="article.id">
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
      <article class="post">
        <h2 class="post-title">没有找到内容</h2>
      </article>
      <!-- page -->
    </div>
    <!-- end #main -->
  </div>
</template>

<script>
import { getArticle } from '../services/Article'
export default {
  name: 'Archive',
  props: {},
  data() {
    return {
      articleRes: getArticle().then((result) => {
        return result.data
      }).catch((err) => {
        console.log(err)
      })
    }
  },
  mounted() {

  },
  methods() {

  }
}
</script>
