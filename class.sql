/*
SQLyog Enterprise v12.09 (64 bit)
MySQL - 5.0.24-community-nt : Database - class
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`class` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `class`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id` int(11) NOT NULL auto_increment,
  `adminName` varchar(255) default NULL,
  `passWord` varchar(255) default NULL,
  `realName` varchar(255) default NULL,
  `type` int(11) NOT NULL,
  `isDelete` int(11) NOT NULL,
  `category_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_gc460b7dq1wklny5wbpb4g47h` (`category_id`),
  CONSTRAINT `FK_gc460b7dq1wklny5wbpb4g47h` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `admin` */

insert  into `admin`(`id`,`adminName`,`passWord`,`realName`,`type`,`isDelete`,`category_id`) values (1,'fff','111','总管理员',999,0,NULL),(2,'FrontAdmin','111','前端开发版块管理员',1,0,1),(3,'EndAdmin','111','后端开发版块管理员',1,0,2),(4,'SqlAdmin','111','数据库版块管理员',1,0,3),(5,'TestAdmin','111','运维板块管理员',1,0,4),(6,'CloudAdmin','111','云计算版块管理员',1,0,5);

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `id` int(11) NOT NULL auto_increment,
  `cname` varchar(255) default NULL,
  `isDelete` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `category` */

insert  into `category`(`id`,`cname`,`isDelete`) values (1,'前端开发',0),(2,'后端开发',0),(3,'数据库',0),(4,'运维',0),(5,'云计算',0);

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `id` int(11) NOT NULL auto_increment,
  `content` varchar(255) default NULL,
  `createTime` datetime default NULL,
  `isDelete` int(11) NOT NULL,
  `user_id` int(11) default NULL,
  `news_id` int(11) default NULL,
  `category_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_mxoojfj9tmy8088avf57mpm02` (`user_id`),
  KEY `FK_k22vqyb6s1ff1ppqlfnfvn8ct` (`news_id`),
  KEY `FK_6je21gh9v43c1juci06dm1u10` (`category_id`),
  CONSTRAINT `FK_6je21gh9v43c1juci06dm1u10` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `FK_k22vqyb6s1ff1ppqlfnfvn8ct` FOREIGN KEY (`news_id`) REFERENCES `news` (`id`),
  CONSTRAINT `FK_mxoojfj9tmy8088avf57mpm02` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `comment` */

insert  into `comment`(`id`,`content`,`createTime`,`isDelete`,`user_id`,`news_id`,`category_id`) values (1,'666666666','2017-12-20 18:38:22',1,2,19,5),(2,'我觉得还行','2017-12-20 20:59:41',0,1,21,5),(3,'内容不大齐全','2017-12-20 15:16:08',0,1,4,1),(4,'不错','2017-12-22 16:35:18',0,8,4,1),(5,'153131','2017-12-22 16:38:45',0,8,4,1);

/*Table structure for table `introduce` */

DROP TABLE IF EXISTS `introduce`;

