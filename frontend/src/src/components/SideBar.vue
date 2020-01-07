<template>
  <div id="sidebar">
    <div class="navbar navbar-jianshu expanded">
      <div class="dropdown">
        <a
          :class="[{ active: navIndex == 1 }, 'nav-userinfo']"
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
                src="http://tva3.sinaimg.cn/crop.0.0.180.180.180/5eeebb12jw1e8qgp5bmzyj2050050aa8.jpg"
                class="js-avatar"
              />

            </a>

            <h1 class="header-author">
              <a href="/">沙鱼</a>

            </h1>
            <div id="wb_button">
              <wb:follow-button
                uid="1592703762"
                type="gray_2"
                width="136"
                height="24"
              ></wb:follow-button>
            </div>

            <p class="header-subtitle">undefined</p>

            <nav class="header-nav">
              <div class="social">

                <a
                  class="github"
                  target="_blank"
                  href="https://github.com/yayoec"
                  title="github"
                >

                  <i class="fa fa-github"></i>

                </a>

                <a
                  class="weibo"
                  target="_blank"
                  href="http://weibo.com/1592703762"
                  title="weibo"
                >
                  <i class="fa fa-weibo"></i>
                </a>

                <a
                  class="rss"
                  target="_blank"
                  href="<?php $this->options->feedUrl(); ?>"
                  title="rss"
                >
                  <i class="fa fa-rss"></i>
                </a>

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
import { metas, archives } from '../services/Apis'
export default {
  name: 'SideBar',
  data() {
    return {
      categorys: null,
      archives: [],
      navIndex: 1,
      currentRoute: null,
      hovering: null
    }
  },
  mounted() {
    metas().then((result) => {
      this.categorys = result.data
    }).catch((err) => {
      console.log(err)
    })
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
  },
  methods: {
    activation: function(navIndex, event) {
      this.navIndex = navIndex;
      if (navIndex === 4) {
        alert('相册功能暂未开放');
      }
    }
  }
}
</script>
