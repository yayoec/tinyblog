<template>
  <div>
    <SideBar key="fixed"/>
    <div id="article-container">
      <div id="main" class="post" role="main">
        <h3 class="archive-title">
          {{ year }}年{{ month }}
        </h3>
        <PostList :articles="allArchiveArticles" />
      </div>
    <!-- end #main -->
    </div>
  </div>
</template>
<script>
import SideBar from './SideBar.vue'
import { archiveArticles } from '../services/Apis'
import PostList from './PostList.vue'
export default {
  name: 'Archive',
  components: { PostList, SideBar },
  data() {
    return {
      year: this.$route.params.year,
      month: this.$route.params.month,
      allArchiveArticles: []
    }
  },
  watch: {
    $route: function () {
      archiveArticles(this.$route.params.year, this.$route.params.month).then((res) => {
        this.allArchiveArticles = res.data
      })
    }
  },
  mounted() {
    archiveArticles(this.$route.params.year, this.$route.params.month).then((res) => {
      this.allArchiveArticles = res.data
    })
  },
  methods: {}
}
</script>