CREATE TABLE `introduce` (
  `id` int(11) NOT NULL auto_increment,
  `addTime` datetime default NULL,
  `content` varchar(5000) default NULL,
  `imageUrl` varchar(255) default NULL,
  `title` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `introduce` */

insert  into `introduce`(`id`,`addTime`,`content`,`imageUrl`,`title`) values (1,'2017-12-20 23:10:34','<p>当今社会，随着科技不断进步和发展，互联网的水平也在日新月异的不断提高和进步。在线微课学习在人们的学习和工作中有着举足轻重、无可替代的作用，其便捷性、专业性越来越受到了人们的关注和青睐。人们的学习和工作日渐的繁忙，很多的人没有多余的时间和精力去图书馆、咖啡厅等地方学习所需要的知识。因此，在线的微课课程应运而生，不仅可以让人们随时随地学习自己所需要的知识，台式电脑、笔记本电脑、平板、手机都是可以选择的媒介，不必花太多时间去了解自己所需学习的知识的结构，在线微课课程对各种课程进行了模块的划分和知识树体系的分层，让人们可以循循渐进的学习自己想学的知识又不必担心学不会学不懂的烦恼。同时可以在线对一些问题进行提问，一起学习的人可以一起解答，一起讨论，及时解决不会的问题。</p>','\\upload\\front1.png','在线课程管理系统'),(2,'2017-12-20 23:10:34','<p>当今社会，随着科技不断进步和发展，互联网的水平也在日新月异的不断提高和进步。在线微课学习在人们的学习和工作中有着举足轻重、无可替代的作用，其便捷性、专业性越来越受到了人们的关注和青睐。人们的学习和工作日渐的繁忙，很多的人没有多余的时间和精力去图书馆、咖啡厅等地方学习所需要的知识。因此，在线的微课课程应运而生，不仅可以让人们随时随地学习自己所需要的知识，台式电脑、笔记本电脑、平板、手机都是可以选择的媒介，不必花太多时间去了解自己所需学习的知识的结构，在线微课课程对各种课程进行了模块的划分和知识树体系的分层，让人们可以循循渐进的学习自己想学的知识又不必担心学不会学不懂的烦恼。同时可以在线对一些问题进行提问，一起学习的人可以一起解答，一起讨论，及时解决不会的问题。</p>','\\upload\\java1.png','在线课程管理系统'),(3,'2017-12-20 23:10:34','<p>当今社会，随着科技不断进步和发展，互联网的水平也在日新月异的不断提高和进步。在线微课学习在人们的学习和工作中有着举足轻重、无可替代的作用，其便捷性、专业性越来越受到了人们的关注和青睐。人们的学习和工作日渐的繁忙，很多的人没有多余的时间和精力去图书馆、咖啡厅等地方学习所需要的知识。因此，在线的微课课程应运而生，不仅可以让人们随时随地学习自己所需要的知识，台式电脑、笔记本电脑、平板、手机都是可以选择的媒介，不必花太多时间去了解自己所需学习的知识的结构，在线微课课程对各种课程进行了模块的划分和知识树体系的分层，让人们可以循循渐进的学习自己想学的知识又不必担心学不会学不懂的烦恼。同时可以在线对一些问题进行提问，一起学习的人可以一起解答，一起讨论，及时解决不会的问题。</p>','\\upload\\introduce.png','在线课程管理系统');

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` int(11) NOT NULL auto_increment,
  `addTime` datetime default NULL,
  `content` text,
  `videoUrl` varchar(50) default NULL,
  `imageUrl` varchar(255) default NULL,
  `status` int(11) NOT NULL,
  `title` varchar(255) default NULL,
  `isDelete` int(11) NOT NULL,
  `category_id` int(11) default NULL,
  `user_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_akjkug4a1nqdaflnp1b55sphs` (`category_id`),
  KEY `FK_l4y0pyrfrk6c7egnf41thnfph` (`user_id`),
  CONSTRAINT `FK_akjkug4a1nqdaflnp1b55sphs` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `FK_l4y0pyrfrk6c7egnf41thnfph` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `news` */

insert  into `news`(`id`,`addTime`,`content`,`videoUrl`,`imageUrl`,`status`,`title`,`isDelete`,`category_id`,`user_id`) values (1,'2017-12-20 18:18:01','超文本标记语言，标准通用标记语言下的一个应用。<br>“超文本”就是指页面内可以包含图片、链接，甚至音乐、程序等非文字元素。<br>超文本标记语言的结构包括“头”部分（英语：Head）、和“主体”部分（英语：Body），其中“头”部提供关于网页的信息，“主体”部分提供网页的具体内容。','123456','\\upload\\front1.png',1,'html.css.js基础入门',0,1,1),(3,'2017-12-20 18:19:07','jQuery是一个快速、简洁的JavaScript框架，是继Prototype之后又一个优秀的JavaScript代码库（或JavaScript框架）。jQuery设计的宗旨是“write Less，Do More”，即倡导写更少的代码，做更多的事情。它封装JavaScript常用的功能代码，提供一种简便的JavaScript设计模式，优化HTML文档操作、事件处理、动画设计和Ajax交互.<br>jQuery的核心特性可以总结为：具有独特的链式语法和短小清晰的多功能接口；具有高效灵活的css选择器，并且可对CSS选择器进行扩展；拥有便捷的插件扩展机制和丰富的插件。jQuery兼容各种主流浏览器，如IE 6.0+、FF 1.5+、Safari 2.0+、Opera 9.0+等。',NULL,'\\upload\\front3.png',1,'JQuery基础入门',0,1,1),(4,'2017-12-20 18:19:27','Bootstrap，来自 Twitter，是目前很受欢迎的前端框架。Bootstrap 是基于 HTML、CSS、JavaScript 的，它简洁灵活，使得 Web 开发更加快捷。  它由Twitter的设计师Mark Otto和Jacob Thornton合作开发，是一个CSS/HTML框架。Bootstrap提供了优雅的HTML和CSS规范，它即是由动态CSS语言Less写成。Bootstrap一经推出后颇受欢迎，一直是GitHub上的热门开源项目，包括NASA的MSNBC（微软全国广播公司）的Breaking News都使用了该项目。  国内一些移动开发者较为熟悉的框架，如WeX5前端开源框架等，也是基于Bootstrap源码进行性能优化而来。','\\upload\\01.mp4','\\upload\\front2.jpg',0,'bootstrap快速入门',0,1,1),(5,'2017-12-20 18:21:30','Python  （英国发音：/ˈpaɪθən/ 美国发音：/ˈpaɪθɑːn/）, 是一种面向对象的解释型计算机程序设计语言，由荷兰人Guido van Rossum于1989年发明，第一个公开发行版发行于1991年。\r\nPython是纯粹的自由软件， 源代码和解释器CPython遵循 GPL(GNU General Public License)协议[2]  。Python语法简洁清晰，特色之一是强制用空白符(white space)作为语句缩进。\r\nPython具有丰富和强大的库。它常被昵称为胶水语言，能够把用其他语言制作的各种模块（尤其是C/C++）很轻松地联结在一起。常见的一种应用情形是，使用Python快速生成程序的原型（有时甚至是程序的最终界面），然后对其中  有特别要求的部分，用更合适的语言改写，比如3D游戏中的图形渲染模块，性能要求特别高，就可以用C/C++重写，而后封装为Python可以调用的扩展类库。需要注意的是在您使用扩展类库时可能需要考虑平台问题，某些可能不提供跨平台的实现。\r\n7月20日，IEEE发布2017年编程语言排行榜：Python高居首位',NULL,'\\upload\\end3.png',0,'Python数据分析',0,2,1),(6,'2017-12-20 18:22:15','PHP（外文名:PHP: Hypertext Preprocessor，中文名：“超文本预处理器”）是一种通用开源脚本语言。语法吸收了C语言、Java和Perl的特点，利于学习，使用广泛，主要适用于Web开发领域。PHP 独特的语法混合了C、Java、Perl以及PHP自创的语法。它可以比CGI或者Perl更快速地执行动态网页。用PHP做出的动态页面与其他的编程语言相比，PHP是将程序嵌入到HTML（标准通用标记语言下的一个应用）文档中去执行，执行效率比完全生成HTML标记的CGI要高许多；PHP还可以执行编译后代码，编译可以达到加密和优化代码运行，使代码运行更快。',NULL,'\\upload\\end2.png',0,'PHP后台入门',0,2,1),(7,'2017-12-20 18:22:37','Java EE（Java Platform，Enterprise Edition）是sun公司（2009年4月20日甲骨文将其收购）推出的企业级应用程序版本。这个版本以前称为 J2EE。能够帮助我们开发和部署可移植、健壮、可伸缩且安全的服务器端 Java应用程序。Java EE 是在 Java SE 的基础上构建的，它提供Web 服务、组件模型、管理和通信 API，可以用来实现企业级的面向服务体系结构（service-oriented architecture，SOA）和 Web 3.0应用程序。<br>Java，是由Sun Microsystems公司于1995年5月推出的Java程序设计语言和Java平台的总称。用Java实现的HotJava浏览器（支持Java applet）显示了Java的魅力：跨平台、动态的Web、Internet计算。从此，Java被广泛接受并推动了Web的迅速发展，常用的浏览器现在均支持Java applet。',NULL,'\\upload\\java1.png',1,'JAVA EE全面教程',0,2,1),(9,'2017-12-20 18:23:44','MySQL是一个关系型数据库管理系统，由瑞典MySQL AB 公司开发，目前属于 Oracle 旗下产品。MySQL 是最流行的关系型数据库管理系统之一，在 WEB 应用方面，MySQL是最好的 RDBMS (Relational Database Management System，关系数据库管理系统) 应用软件。\r\nMySQL是一种关系数据库管理系统，关系数据库将数据保存在不同的表中，而不是将所有数据放在一个大仓库内，这样就增加了速度并提高了灵活性。\r\nMySQL所使用的 SQL 语言是用于访问数据库的最常用标准化语言。MySQL 软件采用了双授权政策，分为社区版和商业版，由于其体积小、速度快、总体拥有成本低，尤其是开放源码这一特点，一般中小型网站的开发都选择 MySQL 作为网站数据库。\r\n由于其社区版的性能卓越，搭配 PHP 和 Apache 可组成良好的开发环境。',NULL,'\\upload\\sql3.png',0,'Mysql开发技巧',0,3,1),(10,'2017-12-20 18:24:01','甲骨文公司，全称甲骨文股份有限公司(甲骨文软件系统有限公司)，是全球最大的企业级软件公司，总部位于美国加利福尼亚州的红木滩。1989年正式进入中国市场。2013年，甲骨文已超越 IBM ，成为继 Microsoft 后全球第二大软件公司。\r\n2017年6月7日发布的2017年美国《财富》500强，甲骨文公司排名第81位。  2017年6月，《2017年BrandZ最具价值全球品牌100强》公布，甲骨文公司排名第46位。',NULL,'\\upload\\sql2.png',0,'Oracle高级查询',0,3,1),(11,'2017-12-20 18:24:13','MongoDB 是一个基于分布式文件存储的数据库。由C++语言编写。旨在为WEB应用提供可扩展的高性能数据存储解决方案。\r\nMongoDB是一个介于关系数据库和非关系数据库之间的产品，是非关系数据库当中功能最丰富，最像关系数据库的。他支持的数据结构非常松散，是类似json的bson格式，因此可以存储比较复杂的数据类型。Mongo最大的特点是他支持的查询语言非常强大，其语法有点类似于面向对象的查询语言，几乎可以实现类似关系数据库单表查询的绝大部分功能，而且还支持对数据建立索引。',NULL,'\\upload\\sql1.png',1,'Mongo DB复制集',0,3,1),(15,'2017-12-20 18:26:30','游戏测试作为软件测试的一部分，它具备了软件测试所有的共同的特性：测试的目的是发现软件中存在的缺陷。测试都是需要测试人员按照产品行为描述来实施。产品行为描述可以是书面的规格说明书，需求文档，产品文件，或是用户手册，源代码，或是工作的可执行程序。',NULL,'\\upload\\test1.png',1,'游戏测试入门',0,4,1),(19,'2017-12-20 18:30:03','Python   是一种面向对象的解释型计算机程序设计语言，由荷兰人Guido van Rossum于1989年发明，第一个公开发行版发行于1991年。\r\nPython是纯粹的自由软件， 源代码和解释器CPython遵循 GPL(GNU General Public License)协议。Python语法简洁清晰，特色之一是强制用空白符(white space)作为语句缩进。\r\nPython具有丰富和强大的库。它常被昵称为胶水语言，能够把用其他语言制作的各种模块（尤其是C/C++）很轻松地联结在一起。常见的一种应用情形是，使用Python快速生成程序的原型（有时甚至是程序的最终界面），然后对其中有特别要求的部分，用更合适的语言改写，比如3D游戏中的图形渲染模块，性能要求特别高，就可以用C/C++重写，而后封装为Python可以调用的扩展类库。需要注意的是在您使用扩展类库时可能需要考虑平台问题，某些可能不提供跨平台的实现。\r\n7月20日，IEEE发布2017年编程语言排行榜：Python高居首位  。',NULL,'\\upload\\cloud3.png',1,'Python数据分析',0,5,1),(20,'2017-12-20 18:30:17','Docker 是一个开源的应用容器引擎，让开发者可以打包他们的应用以及依赖包到一个可移植的容器中，然后发布到任何流行的 Linux 机器上，也可以实现虚拟化。容器是完全使用沙箱机制，相互之间不会有任何接口。',NULL,'\\upload\\cloud2.png',1,'Docker入门',0,5,1),(21,'2017-12-20 20:56:30',' sqlmap是一个自动化的SQL注入工具，其主要功能是扫描，发现并利用给定的URL的SQL注入漏洞，目前支持的数据库是MySQL, Oracle, PostgreSQL, Microsoft SQL Server, Microsoft Access, IBM DB2, SQLite, Firebird, Sybase和SAP MaxDB。采用五种独特的SQL注入技术，分别是：<br/>\r\n\r\n   1）基于布尔的盲注，即可以根据返回页面判断条件真假的注入。<br/>\r\n   2）基于时间的盲注，即不能根据页面返回内容判断任何信息，用条件语句查看时间延迟语句是否执行（即页面返回时间是否增加）来判断。<br/>\r\n   3）基于报错注入，即页面会返回错误信息，或者把注入的语句的结果直接返回在页面中。<br/>\r\n   4）联合查询注入，可以使用union的情况下的注入。<br/>\r\n   5）堆查询注入，可以同时执行多条语句的执行时的注入。<br/>',NULL,'\\upload\\cloud1.png',1,'HBase入门',0,5,3),(22,'2017-12-21 22:11:39','sqlmap是一个自动化的SQL注入工具，其主要功能是扫描，发现并利用给定的URL的SQL注入漏洞，目前支持的数据库是MySQL, Oracle, PostgreSQL, Microsoft SQL Server, Microsoft Access, IBM DB2, SQLite, Firebird, Sybase和SAP MaxDB。采用五种独特的SQL注入技术，分别是：\r\n   1）基于布尔的盲注，即可以根据返回页面判断条件真假的注入。\r\n   2）基于时间的盲注，即不能根据页面返回内容判断任何信息，用条件语句查看时间延迟语句是否执行（即页面返回时间是否增加）来判断。\r\n   3）基于报错注入，即页面会返回错误信息，或者把注入的语句的结果直接返回在页面中。\r\n   4）联合查询注入，可以使用union的情况下的注入。\r\n   5）堆查询注入，可以同时执行多条语句的执行时的注入。',NULL,'\\upload\\dd03e520e65811e7a76858d0d8640d9ctest2.png',0,'浅析Sqlmap',0,4,1),(23,'2017-12-21 22:14:40','Linux是一套免费使用和自由传播的类Unix操作系统，是一个基于POSIX和UNIX的多用户、多任务、支持多线程和多CPU的操作系统。它能运行主要的UNIX工具软件、应用程序和网络协议。它支持32位和64位硬件。Linux继承了Unix以网络为核心的设计思想，是一个性能稳定的多用户网络操作系统。\r\nLinux操作系统诞生于1991 年10 月5 日（这是第一次正式向外公布时间）。Linux存在着许多不同的Linux版本，但它们都使用了Linux内核。Linux可安装在各种计算机硬件设备中，比如手机、平板电脑、路由器、视频游戏控制台、台式计算机、大型机和超级计算机。\r\n严格来讲，Linux这个词本身只表示Linux内核，但实际上人们已经习惯了用Linux来形容整个基于Linux内核，并且使用GNU 工程各种工具和数据库的操作系统。\r\n                     \r\n                     ',NULL,'\\upload\\488e4290e65911e7a76858d0d8640d9ctest3.png',0,'Linux系统管理',0,4,1);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL auto_increment,
  `email` varchar(255) default NULL,
  `loginName` varchar(255) default NULL,
  `passWord` varchar(255) default NULL,
  `phone` varchar(255) default NULL,
  `realName` varchar(255) default NULL,
  `isDelete` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`email`,`loginName`,`passWord`,`phone`,`realName`,`isDelete`) values (1,'12312@qq.com','zs','111','136564565545','张三',1),(2,'111@qq.com','lisi','111','13845642564','李四',0),(3,'1232@qq.com','test','111','13412364568','测试人员',0),(4,'111@qq.com','111','1','13545404802','123',0),(5,'331002675@qq.com','12345','1','15310130035','123456',0),(6,'331002675@qq.com','qwe','1','13537285479','qwe',0),(8,'331002675@qq.com','222','111','15625578925','11',0),(9,'331002675@qq.com','123','123','15625578925','1111',0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
