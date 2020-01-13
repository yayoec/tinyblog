<template>
  <el-dropdown :show-timeout="100" trigger="click">
    <el-button plain>
      {{ choosen_category }}
      <i class="el-icon-caret-bottom el-icon--right"></i>
    </el-button>
    <el-dropdown-menu slot="dropdown" class="no-padding">
      <el-dropdown-item>
        <el-radio-group v-model="choosen_category" style="padding: 10px;">
          <el-radio v-for="item in categorys" :key="item.id" :label="item.name">
            {{ item.name }}
          </el-radio>
        </el-radio-group>
      </el-dropdown-item>
    </el-dropdown-menu>
  </el-dropdown>
</template>

<script>
import { metas } from '@/api/article'
export default {
  data() {
    return {
      categorys: []
    }
  },
  computed: {
    choosen_category: {
      get() {
        return this.name
      },
      set(val) {
        this.$emit('input', val)
      }
    }
  },
  mounted() {
    this.categorys = metas().then((res) => {
      console.log(res)
      this.categorys = res.data
    })
  }
}
</script>
