<template>
  <SideBar/>
</template>
<script>
import HelloWorld from './HelloWorld.vue';
import Category from './Category.vue'
import SideBar from './SideBar.vue'
// import Sidebar from './SideBar.vue'
// import Header from './Header.vue'
export default {
  name: 'Index',
  components: { HelloWorld, Category, SideBar },
  mounted: function() {
    console.log(1);
  }
}
</script>
