<template>
  <div id="sidebar">
    <div class="navbar navbar-tinyblog expanded">
      <div class="dropdown">
        <!-- <router-link :to="{name: 'index'}"
                     :class="[{ active: navIndex == 1 }, 'nav-userinfo']"
                     title="J's Blog"
                     @click="activation(1, $event)"
        >
          <i class="fa fa-home"></i><span class="title">首页</span>
        </router-link> -->
        <a :class="[{ active: navIndex == 1 }, 'nav-userinfo']"
           title="J's Blog"
           @click="activation(1, $event)"
        >
          <i class="fa fa-home"></i><span class="title">首页</span>
        </a>
        <a
          :class="[{ active: navIndex == 2 }, 'nav-topic']"
          title="专题"
          @click="activation(2, $event)"
        >
          <i class="fa fa-th"></i><span class="title">专题</span>
        </a>
        <a
          :class="[{ active: navIndex == 3 }, 'nav-archive']"
          title="归档"
          @click="activation(3, $event)"
        >
          <i class="fa fa-folder"></i><span class="title">归档</span>
        </a>
        <a
          :class="[{ active: navIndex == 4 }, 'nav-gallary']"
          title="摄影"
          @click="activation(4, $event)"
        >
          <i class="fa fa-camera"></i><span class="title">相册</span>
        </a>
      </div>
      <div class="nav-user">
        <!--
        <a class="signin" data-signin-link="true" data-toggle="modal" data-placement="right" data-original-title="登录" data-container="div.expanded" href="/sign_in">
          <i class="fa fa-user"></i><span class="title">登录</span>
        </a>
        -->
      </div>
    </div>
    <!-- end .navbar -->

    <!-- begin navdetail 相册 个人介绍 归档 专题 js动态切换 -->
    <div class="navdetail">
      <div id="userinfo" :style="{left: navIndex == 1 ? '' : '-27%'}">
        <div class="overlay"></div>
        <div class="intrude-less">
          <header
            id="header"
            class="inner"
          >
            <a
              href="/"
              class="profilepic"
            >

              <img
                :src="avatar"
                class="js-avatar"
              />

            </a>

            <h1 class="header-author">
              <a :href="weibo">{{ nickname }}</a>

            </h1>

            <p class="header-subtitle">{{ slogan }}</p>

            <nav class="header-nav">
              <div class="social">

                <a
                  :href="github"
                  class="github"
                  target="_blank"
                  title="github"
                >

                  <i class="fa fa-github"></i>

                </a>

                <a
                  :href="weibo"
                  class="weibo"
                  target="_blank"
                  title="weibo"
                >
                  <i class="fa fa-weibo"></i>
                </a>

                <!-- <a
                  class="rss"
                  target="_blank"
                  href="<?php $this->options->feedUrl(); ?>"
                  title="rss"
                >
                  <i class="fa fa-rss"></i>
                </a> -->

              </div>
            </nav>
          </header>
        </div>
      </div>

      <div id="topic" :style="{left: navIndex == 2 ? '' : '-27%'}">
        <ul class="mcd-menu">
          <li
            v-for="category in categorys"
            :key="category.id"
          >
            <!-- <a href="123"> -->
            <router-link :to="{name: 'category', params: {mid: category.id}}"
                         :class="{active: hovering == '/category/' + category.id}"
                         exact-active-class="active"
                         @mouseover.native="hovering = '/category/' + category.id"
                         @mouseout.native="hovering = null"
            >
              <i class="fa fa-list"></i>
              <strong>{{ category.name }}</strong>
              <small>{{ category.description }}</small>
            </router-link>
            <!-- </a> -->
          </li>
        </ul>

      </div>
      <div id="archive" :style="{left: navIndex == 3 ? '' : '-27%'}">
        <h3 class="widget-title">归档</h3>
        <ul class="mcd-menu">
          <li v-for="(archive, index) in archives" :key="index">
            <router-link :to="{name: 'archive', params: {year: archive.substring(0, 4), month: archive.substring(5)}}"
                         :class="{active: hovering == archive}"
                         exact-active-class="active"
                         @mouseover.native="hovering = archive"
                         @mouseout.native="hovering = null"
            >
              <strong>{{ archive }}</strong>
            </router-link>
          </li>
        </ul>
      </div>
      <div id="gallary" :style="{left: navIndex == 4 ? '' : '-27%'}">
      </div>
    </div>

  </div>
</template>
<script>
import { metas, archives, infos } from '../services/Apis'
import { mapMutations, mapGetters } from 'vuex'
export default {
  name: 'SideBar',
  data() {
    return {
      categorys: null,
      archives: [],
      navIndex: 0,
      currentRoute: null,
      hovering: null,
      avatar: '',
      nickname: '',
      slogan: '',
      weibo: '',
      github: ''
    }
  },
  computed: {
    ...mapGetters(['hasMetas', 'getMetas'])
  },
  mounted() {
    if (!this.$store.getters.hasMetas) {
      metas().then(result => {
        this.$store.commit('setMetas', result.data)
        this.categorys = result.data
      }).catch((err) => {
        console.log(err)
      })
    } else {
      this.categorys = this.$store.getters.getMetas
    }
    archives().then((result) => {
      this.archives = result.data
      // result.data.forEach(element => {
      //   this.archives.push({
      //     'date': element,
      //     'year': element.substring(0, 4),
      //     'month': element.substring(5)
      //   })
      // });
    })
    infos().then(result => {
      console.log(result.data)
      this.avatar = result.data.avatar
      this.nickname = result.data.nickname
      this.slogan = result.data.slogan
      this.github = result.data.github
      this.weibo = result.data.weibo
    })
    if (this.$route.path === '/') {
      this.navIndex = 1
    } else if (this.$route.path.startsWith('/category')) {
      this.navIndex = 2
    } else if (this.$route.path.startsWith('/archive')) {
      this.navIndex = 3
    }
    this.currentRoute = this.$route.path
  },
  methods: {
    ...mapMutations({
      setMetas: 'setMetas'
    }),
    activation: function(navIndex, event) {
      this.navIndex = navIndex;
      if (navIndex === 4) {
        alert('相册功能暂未开放');
      }
    }
  }
}
</script>
