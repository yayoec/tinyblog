<template>
  <div class="page-title">
    <ul class="recommened-nav navigation clearfix" data-container="#list-container" data-loader=".loader-tiny" data-user-slug="">
      <li class="active">
        <a data-pjax="true" href="/">HOME</a>
      </li>
      <!-- <li v-for="nav in navs" :key="nav.id" class="bonus">
        <router-link :to="{name: 'navs', params: {name: nav.name}}"
                     :class="{active: hovering == '/navs/' + nav.name}"
                     exact-active-class="active"
                     @mouseover.native="hovering = '/navs/' + nav.name"
                     @mouseout.native="hovering = null"
        >
          <i class="fa fa-bars"></i> {{ nav.name }}
        </router-link>
      </li> -->
      <li class="search">
        <form class="search-form" target="_blank" action="/search" accept-charset="UTF-8" method="get">
          <input name="utf8" type="hidden" value="✓"/>
          <input id="q" type="search" name="q" placeholder="搜索" class="input-medium search-query"/>
          <span class="search_trigger" onclick="$('form.search-form').submit();"><i class="fa fa-search"></i></span>
        </form>
      </li>
    </ul>
  </div>
</template>
<script>
export default {
  name: 'TopNav',
  data() {
    return {
      navs: []
    }
  }
}
</script>
