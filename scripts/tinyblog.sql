-- MySQL dump 10.13  Distrib 8.0.17, for osx10.13 (x86_64)
--
-- Host: 127.0.0.1    Database: tinyblog
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tinyblog_comments`
--

DROP TABLE IF EXISTS `tinyblog_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tinyblog_comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned DEFAULT '0',
  `created` int(10) unsigned DEFAULT '0',
  `author` varchar(200) DEFAULT NULL,
  `author_id` int(10) unsigned DEFAULT '0',
  `owner_id` int(10) unsigned DEFAULT '0',
  `email` varchar(200) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `ip` varchar(64) DEFAULT NULL,
  `agent` varchar(200) DEFAULT NULL,
  `text` text,
  `type` varchar(16) DEFAULT 'comment',
  `status` varchar(16) DEFAULT 'approved',
  `parent` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `created` (`created`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tinyblog_comments`
--

LOCK TABLES `tinyblog_comments` WRITE;
/*!40000 ALTER TABLE `tinyblog_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `tinyblog_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tinyblog_contents`
--

DROP TABLE IF EXISTS `tinyblog_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tinyblog_contents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `meta_id` int(11) DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `display_time` datetime DEFAULT NULL,
  `content` text,
  `order` int(10) unsigned DEFAULT '0',
  `author_id` int(10) unsigned DEFAULT '0',
  `summary` varchar(128) DEFAULT NULL,
  `type` varchar(16) DEFAULT 'post',
  `status` varchar(16) DEFAULT 'published',
  `password` varchar(32) DEFAULT NULL,
  `comments_num` int(10) unsigned DEFAULT '0',
  `read_num` int(11) DEFAULT '0',
  `like_num` int(11) DEFAULT '0',
  `support_num` int(11) DEFAULT '0',
  `allow_comment` char(1) DEFAULT '0',
  `allow_ping` char(1) DEFAULT '0',
  `allow_feed` char(1) DEFAULT '0',
  `parent` int(10) unsigned DEFAULT '0',
  `image_uri` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `created` (`created`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tinyblog_contents`
--

LOCK TABLES `tinyblog_contents` WRITE;
/*!40000 ALTER TABLE `tinyblog_contents` DISABLE KEYS */;
INSERT INTO `tinyblog_contents` VALUES (1,'TodoList',6,'2020-02-05 04:49:16','2020-02-05 06:27:02','2020-02-05 02:57:13','<p>其实以前维护过一个博客，只不过没有坚持下去，趁着稍微有点空档，自己写了一个博客。</p><p>从前端到后端，每一行代码，看上去简单的一个东西，实际上实现起来并不简单，甚至如果你愿意可以做得巨复杂。</p><p>言归正传。</p><p>当前此博客所用技术栈为：</p><p>后端：Laravel</p><p>前端：前台普通的 Vue 项目， Admin 为 Vue 的一个项目 <a href=\"https://github.com/PanJiaChen/vue-element-admin\" target=\"_blank\" rel=\"noopener\" data-mce-href=\"https://github.com/PanJiaChen/vue-element-admin\">vue-element-admin</a>&nbsp;</p><p>存储：Minio 对象存储</p><p>部署和开发：Docker</p><p>依赖环境为 Docker 和 docker-compose</p><p>代码高亮使用的是<a href=\"https://prismjs.com/\" target=\"_blank\" rel=\"noopener\" data-mce-href=\"https://prismjs.com/\">Prismjs</a></p><pre class=\"language-php\" contenteditable=\"false\"><span class=\"token delimiter\">&lt;?php</span>\n<span class=\"token keyword\">echo</span> <span class=\"token string\">\'Hello world!\'</span><span class=\"token punctuation\">;</span></pre><p>记录一下还需要完善的地方(TodoList)：</p><ol><li>当前文章发布之后 同一类文章之间建立联系</li><li>搜索 使用 ES 做一个搜索引擎或者 Sphinx</li><li>评论框插件&nbsp;</li><li>公告栏</li><li>文章推荐算法</li><li>标签功能</li><li>友链管理</li><li>TimeLine 时间线</li><li>个人 SideBar 技能树</li><li>完善搜索引擎</li><li>分页栏</li><li>仓库有5000 个 star 升级性能 更换后台语言引擎为 Go, 以及引入 Redis</li><li>插件化各个组件 方便其它用户设计和添加新的组件</li></ol><p>由此看来，一个页面即使是个最简单的留言板，如果要做得完善，其实是很复杂的一个事情。</p><p>希望开个好头，以后坚持写博客，好记性不如烂笔头。</p><p><br></p>',3,1,'决定写一个博客，记录所学，这篇文章主要是记录这个开源博客还有哪些未完成事项','post','published',NULL,0,0,0,0,'0','0','0',0,'http://minio.inectu.com/tinyblog/images/3e123a9639e4688ac10524cb41cbe04d');
/*!40000 ALTER TABLE `tinyblog_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tinyblog_fields`
--

DROP TABLE IF EXISTS `tinyblog_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tinyblog_fields` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(200) NOT NULL,
  `type` varchar(8) DEFAULT 'str',
  `str_value` text,
  `int_value` int(10) DEFAULT '0',
  `float_value` float DEFAULT '0',
  PRIMARY KEY (`id`,`name`),
  KEY `int_value` (`int_value`),
  KEY `float_value` (`float_value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tinyblog_fields`
--

LOCK TABLES `tinyblog_fields` WRITE;
/*!40000 ALTER TABLE `tinyblog_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `tinyblog_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tinyblog_img`
--

DROP TABLE IF EXISTS `tinyblog_img`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tinyblog_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `slug` varchar(20) DEFAULT NULL,
  `owner_type` varchar(10) NOT NULL,
  `path` varchar(80) NOT NULL,
  `type` char(10) NOT NULL,
  `size` int(11) NOT NULL,
  `file_md5` char(32) DEFAULT NULL,
  `camera` varchar(20) DEFAULT NULL,
  `aperture` varchar(20) DEFAULT NULL,
  `focus` varchar(10) DEFAULT NULL,
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tinyblog_img`
--

LOCK TABLES `tinyblog_img` WRITE;
/*!40000 ALTER TABLE `tinyblog_img` DISABLE KEYS */;
/*!40000 ALTER TABLE `tinyblog_img` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tinyblog_like_record`
--

DROP TABLE IF EXISTS `tinyblog_like_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tinyblog_like_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_unique_id` varchar(40) NOT NULL,
  `article_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `aid` (`article_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tinyblog_like_record`
--

LOCK TABLES `tinyblog_like_record` WRITE;
/*!40000 ALTER TABLE `tinyblog_like_record` DISABLE KEYS */;
INSERT INTO `tinyblog_like_record` VALUES (1,'060e7c5bc2b822805a2167c8f37b5f47',1,1,'2019-12-24 06:34:13','127.0.0.1');
/*!40000 ALTER TABLE `tinyblog_like_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tinyblog_metas`
--

DROP TABLE IF EXISTS `tinyblog_metas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tinyblog_metas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `type` varchar(32) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `count` int(10) unsigned DEFAULT '0',
  `order` int(10) unsigned DEFAULT '0',
  `parent` int(10) unsigned DEFAULT '0',
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tinyblog_metas`
--

LOCK TABLES `tinyblog_metas` WRITE;
/*!40000 ALTER TABLE `tinyblog_metas` DISABLE KEYS */;
INSERT INTO `tinyblog_metas` VALUES (1,'前端','front','category','前端小站技术文',1,1,0,'2020-01-23 16:00:36',NULL),(2,'后端','backend','category','后端技术总结',1,2,0,'2020-01-23 16:00:36',NULL),(3,'安全','security','category','安全技术总结',1,3,0,'2020-01-23 16:00:36',NULL),(4,'移动端','mobile','category','移动端技术记录',1,4,0,'2020-01-23 16:00:36',NULL),(5,'转载','reprint','category','转载分享的好文',1,5,0,'2020-01-23 16:00:36',NULL),(6,'Mix','mobile','category','杂项记录',1,6,0,'2020-01-23 16:00:36',NULL);
/*!40000 ALTER TABLE `tinyblog_metas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tinyblog_options`
--

DROP TABLE IF EXISTS `tinyblog_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tinyblog_options` (
  `name` varchar(32) NOT NULL,
  `value` text,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tinyblog_options`
--

LOCK TABLES `tinyblog_options` WRITE;
/*!40000 ALTER TABLE `tinyblog_options` DISABLE KEYS */;
INSERT INTO `tinyblog_options` VALUES ('avatar','http://minio.inectu.com/tinyblog/images/3b727d73a8be788c89aa883b3b51debc'),('nickname','沙鱼不飞'),('slogan','好记性不如烂笔头'),('github','https://github.com/yayoec'),('weibo','https://weibo.com/u/1592703762');
/*!40000 ALTER TABLE `tinyblog_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tinyblog_read_record`
--

DROP TABLE IF EXISTS `tinyblog_read_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tinyblog_read_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `user_unique_id` varchar(40) NOT NULL,
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `article id` (`article_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tinyblog_read_record`
--

LOCK TABLES `tinyblog_read_record` WRITE;
/*!40000 ALTER TABLE `tinyblog_read_record` DISABLE KEYS */;
INSERT INTO `tinyblog_read_record` VALUES (1,1,'060e7c5bc2b822805a2167c8f37b5f47','2019-12-24 06:33:24','127.0.0.1');
/*!40000 ALTER TABLE `tinyblog_read_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tinyblog_relationships`
--

DROP TABLE IF EXISTS `tinyblog_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tinyblog_relationships` (
  `cid` int(10) unsigned NOT NULL,
  `mid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`cid`,`mid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tinyblog_relationships`
--

LOCK TABLES `tinyblog_relationships` WRITE;
/*!40000 ALTER TABLE `tinyblog_relationships` DISABLE KEYS */;
INSERT INTO `tinyblog_relationships` VALUES (1,1),(2,1);
/*!40000 ALTER TABLE `tinyblog_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tinyblog_users`
--

DROP TABLE IF EXISTS `tinyblog_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tinyblog_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `screen_name` varchar(32) DEFAULT NULL,
  `created` int(10) unsigned DEFAULT '0',
  `activated` int(10) unsigned DEFAULT '0',
  `logged` int(10) unsigned DEFAULT '0',
  `group` varchar(16) DEFAULT 'visitor',
  `remember_token` varchar(64) DEFAULT NULL,
  `api_token` varchar(64) DEFAULT NULL,
  `updated_at` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tinyblog_users`
--

LOCK TABLES `tinyblog_users` WRITE;
/*!40000 ALTER TABLE `tinyblog_users` DISABLE KEYS */;
INSERT INTO `tinyblog_users` VALUES (1,'admin','$2y$10$iOvKstZJVCXbubZDwvGrj.abZW.fq0Lzoxa545lMjhA9OHK3EHvPK','webmaster@yourdomain.com','http://www.typecho.org','admin',1474092469,1577169439,1478149722,'administrator','di6p1vpc0UPbhIOrbcE3JfR8m0T8f8dGxDbvzCygBddqU9sozVmNWe3p1siM','5e3a2c449fd83','2020-02-05 02:45:24');
/*!40000 ALTER TABLE `tinyblog_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-05 14:34:30
