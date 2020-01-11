import Vue from 'vue'
import Vuex from 'vuex'
Vue.use(Vuex)

const state = {
  metas: {},
  articles: {}
}

const store = new Vuex.Store({
  state,
  mutations: {
    setMetas(state, metas) {
      if (typeof metas === 'object') {
        for (var meta of metas) {
          Vue.set(state.metas, meta.id, meta)
        }
      }
    },
    setArticle(state, article) {
      if (!state.articles.hasOwnProperty(article.id)) {
        state.articles[article.id] = article
      }
    }
  },
  getters: {
    getMetas: state => {
      return Object.values(state.metas)
    },
    getMetaById: state => (metaId) => {
      return state.metas[metaId]
    },
    hasMetas: state => {
      return Object.keys(state.metas).length !== 0
    },
    getArticleById: state => (articleId) => {
      if (state.articles.hasProperty(articleId)) {
        return state.articles[articleId]
      }
      return false
    }
  },
  actions: {}
});

export default store
