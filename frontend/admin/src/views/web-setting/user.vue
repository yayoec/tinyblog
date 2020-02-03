<template>
  <div class="createPost-container">
    <el-form ref="postForm" :model="postForm" :rules="rules" class="form-container">
      <sticky :z-index="10" :class-name="'sub-navbar '+postForm.status">
        <el-button v-loading="loading" style="margin-left: 10px;" type="success" @click="submitForm">
          Publish
        </el-button>
      </sticky>

      <div class="createPost-main-container">
        <el-row>
          <el-form-item prop="avatar" style="margin-bottom: 30px;">
            <Upload v-model="postForm.avatar" />
          </el-form-item>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item style="margin-bottom: 40px;" prop="name">
              <MDinput v-model="postForm.nickname" :maxlength="100" name="name" required>
                昵称
              </MDinput>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item style="margin-bottom: 40px;" prop="description">
              <MDinput v-model="postForm.slogan" :maxlength="100" name="description" required>
                简介
              </MDinput>
            </el-form-item>
          </el-col>
        </el-row>
      </div>
    </el-form>
  </div>
</template>

<script>
import Sticky from '@/components/Sticky'
import MDinput from '@/components/MDinput'
import Upload from '@/components/Upload/SingleImage2'
import { fetchUserSettings, postUserSettings } from '@/api/article'

const defaultForm = {
  avatar: '',
  nickname: '',
  slogan: '好记性不如烂笔头'
}

export default {
  name: 'UserSettings',
  components: { Sticky, MDinput, Upload },
  props: {
    isEdit: {
      type: Boolean,
      default: true
    }
  },
  data() {
    const validateRequire = (rule, value, callback) => {
      if (value === '') {
        this.$message({
          message: rule.field + '为必传项',
          type: 'error'
        })
        callback(new Error(rule.field + '为必传项'))
      } else {
        callback()
      }
    }
    return {
      postForm: Object.assign({}, defaultForm),
      loading: false,
      rules: {
        avatar: [{ validator: validateRequire }],
        nickname: [{ validator: validateRequire }],
        slogan: [{ validator: validateRequire }]
      },
      tempRoute: {}
    }
  },
  created() {
    this.fetchData()
    // Why need to make a copy of this.$route here?
    // Because if you enter this page and quickly switch tag, may be in the execution of the setTagsViewTitle function, this.$route is no longer pointing to the current page
    // https://github.com/PanJiaChen/vue-element-admin/issues/1221
    this.tempRoute = Object.assign({}, this.$route)
  },
  methods: {
    fetchData() {
      fetchUserSettings().then(response => {
        this.postForm = response.data

        // set tagsview title
        this.setTagsViewTitle()

        // set page title
        this.setPageTitle()
      }).catch(err => {
        console.log(err)
      })
    },
    setTagsViewTitle() {
      const title = 'Edit User settings'
      const route = Object.assign({}, this.tempRoute, { title: `${title}-${this.postForm.nickname}` })
      this.$store.dispatch('tagsView/updateVisitedView', route)
    },
    setPageTitle() {
      const title = 'Edit User settings'
      document.title = `${title} - ${this.postForm.nickname}`
    },
    submitForm() {
      this.$refs.postForm.validate(valid => {
        if (valid) {
          this.loading = true
          postUserSettings(this.postForm).then((res) => {
            this.$notify({
              title: '成功',
              message: '保存用户设置成功',
              type: 'success',
              duration: 2000
            })
            this.postForm.status = 'published'
            this.loading = false
          })
        } else {
          console.log('error submit!!')
          return false
        }
      })
    }
  }
}
</script>

<style lang="scss" scoped>
@import "~@/styles/mixin.scss";

.createPost-container {
  position: relative;

  .createPost-main-container {
    padding: 40px 45px 20px 50px;

    .postInfo-container {
      position: relative;
      @include clearfix;
      margin-bottom: 10px;

      .postInfo-container-item {
        float: left;
      }
    }
  }

  .word-counter {
    width: 40px;
    position: absolute;
    right: 10px;
    top: 0px;
  }
}

.article-textarea /deep/ {
  textarea {
    padding-right: 40px;
    resize: none;
    border: none;
    border-radius: 0px;
    border-bottom: 1px solid #bfcbd9;
  }
}
</style>
