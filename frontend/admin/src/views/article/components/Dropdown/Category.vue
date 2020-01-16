<template>
  <el-dropdown :show-timeout="100" trigger="click">
    <el-button plain>
      分类：{{ meta_name }}
      <i class="el-icon-caret-bottom el-icon--right"></i>
    </el-button>
    <el-dropdown-menu slot="dropdown" class="no-padding">
      <el-dropdown-item>
        <el-radio-group v-model="meta_id" style="padding: 10px;">
          <el-radio v-for="item in categorys" :key="item.id" :label="item.id" @change="metaName(item.name)">
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
  props: {
    value: {
      type: Number,
      default: 1
    }
  },
  data() {
    return {
      categorys: [],
      // meta_id: this.id,
      meta_name: "CODE"
    }
  },
  computed: {
    meta_id: {
      get() {
        return this.value
      },
      set(val) {
        this.$emit('input', val)
      }
    }
  },
  beforeCreate() {
    var that = this
    this.categorys = metas().then((res) => {
      this.categorys = res.data.slice(0)
      this.categorys.forEach(function(category){
        if(category.id === that.meta_id) {
          that.meta_name = category.name
        }
      })
    })
  },
  methods: {
    metaName: function(meta_name) {
      this.meta_name = meta_name
    }
  }
}
</script>
