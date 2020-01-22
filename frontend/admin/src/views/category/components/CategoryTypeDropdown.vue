<template>
  <el-dropdown :show-timeout="100" trigger="click">
    <el-button plain>
      {{ categoryType === 'category'?'分类':'标签' }}
      <i class="el-icon-caret-bottom el-icon--right"></i>
    </el-button>
    <el-dropdown-menu slot="dropdown" class="no-padding">
      <el-dropdown-item>
        <el-radio-group v-model="categoryType" style="padding: 10px;">
          <el-radio label="category">
            分类
          </el-radio>
          <el-radio label="tag">
            标签
          </el-radio>
        </el-radio-group>
      </el-dropdown-item>
    </el-dropdown-menu>
  </el-dropdown>
</template>

<script>
export default {
  props: {
    value: {
      type: String,
      default: 'category'
    }
  },
  computed: {
    categoryType: {
      get() {
        return this.value
      },
      set(val) {
        this.$emit('input', val)
      }
    }
  }
}
</script>
