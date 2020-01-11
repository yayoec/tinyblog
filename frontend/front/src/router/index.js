import Vue from 'vue'
import VueRouter from 'vue-router'
import Index from '@/components/Index.vue'
import Category from '@/components/Category.vue'
import Archive from '@/components/Archive.vue'
import Search from '@/components/Search.vue'
// import SideBar from '@/components/SideBar.vue'
// import Page from '@/components/Page.vue'
// import Helloworld from '@/components/Helloworld.vue'
import Post from '@/components/Post.vue'
import NotFound from '@/components/NotFound.vue'

Vue.use(VueRouter)

const router = new VueRouter({
  mode: 'history',
  routes: [
    { path: '/', name: 'index', component: Index },
    { path: '/category/:mid', name: 'category', component: Category },
    { path: '/tags/:name', name: 'tags', component: Category },
    { path: '/archive/:year/:month', name: 'archive', component: Archive },
    { path: '/search', name: 'search', component: Search },
    { path: '/article/:aid', name: 'article', component: Post },
    { path: '*', name: '404', component: NotFound }
  ]
})
export { router }
// export { Page, Helloworld, Post }
