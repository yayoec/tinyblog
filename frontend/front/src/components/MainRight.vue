<template>
  <div id="right-container">
    <TopNav/>
    <ListContainer/>
  </div>
</template>
<script>
import TopNav from './TopNav.vue'
import ListContainer from './ListContainer.vue'
export default {
  name: 'MainRight',
  components: { TopNav, ListContainer }
}
</script>
