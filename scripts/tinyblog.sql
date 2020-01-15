-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: 2019-12-24 08:23:35
-- 服务器版本： 5.6.28
-- PHP Version: 7.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";
use tinyblog;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `typecho`
--

-- --------------------------------------------------------

--
-- 表的结构 `tinyblog_comments`
--

CREATE TABLE `tinyblog_comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `cid` int(10) UNSIGNED DEFAULT '0',
  `created` int(10) UNSIGNED DEFAULT '0',
  `author` varchar(200) DEFAULT NULL,
  `author_id` int(10) UNSIGNED DEFAULT '0',
  `owner_id` int(10) UNSIGNED DEFAULT '0',
  `email` varchar(200) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `ip` varchar(64) DEFAULT NULL,
  `agent` varchar(200) DEFAULT NULL,
  `text` text,
  `type` varchar(16) DEFAULT 'comment',
  `status` varchar(16) DEFAULT 'approved',
  `parent` int(10) UNSIGNED DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tinyblog_contents`
--

CREATE TABLE `tinyblog_contents` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `meta_id` int DEFAULT 0,
  `created` datetime default 0,
  `modified` datetime default 0,
  `display_time` datetime default null,
  `content` text,
  `order` int(10) UNSIGNED DEFAULT '0',
  `author_id` int(10) UNSIGNED DEFAULT '0',
  `summary` varchar(32) DEFAULT NULL,
  `type` varchar(16) DEFAULT 'post',
  `status` varchar(16) DEFAULT 'published',
  `password` varchar(32) DEFAULT NULL,
  `comments_num` int(10) UNSIGNED DEFAULT '0',
  `read_num` int(11) DEFAULT '0',
  `like_num` int(11) DEFAULT '0',
  `support_num` int(11) DEFAULT '0',
  `allow_comment` char(1) DEFAULT '0',
  `allow_ping` char(1) DEFAULT '0',
  `allow_feed` char(1) DEFAULT '0',
  `parent` int(10) UNSIGNED DEFAULT '0',
  `image_uri` varchar(128)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tinyblog_contents`
--

INSERT INTO `tinyblog_contents` (`id`, `title`, `meta_id`, `created`, `modified`, `text`, `order`, `author_id`, `summary`, `type`, `status`, `password`, `comments_num`, `read_num`, `like_num`, `support_num`, `allow_comment`, `allow_ping`, `allow_feed`, `parent`) VALUES
(1, 'TODOlist', 1, '2019-06-20 00:00:00', '2019-06-20 00:00:00', '<!--markdown-->![QQ20161031-1.png][1]\r\n一直都想弄个博客，在互联网大海有个自己的小角落，终于趁着有空档弄下来了，博客引擎fork自typecho。\r\n\r\n定下心来做这个事情之前选系统选了很久,有基于django的也有wordpress这类老牌博客系统,看了源代码,感觉太重，就失去了继续下去的欲望。还有些轻量级的zblog,emlog之类的源代码也都看了,轻量级是轻量级,但要在上面做些新的开发确实是有点捉急,因为跟我想要的博客还是有点不一样,直到看到了typecho的源码。\r\n\r\ntypecho这个系统有点意思,设计得相当精巧,这个作者在java web领域应该有比较深的浸淫,像java那样去写web站在php中说实话还是比较少见的,后面又在github上看到有个typecho框架不知道作者是不是同一人,当然那个框架的路由系统比这个是要好点，这个路由大概是我见过最丑的调用方式了,你见过把路由配置到数据库然后正则匹配模式调用组件的吗。。。好吧,非要这样,你写到配置文件里开发起来你自己应该也方便多了吧,虽然提供了添加路由的接口。但是真的有点丑。\r\n\r\n这个路由给这个系统扣了不少分,以后找时间一定要把这个改一下,typecho全站把各个功能都分割成一个个小组件,等于说如果你要自己开发新功能就只要开发组件就好了,还不影响它的新功能,它的插件系统其实也是一个组件,这就是这个系统最有特色的地方了。\r\n\r\n不吐槽这些了,typecho终究还是个很优秀的轻量级博客系统,备忘下这个系统以后还需要做的事情吧,其实还有挺多事情要做的。\r\n\r\n首先是相册功能,想要的功能是在后台能添加相册,批量上传图片后自动压缩,读取相机,光圈,GPS等相应信息存档,在首页侧边栏展示小型相册入口,方式不定,也许可以试试nodejs。\r\n\r\n还有评论框的问题,直接调用新浪的评论框还是有点丑,像多说那样的多sns账号登录显示倒是很不错,微信公众平台新浪平台还在申请中,待定。\r\n\r\n第三个是文章专题的浏览体验,目前没去改动内部的翻页和浏览,当然移动设备的支持是肯定的。\r\n\r\n代码已发至github,如有需要请自取,因为改了里面一些组件的代码和文章展示的一些功能还有修复了一个路径问题的bug,这个自开发的主题需要配合我的ajax插件使用,暂时不能直接发至typecho社区,以后改好了一并发上去,当回馈社区吧。\r\n\r\n以上。\r\n\r\n注：主题参考自[简书][2]，博客引擎地址[typecho][3]\r\n\r\n\r\n  [1]: http://blog.inectu.com/usr/uploads/2016/10/3122907263.png\r\n  [2]: http://www.jianshu.com\r\n  [3]: http://www.typecho.org/', 0, 1, NULL, 'post', 'publish', NULL, 0, 1, 1, 0, '1', '1', '1', 0);

-- --------------------------------------------------------

--
-- 表的结构 `tinyblog_fields`
--

CREATE TABLE `tinyblog_fields` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(200) NOT NULL,
  `type` varchar(8) DEFAULT 'str',
  `str_value` text,
  `int_value` int(10) DEFAULT '0',
  `float_value` float DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tinyblog_img`
