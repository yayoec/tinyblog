<template>
  <div>
    <SideBar/>
    <div id="article-container">
      <div id="main" class="post" role="main">
        <h3 class="archive-title">
          专题 <span>{{ metaName }}</span> 下的文章
        </h3>
        <PostList :articles="categoryArticles" />
      </div>
    <!-- end #main -->
    </div>
  </div>
</template>
<script>
import SideBar from './SideBar.vue'
import PostList from './PostList.vue'
import { metaArticles } from '../services/Apis'
import { mapGetters } from 'vuex'
import _ from 'lodash'
export default {
  name: 'Category',
  components: { SideBar, PostList },
  data() {
    return {
      'categoryArticles': []
    }
  },
  computed: {
    ...mapGetters(['getMetaById', 'hasMetas']),
    metaName() {
      var meta = this.$store.getters.getMetaById(this.$route.params.mid)
      return _.propertyOf(meta)('name')
    }
  },
  mounted() {
    metaArticles(this.$route.params.mid).then((res) => {
      this.categoryArticles = res.data
    });
    // this.metaName = this.$store.getters.getMetaById(this.$route.params.mid).name
  }

}
</script>
