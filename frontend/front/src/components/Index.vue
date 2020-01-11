<template>
  <div>
    <SideBar key="fixed"/>
    <MainRight/>
  </div>
</template>
<script>
import HelloWorld from './HelloWorld.vue';
import MainRight from './MainRight.vue'
import SideBar from './SideBar.vue'
// import Sidebar from './SideBar.vue'
// import Header from './Header.vue'
export default {
  name: 'Index',
  components: { HelloWorld, MainRight, SideBar },
  mounted: function() {
    console.log(1);
  }
}
</script>