--

CREATE TABLE `tinyblog_img` (
  `id` int(11) NOT NULL,
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
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tinyblog_like_record`
--

CREATE TABLE `tinyblog_like_record` (
  `id` int(11) NOT NULL,
  `user_unique_id` varchar(40) NOT NULL,
  `article_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tinyblog_like_record`
--

INSERT INTO `tinyblog_like_record` (`id`, `user_unique_id`, `article_id`, `category_id`, `add_time`, `ip`) VALUES
(1, '060e7c5bc2b822805a2167c8f37b5f47', 1, 1, '2019-12-24 06:34:13', '127.0.0.1');

-- --------------------------------------------------------

--
-- 表的结构 `tinyblog_metas`
--

CREATE TABLE `tinyblog_metas` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `type` varchar(32) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `count` int(10) UNSIGNED DEFAULT '0',
  `order` int(10) UNSIGNED DEFAULT '0',
  `parent` int(10) UNSIGNED DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tinyblog_metas`
--

INSERT INTO `tinyblog_metas` (`id`, `name`, `slug`, `type`, `description`, `count`, `order`, `parent`) VALUES
(1, 'CODE', 'code', 'category', 'code', 1, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `tinyblog_options`
--

CREATE TABLE `tinyblog_options` (
  `name` varchar(32) NOT NULL,
  `user` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `value` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tinyblog_options`
--

INSERT INTO `tinyblog_options` (`name`, `user`, `value`) VALUES
('theme', 0, 'myEcho'),
('theme:myEcho', 0, 'a:2:{s:7:"logoUrl";N;s:12:"sidebarBlock";a:5:{i:0;s:15:"ShowRecentPosts";i:1;s:18:"ShowRecentComments";i:2;s:12:"ShowCategory";i:3;s:11:"ShowArchive";i:4;s:9:"ShowOther";}}'),
('timezone', 0, '28800'),
('lang', 0, NULL),
('charset', 0, 'UTF-8'),
('contentType', 0, 'text/html'),
('gzip', 0, '0'),
('generator', 0, 'Typecho 1.0/14.10.10'),
('title', 0, 'Hello World'),
('description', 0, '一般般'),
('keywords', 0, 'typecho,php,blog'),
('rewrite', 0, '0'),
('frontPage', 0, 'recent'),
('frontArchive', 0, '0'),
('commentsRequireMail', 0, '1'),
('commentsWhitelist', 0, '0'),
('commentsRequireURL', 0, '0'),
('commentsRequireModeration', 0, '0'),
('plugins', 0, 'a:2:{s:9:"activated";a:2:{s:12:"AjaxOperator";a:0:{}s:10:"HelloWorld";a:1:{s:7:"handles";a:1:{s:21:"admin/menu.php:navBar";a:1:{i:0;a:2:{i:0;s:17:"HelloWorld_Plugin";i:1;s:6:"render";}}}}}s:7:"handles";a:1:{s:21:"admin/menu.php:navBar";a:1:{i:0;a:2:{i:0;s:17:"HelloWorld_Plugin";i:1;s:6:"render";}}}}'),
('commentDateFormat', 0, 'F jS, Y \\a\\t h:i a'),
('siteUrl', 0, 'http://localhost:8000/typecho'),
('defaultCategory', 0, '1'),
('allowRegister', 0, '0'),
('defaultAllowComment', 0, '1'),
('defaultAllowPing', 0, '1'),
('defaultAllowFeed', 0, '1'),
('pageSize', 0, '7'),
('postsListSize', 0, '10'),
('commentsListSize', 0, '10'),
('commentsHTMLTagAllowed', 0, NULL),
('postDateFormat', 0, 'Y-m-d'),
('feedFullText', 0, '1'),
('editorSize', 0, '350'),
('autoSave', 0, '0'),
('markdown', 0, '1'),
('commentsMaxNestingLevels', 0, '5'),
('commentsPostTimeout', 0, '2592000'),
('commentsUrlNofollow', 0, '1'),
('commentsShowUrl', 0, '1'),
('commentsMarkdown', 0, '1'),
('commentsPageBreak', 0, '1'),
('commentsThreaded', 0, '1'),
('commentsPageSize', 0, '20'),
('commentsPageDisplay', 0, 'last'),
('commentsOrder', 0, 'ASC'),
('commentsCheckReferer', 0, '1'),
('commentsAutoClose', 0, '0'),
('commentsPostIntervalEnable', 0, '1'),
('commentsPostInterval', 0, '60'),
('commentsShowCommentOnly', 0, '0'),
('commentsAvatar', 0, '1'),
('commentsAvatarRating', 0, 'G'),
('commentsAntiSpam', 0, '1'),
('routingTable', 0, 'a:27:{i:0;a:26:{s:5:"index";a:6:{s:3:"url";s:1:"/";s:6:"widget";s:14:"Widget_Archive";s:6:"action";s:6:"render";s:4:"regx";s:8:"|^[/]?$|";s:6:"format";s:1:"/";s:6:"params";a:0:{}}s:7:"archive";a:6:{s:3:"url";s:6:"/blog/";s:6:"widget";s:14:"Widget_Archive";s:6:"action";s:6:"render";s:4:"regx";s:13:"|^/blog[/]?$|";s:6:"format";s:6:"/blog/";s:6:"params";a:0:{}}s:2:"do";a:6:{s:3:"url";s:22:"/action/[action:alpha]";s:6:"widget";s:9:"Widget_Do";s:6:"action";s:6:"action";s:4:"regx";s:32:"|^/action/([_0-9a-zA-Z-]+)[/]?$|";s:6:"format";s:10:"/action/%s";s:6:"params";a:1:{i:0;s:6:"action";}}s:4:"post";a:6:{s:3:"url";s:24:"/archives/[cid:digital]/";s:6:"widget";s:14:"Widget_Archive";s:6:"action";s:6:"render";s:4:"regx";s:26:"|^/archives/([0-9]+)[/]?$|";s:6:"format";s:13:"/archives/%s/";s:6:"params";a:1:{i:0;s:3:"cid";}}s:10:"attachment";a:6:{s:3:"url";s:26:"/attachment/[cid:digital]/";s:6:"widget";s:14:"Widget_Archive";s:6:"action";s:6:"render";s:4:"regx";s:28:"|^/attachment/([0-9]+)[/]?$|";s:6:"format";s:15:"/attachment/%s/";s:6:"params";a:1:{i:0;s:3:"cid";}}s:8:"category";a:6:{s:3:"url";s:17:"/category/[slug]/";s:6:"widget";s:14:"Widget_Archive";s:6:"action";s:6:"render";s:4:"regx";s:25:"|^/category/([^/]+)[/]?$|";s:6:"format";s:13:"/category/%s/";s:6:"params";a:1:{i:0;s:4:"slug";}}s:3:"tag";a:6:{s:3:"url";s:12:"/tag/[slug]/";s:6:"widget";s:14:"Widget_Archive";s:6:"action";s:6:"render";s:4:"regx";s:20:"|^/tag/([^/]+)[/]?$|";s:6:"format";s:8:"/tag/%s/";s:6:"params";a:1:{i:0;s:4:"slug";}}s:6:"author";a:6:{s:3:"url";s:22:"/author/[uid:digital]/";s:6:"widget";s:14:"Widget_Archive";s:6:"action";s:6:"render";s:4:"regx";s:24:"|^/author/([0-9]+)[/]?$|";s:6:"format";s:11:"/author/%s/";s:6:"params";a:1:{i:0;s:3:"uid";}}s:6:"search";a:6:{s:3:"url";s:19:"/search/[keywords]/";s:6:"widget";s:14:"Widget_Archive";s:6:"action";s:6:"render";s:4:"regx";s:23:"|^/search/([^/]+)[/]?$|";s:6:"format";s:11:"/search/%s/";s:6:"params";a:1:{i:0;s:8:"keywords";}}s:10:"index_page";a:6:{s:3:"url";s:21:"/page/[page:digital]/";s:6:"widget";s:14:"Widget_Archive";s:6:"action";s:6:"render";s:4:"regx";s:22:"|^/page/([0-9]+)[/]?$|";s:6:"format";s:9:"/page/%s/";s:6:"params";a:1:{i:0;s:4:"page";}}s:12:"archive_page";a:6:{s:3:"url";s:26:"/blog/page/[page:digital]/";s:6:"widget";s:14:"Widget_Archive";s:6:"action";s:6:"render";s:4:"regx";s:27:"|^/blog/page/([0-9]+)[/]?$|";s:6:"format";s:14:"/blog/page/%s/";s:6:"params";a:1:{i:0;s:4:"page";}}s:13:"category_page";a:6:{s:3:"url";s:32:"/category/[slug]/[page:digital]/";s:6:"widget";s:14:"Widget_Archive";s:6:"action";s:6:"render";s:4:"regx";s:34:"|^/category/([^/]+)/([0-9]+)[/]?$|";s:6:"format";s:16:"/category/%s/%s/";s:6:"params";a:2:{i:0;s:4:"slug";i:1;s:4:"page";}}s:8:"tag_page";a:6:{s:3:"url";s:27:"/tag/[slug]/[page:digital]/";s:6:"widget";s:14:"Widget_Archive";s:6:"action";s:6:"render";s:4:"regx";s:29:"|^/tag/([^/]+)/([0-9]+)[/]?$|";s:6:"format";s:11:"/tag/%s/%s/";s:6:"params";a:2:{i:0;s:4:"slug";i:1;s:4:"page";}}s:11:"author_page";a:6:{s:3:"url";s:37:"/author/[uid:digital]/[page:digital]/";s:6:"widget";s:14:"Widget_Archive";s:6:"action";s:6:"render";s:4:"regx";s:33:"|^/author/([0-9]+)/([0-9]+)[/]?$|";s:6:"format";s:14:"/author/%s/%s/";s:6:"params";a:2:{i:0;s:3:"uid";i:1;s:4:"page";}}s:11:"search_page";a:6:{s:3:"url";s:34:"/search/[keywords]/[page:digital]/";s:6:"widget";s:14:"Widget_Archive";s:6:"action";s:6:"render";s:4:"regx";s:32:"|^/search/([^/]+)/([0-9]+)[/]?$|";s:6:"format";s:14:"/search/%s/%s/";s:6:"params";a:2:{i:0;s:8:"keywords";i:1;s:4:"page";}}s:12:"archive_year";a:6:{s:3:"url";s:18:"/[year:digital:4]/";s:6:"widget";s:14:"Widget_Archive";s:6:"action";s:6:"render";s:4:"regx";s:19:"|^/([0-9]{4})[/]?$|";s:6:"format";s:4:"/%s/";s:6:"params";a:1:{i:0;s:4:"year";}}s:13:"archive_month";a:6:{s:3:"url";s:36:"/[year:digital:4]/[month:digital:2]/";s:6:"widget";s:14:"Widget_Archive";s:6:"action";s:6:"render";s:4:"regx";s:30:"|^/([0-9]{4})/([0-9]{2})[/]?$|";s:6:"format";s:7:"/%s/%s/";s:6:"params";a:2:{i:0;s:4:"year";i:1;s:5:"month";}}s:11:"archive_day";a:6:{s:3:"url";s:52:"/[year:digital:4]/[month:digital:2]/[day:digital:2]/";s:6:"widget";s:14:"Widget_Archive";s:6:"action";s:6:"render";s:4:"regx";s:41:"|^/([0-9]{4})/([0-9]{2})/([0-9]{2})[/]?$|";s:6:"format";s:10:"/%s/%s/%s/";s:6:"params";a:3:{i:0;s:4:"year";i:1;s:5:"month";i:2;s:3:"day";}}s:17:"archive_year_page";a:6:{s:3:"url";s:38:"/[year:digital:4]/page/[page:digital]/";s:6:"widget";s:14:"Widget_Archive";s:6:"action";s:6:"render";s:4:"regx";s:33:"|^/([0-9]{4})/page/([0-9]+)[/]?$|";s:6:"format";s:12:"/%s/page/%s/";s:6:"params";a:2:{i:0;s:4:"year";i:1;s:4:"page";}}s:18:"archive_month_page";a:6:{s:3:"url";s:56:"/[year:digital:4]/[month:digital:2]/page/[page:digital]/";s:6:"widget";s:14:"Widget_Archive";s:6:"action";s:6:"render";s:4:"regx";s:44:"|^/([0-9]{4})/([0-9]{2})/page/([0-9]+)[/]?$|";s:6:"format";s:15:"/%s/%s/page/%s/";s:6:"params";a:3:{i:0;s:4:"year";i:1;s:5:"month";i:2;s:4:"page";}}s:16:"archive_day_page";a:6:{s:3:"url";s:72:"/[year:digital:4]/[month:digital:2]/[day:digital:2]/page/[page:digital]/";s:6:"widget";s:14:"Widget_Archive";s:6:"action";s:6:"render";s:4:"regx";s:55:"|^/([0-9]{4})/([0-9]{2})/([0-9]{2})/page/([0-9]+)[/]?$|";s:6:"format";s:18:"/%s/%s/%s/page/%s/";s:6:"params";a:4:{i:0;s:4:"year";i:1;s:5:"month";i:2;s:3:"day";i:3;s:4:"page";}}s:12:"comment_page";a:6:{s:3:"url";s:53:"[permalink:string]/comment-page-[commentPage:digital]";s:6:"widget";s:14:"Widget_Archive";s:6:"action";s:6:"render";s:4:"regx";s:36:"|^(.+)/comment\\-page\\-([0-9]+)[/]?$|";s:6:"format";s:18:"%s/comment-page-%s";s:6:"params";a:2:{i:0;s:9:"permalink";i:1;s:11:"commentPage";}}s:4:"feed";a:6:{s:3:"url";s:20:"/feed[feed:string:0]";s:6:"widget";s:14:"Widget_Archive";s:6:"action";s:4:"feed";s:4:"regx";s:17:"|^/feed(.*)[/]?$|";s:6:"format";s:7:"/feed%s";s:6:"params";a:1:{i:0;s:4:"feed";}}s:8:"feedback";a:6:{s:3:"url";s:31:"[permalink:string]/[type:alpha]";s:6:"widget";s:15:"Widget_Feedback";s:6:"action";s:6:"action";s:4:"regx";s:29:"|^(.+)/([_0-9a-zA-Z-]+)[/]?$|";s:6:"format";s:5:"%s/%s";s:6:"params";a:2:{i:0;s:9:"permalink";i:1;s:4:"type";}}s:4:"page";a:6:{s:3:"url";s:12:"/[slug].html";s:6:"widget";s:14:"Widget_Archive";s:6:"action";s:6:"render";s:4:"regx";s:22:"|^/([^/]+)\\.html[/]?$|";s:6:"format";s:8:"/%s.html";s:6:"params";a:1:{i:0;s:4:"slug";}}s:16:"route_to_my_ajax";a:6:{s:3:"url";s:8:"/my_ajax";s:6:"widget";s:19:"AjaxOperator_MyAjax";s:6:"action";s:6:"action";s:4:"regx";s:16:"|^/my_ajax[/]?$|";s:6:"format";s:8:"/my_ajax";s:6:"params";a:0:{}}}s:5:"index";a:3:{s:3:"url";s:1:"/";s:6:"widget";s:14:"Widget_Archive";s:6:"action";s:6:"render";}s:7:"archive";a:3:{s:3:"url";s:6:"/blog/";s:6:"widget";s:14:"Widget_Archive";s:6:"action";s:6:"render";}s:2:"do";a:3:{s:3:"url";s:22:"/action/[action:alpha]";s:6:"widget";s:9:"Widget_Do";s:6:"action";s:6:"action";}s:4:"post";a:3:{s:3:"url";s:24:"/archives/[cid:digital]/";s:6:"widget";s:14:"Widget_Archive";s:6:"action";s:6:"render";}s:10:"attachment";a:3:{s:3:"url";s:26:"/attachment/[cid:digital]/";s:6:"widget";s:14:"Widget_Archive";s:6:"action";s:6:"render";}s:8:"category";a:3:{s:3:"url";s:17:"/category/[slug]/";s:6:"widget";s:14:"Widget_Archive";s:6:"action";s:6:"render";}s:3:"tag";a:3:{s:3:"url";s:12:"/tag/[slug]/";s:6:"widget";s:14:"Widget_Archive";s:6:"action";s:6:"render";}s:6:"author";a:3:{s:3:"url";s:22:"/author/[uid:digital]/";s:6:"widget";s:14:"Widget_Archive";s:6:"action";s:6:"render";}s:6:"search";a:3:{s:3:"url";s:19:"/search/[keywords]/";s:6:"widget";s:14:"Widget_Archive";s:6:"action";s:6:"render";}s:10:"index_page";a:3:{s:3:"url";s:21:"/page/[page:digital]/";s:6:"widget";s:14:"Widget_Archive";s:6:"action";s:6:"render";}s:12:"archive_page";a:3:{s:3:"url";s:26:"/blog/page/[page:digital]/";s:6:"widget";s:14:"Widget_Archive";s:6:"action";s:6:"render";}s:13:"category_page";a:3:{s:3:"url";s:32:"/category/[slug]/[page:digital]/";s:6:"widget";s:14:"Widget_Archive";s:6:"action";s:6:"render";}s:8:"tag_page";a:3:{s:3:"url";s:27:"/tag/[slug]/[page:digital]/";s:6:"widget";s:14:"Widget_Archive";s:6:"action";s:6:"render";}s:11:"author_page";a:3:{s:3:"url";s:37:"/author/[uid:digital]/[page:digital]/";s:6:"widget";s:14:"Widget_Archive";s:6:"action";s:6:"render";}s:11:"search_page";a:3:{s:3:"url";s:34:"/search/[keywords]/[page:digital]/";s:6:"widget";s:14:"Widget_Archive";s:6:"action";s:6:"render";}s:12:"archive_year";a:3:{s:3:"url";s:18:"/[year:digital:4]/";s:6:"widget";s:14:"Widget_Archive";s:6:"action";s:6:"render";}s:13:"archive_month";a:3:{s:3:"url";s:36:"/[year:digital:4]/[month:digital:2]/";s:6:"widget";s:14:"Widget_Archive";s:6:"action";s:6:"render";}s:11:"archive_day";a:3:{s:3:"url";s:52:"/[year:digital:4]/[month:digital:2]/[day:digital:2]/";s:6:"widget";s:14:"Widget_Archive";s:6:"action";s:6:"render";}s:17:"archive_year_page";a:3:{s:3:"url";s:38:"/[year:digital:4]/page/[page:digital]/";s:6:"widget";s:14:"Widget_Archive";s:6:"action";s:6:"render";}s:18:"archive_month_page";a:3:{s:3:"url";s:56:"/[year:digital:4]/[month:digital:2]/page/[page:digital]/";s:6:"widget";s:14:"Widget_Archive";s:6:"action";s:6:"render";}s:16:"archive_day_page";a:3:{s:3:"url";s:72:"/[year:digital:4]/[month:digital:2]/[day:digital:2]/page/[page:digital]/";s:6:"widget";s:14:"Widget_Archive";s:6:"action";s:6:"render";}s:12:"comment_page";a:3:{s:3:"url";s:53:"[permalink:string]/comment-page-[commentPage:digital]";s:6:"widget";s:14:"Widget_Archive";s:6:"action";s:6:"render";}s:4:"feed";a:3:{s:3:"url";s:20:"/feed[feed:string:0]";s:6:"widget";s:14:"Widget_Archive";s:6:"action";s:4:"feed";}s:8:"feedback";a:3:{s:3:"url";s:31:"[permalink:string]/[type:alpha]";s:6:"widget";s:15:"Widget_Feedback";s:6:"action";s:6:"action";}s:4:"page";a:3:{s:3:"url";s:12:"/[slug].html";s:6:"widget";s:14:"Widget_Archive";s:6:"action";s:6:"render";}s:16:"route_to_my_ajax";a:3:{s:3:"url";s:8:"/my_ajax";s:6:"widget";s:19:"AjaxOperator_MyAjax";s:6:"action";s:6:"action";}}'),
('actionTable', 0, 'a:0:{}'),
('panelTable', 0, 'a:0:{}'),
('attachmentTypes', 0, '@image@'),
('secret', 0, 'VFmjBAfD7Mezcvsxot*&)^hq9CJXyXB)'),
('plugin:HelloWorld', 0, 'a:1:{s:4:"word";s:11:"Hello World";}'),
('autoSave', 1, '1'),
('markdown', 1, '1'),
('defaultAllowComment', 1, '1'),
('defaultAllowPing', 1, '1'),
('defaultAllowFeed', 1, '1');

-- --------------------------------------------------------

--
-- 表的结构 `tinyblog_read_record`
--

CREATE TABLE `tinyblog_read_record` (
  `id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `user_unique_id` varchar(40) NOT NULL,
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tinyblog_read_record`
--

INSERT INTO `tinyblog_read_record` (`id`, `article_id`, `user_unique_id`, `add_time`, `ip`) VALUES
(1, 1, '060e7c5bc2b822805a2167c8f37b5f47', '2019-12-24 06:33:24', '127.0.0.1');

-- --------------------------------------------------------

--
-- 表的结构 `tinyblog_relationships`
--

CREATE TABLE `tinyblog_relationships` (
  `cid` int(10) UNSIGNED NOT NULL,
  `mid` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tinyblog_relationships`
--

INSERT INTO `tinyblog_relationships` (`cid`, `mid`) VALUES
(1, 1),
(2, 1);

-- --------------------------------------------------------

--
-- 表的结构 `tinyblog_users`
--

CREATE TABLE `tinyblog_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(32) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `screen_name` varchar(32) DEFAULT NULL,
  `created` int(10) UNSIGNED DEFAULT '0',
  `activated` int(10) UNSIGNED DEFAULT '0',
  `logged` int(10) UNSIGNED DEFAULT '0',
  `group` varchar(16) DEFAULT 'visitor',
  `remember_token` varchar(64) DEFAULT NULL,
  `api_token` varchar(64) DEFAULT NULL,
  `updated_at` varchar(32)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tinyblog_users`
--

INSERT INTO `tinyblog_users` (`id`, `username`, `password`, `email`, `url`, `screen_name`, `created`, `activated`, `logged`, `group`, `remember_token`) VALUES
(1, 'admin', '$2y$10$iOvKstZJVCXbubZDwvGrj.abZW.fq0Lzoxa545lMjhA9OHK3EHvPK', 'webmaster@yourdomain.com', 'http://www.typecho.org', 'admin', 1474092469, 1577169439, 1478149722, 'administrator', '9165dc2807e6c9b9cbeb41ddf4172253');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tinyblog_comments`
--
ALTER TABLE `tinyblog_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cid` (`cid`),
  ADD KEY `created` (`created`);

--
-- Indexes for table `tinyblog_contents`
--
ALTER TABLE `tinyblog_contents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created` (`created`);

--
-- Indexes for table `tinyblog_fields`
--
ALTER TABLE `tinyblog_fields`
  ADD PRIMARY KEY (`id`,`name`),
  ADD KEY `int_value` (`int_value`),
  ADD KEY `float_value` (`float_value`);

--
-- Indexes for table `tinyblog_img`
--
ALTER TABLE `tinyblog_img`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tinyblog_like_record`
--
ALTER TABLE `tinyblog_like_record`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aid` (`article_id`);

--
-- Indexes for table `tinyblog_metas`
--
ALTER TABLE `tinyblog_metas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tinyblog_options`
--
ALTER TABLE `tinyblog_options`
  ADD PRIMARY KEY (`name`,`user`);

--
-- Indexes for table `tinyblog_read_record`
--
ALTER TABLE `tinyblog_read_record`
  ADD PRIMARY KEY (`id`),
  ADD KEY `article id` (`article_id`);

--
-- Indexes for table `tinyblog_relationships`
--
ALTER TABLE `tinyblog_relationships`
  ADD PRIMARY KEY (`cid`,`mid`);

--
-- Indexes for table `tinyblog_users`
--
ALTER TABLE `tinyblog_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `tinyblog_comments`
--
ALTER TABLE `tinyblog_comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `tinyblog_contents`
--
ALTER TABLE `tinyblog_contents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `tinyblog_img`
--
ALTER TABLE `tinyblog_img`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `tinyblog_like_record`
--
ALTER TABLE `tinyblog_like_record`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `tinyblog_metas`
--
ALTER TABLE `tinyblog_metas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `tinyblog_read_record`
--
ALTER TABLE `tinyblog_read_record`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `tinyblog_users`
--
ALTER TABLE `tinyblog_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
