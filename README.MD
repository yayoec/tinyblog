# 前后端分离的博客 后端使用 Laravel 前端使用 Vue 也是是一个很好的学习源码

# 目录结构

```plaintext
.	
├── backend                    	# 后端 包括 php 和 Go 语言版本
├── compose                    	# docker-compose 配置文件
│   │   ├── docker-compose.yml  # docker-compose.yml.sample 修改配置文件里相应目录至部署目录
├── conf                     	# 企业版各类微服务 submodule 仓库, CI 和构建镜像主要使用目录
│   │   ├── nginx.conf          # nginx 配置文件 admin.inectu.com blog.inectu.com backend.inectu.com 分别为 博客后台 博客前台和 api
│   │   ├── php.ini     		# php 配置文件 需要调整时将此文件挂载进 docker 容器
│   │   └── ...
├── frontend                    # 企业版各类微服务 submodule 仓库, CI 和构建镜像主要使用目录
│   │   ├── admin          		# 管理后台 以 vue-element-admin 为基础二次开发的项目
│   │   ├── front     			# 博客前端页面 均以 Vue 框架开发
├── scripts                     # 部署及其它脚本 sql 文件

# 可能的问题
1. php 开启 xdebug 调试模式时 minio 端口与 xdebug 冲突 可自行修改
2. Mysql 8.x 可能会出现无法以远程密码的方式访问 执行 类似命令 权限自行控制
···
ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY 'password';
···
3. 部署时 需手动修改相应账号密码配置
4. 前端开发模式 进入 admin 或者 front npm run dev
5. 后端登录页面 出现 419 错误可尝试 清除 Cookie 强制刷新页面 
6. 暂时是一个初始版本 如 TodoList 里所示 仍需很多开发工作才能成为一个美观以及完善的 Blog, 有兴趣的可以提交 PR 


# 修改 docker-compose.yml 里相关数据部署目录之后 直接 docker-compose up 即可一键启动

# 还比较原始 欢迎提交 Issue

# TodoList
1. 当前文章发布之后 同一类文章之间建立联系
2. 搜索 使用 ES 做一个搜索引擎或者 Sphinx
3. 评论框插件 
4. 公告栏
5. 文章推荐算法
6. 标签功能
7. 友链管理
8. TimeLine 时间线
9. 个人 SideBar 技能树
10. 完善搜索引擎
11. 分页栏
12. 仓库有5000 个 star 升级性能 更换后台语言引擎为 Go, 以及引入 Redis
13. 插件化各个组件 方便其它用户设计和添加新的组件