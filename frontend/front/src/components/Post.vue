<template>
  <div>
    <SideBar/>
    <div id="article-container">
      <div v-if="article" class="post">
        <div class="author-info">
          <a
            class="avatar"
            href="http://weibo.com/u/1592703762/"
          >
            <img src="http://tva3.sinaimg.cn/crop.0.0.180.180.180/5eeebb12jw1e8qgp5bmzyj2050050aa8.jpg" alt="5"/>
          </a>
          <span class="label">
            专题
          </span>
          <router-link :to="{name: 'category', params: {mid: article.meta_id}}">
            {{ article.meta_name }}
          </router-link>
          <span
            data-toggle="tooltip"
          >{{ article.modified }}</span>
          <div>
            <span>获得了<span>{{ article.like_num }}</span>个有用</span>
          </div>
        </div>
        <article>
          <h1>{{ article.title }}</h1>
          <div class="meta-top">
            <span class="views-count">阅读{{ article.read_num }}</span>
            <span class="comments-count">评论{{ article.comments_num }}</span>
            <span class="likes-count">有用{{ article.like_num }}</span>
          </div>
          <div
            class="post-content"
            itemprop="articleBody"
          >
            {{ article.text }}
          </div>
          <div class="copyright">
            <a><i class="fa fa-copyright"></i> 著作权归作者所有,如需转载请联系作者授权</a>
          </div>
          <!--
              <div class="support-author">
                  <p>如果觉得我的文章对您有用，请随意打赏。您的支持将鼓励我继续创作！</p>
                      <a class="btn btn-pay" data-toggle="modal" href="#pay-modal">¥ 打赏支持</a>
                  <div class="avatar-list">
                    <a href="/users/66ca42dadb23" class="avatar" data-nickname="徐永新" data-created-at="2016-10-14T00:44:59+08:00" data-original-title="" title="">
                      <img src="http://upload.jianshu.io/users/upload_avatars/1604534/b3b6bbe117e2?imageMogr/thumbnail/90x90/quality/100">
                    </a>
                    <div class="tooltip fade top in">
                      <div class="tooltip-arrow"></div>
                      <div class="tooltip-inner">abc.大约1小时前</div>
                    </div>
                    <a href="/users/84dcb02d0d7d" class="avatar" data-nickname="阳光一希恩" data-created-at="2016-10-13T20:15:27+08:00" data-original-title="" title="">
                      <img src="http://upload.jianshu.io/users/upload_avatars/2426112/81ae08ae1ded.jpeg?imageMogr/thumbnail/90x90/quality/100">
                      </a>
                  </div>
              </div>
              -->
          <div class="meta-bottom clearfix">
            <!--  Like Button -->
            <div class="like ">
              <div class="like-button">
                <a
                  id="like-note"
                  :aid="article.id"
                  class="like-content"
                  href="javascript:void(0)"
                >
                  <i class="fa fa-heart-o"></i> 有用
                </a>
              </div>
              <span
                id="likes-count"
                data-toggle="tooltip"
                data-placement="right"
                title="查看所有觉得有用的用户"
              >{{ article.like_num }}</span>
            </div>
            <!--  share group -->
            <div class="share-group pull-right">
              <a
                href="javascript:void((function(s,d,e,r,l,p,t,z,c){var%20f='http://v.t.sina.com.cn/share/share.php?appkey=1881139527',u=z||d.location,p=['&amp;url=',e(u),'&amp;title=',e(t||d.title),'&amp;source=',e(r),'&amp;sourceUrl=',e(l),'&amp;content=',c||'gb2312','&amp;pic=',e(p||'')].join('');function%20a(){if(!window.open([f,p].join(''),'mb',['toolbar=0,status=0,resizable=1,width=440,height=430,left=',(s.width-440)/2,',top=',(s.height-430)/2].join('')))u.href=[f,p].join('');};if(/Firefox/.test(navigator.userAgent))setTimeout(a,0);else%20a();})(screen,document,encodeURIComponent,'','','http://cwb.assets.jianshu.io/notes/images/6227346/weibo/image_787907822e35.jpg', '推荐 @沙鱼 的文章','http://blog.inectu.com','页面编码gb2312|utf-8默认gb2312'));"
                data-name="weibo"
              >
                <i class="fa fa-weibo"></i><span>分享到微博</span>
              </a>
              <a
                data-toggle="modal"
                href="#share-weixin-modal"
                data-name="weixin"
              >
                <i class="fa fa-weixin"></i><span>分享到微信</span>
              </a>

            </div>
          </div>
        </article>
        <!-- <ul class="post-near">
          <li class="fl">上一篇: </li>
          <li class="fr">下一篇: </li>
        </ul> -->
        <Comments />
      </div>
    </div>
  </div>
</template>
<script>
import Comments from './Comments.vue'
import SideBar from './SideBar.vue';
import { getArticle } from '../services/Apis'
export default {
  name: 'Post',
  components: { Comments, SideBar },
  data () {
    return {
      article: null
    }
  },
  mounted () {
    getArticle(this.$route.params.aid).then((res) => {
      console.log(res.data)
      this.article = res.data
    })
  },
  methods: {}
}
</script>
