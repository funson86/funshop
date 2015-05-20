/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50539
Source Host           : localhost:3306
Source Database       : yii2_shop

Target Server Type    : MYSQL
Target Server Version : 50539
File Encoding         : 65001

Date: 2015-04-08 14:24:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `address`
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT '0',
  `name` varchar(64) DEFAULT NULL,
  `consignee` varchar(64) NOT NULL DEFAULT '',
  `country` int(11) DEFAULT '0',
  `province` int(11) DEFAULT '0',
  `city` int(11) DEFAULT '0',
  `district` int(11) DEFAULT '0',
  `address` varchar(255) DEFAULT NULL,
  `zipcode` varchar(16) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `mobile` varchar(32) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  `default` int(11) DEFAULT '0',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `address_fk_1` (`user_id`),
  CONSTRAINT `address_fk1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('1', '1', 'hahaha', 'sdfsdfs', '1', '440000', '440200', '440204', '大兴城501', '123422', null, '13246897856', null, '0', '1424055736', '1424658511', '1', '1');
INSERT INTO `address` VALUES ('5', '1', '家里', 'funson', '1', '320000', '320600', '320621', '佳宁娜', '521234', null, '13246897856', null, '0', '1424657657', '1425870771', '1', '1');
INSERT INTO `address` VALUES ('6', '4', '加重', '斯蒂芬森', '1', '120000', '120100', '120103', '大兴城501', '5123234', null, '2342423423423', null, '1', '1424769886', '1424769890', '4', '4');
INSERT INTO `address` VALUES ('7', '1', '办公室', 'fage', '1', '130000', '130300', '130303', '斯蒂芬森奋斗', '5212342', '18620332432', '18620332432', 'sdfsf@qq.com', '1', '1424848814', '1426230882', '1', '1');
INSERT INTO `address` VALUES ('8', '1', 'test', '阿发', '1', '430000', '430500', '430521', '好地方', '422800', null, '13222223333', null, '0', '1424857396', '1426230876', '1', '1');

-- ----------------------------
-- Table structure for `auth_operation`
-- ----------------------------
DROP TABLE IF EXISTS `auth_operation`;
CREATE TABLE `auth_operation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11406 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_operation
-- ----------------------------
INSERT INTO `auth_operation` VALUES ('111', '0', 'basic');
INSERT INTO `auth_operation` VALUES ('113', '0', 'user');
INSERT INTO `auth_operation` VALUES ('114', '0', 'role');
INSERT INTO `auth_operation` VALUES ('11101', '111', 'backendLogin');
INSERT INTO `auth_operation` VALUES ('11302', '113', 'viewUser');
INSERT INTO `auth_operation` VALUES ('11303', '113', 'createUser');
INSERT INTO `auth_operation` VALUES ('11304', '113', 'updateUser');
INSERT INTO `auth_operation` VALUES ('11305', '113', 'deleteUser');
INSERT INTO `auth_operation` VALUES ('11402', '114', 'viewRole');
INSERT INTO `auth_operation` VALUES ('11403', '114', 'createRole');
INSERT INTO `auth_operation` VALUES ('11404', '114', 'updateRole');
INSERT INTO `auth_operation` VALUES ('11405', '114', 'deleteRole');

-- ----------------------------
-- Table structure for `auth_role`
-- ----------------------------
DROP TABLE IF EXISTS `auth_role`;
CREATE TABLE `auth_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `operation_list` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_role
-- ----------------------------
INSERT INTO `auth_role` VALUES ('1', 'Super Admin', '', 'all');
INSERT INTO `auth_role` VALUES ('3', 'Normal Admin', '', 'backendLogin;viewUser;viewRole');

-- ----------------------------
-- Table structure for `bonus`
-- ----------------------------
DROP TABLE IF EXISTS `bonus`;
CREATE TABLE `bonus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `bonus_type_id` int(11) NOT NULL,
  `money` decimal(10,2) NOT NULL,
  `min_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `started_at` int(11) NOT NULL,
  `ended_at` int(11) NOT NULL,
  `sn` varchar(255) DEFAULT NULL,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `used_at` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bonus_fk_1` (`user_id`),
  KEY `bonus_fk_2` (`bonus_type_id`),
  CONSTRAINT `bonus_fk2` FOREIGN KEY (`bonus_type_id`) REFERENCES `bonus_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10000017 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bonus
-- ----------------------------
INSERT INTO `bonus` VALUES ('10000011', '0', '3', '50.00', '500.00', '1442483647', '1447483647', 'w6ORs_UX', '0', '0', '1425884506', '1425884506', '1', '1');
INSERT INTO `bonus` VALUES ('10000012', '0', '3', '50.00', '500.00', '1442483647', '1447483647', 'n2P9SIUo', '0', '0', '1425884506', '1425884506', '1', '1');
INSERT INTO `bonus` VALUES ('10000013', '0', '3', '50.00', '500.00', '1442483647', '1447483647', 'RWXzKuqX', '0', '0', '1425884506', '1425884506', '1', '1');
INSERT INTO `bonus` VALUES ('10000014', '0', '3', '50.00', '500.00', '1442483647', '1447483647', 'iVPqeeGl', '0', '0', '1425884506', '1425884506', '1', '1');
INSERT INTO `bonus` VALUES ('10000015', '0', '3', '50.00', '500.00', '1442483647', '1447483647', 'IU2pkCB5', '0', '0', '1425884506', '1425884506', '1', '1');
INSERT INTO `bonus` VALUES ('10000016', '1', '2', '30.00', '300.00', '2147483647', '2147483647', null, '0', '0', '1425884550', '1425884550', '1', '1');

-- ----------------------------
-- Table structure for `bonus_type`
-- ----------------------------
DROP TABLE IF EXISTS `bonus_type`;
CREATE TABLE `bonus_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `money` decimal(10,2) NOT NULL,
  `min_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `type` int(11) NOT NULL DEFAULT '1',
  `started_at` int(11) NOT NULL,
  `ended_at` int(11) NOT NULL,
  `min_goods_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bonus_type
-- ----------------------------
INSERT INTO `bonus_type` VALUES ('1', '用户红包', '10.00', '100.00', '1', '2147483647', '2147483647', '0.00', '1425627458', '1425627458', '1', '1');
INSERT INTO `bonus_type` VALUES ('2', '订单金额红包', '30.00', '300.00', '3', '2147483647', '2147483647', '200.00', '1425631730', '1425631747', '1', '1');
INSERT INTO `bonus_type` VALUES ('3', '线下代码', '50.00', '500.00', '4', '1442483647', '1447483647', '0.00', '1425632582', '1425632608', '1', '1');

-- ----------------------------
-- Table structure for `brand`
-- ----------------------------
DROP TABLE IF EXISTS `brand`;
CREATE TABLE `brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `description` text,
  `url` varchar(255) DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '50',
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brand
-- ----------------------------
INSERT INTO `brand` VALUES ('1', '爱他美', '', '爱他美', '', '50', '1', '1427248346', '1427248346');
INSERT INTO `brand` VALUES ('2', '牛栏', null, '牛栏', null, '50', '1', '1427248346', '1427248346');
INSERT INTO `brand` VALUES ('3', '飞利浦', '', '', '', '50', '1', '1427266554', '1427266554');

-- ----------------------------
-- Table structure for `cart`
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT '0',
  `session_id` varchar(255) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `name` varchar(255) NOT NULL,
  `number` int(11) NOT NULL DEFAULT '1',
  `market_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `thumb` varchar(255) DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_fk_1` (`user_id`),
  KEY `cart_fk_2` (`session_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES ('1', '9', 'r8s37d6stbvjniijbc1g60of31', '3', 'iphone6', 'iPhone 6', '3', '8666.00', '5999.00', '/upload/201502/small-iphone61.jpg', '0', '1425198818', '1425198818');

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL,
  `brief` varchar(255) DEFAULT NULL,
  `is_nav` int(11) NOT NULL DEFAULT '1',
  `banner` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `description` text,
  `redirect_url` varchar(255) DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '50',
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '0', '手机', 'mobile', '1', '', '', '', '', '50', '1', '1422858315', '1422858315', '0', '0');
INSERT INTO `category` VALUES ('2', '0', '电脑', 'computer', '1', '', '', '', '', '50', '1', '1422858539', '1422858539', '0', '0');
INSERT INTO `category` VALUES ('3', '1', '苹果', 'iphone', '1', '', '', '', '', '50', '1', '1422858566', '1422858566', '0', '0');
INSERT INTO `category` VALUES ('4', '1', '三星', 'sansung', '1', '', '', '', '', '50', '1', '1422858593', '1422858593', '0', '0');
INSERT INTO `category` VALUES ('5', '2', '台式机', '', '0', '', '', '台式机电脑', '', '50', '1', '1424857244', '1424857244', '0', '0');
INSERT INTO `category` VALUES ('6', '2', '笔记本', '', '0', '', '', '笔记本电脑', '', '50', '1', '1424857273', '1424857273', '0', '0');
INSERT INTO `category` VALUES ('7', '2', '上网本', '', '0', '', '', '', '', '50', '1', '1424857318', '1424857318', '0', '0');

-- ----------------------------
-- Table structure for `cms_catalog`
-- ----------------------------
DROP TABLE IF EXISTS `cms_catalog`;
CREATE TABLE `cms_catalog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `brief` varchar(1022) DEFAULT NULL,
  `content` text,
  `seo_title` varchar(255) DEFAULT NULL,
  `seo_keywords` varchar(255) DEFAULT NULL,
  `seo_description` varchar(255) DEFAULT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `is_nav` int(11) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '50',
  `page_type` varchar(255) NOT NULL DEFAULT 'page',
  `page_size` int(11) NOT NULL DEFAULT '10',
  `template_list` varchar(255) NOT NULL DEFAULT 'list',
  `template_show` varchar(255) NOT NULL DEFAULT 'show',
  `template_page` varchar(255) NOT NULL DEFAULT 'page',
  `redirect_url` varchar(255) DEFAULT NULL,
  `click` int(11) DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `is_nav` (`is_nav`),
  KEY `sort_order` (`sort_order`),
  KEY `status` (`status`),
  KEY `created_at` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_catalog
-- ----------------------------
INSERT INTO `cms_catalog` VALUES ('1', '0', '新手指南', 'getting_start', '', '', '', '', '', null, '1', '50', 'page', '10', 'list', 'show', 'page', '', '0', '1', '1425949502', '1425950562');
INSERT INTO `cms_catalog` VALUES ('2', '0', '配送政策', 'shipment', '', '', '', '', '', null, '1', '50', 'page', '10', 'list', 'show', 'page', '', '0', '1', '1425949533', '1425949533');
INSERT INTO `cms_catalog` VALUES ('3', '0', '支付方式', 'payment', '', '', '', '', '', null, '1', '50', 'page', '10', 'list', 'show', 'page', '', '0', '1', '1425949596', '1425949596');
INSERT INTO `cms_catalog` VALUES ('4', '0', '售后服务', 'after_sales', '', '', '', '', '', null, '1', '50', 'page', '10', 'list', 'show', 'page', '', '0', '1', '1425949619', '1425950281');
INSERT INTO `cms_catalog` VALUES ('5', '0', '关于商城', 'about_shop', '', '', '', '', '', null, '1', '50', 'page', '10', 'list', 'show', 'page', '', '0', '1', '1425949660', '1425949660');
INSERT INTO `cms_catalog` VALUES ('11', '1', '免费注册', 'register', '', '<p><input alt=\"\" src=\"http://hikeblog.qiniudn.com/funshopregister1.png\" type=\"image\" /></p>\r\n', '', '', '', '', '1', '50', 'page', '10', 'list', 'show', 'page', '', '0', '1', '1425950646', '1425958287');
INSERT INTO `cms_catalog` VALUES ('12', '1', '购物流程', 'flow', '', 'content', '', '', '', null, '1', '50', 'page', '10', 'list', 'show', 'page', '', '0', '1', '1425950891', '1425951005');
INSERT INTO `cms_catalog` VALUES ('13', '1', '会员积分', 'point', '', '<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<strong>1、什么是会员积分？</strong><br />\r\n<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;所有会员在称本商城购物，并确认收货后，均可获得等同于购买商品实际支付金额的积分数。</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;同时本商城会定期推出各类积分兑换活动，请随时关注活动公告。</p>\r\n\r\n<p><br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>2、如何获得积分？</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;<strong>（1）购买商品积分</strong></p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; A、每一张成功交易并确认收货的订单，都可获得积分，即您确认收货后才能获得积分，而不是付款后。</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; B、不同商品积分标准不同，获得积分以订单提交时所注明的积分为准。（如：购买本商品可得 78 积分）</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; C、同笔订单同款商品购买多件，可获得相应倍数的积分。</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;<strong>（2）商品交易评价积分 </strong><br />\r\n<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;购买过的商品，撰写您对商品的评价，您将获得每件商品5个积分的奖励。上传图片的精彩评价，还将获得每件商品25个积分的额外奖励。同笔订单同款商品只能评价一次。</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;<strong>（3）活动积分赠送 </strong><br />\r\n<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 参与相关活动您可以获得丰厚的积分奖励，请经常关注丽子首页活动。</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;<strong> （4）玩游戏得积分 </strong><br />\r\n<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;去丽子问答与姐妹们分享美妆心得，还能得积分。<a href=\"http://www.lizi.com/ask\" target=\"_blank\">点这里去问答逛逛吧~</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;<strong> （5）LiZi问答得积分 </strong><br />\r\n<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;您可以在&ldquo;我的丽子&mdash;&mdash;账户管理&mdash;&mdash;我的积分&rdquo; &nbsp; &nbsp;查看您的累计积分。</p>\r\n\r\n<p><br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>3、如何查看积分 </strong><br />\r\n<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;您可以在&ldquo;我的丽子&mdash;&mdash;账户管理&mdash;&mdash;我的积分&rdquo;查看您的累计积分。</p>\r\n\r\n<p><br />\r\n<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>4、积分使用 </strong><br />\r\n<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;会员积分可以抵现金使用， 100个积分=1元。<br />\r\n<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>积分使用步骤：</strong>在商品详情页面<br />\r\n<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 点击加入购物车按钮&mdash;&gt;去购物车结算&mdash;&gt;我的购物车&mdash;&gt;去结算&mdash;&gt;使用积分（页面左下角，输入使用积分数量，点击使用）。</p>\r\n\r\n<p><br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>订单退款积分处理方式：</strong>订单付款前取消，积分自动返还；订单付款后，订单发生取消、退款、退货等状态变化，积分不再返还。</p>\r\n\r\n<p><br />\r\n&nbsp;<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>5、免责声明 </strong><br />\r\n<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;本商城感谢您访问会员积分计划，本计划由本商城提供。以上计划条款和条件，连同计划有关的任何促销内容的相应条款和条件，</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;构成本计划会员与本商城之间关于制度的完整协议。如果您使用本商城，您就参加了本计划并接受了这些条款、条件、限制和要求。</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;请注意，您本商城的使用以及您的会员资格还受制于本商城网站上更新的所有条款、条件、限制和要求，请仔细阅读这些条款和条件。</p>\r\n', '', '', '', null, '1', '50', 'page', '10', 'list', 'show', 'page', '', '0', '1', '1425950891', '1425951005');
INSERT INTO `cms_catalog` VALUES ('14', '1', '优惠券使用', 'bonus', '', 'content', '', '', '', null, '1', '50', 'page', '10', 'list', 'show', 'page', '', '0', '1', '1425950891', '1425951005');
INSERT INTO `cms_catalog` VALUES ('15', '1', '常见问题', 'faq', '', 'content', '', '', '', null, '1', '50', 'page', '10', 'list', 'show', 'page', '', '0', '1', '1425950891', '1425951005');
INSERT INTO `cms_catalog` VALUES ('21', '2', '包邮说明', 'shipment_free', '', 'content', '', '', '', null, '1', '50', 'page', '10', 'list', 'show', 'page', '', '0', '1', '1425950891', '1425951005');
INSERT INTO `cms_catalog` VALUES ('22', '2', '配送范围', 'shipment_area', '', 'content', '', '', '', null, '1', '50', 'page', '10', 'list', 'show', 'page', '', '0', '1', '1425950891', '1425951005');
INSERT INTO `cms_catalog` VALUES ('23', '2', '配送费用', 'shipment_fee', '', 'content', '', '', '', null, '1', '50', 'page', '10', 'list', 'show', 'page', '', '0', '1', '1425950891', '1425951005');
INSERT INTO `cms_catalog` VALUES ('24', '2', '验货与签收', 'shipment_receive', '', 'content', '', '', '', null, '1', '50', 'page', '10', 'list', 'show', 'page', '', '0', '1', '1425950891', '1425951005');
INSERT INTO `cms_catalog` VALUES ('25', '2', '配送查询', 'shipment_search', '', 'content', '', '', '', null, '1', '50', 'page', '10', 'list', 'show', 'page', '', '0', '1', '1425950891', '1425951005');
INSERT INTO `cms_catalog` VALUES ('31', '3', '货到付款', 'payment_cod', '', 'content', '', '', '', null, '1', '50', 'page', '10', 'list', 'show', 'page', '', '0', '1', '1425950891', '1425951005');
INSERT INTO `cms_catalog` VALUES ('32', '3', '网上支付', 'payment_online', '', 'content', '', '', '', null, '1', '50', 'page', '10', 'list', 'show', 'page', '', '0', '1', '1425950891', '1425951005');
INSERT INTO `cms_catalog` VALUES ('41', '4', '正品保障', 'sales_quality', '', 'content', '', '', '', null, '1', '50', 'page', '10', 'list', 'show', 'page', '', '0', '1', '1425950891', '1425951005');
INSERT INTO `cms_catalog` VALUES ('42', '4', '售后政策', 'sales_return_policy', '', 'content', '', '', '', null, '1', '50', 'page', '10', 'list', 'show', 'page', '', '0', '1', '1425950891', '1425951005');
INSERT INTO `cms_catalog` VALUES ('43', '4', '退换货流程', 'sales_return_flow', '', 'content', '', '', '', null, '1', '50', 'page', '10', 'list', 'show', 'page', '', '0', '1', '1425950891', '1425951005');
INSERT INTO `cms_catalog` VALUES ('44', '4', '退款说明', 'sales_return_money', '', 'content', '', '', '', null, '1', '50', 'page', '10', 'list', 'show', 'page', '', '0', '1', '1425950891', '1425951005');
INSERT INTO `cms_catalog` VALUES ('45', '4', '取消订单', 'sales_cancel_order', '', 'content', '', '', '', null, '1', '50', 'page', '10', 'list', 'show', 'page', '', '0', '1', '1425950891', '1425951005');
INSERT INTO `cms_catalog` VALUES ('51', '5', '关于我们', 'about_us', '', 'content', '', '', '', null, '1', '50', 'page', '10', 'list', 'show', 'page', '', '0', '1', '1425950891', '1425951005');
INSERT INTO `cms_catalog` VALUES ('52', '5', '联系我们', 'about_contact', '', 'content', '', '', '', null, '1', '50', 'page', '10', 'list', 'show', 'page', '', '0', '1', '1425950891', '1425951005');
INSERT INTO `cms_catalog` VALUES ('53', '5', '商务合作', 'about_cooperation', '', 'content', '', '', '', null, '1', '50', 'page', '10', 'list', 'show', 'page', '', '0', '1', '1425950891', '1425951005');
INSERT INTO `cms_catalog` VALUES ('54', '5', '人才招聘', 'about_hr', '', 'content', '', '', '', null, '1', '50', 'page', '10', 'list', 'show', 'page', '', '0', '1', '1425950891', '1425951005');
INSERT INTO `cms_catalog` VALUES ('55', '5', '商城协议', 'about_agreement', '', 'content', '', '', '', null, '1', '50', 'page', '10', 'list', 'show', 'page', '', '0', '1', '1425950891', '1425951005');

-- ----------------------------
-- Table structure for `cms_show`
-- ----------------------------
DROP TABLE IF EXISTS `cms_show`;
CREATE TABLE `cms_show` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catalog_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `surname` varchar(128) DEFAULT NULL,
  `brief` varchar(1022) DEFAULT NULL,
  `content` text,
  `seo_title` varchar(255) DEFAULT NULL,
  `seo_keywords` varchar(255) DEFAULT NULL,
  `seo_description` varchar(255) DEFAULT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `template_show` varchar(255) NOT NULL DEFAULT 'show',
  `author` varchar(255) NOT NULL DEFAULT 'admin',
  `click` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalog_id` (`catalog_id`),
  KEY `status` (`status`),
  KEY `created_at` (`created_at`),
  CONSTRAINT `FK_cms_catalog` FOREIGN KEY (`catalog_id`) REFERENCES `cms_catalog` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_show
-- ----------------------------

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `star` int(11) NOT NULL DEFAULT '5',
  `content` text NOT NULL,
  `point` int(11) NOT NULL DEFAULT '0',
  `up` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_fk_1` (`user_id`),
  KEY `comment_fk_2` (`product_id`),
  KEY `comment_fk_3` (`order_id`),
  CONSTRAINT `comment_fk1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `comment_fk2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `comment_fk3` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('2', '1', 'admin', '2', '27', '4', '非常好啊，非常好的东西', '0', '0', '1', '1424738538', '1424738538', '1', '1');
INSERT INTO `comment` VALUES ('3', '1', 'admin', '3', '28', '3', '滴答滴答滴答滴答滴答滴答滴答滴答', '0', '0', '1', '1424739533', '1424739533', '1', '1');
INSERT INTO `comment` VALUES ('4', '1', 'admin', '2', '32', '1', '挺好的商品，就是物流太慢了呀', '0', '1', '1', '1424740791', '1424746636', '1', '1');
INSERT INTO `comment` VALUES ('5', '1', 'admin', '2', '34', '3', '我的积分>账户余额ř收货地址管理商品评价@购买咨询è个人信息÷账户安全商品评价', '20', '2', '1', '1424742341', '1427445134', '1', '1');
INSERT INTO `comment` VALUES ('6', '1', 'admin', '2', '30', '4', '斯蒂芬森淡定淡定淡定淡定淡定地说', '0', '23', '1', '1424742384', '1427443279', '1', '1');
INSERT INTO `comment` VALUES ('7', '1', 'admin', '2', '33', '3', 'testdddddddddddddddsdf', '0', '0', '0', '1425455334', '1425455334', '1', '1');
INSERT INTO `comment` VALUES ('8', '1', 'admin', '3', '32', '4', '非常好用的商品呀，大屏幕很清晰', '0', '0', '0', '1425869105', '1425869105', '1', '1');

-- ----------------------------
-- Table structure for `consultation`
-- ----------------------------
DROP TABLE IF EXISTS `consultation`;
CREATE TABLE `consultation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '1',
  `question` text NOT NULL,
  `answer` text,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `consultation_fk_1` (`user_id`),
  KEY `consultation_fk_2` (`product_id`),
  CONSTRAINT `consultation_fk1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `consultation_fk2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of consultation
-- ----------------------------
INSERT INTO `consultation` VALUES ('1', '1', 'admin', '2', '1', '请问这款产品是哪儿产品的？', null, '0', '1424673654', '1424673654', '1', '1');
INSERT INTO `consultation` VALUES ('2', '1', 'admin', '2', '1', '请问还有什么需要注意的？', null, '0', '1424674334', '1424674334', '1', '1');
INSERT INTO `consultation` VALUES ('3', '1', 'admin', '2', '1', '听说这款可以干洗?', '可以', '1', '1424674365', '1424674365', '1', '1');
INSERT INTO `consultation` VALUES ('4', '1', 'admin', '2', '1', '是不是比较适合早上用？', '是的，早上比较合适', '1', '1424674371', '1424674371', '1', '1');
INSERT INTO `consultation` VALUES ('5', '1', 'admin', '1', '1', '请问这个有什么副作用吗？', '完全正品，没有副作用', '1', '1424846462', '1424846462', '1', '1');
INSERT INTO `consultation` VALUES ('6', '1', 'admin', '2', '1', '好用吗', '非常好用', '1', '1427443426', '1427443446', '1', '1');

-- ----------------------------
-- Table structure for `coupon`
-- ----------------------------
DROP TABLE IF EXISTS `coupon`;
CREATE TABLE `coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `coupon_type_id` int(11) NOT NULL,
  `money` decimal(10,2) NOT NULL,
  `min_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `started_at` int(11) NOT NULL,
  `ended_at` int(11) NOT NULL,
  `sn` varchar(255) DEFAULT NULL,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `used_at` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `coupon_fk_1` (`user_id`),
  KEY `coupon_fk_2` (`coupon_type_id`),
  CONSTRAINT `coupon_fk2` FOREIGN KEY (`coupon_type_id`) REFERENCES `coupon_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10000021 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of coupon
-- ----------------------------
INSERT INTO `coupon` VALUES ('10000011', '1', '1', '10.00', '100.00', '1425949502', '1435949502', null, '0', '0', '1426039047', '1426039047', '1', '1');
INSERT INTO `coupon` VALUES ('10000012', '4', '1', '10.00', '100.00', '1425949502', '1435949502', null, '40', '1426154778', '1426039047', '1426154778', '1', '4');
INSERT INTO `coupon` VALUES ('10000013', '4', '1', '100.00', '10000.00', '1425949502', '1435949502', null, '0', '0', '1426042246', '1426042246', '1', '1');
INSERT INTO `coupon` VALUES ('10000014', '0', '2', '20.00', '200.00', '1423949502', '1431949502', '0xF9pkRk', '0', '0', '1426042320', '1426042320', '1', '1');
INSERT INTO `coupon` VALUES ('10000015', '0', '2', '20.00', '200.00', '1423949502', '1431949502', 'm0EGgLfk', '0', '0', '1426042320', '1426042320', '1', '1');
INSERT INTO `coupon` VALUES ('10000016', '0', '2', '20.00', '200.00', '1423949502', '1431949502', '-oMfl6DY', '0', '0', '1426042320', '1426042320', '1', '1');
INSERT INTO `coupon` VALUES ('10000017', '0', '2', '20.00', '200.00', '1423949502', '1431949502', 'N5IucCqR', '0', '0', '1426042320', '1426042320', '1', '1');
INSERT INTO `coupon` VALUES ('10000018', '4', '2', '20.00', '200.00', '1423949502', '1431949502', 'aaaaaaaa', '39', '1426154344', '1426042320', '1426154344', '1', '4');
INSERT INTO `coupon` VALUES ('10000019', '1', '3', '30.00', '300.00', '1423949502', '2147483647', null, '0', '0', '1426042388', '1426042388', '1', '1');
INSERT INTO `coupon` VALUES ('10000020', '4', '3', '30.00', '300.00', '1423949502', '2147483647', null, '39', '1426154344', '1426042388', '1426154344', '1', '4');

-- ----------------------------
-- Table structure for `coupon_type`
-- ----------------------------
DROP TABLE IF EXISTS `coupon_type`;
CREATE TABLE `coupon_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `money` decimal(10,2) NOT NULL,
  `min_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `type` int(11) NOT NULL DEFAULT '1',
  `started_at` int(11) NOT NULL,
  `ended_at` int(11) NOT NULL,
  `min_goods_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of coupon_type
-- ----------------------------
INSERT INTO `coupon_type` VALUES ('1', '用户红包', '10.00', '100.00', '1', '1425949502', '1435949502', '0.00', '1426039017', '1426039017', '1', '1');
INSERT INTO `coupon_type` VALUES ('2', '随机5个', '20.00', '200.00', '4', '1423949502', '1431949502', '0.00', '1426042302', '1426042302', '1', '1');
INSERT INTO `coupon_type` VALUES ('3', '用户30', '30.00', '300.00', '1', '1423949502', '2147483647', '0.00', '1426042374', '1426042374', '1', '1');
INSERT INTO `coupon_type` VALUES ('4', '10', '10.00', '0.00', '1', '2015', '1431949502', '0.00', '1426495961', '1426495961', '1', '1');
INSERT INTO `coupon_type` VALUES ('5', '10', '0.00', '0.00', '1', '1425139200', '1431949502', '0.00', '1426496140', '1426496140', '1', '1');
INSERT INTO `coupon_type` VALUES ('6', '10', '100.00', '500.00', '1', '1427040000', '1427731199', '0.00', '1426496272', '1426496272', '1', '1');

-- ----------------------------
-- Table structure for `favorite`
-- ----------------------------
DROP TABLE IF EXISTS `favorite`;
CREATE TABLE `favorite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `attention` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `favorite_fk_1` (`user_id`),
  KEY `favorite_fk_2` (`product_id`),
  CONSTRAINT `favorite_fk1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `favorite_fk2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of favorite
-- ----------------------------
INSERT INTO `favorite` VALUES ('7', '1', '3', '0', '1425868210', '1425868210');
INSERT INTO `favorite` VALUES ('8', '1', '2', '0', '1426479342', '1426479342');

-- ----------------------------
-- Table structure for `migration`
-- ----------------------------
DROP TABLE IF EXISTS `migration`;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of migration
-- ----------------------------
INSERT INTO `migration` VALUES ('m000000_000000_base', '1422844002');
INSERT INTO `migration` VALUES ('m140608_201405_user_init', '1422844006');
INSERT INTO `migration` VALUES ('m140608_201406_rbac_init', '1422844006');
INSERT INTO `migration` VALUES ('m141208_201481_cms_init', '1425949196');
INSERT INTO `migration` VALUES ('m141208_201488_setting_init', '1425951611');
INSERT INTO `migration` VALUES ('m141208_201489_auth_init', '1422844019');

-- ----------------------------
-- Table structure for `order`
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `sn` varchar(32) NOT NULL,
  `consignee` varchar(64) NOT NULL DEFAULT '',
  `country` int(11) DEFAULT '0',
  `province` int(11) DEFAULT '0',
  `city` int(11) DEFAULT '0',
  `district` int(11) DEFAULT '0',
  `address` varchar(255) DEFAULT NULL,
  `zipcode` varchar(16) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `mobile` varchar(32) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `payment_method` int(11) DEFAULT '0',
  `payment_status` int(11) NOT NULL DEFAULT '2',
  `payment_id` int(11) DEFAULT '0',
  `payment_name` varchar(120) NOT NULL DEFAULT '',
  `payment_fee` decimal(10,2) DEFAULT '0.00',
  `shipment_status` int(11) NOT NULL DEFAULT '0',
  `shipment_id` int(11) DEFAULT '0',
  `shipment_name` varchar(255) DEFAULT NULL,
  `shipment_fee` decimal(10,2) DEFAULT '0.00',
  `amount` decimal(10,2) DEFAULT '0.00',
  `tax` decimal(10,2) DEFAULT '0.00',
  `invoice` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `paid_at` int(11) DEFAULT NULL,
  `shipped_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_fk_1` (`user_id`),
  CONSTRAINT `order_fk1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('27', '1', '201502221439094649', 'sdfsdfs', '1', '440000', '440200', '440204', '大兴城501', '123422', null, '13246897856', null, '', '1', '10', '0', '', '0.00', '0', '0', null, '8.00', '4006.00', '0.00', null, '-1', null, null, '1424587149', '1426479451', '1', '1');
INSERT INTO `order` VALUES ('28', '1', '201502221439355767', 'sdfsdfs', '1', '440000', '440200', '440204', '大兴城501', '123422', null, '13246897856', null, '', '2', '20', '0', '', '0.00', '0', '0', null, '18.00', '16012.00', '0.00', null, '10', null, null, '1424587175', '1424587175', '1', '1');
INSERT INTO `order` VALUES ('30', '1', '201502221444042625', 'sdfsdfs', '1', '440000', '440200', '440204', '大兴城501', '123422', null, '13246897856', null, '', '2', '10', '0', '', '0.00', '0', '0', null, '18.00', '8016.00', '0.00', null, '10', null, null, '1424587444', '1424587444', '1', '1');
INSERT INTO `order` VALUES ('32', '1', '201502221449543414', 'sdfsdfs', '1', '440000', '440200', '440204', '大兴城501', '123422', null, '13246897856', null, '', '2', '10', '0', '', '0.00', '60', '0', '', '18.00', '8016.00', '0.00', '', '10', null, null, '1424587794', '1424831239', '1', '1');
INSERT INTO `order` VALUES ('33', '1', '201502221451463217', 'sdfsdfs', '1', '440000', '440200', '440204', '大兴城501', '123422', null, '13246897856', null, '', '1', '10', '0', '', '0.00', '0', '0', null, '18.00', '2017.00', '0.00', null, '20', null, null, '1424587906', '1424592535', '1', '1');
INSERT INTO `order` VALUES ('34', '1', '201502230855073492', 'sdfsdfs', '1', '440000', '440200', '440204', '大兴城501', '123422', '', '13246897856', '', '', '1', '10', '0', '', '0.00', '0', '0', '', '8.00', '2007.00', '0.00', '', '20', null, null, '1424652907', '1424827129', '1', '1');
INSERT INTO `order` VALUES ('36', '1', '201502251600097369', 'sdfsdfs', '1', '440000', '440200', '440204', '大兴城501', '123422', null, '13246897856', 'admin@demo.com', '', '2', '10', '0', '', '0.00', '0', '0', null, '18.00', '6017.00', '0.00', null, '-1', null, null, '1424851209', '1425875179', '1', '1');
INSERT INTO `order` VALUES ('37', '1', '201503041600341534', 'sdfsdfs', '1', '440000', '440200', '440204', '大兴城501', '123422', null, '13246897856', 'admin@demo.com', 'haha', '1', '20', '0', '', '0.00', '0', '0', null, '8.00', '2007.00', '0.00', null, '-2', null, null, '1425456034', '1425873864', '1', '1');
INSERT INTO `order` VALUES ('38', '1', '201503091557582523', 'sdfsdfs', '1', '440000', '440200', '440204', '大兴城501', '123422', null, '13246897856', 'admin@demo.com', '', '1', '20', '0', '', '0.00', '70', '0', null, '8.00', '30003.00', '0.00', null, '70', null, null, '1425887878', '1427876009', '1', '1');
INSERT INTO `order` VALUES ('39', '4', '201503121759044018', '斯蒂芬森', '1', '120000', '120100', '120103', '大兴城501', '5123234', null, '2342423423423', 'shflg1234@163.com', '', '1', '20', '0', '', '0.00', '0', '0', null, '8.00', '5956.95', '0.00', null, '20', null, null, '1426154344', '1426154344', '4', '4');
INSERT INTO `order` VALUES ('40', '4', '201503121806182492', '斯蒂芬森', '1', '120000', '120100', '120103', '大兴城501', '5123234', null, '2342423423423', 'shflg1234@163.com', '', '1', '30', '0', '', '0.00', '80', '1', '1234242a', '8.00', '1996.98', '0.00', null, '70', null, null, '1426154778', '1427875436', '4', '1');
INSERT INTO `order` VALUES ('41', '4', '201503130835582500', '斯蒂芬森', '1', '120000', '120100', '120103', '大兴城501', '5123234', null, '2342423423423', 'shflg1234@163.com', '', '1', '20', '0', '', '0.00', '0', '0', null, '8.00', '2006.97', '0.00', null, '20', null, null, '1426206958', '1426206958', '4', '4');
INSERT INTO `order` VALUES ('42', '4', '201503131118437407', '斯蒂芬森', '1', '120000', '120100', '120103', '大兴城501', '5123234', null, '2342423423423', 'shflg1234@163.com', '', '1', '20', '0', '', '0.00', '0', '0', null, '8.00', '6007.00', '0.00', null, '20', null, null, '1426216723', '1426216723', '4', '4');
INSERT INTO `order` VALUES ('43', '1', '201503131626024640', 'sdfsdfs', '1', '440000', '440200', '440204', '大兴城501', '123422', null, '13246897856', 'admin@demo.com', '', '2', '10', '0', '', '0.00', '0', '0', null, '18.00', '8016.00', '0.00', null, '10', null, null, '1426235162', '1426235162', '1', '1');
INSERT INTO `order` VALUES ('44', '4', '201503161714577297', '斯蒂芬森', '1', '120000', '120100', '120103', '大兴城501', '5123234', null, '2342423423423', 'shflg1234@163.com', '', '1', '20', '0', '', '0.00', '0', '0', null, '8.00', '2006.99', '0.00', null, '20', null, null, '1426497297', '1426497297', '4', '4');
INSERT INTO `order` VALUES ('45', '4', '201503161715378038', '斯蒂芬森', '1', '120000', '120100', '120103', '大兴城501', '5123234', null, '2342423423423', 'shflg1234@163.com', '', '1', '20', '0', '', '0.00', '0', '0', null, '8.00', '7.99', '0.00', null, '20', null, null, '1426497337', '1426497337', '4', '4');
INSERT INTO `order` VALUES ('46', '1', '201503260849354224', 'sdfsdfs', '1', '440000', '440200', '440204', '大兴城501', '123422', null, '13246897856', 'admin@demo.com', '', '1', '20', '0', '', '0.00', '0', '0', null, '8.00', '1607.00', '0.00', null, '20', null, null, '1427330976', '1427330976', '1', '1');
INSERT INTO `order` VALUES ('47', '1', '201503260912189002', 'sdfsdfs', '1', '440000', '440200', '440204', '大兴城501', '123422', null, '13246897856', 'admin@demo.com', '', '1', '20', '0', '', '0.00', '0', '0', null, '8.00', '12800.00', '0.00', null, '20', null, null, '1427332338', '1427332338', '1', '1');
INSERT INTO `order` VALUES ('48', '1', '201504011652182364', 'sdfsdfs', '1', '440000', '440200', '440204', '大兴城501', '123422', null, '13246897856', 'admin@demo.com', '', '0', '20', '0', '', '0.00', '0', '0', null, '0.00', '-0.05', '0.00', null, '-1', null, null, '1427878338', '1427878338', '1', '1');
INSERT INTO `order` VALUES ('49', '1', '201504011658262183', 'sdfsdfs', '1', '440000', '440200', '440204', '大兴城501', '123422', null, '13246897856', 'admin@demo.com', '', '0', '20', '0', '', '0.00', '0', '0', null, '0.00', '0.00', '0.00', null, '-1', null, null, '1427878706', '1427878706', '1', '1');
INSERT INTO `order` VALUES ('50', '1', '201504011659379092', 'sdfsdfs', '1', '440000', '440200', '440204', '大兴城501', '123422', null, '13246897856', 'admin@demo.com', '', '0', '20', '0', '', '0.00', '0', '0', null, '10.00', '9.97', '0.00', null, '-1', null, null, '1427878777', '1427878777', '1', '1');

-- ----------------------------
-- Table structure for `order_log`
-- ----------------------------
DROP TABLE IF EXISTS `order_log`;
CREATE TABLE `order_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_log_fk_1` (`order_id`),
  CONSTRAINT `order_log_fk1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_log
-- ----------------------------
INSERT INTO `order_log` VALUES ('1', '46', '20', null, '1427330976', '1427330976', '1', '1');
INSERT INTO `order_log` VALUES ('2', '47', '20', null, '1427332338', '1427332338', '1', '1');
INSERT INTO `order_log` VALUES ('3', '38', '70', null, '1427876009', '1427876009', '1', '1');
INSERT INTO `order_log` VALUES ('4', '48', '20', null, '1427878338', '1427878338', '1', '1');
INSERT INTO `order_log` VALUES ('5', '49', '20', null, '1427878706', '1427878706', '1', '1');
INSERT INTO `order_log` VALUES ('6', '50', '20', null, '1427878778', '1427878778', '1', '1');

-- ----------------------------
-- Table structure for `order_product`
-- ----------------------------
DROP TABLE IF EXISTS `order_product`;
CREATE TABLE `order_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `name` varchar(255) NOT NULL,
  `number` int(11) NOT NULL DEFAULT '1',
  `market_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `thumb` varchar(255) DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_product_fk_1` (`order_id`),
  KEY `order_product_fk_2` (`product_id`),
  CONSTRAINT `order_product_fk1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `order_product_fk2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_product
-- ----------------------------
INSERT INTO `order_product` VALUES ('1', '1', '27', '2', '4s', 'iPhone 4s', '2', '2999.00', '1999.00', '/upload/201502/small-iphone4s.jpg', '0', '1424587149', '1424587149');
INSERT INTO `order_product` VALUES ('2', '1', '28', '2', '4s', 'iPhone 4s', '5', '2999.00', '1999.00', '/upload/201502/small-iphone4s.jpg', '0', '1424587175', '1424587175');
INSERT INTO `order_product` VALUES ('3', '1', '28', '3', 'iphone6', 'iPhone 6', '1', '8666.00', '5999.00', '/upload/201502/small-iphone61.jpg', '0', '1424587175', '1424587175');
INSERT INTO `order_product` VALUES ('4', '1', '30', '2', '4s', 'iPhone 4s', '1', '2999.00', '1999.00', '/upload/201502/small-iphone4s.jpg', '0', '1424587444', '1424587444');
INSERT INTO `order_product` VALUES ('5', '1', '30', '3', 'iphone6', 'iPhone 6', '1', '8666.00', '5999.00', '/upload/201502/small-iphone61.jpg', '0', '1424587444', '1424587444');
INSERT INTO `order_product` VALUES ('6', '1', '32', '3', 'iphone6', 'iPhone 6', '1', '8666.00', '5999.00', '/upload/201502/small-iphone61.jpg', '0', '1424587794', '1424587794');
INSERT INTO `order_product` VALUES ('7', '1', '32', '2', '4s', 'iPhone 4s', '1', '2999.00', '1999.00', '/upload/201502/small-iphone4s.jpg', '0', '1424587794', '1424587794');
INSERT INTO `order_product` VALUES ('8', '1', '33', '2', '4s', 'iPhone 4s', '1', '2999.00', '1999.00', '/upload/201502/small-iphone4s.jpg', '0', '1424587906', '1424587906');
INSERT INTO `order_product` VALUES ('9', '1', '34', '2', '4s', 'iPhone 4s', '1', '2999.00', '1999.00', '/upload/201502/small-iphone4s.jpg', '0', '1424652907', '1424652907');
INSERT INTO `order_product` VALUES ('10', '0', '36', '3', 'iphone6', 'iPhone 6', '1', '8666.00', '5999.00', '/upload/201502/small-iphone61.jpg', '0', '1424851209', '1424851209');
INSERT INTO `order_product` VALUES ('11', '0', '37', '2', '4s', 'iPhone 4s', '1', '2999.00', '1999.00', '/upload/201502/small-iphone4s.jpg', '0', '1425456034', '1425456034');
INSERT INTO `order_product` VALUES ('12', '0', '38', '3', 'iphone6', 'iPhone 6', '5', '8666.00', '5999.00', '/upload/201502/small-iphone61.jpg', '0', '1425887878', '1425887878');
INSERT INTO `order_product` VALUES ('13', '0', '39', '3', 'iphone6', 'iPhone 6', '1', '8666.00', '5999.00', '/upload/201502/small-iphone61.jpg', '0', '1426154344', '1426154344');
INSERT INTO `order_product` VALUES ('14', '0', '40', '2', '4s', 'iPhone 4s', '1', '2999.00', '1999.00', '/upload/201502/small-iphone4s.jpg', '0', '1426154778', '1426154778');
INSERT INTO `order_product` VALUES ('15', '0', '41', '2', '4s', 'iPhone 4s', '1', '2999.00', '1999.00', '/upload/201502/small-iphone4s.jpg', '0', '1426206958', '1426206958');
INSERT INTO `order_product` VALUES ('16', '0', '42', '3', 'iphone6', 'iPhone 6', '1', '8666.00', '5999.00', '/upload/201502/small-iphone61.jpg', '0', '1426216723', '1426216723');
INSERT INTO `order_product` VALUES ('17', '0', '43', '3', 'iphone6', 'iPhone 6', '1', '8666.00', '5999.00', '/upload/201502/small-iphone61.jpg', '0', '1426235162', '1426235162');
INSERT INTO `order_product` VALUES ('18', '0', '43', '2', '4s', 'iPhone 4s', '1', '2999.00', '1999.00', '/upload/201502/small-iphone4s.jpg', '0', '1426235162', '1426235162');
INSERT INTO `order_product` VALUES ('19', '0', '44', '2', '4s', 'iPhone 4s', '1', '2999.00', '1999.00', '/upload/201502/small-iphone4s.jpg', '0', '1426497297', '1426497297');
INSERT INTO `order_product` VALUES ('20', '0', '46', '8', 'feilip_9352', '飞利浦电动牙刷Hx9353', '1', '1999.00', '1599.00', 'http://hikeblog.qiniudn.com/funshop_feilipu_image_02.jpg', '29', '1427330976', '1427330976');
INSERT INTO `order_product` VALUES ('21', '0', '47', '8', 'feilip_9352', '飞利浦电动牙刷Hx9353', '8', '1999.00', '1599.00', 'http://hikeblog.qiniudn.com/funshop_feilipu_image_02.jpg', '29', '1427332338', '1427332338');
INSERT INTO `order_product` VALUES ('22', '0', '48', '4', 'lenovo', '联想', '1', '0.00', '0.00', '/upload/201502/small-jing.jpg', '0', '1427878338', '1427878338');
INSERT INTO `order_product` VALUES ('23', '0', '49', '4', 'lenovo', '联想', '1', '0.00', '0.00', '/upload/201502/small-jing.jpg', '0', '1427878706', '1427878706');
INSERT INTO `order_product` VALUES ('24', '0', '50', '4', 'lenovo', '联想', '1', '0.00', '0.00', '/upload/201502/small-jing.jpg', '0', '1427878778', '1427878778');

-- ----------------------------
-- Table structure for `payment`
-- ----------------------------
DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `name` varchar(64) NOT NULL,
  `fee` varchar(64) DEFAULT NULL,
  `description` text,
  `sort_order` int(11) NOT NULL DEFAULT '50',
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of payment
-- ----------------------------

-- ----------------------------
-- Table structure for `point_log`
-- ----------------------------
DROP TABLE IF EXISTS `point_log`;
CREATE TABLE `point_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '1',
  `point` int(11) NOT NULL DEFAULT '0',
  `remark` varchar(255) DEFAULT NULL,
  `balance` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `point_fk_1` (`user_id`),
  CONSTRAINT `point_fk1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of point_log
-- ----------------------------
INSERT INTO `point_log` VALUES ('1', '1', '1', '5', '订单：105021', '50', '1542342423', '223424324', '1', '1');

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT '0',
  `weight` decimal(10,3) NOT NULL DEFAULT '0.000',
  `market_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `brief` varchar(255) DEFAULT NULL,
  `content` text,
  `thumb` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `origin` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `description` text,
  `type` int(11) NOT NULL DEFAULT '0',
  `brand_id` int(11) DEFAULT '0',
  `star` decimal(11,2) NOT NULL DEFAULT '5.00',
  `sales` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_fk_1` (`category_id`),
  CONSTRAINT `product_fk1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '3', 'Mac Book', 'mac-book', '0', '0.000', '0.00', '0.00', '', 'mac book\r\n\r\nmac book', '/upload/201502/small-macbook-54dda510e3355.jpg', '/upload/201502/macbook-54dda510e3355.jpg', null, '', '', '0', '1', '5.00', '0', '1', '1423811521', '1423811921', '1', '1');
INSERT INTO `product` VALUES ('2', '3', 'iPhone 4s', '4s', '999', '0.150', '2999.00', '1999.00', '', '4ss\r\n\r\nss\r\n\r\ns\r\n\r\n4s 4s<br> 4s一款非常优秀的手机<br>欢迎购买', '/upload/201502/small-iphone4s.jpg', '/upload/201502/iphone4s.jpg', null, '', '', '0', '2', '4.82', '1', '1', '1423812146', '1423812156', '1', '1');
INSERT INTO `product` VALUES ('3', '3', 'iPhone 6', 'iphone6', '5', '586.000', '8666.00', '5999.00', '', '<img alt=\"Cetaphil丝塔芙舒特肤温和洗面奶/洁面乳118ml-产品描述\" src=\"http://nalapic.b0.upaiyun.com/67bfb935dd1d.jpg\" /><img alt=\"Cetaphil丝塔芙舒特肤温和洗面奶/洁面乳118ml-产品描述\" src=\"http://nalapic.b0.upaiyun.com/ccca8bb9dea.jpg\" /><img alt=\"Cetaphil丝塔芙舒特肤温和洗面奶/洁面乳118ml-产品描述\" src=\"http://nalapic.b0.upaiyun.com/17898eaa46c22.jpg\" /><img alt=\"Cetaphil丝塔芙舒特肤温和洗面奶/洁面乳118ml-产品描述\" src=\"http://nalapic.b0.upaiyun.com/289721c13374a.jpg\" />', '/upload/201502/small-iphone61.jpg', '/upload/201502/iphone61.jpg', null, '', '', '0', '1', '5.00', '0', '1', '1423812269', '1424571576', '1', '1');
INSERT INTO `product` VALUES ('4', '5', '联想', 'lenovo', '17', '0.000', '0.00', '0.00', 'sdfsfdsf', 'sdfsfsdf', '/upload/201502/small-jing.jpg', '/upload/201502/jing.jpg', null, '', 'sdfs', '0', '0', '5.00', '0', '1', '1424939882', '1424939928', '1', '1');
INSERT INTO `product` VALUES ('5', '1', 'aaaaaaaaaaaaaa', 'aaaaaa', '0', '0.000', '0.00', '0.00', '', '<p>aaaaaaaaaaaa</p>\r\n', null, null, null, '', '', '19', '2', '5.00', '0', '1', '1427094473', '1427095472', '1', '1');
INSERT INTO `product` VALUES ('6', '1', 'bbbbbb', 'bbbbbb', '0', '0.000', '0.00', '0.00', '', '<p>assdf</p>\r\n', null, null, null, '', '', '27', '0', '5.00', '0', '1', '1427094992', '1427094992', '1', '1');
INSERT INTO `product` VALUES ('7', '1', '飞利浦电动牙刷Hx9352', 'feilip_9352', '10', '900.000', '1999.00', '1599.00', '', '<img src=\"http://hikeblog.qiniudn.com/funshop_feilipu_01.jpg\" /><img src=\"http://hikeblog.qiniudn.com/funshop_feilipu_02.jpg\" /><img src=\"http://hikeblog.qiniudn.com/funshop_feilipu_03.jpg\" />\"', 'http://hikeblog.qiniudn.com/funshop_feilipu_image_01.jpg', 'http://hikeblog.qiniudn.com/funshop_feilipu_image_01.jpg', null, '', '', '29', '3', '5.00', '0', '1', '1427166353', '1427167841', '1', '1');
INSERT INTO `product` VALUES ('8', '1', '飞利浦电动牙刷Hx9353', 'feilip_9352', '3', '900.000', '1999.00', '1599.00', '', '<img src=\"http://hikeblog.qiniudn.com/funshop_feilipu_01.jpg\" /><img src=\"http://hikeblog.qiniudn.com/funshop_feilipu_02.jpg\" /><img src=\"http://hikeblog.qiniudn.com/funshop_feilipu_03.jpg\" />\"', 'http://hikeblog.qiniudn.com/funshop_feilipu_image_02.jpg', 'http://hikeblog.qiniudn.com/funshop_feilipu_image_02.jpg', null, '', '', '29', '0', '5.00', '0', '1', '1427166372', '1427167841', '1', '1');
INSERT INTO `product` VALUES ('9', '6', '飞利浦电动牙刷Hx9354', 'feilip_9352', '0', '900.000', '1999.00', '1599.00', '', '<img src=\"http://hikeblog.qiniudn.com/funshop_feilipu_01.jpg\" /><img src=\"http://hikeblog.qiniudn.com/funshop_feilipu_02.jpg\" /><img src=\"http://hikeblog.qiniudn.com/funshop_feilipu_03.jpg\" />\"', 'http://hikeblog.qiniudn.com/funshop_feilipu_image_01.jpg', 'http://hikeblog.qiniudn.com/funshop_feilipu_image_01.jpg', null, '', '', '29', '0', '5.00', '0', '1', '1427166671', '1427167841', '1', '1');
INSERT INTO `product` VALUES ('10', '1', '飞利浦电动牙刷Hx9353', 'feilip_9352', '15', '900.000', '1999.00', '1599.00', '', '<img src=\"http://hikeblog.qiniudn.com/funshop_feilipu_01.jpg\" /><img src=\"http://hikeblog.qiniudn.com/funshop_feilipu_02.jpg\" /><img src=\"http://hikeblog.qiniudn.com/funshop_feilipu_03.jpg\" />', 'http://hikeblog.qiniudn.com/funshop_feilipu_image_02.jpg', 'http://hikeblog.qiniudn.com/funshop_feilipu_image_02.jpg', null, '', '', '29', '0', '5.00', '0', '1', '1427169146', '1427169146', '1', '1');
INSERT INTO `product` VALUES ('11', '1', '飞利浦电动牙刷Hx9352', 'feilip_9352', '10', '900.000', '1999.00', '1599.00', '', '<p><img src=\"http://hikeblog.qiniudn.com/funshop_feilipu_01.jpg\" /><img src=\"http://hikeblog.qiniudn.com/funshop_feilipu_02.jpg\" /><img src=\"http://hikeblog.qiniudn.com/funshop_feilipu_03.jpg\" /></p>\r\n', 'http://hikeblog.qiniudn.com/funshop_feilipu_image_01.jpg', 'http://hikeblog.qiniudn.com/funshop_feilipu_image_01.jpg', null, '', '', '29', '3', '5.00', '0', '1', '1427169158', '1427267210', '1', '1');
INSERT INTO `product` VALUES ('12', '1', '飞利浦电动牙刷Hx9352', 'feilip_9352', '10', '900.000', '1999.00', '1599.00', '', '<p><img src=\"http://hikeblog.qiniudn.com/funshop_feilipu_01.jpg\" />,<img src=\"http://hikeblog.qiniudn.com/funshop_feilipu_02.jpg\" /><img src=\"http://hikeblog.qiniudn.com/funshop_feilipu_03.jpg\" /></p>', 'http://hikeblog.qiniudn.com/funshop_feilipu_image_01.jpg', 'http://hikeblog.qiniudn.com/funshop_feilipu_image_01.jpg', null, '', '', '29', '3', '5.00', '0', '1', '1427341008', '1427341008', '1', '1');
INSERT INTO `product` VALUES ('13', '1', '飞利浦电动牙刷Hx9352', 'feilip_9352', '10', '900.000', '1999.00', '1599.00', '', '<p><img src=\"http://hikeblog.qiniudn.com/funshop_feilipu_01.jpg\" />,<img src=\"http://hikeblog.qiniudn.com/funshop_feilipu_02.jpg\" /><img src=\"http://hikeblog.qiniudn.com/funshop_feilipu_03.jpg\" /></p>', 'http://hikeblog.qiniudn.com/funshop_feilipu_image_01.jpg', 'http://hikeblog.qiniudn.com/funshop_feilipu_image_01.jpg', null, '', '', '29', '3', '5.00', '0', '1', '1427341079', '1427341079', '1', '1');

-- ----------------------------
-- Table structure for `product_image`
-- ----------------------------
DROP TABLE IF EXISTS `product_image`;
CREATE TABLE `product_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `filename` varchar(128) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `origin` varchar(255) DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '50',
  PRIMARY KEY (`id`),
  KEY `product_image_fk_1` (`product_id`),
  CONSTRAINT `product_image_fk1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_image
-- ----------------------------
INSERT INTO `product_image` VALUES ('1', '1', 'macbook-54dda510e3355.jpg', '', '/upload/201502/macbook-54dda510e3355.jpg', '/upload/201502/small-macbook-54dda510e3355.jpg', null, '50');
INSERT INTO `product_image` VALUES ('2', '2', 'iphone4s.jpg', '', '/upload/201502/iphone4s.jpg', '/upload/201502/small-iphone4s.jpg', null, '50');
INSERT INTO `product_image` VALUES ('3', '3', 'iphone6.jpg', '', '/upload/201502/iphone6.jpg', '/upload/201502/small-iphone6.jpg', null, '48');
INSERT INTO `product_image` VALUES ('4', '3', 'iphone61.jpg', '', '/upload/201502/iphone61.jpg', '/upload/201502/small-iphone61.jpg', null, '45');
INSERT INTO `product_image` VALUES ('5', '3', 'sumsung-54e93c9d44f44.jpg', '', '/upload/201502/sumsung-54e93c9d44f44.jpg', '/upload/201502/small-sumsung-54e93c9d44f44.jpg', null, '50');
INSERT INTO `product_image` VALUES ('6', '4', 'jing.jpg', '', '/upload/201502/jing.jpg', '/upload/201502/small-jing.jpg', null, '50');
INSERT INTO `product_image` VALUES ('7', '9', null, null, 'http://hikeblog.qiniudn.com/funshop_feilipu_image_01.jpg', 'http://hikeblog.qiniudn.com/funshop_feilipu_image_01.jpg', null, '50');
INSERT INTO `product_image` VALUES ('8', '9', null, null, 'http://hikeblog.qiniudn.com/funshop_feilipu_image_02.jpg', 'http://hikeblog.qiniudn.com/funshop_feilipu_image_02.jpg', null, '50');
INSERT INTO `product_image` VALUES ('9', '7', null, null, 'http://hikeblog.qiniudn.com/funshop_feilipu_image_01.jpg', 'http://hikeblog.qiniudn.com/funshop_feilipu_image_01.jpg', null, '50');
INSERT INTO `product_image` VALUES ('10', '7', null, null, 'http://hikeblog.qiniudn.com/funshop_feilipu_image_02.jpg', 'http://hikeblog.qiniudn.com/funshop_feilipu_image_02.jpg', null, '50');
INSERT INTO `product_image` VALUES ('12', '8', null, null, 'http://hikeblog.qiniudn.com/funshop_feilipu_image_02.jpg', 'http://hikeblog.qiniudn.com/funshop_feilipu_image_02.jpg', null, '50');
INSERT INTO `product_image` VALUES ('13', '10', null, null, 'http://hikeblog.qiniudn.com/funshop_feilipu_image_02.jpg', 'http://hikeblog.qiniudn.com/funshop_feilipu_image_02.jpg', null, '50');
INSERT INTO `product_image` VALUES ('14', '11', null, null, 'http://hikeblog.qiniudn.com/funshop_feilipu_image_01.jpg', 'http://hikeblog.qiniudn.com/funshop_feilipu_image_01.jpg', null, '50');
INSERT INTO `product_image` VALUES ('15', '11', null, null, 'http://hikeblog.qiniudn.com/funshop_feilipu_image_02.jpg', 'http://hikeblog.qiniudn.com/funshop_feilipu_image_02.jpg', null, '50');
INSERT INTO `product_image` VALUES ('16', '12', null, null, 'http://hikeblog.qiniudn.com/funshop_feilipu_image_01.jpg', 'http://hikeblog.qiniudn.com/funshop_feilipu_image_01.jpg', null, '50');
INSERT INTO `product_image` VALUES ('17', '12', null, null, 'http://hikeblog.qiniudn.com/funshop_feilipu_image_02.jpg', 'http://hikeblog.qiniudn.com/funshop_feilipu_image_02.jpg', null, '50');
INSERT INTO `product_image` VALUES ('18', '13', null, null, 'http://hikeblog.qiniudn.com/funshop_feilipu_image_01.jpg', 'http://hikeblog.qiniudn.com/funshop_feilipu_image_01.jpg', null, '50');
INSERT INTO `product_image` VALUES ('19', '13', null, null, 'http://hikeblog.qiniudn.com/funshop_feilipu_image_02.jpg', 'http://hikeblog.qiniudn.com/funshop_feilipu_image_02.jpg', null, '50');

-- ----------------------------
-- Table structure for `profile`
-- ----------------------------
DROP TABLE IF EXISTS `profile`;
CREATE TABLE `profile` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `surname` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_url` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` int(11) NOT NULL DEFAULT '1',
  `birthday` datetime DEFAULT NULL,
  `country` int(11) DEFAULT '0',
  `province` int(11) DEFAULT '0',
  `city` int(11) DEFAULT '0',
  `district` int(11) DEFAULT '0',
  PRIMARY KEY (`user_id`),
  CONSTRAINT `FK_profile_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of profile
-- ----------------------------
INSERT INTO `profile` VALUES ('1', 'Administration', 'Site', null, '1', null, '0', '0', '0', '0');
INSERT INTO `profile` VALUES ('4', null, '', null, '1', '2004-11-30 00:00:00', '1', '150000', '150200', '150202');

-- ----------------------------
-- Table structure for `region`
-- ----------------------------
DROP TABLE IF EXISTS `region`;
CREATE TABLE `region` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(64) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `language` varchar(16) NOT NULL,
  `grade` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=990101 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of region
-- ----------------------------
INSERT INTO `region` VALUES ('1', '0', '中国', ',1', 'mainland', '1');
INSERT INTO `region` VALUES ('110000', '1', '北京', ',1,110000', 'mainland', '2');
INSERT INTO `region` VALUES ('110100', '110000', '北京市', ',1,110000,110100', 'mainland', '3');
INSERT INTO `region` VALUES ('110101', '110100', '东城区', ',1,110000,110100,110101', 'mainland', '4');
INSERT INTO `region` VALUES ('110102', '110100', '西城区', ',1,110000,110100,110102', 'mainland', '4');
INSERT INTO `region` VALUES ('110103', '110100', '崇文区', ',1,110000,110100,110103', 'mainland', '4');
INSERT INTO `region` VALUES ('110104', '110100', '宣武区', ',1,110000,110100,110104', 'mainland', '4');
INSERT INTO `region` VALUES ('110105', '110100', '朝阳区', ',1,110000,110100,110105', 'mainland', '4');
INSERT INTO `region` VALUES ('110106', '110100', '丰台区', ',1,110000,110100,110106', 'mainland', '4');
INSERT INTO `region` VALUES ('110107', '110100', '石景山区', ',1,110000,110100,110107', 'mainland', '4');
INSERT INTO `region` VALUES ('110108', '110100', '海淀区', ',1,110000,110100,110108', 'mainland', '4');
INSERT INTO `region` VALUES ('110109', '110100', '门头沟区', ',1,110000,110100,110109', 'mainland', '4');
INSERT INTO `region` VALUES ('110111', '110100', '房山区', ',1,110000,110100,110111', 'mainland', '4');
INSERT INTO `region` VALUES ('110112', '110100', '通州区', ',1,110000,110100,110112', 'mainland', '4');
INSERT INTO `region` VALUES ('110113', '110100', '顺义区', ',1,110000,110100,110113', 'mainland', '4');
INSERT INTO `region` VALUES ('110114', '110100', '昌平区', ',1,110000,110100,110114', 'mainland', '4');
INSERT INTO `region` VALUES ('110115', '110100', '大兴区', ',1,110000,110100,110115', 'mainland', '4');
INSERT INTO `region` VALUES ('110116', '110100', '怀柔区', ',1,110000,110100,110116', 'mainland', '4');
INSERT INTO `region` VALUES ('110117', '110100', '平谷区', ',1,110000,110100,110117', 'mainland', '4');
INSERT INTO `region` VALUES ('110228', '110100', '密云县', ',1,110000,110100,110228', 'mainland', '4');
INSERT INTO `region` VALUES ('110229', '110100', '延庆县', ',1,110000,110100,110229', 'mainland', '4');
INSERT INTO `region` VALUES ('110230', '110100', '其它区', ',1,110000,110100,110230', 'mainland', '4');
INSERT INTO `region` VALUES ('120000', '1', '天津', ',1,120000', 'mainland', '2');
INSERT INTO `region` VALUES ('120100', '120000', '天津市', ',1,120000,120100', 'mainland', '3');
INSERT INTO `region` VALUES ('120101', '120100', '和平区', ',1,120000,120100,120101', 'mainland', '4');
INSERT INTO `region` VALUES ('120102', '120100', '河东区', ',1,120000,120100,120102', 'mainland', '4');
INSERT INTO `region` VALUES ('120103', '120100', '河西区', ',1,120000,120100,120103', 'mainland', '4');
INSERT INTO `region` VALUES ('120104', '120100', '南开区', ',1,120000,120100,120104', 'mainland', '4');
INSERT INTO `region` VALUES ('120105', '120100', '河北区', ',1,120000,120100,120105', 'mainland', '4');
INSERT INTO `region` VALUES ('120106', '120100', '红桥区', ',1,120000,120100,120106', 'mainland', '4');
INSERT INTO `region` VALUES ('120107', '120100', '塘沽区', ',1,120000,120100,120107', 'mainland', '4');
INSERT INTO `region` VALUES ('120108', '120100', '汉沽区', ',1,120000,120100,120108', 'mainland', '4');
INSERT INTO `region` VALUES ('120109', '120100', '大港区', ',1,120000,120100,120109', 'mainland', '4');
INSERT INTO `region` VALUES ('120110', '120100', '东丽区', ',1,120000,120100,120110', 'mainland', '4');
INSERT INTO `region` VALUES ('120111', '120100', '西青区', ',1,120000,120100,120111', 'mainland', '4');
INSERT INTO `region` VALUES ('120112', '120100', '津南区', ',1,120000,120100,120112', 'mainland', '4');
INSERT INTO `region` VALUES ('120113', '120100', '北辰区', ',1,120000,120100,120113', 'mainland', '4');
INSERT INTO `region` VALUES ('120114', '120100', '武清区', ',1,120000,120100,120114', 'mainland', '4');
INSERT INTO `region` VALUES ('120115', '120100', '宝坻区', ',1,120000,120100,120115', 'mainland', '4');
INSERT INTO `region` VALUES ('120221', '120100', '宁河县', ',1,120000,120100,120221', 'mainland', '4');
INSERT INTO `region` VALUES ('120223', '120100', '静海县', ',1,120000,120100,120223', 'mainland', '4');
INSERT INTO `region` VALUES ('120225', '120100', '蓟县', ',1,120000,120100,120225', 'mainland', '4');
INSERT INTO `region` VALUES ('120226', '120100', '其它区', ',1,120000,120100,120226', 'mainland', '4');
INSERT INTO `region` VALUES ('130000', '1', '河北省', ',1,130000', 'mainland', '2');
INSERT INTO `region` VALUES ('130100', '130000', '石家庄市', ',1,130000,130100', 'mainland', '3');
INSERT INTO `region` VALUES ('130102', '130100', '长安区', ',1,130000,130100,130102', 'mainland', '4');
INSERT INTO `region` VALUES ('130103', '130100', '桥东区', ',1,130000,130100,130103', 'mainland', '4');
INSERT INTO `region` VALUES ('130104', '130100', '桥西区', ',1,130000,130100,130104', 'mainland', '4');
INSERT INTO `region` VALUES ('130105', '130100', '新华区', ',1,130000,130100,130105', 'mainland', '4');
INSERT INTO `region` VALUES ('130107', '130100', '井陉矿区', ',1,130000,130100,130107', 'mainland', '4');
INSERT INTO `region` VALUES ('130108', '130100', '裕华区', ',1,130000,130100,130108', 'mainland', '4');
INSERT INTO `region` VALUES ('130121', '130100', '井陉县', ',1,130000,130100,130121', 'mainland', '4');
INSERT INTO `region` VALUES ('130123', '130100', '正定县', ',1,130000,130100,130123', 'mainland', '4');
INSERT INTO `region` VALUES ('130124', '130100', '栾城县', ',1,130000,130100,130124', 'mainland', '4');
INSERT INTO `region` VALUES ('130125', '130100', '行唐县', ',1,130000,130100,130125', 'mainland', '4');
INSERT INTO `region` VALUES ('130126', '130100', '灵寿县', ',1,130000,130100,130126', 'mainland', '4');
INSERT INTO `region` VALUES ('130127', '130100', '高邑县', ',1,130000,130100,130127', 'mainland', '4');
INSERT INTO `region` VALUES ('130128', '130100', '深泽县', ',1,130000,130100,130128', 'mainland', '4');
INSERT INTO `region` VALUES ('130129', '130100', '赞皇县', ',1,130000,130100,130129', 'mainland', '4');
INSERT INTO `region` VALUES ('130130', '130100', '无极县', ',1,130000,130100,130130', 'mainland', '4');
INSERT INTO `region` VALUES ('130131', '130100', '平山县', ',1,130000,130100,130131', 'mainland', '4');
INSERT INTO `region` VALUES ('130132', '130100', '元氏县', ',1,130000,130100,130132', 'mainland', '4');
INSERT INTO `region` VALUES ('130133', '130100', '赵县', ',1,130000,130100,130133', 'mainland', '4');
INSERT INTO `region` VALUES ('130181', '130100', '辛集市', ',1,130000,130100,130181', 'mainland', '4');
INSERT INTO `region` VALUES ('130182', '130100', '藁城市', ',1,130000,130100,130182', 'mainland', '4');
INSERT INTO `region` VALUES ('130183', '130100', '晋州市', ',1,130000,130100,130183', 'mainland', '4');
INSERT INTO `region` VALUES ('130184', '130100', '新乐市', ',1,130000,130100,130184', 'mainland', '4');
INSERT INTO `region` VALUES ('130185', '130100', '鹿泉市', ',1,130000,130100,130185', 'mainland', '4');
INSERT INTO `region` VALUES ('130186', '130100', '其它区', ',1,130000,130100,130186', 'mainland', '4');
INSERT INTO `region` VALUES ('130200', '130000', '唐山市', ',1,130000,130200', 'mainland', '3');
INSERT INTO `region` VALUES ('130202', '130200', '路南区', ',1,130000,130200,130202', 'mainland', '4');
INSERT INTO `region` VALUES ('130203', '130200', '路北区', ',1,130000,130200,130203', 'mainland', '4');
INSERT INTO `region` VALUES ('130204', '130200', '古冶区', ',1,130000,130200,130204', 'mainland', '4');
INSERT INTO `region` VALUES ('130205', '130200', '开平区', ',1,130000,130200,130205', 'mainland', '4');
INSERT INTO `region` VALUES ('130207', '130200', '丰南区', ',1,130000,130200,130207', 'mainland', '4');
INSERT INTO `region` VALUES ('130208', '130200', '丰润区', ',1,130000,130200,130208', 'mainland', '4');
INSERT INTO `region` VALUES ('130223', '130200', '滦县', ',1,130000,130200,130223', 'mainland', '4');
INSERT INTO `region` VALUES ('130224', '130200', '滦南县', ',1,130000,130200,130224', 'mainland', '4');
INSERT INTO `region` VALUES ('130225', '130200', '乐亭县', ',1,130000,130200,130225', 'mainland', '4');
INSERT INTO `region` VALUES ('130227', '130200', '迁西县', ',1,130000,130200,130227', 'mainland', '4');
INSERT INTO `region` VALUES ('130229', '130200', '玉田县', ',1,130000,130200,130229', 'mainland', '4');
INSERT INTO `region` VALUES ('130230', '130200', '唐海县', ',1,130000,130200,130230', 'mainland', '4');
INSERT INTO `region` VALUES ('130281', '130200', '遵化市', ',1,130000,130200,130281', 'mainland', '4');
INSERT INTO `region` VALUES ('130283', '130200', '迁安市', ',1,130000,130200,130283', 'mainland', '4');
INSERT INTO `region` VALUES ('130284', '130200', '其它区', ',1,130000,130200,130284', 'mainland', '4');
INSERT INTO `region` VALUES ('130300', '130000', '秦皇岛市', ',1,130000,130300', 'mainland', '3');
INSERT INTO `region` VALUES ('130302', '130300', '海港区', ',1,130000,130300,130302', 'mainland', '4');
INSERT INTO `region` VALUES ('130303', '130300', '山海关区', ',1,130000,130300,130303', 'mainland', '4');
INSERT INTO `region` VALUES ('130304', '130300', '北戴河区', ',1,130000,130300,130304', 'mainland', '4');
INSERT INTO `region` VALUES ('130321', '130300', '青龙满族自治县', ',1,130000,130300,130321', 'mainland', '4');
INSERT INTO `region` VALUES ('130322', '130300', '昌黎县', ',1,130000,130300,130322', 'mainland', '4');
INSERT INTO `region` VALUES ('130323', '130300', '抚宁县', ',1,130000,130300,130323', 'mainland', '4');
INSERT INTO `region` VALUES ('130324', '130300', '卢龙县', ',1,130000,130300,130324', 'mainland', '4');
INSERT INTO `region` VALUES ('130398', '130300', '其它区', ',1,130000,130300,130398', 'mainland', '4');
INSERT INTO `region` VALUES ('130399', '130300', '经济技术开发区', ',1,130000,130300,130399', 'mainland', '4');
INSERT INTO `region` VALUES ('130400', '130000', '邯郸市', ',1,130000,130400', 'mainland', '3');
INSERT INTO `region` VALUES ('130402', '130400', '邯山区', ',1,130000,130400,130402', 'mainland', '4');
INSERT INTO `region` VALUES ('130403', '130400', '丛台区', ',1,130000,130400,130403', 'mainland', '4');
INSERT INTO `region` VALUES ('130404', '130400', '复兴区', ',1,130000,130400,130404', 'mainland', '4');
INSERT INTO `region` VALUES ('130406', '130400', '峰峰矿区', ',1,130000,130400,130406', 'mainland', '4');
INSERT INTO `region` VALUES ('130421', '130400', '邯郸县', ',1,130000,130400,130421', 'mainland', '4');
INSERT INTO `region` VALUES ('130423', '130400', '临漳县', ',1,130000,130400,130423', 'mainland', '4');
INSERT INTO `region` VALUES ('130424', '130400', '成安县', ',1,130000,130400,130424', 'mainland', '4');
INSERT INTO `region` VALUES ('130425', '130400', '大名县', ',1,130000,130400,130425', 'mainland', '4');
INSERT INTO `region` VALUES ('130426', '130400', '涉县', ',1,130000,130400,130426', 'mainland', '4');
INSERT INTO `region` VALUES ('130427', '130400', '磁县', ',1,130000,130400,130427', 'mainland', '4');
INSERT INTO `region` VALUES ('130428', '130400', '肥乡县', ',1,130000,130400,130428', 'mainland', '4');
INSERT INTO `region` VALUES ('130429', '130400', '永年县', ',1,130000,130400,130429', 'mainland', '4');
INSERT INTO `region` VALUES ('130430', '130400', '邱县', ',1,130000,130400,130430', 'mainland', '4');
INSERT INTO `region` VALUES ('130431', '130400', '鸡泽县', ',1,130000,130400,130431', 'mainland', '4');
INSERT INTO `region` VALUES ('130432', '130400', '广平县', ',1,130000,130400,130432', 'mainland', '4');
INSERT INTO `region` VALUES ('130433', '130400', '馆陶县', ',1,130000,130400,130433', 'mainland', '4');
INSERT INTO `region` VALUES ('130434', '130400', '魏县', ',1,130000,130400,130434', 'mainland', '4');
INSERT INTO `region` VALUES ('130435', '130400', '曲周县', ',1,130000,130400,130435', 'mainland', '4');
INSERT INTO `region` VALUES ('130481', '130400', '武安市', ',1,130000,130400,130481', 'mainland', '4');
INSERT INTO `region` VALUES ('130482', '130400', '其它区', ',1,130000,130400,130482', 'mainland', '4');
INSERT INTO `region` VALUES ('130500', '130000', '邢台市', ',1,130000,130500', 'mainland', '3');
INSERT INTO `region` VALUES ('130502', '130500', '桥东区', ',1,130000,130500,130502', 'mainland', '4');
INSERT INTO `region` VALUES ('130503', '130500', '桥西区', ',1,130000,130500,130503', 'mainland', '4');
INSERT INTO `region` VALUES ('130521', '130500', '邢台县', ',1,130000,130500,130521', 'mainland', '4');
INSERT INTO `region` VALUES ('130522', '130500', '临城县', ',1,130000,130500,130522', 'mainland', '4');
INSERT INTO `region` VALUES ('130523', '130500', '内丘县', ',1,130000,130500,130523', 'mainland', '4');
INSERT INTO `region` VALUES ('130524', '130500', '柏乡县', ',1,130000,130500,130524', 'mainland', '4');
INSERT INTO `region` VALUES ('130525', '130500', '隆尧县', ',1,130000,130500,130525', 'mainland', '4');
INSERT INTO `region` VALUES ('130526', '130500', '任县', ',1,130000,130500,130526', 'mainland', '4');
INSERT INTO `region` VALUES ('130527', '130500', '南和县', ',1,130000,130500,130527', 'mainland', '4');
INSERT INTO `region` VALUES ('130528', '130500', '宁晋县', ',1,130000,130500,130528', 'mainland', '4');
INSERT INTO `region` VALUES ('130529', '130500', '巨鹿县', ',1,130000,130500,130529', 'mainland', '4');
INSERT INTO `region` VALUES ('130530', '130500', '新河县', ',1,130000,130500,130530', 'mainland', '4');
INSERT INTO `region` VALUES ('130531', '130500', '广宗县', ',1,130000,130500,130531', 'mainland', '4');
INSERT INTO `region` VALUES ('130532', '130500', '平乡县', ',1,130000,130500,130532', 'mainland', '4');
INSERT INTO `region` VALUES ('130533', '130500', '威县', ',1,130000,130500,130533', 'mainland', '4');
INSERT INTO `region` VALUES ('130534', '130500', '清河县', ',1,130000,130500,130534', 'mainland', '4');
INSERT INTO `region` VALUES ('130535', '130500', '临西县', ',1,130000,130500,130535', 'mainland', '4');
INSERT INTO `region` VALUES ('130581', '130500', '南宫市', ',1,130000,130500,130581', 'mainland', '4');
INSERT INTO `region` VALUES ('130582', '130500', '沙河市', ',1,130000,130500,130582', 'mainland', '4');
INSERT INTO `region` VALUES ('130583', '130500', '其它区', ',1,130000,130500,130583', 'mainland', '4');
INSERT INTO `region` VALUES ('130600', '130000', '保定市', ',1,130000,130600', 'mainland', '3');
INSERT INTO `region` VALUES ('130602', '130600', '新市区', ',1,130000,130600,130602', 'mainland', '4');
INSERT INTO `region` VALUES ('130603', '130600', '北市区', ',1,130000,130600,130603', 'mainland', '4');
INSERT INTO `region` VALUES ('130604', '130600', '南市区', ',1,130000,130600,130604', 'mainland', '4');
INSERT INTO `region` VALUES ('130621', '130600', '满城县', ',1,130000,130600,130621', 'mainland', '4');
INSERT INTO `region` VALUES ('130622', '130600', '清苑县', ',1,130000,130600,130622', 'mainland', '4');
INSERT INTO `region` VALUES ('130623', '130600', '涞水县', ',1,130000,130600,130623', 'mainland', '4');
INSERT INTO `region` VALUES ('130624', '130600', '阜平县', ',1,130000,130600,130624', 'mainland', '4');
INSERT INTO `region` VALUES ('130625', '130600', '徐水县', ',1,130000,130600,130625', 'mainland', '4');
INSERT INTO `region` VALUES ('130626', '130600', '定兴县', ',1,130000,130600,130626', 'mainland', '4');
INSERT INTO `region` VALUES ('130627', '130600', '唐县', ',1,130000,130600,130627', 'mainland', '4');
INSERT INTO `region` VALUES ('130628', '130600', '高阳县', ',1,130000,130600,130628', 'mainland', '4');
INSERT INTO `region` VALUES ('130629', '130600', '容城县', ',1,130000,130600,130629', 'mainland', '4');
INSERT INTO `region` VALUES ('130630', '130600', '涞源县', ',1,130000,130600,130630', 'mainland', '4');
INSERT INTO `region` VALUES ('130631', '130600', '望都县', ',1,130000,130600,130631', 'mainland', '4');
INSERT INTO `region` VALUES ('130632', '130600', '安新县', ',1,130000,130600,130632', 'mainland', '4');
INSERT INTO `region` VALUES ('130633', '130600', '易县', ',1,130000,130600,130633', 'mainland', '4');
INSERT INTO `region` VALUES ('130634', '130600', '曲阳县', ',1,130000,130600,130634', 'mainland', '4');
INSERT INTO `region` VALUES ('130635', '130600', '蠡县', ',1,130000,130600,130635', 'mainland', '4');
INSERT INTO `region` VALUES ('130636', '130600', '顺平县', ',1,130000,130600,130636', 'mainland', '4');
INSERT INTO `region` VALUES ('130637', '130600', '博野县', ',1,130000,130600,130637', 'mainland', '4');
INSERT INTO `region` VALUES ('130638', '130600', '雄县', ',1,130000,130600,130638', 'mainland', '4');
INSERT INTO `region` VALUES ('130681', '130600', '涿州市', ',1,130000,130600,130681', 'mainland', '4');
INSERT INTO `region` VALUES ('130682', '130600', '定州市', ',1,130000,130600,130682', 'mainland', '4');
INSERT INTO `region` VALUES ('130683', '130600', '安国市', ',1,130000,130600,130683', 'mainland', '4');
INSERT INTO `region` VALUES ('130684', '130600', '高碑店市', ',1,130000,130600,130684', 'mainland', '4');
INSERT INTO `region` VALUES ('130698', '130600', '高开区', ',1,130000,130600,130698', 'mainland', '4');
INSERT INTO `region` VALUES ('130699', '130600', '其它区', ',1,130000,130600,130699', 'mainland', '4');
INSERT INTO `region` VALUES ('130700', '130000', '张家口市', ',1,130000,130700', 'mainland', '3');
INSERT INTO `region` VALUES ('130702', '130700', '桥东区', ',1,130000,130700,130702', 'mainland', '4');
INSERT INTO `region` VALUES ('130703', '130700', '桥西区', ',1,130000,130700,130703', 'mainland', '4');
INSERT INTO `region` VALUES ('130705', '130700', '宣化区', ',1,130000,130700,130705', 'mainland', '4');
INSERT INTO `region` VALUES ('130706', '130700', '下花园区', ',1,130000,130700,130706', 'mainland', '4');
INSERT INTO `region` VALUES ('130721', '130700', '宣化县', ',1,130000,130700,130721', 'mainland', '4');
INSERT INTO `region` VALUES ('130722', '130700', '张北县', ',1,130000,130700,130722', 'mainland', '4');
INSERT INTO `region` VALUES ('130723', '130700', '康保县', ',1,130000,130700,130723', 'mainland', '4');
INSERT INTO `region` VALUES ('130724', '130700', '沽源县', ',1,130000,130700,130724', 'mainland', '4');
INSERT INTO `region` VALUES ('130725', '130700', '尚义县', ',1,130000,130700,130725', 'mainland', '4');
INSERT INTO `region` VALUES ('130726', '130700', '蔚县', ',1,130000,130700,130726', 'mainland', '4');
INSERT INTO `region` VALUES ('130727', '130700', '阳原县', ',1,130000,130700,130727', 'mainland', '4');
INSERT INTO `region` VALUES ('130728', '130700', '怀安县', ',1,130000,130700,130728', 'mainland', '4');
INSERT INTO `region` VALUES ('130729', '130700', '万全县', ',1,130000,130700,130729', 'mainland', '4');
INSERT INTO `region` VALUES ('130730', '130700', '怀来县', ',1,130000,130700,130730', 'mainland', '4');
INSERT INTO `region` VALUES ('130731', '130700', '涿鹿县', ',1,130000,130700,130731', 'mainland', '4');
INSERT INTO `region` VALUES ('130732', '130700', '赤城县', ',1,130000,130700,130732', 'mainland', '4');
INSERT INTO `region` VALUES ('130733', '130700', '崇礼县', ',1,130000,130700,130733', 'mainland', '4');
INSERT INTO `region` VALUES ('130734', '130700', '其它区', ',1,130000,130700,130734', 'mainland', '4');
INSERT INTO `region` VALUES ('130800', '130000', '承德市', ',1,130000,130800', 'mainland', '3');
INSERT INTO `region` VALUES ('130802', '130800', '双桥区', ',1,130000,130800,130802', 'mainland', '4');
INSERT INTO `region` VALUES ('130803', '130800', '双滦区', ',1,130000,130800,130803', 'mainland', '4');
INSERT INTO `region` VALUES ('130804', '130800', '鹰手营子矿区', ',1,130000,130800,130804', 'mainland', '4');
INSERT INTO `region` VALUES ('130821', '130800', '承德县', ',1,130000,130800,130821', 'mainland', '4');
INSERT INTO `region` VALUES ('130822', '130800', '兴隆县', ',1,130000,130800,130822', 'mainland', '4');
INSERT INTO `region` VALUES ('130823', '130800', '平泉县', ',1,130000,130800,130823', 'mainland', '4');
INSERT INTO `region` VALUES ('130824', '130800', '滦平县', ',1,130000,130800,130824', 'mainland', '4');
INSERT INTO `region` VALUES ('130825', '130800', '隆化县', ',1,130000,130800,130825', 'mainland', '4');
INSERT INTO `region` VALUES ('130826', '130800', '丰宁满族自治县', ',1,130000,130800,130826', 'mainland', '4');
INSERT INTO `region` VALUES ('130827', '130800', '宽城满族自治县', ',1,130000,130800,130827', 'mainland', '4');
INSERT INTO `region` VALUES ('130828', '130800', '围场满族蒙古族自治县', ',1,130000,130800,130828', 'mainland', '4');
INSERT INTO `region` VALUES ('130829', '130800', '其它区', ',1,130000,130800,130829', 'mainland', '4');
INSERT INTO `region` VALUES ('130900', '130000', '沧州市', ',1,130000,130900', 'mainland', '3');
INSERT INTO `region` VALUES ('130902', '130900', '新华区', ',1,130000,130900,130902', 'mainland', '4');
INSERT INTO `region` VALUES ('130903', '130900', '运河区', ',1,130000,130900,130903', 'mainland', '4');
INSERT INTO `region` VALUES ('130921', '130900', '沧县', ',1,130000,130900,130921', 'mainland', '4');
INSERT INTO `region` VALUES ('130922', '130900', '青县', ',1,130000,130900,130922', 'mainland', '4');
INSERT INTO `region` VALUES ('130923', '130900', '东光县', ',1,130000,130900,130923', 'mainland', '4');
INSERT INTO `region` VALUES ('130924', '130900', '海兴县', ',1,130000,130900,130924', 'mainland', '4');
INSERT INTO `region` VALUES ('130925', '130900', '盐山县', ',1,130000,130900,130925', 'mainland', '4');
INSERT INTO `region` VALUES ('130926', '130900', '肃宁县', ',1,130000,130900,130926', 'mainland', '4');
INSERT INTO `region` VALUES ('130927', '130900', '南皮县', ',1,130000,130900,130927', 'mainland', '4');
INSERT INTO `region` VALUES ('130928', '130900', '吴桥县', ',1,130000,130900,130928', 'mainland', '4');
INSERT INTO `region` VALUES ('130929', '130900', '献县', ',1,130000,130900,130929', 'mainland', '4');
INSERT INTO `region` VALUES ('130930', '130900', '孟村回族自治县', ',1,130000,130900,130930', 'mainland', '4');
INSERT INTO `region` VALUES ('130981', '130900', '泊头市', ',1,130000,130900,130981', 'mainland', '4');
INSERT INTO `region` VALUES ('130982', '130900', '任丘市', ',1,130000,130900,130982', 'mainland', '4');
INSERT INTO `region` VALUES ('130983', '130900', '黄骅市', ',1,130000,130900,130983', 'mainland', '4');
INSERT INTO `region` VALUES ('130984', '130900', '河间市', ',1,130000,130900,130984', 'mainland', '4');
INSERT INTO `region` VALUES ('130985', '130900', '其它区', ',1,130000,130900,130985', 'mainland', '4');
INSERT INTO `region` VALUES ('131000', '130000', '廊坊市', ',1,130000,131000', 'mainland', '3');
INSERT INTO `region` VALUES ('131002', '131000', '安次区', ',1,130000,131000,131002', 'mainland', '4');
INSERT INTO `region` VALUES ('131003', '131000', '广阳区', ',1,130000,131000,131003', 'mainland', '4');
INSERT INTO `region` VALUES ('131022', '131000', '固安县', ',1,130000,131000,131022', 'mainland', '4');
INSERT INTO `region` VALUES ('131023', '131000', '永清县', ',1,130000,131000,131023', 'mainland', '4');
INSERT INTO `region` VALUES ('131024', '131000', '香河县', ',1,130000,131000,131024', 'mainland', '4');
INSERT INTO `region` VALUES ('131025', '131000', '大城县', ',1,130000,131000,131025', 'mainland', '4');
INSERT INTO `region` VALUES ('131026', '131000', '文安县', ',1,130000,131000,131026', 'mainland', '4');
INSERT INTO `region` VALUES ('131028', '131000', '大厂回族自治县', ',1,130000,131000,131028', 'mainland', '4');
INSERT INTO `region` VALUES ('131051', '131000', '开发区', ',1,130000,131000,131051', 'mainland', '4');
INSERT INTO `region` VALUES ('131052', '131000', '燕郊经济技术开发区', ',1,130000,131000,131052', 'mainland', '4');
INSERT INTO `region` VALUES ('131081', '131000', '霸州市', ',1,130000,131000,131081', 'mainland', '4');
INSERT INTO `region` VALUES ('131082', '131000', '三河市', ',1,130000,131000,131082', 'mainland', '4');
INSERT INTO `region` VALUES ('131083', '131000', '其它区', ',1,130000,131000,131083', 'mainland', '4');
INSERT INTO `region` VALUES ('131100', '130000', '衡水市', ',1,130000,131100', 'mainland', '3');
INSERT INTO `region` VALUES ('131102', '131100', '桃城区', ',1,130000,131100,131102', 'mainland', '4');
INSERT INTO `region` VALUES ('131121', '131100', '枣强县', ',1,130000,131100,131121', 'mainland', '4');
INSERT INTO `region` VALUES ('131122', '131100', '武邑县', ',1,130000,131100,131122', 'mainland', '4');
INSERT INTO `region` VALUES ('131123', '131100', '武强县', ',1,130000,131100,131123', 'mainland', '4');
INSERT INTO `region` VALUES ('131124', '131100', '饶阳县', ',1,130000,131100,131124', 'mainland', '4');
INSERT INTO `region` VALUES ('131125', '131100', '安平县', ',1,130000,131100,131125', 'mainland', '4');
INSERT INTO `region` VALUES ('131126', '131100', '故城县', ',1,130000,131100,131126', 'mainland', '4');
INSERT INTO `region` VALUES ('131127', '131100', '景县', ',1,130000,131100,131127', 'mainland', '4');
INSERT INTO `region` VALUES ('131128', '131100', '阜城县', ',1,130000,131100,131128', 'mainland', '4');
INSERT INTO `region` VALUES ('131181', '131100', '冀州市', ',1,130000,131100,131181', 'mainland', '4');
INSERT INTO `region` VALUES ('131182', '131100', '深州市', ',1,130000,131100,131182', 'mainland', '4');
INSERT INTO `region` VALUES ('131183', '131100', '其它区', ',1,130000,131100,131183', 'mainland', '4');
INSERT INTO `region` VALUES ('140000', '1', '山西省', ',1,140000', 'mainland', '2');
INSERT INTO `region` VALUES ('140100', '140000', '太原市', ',1,140000,140100', 'mainland', '3');
INSERT INTO `region` VALUES ('140105', '140100', '小店区', ',1,140000,140100,140105', 'mainland', '4');
INSERT INTO `region` VALUES ('140106', '140100', '迎泽区', ',1,140000,140100,140106', 'mainland', '4');
INSERT INTO `region` VALUES ('140107', '140100', '杏花岭区', ',1,140000,140100,140107', 'mainland', '4');
INSERT INTO `region` VALUES ('140108', '140100', '尖草坪区', ',1,140000,140100,140108', 'mainland', '4');
INSERT INTO `region` VALUES ('140109', '140100', '万柏林区', ',1,140000,140100,140109', 'mainland', '4');
INSERT INTO `region` VALUES ('140110', '140100', '晋源区', ',1,140000,140100,140110', 'mainland', '4');
INSERT INTO `region` VALUES ('140121', '140100', '清徐县', ',1,140000,140100,140121', 'mainland', '4');
INSERT INTO `region` VALUES ('140122', '140100', '阳曲县', ',1,140000,140100,140122', 'mainland', '4');
INSERT INTO `region` VALUES ('140123', '140100', '娄烦县', ',1,140000,140100,140123', 'mainland', '4');
INSERT INTO `region` VALUES ('140181', '140100', '古交市', ',1,140000,140100,140181', 'mainland', '4');
INSERT INTO `region` VALUES ('140182', '140100', '其它区', ',1,140000,140100,140182', 'mainland', '4');
INSERT INTO `region` VALUES ('140200', '140000', '大同市', ',1,140000,140200', 'mainland', '3');
INSERT INTO `region` VALUES ('140202', '140200', '城区', ',1,140000,140200,140202', 'mainland', '4');
INSERT INTO `region` VALUES ('140203', '140200', '矿区', ',1,140000,140200,140203', 'mainland', '4');
INSERT INTO `region` VALUES ('140211', '140200', '南郊区', ',1,140000,140200,140211', 'mainland', '4');
INSERT INTO `region` VALUES ('140212', '140200', '新荣区', ',1,140000,140200,140212', 'mainland', '4');
INSERT INTO `region` VALUES ('140221', '140200', '阳高县', ',1,140000,140200,140221', 'mainland', '4');
INSERT INTO `region` VALUES ('140222', '140200', '天镇县', ',1,140000,140200,140222', 'mainland', '4');
INSERT INTO `region` VALUES ('140223', '140200', '广灵县', ',1,140000,140200,140223', 'mainland', '4');
INSERT INTO `region` VALUES ('140224', '140200', '灵丘县', ',1,140000,140200,140224', 'mainland', '4');
INSERT INTO `region` VALUES ('140225', '140200', '浑源县', ',1,140000,140200,140225', 'mainland', '4');
INSERT INTO `region` VALUES ('140226', '140200', '左云县', ',1,140000,140200,140226', 'mainland', '4');
INSERT INTO `region` VALUES ('140227', '140200', '大同县', ',1,140000,140200,140227', 'mainland', '4');
INSERT INTO `region` VALUES ('140228', '140200', '其它区', ',1,140000,140200,140228', 'mainland', '4');
INSERT INTO `region` VALUES ('140300', '140000', '阳泉市', ',1,140000,140300', 'mainland', '3');
INSERT INTO `region` VALUES ('140302', '140300', '城区', ',1,140000,140300,140302', 'mainland', '4');
INSERT INTO `region` VALUES ('140303', '140300', '矿区', ',1,140000,140300,140303', 'mainland', '4');
INSERT INTO `region` VALUES ('140311', '140300', '郊区', ',1,140000,140300,140311', 'mainland', '4');
INSERT INTO `region` VALUES ('140321', '140300', '平定县', ',1,140000,140300,140321', 'mainland', '4');
INSERT INTO `region` VALUES ('140322', '140300', '盂县', ',1,140000,140300,140322', 'mainland', '4');
INSERT INTO `region` VALUES ('140323', '140300', '其它区', ',1,140000,140300,140323', 'mainland', '4');
INSERT INTO `region` VALUES ('140400', '140000', '长治市', ',1,140000,140400', 'mainland', '3');
INSERT INTO `region` VALUES ('140421', '140400', '长治县', ',1,140000,140400,140421', 'mainland', '4');
INSERT INTO `region` VALUES ('140423', '140400', '襄垣县', ',1,140000,140400,140423', 'mainland', '4');
INSERT INTO `region` VALUES ('140424', '140400', '屯留县', ',1,140000,140400,140424', 'mainland', '4');
INSERT INTO `region` VALUES ('140425', '140400', '平顺县', ',1,140000,140400,140425', 'mainland', '4');
INSERT INTO `region` VALUES ('140426', '140400', '黎城县', ',1,140000,140400,140426', 'mainland', '4');
INSERT INTO `region` VALUES ('140427', '140400', '壶关县', ',1,140000,140400,140427', 'mainland', '4');
INSERT INTO `region` VALUES ('140428', '140400', '长子县', ',1,140000,140400,140428', 'mainland', '4');
INSERT INTO `region` VALUES ('140429', '140400', '武乡县', ',1,140000,140400,140429', 'mainland', '4');
INSERT INTO `region` VALUES ('140430', '140400', '沁县', ',1,140000,140400,140430', 'mainland', '4');
INSERT INTO `region` VALUES ('140431', '140400', '沁源县', ',1,140000,140400,140431', 'mainland', '4');
INSERT INTO `region` VALUES ('140481', '140400', '潞城市', ',1,140000,140400,140481', 'mainland', '4');
INSERT INTO `region` VALUES ('140482', '140400', '城区', ',1,140000,140400,140482', 'mainland', '4');
INSERT INTO `region` VALUES ('140483', '140400', '郊区', ',1,140000,140400,140483', 'mainland', '4');
INSERT INTO `region` VALUES ('140484', '140400', '高新区', ',1,140000,140400,140484', 'mainland', '4');
INSERT INTO `region` VALUES ('140485', '140400', '其它区', ',1,140000,140400,140485', 'mainland', '4');
INSERT INTO `region` VALUES ('140500', '140000', '晋城市', ',1,140000,140500', 'mainland', '3');
INSERT INTO `region` VALUES ('140502', '140500', '城区', ',1,140000,140500,140502', 'mainland', '4');
INSERT INTO `region` VALUES ('140521', '140500', '沁水县', ',1,140000,140500,140521', 'mainland', '4');
INSERT INTO `region` VALUES ('140522', '140500', '阳城县', ',1,140000,140500,140522', 'mainland', '4');
INSERT INTO `region` VALUES ('140524', '140500', '陵川县', ',1,140000,140500,140524', 'mainland', '4');
INSERT INTO `region` VALUES ('140525', '140500', '泽州县', ',1,140000,140500,140525', 'mainland', '4');
INSERT INTO `region` VALUES ('140581', '140500', '高平市', ',1,140000,140500,140581', 'mainland', '4');
INSERT INTO `region` VALUES ('140582', '140500', '其它区', ',1,140000,140500,140582', 'mainland', '4');
INSERT INTO `region` VALUES ('140600', '140000', '朔州市', ',1,140000,140600', 'mainland', '3');
INSERT INTO `region` VALUES ('140602', '140600', '朔城区', ',1,140000,140600,140602', 'mainland', '4');
INSERT INTO `region` VALUES ('140603', '140600', '平鲁区', ',1,140000,140600,140603', 'mainland', '4');
INSERT INTO `region` VALUES ('140621', '140600', '山阴县', ',1,140000,140600,140621', 'mainland', '4');
INSERT INTO `region` VALUES ('140622', '140600', '应县', ',1,140000,140600,140622', 'mainland', '4');
INSERT INTO `region` VALUES ('140623', '140600', '右玉县', ',1,140000,140600,140623', 'mainland', '4');
INSERT INTO `region` VALUES ('140624', '140600', '怀仁县', ',1,140000,140600,140624', 'mainland', '4');
INSERT INTO `region` VALUES ('140625', '140600', '其它区', ',1,140000,140600,140625', 'mainland', '4');
INSERT INTO `region` VALUES ('140700', '140000', '晋中市', ',1,140000,140700', 'mainland', '3');
INSERT INTO `region` VALUES ('140702', '140700', '榆次区', ',1,140000,140700,140702', 'mainland', '4');
INSERT INTO `region` VALUES ('140721', '140700', '榆社县', ',1,140000,140700,140721', 'mainland', '4');
INSERT INTO `region` VALUES ('140722', '140700', '左权县', ',1,140000,140700,140722', 'mainland', '4');
INSERT INTO `region` VALUES ('140723', '140700', '和顺县', ',1,140000,140700,140723', 'mainland', '4');
INSERT INTO `region` VALUES ('140724', '140700', '昔阳县', ',1,140000,140700,140724', 'mainland', '4');
INSERT INTO `region` VALUES ('140725', '140700', '寿阳县', ',1,140000,140700,140725', 'mainland', '4');
INSERT INTO `region` VALUES ('140726', '140700', '太谷县', ',1,140000,140700,140726', 'mainland', '4');
INSERT INTO `region` VALUES ('140727', '140700', '祁县', ',1,140000,140700,140727', 'mainland', '4');
INSERT INTO `region` VALUES ('140728', '140700', '平遥县', ',1,140000,140700,140728', 'mainland', '4');
INSERT INTO `region` VALUES ('140729', '140700', '灵石县', ',1,140000,140700,140729', 'mainland', '4');
INSERT INTO `region` VALUES ('140781', '140700', '介休市', ',1,140000,140700,140781', 'mainland', '4');
INSERT INTO `region` VALUES ('140782', '140700', '其它区', ',1,140000,140700,140782', 'mainland', '4');
INSERT INTO `region` VALUES ('140800', '140000', '运城市', ',1,140000,140800', 'mainland', '3');
INSERT INTO `region` VALUES ('140802', '140800', '盐湖区', ',1,140000,140800,140802', 'mainland', '4');
INSERT INTO `region` VALUES ('140821', '140800', '临猗县', ',1,140000,140800,140821', 'mainland', '4');
INSERT INTO `region` VALUES ('140822', '140800', '万荣县', ',1,140000,140800,140822', 'mainland', '4');
INSERT INTO `region` VALUES ('140823', '140800', '闻喜县', ',1,140000,140800,140823', 'mainland', '4');
INSERT INTO `region` VALUES ('140824', '140800', '稷山县', ',1,140000,140800,140824', 'mainland', '4');
INSERT INTO `region` VALUES ('140825', '140800', '新绛县', ',1,140000,140800,140825', 'mainland', '4');
INSERT INTO `region` VALUES ('140826', '140800', '绛县', ',1,140000,140800,140826', 'mainland', '4');
INSERT INTO `region` VALUES ('140827', '140800', '垣曲县', ',1,140000,140800,140827', 'mainland', '4');
INSERT INTO `region` VALUES ('140828', '140800', '夏县', ',1,140000,140800,140828', 'mainland', '4');
INSERT INTO `region` VALUES ('140829', '140800', '平陆县', ',1,140000,140800,140829', 'mainland', '4');
INSERT INTO `region` VALUES ('140830', '140800', '芮城县', ',1,140000,140800,140830', 'mainland', '4');
INSERT INTO `region` VALUES ('140881', '140800', '永济市', ',1,140000,140800,140881', 'mainland', '4');
INSERT INTO `region` VALUES ('140882', '140800', '河津市', ',1,140000,140800,140882', 'mainland', '4');
INSERT INTO `region` VALUES ('140883', '140800', '其它区', ',1,140000,140800,140883', 'mainland', '4');
INSERT INTO `region` VALUES ('140900', '140000', '忻州市', ',1,140000,140900', 'mainland', '3');
INSERT INTO `region` VALUES ('140902', '140900', '忻府区', ',1,140000,140900,140902', 'mainland', '4');
INSERT INTO `region` VALUES ('140921', '140900', '定襄县', ',1,140000,140900,140921', 'mainland', '4');
INSERT INTO `region` VALUES ('140922', '140900', '五台县', ',1,140000,140900,140922', 'mainland', '4');
INSERT INTO `region` VALUES ('140923', '140900', '代县', ',1,140000,140900,140923', 'mainland', '4');
INSERT INTO `region` VALUES ('140924', '140900', '繁峙县', ',1,140000,140900,140924', 'mainland', '4');
INSERT INTO `region` VALUES ('140925', '140900', '宁武县', ',1,140000,140900,140925', 'mainland', '4');
INSERT INTO `region` VALUES ('140926', '140900', '静乐县', ',1,140000,140900,140926', 'mainland', '4');
INSERT INTO `region` VALUES ('140927', '140900', '神池县', ',1,140000,140900,140927', 'mainland', '4');
INSERT INTO `region` VALUES ('140928', '140900', '五寨县', ',1,140000,140900,140928', 'mainland', '4');
INSERT INTO `region` VALUES ('140929', '140900', '岢岚县', ',1,140000,140900,140929', 'mainland', '4');
INSERT INTO `region` VALUES ('140930', '140900', '河曲县', ',1,140000,140900,140930', 'mainland', '4');
INSERT INTO `region` VALUES ('140931', '140900', '保德县', ',1,140000,140900,140931', 'mainland', '4');
INSERT INTO `region` VALUES ('140932', '140900', '偏关县', ',1,140000,140900,140932', 'mainland', '4');
INSERT INTO `region` VALUES ('140981', '140900', '原平市', ',1,140000,140900,140981', 'mainland', '4');
INSERT INTO `region` VALUES ('140982', '140900', '其它区', ',1,140000,140900,140982', 'mainland', '4');
INSERT INTO `region` VALUES ('141000', '140000', '临汾市', ',1,140000,141000', 'mainland', '3');
INSERT INTO `region` VALUES ('141002', '141000', '尧都区', ',1,140000,141000,141002', 'mainland', '4');
INSERT INTO `region` VALUES ('141021', '141000', '曲沃县', ',1,140000,141000,141021', 'mainland', '4');
INSERT INTO `region` VALUES ('141022', '141000', '翼城县', ',1,140000,141000,141022', 'mainland', '4');
INSERT INTO `region` VALUES ('141023', '141000', '襄汾县', ',1,140000,141000,141023', 'mainland', '4');
INSERT INTO `region` VALUES ('141024', '141000', '洪洞县', ',1,140000,141000,141024', 'mainland', '4');
INSERT INTO `region` VALUES ('141025', '141000', '古县', ',1,140000,141000,141025', 'mainland', '4');
INSERT INTO `region` VALUES ('141026', '141000', '安泽县', ',1,140000,141000,141026', 'mainland', '4');
INSERT INTO `region` VALUES ('141027', '141000', '浮山县', ',1,140000,141000,141027', 'mainland', '4');
INSERT INTO `region` VALUES ('141028', '141000', '吉县', ',1,140000,141000,141028', 'mainland', '4');
INSERT INTO `region` VALUES ('141029', '141000', '乡宁县', ',1,140000,141000,141029', 'mainland', '4');
INSERT INTO `region` VALUES ('141030', '141000', '大宁县', ',1,140000,141000,141030', 'mainland', '4');
INSERT INTO `region` VALUES ('141031', '141000', '隰县', ',1,140000,141000,141031', 'mainland', '4');
INSERT INTO `region` VALUES ('141032', '141000', '永和县', ',1,140000,141000,141032', 'mainland', '4');
INSERT INTO `region` VALUES ('141033', '141000', '蒲县', ',1,140000,141000,141033', 'mainland', '4');
INSERT INTO `region` VALUES ('141034', '141000', '汾西县', ',1,140000,141000,141034', 'mainland', '4');
INSERT INTO `region` VALUES ('141081', '141000', '侯马市', ',1,140000,141000,141081', 'mainland', '4');
INSERT INTO `region` VALUES ('141082', '141000', '霍州市', ',1,140000,141000,141082', 'mainland', '4');
INSERT INTO `region` VALUES ('141083', '141000', '其它区', ',1,140000,141000,141083', 'mainland', '4');
INSERT INTO `region` VALUES ('141100', '140000', '吕梁市', ',1,140000,141100', 'mainland', '3');
INSERT INTO `region` VALUES ('141102', '141100', '离石区', ',1,140000,141100,141102', 'mainland', '4');
INSERT INTO `region` VALUES ('141121', '141100', '文水县', ',1,140000,141100,141121', 'mainland', '4');
INSERT INTO `region` VALUES ('141122', '141100', '交城县', ',1,140000,141100,141122', 'mainland', '4');
INSERT INTO `region` VALUES ('141123', '141100', '兴县', ',1,140000,141100,141123', 'mainland', '4');
INSERT INTO `region` VALUES ('141124', '141100', '临县', ',1,140000,141100,141124', 'mainland', '4');
INSERT INTO `region` VALUES ('141125', '141100', '柳林县', ',1,140000,141100,141125', 'mainland', '4');
INSERT INTO `region` VALUES ('141126', '141100', '石楼县', ',1,140000,141100,141126', 'mainland', '4');
INSERT INTO `region` VALUES ('141127', '141100', '岚县', ',1,140000,141100,141127', 'mainland', '4');
INSERT INTO `region` VALUES ('141128', '141100', '方山县', ',1,140000,141100,141128', 'mainland', '4');
INSERT INTO `region` VALUES ('141129', '141100', '中阳县', ',1,140000,141100,141129', 'mainland', '4');
INSERT INTO `region` VALUES ('141130', '141100', '交口县', ',1,140000,141100,141130', 'mainland', '4');
INSERT INTO `region` VALUES ('141181', '141100', '孝义市', ',1,140000,141100,141181', 'mainland', '4');
INSERT INTO `region` VALUES ('141182', '141100', '汾阳市', ',1,140000,141100,141182', 'mainland', '4');
INSERT INTO `region` VALUES ('141183', '141100', '其它区', ',1,140000,141100,141183', 'mainland', '4');
INSERT INTO `region` VALUES ('150000', '1', '内蒙古自治区', ',1,150000', 'mainland', '2');
INSERT INTO `region` VALUES ('150100', '150000', '呼和浩特市', ',1,150000,150100', 'mainland', '3');
INSERT INTO `region` VALUES ('150102', '150100', '新城区', ',1,150000,150100,150102', 'mainland', '4');
INSERT INTO `region` VALUES ('150103', '150100', '回民区', ',1,150000,150100,150103', 'mainland', '4');
INSERT INTO `region` VALUES ('150104', '150100', '玉泉区', ',1,150000,150100,150104', 'mainland', '4');
INSERT INTO `region` VALUES ('150105', '150100', '赛罕区', ',1,150000,150100,150105', 'mainland', '4');
INSERT INTO `region` VALUES ('150121', '150100', '土默特左旗', ',1,150000,150100,150121', 'mainland', '4');
INSERT INTO `region` VALUES ('150122', '150100', '托克托县', ',1,150000,150100,150122', 'mainland', '4');
INSERT INTO `region` VALUES ('150123', '150100', '和林格尔县', ',1,150000,150100,150123', 'mainland', '4');
INSERT INTO `region` VALUES ('150124', '150100', '清水河县', ',1,150000,150100,150124', 'mainland', '4');
INSERT INTO `region` VALUES ('150125', '150100', '武川县', ',1,150000,150100,150125', 'mainland', '4');
INSERT INTO `region` VALUES ('150126', '150100', '其它区', ',1,150000,150100,150126', 'mainland', '4');
INSERT INTO `region` VALUES ('150200', '150000', '包头市', ',1,150000,150200', 'mainland', '3');
INSERT INTO `region` VALUES ('150202', '150200', '东河区', ',1,150000,150200,150202', 'mainland', '4');
INSERT INTO `region` VALUES ('150203', '150200', '昆都仑区', ',1,150000,150200,150203', 'mainland', '4');
INSERT INTO `region` VALUES ('150204', '150200', '青山区', ',1,150000,150200,150204', 'mainland', '4');
INSERT INTO `region` VALUES ('150205', '150200', '石拐区', ',1,150000,150200,150205', 'mainland', '4');
INSERT INTO `region` VALUES ('150206', '150200', '白云矿区', ',1,150000,150200,150206', 'mainland', '4');
INSERT INTO `region` VALUES ('150207', '150200', '九原区', ',1,150000,150200,150207', 'mainland', '4');
INSERT INTO `region` VALUES ('150221', '150200', '土默特右旗', ',1,150000,150200,150221', 'mainland', '4');
INSERT INTO `region` VALUES ('150222', '150200', '固阳县', ',1,150000,150200,150222', 'mainland', '4');
INSERT INTO `region` VALUES ('150223', '150200', '达尔罕茂明安联合旗', ',1,150000,150200,150223', 'mainland', '4');
INSERT INTO `region` VALUES ('150224', '150200', '其它区', ',1,150000,150200,150224', 'mainland', '4');
INSERT INTO `region` VALUES ('150300', '150000', '乌海市', ',1,150000,150300', 'mainland', '3');
INSERT INTO `region` VALUES ('150302', '150300', '海勃湾区', ',1,150000,150300,150302', 'mainland', '4');
INSERT INTO `region` VALUES ('150303', '150300', '海南区', ',1,150000,150300,150303', 'mainland', '4');
INSERT INTO `region` VALUES ('150304', '150300', '乌达区', ',1,150000,150300,150304', 'mainland', '4');
INSERT INTO `region` VALUES ('150305', '150300', '其它区', ',1,150000,150300,150305', 'mainland', '4');
INSERT INTO `region` VALUES ('150400', '150000', '赤峰市', ',1,150000,150400', 'mainland', '3');
INSERT INTO `region` VALUES ('150402', '150400', '红山区', ',1,150000,150400,150402', 'mainland', '4');
INSERT INTO `region` VALUES ('150403', '150400', '元宝山区', ',1,150000,150400,150403', 'mainland', '4');
INSERT INTO `region` VALUES ('150404', '150400', '松山区', ',1,150000,150400,150404', 'mainland', '4');
INSERT INTO `region` VALUES ('150421', '150400', '阿鲁科尔沁旗', ',1,150000,150400,150421', 'mainland', '4');
INSERT INTO `region` VALUES ('150422', '150400', '巴林左旗', ',1,150000,150400,150422', 'mainland', '4');
INSERT INTO `region` VALUES ('150423', '150400', '巴林右旗', ',1,150000,150400,150423', 'mainland', '4');
INSERT INTO `region` VALUES ('150424', '150400', '林西县', ',1,150000,150400,150424', 'mainland', '4');
INSERT INTO `region` VALUES ('150425', '150400', '克什克腾旗', ',1,150000,150400,150425', 'mainland', '4');
INSERT INTO `region` VALUES ('150426', '150400', '翁牛特旗', ',1,150000,150400,150426', 'mainland', '4');
INSERT INTO `region` VALUES ('150428', '150400', '喀喇沁旗', ',1,150000,150400,150428', 'mainland', '4');
INSERT INTO `region` VALUES ('150429', '150400', '宁城县', ',1,150000,150400,150429', 'mainland', '4');
INSERT INTO `region` VALUES ('150430', '150400', '敖汉旗', ',1,150000,150400,150430', 'mainland', '4');
INSERT INTO `region` VALUES ('150431', '150400', '其它区', ',1,150000,150400,150431', 'mainland', '4');
INSERT INTO `region` VALUES ('150500', '150000', '通辽市', ',1,150000,150500', 'mainland', '3');
INSERT INTO `region` VALUES ('150502', '150500', '科尔沁区', ',1,150000,150500,150502', 'mainland', '4');
INSERT INTO `region` VALUES ('150521', '150500', '科尔沁左翼中旗', ',1,150000,150500,150521', 'mainland', '4');
INSERT INTO `region` VALUES ('150522', '150500', '科尔沁左翼后旗', ',1,150000,150500,150522', 'mainland', '4');
INSERT INTO `region` VALUES ('150523', '150500', '开鲁县', ',1,150000,150500,150523', 'mainland', '4');
INSERT INTO `region` VALUES ('150524', '150500', '库伦旗', ',1,150000,150500,150524', 'mainland', '4');
INSERT INTO `region` VALUES ('150525', '150500', '奈曼旗', ',1,150000,150500,150525', 'mainland', '4');
INSERT INTO `region` VALUES ('150526', '150500', '扎鲁特旗', ',1,150000,150500,150526', 'mainland', '4');
INSERT INTO `region` VALUES ('150581', '150500', '霍林郭勒市', ',1,150000,150500,150581', 'mainland', '4');
INSERT INTO `region` VALUES ('150582', '150500', '其它区', ',1,150000,150500,150582', 'mainland', '4');
INSERT INTO `region` VALUES ('150600', '150000', '鄂尔多斯市', ',1,150000,150600', 'mainland', '3');
INSERT INTO `region` VALUES ('150602', '150600', '东胜区', ',1,150000,150600,150602', 'mainland', '4');
INSERT INTO `region` VALUES ('150621', '150600', '达拉特旗', ',1,150000,150600,150621', 'mainland', '4');
INSERT INTO `region` VALUES ('150622', '150600', '准格尔旗', ',1,150000,150600,150622', 'mainland', '4');
INSERT INTO `region` VALUES ('150623', '150600', '鄂托克前旗', ',1,150000,150600,150623', 'mainland', '4');
INSERT INTO `region` VALUES ('150624', '150600', '鄂托克旗', ',1,150000,150600,150624', 'mainland', '4');
INSERT INTO `region` VALUES ('150625', '150600', '杭锦旗', ',1,150000,150600,150625', 'mainland', '4');
INSERT INTO `region` VALUES ('150626', '150600', '乌审旗', ',1,150000,150600,150626', 'mainland', '4');
INSERT INTO `region` VALUES ('150627', '150600', '伊金霍洛旗', ',1,150000,150600,150627', 'mainland', '4');
INSERT INTO `region` VALUES ('150628', '150600', '其它区', ',1,150000,150600,150628', 'mainland', '4');
INSERT INTO `region` VALUES ('150700', '150000', '呼伦贝尔市', ',1,150000,150700', 'mainland', '3');
INSERT INTO `region` VALUES ('150702', '150700', '海拉尔区', ',1,150000,150700,150702', 'mainland', '4');
INSERT INTO `region` VALUES ('150721', '150700', '阿荣旗', ',1,150000,150700,150721', 'mainland', '4');
INSERT INTO `region` VALUES ('150722', '150700', '莫力达瓦达斡尔族自治旗', ',1,150000,150700,150722', 'mainland', '4');
INSERT INTO `region` VALUES ('150723', '150700', '鄂伦春自治旗', ',1,150000,150700,150723', 'mainland', '4');
INSERT INTO `region` VALUES ('150724', '150700', '鄂温克族自治旗', ',1,150000,150700,150724', 'mainland', '4');
INSERT INTO `region` VALUES ('150725', '150700', '陈巴尔虎旗', ',1,150000,150700,150725', 'mainland', '4');
INSERT INTO `region` VALUES ('150726', '150700', '新巴尔虎左旗', ',1,150000,150700,150726', 'mainland', '4');
INSERT INTO `region` VALUES ('150727', '150700', '新巴尔虎右旗', ',1,150000,150700,150727', 'mainland', '4');
INSERT INTO `region` VALUES ('150781', '150700', '满洲里市', ',1,150000,150700,150781', 'mainland', '4');
INSERT INTO `region` VALUES ('150782', '150700', '牙克石市', ',1,150000,150700,150782', 'mainland', '4');
INSERT INTO `region` VALUES ('150783', '150700', '扎兰屯市', ',1,150000,150700,150783', 'mainland', '4');
INSERT INTO `region` VALUES ('150784', '150700', '额尔古纳市', ',1,150000,150700,150784', 'mainland', '4');
INSERT INTO `region` VALUES ('150785', '150700', '根河市', ',1,150000,150700,150785', 'mainland', '4');
INSERT INTO `region` VALUES ('150786', '150700', '其它区', ',1,150000,150700,150786', 'mainland', '4');
INSERT INTO `region` VALUES ('150800', '150000', '巴彦淖尔市', ',1,150000,150800', 'mainland', '3');
INSERT INTO `region` VALUES ('150802', '150800', '临河区', ',1,150000,150800,150802', 'mainland', '4');
INSERT INTO `region` VALUES ('150821', '150800', '五原县', ',1,150000,150800,150821', 'mainland', '4');
INSERT INTO `region` VALUES ('150822', '150800', '磴口县', ',1,150000,150800,150822', 'mainland', '4');
INSERT INTO `region` VALUES ('150823', '150800', '乌拉特前旗', ',1,150000,150800,150823', 'mainland', '4');
INSERT INTO `region` VALUES ('150824', '150800', '乌拉特中旗', ',1,150000,150800,150824', 'mainland', '4');
INSERT INTO `region` VALUES ('150825', '150800', '乌拉特后旗', ',1,150000,150800,150825', 'mainland', '4');
INSERT INTO `region` VALUES ('150826', '150800', '杭锦后旗', ',1,150000,150800,150826', 'mainland', '4');
INSERT INTO `region` VALUES ('150827', '150800', '其它区', ',1,150000,150800,150827', 'mainland', '4');
INSERT INTO `region` VALUES ('150900', '150000', '乌兰察布市', ',1,150000,150900', 'mainland', '3');
INSERT INTO `region` VALUES ('150902', '150900', '集宁区', ',1,150000,150900,150902', 'mainland', '4');
INSERT INTO `region` VALUES ('150921', '150900', '卓资县', ',1,150000,150900,150921', 'mainland', '4');
INSERT INTO `region` VALUES ('150922', '150900', '化德县', ',1,150000,150900,150922', 'mainland', '4');
INSERT INTO `region` VALUES ('150923', '150900', '商都县', ',1,150000,150900,150923', 'mainland', '4');
INSERT INTO `region` VALUES ('150924', '150900', '兴和县', ',1,150000,150900,150924', 'mainland', '4');
INSERT INTO `region` VALUES ('150925', '150900', '凉城县', ',1,150000,150900,150925', 'mainland', '4');
INSERT INTO `region` VALUES ('150926', '150900', '察哈尔右翼前旗', ',1,150000,150900,150926', 'mainland', '4');
INSERT INTO `region` VALUES ('150927', '150900', '察哈尔右翼中旗', ',1,150000,150900,150927', 'mainland', '4');
INSERT INTO `region` VALUES ('150928', '150900', '察哈尔右翼后旗', ',1,150000,150900,150928', 'mainland', '4');
INSERT INTO `region` VALUES ('150929', '150900', '四子王旗', ',1,150000,150900,150929', 'mainland', '4');
INSERT INTO `region` VALUES ('150981', '150900', '丰镇市', ',1,150000,150900,150981', 'mainland', '4');
INSERT INTO `region` VALUES ('150982', '150900', '其它区', ',1,150000,150900,150982', 'mainland', '4');
INSERT INTO `region` VALUES ('152200', '150000', '兴安盟', ',1,150000,152200', 'mainland', '3');
INSERT INTO `region` VALUES ('152201', '152200', '乌兰浩特市', ',1,150000,152200,152201', 'mainland', '4');
INSERT INTO `region` VALUES ('152202', '152200', '阿尔山市', ',1,150000,152200,152202', 'mainland', '4');
INSERT INTO `region` VALUES ('152221', '152200', '科尔沁右翼前旗', ',1,150000,152200,152221', 'mainland', '4');
INSERT INTO `region` VALUES ('152222', '152200', '科尔沁右翼中旗', ',1,150000,152200,152222', 'mainland', '4');
INSERT INTO `region` VALUES ('152223', '152200', '扎赉特旗', ',1,150000,152200,152223', 'mainland', '4');
INSERT INTO `region` VALUES ('152224', '152200', '突泉县', ',1,150000,152200,152224', 'mainland', '4');
INSERT INTO `region` VALUES ('152225', '152200', '其它区', ',1,150000,152200,152225', 'mainland', '4');
INSERT INTO `region` VALUES ('152500', '150000', '锡林郭勒盟', ',1,150000,152500', 'mainland', '3');
INSERT INTO `region` VALUES ('152501', '152500', '二连浩特市', ',1,150000,152500,152501', 'mainland', '4');
INSERT INTO `region` VALUES ('152502', '152500', '锡林浩特市', ',1,150000,152500,152502', 'mainland', '4');
INSERT INTO `region` VALUES ('152522', '152500', '阿巴嘎旗', ',1,150000,152500,152522', 'mainland', '4');
INSERT INTO `region` VALUES ('152523', '152500', '苏尼特左旗', ',1,150000,152500,152523', 'mainland', '4');
INSERT INTO `region` VALUES ('152524', '152500', '苏尼特右旗', ',1,150000,152500,152524', 'mainland', '4');
INSERT INTO `region` VALUES ('152525', '152500', '东乌珠穆沁旗', ',1,150000,152500,152525', 'mainland', '4');
INSERT INTO `region` VALUES ('152526', '152500', '西乌珠穆沁旗', ',1,150000,152500,152526', 'mainland', '4');
INSERT INTO `region` VALUES ('152527', '152500', '太仆寺旗', ',1,150000,152500,152527', 'mainland', '4');
INSERT INTO `region` VALUES ('152528', '152500', '镶黄旗', ',1,150000,152500,152528', 'mainland', '4');
INSERT INTO `region` VALUES ('152529', '152500', '正镶白旗', ',1,150000,152500,152529', 'mainland', '4');
INSERT INTO `region` VALUES ('152530', '152500', '正蓝旗', ',1,150000,152500,152530', 'mainland', '4');
INSERT INTO `region` VALUES ('152531', '152500', '多伦县', ',1,150000,152500,152531', 'mainland', '4');
INSERT INTO `region` VALUES ('152532', '152500', '其它区', ',1,150000,152500,152532', 'mainland', '4');
INSERT INTO `region` VALUES ('152900', '150000', '阿拉善盟', ',1,150000,152900', 'mainland', '3');
INSERT INTO `region` VALUES ('152921', '152900', '阿拉善左旗', ',1,150000,152900,152921', 'mainland', '4');
INSERT INTO `region` VALUES ('152922', '152900', '阿拉善右旗', ',1,150000,152900,152922', 'mainland', '4');
INSERT INTO `region` VALUES ('152923', '152900', '额济纳旗', ',1,150000,152900,152923', 'mainland', '4');
INSERT INTO `region` VALUES ('152924', '152900', '其它区', ',1,150000,152900,152924', 'mainland', '4');
INSERT INTO `region` VALUES ('210000', '1', '辽宁省', ',1,210000', 'mainland', '2');
INSERT INTO `region` VALUES ('210100', '210000', '沈阳市', ',1,210000,210100', 'mainland', '3');
INSERT INTO `region` VALUES ('210102', '210100', '和平区', ',1,210000,210100,210102', 'mainland', '4');
INSERT INTO `region` VALUES ('210103', '210100', '沈河区', ',1,210000,210100,210103', 'mainland', '4');
INSERT INTO `region` VALUES ('210104', '210100', '大东区', ',1,210000,210100,210104', 'mainland', '4');
INSERT INTO `region` VALUES ('210105', '210100', '皇姑区', ',1,210000,210100,210105', 'mainland', '4');
INSERT INTO `region` VALUES ('210106', '210100', '铁西区', ',1,210000,210100,210106', 'mainland', '4');
INSERT INTO `region` VALUES ('210111', '210100', '苏家屯区', ',1,210000,210100,210111', 'mainland', '4');
INSERT INTO `region` VALUES ('210112', '210100', '东陵区', ',1,210000,210100,210112', 'mainland', '4');
INSERT INTO `region` VALUES ('210113', '210100', '新城子区', ',1,210000,210100,210113', 'mainland', '4');
INSERT INTO `region` VALUES ('210114', '210100', '于洪区', ',1,210000,210100,210114', 'mainland', '4');
INSERT INTO `region` VALUES ('210122', '210100', '辽中县', ',1,210000,210100,210122', 'mainland', '4');
INSERT INTO `region` VALUES ('210123', '210100', '康平县', ',1,210000,210100,210123', 'mainland', '4');
INSERT INTO `region` VALUES ('210124', '210100', '法库县', ',1,210000,210100,210124', 'mainland', '4');
INSERT INTO `region` VALUES ('210181', '210100', '新民市', ',1,210000,210100,210181', 'mainland', '4');
INSERT INTO `region` VALUES ('210182', '210100', '浑南新区', ',1,210000,210100,210182', 'mainland', '4');
INSERT INTO `region` VALUES ('210183', '210100', '张士开发区', ',1,210000,210100,210183', 'mainland', '4');
INSERT INTO `region` VALUES ('210184', '210100', '沈北新区', ',1,210000,210100,210184', 'mainland', '4');
INSERT INTO `region` VALUES ('210185', '210100', '其它区', ',1,210000,210100,210185', 'mainland', '4');
INSERT INTO `region` VALUES ('210200', '210000', '大连市', ',1,210000,210200', 'mainland', '3');
INSERT INTO `region` VALUES ('210202', '210200', '中山区', ',1,210000,210200,210202', 'mainland', '4');
INSERT INTO `region` VALUES ('210203', '210200', '西岗区', ',1,210000,210200,210203', 'mainland', '4');
INSERT INTO `region` VALUES ('210204', '210200', '沙河口区', ',1,210000,210200,210204', 'mainland', '4');
INSERT INTO `region` VALUES ('210211', '210200', '甘井子区', ',1,210000,210200,210211', 'mainland', '4');
INSERT INTO `region` VALUES ('210212', '210200', '旅顺口区', ',1,210000,210200,210212', 'mainland', '4');
INSERT INTO `region` VALUES ('210213', '210200', '金州区', ',1,210000,210200,210213', 'mainland', '4');
INSERT INTO `region` VALUES ('210224', '210200', '长海县', ',1,210000,210200,210224', 'mainland', '4');
INSERT INTO `region` VALUES ('210251', '210200', '开发区', ',1,210000,210200,210251', 'mainland', '4');
INSERT INTO `region` VALUES ('210281', '210200', '瓦房店市', ',1,210000,210200,210281', 'mainland', '4');
INSERT INTO `region` VALUES ('210282', '210200', '普兰店市', ',1,210000,210200,210282', 'mainland', '4');
INSERT INTO `region` VALUES ('210283', '210200', '庄河市', ',1,210000,210200,210283', 'mainland', '4');
INSERT INTO `region` VALUES ('210297', '210200', '岭前区', ',1,210000,210200,210297', 'mainland', '4');
INSERT INTO `region` VALUES ('210298', '210200', '其它区', ',1,210000,210200,210298', 'mainland', '4');
INSERT INTO `region` VALUES ('210300', '210000', '鞍山市', ',1,210000,210300', 'mainland', '3');
INSERT INTO `region` VALUES ('210302', '210300', '铁东区', ',1,210000,210300,210302', 'mainland', '4');
INSERT INTO `region` VALUES ('210303', '210300', '铁西区', ',1,210000,210300,210303', 'mainland', '4');
INSERT INTO `region` VALUES ('210304', '210300', '立山区', ',1,210000,210300,210304', 'mainland', '4');
INSERT INTO `region` VALUES ('210311', '210300', '千山区', ',1,210000,210300,210311', 'mainland', '4');
INSERT INTO `region` VALUES ('210321', '210300', '台安县', ',1,210000,210300,210321', 'mainland', '4');
INSERT INTO `region` VALUES ('210323', '210300', '岫岩满族自治县', ',1,210000,210300,210323', 'mainland', '4');
INSERT INTO `region` VALUES ('210351', '210300', '高新区', ',1,210000,210300,210351', 'mainland', '4');
INSERT INTO `region` VALUES ('210381', '210300', '海城市', ',1,210000,210300,210381', 'mainland', '4');
INSERT INTO `region` VALUES ('210382', '210300', '其它区', ',1,210000,210300,210382', 'mainland', '4');
INSERT INTO `region` VALUES ('210400', '210000', '抚顺市', ',1,210000,210400', 'mainland', '3');
INSERT INTO `region` VALUES ('210402', '210400', '新抚区', ',1,210000,210400,210402', 'mainland', '4');
INSERT INTO `region` VALUES ('210403', '210400', '东洲区', ',1,210000,210400,210403', 'mainland', '4');
INSERT INTO `region` VALUES ('210404', '210400', '望花区', ',1,210000,210400,210404', 'mainland', '4');
INSERT INTO `region` VALUES ('210411', '210400', '顺城区', ',1,210000,210400,210411', 'mainland', '4');
INSERT INTO `region` VALUES ('210421', '210400', '抚顺县', ',1,210000,210400,210421', 'mainland', '4');
INSERT INTO `region` VALUES ('210422', '210400', '新宾满族自治县', ',1,210000,210400,210422', 'mainland', '4');
INSERT INTO `region` VALUES ('210423', '210400', '清原满族自治县', ',1,210000,210400,210423', 'mainland', '4');
INSERT INTO `region` VALUES ('210424', '210400', '其它区', ',1,210000,210400,210424', 'mainland', '4');
INSERT INTO `region` VALUES ('210500', '210000', '本溪市', ',1,210000,210500', 'mainland', '3');
INSERT INTO `region` VALUES ('210502', '210500', '平山区', ',1,210000,210500,210502', 'mainland', '4');
INSERT INTO `region` VALUES ('210503', '210500', '溪湖区', ',1,210000,210500,210503', 'mainland', '4');
INSERT INTO `region` VALUES ('210504', '210500', '明山区', ',1,210000,210500,210504', 'mainland', '4');
INSERT INTO `region` VALUES ('210505', '210500', '南芬区', ',1,210000,210500,210505', 'mainland', '4');
INSERT INTO `region` VALUES ('210521', '210500', '本溪满族自治县', ',1,210000,210500,210521', 'mainland', '4');
INSERT INTO `region` VALUES ('210522', '210500', '桓仁满族自治县', ',1,210000,210500,210522', 'mainland', '4');
INSERT INTO `region` VALUES ('210523', '210500', '其它区', ',1,210000,210500,210523', 'mainland', '4');
INSERT INTO `region` VALUES ('210600', '210000', '丹东市', ',1,210000,210600', 'mainland', '3');
INSERT INTO `region` VALUES ('210602', '210600', '元宝区', ',1,210000,210600,210602', 'mainland', '4');
INSERT INTO `region` VALUES ('210603', '210600', '振兴区', ',1,210000,210600,210603', 'mainland', '4');
INSERT INTO `region` VALUES ('210604', '210600', '振安区', ',1,210000,210600,210604', 'mainland', '4');
INSERT INTO `region` VALUES ('210624', '210600', '宽甸满族自治县', ',1,210000,210600,210624', 'mainland', '4');
INSERT INTO `region` VALUES ('210681', '210600', '东港市', ',1,210000,210600,210681', 'mainland', '4');
INSERT INTO `region` VALUES ('210682', '210600', '凤城市', ',1,210000,210600,210682', 'mainland', '4');
INSERT INTO `region` VALUES ('210683', '210600', '其它区', ',1,210000,210600,210683', 'mainland', '4');
INSERT INTO `region` VALUES ('210700', '210000', '锦州市', ',1,210000,210700', 'mainland', '3');
INSERT INTO `region` VALUES ('210702', '210700', '古塔区', ',1,210000,210700,210702', 'mainland', '4');
INSERT INTO `region` VALUES ('210703', '210700', '凌河区', ',1,210000,210700,210703', 'mainland', '4');
INSERT INTO `region` VALUES ('210711', '210700', '太和区', ',1,210000,210700,210711', 'mainland', '4');
INSERT INTO `region` VALUES ('210726', '210700', '黑山县', ',1,210000,210700,210726', 'mainland', '4');
INSERT INTO `region` VALUES ('210727', '210700', '义县', ',1,210000,210700,210727', 'mainland', '4');
INSERT INTO `region` VALUES ('210781', '210700', '凌海市', ',1,210000,210700,210781', 'mainland', '4');
INSERT INTO `region` VALUES ('210782', '210700', '北镇市', ',1,210000,210700,210782', 'mainland', '4');
INSERT INTO `region` VALUES ('210783', '210700', '其它区', ',1,210000,210700,210783', 'mainland', '4');
INSERT INTO `region` VALUES ('210800', '210000', '营口市', ',1,210000,210800', 'mainland', '3');
INSERT INTO `region` VALUES ('210802', '210800', '站前区', ',1,210000,210800,210802', 'mainland', '4');
INSERT INTO `region` VALUES ('210803', '210800', '西市区', ',1,210000,210800,210803', 'mainland', '4');
INSERT INTO `region` VALUES ('210804', '210800', '鲅鱼圈区', ',1,210000,210800,210804', 'mainland', '4');
INSERT INTO `region` VALUES ('210811', '210800', '老边区', ',1,210000,210800,210811', 'mainland', '4');
INSERT INTO `region` VALUES ('210881', '210800', '盖州市', ',1,210000,210800,210881', 'mainland', '4');
INSERT INTO `region` VALUES ('210882', '210800', '大石桥市', ',1,210000,210800,210882', 'mainland', '4');
INSERT INTO `region` VALUES ('210883', '210800', '其它区', ',1,210000,210800,210883', 'mainland', '4');
INSERT INTO `region` VALUES ('210900', '210000', '阜新市', ',1,210000,210900', 'mainland', '3');
INSERT INTO `region` VALUES ('210902', '210900', '海州区', ',1,210000,210900,210902', 'mainland', '4');
INSERT INTO `region` VALUES ('210903', '210900', '新邱区', ',1,210000,210900,210903', 'mainland', '4');
INSERT INTO `region` VALUES ('210904', '210900', '太平区', ',1,210000,210900,210904', 'mainland', '4');
INSERT INTO `region` VALUES ('210905', '210900', '清河门区', ',1,210000,210900,210905', 'mainland', '4');
INSERT INTO `region` VALUES ('210911', '210900', '细河区', ',1,210000,210900,210911', 'mainland', '4');
INSERT INTO `region` VALUES ('210921', '210900', '阜新蒙古族自治县', ',1,210000,210900,210921', 'mainland', '4');
INSERT INTO `region` VALUES ('210922', '210900', '彰武县', ',1,210000,210900,210922', 'mainland', '4');
INSERT INTO `region` VALUES ('210923', '210900', '其它区', ',1,210000,210900,210923', 'mainland', '4');
INSERT INTO `region` VALUES ('211000', '210000', '辽阳市', ',1,210000,211000', 'mainland', '3');
INSERT INTO `region` VALUES ('211002', '211000', '白塔区', ',1,210000,211000,211002', 'mainland', '4');
INSERT INTO `region` VALUES ('211003', '211000', '文圣区', ',1,210000,211000,211003', 'mainland', '4');
INSERT INTO `region` VALUES ('211004', '211000', '宏伟区', ',1,210000,211000,211004', 'mainland', '4');
INSERT INTO `region` VALUES ('211005', '211000', '弓长岭区', ',1,210000,211000,211005', 'mainland', '4');
INSERT INTO `region` VALUES ('211011', '211000', '太子河区', ',1,210000,211000,211011', 'mainland', '4');
INSERT INTO `region` VALUES ('211021', '211000', '辽阳县', ',1,210000,211000,211021', 'mainland', '4');
INSERT INTO `region` VALUES ('211081', '211000', '灯塔市', ',1,210000,211000,211081', 'mainland', '4');
INSERT INTO `region` VALUES ('211082', '211000', '其它区', ',1,210000,211000,211082', 'mainland', '4');
INSERT INTO `region` VALUES ('211100', '210000', '盘锦市', ',1,210000,211100', 'mainland', '3');
INSERT INTO `region` VALUES ('211102', '211100', '双台子区', ',1,210000,211100,211102', 'mainland', '4');
INSERT INTO `region` VALUES ('211103', '211100', '兴隆台区', ',1,210000,211100,211103', 'mainland', '4');
INSERT INTO `region` VALUES ('211121', '211100', '大洼县', ',1,210000,211100,211121', 'mainland', '4');
INSERT INTO `region` VALUES ('211122', '211100', '盘山县', ',1,210000,211100,211122', 'mainland', '4');
INSERT INTO `region` VALUES ('211123', '211100', '其它区', ',1,210000,211100,211123', 'mainland', '4');
INSERT INTO `region` VALUES ('211200', '210000', '铁岭市', ',1,210000,211200', 'mainland', '3');
INSERT INTO `region` VALUES ('211202', '211200', '银州区', ',1,210000,211200,211202', 'mainland', '4');
INSERT INTO `region` VALUES ('211204', '211200', '清河区', ',1,210000,211200,211204', 'mainland', '4');
INSERT INTO `region` VALUES ('211221', '211200', '铁岭县', ',1,210000,211200,211221', 'mainland', '4');
INSERT INTO `region` VALUES ('211223', '211200', '西丰县', ',1,210000,211200,211223', 'mainland', '4');
INSERT INTO `region` VALUES ('211224', '211200', '昌图县', ',1,210000,211200,211224', 'mainland', '4');
INSERT INTO `region` VALUES ('211281', '211200', '调兵山市', ',1,210000,211200,211281', 'mainland', '4');
INSERT INTO `region` VALUES ('211282', '211200', '开原市', ',1,210000,211200,211282', 'mainland', '4');
INSERT INTO `region` VALUES ('211283', '211200', '其它区', ',1,210000,211200,211283', 'mainland', '4');
INSERT INTO `region` VALUES ('211300', '210000', '朝阳市', ',1,210000,211300', 'mainland', '3');
INSERT INTO `region` VALUES ('211302', '211300', '双塔区', ',1,210000,211300,211302', 'mainland', '4');
INSERT INTO `region` VALUES ('211303', '211300', '龙城区', ',1,210000,211300,211303', 'mainland', '4');
INSERT INTO `region` VALUES ('211321', '211300', '朝阳县', ',1,210000,211300,211321', 'mainland', '4');
INSERT INTO `region` VALUES ('211322', '211300', '建平县', ',1,210000,211300,211322', 'mainland', '4');
INSERT INTO `region` VALUES ('211324', '211300', '喀喇沁左翼蒙古族自治县', ',1,210000,211300,211324', 'mainland', '4');
INSERT INTO `region` VALUES ('211381', '211300', '北票市', ',1,210000,211300,211381', 'mainland', '4');
INSERT INTO `region` VALUES ('211382', '211300', '凌源市', ',1,210000,211300,211382', 'mainland', '4');
INSERT INTO `region` VALUES ('211383', '211300', '其它区', ',1,210000,211300,211383', 'mainland', '4');
INSERT INTO `region` VALUES ('211400', '210000', '葫芦岛市', ',1,210000,211400', 'mainland', '3');
INSERT INTO `region` VALUES ('211402', '211400', '连山区', ',1,210000,211400,211402', 'mainland', '4');
INSERT INTO `region` VALUES ('211403', '211400', '龙港区', ',1,210000,211400,211403', 'mainland', '4');
INSERT INTO `region` VALUES ('211404', '211400', '南票区', ',1,210000,211400,211404', 'mainland', '4');
INSERT INTO `region` VALUES ('211421', '211400', '绥中县', ',1,210000,211400,211421', 'mainland', '4');
INSERT INTO `region` VALUES ('211422', '211400', '建昌县', ',1,210000,211400,211422', 'mainland', '4');
INSERT INTO `region` VALUES ('211481', '211400', '兴城市', ',1,210000,211400,211481', 'mainland', '4');
INSERT INTO `region` VALUES ('211482', '211400', '其它区', ',1,210000,211400,211482', 'mainland', '4');
INSERT INTO `region` VALUES ('220000', '1', '吉林省', ',1,220000', 'mainland', '2');
INSERT INTO `region` VALUES ('220100', '220000', '长春市', ',1,220000,220100', 'mainland', '3');
INSERT INTO `region` VALUES ('220102', '220100', '南关区', ',1,220000,220100,220102', 'mainland', '4');
INSERT INTO `region` VALUES ('220103', '220100', '宽城区', ',1,220000,220100,220103', 'mainland', '4');
INSERT INTO `region` VALUES ('220104', '220100', '朝阳区', ',1,220000,220100,220104', 'mainland', '4');
INSERT INTO `region` VALUES ('220105', '220100', '二道区', ',1,220000,220100,220105', 'mainland', '4');
INSERT INTO `region` VALUES ('220106', '220100', '绿园区', ',1,220000,220100,220106', 'mainland', '4');
INSERT INTO `region` VALUES ('220112', '220100', '双阳区', ',1,220000,220100,220112', 'mainland', '4');
INSERT INTO `region` VALUES ('220122', '220100', '农安县', ',1,220000,220100,220122', 'mainland', '4');
INSERT INTO `region` VALUES ('220181', '220100', '九台市', ',1,220000,220100,220181', 'mainland', '4');
INSERT INTO `region` VALUES ('220182', '220100', '榆树市', ',1,220000,220100,220182', 'mainland', '4');
INSERT INTO `region` VALUES ('220183', '220100', '德惠市', ',1,220000,220100,220183', 'mainland', '4');
INSERT INTO `region` VALUES ('220184', '220100', '高新技术产业开发区', ',1,220000,220100,220184', 'mainland', '4');
INSERT INTO `region` VALUES ('220185', '220100', '汽车产业开发区', ',1,220000,220100,220185', 'mainland', '4');
INSERT INTO `region` VALUES ('220186', '220100', '经济技术开发区', ',1,220000,220100,220186', 'mainland', '4');
INSERT INTO `region` VALUES ('220187', '220100', '净月旅游开发区', ',1,220000,220100,220187', 'mainland', '4');
INSERT INTO `region` VALUES ('220188', '220100', '其它区', ',1,220000,220100,220188', 'mainland', '4');
INSERT INTO `region` VALUES ('220200', '220000', '吉林市', ',1,220000,220200', 'mainland', '3');
INSERT INTO `region` VALUES ('220202', '220200', '昌邑区', ',1,220000,220200,220202', 'mainland', '4');
INSERT INTO `region` VALUES ('220203', '220200', '龙潭区', ',1,220000,220200,220203', 'mainland', '4');
INSERT INTO `region` VALUES ('220204', '220200', '船营区', ',1,220000,220200,220204', 'mainland', '4');
INSERT INTO `region` VALUES ('220211', '220200', '丰满区', ',1,220000,220200,220211', 'mainland', '4');
INSERT INTO `region` VALUES ('220221', '220200', '永吉县', ',1,220000,220200,220221', 'mainland', '4');
INSERT INTO `region` VALUES ('220281', '220200', '蛟河市', ',1,220000,220200,220281', 'mainland', '4');
INSERT INTO `region` VALUES ('220282', '220200', '桦甸市', ',1,220000,220200,220282', 'mainland', '4');
INSERT INTO `region` VALUES ('220283', '220200', '舒兰市', ',1,220000,220200,220283', 'mainland', '4');
INSERT INTO `region` VALUES ('220284', '220200', '磐石市', ',1,220000,220200,220284', 'mainland', '4');
INSERT INTO `region` VALUES ('220285', '220200', '其它区', ',1,220000,220200,220285', 'mainland', '4');
INSERT INTO `region` VALUES ('220300', '220000', '四平市', ',1,220000,220300', 'mainland', '3');
INSERT INTO `region` VALUES ('220302', '220300', '铁西区', ',1,220000,220300,220302', 'mainland', '4');
INSERT INTO `region` VALUES ('220303', '220300', '铁东区', ',1,220000,220300,220303', 'mainland', '4');
INSERT INTO `region` VALUES ('220322', '220300', '梨树县', ',1,220000,220300,220322', 'mainland', '4');
INSERT INTO `region` VALUES ('220323', '220300', '伊通满族自治县', ',1,220000,220300,220323', 'mainland', '4');
INSERT INTO `region` VALUES ('220381', '220300', '公主岭市', ',1,220000,220300,220381', 'mainland', '4');
INSERT INTO `region` VALUES ('220382', '220300', '双辽市', ',1,220000,220300,220382', 'mainland', '4');
INSERT INTO `region` VALUES ('220383', '220300', '其它区', ',1,220000,220300,220383', 'mainland', '4');
INSERT INTO `region` VALUES ('220400', '220000', '辽源市', ',1,220000,220400', 'mainland', '3');
INSERT INTO `region` VALUES ('220402', '220400', '龙山区', ',1,220000,220400,220402', 'mainland', '4');
INSERT INTO `region` VALUES ('220403', '220400', '西安区', ',1,220000,220400,220403', 'mainland', '4');
INSERT INTO `region` VALUES ('220421', '220400', '东丰县', ',1,220000,220400,220421', 'mainland', '4');
INSERT INTO `region` VALUES ('220422', '220400', '东辽县', ',1,220000,220400,220422', 'mainland', '4');
INSERT INTO `region` VALUES ('220423', '220400', '其它区', ',1,220000,220400,220423', 'mainland', '4');
INSERT INTO `region` VALUES ('220500', '220000', '通化市', ',1,220000,220500', 'mainland', '3');
INSERT INTO `region` VALUES ('220502', '220500', '东昌区', ',1,220000,220500,220502', 'mainland', '4');
INSERT INTO `region` VALUES ('220503', '220500', '二道江区', ',1,220000,220500,220503', 'mainland', '4');
INSERT INTO `region` VALUES ('220521', '220500', '通化县', ',1,220000,220500,220521', 'mainland', '4');
INSERT INTO `region` VALUES ('220523', '220500', '辉南县', ',1,220000,220500,220523', 'mainland', '4');
INSERT INTO `region` VALUES ('220524', '220500', '柳河县', ',1,220000,220500,220524', 'mainland', '4');
INSERT INTO `region` VALUES ('220581', '220500', '梅河口市', ',1,220000,220500,220581', 'mainland', '4');
INSERT INTO `region` VALUES ('220582', '220500', '集安市', ',1,220000,220500,220582', 'mainland', '4');
INSERT INTO `region` VALUES ('220583', '220500', '其它区', ',1,220000,220500,220583', 'mainland', '4');
INSERT INTO `region` VALUES ('220600', '220000', '白山市', ',1,220000,220600', 'mainland', '3');
INSERT INTO `region` VALUES ('220602', '220600', '八道江区', ',1,220000,220600,220602', 'mainland', '4');
INSERT INTO `region` VALUES ('220621', '220600', '抚松县', ',1,220000,220600,220621', 'mainland', '4');
INSERT INTO `region` VALUES ('220622', '220600', '靖宇县', ',1,220000,220600,220622', 'mainland', '4');
INSERT INTO `region` VALUES ('220623', '220600', '长白朝鲜族自治县', ',1,220000,220600,220623', 'mainland', '4');
INSERT INTO `region` VALUES ('220625', '220600', '江源县', ',1,220000,220600,220625', 'mainland', '4');
INSERT INTO `region` VALUES ('220681', '220600', '临江市', ',1,220000,220600,220681', 'mainland', '4');
INSERT INTO `region` VALUES ('220682', '220600', '其它区', ',1,220000,220600,220682', 'mainland', '4');
INSERT INTO `region` VALUES ('220700', '220000', '松原市', ',1,220000,220700', 'mainland', '3');
INSERT INTO `region` VALUES ('220702', '220700', '宁江区', ',1,220000,220700,220702', 'mainland', '4');
INSERT INTO `region` VALUES ('220721', '220700', '前郭尔罗斯蒙古族自治县', ',1,220000,220700,220721', 'mainland', '4');
INSERT INTO `region` VALUES ('220722', '220700', '长岭县', ',1,220000,220700,220722', 'mainland', '4');
INSERT INTO `region` VALUES ('220723', '220700', '乾安县', ',1,220000,220700,220723', 'mainland', '4');
INSERT INTO `region` VALUES ('220724', '220700', '扶余县', ',1,220000,220700,220724', 'mainland', '4');
INSERT INTO `region` VALUES ('220725', '220700', '其它区', ',1,220000,220700,220725', 'mainland', '4');
INSERT INTO `region` VALUES ('220800', '220000', '白城市', ',1,220000,220800', 'mainland', '3');
INSERT INTO `region` VALUES ('220802', '220800', '洮北区', ',1,220000,220800,220802', 'mainland', '4');
INSERT INTO `region` VALUES ('220821', '220800', '镇赉县', ',1,220000,220800,220821', 'mainland', '4');
INSERT INTO `region` VALUES ('220822', '220800', '通榆县', ',1,220000,220800,220822', 'mainland', '4');
INSERT INTO `region` VALUES ('220881', '220800', '洮南市', ',1,220000,220800,220881', 'mainland', '4');
INSERT INTO `region` VALUES ('220882', '220800', '大安市', ',1,220000,220800,220882', 'mainland', '4');
INSERT INTO `region` VALUES ('220883', '220800', '其它区', ',1,220000,220800,220883', 'mainland', '4');
INSERT INTO `region` VALUES ('222400', '220000', '延边朝鲜族自治州', ',1,220000,222400', 'mainland', '3');
INSERT INTO `region` VALUES ('222401', '222400', '延吉市', ',1,220000,222400,222401', 'mainland', '4');
INSERT INTO `region` VALUES ('222402', '222400', '图们市', ',1,220000,222400,222402', 'mainland', '4');
INSERT INTO `region` VALUES ('222403', '222400', '敦化市', ',1,220000,222400,222403', 'mainland', '4');
INSERT INTO `region` VALUES ('222404', '222400', '珲春市', ',1,220000,222400,222404', 'mainland', '4');
INSERT INTO `region` VALUES ('222405', '222400', '龙井市', ',1,220000,222400,222405', 'mainland', '4');
INSERT INTO `region` VALUES ('222406', '222400', '和龙市', ',1,220000,222400,222406', 'mainland', '4');
INSERT INTO `region` VALUES ('222424', '222400', '汪清县', ',1,220000,222400,222424', 'mainland', '4');
INSERT INTO `region` VALUES ('222426', '222400', '安图县', ',1,220000,222400,222426', 'mainland', '4');
INSERT INTO `region` VALUES ('222427', '222400', '其它区', ',1,220000,222400,222427', 'mainland', '4');
INSERT INTO `region` VALUES ('230000', '1', '黑龙江省', ',1,230000', 'mainland', '2');
INSERT INTO `region` VALUES ('230100', '230000', '哈尔滨市', ',1,230000,230100', 'mainland', '3');
INSERT INTO `region` VALUES ('230102', '230100', '道里区', ',1,230000,230100,230102', 'mainland', '4');
INSERT INTO `region` VALUES ('230103', '230100', '南岗区', ',1,230000,230100,230103', 'mainland', '4');
INSERT INTO `region` VALUES ('230104', '230100', '道外区', ',1,230000,230100,230104', 'mainland', '4');
INSERT INTO `region` VALUES ('230106', '230100', '香坊区', ',1,230000,230100,230106', 'mainland', '4');
INSERT INTO `region` VALUES ('230107', '230100', '动力区', ',1,230000,230100,230107', 'mainland', '4');
INSERT INTO `region` VALUES ('230108', '230100', '平房区', ',1,230000,230100,230108', 'mainland', '4');
INSERT INTO `region` VALUES ('230109', '230100', '松北区', ',1,230000,230100,230109', 'mainland', '4');
INSERT INTO `region` VALUES ('230111', '230100', '呼兰区', ',1,230000,230100,230111', 'mainland', '4');
INSERT INTO `region` VALUES ('230123', '230100', '依兰县', ',1,230000,230100,230123', 'mainland', '4');
INSERT INTO `region` VALUES ('230124', '230100', '方正县', ',1,230000,230100,230124', 'mainland', '4');
INSERT INTO `region` VALUES ('230125', '230100', '宾县', ',1,230000,230100,230125', 'mainland', '4');
INSERT INTO `region` VALUES ('230126', '230100', '巴彦县', ',1,230000,230100,230126', 'mainland', '4');
INSERT INTO `region` VALUES ('230127', '230100', '木兰县', ',1,230000,230100,230127', 'mainland', '4');
INSERT INTO `region` VALUES ('230128', '230100', '通河县', ',1,230000,230100,230128', 'mainland', '4');
INSERT INTO `region` VALUES ('230129', '230100', '延寿县', ',1,230000,230100,230129', 'mainland', '4');
INSERT INTO `region` VALUES ('230181', '230100', '阿城市', ',1,230000,230100,230181', 'mainland', '4');
INSERT INTO `region` VALUES ('230182', '230100', '双城市', ',1,230000,230100,230182', 'mainland', '4');
INSERT INTO `region` VALUES ('230183', '230100', '尚志市', ',1,230000,230100,230183', 'mainland', '4');
INSERT INTO `region` VALUES ('230184', '230100', '五常市', ',1,230000,230100,230184', 'mainland', '4');
INSERT INTO `region` VALUES ('230185', '230100', '阿城市', ',1,230000,230100,230185', 'mainland', '4');
INSERT INTO `region` VALUES ('230186', '230100', '其它区', ',1,230000,230100,230186', 'mainland', '4');
INSERT INTO `region` VALUES ('230200', '230000', '齐齐哈尔市', ',1,230000,230200', 'mainland', '3');
INSERT INTO `region` VALUES ('230202', '230200', '龙沙区', ',1,230000,230200,230202', 'mainland', '4');
INSERT INTO `region` VALUES ('230203', '230200', '建华区', ',1,230000,230200,230203', 'mainland', '4');
INSERT INTO `region` VALUES ('230204', '230200', '铁锋区', ',1,230000,230200,230204', 'mainland', '4');
INSERT INTO `region` VALUES ('230205', '230200', '昂昂溪区', ',1,230000,230200,230205', 'mainland', '4');
INSERT INTO `region` VALUES ('230206', '230200', '富拉尔基区', ',1,230000,230200,230206', 'mainland', '4');
INSERT INTO `region` VALUES ('230207', '230200', '碾子山区', ',1,230000,230200,230207', 'mainland', '4');
INSERT INTO `region` VALUES ('230208', '230200', '梅里斯达斡尔族区', ',1,230000,230200,230208', 'mainland', '4');
INSERT INTO `region` VALUES ('230221', '230200', '龙江县', ',1,230000,230200,230221', 'mainland', '4');
INSERT INTO `region` VALUES ('230223', '230200', '依安县', ',1,230000,230200,230223', 'mainland', '4');
INSERT INTO `region` VALUES ('230224', '230200', '泰来县', ',1,230000,230200,230224', 'mainland', '4');
INSERT INTO `region` VALUES ('230225', '230200', '甘南县', ',1,230000,230200,230225', 'mainland', '4');
INSERT INTO `region` VALUES ('230227', '230200', '富裕县', ',1,230000,230200,230227', 'mainland', '4');
INSERT INTO `region` VALUES ('230229', '230200', '克山县', ',1,230000,230200,230229', 'mainland', '4');
INSERT INTO `region` VALUES ('230230', '230200', '克东县', ',1,230000,230200,230230', 'mainland', '4');
INSERT INTO `region` VALUES ('230231', '230200', '拜泉县', ',1,230000,230200,230231', 'mainland', '4');
INSERT INTO `region` VALUES ('230281', '230200', '讷河市', ',1,230000,230200,230281', 'mainland', '4');
INSERT INTO `region` VALUES ('230282', '230200', '其它区', ',1,230000,230200,230282', 'mainland', '4');
INSERT INTO `region` VALUES ('230300', '230000', '鸡西市', ',1,230000,230300', 'mainland', '3');
INSERT INTO `region` VALUES ('230302', '230300', '鸡冠区', ',1,230000,230300,230302', 'mainland', '4');
INSERT INTO `region` VALUES ('230303', '230300', '恒山区', ',1,230000,230300,230303', 'mainland', '4');
INSERT INTO `region` VALUES ('230304', '230300', '滴道区', ',1,230000,230300,230304', 'mainland', '4');
INSERT INTO `region` VALUES ('230305', '230300', '梨树区', ',1,230000,230300,230305', 'mainland', '4');
INSERT INTO `region` VALUES ('230306', '230300', '城子河区', ',1,230000,230300,230306', 'mainland', '4');
INSERT INTO `region` VALUES ('230307', '230300', '麻山区', ',1,230000,230300,230307', 'mainland', '4');
INSERT INTO `region` VALUES ('230321', '230300', '鸡东县', ',1,230000,230300,230321', 'mainland', '4');
INSERT INTO `region` VALUES ('230381', '230300', '虎林市', ',1,230000,230300,230381', 'mainland', '4');
INSERT INTO `region` VALUES ('230382', '230300', '密山市', ',1,230000,230300,230382', 'mainland', '4');
INSERT INTO `region` VALUES ('230383', '230300', '其它区', ',1,230000,230300,230383', 'mainland', '4');
INSERT INTO `region` VALUES ('230400', '230000', '鹤岗市', ',1,230000,230400', 'mainland', '3');
INSERT INTO `region` VALUES ('230402', '230400', '向阳区', ',1,230000,230400,230402', 'mainland', '4');
INSERT INTO `region` VALUES ('230403', '230400', '工农区', ',1,230000,230400,230403', 'mainland', '4');
INSERT INTO `region` VALUES ('230404', '230400', '南山区', ',1,230000,230400,230404', 'mainland', '4');
INSERT INTO `region` VALUES ('230405', '230400', '兴安区', ',1,230000,230400,230405', 'mainland', '4');
INSERT INTO `region` VALUES ('230406', '230400', '东山区', ',1,230000,230400,230406', 'mainland', '4');
INSERT INTO `region` VALUES ('230407', '230400', '兴山区', ',1,230000,230400,230407', 'mainland', '4');
INSERT INTO `region` VALUES ('230421', '230400', '萝北县', ',1,230000,230400,230421', 'mainland', '4');
INSERT INTO `region` VALUES ('230422', '230400', '绥滨县', ',1,230000,230400,230422', 'mainland', '4');
INSERT INTO `region` VALUES ('230423', '230400', '其它区', ',1,230000,230400,230423', 'mainland', '4');
INSERT INTO `region` VALUES ('230500', '230000', '双鸭山市', ',1,230000,230500', 'mainland', '3');
INSERT INTO `region` VALUES ('230502', '230500', '尖山区', ',1,230000,230500,230502', 'mainland', '4');
INSERT INTO `region` VALUES ('230503', '230500', '岭东区', ',1,230000,230500,230503', 'mainland', '4');
INSERT INTO `region` VALUES ('230505', '230500', '四方台区', ',1,230000,230500,230505', 'mainland', '4');
INSERT INTO `region` VALUES ('230506', '230500', '宝山区', ',1,230000,230500,230506', 'mainland', '4');
INSERT INTO `region` VALUES ('230521', '230500', '集贤县', ',1,230000,230500,230521', 'mainland', '4');
INSERT INTO `region` VALUES ('230522', '230500', '友谊县', ',1,230000,230500,230522', 'mainland', '4');
INSERT INTO `region` VALUES ('230523', '230500', '宝清县', ',1,230000,230500,230523', 'mainland', '4');
INSERT INTO `region` VALUES ('230524', '230500', '饶河县', ',1,230000,230500,230524', 'mainland', '4');
INSERT INTO `region` VALUES ('230525', '230500', '其它区', ',1,230000,230500,230525', 'mainland', '4');
INSERT INTO `region` VALUES ('230600', '230000', '大庆市', ',1,230000,230600', 'mainland', '3');
INSERT INTO `region` VALUES ('230602', '230600', '萨尔图区', ',1,230000,230600,230602', 'mainland', '4');
INSERT INTO `region` VALUES ('230603', '230600', '龙凤区', ',1,230000,230600,230603', 'mainland', '4');
INSERT INTO `region` VALUES ('230604', '230600', '让胡路区', ',1,230000,230600,230604', 'mainland', '4');
INSERT INTO `region` VALUES ('230605', '230600', '红岗区', ',1,230000,230600,230605', 'mainland', '4');
INSERT INTO `region` VALUES ('230606', '230600', '大同区', ',1,230000,230600,230606', 'mainland', '4');
INSERT INTO `region` VALUES ('230621', '230600', '肇州县', ',1,230000,230600,230621', 'mainland', '4');
INSERT INTO `region` VALUES ('230622', '230600', '肇源县', ',1,230000,230600,230622', 'mainland', '4');
INSERT INTO `region` VALUES ('230623', '230600', '林甸县', ',1,230000,230600,230623', 'mainland', '4');
INSERT INTO `region` VALUES ('230624', '230600', '杜尔伯特蒙古族自治县', ',1,230000,230600,230624', 'mainland', '4');
INSERT INTO `region` VALUES ('230625', '230600', '其它区', ',1,230000,230600,230625', 'mainland', '4');
INSERT INTO `region` VALUES ('230700', '230000', '伊春市', ',1,230000,230700', 'mainland', '3');
INSERT INTO `region` VALUES ('230702', '230700', '伊春区', ',1,230000,230700,230702', 'mainland', '4');
INSERT INTO `region` VALUES ('230703', '230700', '南岔区', ',1,230000,230700,230703', 'mainland', '4');
INSERT INTO `region` VALUES ('230704', '230700', '友好区', ',1,230000,230700,230704', 'mainland', '4');
INSERT INTO `region` VALUES ('230705', '230700', '西林区', ',1,230000,230700,230705', 'mainland', '4');
INSERT INTO `region` VALUES ('230706', '230700', '翠峦区', ',1,230000,230700,230706', 'mainland', '4');
INSERT INTO `region` VALUES ('230707', '230700', '新青区', ',1,230000,230700,230707', 'mainland', '4');
INSERT INTO `region` VALUES ('230708', '230700', '美溪区', ',1,230000,230700,230708', 'mainland', '4');
INSERT INTO `region` VALUES ('230709', '230700', '金山屯区', ',1,230000,230700,230709', 'mainland', '4');
INSERT INTO `region` VALUES ('230710', '230700', '五营区', ',1,230000,230700,230710', 'mainland', '4');
INSERT INTO `region` VALUES ('230711', '230700', '乌马河区', ',1,230000,230700,230711', 'mainland', '4');
INSERT INTO `region` VALUES ('230712', '230700', '汤旺河区', ',1,230000,230700,230712', 'mainland', '4');
INSERT INTO `region` VALUES ('230713', '230700', '带岭区', ',1,230000,230700,230713', 'mainland', '4');
INSERT INTO `region` VALUES ('230714', '230700', '乌伊岭区', ',1,230000,230700,230714', 'mainland', '4');
INSERT INTO `region` VALUES ('230715', '230700', '红星区', ',1,230000,230700,230715', 'mainland', '4');
INSERT INTO `region` VALUES ('230716', '230700', '上甘岭区', ',1,230000,230700,230716', 'mainland', '4');
INSERT INTO `region` VALUES ('230722', '230700', '嘉荫县', ',1,230000,230700,230722', 'mainland', '4');
INSERT INTO `region` VALUES ('230781', '230700', '铁力市', ',1,230000,230700,230781', 'mainland', '4');
INSERT INTO `region` VALUES ('230782', '230700', '其它区', ',1,230000,230700,230782', 'mainland', '4');
INSERT INTO `region` VALUES ('230800', '230000', '佳木斯市', ',1,230000,230800', 'mainland', '3');
INSERT INTO `region` VALUES ('230802', '230800', '永红区', ',1,230000,230800,230802', 'mainland', '4');
INSERT INTO `region` VALUES ('230803', '230800', '向阳区', ',1,230000,230800,230803', 'mainland', '4');
INSERT INTO `region` VALUES ('230804', '230800', '前进区', ',1,230000,230800,230804', 'mainland', '4');
INSERT INTO `region` VALUES ('230805', '230800', '东风区', ',1,230000,230800,230805', 'mainland', '4');
INSERT INTO `region` VALUES ('230811', '230800', '郊区', ',1,230000,230800,230811', 'mainland', '4');
INSERT INTO `region` VALUES ('230822', '230800', '桦南县', ',1,230000,230800,230822', 'mainland', '4');
INSERT INTO `region` VALUES ('230826', '230800', '桦川县', ',1,230000,230800,230826', 'mainland', '4');
INSERT INTO `region` VALUES ('230828', '230800', '汤原县', ',1,230000,230800,230828', 'mainland', '4');
INSERT INTO `region` VALUES ('230833', '230800', '抚远县', ',1,230000,230800,230833', 'mainland', '4');
INSERT INTO `region` VALUES ('230881', '230800', '同江市', ',1,230000,230800,230881', 'mainland', '4');
INSERT INTO `region` VALUES ('230882', '230800', '富锦市', ',1,230000,230800,230882', 'mainland', '4');
INSERT INTO `region` VALUES ('230883', '230800', '其它区', ',1,230000,230800,230883', 'mainland', '4');
INSERT INTO `region` VALUES ('230900', '230000', '七台河市', ',1,230000,230900', 'mainland', '3');
INSERT INTO `region` VALUES ('230902', '230900', '新兴区', ',1,230000,230900,230902', 'mainland', '4');
INSERT INTO `region` VALUES ('230903', '230900', '桃山区', ',1,230000,230900,230903', 'mainland', '4');
INSERT INTO `region` VALUES ('230904', '230900', '茄子河区', ',1,230000,230900,230904', 'mainland', '4');
INSERT INTO `region` VALUES ('230921', '230900', '勃利县', ',1,230000,230900,230921', 'mainland', '4');
INSERT INTO `region` VALUES ('230922', '230900', '其它区', ',1,230000,230900,230922', 'mainland', '4');
INSERT INTO `region` VALUES ('231000', '230000', '牡丹江市', ',1,230000,231000', 'mainland', '3');
INSERT INTO `region` VALUES ('231002', '231000', '东安区', ',1,230000,231000,231002', 'mainland', '4');
INSERT INTO `region` VALUES ('231003', '231000', '阳明区', ',1,230000,231000,231003', 'mainland', '4');
INSERT INTO `region` VALUES ('231004', '231000', '爱民区', ',1,230000,231000,231004', 'mainland', '4');
INSERT INTO `region` VALUES ('231005', '231000', '西安区', ',1,230000,231000,231005', 'mainland', '4');
INSERT INTO `region` VALUES ('231024', '231000', '东宁县', ',1,230000,231000,231024', 'mainland', '4');
INSERT INTO `region` VALUES ('231025', '231000', '林口县', ',1,230000,231000,231025', 'mainland', '4');
INSERT INTO `region` VALUES ('231081', '231000', '绥芬河市', ',1,230000,231000,231081', 'mainland', '4');
INSERT INTO `region` VALUES ('231083', '231000', '海林市', ',1,230000,231000,231083', 'mainland', '4');
INSERT INTO `region` VALUES ('231084', '231000', '宁安市', ',1,230000,231000,231084', 'mainland', '4');
INSERT INTO `region` VALUES ('231085', '231000', '穆棱市', ',1,230000,231000,231085', 'mainland', '4');
INSERT INTO `region` VALUES ('231086', '231000', '其它区', ',1,230000,231000,231086', 'mainland', '4');
INSERT INTO `region` VALUES ('231100', '230000', '黑河市', ',1,230000,231100', 'mainland', '3');
INSERT INTO `region` VALUES ('231102', '231100', '爱辉区', ',1,230000,231100,231102', 'mainland', '4');
INSERT INTO `region` VALUES ('231121', '231100', '嫩江县', ',1,230000,231100,231121', 'mainland', '4');
INSERT INTO `region` VALUES ('231123', '231100', '逊克县', ',1,230000,231100,231123', 'mainland', '4');
INSERT INTO `region` VALUES ('231124', '231100', '孙吴县', ',1,230000,231100,231124', 'mainland', '4');
INSERT INTO `region` VALUES ('231181', '231100', '北安市', ',1,230000,231100,231181', 'mainland', '4');
INSERT INTO `region` VALUES ('231182', '231100', '五大连池市', ',1,230000,231100,231182', 'mainland', '4');
INSERT INTO `region` VALUES ('231183', '231100', '其它区', ',1,230000,231100,231183', 'mainland', '4');
INSERT INTO `region` VALUES ('231200', '230000', '绥化市', ',1,230000,231200', 'mainland', '3');
INSERT INTO `region` VALUES ('231202', '231200', '北林区', ',1,230000,231200,231202', 'mainland', '4');
INSERT INTO `region` VALUES ('231221', '231200', '望奎县', ',1,230000,231200,231221', 'mainland', '4');
INSERT INTO `region` VALUES ('231222', '231200', '兰西县', ',1,230000,231200,231222', 'mainland', '4');
INSERT INTO `region` VALUES ('231223', '231200', '青冈县', ',1,230000,231200,231223', 'mainland', '4');
INSERT INTO `region` VALUES ('231224', '231200', '庆安县', ',1,230000,231200,231224', 'mainland', '4');
INSERT INTO `region` VALUES ('231225', '231200', '明水县', ',1,230000,231200,231225', 'mainland', '4');
INSERT INTO `region` VALUES ('231226', '231200', '绥棱县', ',1,230000,231200,231226', 'mainland', '4');
INSERT INTO `region` VALUES ('231281', '231200', '安达市', ',1,230000,231200,231281', 'mainland', '4');
INSERT INTO `region` VALUES ('231282', '231200', '肇东市', ',1,230000,231200,231282', 'mainland', '4');
INSERT INTO `region` VALUES ('231283', '231200', '海伦市', ',1,230000,231200,231283', 'mainland', '4');
INSERT INTO `region` VALUES ('231284', '231200', '其它区', ',1,230000,231200,231284', 'mainland', '4');
INSERT INTO `region` VALUES ('232700', '230000', '大兴安岭地区', ',1,230000,232700', 'mainland', '3');
INSERT INTO `region` VALUES ('232721', '232700', '呼玛县', ',1,230000,232700,232721', 'mainland', '4');
INSERT INTO `region` VALUES ('232722', '232700', '塔河县', ',1,230000,232700,232722', 'mainland', '4');
INSERT INTO `region` VALUES ('232723', '232700', '漠河县', ',1,230000,232700,232723', 'mainland', '4');
INSERT INTO `region` VALUES ('232724', '232700', '加格达奇区', ',1,230000,232700,232724', 'mainland', '4');
INSERT INTO `region` VALUES ('232725', '232700', '其它区', ',1,230000,232700,232725', 'mainland', '4');
INSERT INTO `region` VALUES ('310000', '1', '上海', ',1,310000', 'mainland', '2');
INSERT INTO `region` VALUES ('310100', '310000', '上海市', ',1,310000,310100', 'mainland', '3');
INSERT INTO `region` VALUES ('310101', '310100', '黄浦区', ',1,310000,310100,310101', 'mainland', '4');
INSERT INTO `region` VALUES ('310103', '310100', '卢湾区', ',1,310000,310100,310103', 'mainland', '4');
INSERT INTO `region` VALUES ('310104', '310100', '徐汇区', ',1,310000,310100,310104', 'mainland', '4');
INSERT INTO `region` VALUES ('310105', '310100', '长宁区', ',1,310000,310100,310105', 'mainland', '4');
INSERT INTO `region` VALUES ('310106', '310100', '静安区', ',1,310000,310100,310106', 'mainland', '4');
INSERT INTO `region` VALUES ('310107', '310100', '普陀区', ',1,310000,310100,310107', 'mainland', '4');
INSERT INTO `region` VALUES ('310108', '310100', '闸北区', ',1,310000,310100,310108', 'mainland', '4');
INSERT INTO `region` VALUES ('310109', '310100', '虹口区', ',1,310000,310100,310109', 'mainland', '4');
INSERT INTO `region` VALUES ('310110', '310100', '杨浦区', ',1,310000,310100,310110', 'mainland', '4');
INSERT INTO `region` VALUES ('310112', '310100', '闵行区', ',1,310000,310100,310112', 'mainland', '4');
INSERT INTO `region` VALUES ('310113', '310100', '宝山区', ',1,310000,310100,310113', 'mainland', '4');
INSERT INTO `region` VALUES ('310114', '310100', '嘉定区', ',1,310000,310100,310114', 'mainland', '4');
INSERT INTO `region` VALUES ('310115', '310100', '浦东新区', ',1,310000,310100,310115', 'mainland', '4');
INSERT INTO `region` VALUES ('310116', '310100', '金山区', ',1,310000,310100,310116', 'mainland', '4');
INSERT INTO `region` VALUES ('310117', '310100', '松江区', ',1,310000,310100,310117', 'mainland', '4');
INSERT INTO `region` VALUES ('310118', '310100', '青浦区', ',1,310000,310100,310118', 'mainland', '4');
INSERT INTO `region` VALUES ('310119', '310100', '南汇区', ',1,310000,310100,310119', 'mainland', '4');
INSERT INTO `region` VALUES ('310120', '310100', '奉贤区', ',1,310000,310100,310120', 'mainland', '4');
INSERT INTO `region` VALUES ('310152', '310100', '川沙区', ',1,310000,310100,310152', 'mainland', '4');
INSERT INTO `region` VALUES ('310230', '310100', '崇明县', ',1,310000,310100,310230', 'mainland', '4');
INSERT INTO `region` VALUES ('310231', '310100', '其它区', ',1,310000,310100,310231', 'mainland', '4');
INSERT INTO `region` VALUES ('320000', '1', '江苏省', ',1,320000', 'mainland', '2');
INSERT INTO `region` VALUES ('320100', '320000', '南京市', ',1,320000,320100', 'mainland', '3');
INSERT INTO `region` VALUES ('320102', '320100', '玄武区', ',1,320000,320100,320102', 'mainland', '4');
INSERT INTO `region` VALUES ('320103', '320100', '白下区', ',1,320000,320100,320103', 'mainland', '4');
INSERT INTO `region` VALUES ('320104', '320100', '秦淮区', ',1,320000,320100,320104', 'mainland', '4');
INSERT INTO `region` VALUES ('320105', '320100', '建邺区', ',1,320000,320100,320105', 'mainland', '4');
INSERT INTO `region` VALUES ('320106', '320100', '鼓楼区', ',1,320000,320100,320106', 'mainland', '4');
INSERT INTO `region` VALUES ('320107', '320100', '下关区', ',1,320000,320100,320107', 'mainland', '4');
INSERT INTO `region` VALUES ('320111', '320100', '浦口区', ',1,320000,320100,320111', 'mainland', '4');
INSERT INTO `region` VALUES ('320113', '320100', '栖霞区', ',1,320000,320100,320113', 'mainland', '4');
INSERT INTO `region` VALUES ('320114', '320100', '雨花台区', ',1,320000,320100,320114', 'mainland', '4');
INSERT INTO `region` VALUES ('320115', '320100', '江宁区', ',1,320000,320100,320115', 'mainland', '4');
INSERT INTO `region` VALUES ('320116', '320100', '六合区', ',1,320000,320100,320116', 'mainland', '4');
INSERT INTO `region` VALUES ('320124', '320100', '溧水县', ',1,320000,320100,320124', 'mainland', '4');
INSERT INTO `region` VALUES ('320125', '320100', '高淳县', ',1,320000,320100,320125', 'mainland', '4');
INSERT INTO `region` VALUES ('320126', '320100', '其它区', ',1,320000,320100,320126', 'mainland', '4');
INSERT INTO `region` VALUES ('320200', '320000', '无锡市', ',1,320000,320200', 'mainland', '3');
INSERT INTO `region` VALUES ('320202', '320200', '崇安区', ',1,320000,320200,320202', 'mainland', '4');
INSERT INTO `region` VALUES ('320203', '320200', '南长区', ',1,320000,320200,320203', 'mainland', '4');
INSERT INTO `region` VALUES ('320204', '320200', '北塘区', ',1,320000,320200,320204', 'mainland', '4');
INSERT INTO `region` VALUES ('320205', '320200', '锡山区', ',1,320000,320200,320205', 'mainland', '4');
INSERT INTO `region` VALUES ('320206', '320200', '惠山区', ',1,320000,320200,320206', 'mainland', '4');
INSERT INTO `region` VALUES ('320211', '320200', '滨湖区', ',1,320000,320200,320211', 'mainland', '4');
INSERT INTO `region` VALUES ('320281', '320200', '江阴市', ',1,320000,320200,320281', 'mainland', '4');
INSERT INTO `region` VALUES ('320282', '320200', '宜兴市', ',1,320000,320200,320282', 'mainland', '4');
INSERT INTO `region` VALUES ('320296', '320200', '新区', ',1,320000,320200,320296', 'mainland', '4');
INSERT INTO `region` VALUES ('320297', '320200', '其它区', ',1,320000,320200,320297', 'mainland', '4');
INSERT INTO `region` VALUES ('320300', '320000', '徐州市', ',1,320000,320300', 'mainland', '3');
INSERT INTO `region` VALUES ('320302', '320300', '鼓楼区', ',1,320000,320300,320302', 'mainland', '4');
INSERT INTO `region` VALUES ('320303', '320300', '云龙区', ',1,320000,320300,320303', 'mainland', '4');
INSERT INTO `region` VALUES ('320304', '320300', '九里区', ',1,320000,320300,320304', 'mainland', '4');
INSERT INTO `region` VALUES ('320305', '320300', '贾汪区', ',1,320000,320300,320305', 'mainland', '4');
INSERT INTO `region` VALUES ('320311', '320300', '泉山区', ',1,320000,320300,320311', 'mainland', '4');
INSERT INTO `region` VALUES ('320321', '320300', '丰县', ',1,320000,320300,320321', 'mainland', '4');
INSERT INTO `region` VALUES ('320322', '320300', '沛县', ',1,320000,320300,320322', 'mainland', '4');
INSERT INTO `region` VALUES ('320323', '320300', '铜山县', ',1,320000,320300,320323', 'mainland', '4');
INSERT INTO `region` VALUES ('320324', '320300', '睢宁县', ',1,320000,320300,320324', 'mainland', '4');
INSERT INTO `region` VALUES ('320381', '320300', '新沂市', ',1,320000,320300,320381', 'mainland', '4');
INSERT INTO `region` VALUES ('320382', '320300', '邳州市', ',1,320000,320300,320382', 'mainland', '4');
INSERT INTO `region` VALUES ('320383', '320300', '其它区', ',1,320000,320300,320383', 'mainland', '4');
INSERT INTO `region` VALUES ('320400', '320000', '常州市', ',1,320000,320400', 'mainland', '3');
INSERT INTO `region` VALUES ('320402', '320400', '天宁区', ',1,320000,320400,320402', 'mainland', '4');
INSERT INTO `region` VALUES ('320404', '320400', '钟楼区', ',1,320000,320400,320404', 'mainland', '4');
INSERT INTO `region` VALUES ('320405', '320400', '戚墅堰区', ',1,320000,320400,320405', 'mainland', '4');
INSERT INTO `region` VALUES ('320411', '320400', '新北区', ',1,320000,320400,320411', 'mainland', '4');
INSERT INTO `region` VALUES ('320412', '320400', '武进区', ',1,320000,320400,320412', 'mainland', '4');
INSERT INTO `region` VALUES ('320481', '320400', '溧阳市', ',1,320000,320400,320481', 'mainland', '4');
INSERT INTO `region` VALUES ('320482', '320400', '金坛市', ',1,320000,320400,320482', 'mainland', '4');
INSERT INTO `region` VALUES ('320483', '320400', '其它区', ',1,320000,320400,320483', 'mainland', '4');
INSERT INTO `region` VALUES ('320500', '320000', '苏州市', ',1,320000,320500', 'mainland', '3');
INSERT INTO `region` VALUES ('320502', '320500', '沧浪区', ',1,320000,320500,320502', 'mainland', '4');
INSERT INTO `region` VALUES ('320503', '320500', '平江区', ',1,320000,320500,320503', 'mainland', '4');
INSERT INTO `region` VALUES ('320504', '320500', '金阊区', ',1,320000,320500,320504', 'mainland', '4');
INSERT INTO `region` VALUES ('320505', '320500', '虎丘区', ',1,320000,320500,320505', 'mainland', '4');
INSERT INTO `region` VALUES ('320506', '320500', '吴中区', ',1,320000,320500,320506', 'mainland', '4');
INSERT INTO `region` VALUES ('320507', '320500', '相城区', ',1,320000,320500,320507', 'mainland', '4');
INSERT INTO `region` VALUES ('320581', '320500', '常熟市', ',1,320000,320500,320581', 'mainland', '4');
INSERT INTO `region` VALUES ('320582', '320500', '张家港市', ',1,320000,320500,320582', 'mainland', '4');
INSERT INTO `region` VALUES ('320583', '320500', '昆山市', ',1,320000,320500,320583', 'mainland', '4');
INSERT INTO `region` VALUES ('320584', '320500', '吴江市', ',1,320000,320500,320584', 'mainland', '4');
INSERT INTO `region` VALUES ('320585', '320500', '太仓市', ',1,320000,320500,320585', 'mainland', '4');
INSERT INTO `region` VALUES ('320594', '320500', '新区', ',1,320000,320500,320594', 'mainland', '4');
INSERT INTO `region` VALUES ('320595', '320500', '园区', ',1,320000,320500,320595', 'mainland', '4');
INSERT INTO `region` VALUES ('320596', '320500', '其它区', ',1,320000,320500,320596', 'mainland', '4');
INSERT INTO `region` VALUES ('320600', '320000', '南通市', ',1,320000,320600', 'mainland', '3');
INSERT INTO `region` VALUES ('320602', '320600', '崇川区', ',1,320000,320600,320602', 'mainland', '4');
INSERT INTO `region` VALUES ('320611', '320600', '港闸区', ',1,320000,320600,320611', 'mainland', '4');
INSERT INTO `region` VALUES ('320621', '320600', '海安县', ',1,320000,320600,320621', 'mainland', '4');
INSERT INTO `region` VALUES ('320623', '320600', '如东县', ',1,320000,320600,320623', 'mainland', '4');
INSERT INTO `region` VALUES ('320681', '320600', '启东市', ',1,320000,320600,320681', 'mainland', '4');
INSERT INTO `region` VALUES ('320682', '320600', '如皋市', ',1,320000,320600,320682', 'mainland', '4');
INSERT INTO `region` VALUES ('320683', '320600', '通州市', ',1,320000,320600,320683', 'mainland', '4');
INSERT INTO `region` VALUES ('320684', '320600', '海门市', ',1,320000,320600,320684', 'mainland', '4');
INSERT INTO `region` VALUES ('320693', '320600', '开发区', ',1,320000,320600,320693', 'mainland', '4');
INSERT INTO `region` VALUES ('320694', '320600', '其它区', ',1,320000,320600,320694', 'mainland', '4');
INSERT INTO `region` VALUES ('320700', '320000', '连云港市', ',1,320000,320700', 'mainland', '3');
INSERT INTO `region` VALUES ('320703', '320700', '连云区', ',1,320000,320700,320703', 'mainland', '4');
INSERT INTO `region` VALUES ('320705', '320700', '新浦区', ',1,320000,320700,320705', 'mainland', '4');
INSERT INTO `region` VALUES ('320706', '320700', '海州区', ',1,320000,320700,320706', 'mainland', '4');
INSERT INTO `region` VALUES ('320721', '320700', '赣榆县', ',1,320000,320700,320721', 'mainland', '4');
INSERT INTO `region` VALUES ('320722', '320700', '东海县', ',1,320000,320700,320722', 'mainland', '4');
INSERT INTO `region` VALUES ('320723', '320700', '灌云县', ',1,320000,320700,320723', 'mainland', '4');
INSERT INTO `region` VALUES ('320724', '320700', '灌南县', ',1,320000,320700,320724', 'mainland', '4');
INSERT INTO `region` VALUES ('320725', '320700', '其它区', ',1,320000,320700,320725', 'mainland', '4');
INSERT INTO `region` VALUES ('320800', '320000', '淮安市', ',1,320000,320800', 'mainland', '3');
INSERT INTO `region` VALUES ('320802', '320800', '清河区', ',1,320000,320800,320802', 'mainland', '4');
INSERT INTO `region` VALUES ('320803', '320800', '楚州区', ',1,320000,320800,320803', 'mainland', '4');
INSERT INTO `region` VALUES ('320804', '320800', '淮阴区', ',1,320000,320800,320804', 'mainland', '4');
INSERT INTO `region` VALUES ('320811', '320800', '清浦区', ',1,320000,320800,320811', 'mainland', '4');
INSERT INTO `region` VALUES ('320826', '320800', '涟水县', ',1,320000,320800,320826', 'mainland', '4');
INSERT INTO `region` VALUES ('320829', '320800', '洪泽县', ',1,320000,320800,320829', 'mainland', '4');
INSERT INTO `region` VALUES ('320830', '320800', '盱眙县', ',1,320000,320800,320830', 'mainland', '4');
INSERT INTO `region` VALUES ('320831', '320800', '金湖县', ',1,320000,320800,320831', 'mainland', '4');
INSERT INTO `region` VALUES ('320832', '320800', '其它区', ',1,320000,320800,320832', 'mainland', '4');
INSERT INTO `region` VALUES ('320900', '320000', '盐城市', ',1,320000,320900', 'mainland', '3');
INSERT INTO `region` VALUES ('320902', '320900', '亭湖区', ',1,320000,320900,320902', 'mainland', '4');
INSERT INTO `region` VALUES ('320903', '320900', '盐都区', ',1,320000,320900,320903', 'mainland', '4');
INSERT INTO `region` VALUES ('320921', '320900', '响水县', ',1,320000,320900,320921', 'mainland', '4');
INSERT INTO `region` VALUES ('320922', '320900', '滨海县', ',1,320000,320900,320922', 'mainland', '4');
INSERT INTO `region` VALUES ('320923', '320900', '阜宁县', ',1,320000,320900,320923', 'mainland', '4');
INSERT INTO `region` VALUES ('320924', '320900', '射阳县', ',1,320000,320900,320924', 'mainland', '4');
INSERT INTO `region` VALUES ('320925', '320900', '建湖县', ',1,320000,320900,320925', 'mainland', '4');
INSERT INTO `region` VALUES ('320981', '320900', '东台市', ',1,320000,320900,320981', 'mainland', '4');
INSERT INTO `region` VALUES ('320982', '320900', '大丰市', ',1,320000,320900,320982', 'mainland', '4');
INSERT INTO `region` VALUES ('320983', '320900', '其它区', ',1,320000,320900,320983', 'mainland', '4');
INSERT INTO `region` VALUES ('321000', '320000', '扬州市', ',1,320000,321000', 'mainland', '3');
INSERT INTO `region` VALUES ('321002', '321000', '广陵区', ',1,320000,321000,321002', 'mainland', '4');
INSERT INTO `region` VALUES ('321003', '321000', '邗江区', ',1,320000,321000,321003', 'mainland', '4');
INSERT INTO `region` VALUES ('321011', '321000', '维扬区', ',1,320000,321000,321011', 'mainland', '4');
INSERT INTO `region` VALUES ('321023', '321000', '宝应县', ',1,320000,321000,321023', 'mainland', '4');
INSERT INTO `region` VALUES ('321081', '321000', '仪征市', ',1,320000,321000,321081', 'mainland', '4');
INSERT INTO `region` VALUES ('321084', '321000', '高邮市', ',1,320000,321000,321084', 'mainland', '4');
INSERT INTO `region` VALUES ('321088', '321000', '江都市', ',1,320000,321000,321088', 'mainland', '4');
INSERT INTO `region` VALUES ('321092', '321000', '经济开发区', ',1,320000,321000,321092', 'mainland', '4');
INSERT INTO `region` VALUES ('321093', '321000', '其它区', ',1,320000,321000,321093', 'mainland', '4');
INSERT INTO `region` VALUES ('321100', '320000', '镇江市', ',1,320000,321100', 'mainland', '3');
INSERT INTO `region` VALUES ('321102', '321100', '京口区', ',1,320000,321100,321102', 'mainland', '4');
INSERT INTO `region` VALUES ('321111', '321100', '润州区', ',1,320000,321100,321111', 'mainland', '4');
INSERT INTO `region` VALUES ('321112', '321100', '丹徒区', ',1,320000,321100,321112', 'mainland', '4');
INSERT INTO `region` VALUES ('321181', '321100', '丹阳市', ',1,320000,321100,321181', 'mainland', '4');
INSERT INTO `region` VALUES ('321182', '321100', '扬中市', ',1,320000,321100,321182', 'mainland', '4');
INSERT INTO `region` VALUES ('321183', '321100', '句容市', ',1,320000,321100,321183', 'mainland', '4');
INSERT INTO `region` VALUES ('321184', '321100', '其它区', ',1,320000,321100,321184', 'mainland', '4');
INSERT INTO `region` VALUES ('321200', '320000', '泰州市', ',1,320000,321200', 'mainland', '3');
INSERT INTO `region` VALUES ('321202', '321200', '海陵区', ',1,320000,321200,321202', 'mainland', '4');
INSERT INTO `region` VALUES ('321203', '321200', '高港区', ',1,320000,321200,321203', 'mainland', '4');
INSERT INTO `region` VALUES ('321281', '321200', '兴化市', ',1,320000,321200,321281', 'mainland', '4');
INSERT INTO `region` VALUES ('321282', '321200', '靖江市', ',1,320000,321200,321282', 'mainland', '4');
INSERT INTO `region` VALUES ('321283', '321200', '泰兴市', ',1,320000,321200,321283', 'mainland', '4');
INSERT INTO `region` VALUES ('321284', '321200', '姜堰市', ',1,320000,321200,321284', 'mainland', '4');
INSERT INTO `region` VALUES ('321285', '321200', '其它区', ',1,320000,321200,321285', 'mainland', '4');
INSERT INTO `region` VALUES ('321300', '320000', '宿迁市', ',1,320000,321300', 'mainland', '3');
INSERT INTO `region` VALUES ('321302', '321300', '宿城区', ',1,320000,321300,321302', 'mainland', '4');
INSERT INTO `region` VALUES ('321311', '321300', '宿豫区', ',1,320000,321300,321311', 'mainland', '4');
INSERT INTO `region` VALUES ('321322', '321300', '沭阳县', ',1,320000,321300,321322', 'mainland', '4');
INSERT INTO `region` VALUES ('321323', '321300', '泗阳县', ',1,320000,321300,321323', 'mainland', '4');
INSERT INTO `region` VALUES ('321324', '321300', '泗洪县', ',1,320000,321300,321324', 'mainland', '4');
INSERT INTO `region` VALUES ('321325', '321300', '其它区', ',1,320000,321300,321325', 'mainland', '4');
INSERT INTO `region` VALUES ('330000', '1', '浙江省', ',1,330000', 'mainland', '2');
INSERT INTO `region` VALUES ('330100', '330000', '杭州市', ',1,330000,330100', 'mainland', '3');
INSERT INTO `region` VALUES ('330102', '330100', '上城区', ',1,330000,330100,330102', 'mainland', '4');
INSERT INTO `region` VALUES ('330103', '330100', '下城区', ',1,330000,330100,330103', 'mainland', '4');
INSERT INTO `region` VALUES ('330104', '330100', '江干区', ',1,330000,330100,330104', 'mainland', '4');
INSERT INTO `region` VALUES ('330105', '330100', '拱墅区', ',1,330000,330100,330105', 'mainland', '4');
INSERT INTO `region` VALUES ('330106', '330100', '西湖区', ',1,330000,330100,330106', 'mainland', '4');
INSERT INTO `region` VALUES ('330108', '330100', '滨江区', ',1,330000,330100,330108', 'mainland', '4');
INSERT INTO `region` VALUES ('330109', '330100', '萧山区', ',1,330000,330100,330109', 'mainland', '4');
INSERT INTO `region` VALUES ('330110', '330100', '余杭区', ',1,330000,330100,330110', 'mainland', '4');
INSERT INTO `region` VALUES ('330122', '330100', '桐庐县', ',1,330000,330100,330122', 'mainland', '4');
INSERT INTO `region` VALUES ('330127', '330100', '淳安县', ',1,330000,330100,330127', 'mainland', '4');
INSERT INTO `region` VALUES ('330182', '330100', '建德市', ',1,330000,330100,330182', 'mainland', '4');
INSERT INTO `region` VALUES ('330183', '330100', '富阳市', ',1,330000,330100,330183', 'mainland', '4');
INSERT INTO `region` VALUES ('330185', '330100', '临安市', ',1,330000,330100,330185', 'mainland', '4');
INSERT INTO `region` VALUES ('330186', '330100', '其它区', ',1,330000,330100,330186', 'mainland', '4');
INSERT INTO `region` VALUES ('330200', '330000', '宁波市', ',1,330000,330200', 'mainland', '3');
INSERT INTO `region` VALUES ('330203', '330200', '海曙区', ',1,330000,330200,330203', 'mainland', '4');
INSERT INTO `region` VALUES ('330204', '330200', '江东区', ',1,330000,330200,330204', 'mainland', '4');
INSERT INTO `region` VALUES ('330205', '330200', '江北区', ',1,330000,330200,330205', 'mainland', '4');
INSERT INTO `region` VALUES ('330206', '330200', '北仑区', ',1,330000,330200,330206', 'mainland', '4');
INSERT INTO `region` VALUES ('330211', '330200', '镇海区', ',1,330000,330200,330211', 'mainland', '4');
INSERT INTO `region` VALUES ('330212', '330200', '鄞州区', ',1,330000,330200,330212', 'mainland', '4');
INSERT INTO `region` VALUES ('330225', '330200', '象山县', ',1,330000,330200,330225', 'mainland', '4');
INSERT INTO `region` VALUES ('330226', '330200', '宁海县', ',1,330000,330200,330226', 'mainland', '4');
INSERT INTO `region` VALUES ('330281', '330200', '余姚市', ',1,330000,330200,330281', 'mainland', '4');
INSERT INTO `region` VALUES ('330282', '330200', '慈溪市', ',1,330000,330200,330282', 'mainland', '4');
INSERT INTO `region` VALUES ('330283', '330200', '奉化市', ',1,330000,330200,330283', 'mainland', '4');
INSERT INTO `region` VALUES ('330284', '330200', '其它区', ',1,330000,330200,330284', 'mainland', '4');
INSERT INTO `region` VALUES ('330300', '330000', '温州市', ',1,330000,330300', 'mainland', '3');
INSERT INTO `region` VALUES ('330302', '330300', '鹿城区', ',1,330000,330300,330302', 'mainland', '4');
INSERT INTO `region` VALUES ('330303', '330300', '龙湾区', ',1,330000,330300,330303', 'mainland', '4');
INSERT INTO `region` VALUES ('330304', '330300', '瓯海区', ',1,330000,330300,330304', 'mainland', '4');
INSERT INTO `region` VALUES ('330322', '330300', '洞头县', ',1,330000,330300,330322', 'mainland', '4');
INSERT INTO `region` VALUES ('330324', '330300', '永嘉县', ',1,330000,330300,330324', 'mainland', '4');
INSERT INTO `region` VALUES ('330326', '330300', '平阳县', ',1,330000,330300,330326', 'mainland', '4');
INSERT INTO `region` VALUES ('330327', '330300', '苍南县', ',1,330000,330300,330327', 'mainland', '4');
INSERT INTO `region` VALUES ('330328', '330300', '文成县', ',1,330000,330300,330328', 'mainland', '4');
INSERT INTO `region` VALUES ('330329', '330300', '泰顺县', ',1,330000,330300,330329', 'mainland', '4');
INSERT INTO `region` VALUES ('330381', '330300', '瑞安市', ',1,330000,330300,330381', 'mainland', '4');
INSERT INTO `region` VALUES ('330382', '330300', '乐清市', ',1,330000,330300,330382', 'mainland', '4');
INSERT INTO `region` VALUES ('330383', '330300', '其它区', ',1,330000,330300,330383', 'mainland', '4');
INSERT INTO `region` VALUES ('330400', '330000', '嘉兴市', ',1,330000,330400', 'mainland', '3');
INSERT INTO `region` VALUES ('330402', '330400', '南湖区', ',1,330000,330400,330402', 'mainland', '4');
INSERT INTO `region` VALUES ('330411', '330400', '秀洲区', ',1,330000,330400,330411', 'mainland', '4');
INSERT INTO `region` VALUES ('330421', '330400', '嘉善县', ',1,330000,330400,330421', 'mainland', '4');
INSERT INTO `region` VALUES ('330424', '330400', '海盐县', ',1,330000,330400,330424', 'mainland', '4');
INSERT INTO `region` VALUES ('330481', '330400', '海宁市', ',1,330000,330400,330481', 'mainland', '4');
INSERT INTO `region` VALUES ('330482', '330400', '平湖市', ',1,330000,330400,330482', 'mainland', '4');
INSERT INTO `region` VALUES ('330483', '330400', '桐乡市', ',1,330000,330400,330483', 'mainland', '4');
INSERT INTO `region` VALUES ('330484', '330400', '其它区', ',1,330000,330400,330484', 'mainland', '4');
INSERT INTO `region` VALUES ('330500', '330000', '湖州市', ',1,330000,330500', 'mainland', '3');
INSERT INTO `region` VALUES ('330502', '330500', '吴兴区', ',1,330000,330500,330502', 'mainland', '4');
INSERT INTO `region` VALUES ('330503', '330500', '南浔区', ',1,330000,330500,330503', 'mainland', '4');
INSERT INTO `region` VALUES ('330521', '330500', '德清县', ',1,330000,330500,330521', 'mainland', '4');
INSERT INTO `region` VALUES ('330522', '330500', '长兴县', ',1,330000,330500,330522', 'mainland', '4');
INSERT INTO `region` VALUES ('330523', '330500', '安吉县', ',1,330000,330500,330523', 'mainland', '4');
INSERT INTO `region` VALUES ('330524', '330500', '其它区', ',1,330000,330500,330524', 'mainland', '4');
INSERT INTO `region` VALUES ('330600', '330000', '绍兴市', ',1,330000,330600', 'mainland', '3');
INSERT INTO `region` VALUES ('330602', '330600', '越城区', ',1,330000,330600,330602', 'mainland', '4');
INSERT INTO `region` VALUES ('330621', '330600', '绍兴县', ',1,330000,330600,330621', 'mainland', '4');
INSERT INTO `region` VALUES ('330624', '330600', '新昌县', ',1,330000,330600,330624', 'mainland', '4');
INSERT INTO `region` VALUES ('330681', '330600', '诸暨市', ',1,330000,330600,330681', 'mainland', '4');
INSERT INTO `region` VALUES ('330682', '330600', '上虞市', ',1,330000,330600,330682', 'mainland', '4');
INSERT INTO `region` VALUES ('330683', '330600', '嵊州市', ',1,330000,330600,330683', 'mainland', '4');
INSERT INTO `region` VALUES ('330684', '330600', '其它区', ',1,330000,330600,330684', 'mainland', '4');
INSERT INTO `region` VALUES ('330700', '330000', '金华市', ',1,330000,330700', 'mainland', '3');
INSERT INTO `region` VALUES ('330702', '330700', '婺城区', ',1,330000,330700,330702', 'mainland', '4');
INSERT INTO `region` VALUES ('330703', '330700', '金东区', ',1,330000,330700,330703', 'mainland', '4');
INSERT INTO `region` VALUES ('330723', '330700', '武义县', ',1,330000,330700,330723', 'mainland', '4');
INSERT INTO `region` VALUES ('330726', '330700', '浦江县', ',1,330000,330700,330726', 'mainland', '4');
INSERT INTO `region` VALUES ('330727', '330700', '磐安县', ',1,330000,330700,330727', 'mainland', '4');
INSERT INTO `region` VALUES ('330781', '330700', '兰溪市', ',1,330000,330700,330781', 'mainland', '4');
INSERT INTO `region` VALUES ('330782', '330700', '义乌市', ',1,330000,330700,330782', 'mainland', '4');
INSERT INTO `region` VALUES ('330783', '330700', '东阳市', ',1,330000,330700,330783', 'mainland', '4');
INSERT INTO `region` VALUES ('330784', '330700', '永康市', ',1,330000,330700,330784', 'mainland', '4');
INSERT INTO `region` VALUES ('330785', '330700', '其它区', ',1,330000,330700,330785', 'mainland', '4');
INSERT INTO `region` VALUES ('330800', '330000', '衢州市', ',1,330000,330800', 'mainland', '3');
INSERT INTO `region` VALUES ('330802', '330800', '柯城区', ',1,330000,330800,330802', 'mainland', '4');
INSERT INTO `region` VALUES ('330803', '330800', '衢江区', ',1,330000,330800,330803', 'mainland', '4');
INSERT INTO `region` VALUES ('330822', '330800', '常山县', ',1,330000,330800,330822', 'mainland', '4');
INSERT INTO `region` VALUES ('330824', '330800', '开化县', ',1,330000,330800,330824', 'mainland', '4');
INSERT INTO `region` VALUES ('330825', '330800', '龙游县', ',1,330000,330800,330825', 'mainland', '4');
INSERT INTO `region` VALUES ('330881', '330800', '江山市', ',1,330000,330800,330881', 'mainland', '4');
INSERT INTO `region` VALUES ('330882', '330800', '其它区', ',1,330000,330800,330882', 'mainland', '4');
INSERT INTO `region` VALUES ('330900', '330000', '舟山市', ',1,330000,330900', 'mainland', '3');
INSERT INTO `region` VALUES ('330902', '330900', '定海区', ',1,330000,330900,330902', 'mainland', '4');
INSERT INTO `region` VALUES ('330903', '330900', '普陀区', ',1,330000,330900,330903', 'mainland', '4');
INSERT INTO `region` VALUES ('330921', '330900', '岱山县', ',1,330000,330900,330921', 'mainland', '4');
INSERT INTO `region` VALUES ('330922', '330900', '嵊泗县', ',1,330000,330900,330922', 'mainland', '4');
INSERT INTO `region` VALUES ('330923', '330900', '其它区', ',1,330000,330900,330923', 'mainland', '4');
INSERT INTO `region` VALUES ('331000', '330000', '台州市', ',1,330000,331000', 'mainland', '3');
INSERT INTO `region` VALUES ('331002', '331000', '椒江区', ',1,330000,331000,331002', 'mainland', '4');
INSERT INTO `region` VALUES ('331003', '331000', '黄岩区', ',1,330000,331000,331003', 'mainland', '4');
INSERT INTO `region` VALUES ('331004', '331000', '路桥区', ',1,330000,331000,331004', 'mainland', '4');
INSERT INTO `region` VALUES ('331021', '331000', '玉环县', ',1,330000,331000,331021', 'mainland', '4');
INSERT INTO `region` VALUES ('331022', '331000', '三门县', ',1,330000,331000,331022', 'mainland', '4');
INSERT INTO `region` VALUES ('331023', '331000', '天台县', ',1,330000,331000,331023', 'mainland', '4');
INSERT INTO `region` VALUES ('331024', '331000', '仙居县', ',1,330000,331000,331024', 'mainland', '4');
INSERT INTO `region` VALUES ('331081', '331000', '温岭市', ',1,330000,331000,331081', 'mainland', '4');
INSERT INTO `region` VALUES ('331082', '331000', '临海市', ',1,330000,331000,331082', 'mainland', '4');
INSERT INTO `region` VALUES ('331083', '331000', '其它区', ',1,330000,331000,331083', 'mainland', '4');
INSERT INTO `region` VALUES ('331100', '330000', '丽水市', ',1,330000,331100', 'mainland', '3');
INSERT INTO `region` VALUES ('331102', '331100', '莲都区', ',1,330000,331100,331102', 'mainland', '4');
INSERT INTO `region` VALUES ('331121', '331100', '青田县', ',1,330000,331100,331121', 'mainland', '4');
INSERT INTO `region` VALUES ('331122', '331100', '缙云县', ',1,330000,331100,331122', 'mainland', '4');
INSERT INTO `region` VALUES ('331123', '331100', '遂昌县', ',1,330000,331100,331123', 'mainland', '4');
INSERT INTO `region` VALUES ('331124', '331100', '松阳县', ',1,330000,331100,331124', 'mainland', '4');
INSERT INTO `region` VALUES ('331125', '331100', '云和县', ',1,330000,331100,331125', 'mainland', '4');
INSERT INTO `region` VALUES ('331126', '331100', '庆元县', ',1,330000,331100,331126', 'mainland', '4');
INSERT INTO `region` VALUES ('331127', '331100', '景宁畲族自治县', ',1,330000,331100,331127', 'mainland', '4');
INSERT INTO `region` VALUES ('331181', '331100', '龙泉市', ',1,330000,331100,331181', 'mainland', '4');
INSERT INTO `region` VALUES ('331182', '331100', '其它区', ',1,330000,331100,331182', 'mainland', '4');
INSERT INTO `region` VALUES ('340000', '1', '安徽省', ',1,340000', 'mainland', '2');
INSERT INTO `region` VALUES ('340100', '340000', '合肥市', ',1,340000,340100', 'mainland', '3');
INSERT INTO `region` VALUES ('340102', '340100', '瑶海区', ',1,340000,340100,340102', 'mainland', '4');
INSERT INTO `region` VALUES ('340103', '340100', '庐阳区', ',1,340000,340100,340103', 'mainland', '4');
INSERT INTO `region` VALUES ('340104', '340100', '蜀山区', ',1,340000,340100,340104', 'mainland', '4');
INSERT INTO `region` VALUES ('340111', '340100', '包河区', ',1,340000,340100,340111', 'mainland', '4');
INSERT INTO `region` VALUES ('340121', '340100', '长丰县', ',1,340000,340100,340121', 'mainland', '4');
INSERT INTO `region` VALUES ('340122', '340100', '肥东县', ',1,340000,340100,340122', 'mainland', '4');
INSERT INTO `region` VALUES ('340123', '340100', '肥西县', ',1,340000,340100,340123', 'mainland', '4');
INSERT INTO `region` VALUES ('340151', '340100', '高新区', ',1,340000,340100,340151', 'mainland', '4');
INSERT INTO `region` VALUES ('340191', '340100', '中区', ',1,340000,340100,340191', 'mainland', '4');
INSERT INTO `region` VALUES ('340192', '340100', '其它区', ',1,340000,340100,340192', 'mainland', '4');
INSERT INTO `region` VALUES ('340200', '340000', '芜湖市', ',1,340000,340200', 'mainland', '3');
INSERT INTO `region` VALUES ('340202', '340200', '镜湖区', ',1,340000,340200,340202', 'mainland', '4');
INSERT INTO `region` VALUES ('340203', '340200', '弋江区', ',1,340000,340200,340203', 'mainland', '4');
INSERT INTO `region` VALUES ('340207', '340200', '鸠江区', ',1,340000,340200,340207', 'mainland', '4');
INSERT INTO `region` VALUES ('340208', '340200', '三山区', ',1,340000,340200,340208', 'mainland', '4');
INSERT INTO `region` VALUES ('340221', '340200', '芜湖县', ',1,340000,340200,340221', 'mainland', '4');
INSERT INTO `region` VALUES ('340222', '340200', '繁昌县', ',1,340000,340200,340222', 'mainland', '4');
INSERT INTO `region` VALUES ('340223', '340200', '南陵县', ',1,340000,340200,340223', 'mainland', '4');
INSERT INTO `region` VALUES ('340224', '340200', '其它区', ',1,340000,340200,340224', 'mainland', '4');
INSERT INTO `region` VALUES ('340300', '340000', '蚌埠市', ',1,340000,340300', 'mainland', '3');
INSERT INTO `region` VALUES ('340302', '340300', '龙子湖区', ',1,340000,340300,340302', 'mainland', '4');
INSERT INTO `region` VALUES ('340303', '340300', '蚌山区', ',1,340000,340300,340303', 'mainland', '4');
INSERT INTO `region` VALUES ('340304', '340300', '禹会区', ',1,340000,340300,340304', 'mainland', '4');
INSERT INTO `region` VALUES ('340311', '340300', '淮上区', ',1,340000,340300,340311', 'mainland', '4');
INSERT INTO `region` VALUES ('340321', '340300', '怀远县', ',1,340000,340300,340321', 'mainland', '4');
INSERT INTO `region` VALUES ('340322', '340300', '五河县', ',1,340000,340300,340322', 'mainland', '4');
INSERT INTO `region` VALUES ('340323', '340300', '固镇县', ',1,340000,340300,340323', 'mainland', '4');
INSERT INTO `region` VALUES ('340324', '340300', '其它区', ',1,340000,340300,340324', 'mainland', '4');
INSERT INTO `region` VALUES ('340400', '340000', '淮南市', ',1,340000,340400', 'mainland', '3');
INSERT INTO `region` VALUES ('340402', '340400', '大通区', ',1,340000,340400,340402', 'mainland', '4');
INSERT INTO `region` VALUES ('340403', '340400', '田家庵区', ',1,340000,340400,340403', 'mainland', '4');
INSERT INTO `region` VALUES ('340404', '340400', '谢家集区', ',1,340000,340400,340404', 'mainland', '4');
INSERT INTO `region` VALUES ('340405', '340400', '八公山区', ',1,340000,340400,340405', 'mainland', '4');
INSERT INTO `region` VALUES ('340406', '340400', '潘集区', ',1,340000,340400,340406', 'mainland', '4');
INSERT INTO `region` VALUES ('340421', '340400', '凤台县', ',1,340000,340400,340421', 'mainland', '4');
INSERT INTO `region` VALUES ('340422', '340400', '其它区', ',1,340000,340400,340422', 'mainland', '4');
INSERT INTO `region` VALUES ('340500', '340000', '马鞍山市', ',1,340000,340500', 'mainland', '3');
INSERT INTO `region` VALUES ('340502', '340500', '金家庄区', ',1,340000,340500,340502', 'mainland', '4');
INSERT INTO `region` VALUES ('340503', '340500', '花山区', ',1,340000,340500,340503', 'mainland', '4');
INSERT INTO `region` VALUES ('340504', '340500', '雨山区', ',1,340000,340500,340504', 'mainland', '4');
INSERT INTO `region` VALUES ('340521', '340500', '当涂县', ',1,340000,340500,340521', 'mainland', '4');
INSERT INTO `region` VALUES ('340522', '340500', '其它区', ',1,340000,340500,340522', 'mainland', '4');
INSERT INTO `region` VALUES ('340600', '340000', '淮北市', ',1,340000,340600', 'mainland', '3');
INSERT INTO `region` VALUES ('340602', '340600', '杜集区', ',1,340000,340600,340602', 'mainland', '4');
INSERT INTO `region` VALUES ('340603', '340600', '相山区', ',1,340000,340600,340603', 'mainland', '4');
INSERT INTO `region` VALUES ('340604', '340600', '烈山区', ',1,340000,340600,340604', 'mainland', '4');
INSERT INTO `region` VALUES ('340621', '340600', '濉溪县', ',1,340000,340600,340621', 'mainland', '4');
INSERT INTO `region` VALUES ('340622', '340600', '其它区', ',1,340000,340600,340622', 'mainland', '4');
INSERT INTO `region` VALUES ('340700', '340000', '铜陵市', ',1,340000,340700', 'mainland', '3');
INSERT INTO `region` VALUES ('340702', '340700', '铜官山区', ',1,340000,340700,340702', 'mainland', '4');
INSERT INTO `region` VALUES ('340703', '340700', '狮子山区', ',1,340000,340700,340703', 'mainland', '4');
INSERT INTO `region` VALUES ('340711', '340700', '郊区', ',1,340000,340700,340711', 'mainland', '4');
INSERT INTO `region` VALUES ('340721', '340700', '铜陵县', ',1,340000,340700,340721', 'mainland', '4');
INSERT INTO `region` VALUES ('340722', '340700', '其它区', ',1,340000,340700,340722', 'mainland', '4');
INSERT INTO `region` VALUES ('340800', '340000', '安庆市', ',1,340000,340800', 'mainland', '3');
INSERT INTO `region` VALUES ('340802', '340800', '迎江区', ',1,340000,340800,340802', 'mainland', '4');
INSERT INTO `region` VALUES ('340803', '340800', '大观区', ',1,340000,340800,340803', 'mainland', '4');
INSERT INTO `region` VALUES ('340811', '340800', '宜秀区', ',1,340000,340800,340811', 'mainland', '4');
INSERT INTO `region` VALUES ('340822', '340800', '怀宁县', ',1,340000,340800,340822', 'mainland', '4');
INSERT INTO `region` VALUES ('340823', '340800', '枞阳县', ',1,340000,340800,340823', 'mainland', '4');
INSERT INTO `region` VALUES ('340824', '340800', '潜山县', ',1,340000,340800,340824', 'mainland', '4');
INSERT INTO `region` VALUES ('340825', '340800', '太湖县', ',1,340000,340800,340825', 'mainland', '4');
INSERT INTO `region` VALUES ('340826', '340800', '宿松县', ',1,340000,340800,340826', 'mainland', '4');
INSERT INTO `region` VALUES ('340827', '340800', '望江县', ',1,340000,340800,340827', 'mainland', '4');
INSERT INTO `region` VALUES ('340828', '340800', '岳西县', ',1,340000,340800,340828', 'mainland', '4');
INSERT INTO `region` VALUES ('340881', '340800', '桐城市', ',1,340000,340800,340881', 'mainland', '4');
INSERT INTO `region` VALUES ('340882', '340800', '其它区', ',1,340000,340800,340882', 'mainland', '4');
INSERT INTO `region` VALUES ('341000', '340000', '黄山市', ',1,340000,341000', 'mainland', '3');
INSERT INTO `region` VALUES ('341002', '341000', '屯溪区', ',1,340000,341000,341002', 'mainland', '4');
INSERT INTO `region` VALUES ('341003', '341000', '黄山区', ',1,340000,341000,341003', 'mainland', '4');
INSERT INTO `region` VALUES ('341004', '341000', '徽州区', ',1,340000,341000,341004', 'mainland', '4');
INSERT INTO `region` VALUES ('341021', '341000', '歙县', ',1,340000,341000,341021', 'mainland', '4');
INSERT INTO `region` VALUES ('341022', '341000', '休宁县', ',1,340000,341000,341022', 'mainland', '4');
INSERT INTO `region` VALUES ('341023', '341000', '黟县', ',1,340000,341000,341023', 'mainland', '4');
INSERT INTO `region` VALUES ('341024', '341000', '祁门县', ',1,340000,341000,341024', 'mainland', '4');
INSERT INTO `region` VALUES ('341025', '341000', '其它区', ',1,340000,341000,341025', 'mainland', '4');
INSERT INTO `region` VALUES ('341100', '340000', '滁州市', ',1,340000,341100', 'mainland', '3');
INSERT INTO `region` VALUES ('341102', '341100', '琅琊区', ',1,340000,341100,341102', 'mainland', '4');
INSERT INTO `region` VALUES ('341103', '341100', '南谯区', ',1,340000,341100,341103', 'mainland', '4');
INSERT INTO `region` VALUES ('341122', '341100', '来安县', ',1,340000,341100,341122', 'mainland', '4');
INSERT INTO `region` VALUES ('341124', '341100', '全椒县', ',1,340000,341100,341124', 'mainland', '4');
INSERT INTO `region` VALUES ('341125', '341100', '定远县', ',1,340000,341100,341125', 'mainland', '4');
INSERT INTO `region` VALUES ('341126', '341100', '凤阳县', ',1,340000,341100,341126', 'mainland', '4');
INSERT INTO `region` VALUES ('341181', '341100', '天长市', ',1,340000,341100,341181', 'mainland', '4');
INSERT INTO `region` VALUES ('341182', '341100', '明光市', ',1,340000,341100,341182', 'mainland', '4');
INSERT INTO `region` VALUES ('341183', '341100', '其它区', ',1,340000,341100,341183', 'mainland', '4');
INSERT INTO `region` VALUES ('341200', '340000', '阜阳市', ',1,340000,341200', 'mainland', '3');
INSERT INTO `region` VALUES ('341202', '341200', '颍州区', ',1,340000,341200,341202', 'mainland', '4');
INSERT INTO `region` VALUES ('341203', '341200', '颍东区', ',1,340000,341200,341203', 'mainland', '4');
INSERT INTO `region` VALUES ('341204', '341200', '颍泉区', ',1,340000,341200,341204', 'mainland', '4');
INSERT INTO `region` VALUES ('341221', '341200', '临泉县', ',1,340000,341200,341221', 'mainland', '4');
INSERT INTO `region` VALUES ('341222', '341200', '太和县', ',1,340000,341200,341222', 'mainland', '4');
INSERT INTO `region` VALUES ('341225', '341200', '阜南县', ',1,340000,341200,341225', 'mainland', '4');
INSERT INTO `region` VALUES ('341226', '341200', '颍上县', ',1,340000,341200,341226', 'mainland', '4');
INSERT INTO `region` VALUES ('341282', '341200', '界首市', ',1,340000,341200,341282', 'mainland', '4');
INSERT INTO `region` VALUES ('341283', '341200', '其它区', ',1,340000,341200,341283', 'mainland', '4');
INSERT INTO `region` VALUES ('341300', '340000', '宿州市', ',1,340000,341300', 'mainland', '3');
INSERT INTO `region` VALUES ('341302', '341300', '埇桥区', ',1,340000,341300,341302', 'mainland', '4');
INSERT INTO `region` VALUES ('341321', '341300', '砀山县', ',1,340000,341300,341321', 'mainland', '4');
INSERT INTO `region` VALUES ('341322', '341300', '萧县', ',1,340000,341300,341322', 'mainland', '4');
INSERT INTO `region` VALUES ('341323', '341300', '灵璧县', ',1,340000,341300,341323', 'mainland', '4');
INSERT INTO `region` VALUES ('341324', '341300', '泗县', ',1,340000,341300,341324', 'mainland', '4');
INSERT INTO `region` VALUES ('341325', '341300', '其它区', ',1,340000,341300,341325', 'mainland', '4');
INSERT INTO `region` VALUES ('341400', '340000', '巢湖市', ',1,340000,341400', 'mainland', '3');
INSERT INTO `region` VALUES ('341402', '341400', '居巢区', ',1,340000,341400,341402', 'mainland', '4');
INSERT INTO `region` VALUES ('341421', '341400', '庐江县', ',1,340000,341400,341421', 'mainland', '4');
INSERT INTO `region` VALUES ('341422', '341400', '无为县', ',1,340000,341400,341422', 'mainland', '4');
INSERT INTO `region` VALUES ('341423', '341400', '含山县', ',1,340000,341400,341423', 'mainland', '4');
INSERT INTO `region` VALUES ('341424', '341400', '和县', ',1,340000,341400,341424', 'mainland', '4');
INSERT INTO `region` VALUES ('341425', '341400', '其它区', ',1,340000,341400,341425', 'mainland', '4');
INSERT INTO `region` VALUES ('341500', '340000', '六安市', ',1,340000,341500', 'mainland', '3');
INSERT INTO `region` VALUES ('341502', '341500', '金安区', ',1,340000,341500,341502', 'mainland', '4');
INSERT INTO `region` VALUES ('341503', '341500', '裕安区', ',1,340000,341500,341503', 'mainland', '4');
INSERT INTO `region` VALUES ('341521', '341500', '寿县', ',1,340000,341500,341521', 'mainland', '4');
INSERT INTO `region` VALUES ('341522', '341500', '霍邱县', ',1,340000,341500,341522', 'mainland', '4');
INSERT INTO `region` VALUES ('341523', '341500', '舒城县', ',1,340000,341500,341523', 'mainland', '4');
INSERT INTO `region` VALUES ('341524', '341500', '金寨县', ',1,340000,341500,341524', 'mainland', '4');
INSERT INTO `region` VALUES ('341525', '341500', '霍山县', ',1,340000,341500,341525', 'mainland', '4');
INSERT INTO `region` VALUES ('341526', '341500', '其它区', ',1,340000,341500,341526', 'mainland', '4');
INSERT INTO `region` VALUES ('341600', '340000', '亳州市', ',1,340000,341600', 'mainland', '3');
INSERT INTO `region` VALUES ('341602', '341600', '谯城区', ',1,340000,341600,341602', 'mainland', '4');
INSERT INTO `region` VALUES ('341621', '341600', '涡阳县', ',1,340000,341600,341621', 'mainland', '4');
INSERT INTO `region` VALUES ('341622', '341600', '蒙城县', ',1,340000,341600,341622', 'mainland', '4');
INSERT INTO `region` VALUES ('341623', '341600', '利辛县', ',1,340000,341600,341623', 'mainland', '4');
INSERT INTO `region` VALUES ('341624', '341600', '其它区', ',1,340000,341600,341624', 'mainland', '4');
INSERT INTO `region` VALUES ('341700', '340000', '池州市', ',1,340000,341700', 'mainland', '3');
INSERT INTO `region` VALUES ('341702', '341700', '贵池区', ',1,340000,341700,341702', 'mainland', '4');
INSERT INTO `region` VALUES ('341721', '341700', '东至县', ',1,340000,341700,341721', 'mainland', '4');
INSERT INTO `region` VALUES ('341722', '341700', '石台县', ',1,340000,341700,341722', 'mainland', '4');
INSERT INTO `region` VALUES ('341723', '341700', '青阳县', ',1,340000,341700,341723', 'mainland', '4');
INSERT INTO `region` VALUES ('341724', '341700', '其它区', ',1,340000,341700,341724', 'mainland', '4');
INSERT INTO `region` VALUES ('341800', '340000', '宣城市', ',1,340000,341800', 'mainland', '3');
INSERT INTO `region` VALUES ('341802', '341800', '宣州区', ',1,340000,341800,341802', 'mainland', '4');
INSERT INTO `region` VALUES ('341821', '341800', '郎溪县', ',1,340000,341800,341821', 'mainland', '4');
INSERT INTO `region` VALUES ('341822', '341800', '广德县', ',1,340000,341800,341822', 'mainland', '4');
INSERT INTO `region` VALUES ('341823', '341800', '泾县', ',1,340000,341800,341823', 'mainland', '4');
INSERT INTO `region` VALUES ('341824', '341800', '绩溪县', ',1,340000,341800,341824', 'mainland', '4');
INSERT INTO `region` VALUES ('341825', '341800', '旌德县', ',1,340000,341800,341825', 'mainland', '4');
INSERT INTO `region` VALUES ('341881', '341800', '宁国市', ',1,340000,341800,341881', 'mainland', '4');
INSERT INTO `region` VALUES ('341882', '341800', '其它区', ',1,340000,341800,341882', 'mainland', '4');
INSERT INTO `region` VALUES ('350000', '1', '福建省', ',1,350000', 'mainland', '2');
INSERT INTO `region` VALUES ('350100', '350000', '福州市', ',1,350000,350100', 'mainland', '3');
INSERT INTO `region` VALUES ('350102', '350100', '鼓楼区', ',1,350000,350100,350102', 'mainland', '4');
INSERT INTO `region` VALUES ('350103', '350100', '台江区', ',1,350000,350100,350103', 'mainland', '4');
INSERT INTO `region` VALUES ('350104', '350100', '仓山区', ',1,350000,350100,350104', 'mainland', '4');
INSERT INTO `region` VALUES ('350105', '350100', '马尾区', ',1,350000,350100,350105', 'mainland', '4');
INSERT INTO `region` VALUES ('350111', '350100', '晋安区', ',1,350000,350100,350111', 'mainland', '4');
INSERT INTO `region` VALUES ('350121', '350100', '闽侯县', ',1,350000,350100,350121', 'mainland', '4');
INSERT INTO `region` VALUES ('350122', '350100', '连江县', ',1,350000,350100,350122', 'mainland', '4');
INSERT INTO `region` VALUES ('350123', '350100', '罗源县', ',1,350000,350100,350123', 'mainland', '4');
INSERT INTO `region` VALUES ('350124', '350100', '闽清县', ',1,350000,350100,350124', 'mainland', '4');
INSERT INTO `region` VALUES ('350125', '350100', '永泰县', ',1,350000,350100,350125', 'mainland', '4');
INSERT INTO `region` VALUES ('350128', '350100', '平潭县', ',1,350000,350100,350128', 'mainland', '4');
INSERT INTO `region` VALUES ('350181', '350100', '福清市', ',1,350000,350100,350181', 'mainland', '4');
INSERT INTO `region` VALUES ('350182', '350100', '长乐市', ',1,350000,350100,350182', 'mainland', '4');
INSERT INTO `region` VALUES ('350183', '350100', '其它区', ',1,350000,350100,350183', 'mainland', '4');
INSERT INTO `region` VALUES ('350200', '350000', '厦门市', ',1,350000,350200', 'mainland', '3');
INSERT INTO `region` VALUES ('350203', '350200', '思明区', ',1,350000,350200,350203', 'mainland', '4');
INSERT INTO `region` VALUES ('350205', '350200', '海沧区', ',1,350000,350200,350205', 'mainland', '4');
INSERT INTO `region` VALUES ('350206', '350200', '湖里区', ',1,350000,350200,350206', 'mainland', '4');
INSERT INTO `region` VALUES ('350211', '350200', '集美区', ',1,350000,350200,350211', 'mainland', '4');
INSERT INTO `region` VALUES ('350212', '350200', '同安区', ',1,350000,350200,350212', 'mainland', '4');
INSERT INTO `region` VALUES ('350213', '350200', '翔安区', ',1,350000,350200,350213', 'mainland', '4');
INSERT INTO `region` VALUES ('350214', '350200', '其它区', ',1,350000,350200,350214', 'mainland', '4');
INSERT INTO `region` VALUES ('350300', '350000', '莆田市', ',1,350000,350300', 'mainland', '3');
INSERT INTO `region` VALUES ('350302', '350300', '城厢区', ',1,350000,350300,350302', 'mainland', '4');
INSERT INTO `region` VALUES ('350303', '350300', '涵江区', ',1,350000,350300,350303', 'mainland', '4');
INSERT INTO `region` VALUES ('350304', '350300', '荔城区', ',1,350000,350300,350304', 'mainland', '4');
INSERT INTO `region` VALUES ('350305', '350300', '秀屿区', ',1,350000,350300,350305', 'mainland', '4');
INSERT INTO `region` VALUES ('350322', '350300', '仙游县', ',1,350000,350300,350322', 'mainland', '4');
INSERT INTO `region` VALUES ('350323', '350300', '其它区', ',1,350000,350300,350323', 'mainland', '4');
INSERT INTO `region` VALUES ('350400', '350000', '三明市', ',1,350000,350400', 'mainland', '3');
INSERT INTO `region` VALUES ('350402', '350400', '梅列区', ',1,350000,350400,350402', 'mainland', '4');
INSERT INTO `region` VALUES ('350403', '350400', '三元区', ',1,350000,350400,350403', 'mainland', '4');
INSERT INTO `region` VALUES ('350421', '350400', '明溪县', ',1,350000,350400,350421', 'mainland', '4');
INSERT INTO `region` VALUES ('350423', '350400', '清流县', ',1,350000,350400,350423', 'mainland', '4');
INSERT INTO `region` VALUES ('350424', '350400', '宁化县', ',1,350000,350400,350424', 'mainland', '4');
INSERT INTO `region` VALUES ('350425', '350400', '大田县', ',1,350000,350400,350425', 'mainland', '4');
INSERT INTO `region` VALUES ('350426', '350400', '尤溪县', ',1,350000,350400,350426', 'mainland', '4');
INSERT INTO `region` VALUES ('350427', '350400', '沙县', ',1,350000,350400,350427', 'mainland', '4');
INSERT INTO `region` VALUES ('350428', '350400', '将乐县', ',1,350000,350400,350428', 'mainland', '4');
INSERT INTO `region` VALUES ('350429', '350400', '泰宁县', ',1,350000,350400,350429', 'mainland', '4');
INSERT INTO `region` VALUES ('350430', '350400', '建宁县', ',1,350000,350400,350430', 'mainland', '4');
INSERT INTO `region` VALUES ('350481', '350400', '永安市', ',1,350000,350400,350481', 'mainland', '4');
INSERT INTO `region` VALUES ('350482', '350400', '其它区', ',1,350000,350400,350482', 'mainland', '4');
INSERT INTO `region` VALUES ('350500', '350000', '泉州市', ',1,350000,350500', 'mainland', '3');
INSERT INTO `region` VALUES ('350502', '350500', '鲤城区', ',1,350000,350500,350502', 'mainland', '4');
INSERT INTO `region` VALUES ('350503', '350500', '丰泽区', ',1,350000,350500,350503', 'mainland', '4');
INSERT INTO `region` VALUES ('350504', '350500', '洛江区', ',1,350000,350500,350504', 'mainland', '4');
INSERT INTO `region` VALUES ('350505', '350500', '泉港区', ',1,350000,350500,350505', 'mainland', '4');
INSERT INTO `region` VALUES ('350521', '350500', '惠安县', ',1,350000,350500,350521', 'mainland', '4');
INSERT INTO `region` VALUES ('350524', '350500', '安溪县', ',1,350000,350500,350524', 'mainland', '4');
INSERT INTO `region` VALUES ('350525', '350500', '永春县', ',1,350000,350500,350525', 'mainland', '4');
INSERT INTO `region` VALUES ('350526', '350500', '德化县', ',1,350000,350500,350526', 'mainland', '4');
INSERT INTO `region` VALUES ('350527', '350500', '金门县', ',1,350000,350500,350527', 'mainland', '4');
INSERT INTO `region` VALUES ('350581', '350500', '石狮市', ',1,350000,350500,350581', 'mainland', '4');
INSERT INTO `region` VALUES ('350582', '350500', '晋江市', ',1,350000,350500,350582', 'mainland', '4');
INSERT INTO `region` VALUES ('350583', '350500', '南安市', ',1,350000,350500,350583', 'mainland', '4');
INSERT INTO `region` VALUES ('350584', '350500', '其它区', ',1,350000,350500,350584', 'mainland', '4');
INSERT INTO `region` VALUES ('350600', '350000', '漳州市', ',1,350000,350600', 'mainland', '3');
INSERT INTO `region` VALUES ('350602', '350600', '芗城区', ',1,350000,350600,350602', 'mainland', '4');
INSERT INTO `region` VALUES ('350603', '350600', '龙文区', ',1,350000,350600,350603', 'mainland', '4');
INSERT INTO `region` VALUES ('350622', '350600', '云霄县', ',1,350000,350600,350622', 'mainland', '4');
INSERT INTO `region` VALUES ('350623', '350600', '漳浦县', ',1,350000,350600,350623', 'mainland', '4');
INSERT INTO `region` VALUES ('350624', '350600', '诏安县', ',1,350000,350600,350624', 'mainland', '4');
INSERT INTO `region` VALUES ('350625', '350600', '长泰县', ',1,350000,350600,350625', 'mainland', '4');
INSERT INTO `region` VALUES ('350626', '350600', '东山县', ',1,350000,350600,350626', 'mainland', '4');
INSERT INTO `region` VALUES ('350627', '350600', '南靖县', ',1,350000,350600,350627', 'mainland', '4');
INSERT INTO `region` VALUES ('350628', '350600', '平和县', ',1,350000,350600,350628', 'mainland', '4');
INSERT INTO `region` VALUES ('350629', '350600', '华安县', ',1,350000,350600,350629', 'mainland', '4');
INSERT INTO `region` VALUES ('350681', '350600', '龙海市', ',1,350000,350600,350681', 'mainland', '4');
INSERT INTO `region` VALUES ('350682', '350600', '其它区', ',1,350000,350600,350682', 'mainland', '4');
INSERT INTO `region` VALUES ('350700', '350000', '南平市', ',1,350000,350700', 'mainland', '3');
INSERT INTO `region` VALUES ('350702', '350700', '延平区', ',1,350000,350700,350702', 'mainland', '4');
INSERT INTO `region` VALUES ('350721', '350700', '顺昌县', ',1,350000,350700,350721', 'mainland', '4');
INSERT INTO `region` VALUES ('350722', '350700', '浦城县', ',1,350000,350700,350722', 'mainland', '4');
INSERT INTO `region` VALUES ('350723', '350700', '光泽县', ',1,350000,350700,350723', 'mainland', '4');
INSERT INTO `region` VALUES ('350724', '350700', '松溪县', ',1,350000,350700,350724', 'mainland', '4');
INSERT INTO `region` VALUES ('350725', '350700', '政和县', ',1,350000,350700,350725', 'mainland', '4');
INSERT INTO `region` VALUES ('350781', '350700', '邵武市', ',1,350000,350700,350781', 'mainland', '4');
INSERT INTO `region` VALUES ('350782', '350700', '武夷山市', ',1,350000,350700,350782', 'mainland', '4');
INSERT INTO `region` VALUES ('350783', '350700', '建瓯市', ',1,350000,350700,350783', 'mainland', '4');
INSERT INTO `region` VALUES ('350784', '350700', '建阳市', ',1,350000,350700,350784', 'mainland', '4');
INSERT INTO `region` VALUES ('350785', '350700', '其它区', ',1,350000,350700,350785', 'mainland', '4');
INSERT INTO `region` VALUES ('350800', '350000', '龙岩市', ',1,350000,350800', 'mainland', '3');
INSERT INTO `region` VALUES ('350802', '350800', '新罗区', ',1,350000,350800,350802', 'mainland', '4');
INSERT INTO `region` VALUES ('350821', '350800', '长汀县', ',1,350000,350800,350821', 'mainland', '4');
INSERT INTO `region` VALUES ('350822', '350800', '永定县', ',1,350000,350800,350822', 'mainland', '4');
INSERT INTO `region` VALUES ('350823', '350800', '上杭县', ',1,350000,350800,350823', 'mainland', '4');
INSERT INTO `region` VALUES ('350824', '350800', '武平县', ',1,350000,350800,350824', 'mainland', '4');
INSERT INTO `region` VALUES ('350825', '350800', '连城县', ',1,350000,350800,350825', 'mainland', '4');
INSERT INTO `region` VALUES ('350881', '350800', '漳平市', ',1,350000,350800,350881', 'mainland', '4');
INSERT INTO `region` VALUES ('350882', '350800', '其它区', ',1,350000,350800,350882', 'mainland', '4');
INSERT INTO `region` VALUES ('350900', '350000', '宁德市', ',1,350000,350900', 'mainland', '3');
INSERT INTO `region` VALUES ('350902', '350900', '蕉城区', ',1,350000,350900,350902', 'mainland', '4');
INSERT INTO `region` VALUES ('350921', '350900', '霞浦县', ',1,350000,350900,350921', 'mainland', '4');
INSERT INTO `region` VALUES ('350922', '350900', '古田县', ',1,350000,350900,350922', 'mainland', '4');
INSERT INTO `region` VALUES ('350923', '350900', '屏南县', ',1,350000,350900,350923', 'mainland', '4');
INSERT INTO `region` VALUES ('350924', '350900', '寿宁县', ',1,350000,350900,350924', 'mainland', '4');
INSERT INTO `region` VALUES ('350925', '350900', '周宁县', ',1,350000,350900,350925', 'mainland', '4');
INSERT INTO `region` VALUES ('350926', '350900', '柘荣县', ',1,350000,350900,350926', 'mainland', '4');
INSERT INTO `region` VALUES ('350981', '350900', '福安市', ',1,350000,350900,350981', 'mainland', '4');
INSERT INTO `region` VALUES ('350982', '350900', '福鼎市', ',1,350000,350900,350982', 'mainland', '4');
INSERT INTO `region` VALUES ('350983', '350900', '其它区', ',1,350000,350900,350983', 'mainland', '4');
INSERT INTO `region` VALUES ('360000', '1', '江西省', ',1,360000', 'mainland', '2');
INSERT INTO `region` VALUES ('360100', '360000', '南昌市', ',1,360000,360100', 'mainland', '3');
INSERT INTO `region` VALUES ('360102', '360100', '东湖区', ',1,360000,360100,360102', 'mainland', '4');
INSERT INTO `region` VALUES ('360103', '360100', '西湖区', ',1,360000,360100,360103', 'mainland', '4');
INSERT INTO `region` VALUES ('360104', '360100', '青云谱区', ',1,360000,360100,360104', 'mainland', '4');
INSERT INTO `region` VALUES ('360105', '360100', '湾里区', ',1,360000,360100,360105', 'mainland', '4');
INSERT INTO `region` VALUES ('360111', '360100', '青山湖区', ',1,360000,360100,360111', 'mainland', '4');
INSERT INTO `region` VALUES ('360121', '360100', '南昌县', ',1,360000,360100,360121', 'mainland', '4');
INSERT INTO `region` VALUES ('360122', '360100', '新建县', ',1,360000,360100,360122', 'mainland', '4');
INSERT INTO `region` VALUES ('360123', '360100', '安义县', ',1,360000,360100,360123', 'mainland', '4');
INSERT INTO `region` VALUES ('360124', '360100', '进贤县', ',1,360000,360100,360124', 'mainland', '4');
INSERT INTO `region` VALUES ('360125', '360100', '红谷滩新区', ',1,360000,360100,360125', 'mainland', '4');
INSERT INTO `region` VALUES ('360126', '360100', '经济技术开发区', ',1,360000,360100,360126', 'mainland', '4');
INSERT INTO `region` VALUES ('360127', '360100', '昌北区', ',1,360000,360100,360127', 'mainland', '4');
INSERT INTO `region` VALUES ('360128', '360100', '其它区', ',1,360000,360100,360128', 'mainland', '4');
INSERT INTO `region` VALUES ('360200', '360000', '景德镇市', ',1,360000,360200', 'mainland', '3');
INSERT INTO `region` VALUES ('360202', '360200', '昌江区', ',1,360000,360200,360202', 'mainland', '4');
INSERT INTO `region` VALUES ('360203', '360200', '珠山区', ',1,360000,360200,360203', 'mainland', '4');
INSERT INTO `region` VALUES ('360222', '360200', '浮梁县', ',1,360000,360200,360222', 'mainland', '4');
INSERT INTO `region` VALUES ('360281', '360200', '乐平市', ',1,360000,360200,360281', 'mainland', '4');
INSERT INTO `region` VALUES ('360282', '360200', '其它区', ',1,360000,360200,360282', 'mainland', '4');
INSERT INTO `region` VALUES ('360300', '360000', '萍乡市', ',1,360000,360300', 'mainland', '3');
INSERT INTO `region` VALUES ('360302', '360300', '安源区', ',1,360000,360300,360302', 'mainland', '4');
INSERT INTO `region` VALUES ('360313', '360300', '湘东区', ',1,360000,360300,360313', 'mainland', '4');
INSERT INTO `region` VALUES ('360321', '360300', '莲花县', ',1,360000,360300,360321', 'mainland', '4');
INSERT INTO `region` VALUES ('360322', '360300', '上栗县', ',1,360000,360300,360322', 'mainland', '4');
INSERT INTO `region` VALUES ('360323', '360300', '芦溪县', ',1,360000,360300,360323', 'mainland', '4');
INSERT INTO `region` VALUES ('360324', '360300', '其它区', ',1,360000,360300,360324', 'mainland', '4');
INSERT INTO `region` VALUES ('360400', '360000', '九江市', ',1,360000,360400', 'mainland', '3');
INSERT INTO `region` VALUES ('360402', '360400', '庐山区', ',1,360000,360400,360402', 'mainland', '4');
INSERT INTO `region` VALUES ('360403', '360400', '浔阳区', ',1,360000,360400,360403', 'mainland', '4');
INSERT INTO `region` VALUES ('360421', '360400', '九江县', ',1,360000,360400,360421', 'mainland', '4');
INSERT INTO `region` VALUES ('360423', '360400', '武宁县', ',1,360000,360400,360423', 'mainland', '4');
INSERT INTO `region` VALUES ('360424', '360400', '修水县', ',1,360000,360400,360424', 'mainland', '4');
INSERT INTO `region` VALUES ('360425', '360400', '永修县', ',1,360000,360400,360425', 'mainland', '4');
INSERT INTO `region` VALUES ('360426', '360400', '德安县', ',1,360000,360400,360426', 'mainland', '4');
INSERT INTO `region` VALUES ('360427', '360400', '星子县', ',1,360000,360400,360427', 'mainland', '4');
INSERT INTO `region` VALUES ('360428', '360400', '都昌县', ',1,360000,360400,360428', 'mainland', '4');
INSERT INTO `region` VALUES ('360429', '360400', '湖口县', ',1,360000,360400,360429', 'mainland', '4');
INSERT INTO `region` VALUES ('360430', '360400', '彭泽县', ',1,360000,360400,360430', 'mainland', '4');
INSERT INTO `region` VALUES ('360481', '360400', '瑞昌市', ',1,360000,360400,360481', 'mainland', '4');
INSERT INTO `region` VALUES ('360482', '360400', '其它区', ',1,360000,360400,360482', 'mainland', '4');
INSERT INTO `region` VALUES ('360500', '360000', '新余市', ',1,360000,360500', 'mainland', '3');
INSERT INTO `region` VALUES ('360502', '360500', '渝水区', ',1,360000,360500,360502', 'mainland', '4');
INSERT INTO `region` VALUES ('360521', '360500', '分宜县', ',1,360000,360500,360521', 'mainland', '4');
INSERT INTO `region` VALUES ('360522', '360500', '其它区', ',1,360000,360500,360522', 'mainland', '4');
INSERT INTO `region` VALUES ('360600', '360000', '鹰潭市', ',1,360000,360600', 'mainland', '3');
INSERT INTO `region` VALUES ('360602', '360600', '月湖区', ',1,360000,360600,360602', 'mainland', '4');
INSERT INTO `region` VALUES ('360622', '360600', '余江县', ',1,360000,360600,360622', 'mainland', '4');
INSERT INTO `region` VALUES ('360681', '360600', '贵溪市', ',1,360000,360600,360681', 'mainland', '4');
INSERT INTO `region` VALUES ('360682', '360600', '其它区', ',1,360000,360600,360682', 'mainland', '4');
INSERT INTO `region` VALUES ('360700', '360000', '赣州市', ',1,360000,360700', 'mainland', '3');
INSERT INTO `region` VALUES ('360702', '360700', '章贡区', ',1,360000,360700,360702', 'mainland', '4');
INSERT INTO `region` VALUES ('360721', '360700', '赣县', ',1,360000,360700,360721', 'mainland', '4');
INSERT INTO `region` VALUES ('360722', '360700', '信丰县', ',1,360000,360700,360722', 'mainland', '4');
INSERT INTO `region` VALUES ('360723', '360700', '大余县', ',1,360000,360700,360723', 'mainland', '4');
INSERT INTO `region` VALUES ('360724', '360700', '上犹县', ',1,360000,360700,360724', 'mainland', '4');
INSERT INTO `region` VALUES ('360725', '360700', '崇义县', ',1,360000,360700,360725', 'mainland', '4');
INSERT INTO `region` VALUES ('360726', '360700', '安远县', ',1,360000,360700,360726', 'mainland', '4');
INSERT INTO `region` VALUES ('360727', '360700', '龙南县', ',1,360000,360700,360727', 'mainland', '4');
INSERT INTO `region` VALUES ('360728', '360700', '定南县', ',1,360000,360700,360728', 'mainland', '4');
INSERT INTO `region` VALUES ('360729', '360700', '全南县', ',1,360000,360700,360729', 'mainland', '4');
INSERT INTO `region` VALUES ('360730', '360700', '宁都县', ',1,360000,360700,360730', 'mainland', '4');
INSERT INTO `region` VALUES ('360731', '360700', '于都县', ',1,360000,360700,360731', 'mainland', '4');
INSERT INTO `region` VALUES ('360732', '360700', '兴国县', ',1,360000,360700,360732', 'mainland', '4');
INSERT INTO `region` VALUES ('360733', '360700', '会昌县', ',1,360000,360700,360733', 'mainland', '4');
INSERT INTO `region` VALUES ('360734', '360700', '寻乌县', ',1,360000,360700,360734', 'mainland', '4');
INSERT INTO `region` VALUES ('360735', '360700', '石城县', ',1,360000,360700,360735', 'mainland', '4');
INSERT INTO `region` VALUES ('360751', '360700', '黄金区', ',1,360000,360700,360751', 'mainland', '4');
INSERT INTO `region` VALUES ('360781', '360700', '瑞金市', ',1,360000,360700,360781', 'mainland', '4');
INSERT INTO `region` VALUES ('360782', '360700', '南康市', ',1,360000,360700,360782', 'mainland', '4');
INSERT INTO `region` VALUES ('360783', '360700', '其它区', ',1,360000,360700,360783', 'mainland', '4');
INSERT INTO `region` VALUES ('360800', '360000', '吉安市', ',1,360000,360800', 'mainland', '3');
INSERT INTO `region` VALUES ('360802', '360800', '吉州区', ',1,360000,360800,360802', 'mainland', '4');
INSERT INTO `region` VALUES ('360803', '360800', '青原区', ',1,360000,360800,360803', 'mainland', '4');
INSERT INTO `region` VALUES ('360821', '360800', '吉安县', ',1,360000,360800,360821', 'mainland', '4');
INSERT INTO `region` VALUES ('360822', '360800', '吉水县', ',1,360000,360800,360822', 'mainland', '4');
INSERT INTO `region` VALUES ('360823', '360800', '峡江县', ',1,360000,360800,360823', 'mainland', '4');
INSERT INTO `region` VALUES ('360824', '360800', '新干县', ',1,360000,360800,360824', 'mainland', '4');
INSERT INTO `region` VALUES ('360825', '360800', '永丰县', ',1,360000,360800,360825', 'mainland', '4');
INSERT INTO `region` VALUES ('360826', '360800', '泰和县', ',1,360000,360800,360826', 'mainland', '4');
INSERT INTO `region` VALUES ('360827', '360800', '遂川县', ',1,360000,360800,360827', 'mainland', '4');
INSERT INTO `region` VALUES ('360828', '360800', '万安县', ',1,360000,360800,360828', 'mainland', '4');
INSERT INTO `region` VALUES ('360829', '360800', '安福县', ',1,360000,360800,360829', 'mainland', '4');
INSERT INTO `region` VALUES ('360830', '360800', '永新县', ',1,360000,360800,360830', 'mainland', '4');
INSERT INTO `region` VALUES ('360881', '360800', '井冈山市', ',1,360000,360800,360881', 'mainland', '4');
INSERT INTO `region` VALUES ('360882', '360800', '其它区', ',1,360000,360800,360882', 'mainland', '4');
INSERT INTO `region` VALUES ('360900', '360000', '宜春市', ',1,360000,360900', 'mainland', '3');
INSERT INTO `region` VALUES ('360902', '360900', '袁州区', ',1,360000,360900,360902', 'mainland', '4');
INSERT INTO `region` VALUES ('360921', '360900', '奉新县', ',1,360000,360900,360921', 'mainland', '4');
INSERT INTO `region` VALUES ('360922', '360900', '万载县', ',1,360000,360900,360922', 'mainland', '4');
INSERT INTO `region` VALUES ('360923', '360900', '上高县', ',1,360000,360900,360923', 'mainland', '4');
INSERT INTO `region` VALUES ('360924', '360900', '宜丰县', ',1,360000,360900,360924', 'mainland', '4');
INSERT INTO `region` VALUES ('360925', '360900', '靖安县', ',1,360000,360900,360925', 'mainland', '4');
INSERT INTO `region` VALUES ('360926', '360900', '铜鼓县', ',1,360000,360900,360926', 'mainland', '4');
INSERT INTO `region` VALUES ('360981', '360900', '丰城市', ',1,360000,360900,360981', 'mainland', '4');
INSERT INTO `region` VALUES ('360982', '360900', '樟树市', ',1,360000,360900,360982', 'mainland', '4');
INSERT INTO `region` VALUES ('360983', '360900', '高安市', ',1,360000,360900,360983', 'mainland', '4');
INSERT INTO `region` VALUES ('360984', '360900', '其它区', ',1,360000,360900,360984', 'mainland', '4');
INSERT INTO `region` VALUES ('361000', '360000', '抚州市', ',1,360000,361000', 'mainland', '3');
INSERT INTO `region` VALUES ('361002', '361000', '临川区', ',1,360000,361000,361002', 'mainland', '4');
INSERT INTO `region` VALUES ('361021', '361000', '南城县', ',1,360000,361000,361021', 'mainland', '4');
INSERT INTO `region` VALUES ('361022', '361000', '黎川县', ',1,360000,361000,361022', 'mainland', '4');
INSERT INTO `region` VALUES ('361023', '361000', '南丰县', ',1,360000,361000,361023', 'mainland', '4');
INSERT INTO `region` VALUES ('361024', '361000', '崇仁县', ',1,360000,361000,361024', 'mainland', '4');
INSERT INTO `region` VALUES ('361025', '361000', '乐安县', ',1,360000,361000,361025', 'mainland', '4');
INSERT INTO `region` VALUES ('361026', '361000', '宜黄县', ',1,360000,361000,361026', 'mainland', '4');
INSERT INTO `region` VALUES ('361027', '361000', '金溪县', ',1,360000,361000,361027', 'mainland', '4');
INSERT INTO `region` VALUES ('361028', '361000', '资溪县', ',1,360000,361000,361028', 'mainland', '4');
INSERT INTO `region` VALUES ('361029', '361000', '东乡县', ',1,360000,361000,361029', 'mainland', '4');
INSERT INTO `region` VALUES ('361030', '361000', '广昌县', ',1,360000,361000,361030', 'mainland', '4');
INSERT INTO `region` VALUES ('361031', '361000', '其它区', ',1,360000,361000,361031', 'mainland', '4');
INSERT INTO `region` VALUES ('361100', '360000', '上饶市', ',1,360000,361100', 'mainland', '3');
INSERT INTO `region` VALUES ('361102', '361100', '信州区', ',1,360000,361100,361102', 'mainland', '4');
INSERT INTO `region` VALUES ('361121', '361100', '上饶县', ',1,360000,361100,361121', 'mainland', '4');
INSERT INTO `region` VALUES ('361122', '361100', '广丰县', ',1,360000,361100,361122', 'mainland', '4');
INSERT INTO `region` VALUES ('361123', '361100', '玉山县', ',1,360000,361100,361123', 'mainland', '4');
INSERT INTO `region` VALUES ('361124', '361100', '铅山县', ',1,360000,361100,361124', 'mainland', '4');
INSERT INTO `region` VALUES ('361125', '361100', '横峰县', ',1,360000,361100,361125', 'mainland', '4');
INSERT INTO `region` VALUES ('361126', '361100', '弋阳县', ',1,360000,361100,361126', 'mainland', '4');
INSERT INTO `region` VALUES ('361127', '361100', '余干县', ',1,360000,361100,361127', 'mainland', '4');
INSERT INTO `region` VALUES ('361128', '361100', '鄱阳县', ',1,360000,361100,361128', 'mainland', '4');
INSERT INTO `region` VALUES ('361129', '361100', '万年县', ',1,360000,361100,361129', 'mainland', '4');
INSERT INTO `region` VALUES ('361130', '361100', '婺源县', ',1,360000,361100,361130', 'mainland', '4');
INSERT INTO `region` VALUES ('361181', '361100', '德兴市', ',1,360000,361100,361181', 'mainland', '4');
INSERT INTO `region` VALUES ('361182', '361100', '其它区', ',1,360000,361100,361182', 'mainland', '4');
INSERT INTO `region` VALUES ('370000', '1', '山东省', ',1,370000', 'mainland', '2');
INSERT INTO `region` VALUES ('370100', '370000', '济南市', ',1,370000,370100', 'mainland', '3');
INSERT INTO `region` VALUES ('370102', '370100', '历下区', ',1,370000,370100,370102', 'mainland', '4');
INSERT INTO `region` VALUES ('370103', '370100', '市中区', ',1,370000,370100,370103', 'mainland', '4');
INSERT INTO `region` VALUES ('370104', '370100', '槐荫区', ',1,370000,370100,370104', 'mainland', '4');
INSERT INTO `region` VALUES ('370105', '370100', '天桥区', ',1,370000,370100,370105', 'mainland', '4');
INSERT INTO `region` VALUES ('370112', '370100', '历城区', ',1,370000,370100,370112', 'mainland', '4');
INSERT INTO `region` VALUES ('370113', '370100', '长清区', ',1,370000,370100,370113', 'mainland', '4');
INSERT INTO `region` VALUES ('370124', '370100', '平阴县', ',1,370000,370100,370124', 'mainland', '4');
INSERT INTO `region` VALUES ('370125', '370100', '济阳县', ',1,370000,370100,370125', 'mainland', '4');
INSERT INTO `region` VALUES ('370126', '370100', '商河县', ',1,370000,370100,370126', 'mainland', '4');
INSERT INTO `region` VALUES ('370181', '370100', '章丘市', ',1,370000,370100,370181', 'mainland', '4');
INSERT INTO `region` VALUES ('370182', '370100', '其它区', ',1,370000,370100,370182', 'mainland', '4');
INSERT INTO `region` VALUES ('370200', '370000', '青岛市', ',1,370000,370200', 'mainland', '3');
INSERT INTO `region` VALUES ('370202', '370200', '市南区', ',1,370000,370200,370202', 'mainland', '4');
INSERT INTO `region` VALUES ('370203', '370200', '市北区', ',1,370000,370200,370203', 'mainland', '4');
INSERT INTO `region` VALUES ('370205', '370200', '四方区', ',1,370000,370200,370205', 'mainland', '4');
INSERT INTO `region` VALUES ('370211', '370200', '黄岛区', ',1,370000,370200,370211', 'mainland', '4');
INSERT INTO `region` VALUES ('370212', '370200', '崂山区', ',1,370000,370200,370212', 'mainland', '4');
INSERT INTO `region` VALUES ('370213', '370200', '李沧区', ',1,370000,370200,370213', 'mainland', '4');
INSERT INTO `region` VALUES ('370214', '370200', '城阳区', ',1,370000,370200,370214', 'mainland', '4');
INSERT INTO `region` VALUES ('370251', '370200', '开发区', ',1,370000,370200,370251', 'mainland', '4');
INSERT INTO `region` VALUES ('370281', '370200', '胶州市', ',1,370000,370200,370281', 'mainland', '4');
INSERT INTO `region` VALUES ('370282', '370200', '即墨市', ',1,370000,370200,370282', 'mainland', '4');
INSERT INTO `region` VALUES ('370283', '370200', '平度市', ',1,370000,370200,370283', 'mainland', '4');
INSERT INTO `region` VALUES ('370284', '370200', '胶南市', ',1,370000,370200,370284', 'mainland', '4');
INSERT INTO `region` VALUES ('370285', '370200', '莱西市', ',1,370000,370200,370285', 'mainland', '4');
INSERT INTO `region` VALUES ('370286', '370200', '其它区', ',1,370000,370200,370286', 'mainland', '4');
INSERT INTO `region` VALUES ('370300', '370000', '淄博市', ',1,370000,370300', 'mainland', '3');
INSERT INTO `region` VALUES ('370302', '370300', '淄川区', ',1,370000,370300,370302', 'mainland', '4');
INSERT INTO `region` VALUES ('370303', '370300', '张店区', ',1,370000,370300,370303', 'mainland', '4');
INSERT INTO `region` VALUES ('370304', '370300', '博山区', ',1,370000,370300,370304', 'mainland', '4');
INSERT INTO `region` VALUES ('370305', '370300', '临淄区', ',1,370000,370300,370305', 'mainland', '4');
INSERT INTO `region` VALUES ('370306', '370300', '周村区', ',1,370000,370300,370306', 'mainland', '4');
INSERT INTO `region` VALUES ('370321', '370300', '桓台县', ',1,370000,370300,370321', 'mainland', '4');
INSERT INTO `region` VALUES ('370322', '370300', '高青县', ',1,370000,370300,370322', 'mainland', '4');
INSERT INTO `region` VALUES ('370323', '370300', '沂源县', ',1,370000,370300,370323', 'mainland', '4');
INSERT INTO `region` VALUES ('370324', '370300', '其它区', ',1,370000,370300,370324', 'mainland', '4');
INSERT INTO `region` VALUES ('370400', '370000', '枣庄市', ',1,370000,370400', 'mainland', '3');
INSERT INTO `region` VALUES ('370402', '370400', '市中区', ',1,370000,370400,370402', 'mainland', '4');
INSERT INTO `region` VALUES ('370403', '370400', '薛城区', ',1,370000,370400,370403', 'mainland', '4');
INSERT INTO `region` VALUES ('370404', '370400', '峄城区', ',1,370000,370400,370404', 'mainland', '4');
INSERT INTO `region` VALUES ('370405', '370400', '台儿庄区', ',1,370000,370400,370405', 'mainland', '4');
INSERT INTO `region` VALUES ('370406', '370400', '山亭区', ',1,370000,370400,370406', 'mainland', '4');
INSERT INTO `region` VALUES ('370481', '370400', '滕州市', ',1,370000,370400,370481', 'mainland', '4');
INSERT INTO `region` VALUES ('370482', '370400', '其它区', ',1,370000,370400,370482', 'mainland', '4');
INSERT INTO `region` VALUES ('370500', '370000', '东营市', ',1,370000,370500', 'mainland', '3');
INSERT INTO `region` VALUES ('370502', '370500', '东营区', ',1,370000,370500,370502', 'mainland', '4');
INSERT INTO `region` VALUES ('370503', '370500', '河口区', ',1,370000,370500,370503', 'mainland', '4');
INSERT INTO `region` VALUES ('370521', '370500', '垦利县', ',1,370000,370500,370521', 'mainland', '4');
INSERT INTO `region` VALUES ('370522', '370500', '利津县', ',1,370000,370500,370522', 'mainland', '4');
INSERT INTO `region` VALUES ('370523', '370500', '广饶县', ',1,370000,370500,370523', 'mainland', '4');
INSERT INTO `region` VALUES ('370589', '370500', '西城区', ',1,370000,370500,370589', 'mainland', '4');
INSERT INTO `region` VALUES ('370590', '370500', '东城区', ',1,370000,370500,370590', 'mainland', '4');
INSERT INTO `region` VALUES ('370591', '370500', '其它区', ',1,370000,370500,370591', 'mainland', '4');
INSERT INTO `region` VALUES ('370600', '370000', '烟台市', ',1,370000,370600', 'mainland', '3');
INSERT INTO `region` VALUES ('370602', '370600', '芝罘区', ',1,370000,370600,370602', 'mainland', '4');
INSERT INTO `region` VALUES ('370611', '370600', '福山区', ',1,370000,370600,370611', 'mainland', '4');
INSERT INTO `region` VALUES ('370612', '370600', '牟平区', ',1,370000,370600,370612', 'mainland', '4');
INSERT INTO `region` VALUES ('370613', '370600', '莱山区', ',1,370000,370600,370613', 'mainland', '4');
INSERT INTO `region` VALUES ('370634', '370600', '长岛县', ',1,370000,370600,370634', 'mainland', '4');
INSERT INTO `region` VALUES ('370681', '370600', '龙口市', ',1,370000,370600,370681', 'mainland', '4');
INSERT INTO `region` VALUES ('370682', '370600', '莱阳市', ',1,370000,370600,370682', 'mainland', '4');
INSERT INTO `region` VALUES ('370683', '370600', '莱州市', ',1,370000,370600,370683', 'mainland', '4');
INSERT INTO `region` VALUES ('370684', '370600', '蓬莱市', ',1,370000,370600,370684', 'mainland', '4');
INSERT INTO `region` VALUES ('370685', '370600', '招远市', ',1,370000,370600,370685', 'mainland', '4');
INSERT INTO `region` VALUES ('370686', '370600', '栖霞市', ',1,370000,370600,370686', 'mainland', '4');
INSERT INTO `region` VALUES ('370687', '370600', '海阳市', ',1,370000,370600,370687', 'mainland', '4');
INSERT INTO `region` VALUES ('370688', '370600', '其它区', ',1,370000,370600,370688', 'mainland', '4');
INSERT INTO `region` VALUES ('370700', '370000', '潍坊市', ',1,370000,370700', 'mainland', '3');
INSERT INTO `region` VALUES ('370702', '370700', '潍城区', ',1,370000,370700,370702', 'mainland', '4');
INSERT INTO `region` VALUES ('370703', '370700', '寒亭区', ',1,370000,370700,370703', 'mainland', '4');
INSERT INTO `region` VALUES ('370704', '370700', '坊子区', ',1,370000,370700,370704', 'mainland', '4');
INSERT INTO `region` VALUES ('370705', '370700', '奎文区', ',1,370000,370700,370705', 'mainland', '4');
INSERT INTO `region` VALUES ('370724', '370700', '临朐县', ',1,370000,370700,370724', 'mainland', '4');
INSERT INTO `region` VALUES ('370725', '370700', '昌乐县', ',1,370000,370700,370725', 'mainland', '4');
INSERT INTO `region` VALUES ('370751', '370700', '开发区', ',1,370000,370700,370751', 'mainland', '4');
INSERT INTO `region` VALUES ('370781', '370700', '青州市', ',1,370000,370700,370781', 'mainland', '4');
INSERT INTO `region` VALUES ('370782', '370700', '诸城市', ',1,370000,370700,370782', 'mainland', '4');
INSERT INTO `region` VALUES ('370783', '370700', '寿光市', ',1,370000,370700,370783', 'mainland', '4');
INSERT INTO `region` VALUES ('370784', '370700', '安丘市', ',1,370000,370700,370784', 'mainland', '4');
INSERT INTO `region` VALUES ('370785', '370700', '高密市', ',1,370000,370700,370785', 'mainland', '4');
INSERT INTO `region` VALUES ('370786', '370700', '昌邑市', ',1,370000,370700,370786', 'mainland', '4');
INSERT INTO `region` VALUES ('370787', '370700', '其它区', ',1,370000,370700,370787', 'mainland', '4');
INSERT INTO `region` VALUES ('370800', '370000', '济宁市', ',1,370000,370800', 'mainland', '3');
INSERT INTO `region` VALUES ('370802', '370800', '市中区', ',1,370000,370800,370802', 'mainland', '4');
INSERT INTO `region` VALUES ('370811', '370800', '任城区', ',1,370000,370800,370811', 'mainland', '4');
INSERT INTO `region` VALUES ('370826', '370800', '微山县', ',1,370000,370800,370826', 'mainland', '4');
INSERT INTO `region` VALUES ('370827', '370800', '鱼台县', ',1,370000,370800,370827', 'mainland', '4');
INSERT INTO `region` VALUES ('370828', '370800', '金乡县', ',1,370000,370800,370828', 'mainland', '4');
INSERT INTO `region` VALUES ('370829', '370800', '嘉祥县', ',1,370000,370800,370829', 'mainland', '4');
INSERT INTO `region` VALUES ('370830', '370800', '汶上县', ',1,370000,370800,370830', 'mainland', '4');
INSERT INTO `region` VALUES ('370831', '370800', '泗水县', ',1,370000,370800,370831', 'mainland', '4');
INSERT INTO `region` VALUES ('370832', '370800', '梁山县', ',1,370000,370800,370832', 'mainland', '4');
INSERT INTO `region` VALUES ('370881', '370800', '曲阜市', ',1,370000,370800,370881', 'mainland', '4');
INSERT INTO `region` VALUES ('370882', '370800', '兖州市', ',1,370000,370800,370882', 'mainland', '4');
INSERT INTO `region` VALUES ('370883', '370800', '邹城市', ',1,370000,370800,370883', 'mainland', '4');
INSERT INTO `region` VALUES ('370884', '370800', '其它区', ',1,370000,370800,370884', 'mainland', '4');
INSERT INTO `region` VALUES ('370900', '370000', '泰安市', ',1,370000,370900', 'mainland', '3');
INSERT INTO `region` VALUES ('370902', '370900', '泰山区', ',1,370000,370900,370902', 'mainland', '4');
INSERT INTO `region` VALUES ('370903', '370900', '岱岳区', ',1,370000,370900,370903', 'mainland', '4');
INSERT INTO `region` VALUES ('370921', '370900', '宁阳县', ',1,370000,370900,370921', 'mainland', '4');
INSERT INTO `region` VALUES ('370923', '370900', '东平县', ',1,370000,370900,370923', 'mainland', '4');
INSERT INTO `region` VALUES ('370982', '370900', '新泰市', ',1,370000,370900,370982', 'mainland', '4');
INSERT INTO `region` VALUES ('370983', '370900', '肥城市', ',1,370000,370900,370983', 'mainland', '4');
INSERT INTO `region` VALUES ('370984', '370900', '其它区', ',1,370000,370900,370984', 'mainland', '4');
INSERT INTO `region` VALUES ('371000', '370000', '威海市', ',1,370000,371000', 'mainland', '3');
INSERT INTO `region` VALUES ('371002', '371000', '环翠区', ',1,370000,371000,371002', 'mainland', '4');
INSERT INTO `region` VALUES ('371081', '371000', '文登市', ',1,370000,371000,371081', 'mainland', '4');
INSERT INTO `region` VALUES ('371082', '371000', '荣成市', ',1,370000,371000,371082', 'mainland', '4');
INSERT INTO `region` VALUES ('371083', '371000', '乳山市', ',1,370000,371000,371083', 'mainland', '4');
INSERT INTO `region` VALUES ('371084', '371000', '其它区', ',1,370000,371000,371084', 'mainland', '4');
INSERT INTO `region` VALUES ('371100', '370000', '日照市', ',1,370000,371100', 'mainland', '3');
INSERT INTO `region` VALUES ('371102', '371100', '东港区', ',1,370000,371100,371102', 'mainland', '4');
INSERT INTO `region` VALUES ('371103', '371100', '岚山区', ',1,370000,371100,371103', 'mainland', '4');
INSERT INTO `region` VALUES ('371121', '371100', '五莲县', ',1,370000,371100,371121', 'mainland', '4');
INSERT INTO `region` VALUES ('371122', '371100', '莒县', ',1,370000,371100,371122', 'mainland', '4');
INSERT INTO `region` VALUES ('371123', '371100', '其它区', ',1,370000,371100,371123', 'mainland', '4');
INSERT INTO `region` VALUES ('371200', '370000', '莱芜市', ',1,370000,371200', 'mainland', '3');
INSERT INTO `region` VALUES ('371202', '371200', '莱城区', ',1,370000,371200,371202', 'mainland', '4');
INSERT INTO `region` VALUES ('371203', '371200', '钢城区', ',1,370000,371200,371203', 'mainland', '4');
INSERT INTO `region` VALUES ('371204', '371200', '其它区', ',1,370000,371200,371204', 'mainland', '4');
INSERT INTO `region` VALUES ('371300', '370000', '临沂市', ',1,370000,371300', 'mainland', '3');
INSERT INTO `region` VALUES ('371302', '371300', '兰山区', ',1,370000,371300,371302', 'mainland', '4');
INSERT INTO `region` VALUES ('371311', '371300', '罗庄区', ',1,370000,371300,371311', 'mainland', '4');
INSERT INTO `region` VALUES ('371312', '371300', '河东区', ',1,370000,371300,371312', 'mainland', '4');
INSERT INTO `region` VALUES ('371321', '371300', '沂南县', ',1,370000,371300,371321', 'mainland', '4');
INSERT INTO `region` VALUES ('371322', '371300', '郯城县', ',1,370000,371300,371322', 'mainland', '4');
INSERT INTO `region` VALUES ('371323', '371300', '沂水县', ',1,370000,371300,371323', 'mainland', '4');
INSERT INTO `region` VALUES ('371324', '371300', '苍山县', ',1,370000,371300,371324', 'mainland', '4');
INSERT INTO `region` VALUES ('371325', '371300', '费县', ',1,370000,371300,371325', 'mainland', '4');
INSERT INTO `region` VALUES ('371326', '371300', '平邑县', ',1,370000,371300,371326', 'mainland', '4');
INSERT INTO `region` VALUES ('371327', '371300', '莒南县', ',1,370000,371300,371327', 'mainland', '4');
INSERT INTO `region` VALUES ('371328', '371300', '蒙阴县', ',1,370000,371300,371328', 'mainland', '4');
INSERT INTO `region` VALUES ('371329', '371300', '临沭县', ',1,370000,371300,371329', 'mainland', '4');
INSERT INTO `region` VALUES ('371330', '371300', '其它区', ',1,370000,371300,371330', 'mainland', '4');
INSERT INTO `region` VALUES ('371400', '370000', '德州市', ',1,370000,371400', 'mainland', '3');
INSERT INTO `region` VALUES ('371402', '371400', '德城区', ',1,370000,371400,371402', 'mainland', '4');
INSERT INTO `region` VALUES ('371421', '371400', '陵县', ',1,370000,371400,371421', 'mainland', '4');
INSERT INTO `region` VALUES ('371422', '371400', '宁津县', ',1,370000,371400,371422', 'mainland', '4');
INSERT INTO `region` VALUES ('371423', '371400', '庆云县', ',1,370000,371400,371423', 'mainland', '4');
INSERT INTO `region` VALUES ('371424', '371400', '临邑县', ',1,370000,371400,371424', 'mainland', '4');
INSERT INTO `region` VALUES ('371425', '371400', '齐河县', ',1,370000,371400,371425', 'mainland', '4');
INSERT INTO `region` VALUES ('371426', '371400', '平原县', ',1,370000,371400,371426', 'mainland', '4');
INSERT INTO `region` VALUES ('371427', '371400', '夏津县', ',1,370000,371400,371427', 'mainland', '4');
INSERT INTO `region` VALUES ('371428', '371400', '武城县', ',1,370000,371400,371428', 'mainland', '4');
INSERT INTO `region` VALUES ('371451', '371400', '开发区', ',1,370000,371400,371451', 'mainland', '4');
INSERT INTO `region` VALUES ('371481', '371400', '乐陵市', ',1,370000,371400,371481', 'mainland', '4');
INSERT INTO `region` VALUES ('371482', '371400', '禹城市', ',1,370000,371400,371482', 'mainland', '4');
INSERT INTO `region` VALUES ('371483', '371400', '其它区', ',1,370000,371400,371483', 'mainland', '4');
INSERT INTO `region` VALUES ('371500', '370000', '聊城市', ',1,370000,371500', 'mainland', '3');
INSERT INTO `region` VALUES ('371502', '371500', '东昌府区', ',1,370000,371500,371502', 'mainland', '4');
INSERT INTO `region` VALUES ('371521', '371500', '阳谷县', ',1,370000,371500,371521', 'mainland', '4');
INSERT INTO `region` VALUES ('371522', '371500', '莘县', ',1,370000,371500,371522', 'mainland', '4');
INSERT INTO `region` VALUES ('371523', '371500', '茌平县', ',1,370000,371500,371523', 'mainland', '4');
INSERT INTO `region` VALUES ('371524', '371500', '东阿县', ',1,370000,371500,371524', 'mainland', '4');
INSERT INTO `region` VALUES ('371525', '371500', '冠县', ',1,370000,371500,371525', 'mainland', '4');
INSERT INTO `region` VALUES ('371526', '371500', '高唐县', ',1,370000,371500,371526', 'mainland', '4');
INSERT INTO `region` VALUES ('371581', '371500', '临清市', ',1,370000,371500,371581', 'mainland', '4');
INSERT INTO `region` VALUES ('371582', '371500', '其它区', ',1,370000,371500,371582', 'mainland', '4');
INSERT INTO `region` VALUES ('371600', '370000', '滨州市', ',1,370000,371600', 'mainland', '3');
INSERT INTO `region` VALUES ('371602', '371600', '滨城区', ',1,370000,371600,371602', 'mainland', '4');
INSERT INTO `region` VALUES ('371621', '371600', '惠民县', ',1,370000,371600,371621', 'mainland', '4');
INSERT INTO `region` VALUES ('371622', '371600', '阳信县', ',1,370000,371600,371622', 'mainland', '4');
INSERT INTO `region` VALUES ('371623', '371600', '无棣县', ',1,370000,371600,371623', 'mainland', '4');
INSERT INTO `region` VALUES ('371624', '371600', '沾化县', ',1,370000,371600,371624', 'mainland', '4');
INSERT INTO `region` VALUES ('371625', '371600', '博兴县', ',1,370000,371600,371625', 'mainland', '4');
INSERT INTO `region` VALUES ('371626', '371600', '邹平县', ',1,370000,371600,371626', 'mainland', '4');
INSERT INTO `region` VALUES ('371627', '371600', '其它区', ',1,370000,371600,371627', 'mainland', '4');
INSERT INTO `region` VALUES ('371700', '370000', '菏泽市', ',1,370000,371700', 'mainland', '3');
INSERT INTO `region` VALUES ('371702', '371700', '牡丹区', ',1,370000,371700,371702', 'mainland', '4');
INSERT INTO `region` VALUES ('371721', '371700', '曹县', ',1,370000,371700,371721', 'mainland', '4');
INSERT INTO `region` VALUES ('371722', '371700', '单县', ',1,370000,371700,371722', 'mainland', '4');
INSERT INTO `region` VALUES ('371723', '371700', '成武县', ',1,370000,371700,371723', 'mainland', '4');
INSERT INTO `region` VALUES ('371724', '371700', '巨野县', ',1,370000,371700,371724', 'mainland', '4');
INSERT INTO `region` VALUES ('371725', '371700', '郓城县', ',1,370000,371700,371725', 'mainland', '4');
INSERT INTO `region` VALUES ('371726', '371700', '鄄城县', ',1,370000,371700,371726', 'mainland', '4');
INSERT INTO `region` VALUES ('371727', '371700', '定陶县', ',1,370000,371700,371727', 'mainland', '4');
INSERT INTO `region` VALUES ('371728', '371700', '东明县', ',1,370000,371700,371728', 'mainland', '4');
INSERT INTO `region` VALUES ('371729', '371700', '其它区', ',1,370000,371700,371729', 'mainland', '4');
INSERT INTO `region` VALUES ('410000', '1', '河南省', ',1,410000', 'mainland', '2');
INSERT INTO `region` VALUES ('410100', '410000', '郑州市', ',1,410000,410100', 'mainland', '3');
INSERT INTO `region` VALUES ('410102', '410100', '中原区', ',1,410000,410100,410102', 'mainland', '4');
INSERT INTO `region` VALUES ('410103', '410100', '二七区', ',1,410000,410100,410103', 'mainland', '4');
INSERT INTO `region` VALUES ('410104', '410100', '管城回族区', ',1,410000,410100,410104', 'mainland', '4');
INSERT INTO `region` VALUES ('410105', '410100', '金水区', ',1,410000,410100,410105', 'mainland', '4');
INSERT INTO `region` VALUES ('410106', '410100', '上街区', ',1,410000,410100,410106', 'mainland', '4');
INSERT INTO `region` VALUES ('410108', '410100', '惠济区', ',1,410000,410100,410108', 'mainland', '4');
INSERT INTO `region` VALUES ('410122', '410100', '中牟县', ',1,410000,410100,410122', 'mainland', '4');
INSERT INTO `region` VALUES ('410181', '410100', '巩义市', ',1,410000,410100,410181', 'mainland', '4');
INSERT INTO `region` VALUES ('410182', '410100', '荥阳市', ',1,410000,410100,410182', 'mainland', '4');
INSERT INTO `region` VALUES ('410183', '410100', '新密市', ',1,410000,410100,410183', 'mainland', '4');
INSERT INTO `region` VALUES ('410184', '410100', '新郑市', ',1,410000,410100,410184', 'mainland', '4');
INSERT INTO `region` VALUES ('410185', '410100', '登封市', ',1,410000,410100,410185', 'mainland', '4');
INSERT INTO `region` VALUES ('410186', '410100', '郑东新区', ',1,410000,410100,410186', 'mainland', '4');
INSERT INTO `region` VALUES ('410187', '410100', '高新区', ',1,410000,410100,410187', 'mainland', '4');
INSERT INTO `region` VALUES ('410188', '410100', '其它区', ',1,410000,410100,410188', 'mainland', '4');
INSERT INTO `region` VALUES ('410200', '410000', '开封市', ',1,410000,410200', 'mainland', '3');
INSERT INTO `region` VALUES ('410202', '410200', '龙亭区', ',1,410000,410200,410202', 'mainland', '4');
INSERT INTO `region` VALUES ('410203', '410200', '顺河回族区', ',1,410000,410200,410203', 'mainland', '4');
INSERT INTO `region` VALUES ('410204', '410200', '鼓楼区', ',1,410000,410200,410204', 'mainland', '4');
INSERT INTO `region` VALUES ('410205', '410200', '禹王台区', ',1,410000,410200,410205', 'mainland', '4');
INSERT INTO `region` VALUES ('410211', '410200', '金明区', ',1,410000,410200,410211', 'mainland', '4');
INSERT INTO `region` VALUES ('410221', '410200', '杞县', ',1,410000,410200,410221', 'mainland', '4');
INSERT INTO `region` VALUES ('410222', '410200', '通许县', ',1,410000,410200,410222', 'mainland', '4');
INSERT INTO `region` VALUES ('410223', '410200', '尉氏县', ',1,410000,410200,410223', 'mainland', '4');
INSERT INTO `region` VALUES ('410224', '410200', '开封县', ',1,410000,410200,410224', 'mainland', '4');
INSERT INTO `region` VALUES ('410225', '410200', '兰考县', ',1,410000,410200,410225', 'mainland', '4');
INSERT INTO `region` VALUES ('410226', '410200', '其它区', ',1,410000,410200,410226', 'mainland', '4');
INSERT INTO `region` VALUES ('410300', '410000', '洛阳市', ',1,410000,410300', 'mainland', '3');
INSERT INTO `region` VALUES ('410302', '410300', '老城区', ',1,410000,410300,410302', 'mainland', '4');
INSERT INTO `region` VALUES ('410303', '410300', '西工区', ',1,410000,410300,410303', 'mainland', '4');
INSERT INTO `region` VALUES ('410304', '410300', '廛河回族区', ',1,410000,410300,410304', 'mainland', '4');
INSERT INTO `region` VALUES ('410305', '410300', '涧西区', ',1,410000,410300,410305', 'mainland', '4');
INSERT INTO `region` VALUES ('410306', '410300', '吉利区', ',1,410000,410300,410306', 'mainland', '4');
INSERT INTO `region` VALUES ('410307', '410300', '洛龙区', ',1,410000,410300,410307', 'mainland', '4');
INSERT INTO `region` VALUES ('410322', '410300', '孟津县', ',1,410000,410300,410322', 'mainland', '4');
INSERT INTO `region` VALUES ('410323', '410300', '新安县', ',1,410000,410300,410323', 'mainland', '4');
INSERT INTO `region` VALUES ('410324', '410300', '栾川县', ',1,410000,410300,410324', 'mainland', '4');
INSERT INTO `region` VALUES ('410325', '410300', '嵩县', ',1,410000,410300,410325', 'mainland', '4');
INSERT INTO `region` VALUES ('410326', '410300', '汝阳县', ',1,410000,410300,410326', 'mainland', '4');
INSERT INTO `region` VALUES ('410327', '410300', '宜阳县', ',1,410000,410300,410327', 'mainland', '4');
INSERT INTO `region` VALUES ('410328', '410300', '洛宁县', ',1,410000,410300,410328', 'mainland', '4');
INSERT INTO `region` VALUES ('410329', '410300', '伊川县', ',1,410000,410300,410329', 'mainland', '4');
INSERT INTO `region` VALUES ('410381', '410300', '偃师市', ',1,410000,410300,410381', 'mainland', '4');
INSERT INTO `region` VALUES ('410400', '410000', '平顶山市', ',1,410000,410400', 'mainland', '3');
INSERT INTO `region` VALUES ('410402', '410400', '新华区', ',1,410000,410400,410402', 'mainland', '4');
INSERT INTO `region` VALUES ('410403', '410400', '卫东区', ',1,410000,410400,410403', 'mainland', '4');
INSERT INTO `region` VALUES ('410404', '410400', '石龙区', ',1,410000,410400,410404', 'mainland', '4');
INSERT INTO `region` VALUES ('410411', '410400', '湛河区', ',1,410000,410400,410411', 'mainland', '4');
INSERT INTO `region` VALUES ('410421', '410400', '宝丰县', ',1,410000,410400,410421', 'mainland', '4');
INSERT INTO `region` VALUES ('410422', '410400', '叶县', ',1,410000,410400,410422', 'mainland', '4');
INSERT INTO `region` VALUES ('410423', '410400', '鲁山县', ',1,410000,410400,410423', 'mainland', '4');
INSERT INTO `region` VALUES ('410425', '410400', '郏县', ',1,410000,410400,410425', 'mainland', '4');
INSERT INTO `region` VALUES ('410481', '410400', '舞钢市', ',1,410000,410400,410481', 'mainland', '4');
INSERT INTO `region` VALUES ('410482', '410400', '汝州市', ',1,410000,410400,410482', 'mainland', '4');
INSERT INTO `region` VALUES ('410483', '410400', '其它区', ',1,410000,410400,410483', 'mainland', '4');
INSERT INTO `region` VALUES ('410500', '410000', '安阳市', ',1,410000,410500', 'mainland', '3');
INSERT INTO `region` VALUES ('410502', '410500', '文峰区', ',1,410000,410500,410502', 'mainland', '4');
INSERT INTO `region` VALUES ('410503', '410500', '北关区', ',1,410000,410500,410503', 'mainland', '4');
INSERT INTO `region` VALUES ('410505', '410500', '殷都区', ',1,410000,410500,410505', 'mainland', '4');
INSERT INTO `region` VALUES ('410506', '410500', '龙安区', ',1,410000,410500,410506', 'mainland', '4');
INSERT INTO `region` VALUES ('410522', '410500', '安阳县', ',1,410000,410500,410522', 'mainland', '4');
INSERT INTO `region` VALUES ('410523', '410500', '汤阴县', ',1,410000,410500,410523', 'mainland', '4');
INSERT INTO `region` VALUES ('410526', '410500', '滑县', ',1,410000,410500,410526', 'mainland', '4');
INSERT INTO `region` VALUES ('410527', '410500', '内黄县', ',1,410000,410500,410527', 'mainland', '4');
INSERT INTO `region` VALUES ('410581', '410500', '林州市', ',1,410000,410500,410581', 'mainland', '4');
INSERT INTO `region` VALUES ('410582', '410500', '其它区', ',1,410000,410500,410582', 'mainland', '4');
INSERT INTO `region` VALUES ('410600', '410000', '鹤壁市', ',1,410000,410600', 'mainland', '3');
INSERT INTO `region` VALUES ('410602', '410600', '鹤山区', ',1,410000,410600,410602', 'mainland', '4');
INSERT INTO `region` VALUES ('410603', '410600', '山城区', ',1,410000,410600,410603', 'mainland', '4');
INSERT INTO `region` VALUES ('410611', '410600', '淇滨区', ',1,410000,410600,410611', 'mainland', '4');
INSERT INTO `region` VALUES ('410621', '410600', '浚县', ',1,410000,410600,410621', 'mainland', '4');
INSERT INTO `region` VALUES ('410622', '410600', '淇县', ',1,410000,410600,410622', 'mainland', '4');
INSERT INTO `region` VALUES ('410623', '410600', '其它区', ',1,410000,410600,410623', 'mainland', '4');
INSERT INTO `region` VALUES ('410700', '410000', '新乡市', ',1,410000,410700', 'mainland', '3');
INSERT INTO `region` VALUES ('410702', '410700', '红旗区', ',1,410000,410700,410702', 'mainland', '4');
INSERT INTO `region` VALUES ('410703', '410700', '卫滨区', ',1,410000,410700,410703', 'mainland', '4');
INSERT INTO `region` VALUES ('410704', '410700', '凤泉区', ',1,410000,410700,410704', 'mainland', '4');
INSERT INTO `region` VALUES ('410711', '410700', '牧野区', ',1,410000,410700,410711', 'mainland', '4');
INSERT INTO `region` VALUES ('410721', '410700', '新乡县', ',1,410000,410700,410721', 'mainland', '4');
INSERT INTO `region` VALUES ('410724', '410700', '获嘉县', ',1,410000,410700,410724', 'mainland', '4');
INSERT INTO `region` VALUES ('410725', '410700', '原阳县', ',1,410000,410700,410725', 'mainland', '4');
INSERT INTO `region` VALUES ('410726', '410700', '延津县', ',1,410000,410700,410726', 'mainland', '4');
INSERT INTO `region` VALUES ('410727', '410700', '封丘县', ',1,410000,410700,410727', 'mainland', '4');
INSERT INTO `region` VALUES ('410728', '410700', '长垣县', ',1,410000,410700,410728', 'mainland', '4');
INSERT INTO `region` VALUES ('410781', '410700', '卫辉市', ',1,410000,410700,410781', 'mainland', '4');
INSERT INTO `region` VALUES ('410782', '410700', '辉县市', ',1,410000,410700,410782', 'mainland', '4');
INSERT INTO `region` VALUES ('410783', '410700', '其它区', ',1,410000,410700,410783', 'mainland', '4');
INSERT INTO `region` VALUES ('410800', '410000', '焦作市', ',1,410000,410800', 'mainland', '3');
INSERT INTO `region` VALUES ('410802', '410800', '解放区', ',1,410000,410800,410802', 'mainland', '4');
INSERT INTO `region` VALUES ('410803', '410800', '中站区', ',1,410000,410800,410803', 'mainland', '4');
INSERT INTO `region` VALUES ('410804', '410800', '马村区', ',1,410000,410800,410804', 'mainland', '4');
INSERT INTO `region` VALUES ('410811', '410800', '山阳区', ',1,410000,410800,410811', 'mainland', '4');
INSERT INTO `region` VALUES ('410821', '410800', '修武县', ',1,410000,410800,410821', 'mainland', '4');
INSERT INTO `region` VALUES ('410822', '410800', '博爱县', ',1,410000,410800,410822', 'mainland', '4');
INSERT INTO `region` VALUES ('410823', '410800', '武陟县', ',1,410000,410800,410823', 'mainland', '4');
INSERT INTO `region` VALUES ('410825', '410800', '温县', ',1,410000,410800,410825', 'mainland', '4');
INSERT INTO `region` VALUES ('410881', '410000', '济源市', ',1,410000,410881', 'mainland', '4');
INSERT INTO `region` VALUES ('410882', '410800', '沁阳市', ',1,410000,410800,410882', 'mainland', '4');
INSERT INTO `region` VALUES ('410883', '410800', '孟州市', ',1,410000,410800,410883', 'mainland', '4');
INSERT INTO `region` VALUES ('410884', '410800', '其它区', ',1,410000,410800,410884', 'mainland', '4');
INSERT INTO `region` VALUES ('410900', '410000', '濮阳市', ',1,410000,410900', 'mainland', '3');
INSERT INTO `region` VALUES ('410902', '410900', '华龙区', ',1,410000,410900,410902', 'mainland', '4');
INSERT INTO `region` VALUES ('410922', '410900', '清丰县', ',1,410000,410900,410922', 'mainland', '4');
INSERT INTO `region` VALUES ('410923', '410900', '南乐县', ',1,410000,410900,410923', 'mainland', '4');
INSERT INTO `region` VALUES ('410926', '410900', '范县', ',1,410000,410900,410926', 'mainland', '4');
INSERT INTO `region` VALUES ('410927', '410900', '台前县', ',1,410000,410900,410927', 'mainland', '4');
INSERT INTO `region` VALUES ('410928', '410900', '濮阳县', ',1,410000,410900,410928', 'mainland', '4');
INSERT INTO `region` VALUES ('410929', '410900', '其它区', ',1,410000,410900,410929', 'mainland', '4');
INSERT INTO `region` VALUES ('411000', '410000', '许昌市', ',1,410000,411000', 'mainland', '3');
INSERT INTO `region` VALUES ('411002', '411000', '魏都区', ',1,410000,411000,411002', 'mainland', '4');
INSERT INTO `region` VALUES ('411023', '411000', '许昌县', ',1,410000,411000,411023', 'mainland', '4');
INSERT INTO `region` VALUES ('411024', '411000', '鄢陵县', ',1,410000,411000,411024', 'mainland', '4');
INSERT INTO `region` VALUES ('411025', '411000', '襄城县', ',1,410000,411000,411025', 'mainland', '4');
INSERT INTO `region` VALUES ('411081', '411000', '禹州市', ',1,410000,411000,411081', 'mainland', '4');
INSERT INTO `region` VALUES ('411082', '411000', '长葛市', ',1,410000,411000,411082', 'mainland', '4');
INSERT INTO `region` VALUES ('411083', '411000', '其它区', ',1,410000,411000,411083', 'mainland', '4');
INSERT INTO `region` VALUES ('411100', '410000', '漯河市', ',1,410000,411100', 'mainland', '3');
INSERT INTO `region` VALUES ('411102', '411100', '源汇区', ',1,410000,411100,411102', 'mainland', '4');
INSERT INTO `region` VALUES ('411103', '411100', '郾城区', ',1,410000,411100,411103', 'mainland', '4');
INSERT INTO `region` VALUES ('411104', '411100', '召陵区', ',1,410000,411100,411104', 'mainland', '4');
INSERT INTO `region` VALUES ('411121', '411100', '舞阳县', ',1,410000,411100,411121', 'mainland', '4');
INSERT INTO `region` VALUES ('411122', '411100', '临颍县', ',1,410000,411100,411122', 'mainland', '4');
INSERT INTO `region` VALUES ('411123', '411100', '其它区', ',1,410000,411100,411123', 'mainland', '4');
INSERT INTO `region` VALUES ('411200', '410000', '三门峡市', ',1,410000,411200', 'mainland', '3');
INSERT INTO `region` VALUES ('411202', '411200', '湖滨区', ',1,410000,411200,411202', 'mainland', '4');
INSERT INTO `region` VALUES ('411221', '411200', '渑池县', ',1,410000,411200,411221', 'mainland', '4');
INSERT INTO `region` VALUES ('411222', '411200', '陕县', ',1,410000,411200,411222', 'mainland', '4');
INSERT INTO `region` VALUES ('411224', '411200', '卢氏县', ',1,410000,411200,411224', 'mainland', '4');
INSERT INTO `region` VALUES ('411281', '411200', '义马市', ',1,410000,411200,411281', 'mainland', '4');
INSERT INTO `region` VALUES ('411282', '411200', '灵宝市', ',1,410000,411200,411282', 'mainland', '4');
INSERT INTO `region` VALUES ('411283', '411200', '其它区', ',1,410000,411200,411283', 'mainland', '4');
INSERT INTO `region` VALUES ('411300', '410000', '南阳市', ',1,410000,411300', 'mainland', '3');
INSERT INTO `region` VALUES ('411302', '411300', '宛城区', ',1,410000,411300,411302', 'mainland', '4');
INSERT INTO `region` VALUES ('411303', '411300', '卧龙区', ',1,410000,411300,411303', 'mainland', '4');
INSERT INTO `region` VALUES ('411321', '411300', '南召县', ',1,410000,411300,411321', 'mainland', '4');
INSERT INTO `region` VALUES ('411322', '411300', '方城县', ',1,410000,411300,411322', 'mainland', '4');
INSERT INTO `region` VALUES ('411323', '411300', '西峡县', ',1,410000,411300,411323', 'mainland', '4');
INSERT INTO `region` VALUES ('411324', '411300', '镇平县', ',1,410000,411300,411324', 'mainland', '4');
INSERT INTO `region` VALUES ('411325', '411300', '内乡县', ',1,410000,411300,411325', 'mainland', '4');
INSERT INTO `region` VALUES ('411326', '411300', '淅川县', ',1,410000,411300,411326', 'mainland', '4');
INSERT INTO `region` VALUES ('411327', '411300', '社旗县', ',1,410000,411300,411327', 'mainland', '4');
INSERT INTO `region` VALUES ('411328', '411300', '唐河县', ',1,410000,411300,411328', 'mainland', '4');
INSERT INTO `region` VALUES ('411329', '411300', '新野县', ',1,410000,411300,411329', 'mainland', '4');
INSERT INTO `region` VALUES ('411330', '411300', '桐柏县', ',1,410000,411300,411330', 'mainland', '4');
INSERT INTO `region` VALUES ('411381', '411300', '邓州市', ',1,410000,411300,411381', 'mainland', '4');
INSERT INTO `region` VALUES ('411382', '411300', '其它区', ',1,410000,411300,411382', 'mainland', '4');
INSERT INTO `region` VALUES ('411400', '410000', '商丘市', ',1,410000,411400', 'mainland', '3');
INSERT INTO `region` VALUES ('411402', '411400', '梁园区', ',1,410000,411400,411402', 'mainland', '4');
INSERT INTO `region` VALUES ('411403', '411400', '睢阳区', ',1,410000,411400,411403', 'mainland', '4');
INSERT INTO `region` VALUES ('411421', '411400', '民权县', ',1,410000,411400,411421', 'mainland', '4');
INSERT INTO `region` VALUES ('411422', '411400', '睢县', ',1,410000,411400,411422', 'mainland', '4');
INSERT INTO `region` VALUES ('411423', '411400', '宁陵县', ',1,410000,411400,411423', 'mainland', '4');
INSERT INTO `region` VALUES ('411424', '411400', '柘城县', ',1,410000,411400,411424', 'mainland', '4');
INSERT INTO `region` VALUES ('411425', '411400', '虞城县', ',1,410000,411400,411425', 'mainland', '4');
INSERT INTO `region` VALUES ('411426', '411400', '夏邑县', ',1,410000,411400,411426', 'mainland', '4');
INSERT INTO `region` VALUES ('411481', '411400', '永城市', ',1,410000,411400,411481', 'mainland', '4');
INSERT INTO `region` VALUES ('411482', '411400', '其它区', ',1,410000,411400,411482', 'mainland', '4');
INSERT INTO `region` VALUES ('411500', '410000', '信阳市', ',1,410000,411500', 'mainland', '3');
INSERT INTO `region` VALUES ('411502', '411500', '浉河区', ',1,410000,411500,411502', 'mainland', '4');
INSERT INTO `region` VALUES ('411503', '411500', '平桥区', ',1,410000,411500,411503', 'mainland', '4');
INSERT INTO `region` VALUES ('411521', '411500', '罗山县', ',1,410000,411500,411521', 'mainland', '4');
INSERT INTO `region` VALUES ('411522', '411500', '光山县', ',1,410000,411500,411522', 'mainland', '4');
INSERT INTO `region` VALUES ('411523', '411500', '新县', ',1,410000,411500,411523', 'mainland', '4');
INSERT INTO `region` VALUES ('411524', '411500', '商城县', ',1,410000,411500,411524', 'mainland', '4');
INSERT INTO `region` VALUES ('411525', '411500', '固始县', ',1,410000,411500,411525', 'mainland', '4');
INSERT INTO `region` VALUES ('411526', '411500', '潢川县', ',1,410000,411500,411526', 'mainland', '4');
INSERT INTO `region` VALUES ('411527', '411500', '淮滨县', ',1,410000,411500,411527', 'mainland', '4');
INSERT INTO `region` VALUES ('411528', '411500', '息县', ',1,410000,411500,411528', 'mainland', '4');
INSERT INTO `region` VALUES ('411529', '411500', '其它区', ',1,410000,411500,411529', 'mainland', '4');
INSERT INTO `region` VALUES ('411600', '410000', '周口市', ',1,410000,411600', 'mainland', '3');
INSERT INTO `region` VALUES ('411602', '411600', '川汇区', ',1,410000,411600,411602', 'mainland', '4');
INSERT INTO `region` VALUES ('411621', '411600', '扶沟县', ',1,410000,411600,411621', 'mainland', '4');
INSERT INTO `region` VALUES ('411622', '411600', '西华县', ',1,410000,411600,411622', 'mainland', '4');
INSERT INTO `region` VALUES ('411623', '411600', '商水县', ',1,410000,411600,411623', 'mainland', '4');
INSERT INTO `region` VALUES ('411624', '411600', '沈丘县', ',1,410000,411600,411624', 'mainland', '4');
INSERT INTO `region` VALUES ('411625', '411600', '郸城县', ',1,410000,411600,411625', 'mainland', '4');
INSERT INTO `region` VALUES ('411626', '411600', '淮阳县', ',1,410000,411600,411626', 'mainland', '4');
INSERT INTO `region` VALUES ('411627', '411600', '太康县', ',1,410000,411600,411627', 'mainland', '4');
INSERT INTO `region` VALUES ('411628', '411600', '鹿邑县', ',1,410000,411600,411628', 'mainland', '4');
INSERT INTO `region` VALUES ('411681', '411600', '项城市', ',1,410000,411600,411681', 'mainland', '4');
INSERT INTO `region` VALUES ('411682', '411600', '其它区', ',1,410000,411600,411682', 'mainland', '4');
INSERT INTO `region` VALUES ('411700', '410000', '驻马店市', ',1,410000,411700', 'mainland', '3');
INSERT INTO `region` VALUES ('411702', '411700', '驿城区', ',1,410000,411700,411702', 'mainland', '4');
INSERT INTO `region` VALUES ('411721', '411700', '西平县', ',1,410000,411700,411721', 'mainland', '4');
INSERT INTO `region` VALUES ('411722', '411700', '上蔡县', ',1,410000,411700,411722', 'mainland', '4');
INSERT INTO `region` VALUES ('411723', '411700', '平舆县', ',1,410000,411700,411723', 'mainland', '4');
INSERT INTO `region` VALUES ('411724', '411700', '正阳县', ',1,410000,411700,411724', 'mainland', '4');
INSERT INTO `region` VALUES ('411725', '411700', '确山县', ',1,410000,411700,411725', 'mainland', '4');
INSERT INTO `region` VALUES ('411726', '411700', '泌阳县', ',1,410000,411700,411726', 'mainland', '4');
INSERT INTO `region` VALUES ('411727', '411700', '汝南县', ',1,410000,411700,411727', 'mainland', '4');
INSERT INTO `region` VALUES ('411728', '411700', '遂平县', ',1,410000,411700,411728', 'mainland', '4');
INSERT INTO `region` VALUES ('411729', '411700', '新蔡县', ',1,410000,411700,411729', 'mainland', '4');
INSERT INTO `region` VALUES ('411730', '411700', '其它区', ',1,410000,411700,411730', 'mainland', '4');
INSERT INTO `region` VALUES ('420000', '1', '湖北省', ',1,420000', 'mainland', '2');
INSERT INTO `region` VALUES ('420100', '420000', '武汉市', ',1,420000,420100', 'mainland', '3');
INSERT INTO `region` VALUES ('420102', '420100', '江岸区', ',1,420000,420100,420102', 'mainland', '4');
INSERT INTO `region` VALUES ('420103', '420100', '江汉区', ',1,420000,420100,420103', 'mainland', '4');
INSERT INTO `region` VALUES ('420104', '420100', '硚口区', ',1,420000,420100,420104', 'mainland', '4');
INSERT INTO `region` VALUES ('420105', '420100', '汉阳区', ',1,420000,420100,420105', 'mainland', '4');
INSERT INTO `region` VALUES ('420106', '420100', '武昌区', ',1,420000,420100,420106', 'mainland', '4');
INSERT INTO `region` VALUES ('420107', '420100', '青山区', ',1,420000,420100,420107', 'mainland', '4');
INSERT INTO `region` VALUES ('420111', '420100', '洪山区', ',1,420000,420100,420111', 'mainland', '4');
INSERT INTO `region` VALUES ('420112', '420100', '东西湖区', ',1,420000,420100,420112', 'mainland', '4');
INSERT INTO `region` VALUES ('420113', '420100', '汉南区', ',1,420000,420100,420113', 'mainland', '4');
INSERT INTO `region` VALUES ('420114', '420100', '蔡甸区', ',1,420000,420100,420114', 'mainland', '4');
INSERT INTO `region` VALUES ('420115', '420100', '江夏区', ',1,420000,420100,420115', 'mainland', '4');
INSERT INTO `region` VALUES ('420116', '420100', '黄陂区', ',1,420000,420100,420116', 'mainland', '4');
INSERT INTO `region` VALUES ('420117', '420100', '新洲区', ',1,420000,420100,420117', 'mainland', '4');
INSERT INTO `region` VALUES ('420118', '420100', '其它区', ',1,420000,420100,420118', 'mainland', '4');
INSERT INTO `region` VALUES ('420200', '420000', '黄石市', ',1,420000,420200', 'mainland', '3');
INSERT INTO `region` VALUES ('420202', '420200', '黄石港区', ',1,420000,420200,420202', 'mainland', '4');
INSERT INTO `region` VALUES ('420203', '420200', '西塞山区', ',1,420000,420200,420203', 'mainland', '4');
INSERT INTO `region` VALUES ('420204', '420200', '下陆区', ',1,420000,420200,420204', 'mainland', '4');
INSERT INTO `region` VALUES ('420205', '420200', '铁山区', ',1,420000,420200,420205', 'mainland', '4');
INSERT INTO `region` VALUES ('420222', '420200', '阳新县', ',1,420000,420200,420222', 'mainland', '4');
INSERT INTO `region` VALUES ('420281', '420200', '大冶市', ',1,420000,420200,420281', 'mainland', '4');
INSERT INTO `region` VALUES ('420282', '420200', '其它区', ',1,420000,420200,420282', 'mainland', '4');
INSERT INTO `region` VALUES ('420300', '420000', '十堰市', ',1,420000,420300', 'mainland', '3');
INSERT INTO `region` VALUES ('420302', '420300', '茅箭区', ',1,420000,420300,420302', 'mainland', '4');
INSERT INTO `region` VALUES ('420303', '420300', '张湾区', ',1,420000,420300,420303', 'mainland', '4');
INSERT INTO `region` VALUES ('420321', '420300', '郧县', ',1,420000,420300,420321', 'mainland', '4');
INSERT INTO `region` VALUES ('420322', '420300', '郧西县', ',1,420000,420300,420322', 'mainland', '4');
INSERT INTO `region` VALUES ('420323', '420300', '竹山县', ',1,420000,420300,420323', 'mainland', '4');
INSERT INTO `region` VALUES ('420324', '420300', '竹溪县', ',1,420000,420300,420324', 'mainland', '4');
INSERT INTO `region` VALUES ('420325', '420300', '房县', ',1,420000,420300,420325', 'mainland', '4');
INSERT INTO `region` VALUES ('420381', '420300', '丹江口市', ',1,420000,420300,420381', 'mainland', '4');
INSERT INTO `region` VALUES ('420382', '420300', '城区', ',1,420000,420300,420382', 'mainland', '4');
INSERT INTO `region` VALUES ('420383', '420300', '其它区', ',1,420000,420300,420383', 'mainland', '4');
INSERT INTO `region` VALUES ('420500', '420000', '宜昌市', ',1,420000,420500', 'mainland', '3');
INSERT INTO `region` VALUES ('420502', '420500', '西陵区', ',1,420000,420500,420502', 'mainland', '4');
INSERT INTO `region` VALUES ('420503', '420500', '伍家岗区', ',1,420000,420500,420503', 'mainland', '4');
INSERT INTO `region` VALUES ('420504', '420500', '点军区', ',1,420000,420500,420504', 'mainland', '4');
INSERT INTO `region` VALUES ('420505', '420500', '猇亭区', ',1,420000,420500,420505', 'mainland', '4');
INSERT INTO `region` VALUES ('420506', '420500', '夷陵区', ',1,420000,420500,420506', 'mainland', '4');
INSERT INTO `region` VALUES ('420525', '420500', '远安县', ',1,420000,420500,420525', 'mainland', '4');
INSERT INTO `region` VALUES ('420526', '420500', '兴山县', ',1,420000,420500,420526', 'mainland', '4');
INSERT INTO `region` VALUES ('420527', '420500', '秭归县', ',1,420000,420500,420527', 'mainland', '4');
INSERT INTO `region` VALUES ('420528', '420500', '长阳土家族自治县', ',1,420000,420500,420528', 'mainland', '4');
INSERT INTO `region` VALUES ('420529', '420500', '五峰土家族自治县', ',1,420000,420500,420529', 'mainland', '4');
INSERT INTO `region` VALUES ('420551', '420500', '葛洲坝区', ',1,420000,420500,420551', 'mainland', '4');
INSERT INTO `region` VALUES ('420552', '420500', '开发区', ',1,420000,420500,420552', 'mainland', '4');
INSERT INTO `region` VALUES ('420581', '420500', '宜都市', ',1,420000,420500,420581', 'mainland', '4');
INSERT INTO `region` VALUES ('420582', '420500', '当阳市', ',1,420000,420500,420582', 'mainland', '4');
INSERT INTO `region` VALUES ('420583', '420500', '枝江市', ',1,420000,420500,420583', 'mainland', '4');
INSERT INTO `region` VALUES ('420584', '420500', '其它区', ',1,420000,420500,420584', 'mainland', '4');
INSERT INTO `region` VALUES ('420600', '420000', '襄樊市', ',1,420000,420600', 'mainland', '3');
INSERT INTO `region` VALUES ('420602', '420600', '襄城区', ',1,420000,420600,420602', 'mainland', '4');
INSERT INTO `region` VALUES ('420606', '420600', '樊城区', ',1,420000,420600,420606', 'mainland', '4');
INSERT INTO `region` VALUES ('420607', '420600', '襄阳区', ',1,420000,420600,420607', 'mainland', '4');
INSERT INTO `region` VALUES ('420624', '420600', '南漳县', ',1,420000,420600,420624', 'mainland', '4');
INSERT INTO `region` VALUES ('420625', '420600', '谷城县', ',1,420000,420600,420625', 'mainland', '4');
INSERT INTO `region` VALUES ('420626', '420600', '保康县', ',1,420000,420600,420626', 'mainland', '4');
INSERT INTO `region` VALUES ('420682', '420600', '老河口市', ',1,420000,420600,420682', 'mainland', '4');
INSERT INTO `region` VALUES ('420683', '420600', '枣阳市', ',1,420000,420600,420683', 'mainland', '4');
INSERT INTO `region` VALUES ('420684', '420600', '宜城市', ',1,420000,420600,420684', 'mainland', '4');
INSERT INTO `region` VALUES ('420685', '420600', '其它区', ',1,420000,420600,420685', 'mainland', '4');
INSERT INTO `region` VALUES ('420700', '420000', '鄂州市', ',1,420000,420700', 'mainland', '3');
INSERT INTO `region` VALUES ('420702', '420700', '梁子湖区', ',1,420000,420700,420702', 'mainland', '4');
INSERT INTO `region` VALUES ('420703', '420700', '华容区', ',1,420000,420700,420703', 'mainland', '4');
INSERT INTO `region` VALUES ('420704', '420700', '鄂城区', ',1,420000,420700,420704', 'mainland', '4');
INSERT INTO `region` VALUES ('420705', '420700', '其它区', ',1,420000,420700,420705', 'mainland', '4');
INSERT INTO `region` VALUES ('420800', '420000', '荆门市', ',1,420000,420800', 'mainland', '3');
INSERT INTO `region` VALUES ('420802', '420800', '东宝区', ',1,420000,420800,420802', 'mainland', '4');
INSERT INTO `region` VALUES ('420804', '420800', '掇刀区', ',1,420000,420800,420804', 'mainland', '4');
INSERT INTO `region` VALUES ('420821', '420800', '京山县', ',1,420000,420800,420821', 'mainland', '4');
INSERT INTO `region` VALUES ('420822', '420800', '沙洋县', ',1,420000,420800,420822', 'mainland', '4');
INSERT INTO `region` VALUES ('420881', '420800', '钟祥市', ',1,420000,420800,420881', 'mainland', '4');
INSERT INTO `region` VALUES ('420882', '420800', '其它区', ',1,420000,420800,420882', 'mainland', '4');
INSERT INTO `region` VALUES ('420900', '420000', '孝感市', ',1,420000,420900', 'mainland', '3');
INSERT INTO `region` VALUES ('420902', '420900', '孝南区', ',1,420000,420900,420902', 'mainland', '4');
INSERT INTO `region` VALUES ('420921', '420900', '孝昌县', ',1,420000,420900,420921', 'mainland', '4');
INSERT INTO `region` VALUES ('420922', '420900', '大悟县', ',1,420000,420900,420922', 'mainland', '4');
INSERT INTO `region` VALUES ('420923', '420900', '云梦县', ',1,420000,420900,420923', 'mainland', '4');
INSERT INTO `region` VALUES ('420981', '420900', '应城市', ',1,420000,420900,420981', 'mainland', '4');
INSERT INTO `region` VALUES ('420982', '420900', '安陆市', ',1,420000,420900,420982', 'mainland', '4');
INSERT INTO `region` VALUES ('420984', '420900', '汉川市', ',1,420000,420900,420984', 'mainland', '4');
INSERT INTO `region` VALUES ('420985', '420900', '其它区', ',1,420000,420900,420985', 'mainland', '4');
INSERT INTO `region` VALUES ('421000', '420000', '荆州市', ',1,420000,421000', 'mainland', '3');
INSERT INTO `region` VALUES ('421002', '421000', '沙市区', ',1,420000,421000,421002', 'mainland', '4');
INSERT INTO `region` VALUES ('421003', '421000', '荆州区', ',1,420000,421000,421003', 'mainland', '4');
INSERT INTO `region` VALUES ('421022', '421000', '公安县', ',1,420000,421000,421022', 'mainland', '4');
INSERT INTO `region` VALUES ('421023', '421000', '监利县', ',1,420000,421000,421023', 'mainland', '4');
INSERT INTO `region` VALUES ('421024', '421000', '江陵县', ',1,420000,421000,421024', 'mainland', '4');
INSERT INTO `region` VALUES ('421081', '421000', '石首市', ',1,420000,421000,421081', 'mainland', '4');
INSERT INTO `region` VALUES ('421083', '421000', '洪湖市', ',1,420000,421000,421083', 'mainland', '4');
INSERT INTO `region` VALUES ('421087', '421000', '松滋市', ',1,420000,421000,421087', 'mainland', '4');
INSERT INTO `region` VALUES ('421088', '421000', '其它区', ',1,420000,421000,421088', 'mainland', '4');
INSERT INTO `region` VALUES ('421100', '420000', '黄冈市', ',1,420000,421100', 'mainland', '3');
INSERT INTO `region` VALUES ('421102', '421100', '黄州区', ',1,420000,421100,421102', 'mainland', '4');
INSERT INTO `region` VALUES ('421121', '421100', '团风县', ',1,420000,421100,421121', 'mainland', '4');
INSERT INTO `region` VALUES ('421122', '421100', '红安县', ',1,420000,421100,421122', 'mainland', '4');
INSERT INTO `region` VALUES ('421123', '421100', '罗田县', ',1,420000,421100,421123', 'mainland', '4');
INSERT INTO `region` VALUES ('421124', '421100', '英山县', ',1,420000,421100,421124', 'mainland', '4');
INSERT INTO `region` VALUES ('421125', '421100', '浠水县', ',1,420000,421100,421125', 'mainland', '4');
INSERT INTO `region` VALUES ('421126', '421100', '蕲春县', ',1,420000,421100,421126', 'mainland', '4');
INSERT INTO `region` VALUES ('421127', '421100', '黄梅县', ',1,420000,421100,421127', 'mainland', '4');
INSERT INTO `region` VALUES ('421181', '421100', '麻城市', ',1,420000,421100,421181', 'mainland', '4');
INSERT INTO `region` VALUES ('421182', '421100', '武穴市', ',1,420000,421100,421182', 'mainland', '4');
INSERT INTO `region` VALUES ('421183', '421100', '其它区', ',1,420000,421100,421183', 'mainland', '4');
INSERT INTO `region` VALUES ('421200', '420000', '咸宁市', ',1,420000,421200', 'mainland', '3');
INSERT INTO `region` VALUES ('421202', '421200', '咸安区', ',1,420000,421200,421202', 'mainland', '4');
INSERT INTO `region` VALUES ('421221', '421200', '嘉鱼县', ',1,420000,421200,421221', 'mainland', '4');
INSERT INTO `region` VALUES ('421222', '421200', '通城县', ',1,420000,421200,421222', 'mainland', '4');
INSERT INTO `region` VALUES ('421223', '421200', '崇阳县', ',1,420000,421200,421223', 'mainland', '4');
INSERT INTO `region` VALUES ('421224', '421200', '通山县', ',1,420000,421200,421224', 'mainland', '4');
INSERT INTO `region` VALUES ('421281', '421200', '赤壁市', ',1,420000,421200,421281', 'mainland', '4');
INSERT INTO `region` VALUES ('421282', '421200', '温泉城区', ',1,420000,421200,421282', 'mainland', '4');
INSERT INTO `region` VALUES ('421283', '421200', '其它区', ',1,420000,421200,421283', 'mainland', '4');
INSERT INTO `region` VALUES ('421300', '420000', '随州市', ',1,420000,421300', 'mainland', '3');
INSERT INTO `region` VALUES ('421302', '421300', '曾都区', ',1,420000,421300,421302', 'mainland', '4');
INSERT INTO `region` VALUES ('421381', '421300', '广水市', ',1,420000,421300,421381', 'mainland', '4');
INSERT INTO `region` VALUES ('421382', '421300', '其它区', ',1,420000,421300,421382', 'mainland', '4');
INSERT INTO `region` VALUES ('422800', '420000', '恩施土家族苗族自治州', ',1,420000,422800', 'mainland', '3');
INSERT INTO `region` VALUES ('422801', '422800', '恩施市', ',1,420000,422800,422801', 'mainland', '4');
INSERT INTO `region` VALUES ('422802', '422800', '利川市', ',1,420000,422800,422802', 'mainland', '4');
INSERT INTO `region` VALUES ('422822', '422800', '建始县', ',1,420000,422800,422822', 'mainland', '4');
INSERT INTO `region` VALUES ('422823', '422800', '巴东县', ',1,420000,422800,422823', 'mainland', '4');
INSERT INTO `region` VALUES ('422825', '422800', '宣恩县', ',1,420000,422800,422825', 'mainland', '4');
INSERT INTO `region` VALUES ('422826', '422800', '咸丰县', ',1,420000,422800,422826', 'mainland', '4');
INSERT INTO `region` VALUES ('422827', '422800', '来凤县', ',1,420000,422800,422827', 'mainland', '4');
INSERT INTO `region` VALUES ('422828', '422800', '鹤峰县', ',1,420000,422800,422828', 'mainland', '4');
INSERT INTO `region` VALUES ('422829', '422800', '其它区', ',1,420000,422800,422829', 'mainland', '4');
INSERT INTO `region` VALUES ('429004', '420000', '仙桃市', ',1,420000,429004', 'mainland', '4');
INSERT INTO `region` VALUES ('429005', '420000', '潜江市', ',1,420000,429005', 'mainland', '4');
INSERT INTO `region` VALUES ('429006', '420000', '天门市', ',1,420000,429006', 'mainland', '4');
INSERT INTO `region` VALUES ('429021', '420000', '神农架林区', ',1,420000,429021', 'mainland', '4');
INSERT INTO `region` VALUES ('430000', '1', '湖南省', ',1,430000', 'mainland', '2');
INSERT INTO `region` VALUES ('430100', '430000', '长沙市', ',1,430000,430100', 'mainland', '3');
INSERT INTO `region` VALUES ('430102', '430100', '芙蓉区', ',1,430000,430100,430102', 'mainland', '4');
INSERT INTO `region` VALUES ('430103', '430100', '天心区', ',1,430000,430100,430103', 'mainland', '4');
INSERT INTO `region` VALUES ('430104', '430100', '岳麓区', ',1,430000,430100,430104', 'mainland', '4');
INSERT INTO `region` VALUES ('430105', '430100', '开福区', ',1,430000,430100,430105', 'mainland', '4');
INSERT INTO `region` VALUES ('430111', '430100', '雨花区', ',1,430000,430100,430111', 'mainland', '4');
INSERT INTO `region` VALUES ('430121', '430100', '长沙县', ',1,430000,430100,430121', 'mainland', '4');
INSERT INTO `region` VALUES ('430122', '430100', '望城县', ',1,430000,430100,430122', 'mainland', '4');
INSERT INTO `region` VALUES ('430124', '430100', '宁乡县', ',1,430000,430100,430124', 'mainland', '4');
INSERT INTO `region` VALUES ('430181', '430100', '浏阳市', ',1,430000,430100,430181', 'mainland', '4');
INSERT INTO `region` VALUES ('430182', '430100', '其它区', ',1,430000,430100,430182', 'mainland', '4');
INSERT INTO `region` VALUES ('430200', '430000', '株洲市', ',1,430000,430200', 'mainland', '3');
INSERT INTO `region` VALUES ('430202', '430200', '荷塘区', ',1,430000,430200,430202', 'mainland', '4');
INSERT INTO `region` VALUES ('430203', '430200', '芦淞区', ',1,430000,430200,430203', 'mainland', '4');
INSERT INTO `region` VALUES ('430204', '430200', '石峰区', ',1,430000,430200,430204', 'mainland', '4');
INSERT INTO `region` VALUES ('430211', '430200', '天元区', ',1,430000,430200,430211', 'mainland', '4');
INSERT INTO `region` VALUES ('430221', '430200', '株洲县', ',1,430000,430200,430221', 'mainland', '4');
INSERT INTO `region` VALUES ('430223', '430200', '攸县', ',1,430000,430200,430223', 'mainland', '4');
INSERT INTO `region` VALUES ('430224', '430200', '茶陵县', ',1,430000,430200,430224', 'mainland', '4');
INSERT INTO `region` VALUES ('430225', '430200', '炎陵县', ',1,430000,430200,430225', 'mainland', '4');
INSERT INTO `region` VALUES ('430281', '430200', '醴陵市', ',1,430000,430200,430281', 'mainland', '4');
INSERT INTO `region` VALUES ('430282', '430200', '其它区', ',1,430000,430200,430282', 'mainland', '4');
INSERT INTO `region` VALUES ('430300', '430000', '湘潭市', ',1,430000,430300', 'mainland', '3');
INSERT INTO `region` VALUES ('430302', '430300', '雨湖区', ',1,430000,430300,430302', 'mainland', '4');
INSERT INTO `region` VALUES ('430304', '430300', '岳塘区', ',1,430000,430300,430304', 'mainland', '4');
INSERT INTO `region` VALUES ('430321', '430300', '湘潭县', ',1,430000,430300,430321', 'mainland', '4');
INSERT INTO `region` VALUES ('430381', '430300', '湘乡市', ',1,430000,430300,430381', 'mainland', '4');
INSERT INTO `region` VALUES ('430382', '430300', '韶山市', ',1,430000,430300,430382', 'mainland', '4');
INSERT INTO `region` VALUES ('430383', '430300', '其它区', ',1,430000,430300,430383', 'mainland', '4');
INSERT INTO `region` VALUES ('430400', '430000', '衡阳市', ',1,430000,430400', 'mainland', '3');
INSERT INTO `region` VALUES ('430405', '430400', '珠晖区', ',1,430000,430400,430405', 'mainland', '4');
INSERT INTO `region` VALUES ('430406', '430400', '雁峰区', ',1,430000,430400,430406', 'mainland', '4');
INSERT INTO `region` VALUES ('430407', '430400', '石鼓区', ',1,430000,430400,430407', 'mainland', '4');
INSERT INTO `region` VALUES ('430408', '430400', '蒸湘区', ',1,430000,430400,430408', 'mainland', '4');
INSERT INTO `region` VALUES ('430412', '430400', '南岳区', ',1,430000,430400,430412', 'mainland', '4');
INSERT INTO `region` VALUES ('430421', '430400', '衡阳县', ',1,430000,430400,430421', 'mainland', '4');
INSERT INTO `region` VALUES ('430422', '430400', '衡南县', ',1,430000,430400,430422', 'mainland', '4');
INSERT INTO `region` VALUES ('430423', '430400', '衡山县', ',1,430000,430400,430423', 'mainland', '4');
INSERT INTO `region` VALUES ('430424', '430400', '衡东县', ',1,430000,430400,430424', 'mainland', '4');
INSERT INTO `region` VALUES ('430426', '430400', '祁东县', ',1,430000,430400,430426', 'mainland', '4');
INSERT INTO `region` VALUES ('430481', '430400', '耒阳市', ',1,430000,430400,430481', 'mainland', '4');
INSERT INTO `region` VALUES ('430482', '430400', '常宁市', ',1,430000,430400,430482', 'mainland', '4');
INSERT INTO `region` VALUES ('430483', '430400', '其它区', ',1,430000,430400,430483', 'mainland', '4');
INSERT INTO `region` VALUES ('430500', '430000', '邵阳市', ',1,430000,430500', 'mainland', '3');
INSERT INTO `region` VALUES ('430502', '430500', '双清区', ',1,430000,430500,430502', 'mainland', '4');
INSERT INTO `region` VALUES ('430503', '430500', '大祥区', ',1,430000,430500,430503', 'mainland', '4');
INSERT INTO `region` VALUES ('430511', '430500', '北塔区', ',1,430000,430500,430511', 'mainland', '4');
INSERT INTO `region` VALUES ('430521', '430500', '邵东县', ',1,430000,430500,430521', 'mainland', '4');
INSERT INTO `region` VALUES ('430522', '430500', '新邵县', ',1,430000,430500,430522', 'mainland', '4');
INSERT INTO `region` VALUES ('430523', '430500', '邵阳县', ',1,430000,430500,430523', 'mainland', '4');
INSERT INTO `region` VALUES ('430524', '430500', '隆回县', ',1,430000,430500,430524', 'mainland', '4');
INSERT INTO `region` VALUES ('430525', '430500', '洞口县', ',1,430000,430500,430525', 'mainland', '4');
INSERT INTO `region` VALUES ('430527', '430500', '绥宁县', ',1,430000,430500,430527', 'mainland', '4');
INSERT INTO `region` VALUES ('430528', '430500', '新宁县', ',1,430000,430500,430528', 'mainland', '4');
INSERT INTO `region` VALUES ('430529', '430500', '城步苗族自治县', ',1,430000,430500,430529', 'mainland', '4');
INSERT INTO `region` VALUES ('430581', '430500', '武冈市', ',1,430000,430500,430581', 'mainland', '4');
INSERT INTO `region` VALUES ('430582', '430500', '其它区', ',1,430000,430500,430582', 'mainland', '4');
INSERT INTO `region` VALUES ('430600', '430000', '岳阳市', ',1,430000,430600', 'mainland', '3');
INSERT INTO `region` VALUES ('430602', '430600', '岳阳楼区', ',1,430000,430600,430602', 'mainland', '4');
INSERT INTO `region` VALUES ('430603', '430600', '云溪区', ',1,430000,430600,430603', 'mainland', '4');
INSERT INTO `region` VALUES ('430611', '430600', '君山区', ',1,430000,430600,430611', 'mainland', '4');
INSERT INTO `region` VALUES ('430621', '430600', '岳阳县', ',1,430000,430600,430621', 'mainland', '4');
INSERT INTO `region` VALUES ('430623', '430600', '华容县', ',1,430000,430600,430623', 'mainland', '4');
INSERT INTO `region` VALUES ('430624', '430600', '湘阴县', ',1,430000,430600,430624', 'mainland', '4');
INSERT INTO `region` VALUES ('430626', '430600', '平江县', ',1,430000,430600,430626', 'mainland', '4');
INSERT INTO `region` VALUES ('430681', '430600', '汨罗市', ',1,430000,430600,430681', 'mainland', '4');
INSERT INTO `region` VALUES ('430682', '430600', '临湘市', ',1,430000,430600,430682', 'mainland', '4');
INSERT INTO `region` VALUES ('430683', '430600', '其它区', ',1,430000,430600,430683', 'mainland', '4');
INSERT INTO `region` VALUES ('430700', '430000', '常德市', ',1,430000,430700', 'mainland', '3');
INSERT INTO `region` VALUES ('430702', '430700', '武陵区', ',1,430000,430700,430702', 'mainland', '4');
INSERT INTO `region` VALUES ('430703', '430700', '鼎城区', ',1,430000,430700,430703', 'mainland', '4');
INSERT INTO `region` VALUES ('430721', '430700', '安乡县', ',1,430000,430700,430721', 'mainland', '4');
INSERT INTO `region` VALUES ('430722', '430700', '汉寿县', ',1,430000,430700,430722', 'mainland', '4');
INSERT INTO `region` VALUES ('430723', '430700', '澧县', ',1,430000,430700,430723', 'mainland', '4');
INSERT INTO `region` VALUES ('430724', '430700', '临澧县', ',1,430000,430700,430724', 'mainland', '4');
INSERT INTO `region` VALUES ('430725', '430700', '桃源县', ',1,430000,430700,430725', 'mainland', '4');
INSERT INTO `region` VALUES ('430726', '430700', '石门县', ',1,430000,430700,430726', 'mainland', '4');
INSERT INTO `region` VALUES ('430781', '430700', '津市市', ',1,430000,430700,430781', 'mainland', '4');
INSERT INTO `region` VALUES ('430782', '430700', '其它区', ',1,430000,430700,430782', 'mainland', '4');
INSERT INTO `region` VALUES ('430800', '430000', '张家界市', ',1,430000,430800', 'mainland', '3');
INSERT INTO `region` VALUES ('430802', '430800', '永定区', ',1,430000,430800,430802', 'mainland', '4');
INSERT INTO `region` VALUES ('430811', '430800', '武陵源区', ',1,430000,430800,430811', 'mainland', '4');
INSERT INTO `region` VALUES ('430821', '430800', '慈利县', ',1,430000,430800,430821', 'mainland', '4');
INSERT INTO `region` VALUES ('430822', '430800', '桑植县', ',1,430000,430800,430822', 'mainland', '4');
INSERT INTO `region` VALUES ('430823', '430800', '其它区', ',1,430000,430800,430823', 'mainland', '4');
INSERT INTO `region` VALUES ('430900', '430000', '益阳市', ',1,430000,430900', 'mainland', '3');
INSERT INTO `region` VALUES ('430902', '430900', '资阳区', ',1,430000,430900,430902', 'mainland', '4');
INSERT INTO `region` VALUES ('430903', '430900', '赫山区', ',1,430000,430900,430903', 'mainland', '4');
INSERT INTO `region` VALUES ('430921', '430900', '南县', ',1,430000,430900,430921', 'mainland', '4');
INSERT INTO `region` VALUES ('430922', '430900', '桃江县', ',1,430000,430900,430922', 'mainland', '4');
INSERT INTO `region` VALUES ('430923', '430900', '安化县', ',1,430000,430900,430923', 'mainland', '4');
INSERT INTO `region` VALUES ('430981', '430900', '沅江市', ',1,430000,430900,430981', 'mainland', '4');
INSERT INTO `region` VALUES ('430982', '430900', '其它区', ',1,430000,430900,430982', 'mainland', '4');
INSERT INTO `region` VALUES ('431000', '430000', '郴州市', ',1,430000,431000', 'mainland', '3');
INSERT INTO `region` VALUES ('431002', '431000', '北湖区', ',1,430000,431000,431002', 'mainland', '4');
INSERT INTO `region` VALUES ('431003', '431000', '苏仙区', ',1,430000,431000,431003', 'mainland', '4');
INSERT INTO `region` VALUES ('431021', '431000', '桂阳县', ',1,430000,431000,431021', 'mainland', '4');
INSERT INTO `region` VALUES ('431022', '431000', '宜章县', ',1,430000,431000,431022', 'mainland', '4');
INSERT INTO `region` VALUES ('431023', '431000', '永兴县', ',1,430000,431000,431023', 'mainland', '4');
INSERT INTO `region` VALUES ('431024', '431000', '嘉禾县', ',1,430000,431000,431024', 'mainland', '4');
INSERT INTO `region` VALUES ('431025', '431000', '临武县', ',1,430000,431000,431025', 'mainland', '4');
INSERT INTO `region` VALUES ('431026', '431000', '汝城县', ',1,430000,431000,431026', 'mainland', '4');
INSERT INTO `region` VALUES ('431027', '431000', '桂东县', ',1,430000,431000,431027', 'mainland', '4');
INSERT INTO `region` VALUES ('431028', '431000', '安仁县', ',1,430000,431000,431028', 'mainland', '4');
INSERT INTO `region` VALUES ('431081', '431000', '资兴市', ',1,430000,431000,431081', 'mainland', '4');
INSERT INTO `region` VALUES ('431082', '431000', '其它区', ',1,430000,431000,431082', 'mainland', '4');
INSERT INTO `region` VALUES ('431100', '430000', '永州市', ',1,430000,431100', 'mainland', '3');
INSERT INTO `region` VALUES ('431102', '431100', '零陵区', ',1,430000,431100,431102', 'mainland', '4');
INSERT INTO `region` VALUES ('431103', '431100', '冷水滩区', ',1,430000,431100,431103', 'mainland', '4');
INSERT INTO `region` VALUES ('431121', '431100', '祁阳县', ',1,430000,431100,431121', 'mainland', '4');
INSERT INTO `region` VALUES ('431122', '431100', '东安县', ',1,430000,431100,431122', 'mainland', '4');
INSERT INTO `region` VALUES ('431123', '431100', '双牌县', ',1,430000,431100,431123', 'mainland', '4');
INSERT INTO `region` VALUES ('431124', '431100', '道县', ',1,430000,431100,431124', 'mainland', '4');
INSERT INTO `region` VALUES ('431125', '431100', '江永县', ',1,430000,431100,431125', 'mainland', '4');
INSERT INTO `region` VALUES ('431126', '431100', '宁远县', ',1,430000,431100,431126', 'mainland', '4');
INSERT INTO `region` VALUES ('431127', '431100', '蓝山县', ',1,430000,431100,431127', 'mainland', '4');
INSERT INTO `region` VALUES ('431128', '431100', '新田县', ',1,430000,431100,431128', 'mainland', '4');
INSERT INTO `region` VALUES ('431129', '431100', '江华瑶族自治县', ',1,430000,431100,431129', 'mainland', '4');
INSERT INTO `region` VALUES ('431130', '431100', '其它区', ',1,430000,431100,431130', 'mainland', '4');
INSERT INTO `region` VALUES ('431200', '430000', '怀化市', ',1,430000,431200', 'mainland', '3');
INSERT INTO `region` VALUES ('431202', '431200', '鹤城区', ',1,430000,431200,431202', 'mainland', '4');
INSERT INTO `region` VALUES ('431221', '431200', '中方县', ',1,430000,431200,431221', 'mainland', '4');
INSERT INTO `region` VALUES ('431222', '431200', '沅陵县', ',1,430000,431200,431222', 'mainland', '4');
INSERT INTO `region` VALUES ('431223', '431200', '辰溪县', ',1,430000,431200,431223', 'mainland', '4');
INSERT INTO `region` VALUES ('431224', '431200', '溆浦县', ',1,430000,431200,431224', 'mainland', '4');
INSERT INTO `region` VALUES ('431225', '431200', '会同县', ',1,430000,431200,431225', 'mainland', '4');
INSERT INTO `region` VALUES ('431226', '431200', '麻阳苗族自治县', ',1,430000,431200,431226', 'mainland', '4');
INSERT INTO `region` VALUES ('431227', '431200', '新晃侗族自治县', ',1,430000,431200,431227', 'mainland', '4');
INSERT INTO `region` VALUES ('431228', '431200', '芷江侗族自治县', ',1,430000,431200,431228', 'mainland', '4');
INSERT INTO `region` VALUES ('431229', '431200', '靖州苗族侗族自治县', ',1,430000,431200,431229', 'mainland', '4');
INSERT INTO `region` VALUES ('431230', '431200', '通道侗族自治县', ',1,430000,431200,431230', 'mainland', '4');
INSERT INTO `region` VALUES ('431281', '431200', '洪江市', ',1,430000,431200,431281', 'mainland', '4');
INSERT INTO `region` VALUES ('431282', '431200', '其它区', ',1,430000,431200,431282', 'mainland', '4');
INSERT INTO `region` VALUES ('431300', '430000', '娄底市', ',1,430000,431300', 'mainland', '3');
INSERT INTO `region` VALUES ('431302', '431300', '娄星区', ',1,430000,431300,431302', 'mainland', '4');
INSERT INTO `region` VALUES ('431321', '431300', '双峰县', ',1,430000,431300,431321', 'mainland', '4');
INSERT INTO `region` VALUES ('431322', '431300', '新化县', ',1,430000,431300,431322', 'mainland', '4');
INSERT INTO `region` VALUES ('431381', '431300', '冷水江市', ',1,430000,431300,431381', 'mainland', '4');
INSERT INTO `region` VALUES ('431382', '431300', '涟源市', ',1,430000,431300,431382', 'mainland', '4');
INSERT INTO `region` VALUES ('431383', '431300', '其它区', ',1,430000,431300,431383', 'mainland', '4');
INSERT INTO `region` VALUES ('433100', '430000', '湘西土家族苗族自治州', ',1,430000,433100', 'mainland', '3');
INSERT INTO `region` VALUES ('433101', '433100', '吉首市', ',1,430000,433100,433101', 'mainland', '4');
INSERT INTO `region` VALUES ('433122', '433100', '泸溪县', ',1,430000,433100,433122', 'mainland', '4');
INSERT INTO `region` VALUES ('433123', '433100', '凤凰县', ',1,430000,433100,433123', 'mainland', '4');
INSERT INTO `region` VALUES ('433124', '433100', '花垣县', ',1,430000,433100,433124', 'mainland', '4');
INSERT INTO `region` VALUES ('433125', '433100', '保靖县', ',1,430000,433100,433125', 'mainland', '4');
INSERT INTO `region` VALUES ('433126', '433100', '古丈县', ',1,430000,433100,433126', 'mainland', '4');
INSERT INTO `region` VALUES ('433127', '433100', '永顺县', ',1,430000,433100,433127', 'mainland', '4');
INSERT INTO `region` VALUES ('433130', '433100', '龙山县', ',1,430000,433100,433130', 'mainland', '4');
INSERT INTO `region` VALUES ('433131', '433100', '其它区', ',1,430000,433100,433131', 'mainland', '4');
INSERT INTO `region` VALUES ('440000', '1', '广东省', ',1,440000', 'mainland', '2');
INSERT INTO `region` VALUES ('440100', '440000', '广州市', ',1,440000,440100', 'mainland', '3');
INSERT INTO `region` VALUES ('440103', '440100', '荔湾区', ',1,440000,440100,440103', 'mainland', '4');
INSERT INTO `region` VALUES ('440104', '440100', '越秀区', ',1,440000,440100,440104', 'mainland', '4');
INSERT INTO `region` VALUES ('440105', '440100', '海珠区', ',1,440000,440100,440105', 'mainland', '4');
INSERT INTO `region` VALUES ('440106', '440100', '天河区', ',1,440000,440100,440106', 'mainland', '4');
INSERT INTO `region` VALUES ('440111', '440100', '白云区', ',1,440000,440100,440111', 'mainland', '4');
INSERT INTO `region` VALUES ('440112', '440100', '黄埔区', ',1,440000,440100,440112', 'mainland', '4');
INSERT INTO `region` VALUES ('440113', '440100', '番禺区', ',1,440000,440100,440113', 'mainland', '4');
INSERT INTO `region` VALUES ('440114', '440100', '花都区', ',1,440000,440100,440114', 'mainland', '4');
INSERT INTO `region` VALUES ('440115', '440100', '南沙区', ',1,440000,440100,440115', 'mainland', '4');
INSERT INTO `region` VALUES ('440116', '440100', '萝岗区', ',1,440000,440100,440116', 'mainland', '4');
INSERT INTO `region` VALUES ('440183', '440100', '增城市', ',1,440000,440100,440183', 'mainland', '4');
INSERT INTO `region` VALUES ('440184', '440100', '从化市', ',1,440000,440100,440184', 'mainland', '4');
INSERT INTO `region` VALUES ('440188', '440100', '东山区', ',1,440000,440100,440188', 'mainland', '4');
INSERT INTO `region` VALUES ('440189', '440100', '其它区', ',1,440000,440100,440189', 'mainland', '4');
INSERT INTO `region` VALUES ('440200', '440000', '韶关市', ',1,440000,440200', 'mainland', '3');
INSERT INTO `region` VALUES ('440203', '440200', '武江区', ',1,440000,440200,440203', 'mainland', '4');
INSERT INTO `region` VALUES ('440204', '440200', '浈江区', ',1,440000,440200,440204', 'mainland', '4');
INSERT INTO `region` VALUES ('440205', '440200', '曲江区', ',1,440000,440200,440205', 'mainland', '4');
INSERT INTO `region` VALUES ('440222', '440200', '始兴县', ',1,440000,440200,440222', 'mainland', '4');
INSERT INTO `region` VALUES ('440224', '440200', '仁化县', ',1,440000,440200,440224', 'mainland', '4');
INSERT INTO `region` VALUES ('440229', '440200', '翁源县', ',1,440000,440200,440229', 'mainland', '4');
INSERT INTO `region` VALUES ('440232', '440200', '乳源瑶族自治县', ',1,440000,440200,440232', 'mainland', '4');
INSERT INTO `region` VALUES ('440233', '440200', '新丰县', ',1,440000,440200,440233', 'mainland', '4');
INSERT INTO `region` VALUES ('440281', '440200', '乐昌市', ',1,440000,440200,440281', 'mainland', '4');
INSERT INTO `region` VALUES ('440282', '440200', '南雄市', ',1,440000,440200,440282', 'mainland', '4');
INSERT INTO `region` VALUES ('440283', '440200', '其它区', ',1,440000,440200,440283', 'mainland', '4');
INSERT INTO `region` VALUES ('440300', '440000', '深圳市', ',1,440000,440300', 'mainland', '3');
INSERT INTO `region` VALUES ('440303', '440300', '罗湖区', ',1,440000,440300,440303', 'mainland', '4');
INSERT INTO `region` VALUES ('440304', '440300', '福田区', ',1,440000,440300,440304', 'mainland', '4');
INSERT INTO `region` VALUES ('440305', '440300', '南山区', ',1,440000,440300,440305', 'mainland', '4');
INSERT INTO `region` VALUES ('440306', '440300', '宝安区', ',1,440000,440300,440306', 'mainland', '4');
INSERT INTO `region` VALUES ('440307', '440300', '龙岗区', ',1,440000,440300,440307', 'mainland', '4');
INSERT INTO `region` VALUES ('440308', '440300', '盐田区', ',1,440000,440300,440308', 'mainland', '4');
INSERT INTO `region` VALUES ('440309', '440300', '其它区', ',1,440000,440300,440309', 'mainland', '4');
INSERT INTO `region` VALUES ('440400', '440000', '珠海市', ',1,440000,440400', 'mainland', '3');
INSERT INTO `region` VALUES ('440402', '440400', '香洲区', ',1,440000,440400,440402', 'mainland', '4');
INSERT INTO `region` VALUES ('440403', '440400', '斗门区', ',1,440000,440400,440403', 'mainland', '4');
INSERT INTO `region` VALUES ('440404', '440400', '金湾区', ',1,440000,440400,440404', 'mainland', '4');
INSERT INTO `region` VALUES ('440486', '440400', '金唐区', ',1,440000,440400,440486', 'mainland', '4');
INSERT INTO `region` VALUES ('440487', '440400', '南湾区', ',1,440000,440400,440487', 'mainland', '4');
INSERT INTO `region` VALUES ('440488', '440400', '其它区', ',1,440000,440400,440488', 'mainland', '4');
INSERT INTO `region` VALUES ('440500', '440000', '汕头市', ',1,440000,440500', 'mainland', '3');
INSERT INTO `region` VALUES ('440507', '440500', '龙湖区', ',1,440000,440500,440507', 'mainland', '4');
INSERT INTO `region` VALUES ('440511', '440500', '金平区', ',1,440000,440500,440511', 'mainland', '4');
INSERT INTO `region` VALUES ('440512', '440500', '濠江区', ',1,440000,440500,440512', 'mainland', '4');
INSERT INTO `region` VALUES ('440513', '440500', '潮阳区', ',1,440000,440500,440513', 'mainland', '4');
INSERT INTO `region` VALUES ('440514', '440500', '潮南区', ',1,440000,440500,440514', 'mainland', '4');
INSERT INTO `region` VALUES ('440515', '440500', '澄海区', ',1,440000,440500,440515', 'mainland', '4');
INSERT INTO `region` VALUES ('440523', '440500', '南澳县', ',1,440000,440500,440523', 'mainland', '4');
INSERT INTO `region` VALUES ('440524', '440500', '其它区', ',1,440000,440500,440524', 'mainland', '4');
INSERT INTO `region` VALUES ('440600', '440000', '佛山市', ',1,440000,440600', 'mainland', '3');
INSERT INTO `region` VALUES ('440604', '440600', '禅城区', ',1,440000,440600,440604', 'mainland', '4');
INSERT INTO `region` VALUES ('440605', '440600', '南海区', ',1,440000,440600,440605', 'mainland', '4');
INSERT INTO `region` VALUES ('440606', '440600', '顺德区', ',1,440000,440600,440606', 'mainland', '4');
INSERT INTO `region` VALUES ('440607', '440600', '三水区', ',1,440000,440600,440607', 'mainland', '4');
INSERT INTO `region` VALUES ('440608', '440600', '高明区', ',1,440000,440600,440608', 'mainland', '4');
INSERT INTO `region` VALUES ('440609', '440600', '其它区', ',1,440000,440600,440609', 'mainland', '4');
INSERT INTO `region` VALUES ('440700', '440000', '江门市', ',1,440000,440700', 'mainland', '3');
INSERT INTO `region` VALUES ('440703', '440700', '蓬江区', ',1,440000,440700,440703', 'mainland', '4');
INSERT INTO `region` VALUES ('440704', '440700', '江海区', ',1,440000,440700,440704', 'mainland', '4');
INSERT INTO `region` VALUES ('440705', '440700', '新会区', ',1,440000,440700,440705', 'mainland', '4');
INSERT INTO `region` VALUES ('440781', '440700', '台山市', ',1,440000,440700,440781', 'mainland', '4');
INSERT INTO `region` VALUES ('440783', '440700', '开平市', ',1,440000,440700,440783', 'mainland', '4');
INSERT INTO `region` VALUES ('440784', '440700', '鹤山市', ',1,440000,440700,440784', 'mainland', '4');
INSERT INTO `region` VALUES ('440785', '440700', '恩平市', ',1,440000,440700,440785', 'mainland', '4');
INSERT INTO `region` VALUES ('440786', '440700', '其它区', ',1,440000,440700,440786', 'mainland', '4');
INSERT INTO `region` VALUES ('440800', '440000', '湛江市', ',1,440000,440800', 'mainland', '3');
INSERT INTO `region` VALUES ('440802', '440800', '赤坎区', ',1,440000,440800,440802', 'mainland', '4');
INSERT INTO `region` VALUES ('440803', '440800', '霞山区', ',1,440000,440800,440803', 'mainland', '4');
INSERT INTO `region` VALUES ('440804', '440800', '坡头区', ',1,440000,440800,440804', 'mainland', '4');
INSERT INTO `region` VALUES ('440811', '440800', '麻章区', ',1,440000,440800,440811', 'mainland', '4');
INSERT INTO `region` VALUES ('440823', '440800', '遂溪县', ',1,440000,440800,440823', 'mainland', '4');
INSERT INTO `region` VALUES ('440825', '440800', '徐闻县', ',1,440000,440800,440825', 'mainland', '4');
INSERT INTO `region` VALUES ('440881', '440800', '廉江市', ',1,440000,440800,440881', 'mainland', '4');
INSERT INTO `region` VALUES ('440882', '440800', '雷州市', ',1,440000,440800,440882', 'mainland', '4');
INSERT INTO `region` VALUES ('440883', '440800', '吴川市', ',1,440000,440800,440883', 'mainland', '4');
INSERT INTO `region` VALUES ('440884', '440800', '其它区', ',1,440000,440800,440884', 'mainland', '4');
INSERT INTO `region` VALUES ('440900', '440000', '茂名市', ',1,440000,440900', 'mainland', '3');
INSERT INTO `region` VALUES ('440902', '440900', '茂南区', ',1,440000,440900,440902', 'mainland', '4');
INSERT INTO `region` VALUES ('440903', '440900', '茂港区', ',1,440000,440900,440903', 'mainland', '4');
INSERT INTO `region` VALUES ('440923', '440900', '电白县', ',1,440000,440900,440923', 'mainland', '4');
INSERT INTO `region` VALUES ('440981', '440900', '高州市', ',1,440000,440900,440981', 'mainland', '4');
INSERT INTO `region` VALUES ('440982', '440900', '化州市', ',1,440000,440900,440982', 'mainland', '4');
INSERT INTO `region` VALUES ('440983', '440900', '信宜市', ',1,440000,440900,440983', 'mainland', '4');
INSERT INTO `region` VALUES ('440984', '440900', '其它区', ',1,440000,440900,440984', 'mainland', '4');
INSERT INTO `region` VALUES ('441200', '440000', '肇庆市', ',1,440000,441200', 'mainland', '3');
INSERT INTO `region` VALUES ('441202', '441200', '端州区', ',1,440000,441200,441202', 'mainland', '4');
INSERT INTO `region` VALUES ('441203', '441200', '鼎湖区', ',1,440000,441200,441203', 'mainland', '4');
INSERT INTO `region` VALUES ('441223', '441200', '广宁县', ',1,440000,441200,441223', 'mainland', '4');
INSERT INTO `region` VALUES ('441224', '441200', '怀集县', ',1,440000,441200,441224', 'mainland', '4');
INSERT INTO `region` VALUES ('441225', '441200', '封开县', ',1,440000,441200,441225', 'mainland', '4');
INSERT INTO `region` VALUES ('441226', '441200', '德庆县', ',1,440000,441200,441226', 'mainland', '4');
INSERT INTO `region` VALUES ('441283', '441200', '高要市', ',1,440000,441200,441283', 'mainland', '4');
INSERT INTO `region` VALUES ('441284', '441200', '四会市', ',1,440000,441200,441284', 'mainland', '4');
INSERT INTO `region` VALUES ('441285', '441200', '其它区', ',1,440000,441200,441285', 'mainland', '4');
INSERT INTO `region` VALUES ('441300', '440000', '惠州市', ',1,440000,441300', 'mainland', '3');
INSERT INTO `region` VALUES ('441302', '441300', '惠城区', ',1,440000,441300,441302', 'mainland', '4');
INSERT INTO `region` VALUES ('441303', '441300', '惠阳区', ',1,440000,441300,441303', 'mainland', '4');
INSERT INTO `region` VALUES ('441322', '441300', '博罗县', ',1,440000,441300,441322', 'mainland', '4');
INSERT INTO `region` VALUES ('441323', '441300', '惠东县', ',1,440000,441300,441323', 'mainland', '4');
INSERT INTO `region` VALUES ('441324', '441300', '龙门县', ',1,440000,441300,441324', 'mainland', '4');
INSERT INTO `region` VALUES ('441325', '441300', '其它区', ',1,440000,441300,441325', 'mainland', '4');
INSERT INTO `region` VALUES ('441400', '440000', '梅州市', ',1,440000,441400', 'mainland', '3');
INSERT INTO `region` VALUES ('441402', '441400', '梅江区', ',1,440000,441400,441402', 'mainland', '4');
INSERT INTO `region` VALUES ('441421', '441400', '梅县', ',1,440000,441400,441421', 'mainland', '4');
INSERT INTO `region` VALUES ('441422', '441400', '大埔县', ',1,440000,441400,441422', 'mainland', '4');
INSERT INTO `region` VALUES ('441423', '441400', '丰顺县', ',1,440000,441400,441423', 'mainland', '4');
INSERT INTO `region` VALUES ('441424', '441400', '五华县', ',1,440000,441400,441424', 'mainland', '4');
INSERT INTO `region` VALUES ('441426', '441400', '平远县', ',1,440000,441400,441426', 'mainland', '4');
INSERT INTO `region` VALUES ('441427', '441400', '蕉岭县', ',1,440000,441400,441427', 'mainland', '4');
INSERT INTO `region` VALUES ('441481', '441400', '兴宁市', ',1,440000,441400,441481', 'mainland', '4');
INSERT INTO `region` VALUES ('441482', '441400', '其它区', ',1,440000,441400,441482', 'mainland', '4');
INSERT INTO `region` VALUES ('441500', '440000', '汕尾市', ',1,440000,441500', 'mainland', '3');
INSERT INTO `region` VALUES ('441502', '441500', '城区', ',1,440000,441500,441502', 'mainland', '4');
INSERT INTO `region` VALUES ('441521', '441500', '海丰县', ',1,440000,441500,441521', 'mainland', '4');
INSERT INTO `region` VALUES ('441523', '441500', '陆河县', ',1,440000,441500,441523', 'mainland', '4');
INSERT INTO `region` VALUES ('441581', '441500', '陆丰市', ',1,440000,441500,441581', 'mainland', '4');
INSERT INTO `region` VALUES ('441582', '441500', '其它区', ',1,440000,441500,441582', 'mainland', '4');
INSERT INTO `region` VALUES ('441600', '440000', '河源市', ',1,440000,441600', 'mainland', '3');
INSERT INTO `region` VALUES ('441602', '441600', '源城区', ',1,440000,441600,441602', 'mainland', '4');
INSERT INTO `region` VALUES ('441621', '441600', '紫金县', ',1,440000,441600,441621', 'mainland', '4');
INSERT INTO `region` VALUES ('441622', '441600', '龙川县', ',1,440000,441600,441622', 'mainland', '4');
INSERT INTO `region` VALUES ('441623', '441600', '连平县', ',1,440000,441600,441623', 'mainland', '4');
INSERT INTO `region` VALUES ('441624', '441600', '和平县', ',1,440000,441600,441624', 'mainland', '4');
INSERT INTO `region` VALUES ('441625', '441600', '东源县', ',1,440000,441600,441625', 'mainland', '4');
INSERT INTO `region` VALUES ('441626', '441600', '其它区', ',1,440000,441600,441626', 'mainland', '4');
INSERT INTO `region` VALUES ('441700', '440000', '阳江市', ',1,440000,441700', 'mainland', '3');
INSERT INTO `region` VALUES ('441702', '441700', '江城区', ',1,440000,441700,441702', 'mainland', '4');
INSERT INTO `region` VALUES ('441721', '441700', '阳西县', ',1,440000,441700,441721', 'mainland', '4');
INSERT INTO `region` VALUES ('441723', '441700', '阳东县', ',1,440000,441700,441723', 'mainland', '4');
INSERT INTO `region` VALUES ('441781', '441700', '阳春市', ',1,440000,441700,441781', 'mainland', '4');
INSERT INTO `region` VALUES ('441782', '441700', '其它区', ',1,440000,441700,441782', 'mainland', '4');
INSERT INTO `region` VALUES ('441800', '440000', '清远市', ',1,440000,441800', 'mainland', '3');
INSERT INTO `region` VALUES ('441802', '441800', '清城区', ',1,440000,441800,441802', 'mainland', '4');
INSERT INTO `region` VALUES ('441821', '441800', '佛冈县', ',1,440000,441800,441821', 'mainland', '4');
INSERT INTO `region` VALUES ('441823', '441800', '阳山县', ',1,440000,441800,441823', 'mainland', '4');
INSERT INTO `region` VALUES ('441825', '441800', '连山壮族瑶族自治县', ',1,440000,441800,441825', 'mainland', '4');
INSERT INTO `region` VALUES ('441826', '441800', '连南瑶族自治县', ',1,440000,441800,441826', 'mainland', '4');
INSERT INTO `region` VALUES ('441827', '441800', '清新县', ',1,440000,441800,441827', 'mainland', '4');
INSERT INTO `region` VALUES ('441881', '441800', '英德市', ',1,440000,441800,441881', 'mainland', '4');
INSERT INTO `region` VALUES ('441882', '441800', '连州市', ',1,440000,441800,441882', 'mainland', '4');
INSERT INTO `region` VALUES ('441883', '441800', '其它区', ',1,440000,441800,441883', 'mainland', '4');
INSERT INTO `region` VALUES ('441900', '440000', '东莞市', ',1,440000,441900', 'mainland', '3');
INSERT INTO `region` VALUES ('442000', '440000', '中山市', ',1,440000,442000', 'mainland', '3');
INSERT INTO `region` VALUES ('445100', '440000', '潮州市', ',1,440000,445100', 'mainland', '3');
INSERT INTO `region` VALUES ('445102', '445100', '湘桥区', ',1,440000,445100,445102', 'mainland', '4');
INSERT INTO `region` VALUES ('445121', '445100', '潮安县', ',1,440000,445100,445121', 'mainland', '4');
INSERT INTO `region` VALUES ('445122', '445100', '饶平县', ',1,440000,445100,445122', 'mainland', '4');
INSERT INTO `region` VALUES ('445185', '445100', '枫溪区', ',1,440000,445100,445185', 'mainland', '4');
INSERT INTO `region` VALUES ('445186', '445100', '其它区', ',1,440000,445100,445186', 'mainland', '4');
INSERT INTO `region` VALUES ('445200', '440000', '揭阳市', ',1,440000,445200', 'mainland', '3');
INSERT INTO `region` VALUES ('445202', '445200', '榕城区', ',1,440000,445200,445202', 'mainland', '4');
INSERT INTO `region` VALUES ('445221', '445200', '揭东县', ',1,440000,445200,445221', 'mainland', '4');
INSERT INTO `region` VALUES ('445222', '445200', '揭西县', ',1,440000,445200,445222', 'mainland', '4');
INSERT INTO `region` VALUES ('445224', '445200', '惠来县', ',1,440000,445200,445224', 'mainland', '4');
INSERT INTO `region` VALUES ('445281', '445200', '普宁市', ',1,440000,445200,445281', 'mainland', '4');
INSERT INTO `region` VALUES ('445284', '445200', '东山区', ',1,440000,445200,445284', 'mainland', '4');
INSERT INTO `region` VALUES ('445285', '445200', '其它区', ',1,440000,445200,445285', 'mainland', '4');
INSERT INTO `region` VALUES ('445300', '440000', '云浮市', ',1,440000,445300', 'mainland', '3');
INSERT INTO `region` VALUES ('445302', '445300', '云城区', ',1,440000,445300,445302', 'mainland', '4');
INSERT INTO `region` VALUES ('445321', '445300', '新兴县', ',1,440000,445300,445321', 'mainland', '4');
INSERT INTO `region` VALUES ('445322', '445300', '郁南县', ',1,440000,445300,445322', 'mainland', '4');
INSERT INTO `region` VALUES ('445323', '445300', '云安县', ',1,440000,445300,445323', 'mainland', '4');
INSERT INTO `region` VALUES ('445381', '445300', '罗定市', ',1,440000,445300,445381', 'mainland', '4');
INSERT INTO `region` VALUES ('445382', '445300', '其它区', ',1,440000,445300,445382', 'mainland', '4');
INSERT INTO `region` VALUES ('450000', '1', '广西壮族自治区', ',1,450000', 'mainland', '2');
INSERT INTO `region` VALUES ('450100', '450000', '南宁市', ',1,450000,450100', 'mainland', '3');
INSERT INTO `region` VALUES ('450102', '450100', '兴宁区', ',1,450000,450100,450102', 'mainland', '4');
INSERT INTO `region` VALUES ('450103', '450100', '青秀区', ',1,450000,450100,450103', 'mainland', '4');
INSERT INTO `region` VALUES ('450105', '450100', '江南区', ',1,450000,450100,450105', 'mainland', '4');
INSERT INTO `region` VALUES ('450107', '450100', '西乡塘区', ',1,450000,450100,450107', 'mainland', '4');
INSERT INTO `region` VALUES ('450108', '450100', '良庆区', ',1,450000,450100,450108', 'mainland', '4');
INSERT INTO `region` VALUES ('450109', '450100', '邕宁区', ',1,450000,450100,450109', 'mainland', '4');
INSERT INTO `region` VALUES ('450122', '450100', '武鸣县', ',1,450000,450100,450122', 'mainland', '4');
INSERT INTO `region` VALUES ('450123', '450100', '隆安县', ',1,450000,450100,450123', 'mainland', '4');
INSERT INTO `region` VALUES ('450124', '450100', '马山县', ',1,450000,450100,450124', 'mainland', '4');
INSERT INTO `region` VALUES ('450125', '450100', '上林县', ',1,450000,450100,450125', 'mainland', '4');
INSERT INTO `region` VALUES ('450126', '450100', '宾阳县', ',1,450000,450100,450126', 'mainland', '4');
INSERT INTO `region` VALUES ('450127', '450100', '横县', ',1,450000,450100,450127', 'mainland', '4');
INSERT INTO `region` VALUES ('450128', '450100', '其它区', ',1,450000,450100,450128', 'mainland', '4');
INSERT INTO `region` VALUES ('450200', '450000', '柳州市', ',1,450000,450200', 'mainland', '3');
INSERT INTO `region` VALUES ('450202', '450200', '城中区', ',1,450000,450200,450202', 'mainland', '4');
INSERT INTO `region` VALUES ('450203', '450200', '鱼峰区', ',1,450000,450200,450203', 'mainland', '4');
INSERT INTO `region` VALUES ('450204', '450200', '柳南区', ',1,450000,450200,450204', 'mainland', '4');
INSERT INTO `region` VALUES ('450205', '450200', '柳北区', ',1,450000,450200,450205', 'mainland', '4');
INSERT INTO `region` VALUES ('450221', '450200', '柳江县', ',1,450000,450200,450221', 'mainland', '4');
INSERT INTO `region` VALUES ('450222', '450200', '柳城县', ',1,450000,450200,450222', 'mainland', '4');
INSERT INTO `region` VALUES ('450223', '450200', '鹿寨县', ',1,450000,450200,450223', 'mainland', '4');
INSERT INTO `region` VALUES ('450224', '450200', '融安县', ',1,450000,450200,450224', 'mainland', '4');
INSERT INTO `region` VALUES ('450225', '450200', '融水苗族自治县', ',1,450000,450200,450225', 'mainland', '4');
INSERT INTO `region` VALUES ('450226', '450200', '三江侗族自治县', ',1,450000,450200,450226', 'mainland', '4');
INSERT INTO `region` VALUES ('450227', '450200', '其它区', ',1,450000,450200,450227', 'mainland', '4');
INSERT INTO `region` VALUES ('450300', '450000', '桂林市', ',1,450000,450300', 'mainland', '3');
INSERT INTO `region` VALUES ('450302', '450300', '秀峰区', ',1,450000,450300,450302', 'mainland', '4');
INSERT INTO `region` VALUES ('450303', '450300', '叠彩区', ',1,450000,450300,450303', 'mainland', '4');
INSERT INTO `region` VALUES ('450304', '450300', '象山区', ',1,450000,450300,450304', 'mainland', '4');
INSERT INTO `region` VALUES ('450305', '450300', '七星区', ',1,450000,450300,450305', 'mainland', '4');
INSERT INTO `region` VALUES ('450311', '450300', '雁山区', ',1,450000,450300,450311', 'mainland', '4');
INSERT INTO `region` VALUES ('450321', '450300', '阳朔县', ',1,450000,450300,450321', 'mainland', '4');
INSERT INTO `region` VALUES ('450322', '450300', '临桂县', ',1,450000,450300,450322', 'mainland', '4');
INSERT INTO `region` VALUES ('450323', '450300', '灵川县', ',1,450000,450300,450323', 'mainland', '4');
INSERT INTO `region` VALUES ('450324', '450300', '全州县', ',1,450000,450300,450324', 'mainland', '4');
INSERT INTO `region` VALUES ('450325', '450300', '兴安县', ',1,450000,450300,450325', 'mainland', '4');
INSERT INTO `region` VALUES ('450326', '450300', '永福县', ',1,450000,450300,450326', 'mainland', '4');
INSERT INTO `region` VALUES ('450327', '450300', '灌阳县', ',1,450000,450300,450327', 'mainland', '4');
INSERT INTO `region` VALUES ('450328', '450300', '龙胜各族自治县', ',1,450000,450300,450328', 'mainland', '4');
INSERT INTO `region` VALUES ('450329', '450300', '资源县', ',1,450000,450300,450329', 'mainland', '4');
INSERT INTO `region` VALUES ('450330', '450300', '平乐县', ',1,450000,450300,450330', 'mainland', '4');
INSERT INTO `region` VALUES ('450331', '450300', '荔浦县', ',1,450000,450300,450331', 'mainland', '4');
INSERT INTO `region` VALUES ('450332', '450300', '恭城瑶族自治县', ',1,450000,450300,450332', 'mainland', '4');
INSERT INTO `region` VALUES ('450333', '450300', '其它区', ',1,450000,450300,450333', 'mainland', '4');
INSERT INTO `region` VALUES ('450400', '450000', '梧州市', ',1,450000,450400', 'mainland', '3');
INSERT INTO `region` VALUES ('450403', '450400', '万秀区', ',1,450000,450400,450403', 'mainland', '4');
INSERT INTO `region` VALUES ('450404', '450400', '蝶山区', ',1,450000,450400,450404', 'mainland', '4');
INSERT INTO `region` VALUES ('450405', '450400', '长洲区', ',1,450000,450400,450405', 'mainland', '4');
INSERT INTO `region` VALUES ('450421', '450400', '苍梧县', ',1,450000,450400,450421', 'mainland', '4');
INSERT INTO `region` VALUES ('450422', '450400', '藤县', ',1,450000,450400,450422', 'mainland', '4');
INSERT INTO `region` VALUES ('450423', '450400', '蒙山县', ',1,450000,450400,450423', 'mainland', '4');
INSERT INTO `region` VALUES ('450481', '450400', '岑溪市', ',1,450000,450400,450481', 'mainland', '4');
INSERT INTO `region` VALUES ('450482', '450400', '其它区', ',1,450000,450400,450482', 'mainland', '4');
INSERT INTO `region` VALUES ('450500', '450000', '北海市', ',1,450000,450500', 'mainland', '3');
INSERT INTO `region` VALUES ('450502', '450500', '海城区', ',1,450000,450500,450502', 'mainland', '4');
INSERT INTO `region` VALUES ('450503', '450500', '银海区', ',1,450000,450500,450503', 'mainland', '4');
INSERT INTO `region` VALUES ('450512', '450500', '铁山港区', ',1,450000,450500,450512', 'mainland', '4');
INSERT INTO `region` VALUES ('450521', '450500', '合浦县', ',1,450000,450500,450521', 'mainland', '4');
INSERT INTO `region` VALUES ('450522', '450500', '其它区', ',1,450000,450500,450522', 'mainland', '4');
INSERT INTO `region` VALUES ('450600', '450000', '防城港市', ',1,450000,450600', 'mainland', '3');
INSERT INTO `region` VALUES ('450602', '450600', '港口区', ',1,450000,450600,450602', 'mainland', '4');
INSERT INTO `region` VALUES ('450603', '450600', '防城区', ',1,450000,450600,450603', 'mainland', '4');
INSERT INTO `region` VALUES ('450621', '450600', '上思县', ',1,450000,450600,450621', 'mainland', '4');
INSERT INTO `region` VALUES ('450681', '450600', '东兴市', ',1,450000,450600,450681', 'mainland', '4');
INSERT INTO `region` VALUES ('450682', '450600', '其它区', ',1,450000,450600,450682', 'mainland', '4');
INSERT INTO `region` VALUES ('450700', '450000', '钦州市', ',1,450000,450700', 'mainland', '3');
INSERT INTO `region` VALUES ('450702', '450700', '钦南区', ',1,450000,450700,450702', 'mainland', '4');
INSERT INTO `region` VALUES ('450703', '450700', '钦北区', ',1,450000,450700,450703', 'mainland', '4');
INSERT INTO `region` VALUES ('450721', '450700', '灵山县', ',1,450000,450700,450721', 'mainland', '4');
INSERT INTO `region` VALUES ('450722', '450700', '浦北县', ',1,450000,450700,450722', 'mainland', '4');
INSERT INTO `region` VALUES ('450723', '450700', '其它区', ',1,450000,450700,450723', 'mainland', '4');
INSERT INTO `region` VALUES ('450800', '450000', '贵港市', ',1,450000,450800', 'mainland', '3');
INSERT INTO `region` VALUES ('450802', '450800', '港北区', ',1,450000,450800,450802', 'mainland', '4');
INSERT INTO `region` VALUES ('450803', '450800', '港南区', ',1,450000,450800,450803', 'mainland', '4');
INSERT INTO `region` VALUES ('450804', '450800', '覃塘区', ',1,450000,450800,450804', 'mainland', '4');
INSERT INTO `region` VALUES ('450821', '450800', '平南县', ',1,450000,450800,450821', 'mainland', '4');
INSERT INTO `region` VALUES ('450881', '450800', '桂平市', ',1,450000,450800,450881', 'mainland', '4');
INSERT INTO `region` VALUES ('450882', '450800', '其它区', ',1,450000,450800,450882', 'mainland', '4');
INSERT INTO `region` VALUES ('450900', '450000', '玉林市', ',1,450000,450900', 'mainland', '3');
INSERT INTO `region` VALUES ('450902', '450900', '玉州区', ',1,450000,450900,450902', 'mainland', '4');
INSERT INTO `region` VALUES ('450921', '450900', '容县', ',1,450000,450900,450921', 'mainland', '4');
INSERT INTO `region` VALUES ('450922', '450900', '陆川县', ',1,450000,450900,450922', 'mainland', '4');
INSERT INTO `region` VALUES ('450923', '450900', '博白县', ',1,450000,450900,450923', 'mainland', '4');
INSERT INTO `region` VALUES ('450924', '450900', '兴业县', ',1,450000,450900,450924', 'mainland', '4');
INSERT INTO `region` VALUES ('450981', '450900', '北流市', ',1,450000,450900,450981', 'mainland', '4');
INSERT INTO `region` VALUES ('450982', '450900', '其它区', ',1,450000,450900,450982', 'mainland', '4');
INSERT INTO `region` VALUES ('451000', '450000', '百色市', ',1,450000,451000', 'mainland', '3');
INSERT INTO `region` VALUES ('451002', '451000', '右江区', ',1,450000,451000,451002', 'mainland', '4');
INSERT INTO `region` VALUES ('451021', '451000', '田阳县', ',1,450000,451000,451021', 'mainland', '4');
INSERT INTO `region` VALUES ('451022', '451000', '田东县', ',1,450000,451000,451022', 'mainland', '4');
INSERT INTO `region` VALUES ('451023', '451000', '平果县', ',1,450000,451000,451023', 'mainland', '4');
INSERT INTO `region` VALUES ('451024', '451000', '德保县', ',1,450000,451000,451024', 'mainland', '4');
INSERT INTO `region` VALUES ('451025', '451000', '靖西县', ',1,450000,451000,451025', 'mainland', '4');
INSERT INTO `region` VALUES ('451026', '451000', '那坡县', ',1,450000,451000,451026', 'mainland', '4');
INSERT INTO `region` VALUES ('451027', '451000', '凌云县', ',1,450000,451000,451027', 'mainland', '4');
INSERT INTO `region` VALUES ('451028', '451000', '乐业县', ',1,450000,451000,451028', 'mainland', '4');
INSERT INTO `region` VALUES ('451029', '451000', '田林县', ',1,450000,451000,451029', 'mainland', '4');
INSERT INTO `region` VALUES ('451030', '451000', '西林县', ',1,450000,451000,451030', 'mainland', '4');
INSERT INTO `region` VALUES ('451031', '451000', '隆林各族自治县', ',1,450000,451000,451031', 'mainland', '4');
INSERT INTO `region` VALUES ('451032', '451000', '其它区', ',1,450000,451000,451032', 'mainland', '4');
INSERT INTO `region` VALUES ('451100', '450000', '贺州市', ',1,450000,451100', 'mainland', '3');
INSERT INTO `region` VALUES ('451102', '451100', '八步区', ',1,450000,451100,451102', 'mainland', '4');
INSERT INTO `region` VALUES ('451121', '451100', '昭平县', ',1,450000,451100,451121', 'mainland', '4');
INSERT INTO `region` VALUES ('451122', '451100', '钟山县', ',1,450000,451100,451122', 'mainland', '4');
INSERT INTO `region` VALUES ('451123', '451100', '富川瑶族自治县', ',1,450000,451100,451123', 'mainland', '4');
INSERT INTO `region` VALUES ('451124', '451100', '其它区', ',1,450000,451100,451124', 'mainland', '4');
INSERT INTO `region` VALUES ('451200', '450000', '河池市', ',1,450000,451200', 'mainland', '3');
INSERT INTO `region` VALUES ('451202', '451200', '金城江区', ',1,450000,451200,451202', 'mainland', '4');
INSERT INTO `region` VALUES ('451221', '451200', '南丹县', ',1,450000,451200,451221', 'mainland', '4');
INSERT INTO `region` VALUES ('451222', '451200', '天峨县', ',1,450000,451200,451222', 'mainland', '4');
INSERT INTO `region` VALUES ('451223', '451200', '凤山县', ',1,450000,451200,451223', 'mainland', '4');
INSERT INTO `region` VALUES ('451224', '451200', '东兰县', ',1,450000,451200,451224', 'mainland', '4');
INSERT INTO `region` VALUES ('451225', '451200', '罗城仫佬族自治县', ',1,450000,451200,451225', 'mainland', '4');
INSERT INTO `region` VALUES ('451226', '451200', '环江毛南族自治县', ',1,450000,451200,451226', 'mainland', '4');
INSERT INTO `region` VALUES ('451227', '451200', '巴马瑶族自治县', ',1,450000,451200,451227', 'mainland', '4');
INSERT INTO `region` VALUES ('451228', '451200', '都安瑶族自治县', ',1,450000,451200,451228', 'mainland', '4');
INSERT INTO `region` VALUES ('451229', '451200', '大化瑶族自治县', ',1,450000,451200,451229', 'mainland', '4');
INSERT INTO `region` VALUES ('451281', '451200', '宜州市', ',1,450000,451200,451281', 'mainland', '4');
INSERT INTO `region` VALUES ('451282', '451200', '其它区', ',1,450000,451200,451282', 'mainland', '4');
INSERT INTO `region` VALUES ('451300', '450000', '来宾市', ',1,450000,451300', 'mainland', '3');
INSERT INTO `region` VALUES ('451302', '451300', '兴宾区', ',1,450000,451300,451302', 'mainland', '4');
INSERT INTO `region` VALUES ('451321', '451300', '忻城县', ',1,450000,451300,451321', 'mainland', '4');
INSERT INTO `region` VALUES ('451322', '451300', '象州县', ',1,450000,451300,451322', 'mainland', '4');
INSERT INTO `region` VALUES ('451323', '451300', '武宣县', ',1,450000,451300,451323', 'mainland', '4');
INSERT INTO `region` VALUES ('451324', '451300', '金秀瑶族自治县', ',1,450000,451300,451324', 'mainland', '4');
INSERT INTO `region` VALUES ('451381', '451300', '合山市', ',1,450000,451300,451381', 'mainland', '4');
INSERT INTO `region` VALUES ('451382', '451300', '其它区', ',1,450000,451300,451382', 'mainland', '4');
INSERT INTO `region` VALUES ('451400', '450000', '崇左市', ',1,450000,451400', 'mainland', '3');
INSERT INTO `region` VALUES ('451402', '451400', '江州区', ',1,450000,451400,451402', 'mainland', '4');
INSERT INTO `region` VALUES ('451421', '451400', '扶绥县', ',1,450000,451400,451421', 'mainland', '4');
INSERT INTO `region` VALUES ('451422', '451400', '宁明县', ',1,450000,451400,451422', 'mainland', '4');
INSERT INTO `region` VALUES ('451423', '451400', '龙州县', ',1,450000,451400,451423', 'mainland', '4');
INSERT INTO `region` VALUES ('451424', '451400', '大新县', ',1,450000,451400,451424', 'mainland', '4');
INSERT INTO `region` VALUES ('451425', '451400', '天等县', ',1,450000,451400,451425', 'mainland', '4');
INSERT INTO `region` VALUES ('451481', '451400', '凭祥市', ',1,450000,451400,451481', 'mainland', '4');
INSERT INTO `region` VALUES ('451482', '451400', '其它区', ',1,450000,451400,451482', 'mainland', '4');
INSERT INTO `region` VALUES ('460000', '1', '海南省', ',1,460000', 'mainland', '2');
INSERT INTO `region` VALUES ('460100', '460000', '海口市', ',1,460000,460100', 'mainland', '3');
INSERT INTO `region` VALUES ('460105', '460100', '秀英区', ',1,460000,460100,460105', 'mainland', '4');
INSERT INTO `region` VALUES ('460106', '460100', '龙华区', ',1,460000,460100,460106', 'mainland', '4');
INSERT INTO `region` VALUES ('460107', '460100', '琼山区', ',1,460000,460100,460107', 'mainland', '4');
INSERT INTO `region` VALUES ('460108', '460100', '美兰区', ',1,460000,460100,460108', 'mainland', '4');
INSERT INTO `region` VALUES ('460109', '460100', '其它区', ',1,460000,460100,460109', 'mainland', '4');
INSERT INTO `region` VALUES ('460200', '460000', '三亚市', ',1,460000,460200', 'mainland', '3');
INSERT INTO `region` VALUES ('469001', '460000', '五指山市', ',1,460000,469001', 'mainland', '4');
INSERT INTO `region` VALUES ('469002', '460000', '琼海市', ',1,460000,469002', 'mainland', '4');
INSERT INTO `region` VALUES ('469003', '460000', '儋州市', ',1,460000,469003', 'mainland', '4');
INSERT INTO `region` VALUES ('469005', '460000', '文昌市', ',1,460000,469005', 'mainland', '4');
INSERT INTO `region` VALUES ('469006', '460000', '万宁市', ',1,460000,469006', 'mainland', '4');
INSERT INTO `region` VALUES ('469007', '460000', '东方市', ',1,460000,469007', 'mainland', '4');
INSERT INTO `region` VALUES ('469025', '460000', '定安县', ',1,460000,469025', 'mainland', '4');
INSERT INTO `region` VALUES ('469026', '460000', '屯昌县', ',1,460000,469026', 'mainland', '4');
INSERT INTO `region` VALUES ('469027', '460000', '澄迈县', ',1,460000,469027', 'mainland', '4');
INSERT INTO `region` VALUES ('469028', '460000', '临高县', ',1,460000,469028', 'mainland', '4');
INSERT INTO `region` VALUES ('469030', '460000', '白沙黎族自治县', ',1,460000,469030', 'mainland', '4');
INSERT INTO `region` VALUES ('469031', '460000', '昌江黎族自治县', ',1,460000,469031', 'mainland', '4');
INSERT INTO `region` VALUES ('469033', '460000', '乐东黎族自治县', ',1,460000,469033', 'mainland', '4');
INSERT INTO `region` VALUES ('469034', '460000', '陵水黎族自治县', ',1,460000,469034', 'mainland', '4');
INSERT INTO `region` VALUES ('469035', '460000', '保亭黎族苗族自治县', ',1,460000,469035', 'mainland', '4');
INSERT INTO `region` VALUES ('469036', '460000', '琼中黎族苗族自治县', ',1,460000,469036', 'mainland', '4');
INSERT INTO `region` VALUES ('469037', '460000', '西沙群岛', ',1,460000,469037', 'mainland', '4');
INSERT INTO `region` VALUES ('469038', '460000', '南沙群岛', ',1,460000,469038', 'mainland', '4');
INSERT INTO `region` VALUES ('469039', '460000', '中沙群岛的岛礁及其海域', ',1,460000,469039', 'mainland', '4');
INSERT INTO `region` VALUES ('471004', '410300', '高新区', ',1,410000,410300,471004', 'mainland', '4');
INSERT INTO `region` VALUES ('471005', '410300', '其它区', ',1,410000,410300,471005', 'mainland', '4');
INSERT INTO `region` VALUES ('500000', '1', '重庆', ',1,500000', 'mainland', '2');
INSERT INTO `region` VALUES ('500100', '500000', '重庆市', ',1,500000,500100', 'mainland', '3');
INSERT INTO `region` VALUES ('500101', '500100', '万州区', ',1,500000,500100,500101', 'mainland', '4');
INSERT INTO `region` VALUES ('500102', '500100', '涪陵区', ',1,500000,500100,500102', 'mainland', '4');
INSERT INTO `region` VALUES ('500103', '500100', '渝中区', ',1,500000,500100,500103', 'mainland', '4');
INSERT INTO `region` VALUES ('500104', '500100', '大渡口区', ',1,500000,500100,500104', 'mainland', '4');
INSERT INTO `region` VALUES ('500105', '500100', '江北区', ',1,500000,500100,500105', 'mainland', '4');
INSERT INTO `region` VALUES ('500106', '500100', '沙坪坝区', ',1,500000,500100,500106', 'mainland', '4');
INSERT INTO `region` VALUES ('500107', '500100', '九龙坡区', ',1,500000,500100,500107', 'mainland', '4');
INSERT INTO `region` VALUES ('500108', '500100', '南岸区', ',1,500000,500100,500108', 'mainland', '4');
INSERT INTO `region` VALUES ('500109', '500100', '北碚区', ',1,500000,500100,500109', 'mainland', '4');
INSERT INTO `region` VALUES ('500110', '500100', '万盛区', ',1,500000,500100,500110', 'mainland', '4');
INSERT INTO `region` VALUES ('500111', '500100', '双桥区', ',1,500000,500100,500111', 'mainland', '4');
INSERT INTO `region` VALUES ('500112', '500100', '渝北区', ',1,500000,500100,500112', 'mainland', '4');
INSERT INTO `region` VALUES ('500113', '500100', '巴南区', ',1,500000,500100,500113', 'mainland', '4');
INSERT INTO `region` VALUES ('500114', '500100', '黔江区', ',1,500000,500100,500114', 'mainland', '4');
INSERT INTO `region` VALUES ('500115', '500100', '长寿区', ',1,500000,500100,500115', 'mainland', '4');
INSERT INTO `region` VALUES ('500222', '500100', '綦江县', ',1,500000,500100,500222', 'mainland', '4');
INSERT INTO `region` VALUES ('500223', '500100', '潼南县', ',1,500000,500100,500223', 'mainland', '4');
INSERT INTO `region` VALUES ('500224', '500100', '铜梁县', ',1,500000,500100,500224', 'mainland', '4');
INSERT INTO `region` VALUES ('500225', '500100', '大足县', ',1,500000,500100,500225', 'mainland', '4');
INSERT INTO `region` VALUES ('500226', '500100', '荣昌县', ',1,500000,500100,500226', 'mainland', '4');
INSERT INTO `region` VALUES ('500227', '500100', '璧山县', ',1,500000,500100,500227', 'mainland', '4');
INSERT INTO `region` VALUES ('500228', '500100', '梁平县', ',1,500000,500100,500228', 'mainland', '4');
INSERT INTO `region` VALUES ('500229', '500100', '城口县', ',1,500000,500100,500229', 'mainland', '4');
INSERT INTO `region` VALUES ('500230', '500100', '丰都县', ',1,500000,500100,500230', 'mainland', '4');
INSERT INTO `region` VALUES ('500231', '500100', '垫江县', ',1,500000,500100,500231', 'mainland', '4');
INSERT INTO `region` VALUES ('500232', '500100', '武隆县', ',1,500000,500100,500232', 'mainland', '4');
INSERT INTO `region` VALUES ('500233', '500100', '忠县', ',1,500000,500100,500233', 'mainland', '4');
INSERT INTO `region` VALUES ('500234', '500100', '开县', ',1,500000,500100,500234', 'mainland', '4');
INSERT INTO `region` VALUES ('500235', '500100', '云阳县', ',1,500000,500100,500235', 'mainland', '4');
INSERT INTO `region` VALUES ('500236', '500100', '奉节县', ',1,500000,500100,500236', 'mainland', '4');
INSERT INTO `region` VALUES ('500237', '500100', '巫山县', ',1,500000,500100,500237', 'mainland', '4');
INSERT INTO `region` VALUES ('500238', '500100', '巫溪县', ',1,500000,500100,500238', 'mainland', '4');
INSERT INTO `region` VALUES ('500240', '500100', '石柱土家族自治县', ',1,500000,500100,500240', 'mainland', '4');
INSERT INTO `region` VALUES ('500241', '500100', '秀山土家族苗族自治县', ',1,500000,500100,500241', 'mainland', '4');
INSERT INTO `region` VALUES ('500242', '500100', '酉阳土家族苗族自治县', ',1,500000,500100,500242', 'mainland', '4');
INSERT INTO `region` VALUES ('500243', '500100', '彭水苗族土家族自治县', ',1,500000,500100,500243', 'mainland', '4');
INSERT INTO `region` VALUES ('500381', '500100', '江津区', ',1,500000,500100,500381', 'mainland', '4');
INSERT INTO `region` VALUES ('500382', '500100', '合川区', ',1,500000,500100,500382', 'mainland', '4');
INSERT INTO `region` VALUES ('500383', '500100', '永川区', ',1,500000,500100,500383', 'mainland', '4');
INSERT INTO `region` VALUES ('500384', '500100', '南川区', ',1,500000,500100,500384', 'mainland', '4');
INSERT INTO `region` VALUES ('500385', '500100', '其它区', ',1,500000,500100,500385', 'mainland', '4');
INSERT INTO `region` VALUES ('510000', '1', '四川省', ',1,510000', 'mainland', '2');
INSERT INTO `region` VALUES ('510100', '510000', '成都市', ',1,510000,510100', 'mainland', '3');
INSERT INTO `region` VALUES ('510104', '510100', '锦江区', ',1,510000,510100,510104', 'mainland', '4');
INSERT INTO `region` VALUES ('510105', '510100', '青羊区', ',1,510000,510100,510105', 'mainland', '4');
INSERT INTO `region` VALUES ('510106', '510100', '金牛区', ',1,510000,510100,510106', 'mainland', '4');
INSERT INTO `region` VALUES ('510107', '510100', '武侯区', ',1,510000,510100,510107', 'mainland', '4');
INSERT INTO `region` VALUES ('510108', '510100', '成华区', ',1,510000,510100,510108', 'mainland', '4');
INSERT INTO `region` VALUES ('510112', '510100', '龙泉驿区', ',1,510000,510100,510112', 'mainland', '4');
INSERT INTO `region` VALUES ('510113', '510100', '青白江区', ',1,510000,510100,510113', 'mainland', '4');
INSERT INTO `region` VALUES ('510114', '510100', '新都区', ',1,510000,510100,510114', 'mainland', '4');
INSERT INTO `region` VALUES ('510115', '510100', '温江区', ',1,510000,510100,510115', 'mainland', '4');
INSERT INTO `region` VALUES ('510121', '510100', '金堂县', ',1,510000,510100,510121', 'mainland', '4');
INSERT INTO `region` VALUES ('510122', '510100', '双流县', ',1,510000,510100,510122', 'mainland', '4');
INSERT INTO `region` VALUES ('510124', '510100', '郫县', ',1,510000,510100,510124', 'mainland', '4');
INSERT INTO `region` VALUES ('510129', '510100', '大邑县', ',1,510000,510100,510129', 'mainland', '4');
INSERT INTO `region` VALUES ('510131', '510100', '蒲江县', ',1,510000,510100,510131', 'mainland', '4');
INSERT INTO `region` VALUES ('510132', '510100', '新津县', ',1,510000,510100,510132', 'mainland', '4');
INSERT INTO `region` VALUES ('510181', '510100', '都江堰市', ',1,510000,510100,510181', 'mainland', '4');
INSERT INTO `region` VALUES ('510182', '510100', '彭州市', ',1,510000,510100,510182', 'mainland', '4');
INSERT INTO `region` VALUES ('510183', '510100', '邛崃市', ',1,510000,510100,510183', 'mainland', '4');
INSERT INTO `region` VALUES ('510184', '510100', '崇州市', ',1,510000,510100,510184', 'mainland', '4');
INSERT INTO `region` VALUES ('510185', '510100', '其它区', ',1,510000,510100,510185', 'mainland', '4');
INSERT INTO `region` VALUES ('510300', '510000', '自贡市', ',1,510000,510300', 'mainland', '3');
INSERT INTO `region` VALUES ('510302', '510300', '自流井区', ',1,510000,510300,510302', 'mainland', '4');
INSERT INTO `region` VALUES ('510303', '510300', '贡井区', ',1,510000,510300,510303', 'mainland', '4');
INSERT INTO `region` VALUES ('510304', '510300', '大安区', ',1,510000,510300,510304', 'mainland', '4');
INSERT INTO `region` VALUES ('510311', '510300', '沿滩区', ',1,510000,510300,510311', 'mainland', '4');
INSERT INTO `region` VALUES ('510321', '510300', '荣县', ',1,510000,510300,510321', 'mainland', '4');
INSERT INTO `region` VALUES ('510322', '510300', '富顺县', ',1,510000,510300,510322', 'mainland', '4');
INSERT INTO `region` VALUES ('510323', '510300', '其它区', ',1,510000,510300,510323', 'mainland', '4');
INSERT INTO `region` VALUES ('510400', '510000', '攀枝花市', ',1,510000,510400', 'mainland', '3');
INSERT INTO `region` VALUES ('510402', '510400', '东区', ',1,510000,510400,510402', 'mainland', '4');
INSERT INTO `region` VALUES ('510403', '510400', '西区', ',1,510000,510400,510403', 'mainland', '4');
INSERT INTO `region` VALUES ('510411', '510400', '仁和区', ',1,510000,510400,510411', 'mainland', '4');
INSERT INTO `region` VALUES ('510421', '510400', '米易县', ',1,510000,510400,510421', 'mainland', '4');
INSERT INTO `region` VALUES ('510422', '510400', '盐边县', ',1,510000,510400,510422', 'mainland', '4');
INSERT INTO `region` VALUES ('510423', '510400', '其它区', ',1,510000,510400,510423', 'mainland', '4');
INSERT INTO `region` VALUES ('510500', '510000', '泸州市', ',1,510000,510500', 'mainland', '3');
INSERT INTO `region` VALUES ('510502', '510500', '江阳区', ',1,510000,510500,510502', 'mainland', '4');
INSERT INTO `region` VALUES ('510503', '510500', '纳溪区', ',1,510000,510500,510503', 'mainland', '4');
INSERT INTO `region` VALUES ('510504', '510500', '龙马潭区', ',1,510000,510500,510504', 'mainland', '4');
INSERT INTO `region` VALUES ('510521', '510500', '泸县', ',1,510000,510500,510521', 'mainland', '4');
INSERT INTO `region` VALUES ('510522', '510500', '合江县', ',1,510000,510500,510522', 'mainland', '4');
INSERT INTO `region` VALUES ('510524', '510500', '叙永县', ',1,510000,510500,510524', 'mainland', '4');
INSERT INTO `region` VALUES ('510525', '510500', '古蔺县', ',1,510000,510500,510525', 'mainland', '4');
INSERT INTO `region` VALUES ('510526', '510500', '其它区', ',1,510000,510500,510526', 'mainland', '4');
INSERT INTO `region` VALUES ('510600', '510000', '德阳市', ',1,510000,510600', 'mainland', '3');
INSERT INTO `region` VALUES ('510603', '510600', '旌阳区', ',1,510000,510600,510603', 'mainland', '4');
INSERT INTO `region` VALUES ('510623', '510600', '中江县', ',1,510000,510600,510623', 'mainland', '4');
INSERT INTO `region` VALUES ('510626', '510600', '罗江县', ',1,510000,510600,510626', 'mainland', '4');
INSERT INTO `region` VALUES ('510681', '510600', '广汉市', ',1,510000,510600,510681', 'mainland', '4');
INSERT INTO `region` VALUES ('510682', '510600', '什邡市', ',1,510000,510600,510682', 'mainland', '4');
INSERT INTO `region` VALUES ('510683', '510600', '绵竹市', ',1,510000,510600,510683', 'mainland', '4');
INSERT INTO `region` VALUES ('510684', '510600', '其它区', ',1,510000,510600,510684', 'mainland', '4');
INSERT INTO `region` VALUES ('510700', '510000', '绵阳市', ',1,510000,510700', 'mainland', '3');
INSERT INTO `region` VALUES ('510703', '510700', '涪城区', ',1,510000,510700,510703', 'mainland', '4');
INSERT INTO `region` VALUES ('510704', '510700', '游仙区', ',1,510000,510700,510704', 'mainland', '4');
INSERT INTO `region` VALUES ('510722', '510700', '三台县', ',1,510000,510700,510722', 'mainland', '4');
INSERT INTO `region` VALUES ('510723', '510700', '盐亭县', ',1,510000,510700,510723', 'mainland', '4');
INSERT INTO `region` VALUES ('510724', '510700', '安县', ',1,510000,510700,510724', 'mainland', '4');
INSERT INTO `region` VALUES ('510725', '510700', '梓潼县', ',1,510000,510700,510725', 'mainland', '4');
INSERT INTO `region` VALUES ('510726', '510700', '北川羌族自治县', ',1,510000,510700,510726', 'mainland', '4');
INSERT INTO `region` VALUES ('510727', '510700', '平武县', ',1,510000,510700,510727', 'mainland', '4');
INSERT INTO `region` VALUES ('510751', '510700', '高新区', ',1,510000,510700,510751', 'mainland', '4');
INSERT INTO `region` VALUES ('510781', '510700', '江油市', ',1,510000,510700,510781', 'mainland', '4');
INSERT INTO `region` VALUES ('510782', '510700', '其它区', ',1,510000,510700,510782', 'mainland', '4');
INSERT INTO `region` VALUES ('510800', '510000', '广元市', ',1,510000,510800', 'mainland', '3');
INSERT INTO `region` VALUES ('510802', '510800', '利州区', ',1,510000,510800,510802', 'mainland', '4');
INSERT INTO `region` VALUES ('510811', '510800', '元坝区', ',1,510000,510800,510811', 'mainland', '4');
INSERT INTO `region` VALUES ('510812', '510800', '朝天区', ',1,510000,510800,510812', 'mainland', '4');
INSERT INTO `region` VALUES ('510821', '510800', '旺苍县', ',1,510000,510800,510821', 'mainland', '4');
INSERT INTO `region` VALUES ('510822', '510800', '青川县', ',1,510000,510800,510822', 'mainland', '4');
INSERT INTO `region` VALUES ('510823', '510800', '剑阁县', ',1,510000,510800,510823', 'mainland', '4');
INSERT INTO `region` VALUES ('510824', '510800', '苍溪县', ',1,510000,510800,510824', 'mainland', '4');
INSERT INTO `region` VALUES ('510825', '510800', '其它区', ',1,510000,510800,510825', 'mainland', '4');
INSERT INTO `region` VALUES ('510900', '510000', '遂宁市', ',1,510000,510900', 'mainland', '3');
INSERT INTO `region` VALUES ('510903', '510900', '船山区', ',1,510000,510900,510903', 'mainland', '4');
INSERT INTO `region` VALUES ('510904', '510900', '安居区', ',1,510000,510900,510904', 'mainland', '4');
INSERT INTO `region` VALUES ('510921', '510900', '蓬溪县', ',1,510000,510900,510921', 'mainland', '4');
INSERT INTO `region` VALUES ('510922', '510900', '射洪县', ',1,510000,510900,510922', 'mainland', '4');
INSERT INTO `region` VALUES ('510923', '510900', '大英县', ',1,510000,510900,510923', 'mainland', '4');
INSERT INTO `region` VALUES ('510924', '510900', '其它区', ',1,510000,510900,510924', 'mainland', '4');
INSERT INTO `region` VALUES ('511000', '510000', '内江市', ',1,510000,511000', 'mainland', '3');
INSERT INTO `region` VALUES ('511002', '511000', '市中区', ',1,510000,511000,511002', 'mainland', '4');
INSERT INTO `region` VALUES ('511011', '511000', '东兴区', ',1,510000,511000,511011', 'mainland', '4');
INSERT INTO `region` VALUES ('511024', '511000', '威远县', ',1,510000,511000,511024', 'mainland', '4');
INSERT INTO `region` VALUES ('511025', '511000', '资中县', ',1,510000,511000,511025', 'mainland', '4');
INSERT INTO `region` VALUES ('511028', '511000', '隆昌县', ',1,510000,511000,511028', 'mainland', '4');
INSERT INTO `region` VALUES ('511029', '511000', '其它区', ',1,510000,511000,511029', 'mainland', '4');
INSERT INTO `region` VALUES ('511100', '510000', '乐山市', ',1,510000,511100', 'mainland', '3');
INSERT INTO `region` VALUES ('511102', '511100', '市中区', ',1,510000,511100,511102', 'mainland', '4');
INSERT INTO `region` VALUES ('511111', '511100', '沙湾区', ',1,510000,511100,511111', 'mainland', '4');
INSERT INTO `region` VALUES ('511112', '511100', '五通桥区', ',1,510000,511100,511112', 'mainland', '4');
INSERT INTO `region` VALUES ('511113', '511100', '金口河区', ',1,510000,511100,511113', 'mainland', '4');
INSERT INTO `region` VALUES ('511123', '511100', '犍为县', ',1,510000,511100,511123', 'mainland', '4');
INSERT INTO `region` VALUES ('511124', '511100', '井研县', ',1,510000,511100,511124', 'mainland', '4');
INSERT INTO `region` VALUES ('511126', '511100', '夹江县', ',1,510000,511100,511126', 'mainland', '4');
INSERT INTO `region` VALUES ('511129', '511100', '沐川县', ',1,510000,511100,511129', 'mainland', '4');
INSERT INTO `region` VALUES ('511132', '511100', '峨边彝族自治县', ',1,510000,511100,511132', 'mainland', '4');
INSERT INTO `region` VALUES ('511133', '511100', '马边彝族自治县', ',1,510000,511100,511133', 'mainland', '4');
INSERT INTO `region` VALUES ('511181', '511100', '峨眉山市', ',1,510000,511100,511181', 'mainland', '4');
INSERT INTO `region` VALUES ('511182', '511100', '其它区', ',1,510000,511100,511182', 'mainland', '4');
INSERT INTO `region` VALUES ('511300', '510000', '南充市', ',1,510000,511300', 'mainland', '3');
INSERT INTO `region` VALUES ('511302', '511300', '顺庆区', ',1,510000,511300,511302', 'mainland', '4');
INSERT INTO `region` VALUES ('511303', '511300', '高坪区', ',1,510000,511300,511303', 'mainland', '4');
INSERT INTO `region` VALUES ('511304', '511300', '嘉陵区', ',1,510000,511300,511304', 'mainland', '4');
INSERT INTO `region` VALUES ('511321', '511300', '南部县', ',1,510000,511300,511321', 'mainland', '4');
INSERT INTO `region` VALUES ('511322', '511300', '营山县', ',1,510000,511300,511322', 'mainland', '4');
INSERT INTO `region` VALUES ('511323', '511300', '蓬安县', ',1,510000,511300,511323', 'mainland', '4');
INSERT INTO `region` VALUES ('511324', '511300', '仪陇县', ',1,510000,511300,511324', 'mainland', '4');
INSERT INTO `region` VALUES ('511325', '511300', '西充县', ',1,510000,511300,511325', 'mainland', '4');
INSERT INTO `region` VALUES ('511381', '511300', '阆中市', ',1,510000,511300,511381', 'mainland', '4');
INSERT INTO `region` VALUES ('511382', '511300', '其它区', ',1,510000,511300,511382', 'mainland', '4');
INSERT INTO `region` VALUES ('511400', '510000', '眉山市', ',1,510000,511400', 'mainland', '3');
INSERT INTO `region` VALUES ('511402', '511400', '东坡区', ',1,510000,511400,511402', 'mainland', '4');
INSERT INTO `region` VALUES ('511421', '511400', '仁寿县', ',1,510000,511400,511421', 'mainland', '4');
INSERT INTO `region` VALUES ('511422', '511400', '彭山县', ',1,510000,511400,511422', 'mainland', '4');
INSERT INTO `region` VALUES ('511423', '511400', '洪雅县', ',1,510000,511400,511423', 'mainland', '4');
INSERT INTO `region` VALUES ('511424', '511400', '丹棱县', ',1,510000,511400,511424', 'mainland', '4');
INSERT INTO `region` VALUES ('511425', '511400', '青神县', ',1,510000,511400,511425', 'mainland', '4');
INSERT INTO `region` VALUES ('511426', '511400', '其它区', ',1,510000,511400,511426', 'mainland', '4');
INSERT INTO `region` VALUES ('511500', '510000', '宜宾市', ',1,510000,511500', 'mainland', '3');
INSERT INTO `region` VALUES ('511502', '511500', '翠屏区', ',1,510000,511500,511502', 'mainland', '4');
INSERT INTO `region` VALUES ('511521', '511500', '宜宾县', ',1,510000,511500,511521', 'mainland', '4');
INSERT INTO `region` VALUES ('511522', '511500', '南溪县', ',1,510000,511500,511522', 'mainland', '4');
INSERT INTO `region` VALUES ('511523', '511500', '江安县', ',1,510000,511500,511523', 'mainland', '4');
INSERT INTO `region` VALUES ('511524', '511500', '长宁县', ',1,510000,511500,511524', 'mainland', '4');
INSERT INTO `region` VALUES ('511525', '511500', '高县', ',1,510000,511500,511525', 'mainland', '4');
INSERT INTO `region` VALUES ('511526', '511500', '珙县', ',1,510000,511500,511526', 'mainland', '4');
INSERT INTO `region` VALUES ('511527', '511500', '筠连县', ',1,510000,511500,511527', 'mainland', '4');
INSERT INTO `region` VALUES ('511528', '511500', '兴文县', ',1,510000,511500,511528', 'mainland', '4');
INSERT INTO `region` VALUES ('511529', '511500', '屏山县', ',1,510000,511500,511529', 'mainland', '4');
INSERT INTO `region` VALUES ('511530', '511500', '其它区', ',1,510000,511500,511530', 'mainland', '4');
INSERT INTO `region` VALUES ('511600', '510000', '广安市', ',1,510000,511600', 'mainland', '3');
INSERT INTO `region` VALUES ('511602', '511600', '广安区', ',1,510000,511600,511602', 'mainland', '4');
INSERT INTO `region` VALUES ('511621', '511600', '岳池县', ',1,510000,511600,511621', 'mainland', '4');
INSERT INTO `region` VALUES ('511622', '511600', '武胜县', ',1,510000,511600,511622', 'mainland', '4');
INSERT INTO `region` VALUES ('511623', '511600', '邻水县', ',1,510000,511600,511623', 'mainland', '4');
INSERT INTO `region` VALUES ('511681', '511600', '华蓥市', ',1,510000,511600,511681', 'mainland', '4');
INSERT INTO `region` VALUES ('511682', '511600', '市辖区', ',1,510000,511600,511682', 'mainland', '4');
INSERT INTO `region` VALUES ('511683', '511600', '其它区', ',1,510000,511600,511683', 'mainland', '4');
INSERT INTO `region` VALUES ('511700', '510000', '达州市', ',1,510000,511700', 'mainland', '3');
INSERT INTO `region` VALUES ('511702', '511700', '通川区', ',1,510000,511700,511702', 'mainland', '4');
INSERT INTO `region` VALUES ('511721', '511700', '达县', ',1,510000,511700,511721', 'mainland', '4');
INSERT INTO `region` VALUES ('511722', '511700', '宣汉县', ',1,510000,511700,511722', 'mainland', '4');
INSERT INTO `region` VALUES ('511723', '511700', '开江县', ',1,510000,511700,511723', 'mainland', '4');
INSERT INTO `region` VALUES ('511724', '511700', '大竹县', ',1,510000,511700,511724', 'mainland', '4');
INSERT INTO `region` VALUES ('511725', '511700', '渠县', ',1,510000,511700,511725', 'mainland', '4');
INSERT INTO `region` VALUES ('511781', '511700', '万源市', ',1,510000,511700,511781', 'mainland', '4');
INSERT INTO `region` VALUES ('511782', '511700', '其它区', ',1,510000,511700,511782', 'mainland', '4');
INSERT INTO `region` VALUES ('511800', '510000', '雅安市', ',1,510000,511800', 'mainland', '3');
INSERT INTO `region` VALUES ('511802', '511800', '雨城区', ',1,510000,511800,511802', 'mainland', '4');
INSERT INTO `region` VALUES ('511821', '511800', '名山县', ',1,510000,511800,511821', 'mainland', '4');
INSERT INTO `region` VALUES ('511822', '511800', '荥经县', ',1,510000,511800,511822', 'mainland', '4');
INSERT INTO `region` VALUES ('511823', '511800', '汉源县', ',1,510000,511800,511823', 'mainland', '4');
INSERT INTO `region` VALUES ('511824', '511800', '石棉县', ',1,510000,511800,511824', 'mainland', '4');
INSERT INTO `region` VALUES ('511825', '511800', '天全县', ',1,510000,511800,511825', 'mainland', '4');
INSERT INTO `region` VALUES ('511826', '511800', '芦山县', ',1,510000,511800,511826', 'mainland', '4');
INSERT INTO `region` VALUES ('511827', '511800', '宝兴县', ',1,510000,511800,511827', 'mainland', '4');
INSERT INTO `region` VALUES ('511828', '511800', '其它区', ',1,510000,511800,511828', 'mainland', '4');
INSERT INTO `region` VALUES ('511900', '510000', '巴中市', ',1,510000,511900', 'mainland', '3');
INSERT INTO `region` VALUES ('511902', '511900', '巴州区', ',1,510000,511900,511902', 'mainland', '4');
INSERT INTO `region` VALUES ('511921', '511900', '通江县', ',1,510000,511900,511921', 'mainland', '4');
INSERT INTO `region` VALUES ('511922', '511900', '南江县', ',1,510000,511900,511922', 'mainland', '4');
INSERT INTO `region` VALUES ('511923', '511900', '平昌县', ',1,510000,511900,511923', 'mainland', '4');
INSERT INTO `region` VALUES ('511924', '511900', '其它区', ',1,510000,511900,511924', 'mainland', '4');
INSERT INTO `region` VALUES ('512000', '510000', '资阳市', ',1,510000,512000', 'mainland', '3');
INSERT INTO `region` VALUES ('512002', '512000', '雁江区', ',1,510000,512000,512002', 'mainland', '4');
INSERT INTO `region` VALUES ('512021', '512000', '安岳县', ',1,510000,512000,512021', 'mainland', '4');
INSERT INTO `region` VALUES ('512022', '512000', '乐至县', ',1,510000,512000,512022', 'mainland', '4');
INSERT INTO `region` VALUES ('512081', '512000', '简阳市', ',1,510000,512000,512081', 'mainland', '4');
INSERT INTO `region` VALUES ('512082', '512000', '其它区', ',1,510000,512000,512082', 'mainland', '4');
INSERT INTO `region` VALUES ('513200', '510000', '阿坝藏族羌族自治州', ',1,510000,513200', 'mainland', '3');
INSERT INTO `region` VALUES ('513221', '513200', '汶川县', ',1,510000,513200,513221', 'mainland', '4');
INSERT INTO `region` VALUES ('513222', '513200', '理县', ',1,510000,513200,513222', 'mainland', '4');
INSERT INTO `region` VALUES ('513223', '513200', '茂县', ',1,510000,513200,513223', 'mainland', '4');
INSERT INTO `region` VALUES ('513224', '513200', '松潘县', ',1,510000,513200,513224', 'mainland', '4');
INSERT INTO `region` VALUES ('513225', '513200', '九寨沟县', ',1,510000,513200,513225', 'mainland', '4');
INSERT INTO `region` VALUES ('513226', '513200', '金川县', ',1,510000,513200,513226', 'mainland', '4');
INSERT INTO `region` VALUES ('513227', '513200', '小金县', ',1,510000,513200,513227', 'mainland', '4');
INSERT INTO `region` VALUES ('513228', '513200', '黑水县', ',1,510000,513200,513228', 'mainland', '4');
INSERT INTO `region` VALUES ('513229', '513200', '马尔康县', ',1,510000,513200,513229', 'mainland', '4');
INSERT INTO `region` VALUES ('513230', '513200', '壤塘县', ',1,510000,513200,513230', 'mainland', '4');
INSERT INTO `region` VALUES ('513231', '513200', '阿坝县', ',1,510000,513200,513231', 'mainland', '4');
INSERT INTO `region` VALUES ('513232', '513200', '若尔盖县', ',1,510000,513200,513232', 'mainland', '4');
INSERT INTO `region` VALUES ('513233', '513200', '红原县', ',1,510000,513200,513233', 'mainland', '4');
INSERT INTO `region` VALUES ('513234', '513200', '其它区', ',1,510000,513200,513234', 'mainland', '4');
INSERT INTO `region` VALUES ('513300', '510000', '甘孜藏族自治州', ',1,510000,513300', 'mainland', '3');
INSERT INTO `region` VALUES ('513321', '513300', '康定县', ',1,510000,513300,513321', 'mainland', '4');
INSERT INTO `region` VALUES ('513322', '513300', '泸定县', ',1,510000,513300,513322', 'mainland', '4');
INSERT INTO `region` VALUES ('513323', '513300', '丹巴县', ',1,510000,513300,513323', 'mainland', '4');
INSERT INTO `region` VALUES ('513324', '513300', '九龙县', ',1,510000,513300,513324', 'mainland', '4');
INSERT INTO `region` VALUES ('513325', '513300', '雅江县', ',1,510000,513300,513325', 'mainland', '4');
INSERT INTO `region` VALUES ('513326', '513300', '道孚县', ',1,510000,513300,513326', 'mainland', '4');
INSERT INTO `region` VALUES ('513327', '513300', '炉霍县', ',1,510000,513300,513327', 'mainland', '4');
INSERT INTO `region` VALUES ('513328', '513300', '甘孜县', ',1,510000,513300,513328', 'mainland', '4');
INSERT INTO `region` VALUES ('513329', '513300', '新龙县', ',1,510000,513300,513329', 'mainland', '4');
INSERT INTO `region` VALUES ('513330', '513300', '德格县', ',1,510000,513300,513330', 'mainland', '4');
INSERT INTO `region` VALUES ('513331', '513300', '白玉县', ',1,510000,513300,513331', 'mainland', '4');
INSERT INTO `region` VALUES ('513332', '513300', '石渠县', ',1,510000,513300,513332', 'mainland', '4');
INSERT INTO `region` VALUES ('513333', '513300', '色达县', ',1,510000,513300,513333', 'mainland', '4');
INSERT INTO `region` VALUES ('513334', '513300', '理塘县', ',1,510000,513300,513334', 'mainland', '4');
INSERT INTO `region` VALUES ('513335', '513300', '巴塘县', ',1,510000,513300,513335', 'mainland', '4');
INSERT INTO `region` VALUES ('513336', '513300', '乡城县', ',1,510000,513300,513336', 'mainland', '4');
INSERT INTO `region` VALUES ('513337', '513300', '稻城县', ',1,510000,513300,513337', 'mainland', '4');
INSERT INTO `region` VALUES ('513338', '513300', '得荣县', ',1,510000,513300,513338', 'mainland', '4');
INSERT INTO `region` VALUES ('513339', '513300', '其它区', ',1,510000,513300,513339', 'mainland', '4');
INSERT INTO `region` VALUES ('513400', '510000', '凉山彝族自治州', ',1,510000,513400', 'mainland', '3');
INSERT INTO `region` VALUES ('513401', '513400', '西昌市', ',1,510000,513400,513401', 'mainland', '4');
INSERT INTO `region` VALUES ('513422', '513400', '木里藏族自治县', ',1,510000,513400,513422', 'mainland', '4');
INSERT INTO `region` VALUES ('513423', '513400', '盐源县', ',1,510000,513400,513423', 'mainland', '4');
INSERT INTO `region` VALUES ('513424', '513400', '德昌县', ',1,510000,513400,513424', 'mainland', '4');
INSERT INTO `region` VALUES ('513425', '513400', '会理县', ',1,510000,513400,513425', 'mainland', '4');
INSERT INTO `region` VALUES ('513426', '513400', '会东县', ',1,510000,513400,513426', 'mainland', '4');
INSERT INTO `region` VALUES ('513427', '513400', '宁南县', ',1,510000,513400,513427', 'mainland', '4');
INSERT INTO `region` VALUES ('513428', '513400', '普格县', ',1,510000,513400,513428', 'mainland', '4');
INSERT INTO `region` VALUES ('513429', '513400', '布拖县', ',1,510000,513400,513429', 'mainland', '4');
INSERT INTO `region` VALUES ('513430', '513400', '金阳县', ',1,510000,513400,513430', 'mainland', '4');
INSERT INTO `region` VALUES ('513431', '513400', '昭觉县', ',1,510000,513400,513431', 'mainland', '4');
INSERT INTO `region` VALUES ('513432', '513400', '喜德县', ',1,510000,513400,513432', 'mainland', '4');
INSERT INTO `region` VALUES ('513433', '513400', '冕宁县', ',1,510000,513400,513433', 'mainland', '4');
INSERT INTO `region` VALUES ('513434', '513400', '越西县', ',1,510000,513400,513434', 'mainland', '4');
INSERT INTO `region` VALUES ('513435', '513400', '甘洛县', ',1,510000,513400,513435', 'mainland', '4');
INSERT INTO `region` VALUES ('513436', '513400', '美姑县', ',1,510000,513400,513436', 'mainland', '4');
INSERT INTO `region` VALUES ('513437', '513400', '雷波县', ',1,510000,513400,513437', 'mainland', '4');
INSERT INTO `region` VALUES ('513438', '513400', '其它区', ',1,510000,513400,513438', 'mainland', '4');
INSERT INTO `region` VALUES ('520000', '1', '贵州省', ',1,520000', 'mainland', '2');
INSERT INTO `region` VALUES ('520100', '520000', '贵阳市', ',1,520000,520100', 'mainland', '3');
INSERT INTO `region` VALUES ('520102', '520100', '南明区', ',1,520000,520100,520102', 'mainland', '4');
INSERT INTO `region` VALUES ('520103', '520100', '云岩区', ',1,520000,520100,520103', 'mainland', '4');
INSERT INTO `region` VALUES ('520111', '520100', '花溪区', ',1,520000,520100,520111', 'mainland', '4');
INSERT INTO `region` VALUES ('520112', '520100', '乌当区', ',1,520000,520100,520112', 'mainland', '4');
INSERT INTO `region` VALUES ('520113', '520100', '白云区', ',1,520000,520100,520113', 'mainland', '4');
INSERT INTO `region` VALUES ('520114', '520100', '小河区', ',1,520000,520100,520114', 'mainland', '4');
INSERT INTO `region` VALUES ('520121', '520100', '开阳县', ',1,520000,520100,520121', 'mainland', '4');
INSERT INTO `region` VALUES ('520122', '520100', '息烽县', ',1,520000,520100,520122', 'mainland', '4');
INSERT INTO `region` VALUES ('520123', '520100', '修文县', ',1,520000,520100,520123', 'mainland', '4');
INSERT INTO `region` VALUES ('520151', '520100', '金阳开发区', ',1,520000,520100,520151', 'mainland', '4');
INSERT INTO `region` VALUES ('520181', '520100', '清镇市', ',1,520000,520100,520181', 'mainland', '4');
INSERT INTO `region` VALUES ('520182', '520100', '其它区', ',1,520000,520100,520182', 'mainland', '4');
INSERT INTO `region` VALUES ('520200', '520000', '六盘水市', ',1,520000,520200', 'mainland', '3');
INSERT INTO `region` VALUES ('520201', '520200', '钟山区', ',1,520000,520200,520201', 'mainland', '4');
INSERT INTO `region` VALUES ('520203', '520200', '六枝特区', ',1,520000,520200,520203', 'mainland', '4');
INSERT INTO `region` VALUES ('520221', '520200', '水城县', ',1,520000,520200,520221', 'mainland', '4');
INSERT INTO `region` VALUES ('520222', '520200', '盘县', ',1,520000,520200,520222', 'mainland', '4');
INSERT INTO `region` VALUES ('520223', '520200', '其它区', ',1,520000,520200,520223', 'mainland', '4');
INSERT INTO `region` VALUES ('520300', '520000', '遵义市', ',1,520000,520300', 'mainland', '3');
INSERT INTO `region` VALUES ('520302', '520300', '红花岗区', ',1,520000,520300,520302', 'mainland', '4');
INSERT INTO `region` VALUES ('520303', '520300', '汇川区', ',1,520000,520300,520303', 'mainland', '4');
INSERT INTO `region` VALUES ('520321', '520300', '遵义县', ',1,520000,520300,520321', 'mainland', '4');
INSERT INTO `region` VALUES ('520322', '520300', '桐梓县', ',1,520000,520300,520322', 'mainland', '4');
INSERT INTO `region` VALUES ('520323', '520300', '绥阳县', ',1,520000,520300,520323', 'mainland', '4');
INSERT INTO `region` VALUES ('520324', '520300', '正安县', ',1,520000,520300,520324', 'mainland', '4');
INSERT INTO `region` VALUES ('520325', '520300', '道真仡佬族苗族自治县', ',1,520000,520300,520325', 'mainland', '4');
INSERT INTO `region` VALUES ('520326', '520300', '务川仡佬族苗族自治县', ',1,520000,520300,520326', 'mainland', '4');
INSERT INTO `region` VALUES ('520327', '520300', '凤冈县', ',1,520000,520300,520327', 'mainland', '4');
INSERT INTO `region` VALUES ('520328', '520300', '湄潭县', ',1,520000,520300,520328', 'mainland', '4');
INSERT INTO `region` VALUES ('520329', '520300', '余庆县', ',1,520000,520300,520329', 'mainland', '4');
INSERT INTO `region` VALUES ('520330', '520300', '习水县', ',1,520000,520300,520330', 'mainland', '4');
INSERT INTO `region` VALUES ('520381', '520300', '赤水市', ',1,520000,520300,520381', 'mainland', '4');
INSERT INTO `region` VALUES ('520382', '520300', '仁怀市', ',1,520000,520300,520382', 'mainland', '4');
INSERT INTO `region` VALUES ('520383', '520300', '其它区', ',1,520000,520300,520383', 'mainland', '4');
INSERT INTO `region` VALUES ('520400', '520000', '安顺市', ',1,520000,520400', 'mainland', '3');
INSERT INTO `region` VALUES ('520402', '520400', '西秀区', ',1,520000,520400,520402', 'mainland', '4');
INSERT INTO `region` VALUES ('520421', '520400', '平坝县', ',1,520000,520400,520421', 'mainland', '4');
INSERT INTO `region` VALUES ('520422', '520400', '普定县', ',1,520000,520400,520422', 'mainland', '4');
INSERT INTO `region` VALUES ('520423', '520400', '镇宁布依族苗族自治县', ',1,520000,520400,520423', 'mainland', '4');
INSERT INTO `region` VALUES ('520424', '520400', '关岭布依族苗族自治县', ',1,520000,520400,520424', 'mainland', '4');
INSERT INTO `region` VALUES ('520425', '520400', '紫云苗族布依族自治县', ',1,520000,520400,520425', 'mainland', '4');
INSERT INTO `region` VALUES ('520426', '520400', '其它区', ',1,520000,520400,520426', 'mainland', '4');
INSERT INTO `region` VALUES ('522200', '520000', '铜仁地区', ',1,520000,522200', 'mainland', '3');
INSERT INTO `region` VALUES ('522201', '522200', '铜仁市', ',1,520000,522200,522201', 'mainland', '4');
INSERT INTO `region` VALUES ('522222', '522200', '江口县', ',1,520000,522200,522222', 'mainland', '4');
INSERT INTO `region` VALUES ('522223', '522200', '玉屏侗族自治县', ',1,520000,522200,522223', 'mainland', '4');
INSERT INTO `region` VALUES ('522224', '522200', '石阡县', ',1,520000,522200,522224', 'mainland', '4');
INSERT INTO `region` VALUES ('522225', '522200', '思南县', ',1,520000,522200,522225', 'mainland', '4');
INSERT INTO `region` VALUES ('522226', '522200', '印江土家族苗族自治县', ',1,520000,522200,522226', 'mainland', '4');
INSERT INTO `region` VALUES ('522227', '522200', '德江县', ',1,520000,522200,522227', 'mainland', '4');
INSERT INTO `region` VALUES ('522228', '522200', '沿河土家族自治县', ',1,520000,522200,522228', 'mainland', '4');
INSERT INTO `region` VALUES ('522229', '522200', '松桃苗族自治县', ',1,520000,522200,522229', 'mainland', '4');
INSERT INTO `region` VALUES ('522230', '522200', '万山特区', ',1,520000,522200,522230', 'mainland', '4');
INSERT INTO `region` VALUES ('522231', '522200', '其它区', ',1,520000,522200,522231', 'mainland', '4');
INSERT INTO `region` VALUES ('522300', '520000', '黔西南布依族苗族自治州', ',1,520000,522300', 'mainland', '3');
INSERT INTO `region` VALUES ('522301', '522300', '兴义市', ',1,520000,522300,522301', 'mainland', '4');
INSERT INTO `region` VALUES ('522322', '522300', '兴仁县', ',1,520000,522300,522322', 'mainland', '4');
INSERT INTO `region` VALUES ('522323', '522300', '普安县', ',1,520000,522300,522323', 'mainland', '4');
INSERT INTO `region` VALUES ('522324', '522300', '晴隆县', ',1,520000,522300,522324', 'mainland', '4');
INSERT INTO `region` VALUES ('522325', '522300', '贞丰县', ',1,520000,522300,522325', 'mainland', '4');
INSERT INTO `region` VALUES ('522326', '522300', '望谟县', ',1,520000,522300,522326', 'mainland', '4');
INSERT INTO `region` VALUES ('522327', '522300', '册亨县', ',1,520000,522300,522327', 'mainland', '4');
INSERT INTO `region` VALUES ('522328', '522300', '安龙县', ',1,520000,522300,522328', 'mainland', '4');
INSERT INTO `region` VALUES ('522329', '522300', '其它区', ',1,520000,522300,522329', 'mainland', '4');
INSERT INTO `region` VALUES ('522400', '520000', '毕节地区', ',1,520000,522400', 'mainland', '3');
INSERT INTO `region` VALUES ('522401', '522400', '毕节市', ',1,520000,522400,522401', 'mainland', '4');
INSERT INTO `region` VALUES ('522422', '522400', '大方县', ',1,520000,522400,522422', 'mainland', '4');
INSERT INTO `region` VALUES ('522423', '522400', '黔西县', ',1,520000,522400,522423', 'mainland', '4');
INSERT INTO `region` VALUES ('522424', '522400', '金沙县', ',1,520000,522400,522424', 'mainland', '4');
INSERT INTO `region` VALUES ('522425', '522400', '织金县', ',1,520000,522400,522425', 'mainland', '4');
INSERT INTO `region` VALUES ('522426', '522400', '纳雍县', ',1,520000,522400,522426', 'mainland', '4');
INSERT INTO `region` VALUES ('522427', '522400', '威宁彝族回族苗族自治县', ',1,520000,522400,522427', 'mainland', '4');
INSERT INTO `region` VALUES ('522428', '522400', '赫章县', ',1,520000,522400,522428', 'mainland', '4');
INSERT INTO `region` VALUES ('522429', '522400', '其它区', ',1,520000,522400,522429', 'mainland', '4');
INSERT INTO `region` VALUES ('522600', '520000', '黔东南苗族侗族自治州', ',1,520000,522600', 'mainland', '3');
INSERT INTO `region` VALUES ('522601', '522600', '凯里市', ',1,520000,522600,522601', 'mainland', '4');
INSERT INTO `region` VALUES ('522622', '522600', '黄平县', ',1,520000,522600,522622', 'mainland', '4');
INSERT INTO `region` VALUES ('522623', '522600', '施秉县', ',1,520000,522600,522623', 'mainland', '4');
INSERT INTO `region` VALUES ('522624', '522600', '三穗县', ',1,520000,522600,522624', 'mainland', '4');
INSERT INTO `region` VALUES ('522625', '522600', '镇远县', ',1,520000,522600,522625', 'mainland', '4');
INSERT INTO `region` VALUES ('522626', '522600', '岑巩县', ',1,520000,522600,522626', 'mainland', '4');
INSERT INTO `region` VALUES ('522627', '522600', '天柱县', ',1,520000,522600,522627', 'mainland', '4');
INSERT INTO `region` VALUES ('522628', '522600', '锦屏县', ',1,520000,522600,522628', 'mainland', '4');
INSERT INTO `region` VALUES ('522629', '522600', '剑河县', ',1,520000,522600,522629', 'mainland', '4');
INSERT INTO `region` VALUES ('522630', '522600', '台江县', ',1,520000,522600,522630', 'mainland', '4');
INSERT INTO `region` VALUES ('522631', '522600', '黎平县', ',1,520000,522600,522631', 'mainland', '4');
INSERT INTO `region` VALUES ('522632', '522600', '榕江县', ',1,520000,522600,522632', 'mainland', '4');
INSERT INTO `region` VALUES ('522633', '522600', '从江县', ',1,520000,522600,522633', 'mainland', '4');
INSERT INTO `region` VALUES ('522634', '522600', '雷山县', ',1,520000,522600,522634', 'mainland', '4');
INSERT INTO `region` VALUES ('522635', '522600', '麻江县', ',1,520000,522600,522635', 'mainland', '4');
INSERT INTO `region` VALUES ('522636', '522600', '丹寨县', ',1,520000,522600,522636', 'mainland', '4');
INSERT INTO `region` VALUES ('522637', '522600', '其它区', ',1,520000,522600,522637', 'mainland', '4');
INSERT INTO `region` VALUES ('522700', '520000', '黔南布依族苗族自治州', ',1,520000,522700', 'mainland', '3');
INSERT INTO `region` VALUES ('522701', '522700', '都匀市', ',1,520000,522700,522701', 'mainland', '4');
INSERT INTO `region` VALUES ('522702', '522700', '福泉市', ',1,520000,522700,522702', 'mainland', '4');
INSERT INTO `region` VALUES ('522722', '522700', '荔波县', ',1,520000,522700,522722', 'mainland', '4');
INSERT INTO `region` VALUES ('522723', '522700', '贵定县', ',1,520000,522700,522723', 'mainland', '4');
INSERT INTO `region` VALUES ('522725', '522700', '瓮安县', ',1,520000,522700,522725', 'mainland', '4');
INSERT INTO `region` VALUES ('522726', '522700', '独山县', ',1,520000,522700,522726', 'mainland', '4');
INSERT INTO `region` VALUES ('522727', '522700', '平塘县', ',1,520000,522700,522727', 'mainland', '4');
INSERT INTO `region` VALUES ('522728', '522700', '罗甸县', ',1,520000,522700,522728', 'mainland', '4');
INSERT INTO `region` VALUES ('522729', '522700', '长顺县', ',1,520000,522700,522729', 'mainland', '4');
INSERT INTO `region` VALUES ('522730', '522700', '龙里县', ',1,520000,522700,522730', 'mainland', '4');
INSERT INTO `region` VALUES ('522731', '522700', '惠水县', ',1,520000,522700,522731', 'mainland', '4');
INSERT INTO `region` VALUES ('522732', '522700', '三都水族自治县', ',1,520000,522700,522732', 'mainland', '4');
INSERT INTO `region` VALUES ('522733', '522700', '其它区', ',1,520000,522700,522733', 'mainland', '4');
INSERT INTO `region` VALUES ('530000', '1', '云南省', ',1,530000', 'mainland', '2');
INSERT INTO `region` VALUES ('530100', '530000', '昆明市', ',1,530000,530100', 'mainland', '3');
INSERT INTO `region` VALUES ('530102', '530100', '五华区', ',1,530000,530100,530102', 'mainland', '4');
INSERT INTO `region` VALUES ('530103', '530100', '盘龙区', ',1,530000,530100,530103', 'mainland', '4');
INSERT INTO `region` VALUES ('530111', '530100', '官渡区', ',1,530000,530100,530111', 'mainland', '4');
INSERT INTO `region` VALUES ('530112', '530100', '西山区', ',1,530000,530100,530112', 'mainland', '4');
INSERT INTO `region` VALUES ('530113', '530100', '东川区', ',1,530000,530100,530113', 'mainland', '4');
INSERT INTO `region` VALUES ('530121', '530100', '呈贡县', ',1,530000,530100,530121', 'mainland', '4');
INSERT INTO `region` VALUES ('530122', '530100', '晋宁县', ',1,530000,530100,530122', 'mainland', '4');
INSERT INTO `region` VALUES ('530124', '530100', '富民县', ',1,530000,530100,530124', 'mainland', '4');
INSERT INTO `region` VALUES ('530125', '530100', '宜良县', ',1,530000,530100,530125', 'mainland', '4');
INSERT INTO `region` VALUES ('530126', '530100', '石林彝族自治县', ',1,530000,530100,530126', 'mainland', '4');
INSERT INTO `region` VALUES ('530127', '530100', '嵩明县', ',1,530000,530100,530127', 'mainland', '4');
INSERT INTO `region` VALUES ('530128', '530100', '禄劝彝族苗族自治县', ',1,530000,530100,530128', 'mainland', '4');
INSERT INTO `region` VALUES ('530129', '530100', '寻甸回族彝族自治县', ',1,530000,530100,530129', 'mainland', '4');
INSERT INTO `region` VALUES ('530181', '530100', '安宁市', ',1,530000,530100,530181', 'mainland', '4');
INSERT INTO `region` VALUES ('530182', '530100', '其它区', ',1,530000,530100,530182', 'mainland', '4');
INSERT INTO `region` VALUES ('530300', '530000', '曲靖市', ',1,530000,530300', 'mainland', '3');
INSERT INTO `region` VALUES ('530302', '530300', '麒麟区', ',1,530000,530300,530302', 'mainland', '4');
INSERT INTO `region` VALUES ('530321', '530300', '马龙县', ',1,530000,530300,530321', 'mainland', '4');
INSERT INTO `region` VALUES ('530322', '530300', '陆良县', ',1,530000,530300,530322', 'mainland', '4');
INSERT INTO `region` VALUES ('530323', '530300', '师宗县', ',1,530000,530300,530323', 'mainland', '4');
INSERT INTO `region` VALUES ('530324', '530300', '罗平县', ',1,530000,530300,530324', 'mainland', '4');
INSERT INTO `region` VALUES ('530325', '530300', '富源县', ',1,530000,530300,530325', 'mainland', '4');
INSERT INTO `region` VALUES ('530326', '530300', '会泽县', ',1,530000,530300,530326', 'mainland', '4');
INSERT INTO `region` VALUES ('530328', '530300', '沾益县', ',1,530000,530300,530328', 'mainland', '4');
INSERT INTO `region` VALUES ('530381', '530300', '宣威市', ',1,530000,530300,530381', 'mainland', '4');
INSERT INTO `region` VALUES ('530382', '530300', '其它区', ',1,530000,530300,530382', 'mainland', '4');
INSERT INTO `region` VALUES ('530400', '530000', '玉溪市', ',1,530000,530400', 'mainland', '3');
INSERT INTO `region` VALUES ('530402', '530400', '红塔区', ',1,530000,530400,530402', 'mainland', '4');
INSERT INTO `region` VALUES ('530421', '530400', '江川县', ',1,530000,530400,530421', 'mainland', '4');
INSERT INTO `region` VALUES ('530422', '530400', '澄江县', ',1,530000,530400,530422', 'mainland', '4');
INSERT INTO `region` VALUES ('530423', '530400', '通海县', ',1,530000,530400,530423', 'mainland', '4');
INSERT INTO `region` VALUES ('530424', '530400', '华宁县', ',1,530000,530400,530424', 'mainland', '4');
INSERT INTO `region` VALUES ('530425', '530400', '易门县', ',1,530000,530400,530425', 'mainland', '4');
INSERT INTO `region` VALUES ('530426', '530400', '峨山彝族自治县', ',1,530000,530400,530426', 'mainland', '4');
INSERT INTO `region` VALUES ('530427', '530400', '新平彝族傣族自治县', ',1,530000,530400,530427', 'mainland', '4');
INSERT INTO `region` VALUES ('530428', '530400', '元江哈尼族彝族傣族自治县', ',1,530000,530400,530428', 'mainland', '4');
INSERT INTO `region` VALUES ('530429', '530400', '其它区', ',1,530000,530400,530429', 'mainland', '4');
INSERT INTO `region` VALUES ('530500', '530000', '保山市', ',1,530000,530500', 'mainland', '3');
INSERT INTO `region` VALUES ('530502', '530500', '隆阳区', ',1,530000,530500,530502', 'mainland', '4');
INSERT INTO `region` VALUES ('530521', '530500', '施甸县', ',1,530000,530500,530521', 'mainland', '4');
INSERT INTO `region` VALUES ('530522', '530500', '腾冲县', ',1,530000,530500,530522', 'mainland', '4');
INSERT INTO `region` VALUES ('530523', '530500', '龙陵县', ',1,530000,530500,530523', 'mainland', '4');
INSERT INTO `region` VALUES ('530524', '530500', '昌宁县', ',1,530000,530500,530524', 'mainland', '4');
INSERT INTO `region` VALUES ('530525', '530500', '其它区', ',1,530000,530500,530525', 'mainland', '4');
INSERT INTO `region` VALUES ('530600', '530000', '昭通市', ',1,530000,530600', 'mainland', '3');
INSERT INTO `region` VALUES ('530602', '530600', '昭阳区', ',1,530000,530600,530602', 'mainland', '4');
INSERT INTO `region` VALUES ('530621', '530600', '鲁甸县', ',1,530000,530600,530621', 'mainland', '4');
INSERT INTO `region` VALUES ('530622', '530600', '巧家县', ',1,530000,530600,530622', 'mainland', '4');
INSERT INTO `region` VALUES ('530623', '530600', '盐津县', ',1,530000,530600,530623', 'mainland', '4');
INSERT INTO `region` VALUES ('530624', '530600', '大关县', ',1,530000,530600,530624', 'mainland', '4');
INSERT INTO `region` VALUES ('530625', '530600', '永善县', ',1,530000,530600,530625', 'mainland', '4');
INSERT INTO `region` VALUES ('530626', '530600', '绥江县', ',1,530000,530600,530626', 'mainland', '4');
INSERT INTO `region` VALUES ('530627', '530600', '镇雄县', ',1,530000,530600,530627', 'mainland', '4');
INSERT INTO `region` VALUES ('530628', '530600', '彝良县', ',1,530000,530600,530628', 'mainland', '4');
INSERT INTO `region` VALUES ('530629', '530600', '威信县', ',1,530000,530600,530629', 'mainland', '4');
INSERT INTO `region` VALUES ('530630', '530600', '水富县', ',1,530000,530600,530630', 'mainland', '4');
INSERT INTO `region` VALUES ('530631', '530600', '其它区', ',1,530000,530600,530631', 'mainland', '4');
INSERT INTO `region` VALUES ('530700', '530000', '丽江市', ',1,530000,530700', 'mainland', '3');
INSERT INTO `region` VALUES ('530702', '530700', '古城区', ',1,530000,530700,530702', 'mainland', '4');
INSERT INTO `region` VALUES ('530721', '530700', '玉龙纳西族自治县', ',1,530000,530700,530721', 'mainland', '4');
INSERT INTO `region` VALUES ('530722', '530700', '永胜县', ',1,530000,530700,530722', 'mainland', '4');
INSERT INTO `region` VALUES ('530723', '530700', '华坪县', ',1,530000,530700,530723', 'mainland', '4');
INSERT INTO `region` VALUES ('530724', '530700', '宁蒗彝族自治县', ',1,530000,530700,530724', 'mainland', '4');
INSERT INTO `region` VALUES ('530725', '530700', '其它区', ',1,530000,530700,530725', 'mainland', '4');
INSERT INTO `region` VALUES ('530800', '530000', '普洱市', ',1,530000,530800', 'mainland', '3');
INSERT INTO `region` VALUES ('530802', '530800', '思茅区', ',1,530000,530800,530802', 'mainland', '4');
INSERT INTO `region` VALUES ('530821', '530800', '宁洱哈尼族彝族自治县', ',1,530000,530800,530821', 'mainland', '4');
INSERT INTO `region` VALUES ('530822', '530800', '墨江哈尼族自治县', ',1,530000,530800,530822', 'mainland', '4');
INSERT INTO `region` VALUES ('530823', '530800', '景东彝族自治县', ',1,530000,530800,530823', 'mainland', '4');
INSERT INTO `region` VALUES ('530824', '530800', '景谷傣族彝族自治县', ',1,530000,530800,530824', 'mainland', '4');
INSERT INTO `region` VALUES ('530825', '530800', '镇沅彝族哈尼族拉祜族自治县', ',1,530000,530800,530825', 'mainland', '4');
INSERT INTO `region` VALUES ('530826', '530800', '江城哈尼族彝族自治县', ',1,530000,530800,530826', 'mainland', '4');
INSERT INTO `region` VALUES ('530827', '530800', '孟连傣族拉祜族佤族自治县', ',1,530000,530800,530827', 'mainland', '4');
INSERT INTO `region` VALUES ('530828', '530800', '澜沧拉祜族自治县', ',1,530000,530800,530828', 'mainland', '4');
INSERT INTO `region` VALUES ('530829', '530800', '西盟佤族自治县', ',1,530000,530800,530829', 'mainland', '4');
INSERT INTO `region` VALUES ('530830', '530800', '其它区', ',1,530000,530800,530830', 'mainland', '4');
INSERT INTO `region` VALUES ('530900', '530000', '临沧市', ',1,530000,530900', 'mainland', '3');
INSERT INTO `region` VALUES ('530902', '530900', '临翔区', ',1,530000,530900,530902', 'mainland', '4');
INSERT INTO `region` VALUES ('530921', '530900', '凤庆县', ',1,530000,530900,530921', 'mainland', '4');
INSERT INTO `region` VALUES ('530922', '530900', '云县', ',1,530000,530900,530922', 'mainland', '4');
INSERT INTO `region` VALUES ('530923', '530900', '永德县', ',1,530000,530900,530923', 'mainland', '4');
INSERT INTO `region` VALUES ('530924', '530900', '镇康县', ',1,530000,530900,530924', 'mainland', '4');
INSERT INTO `region` VALUES ('530925', '530900', '双江拉祜族佤族布朗族傣族自治县', ',1,530000,530900,530925', 'mainland', '4');
INSERT INTO `region` VALUES ('530926', '530900', '耿马傣族佤族自治县', ',1,530000,530900,530926', 'mainland', '4');
INSERT INTO `region` VALUES ('530927', '530900', '沧源佤族自治县', ',1,530000,530900,530927', 'mainland', '4');
INSERT INTO `region` VALUES ('530928', '530900', '其它区', ',1,530000,530900,530928', 'mainland', '4');
INSERT INTO `region` VALUES ('532300', '530000', '楚雄彝族自治州', ',1,530000,532300', 'mainland', '3');
INSERT INTO `region` VALUES ('532301', '532300', '楚雄市', ',1,530000,532300,532301', 'mainland', '4');
INSERT INTO `region` VALUES ('532322', '532300', '双柏县', ',1,530000,532300,532322', 'mainland', '4');
INSERT INTO `region` VALUES ('532323', '532300', '牟定县', ',1,530000,532300,532323', 'mainland', '4');
INSERT INTO `region` VALUES ('532324', '532300', '南华县', ',1,530000,532300,532324', 'mainland', '4');
INSERT INTO `region` VALUES ('532325', '532300', '姚安县', ',1,530000,532300,532325', 'mainland', '4');
INSERT INTO `region` VALUES ('532326', '532300', '大姚县', ',1,530000,532300,532326', 'mainland', '4');
INSERT INTO `region` VALUES ('532327', '532300', '永仁县', ',1,530000,532300,532327', 'mainland', '4');
INSERT INTO `region` VALUES ('532328', '532300', '元谋县', ',1,530000,532300,532328', 'mainland', '4');
INSERT INTO `region` VALUES ('532329', '532300', '武定县', ',1,530000,532300,532329', 'mainland', '4');
INSERT INTO `region` VALUES ('532331', '532300', '禄丰县', ',1,530000,532300,532331', 'mainland', '4');
INSERT INTO `region` VALUES ('532332', '532300', '其它区', ',1,530000,532300,532332', 'mainland', '4');
INSERT INTO `region` VALUES ('532500', '530000', '红河哈尼族彝族自治州', ',1,530000,532500', 'mainland', '3');
INSERT INTO `region` VALUES ('532501', '532500', '个旧市', ',1,530000,532500,532501', 'mainland', '4');
INSERT INTO `region` VALUES ('532502', '532500', '开远市', ',1,530000,532500,532502', 'mainland', '4');
INSERT INTO `region` VALUES ('532522', '532500', '蒙自县', ',1,530000,532500,532522', 'mainland', '4');
INSERT INTO `region` VALUES ('532523', '532500', '屏边苗族自治县', ',1,530000,532500,532523', 'mainland', '4');
INSERT INTO `region` VALUES ('532524', '532500', '建水县', ',1,530000,532500,532524', 'mainland', '4');
INSERT INTO `region` VALUES ('532525', '532500', '石屏县', ',1,530000,532500,532525', 'mainland', '4');
INSERT INTO `region` VALUES ('532526', '532500', '弥勒县', ',1,530000,532500,532526', 'mainland', '4');
INSERT INTO `region` VALUES ('532527', '532500', '泸西县', ',1,530000,532500,532527', 'mainland', '4');
INSERT INTO `region` VALUES ('532528', '532500', '元阳县', ',1,530000,532500,532528', 'mainland', '4');
INSERT INTO `region` VALUES ('532529', '532500', '红河县', ',1,530000,532500,532529', 'mainland', '4');
INSERT INTO `region` VALUES ('532530', '532500', '金平苗族瑶族傣族自治县', ',1,530000,532500,532530', 'mainland', '4');
INSERT INTO `region` VALUES ('532531', '532500', '绿春县', ',1,530000,532500,532531', 'mainland', '4');
INSERT INTO `region` VALUES ('532532', '532500', '河口瑶族自治县', ',1,530000,532500,532532', 'mainland', '4');
INSERT INTO `region` VALUES ('532533', '532500', '其它区', ',1,530000,532500,532533', 'mainland', '4');
INSERT INTO `region` VALUES ('532600', '530000', '文山壮族苗族自治州', ',1,530000,532600', 'mainland', '3');
INSERT INTO `region` VALUES ('532621', '532600', '文山县', ',1,530000,532600,532621', 'mainland', '4');
INSERT INTO `region` VALUES ('532622', '532600', '砚山县', ',1,530000,532600,532622', 'mainland', '4');
INSERT INTO `region` VALUES ('532623', '532600', '西畴县', ',1,530000,532600,532623', 'mainland', '4');
INSERT INTO `region` VALUES ('532624', '532600', '麻栗坡县', ',1,530000,532600,532624', 'mainland', '4');
INSERT INTO `region` VALUES ('532625', '532600', '马关县', ',1,530000,532600,532625', 'mainland', '4');
INSERT INTO `region` VALUES ('532626', '532600', '丘北县', ',1,530000,532600,532626', 'mainland', '4');
INSERT INTO `region` VALUES ('532627', '532600', '广南县', ',1,530000,532600,532627', 'mainland', '4');
INSERT INTO `region` VALUES ('532628', '532600', '富宁县', ',1,530000,532600,532628', 'mainland', '4');
INSERT INTO `region` VALUES ('532629', '532600', '其它区', ',1,530000,532600,532629', 'mainland', '4');
INSERT INTO `region` VALUES ('532800', '530000', '西双版纳傣族自治州', ',1,530000,532800', 'mainland', '3');
INSERT INTO `region` VALUES ('532801', '532800', '景洪市', ',1,530000,532800,532801', 'mainland', '4');
INSERT INTO `region` VALUES ('532822', '532800', '勐海县', ',1,530000,532800,532822', 'mainland', '4');
INSERT INTO `region` VALUES ('532823', '532800', '勐腊县', ',1,530000,532800,532823', 'mainland', '4');
INSERT INTO `region` VALUES ('532824', '532800', '其它区', ',1,530000,532800,532824', 'mainland', '4');
INSERT INTO `region` VALUES ('532900', '530000', '大理白族自治州', ',1,530000,532900', 'mainland', '3');
INSERT INTO `region` VALUES ('532901', '532900', '大理市', ',1,530000,532900,532901', 'mainland', '4');
INSERT INTO `region` VALUES ('532922', '532900', '漾濞彝族自治县', ',1,530000,532900,532922', 'mainland', '4');
INSERT INTO `region` VALUES ('532923', '532900', '祥云县', ',1,530000,532900,532923', 'mainland', '4');
INSERT INTO `region` VALUES ('532924', '532900', '宾川县', ',1,530000,532900,532924', 'mainland', '4');
INSERT INTO `region` VALUES ('532925', '532900', '弥渡县', ',1,530000,532900,532925', 'mainland', '4');
INSERT INTO `region` VALUES ('532926', '532900', '南涧彝族自治县', ',1,530000,532900,532926', 'mainland', '4');
INSERT INTO `region` VALUES ('532927', '532900', '巍山彝族回族自治县', ',1,530000,532900,532927', 'mainland', '4');
INSERT INTO `region` VALUES ('532928', '532900', '永平县', ',1,530000,532900,532928', 'mainland', '4');
INSERT INTO `region` VALUES ('532929', '532900', '云龙县', ',1,530000,532900,532929', 'mainland', '4');
INSERT INTO `region` VALUES ('532930', '532900', '洱源县', ',1,530000,532900,532930', 'mainland', '4');
INSERT INTO `region` VALUES ('532931', '532900', '剑川县', ',1,530000,532900,532931', 'mainland', '4');
INSERT INTO `region` VALUES ('532932', '532900', '鹤庆县', ',1,530000,532900,532932', 'mainland', '4');
INSERT INTO `region` VALUES ('532933', '532900', '其它区', ',1,530000,532900,532933', 'mainland', '4');
INSERT INTO `region` VALUES ('533100', '530000', '德宏傣族景颇族自治州', ',1,530000,533100', 'mainland', '3');
INSERT INTO `region` VALUES ('533102', '533100', '瑞丽市', ',1,530000,533100,533102', 'mainland', '4');
INSERT INTO `region` VALUES ('533103', '533100', '潞西市', ',1,530000,533100,533103', 'mainland', '4');
INSERT INTO `region` VALUES ('533122', '533100', '梁河县', ',1,530000,533100,533122', 'mainland', '4');
INSERT INTO `region` VALUES ('533123', '533100', '盈江县', ',1,530000,533100,533123', 'mainland', '4');
INSERT INTO `region` VALUES ('533124', '533100', '陇川县', ',1,530000,533100,533124', 'mainland', '4');
INSERT INTO `region` VALUES ('533125', '533100', '其它区', ',1,530000,533100,533125', 'mainland', '4');
INSERT INTO `region` VALUES ('533300', '530000', '怒江傈僳族自治州', ',1,530000,533300', 'mainland', '3');
INSERT INTO `region` VALUES ('533321', '533300', '泸水县', ',1,530000,533300,533321', 'mainland', '4');
INSERT INTO `region` VALUES ('533323', '533300', '福贡县', ',1,530000,533300,533323', 'mainland', '4');
INSERT INTO `region` VALUES ('533324', '533300', '贡山独龙族怒族自治县', ',1,530000,533300,533324', 'mainland', '4');
INSERT INTO `region` VALUES ('533325', '533300', '兰坪白族普米族自治县', ',1,530000,533300,533325', 'mainland', '4');
INSERT INTO `region` VALUES ('533326', '533300', '其它区', ',1,530000,533300,533326', 'mainland', '4');
INSERT INTO `region` VALUES ('533400', '530000', '迪庆藏族自治州', ',1,530000,533400', 'mainland', '3');
INSERT INTO `region` VALUES ('533421', '533400', '香格里拉县', ',1,530000,533400,533421', 'mainland', '4');
INSERT INTO `region` VALUES ('533422', '533400', '德钦县', ',1,530000,533400,533422', 'mainland', '4');
INSERT INTO `region` VALUES ('533423', '533400', '维西傈僳族自治县', ',1,530000,533400,533423', 'mainland', '4');
INSERT INTO `region` VALUES ('533424', '533400', '其它区', ',1,530000,533400,533424', 'mainland', '4');
INSERT INTO `region` VALUES ('540000', '1', '西藏自治区', ',1,540000', 'mainland', '2');
INSERT INTO `region` VALUES ('540100', '540000', '拉萨市', ',1,540000,540100', 'mainland', '3');
INSERT INTO `region` VALUES ('540102', '540100', '城关区', ',1,540000,540100,540102', 'mainland', '4');
INSERT INTO `region` VALUES ('540121', '540100', '林周县', ',1,540000,540100,540121', 'mainland', '4');
INSERT INTO `region` VALUES ('540122', '540100', '当雄县', ',1,540000,540100,540122', 'mainland', '4');
INSERT INTO `region` VALUES ('540123', '540100', '尼木县', ',1,540000,540100,540123', 'mainland', '4');
INSERT INTO `region` VALUES ('540124', '540100', '曲水县', ',1,540000,540100,540124', 'mainland', '4');
INSERT INTO `region` VALUES ('540125', '540100', '堆龙德庆县', ',1,540000,540100,540125', 'mainland', '4');
INSERT INTO `region` VALUES ('540126', '540100', '达孜县', ',1,540000,540100,540126', 'mainland', '4');
INSERT INTO `region` VALUES ('540127', '540100', '墨竹工卡县', ',1,540000,540100,540127', 'mainland', '4');
INSERT INTO `region` VALUES ('540128', '540100', '其它区', ',1,540000,540100,540128', 'mainland', '4');
INSERT INTO `region` VALUES ('542100', '540000', '昌都地区', ',1,540000,542100', 'mainland', '3');
INSERT INTO `region` VALUES ('542121', '542100', '昌都县', ',1,540000,542100,542121', 'mainland', '4');
INSERT INTO `region` VALUES ('542122', '542100', '江达县', ',1,540000,542100,542122', 'mainland', '4');
INSERT INTO `region` VALUES ('542123', '542100', '贡觉县', ',1,540000,542100,542123', 'mainland', '4');
INSERT INTO `region` VALUES ('542124', '542100', '类乌齐县', ',1,540000,542100,542124', 'mainland', '4');
INSERT INTO `region` VALUES ('542125', '542100', '丁青县', ',1,540000,542100,542125', 'mainland', '4');
INSERT INTO `region` VALUES ('542126', '542100', '察雅县', ',1,540000,542100,542126', 'mainland', '4');
INSERT INTO `region` VALUES ('542127', '542100', '八宿县', ',1,540000,542100,542127', 'mainland', '4');
INSERT INTO `region` VALUES ('542128', '542100', '左贡县', ',1,540000,542100,542128', 'mainland', '4');
INSERT INTO `region` VALUES ('542129', '542100', '芒康县', ',1,540000,542100,542129', 'mainland', '4');
INSERT INTO `region` VALUES ('542132', '542100', '洛隆县', ',1,540000,542100,542132', 'mainland', '4');
INSERT INTO `region` VALUES ('542133', '542100', '边坝县', ',1,540000,542100,542133', 'mainland', '4');
INSERT INTO `region` VALUES ('542134', '542100', '其它区', ',1,540000,542100,542134', 'mainland', '4');
INSERT INTO `region` VALUES ('542200', '540000', '山南地区', ',1,540000,542200', 'mainland', '3');
INSERT INTO `region` VALUES ('542221', '542200', '乃东县', ',1,540000,542200,542221', 'mainland', '4');
INSERT INTO `region` VALUES ('542222', '542200', '扎囊县', ',1,540000,542200,542222', 'mainland', '4');
INSERT INTO `region` VALUES ('542223', '542200', '贡嘎县', ',1,540000,542200,542223', 'mainland', '4');
INSERT INTO `region` VALUES ('542224', '542200', '桑日县', ',1,540000,542200,542224', 'mainland', '4');
INSERT INTO `region` VALUES ('542225', '542200', '琼结县', ',1,540000,542200,542225', 'mainland', '4');
INSERT INTO `region` VALUES ('542226', '542200', '曲松县', ',1,540000,542200,542226', 'mainland', '4');
INSERT INTO `region` VALUES ('542227', '542200', '措美县', ',1,540000,542200,542227', 'mainland', '4');
INSERT INTO `region` VALUES ('542228', '542200', '洛扎县', ',1,540000,542200,542228', 'mainland', '4');
INSERT INTO `region` VALUES ('542229', '542200', '加查县', ',1,540000,542200,542229', 'mainland', '4');
INSERT INTO `region` VALUES ('542231', '542200', '隆子县', ',1,540000,542200,542231', 'mainland', '4');
INSERT INTO `region` VALUES ('542232', '542200', '错那县', ',1,540000,542200,542232', 'mainland', '4');
INSERT INTO `region` VALUES ('542233', '542200', '浪卡子县', ',1,540000,542200,542233', 'mainland', '4');
INSERT INTO `region` VALUES ('542234', '542200', '其它区', ',1,540000,542200,542234', 'mainland', '4');
INSERT INTO `region` VALUES ('542300', '540000', '日喀则地区', ',1,540000,542300', 'mainland', '3');
INSERT INTO `region` VALUES ('542301', '542300', '日喀则市', ',1,540000,542300,542301', 'mainland', '4');
INSERT INTO `region` VALUES ('542322', '542300', '南木林县', ',1,540000,542300,542322', 'mainland', '4');
INSERT INTO `region` VALUES ('542323', '542300', '江孜县', ',1,540000,542300,542323', 'mainland', '4');
INSERT INTO `region` VALUES ('542324', '542300', '定日县', ',1,540000,542300,542324', 'mainland', '4');
INSERT INTO `region` VALUES ('542325', '542300', '萨迦县', ',1,540000,542300,542325', 'mainland', '4');
INSERT INTO `region` VALUES ('542326', '542300', '拉孜县', ',1,540000,542300,542326', 'mainland', '4');
INSERT INTO `region` VALUES ('542327', '542300', '昂仁县', ',1,540000,542300,542327', 'mainland', '4');
INSERT INTO `region` VALUES ('542328', '542300', '谢通门县', ',1,540000,542300,542328', 'mainland', '4');
INSERT INTO `region` VALUES ('542329', '542300', '白朗县', ',1,540000,542300,542329', 'mainland', '4');
INSERT INTO `region` VALUES ('542330', '542300', '仁布县', ',1,540000,542300,542330', 'mainland', '4');
INSERT INTO `region` VALUES ('542331', '542300', '康马县', ',1,540000,542300,542331', 'mainland', '4');
INSERT INTO `region` VALUES ('542332', '542300', '定结县', ',1,540000,542300,542332', 'mainland', '4');
INSERT INTO `region` VALUES ('542333', '542300', '仲巴县', ',1,540000,542300,542333', 'mainland', '4');
INSERT INTO `region` VALUES ('542334', '542300', '亚东县', ',1,540000,542300,542334', 'mainland', '4');
INSERT INTO `region` VALUES ('542335', '542300', '吉隆县', ',1,540000,542300,542335', 'mainland', '4');
INSERT INTO `region` VALUES ('542336', '542300', '聂拉木县', ',1,540000,542300,542336', 'mainland', '4');
INSERT INTO `region` VALUES ('542337', '542300', '萨嘎县', ',1,540000,542300,542337', 'mainland', '4');
INSERT INTO `region` VALUES ('542338', '542300', '岗巴县', ',1,540000,542300,542338', 'mainland', '4');
INSERT INTO `region` VALUES ('542339', '542300', '其它区', ',1,540000,542300,542339', 'mainland', '4');
INSERT INTO `region` VALUES ('542400', '540000', '那曲地区', ',1,540000,542400', 'mainland', '3');
INSERT INTO `region` VALUES ('542421', '542400', '那曲县', ',1,540000,542400,542421', 'mainland', '4');
INSERT INTO `region` VALUES ('542422', '542400', '嘉黎县', ',1,540000,542400,542422', 'mainland', '4');
INSERT INTO `region` VALUES ('542423', '542400', '比如县', ',1,540000,542400,542423', 'mainland', '4');
INSERT INTO `region` VALUES ('542424', '542400', '聂荣县', ',1,540000,542400,542424', 'mainland', '4');
INSERT INTO `region` VALUES ('542425', '542400', '安多县', ',1,540000,542400,542425', 'mainland', '4');
INSERT INTO `region` VALUES ('542426', '542400', '申扎县', ',1,540000,542400,542426', 'mainland', '4');
INSERT INTO `region` VALUES ('542427', '542400', '索县', ',1,540000,542400,542427', 'mainland', '4');
INSERT INTO `region` VALUES ('542428', '542400', '班戈县', ',1,540000,542400,542428', 'mainland', '4');
INSERT INTO `region` VALUES ('542429', '542400', '巴青县', ',1,540000,542400,542429', 'mainland', '4');
INSERT INTO `region` VALUES ('542430', '542400', '尼玛县', ',1,540000,542400,542430', 'mainland', '4');
INSERT INTO `region` VALUES ('542431', '542400', '其它区', ',1,540000,542400,542431', 'mainland', '4');
INSERT INTO `region` VALUES ('542500', '540000', '阿里地区', ',1,540000,542500', 'mainland', '3');
INSERT INTO `region` VALUES ('542521', '542500', '普兰县', ',1,540000,542500,542521', 'mainland', '4');
INSERT INTO `region` VALUES ('542522', '542500', '札达县', ',1,540000,542500,542522', 'mainland', '4');
INSERT INTO `region` VALUES ('542523', '542500', '噶尔县', ',1,540000,542500,542523', 'mainland', '4');
INSERT INTO `region` VALUES ('542524', '542500', '日土县', ',1,540000,542500,542524', 'mainland', '4');
INSERT INTO `region` VALUES ('542525', '542500', '革吉县', ',1,540000,542500,542525', 'mainland', '4');
INSERT INTO `region` VALUES ('542526', '542500', '改则县', ',1,540000,542500,542526', 'mainland', '4');
INSERT INTO `region` VALUES ('542527', '542500', '措勤县', ',1,540000,542500,542527', 'mainland', '4');
INSERT INTO `region` VALUES ('542528', '542500', '其它区', ',1,540000,542500,542528', 'mainland', '4');
INSERT INTO `region` VALUES ('542600', '540000', '林芝地区', ',1,540000,542600', 'mainland', '3');
INSERT INTO `region` VALUES ('542621', '542600', '林芝县', ',1,540000,542600,542621', 'mainland', '4');
INSERT INTO `region` VALUES ('542622', '542600', '工布江达县', ',1,540000,542600,542622', 'mainland', '4');
INSERT INTO `region` VALUES ('542623', '542600', '米林县', ',1,540000,542600,542623', 'mainland', '4');
INSERT INTO `region` VALUES ('542624', '542600', '墨脱县', ',1,540000,542600,542624', 'mainland', '4');
INSERT INTO `region` VALUES ('542625', '542600', '波密县', ',1,540000,542600,542625', 'mainland', '4');
INSERT INTO `region` VALUES ('542626', '542600', '察隅县', ',1,540000,542600,542626', 'mainland', '4');
INSERT INTO `region` VALUES ('542627', '542600', '朗县', ',1,540000,542600,542627', 'mainland', '4');
INSERT INTO `region` VALUES ('542628', '542600', '其它区', ',1,540000,542600,542628', 'mainland', '4');
INSERT INTO `region` VALUES ('610000', '1', '陕西省', ',1,610000', 'mainland', '2');
INSERT INTO `region` VALUES ('610100', '610000', '西安市', ',1,610000,610100', 'mainland', '3');
INSERT INTO `region` VALUES ('610102', '610100', '新城区', ',1,610000,610100,610102', 'mainland', '4');
INSERT INTO `region` VALUES ('610103', '610100', '碑林区', ',1,610000,610100,610103', 'mainland', '4');
INSERT INTO `region` VALUES ('610104', '610100', '莲湖区', ',1,610000,610100,610104', 'mainland', '4');
INSERT INTO `region` VALUES ('610111', '610100', '灞桥区', ',1,610000,610100,610111', 'mainland', '4');
INSERT INTO `region` VALUES ('610112', '610100', '未央区', ',1,610000,610100,610112', 'mainland', '4');
INSERT INTO `region` VALUES ('610113', '610100', '雁塔区', ',1,610000,610100,610113', 'mainland', '4');
INSERT INTO `region` VALUES ('610114', '610100', '阎良区', ',1,610000,610100,610114', 'mainland', '4');
INSERT INTO `region` VALUES ('610115', '610100', '临潼区', ',1,610000,610100,610115', 'mainland', '4');
INSERT INTO `region` VALUES ('610116', '610100', '长安区', ',1,610000,610100,610116', 'mainland', '4');
INSERT INTO `region` VALUES ('610122', '610100', '蓝田县', ',1,610000,610100,610122', 'mainland', '4');
INSERT INTO `region` VALUES ('610124', '610100', '周至县', ',1,610000,610100,610124', 'mainland', '4');
INSERT INTO `region` VALUES ('610125', '610100', '户县', ',1,610000,610100,610125', 'mainland', '4');
INSERT INTO `region` VALUES ('610126', '610100', '高陵县', ',1,610000,610100,610126', 'mainland', '4');
INSERT INTO `region` VALUES ('610127', '610100', '其它区', ',1,610000,610100,610127', 'mainland', '4');
INSERT INTO `region` VALUES ('610200', '610000', '铜川市', ',1,610000,610200', 'mainland', '3');
INSERT INTO `region` VALUES ('610202', '610200', '王益区', ',1,610000,610200,610202', 'mainland', '4');
INSERT INTO `region` VALUES ('610203', '610200', '印台区', ',1,610000,610200,610203', 'mainland', '4');
INSERT INTO `region` VALUES ('610204', '610200', '耀州区', ',1,610000,610200,610204', 'mainland', '4');
INSERT INTO `region` VALUES ('610222', '610200', '宜君县', ',1,610000,610200,610222', 'mainland', '4');
INSERT INTO `region` VALUES ('610223', '610200', '其它区', ',1,610000,610200,610223', 'mainland', '4');
INSERT INTO `region` VALUES ('610300', '610000', '宝鸡市', ',1,610000,610300', 'mainland', '3');
INSERT INTO `region` VALUES ('610302', '610300', '渭滨区', ',1,610000,610300,610302', 'mainland', '4');
INSERT INTO `region` VALUES ('610303', '610300', '金台区', ',1,610000,610300,610303', 'mainland', '4');
INSERT INTO `region` VALUES ('610304', '610300', '陈仓区', ',1,610000,610300,610304', 'mainland', '4');
INSERT INTO `region` VALUES ('610322', '610300', '凤翔县', ',1,610000,610300,610322', 'mainland', '4');
INSERT INTO `region` VALUES ('610323', '610300', '岐山县', ',1,610000,610300,610323', 'mainland', '4');
INSERT INTO `region` VALUES ('610324', '610300', '扶风县', ',1,610000,610300,610324', 'mainland', '4');
INSERT INTO `region` VALUES ('610326', '610300', '眉县', ',1,610000,610300,610326', 'mainland', '4');
INSERT INTO `region` VALUES ('610327', '610300', '陇县', ',1,610000,610300,610327', 'mainland', '4');
INSERT INTO `region` VALUES ('610328', '610300', '千阳县', ',1,610000,610300,610328', 'mainland', '4');
INSERT INTO `region` VALUES ('610329', '610300', '麟游县', ',1,610000,610300,610329', 'mainland', '4');
INSERT INTO `region` VALUES ('610330', '610300', '凤县', ',1,610000,610300,610330', 'mainland', '4');
INSERT INTO `region` VALUES ('610331', '610300', '太白县', ',1,610000,610300,610331', 'mainland', '4');
INSERT INTO `region` VALUES ('610332', '610300', '其它区', ',1,610000,610300,610332', 'mainland', '4');
INSERT INTO `region` VALUES ('610400', '610000', '咸阳市', ',1,610000,610400', 'mainland', '3');
INSERT INTO `region` VALUES ('610402', '610400', '秦都区', ',1,610000,610400,610402', 'mainland', '4');
INSERT INTO `region` VALUES ('610403', '610400', '杨凌区', ',1,610000,610400,610403', 'mainland', '4');
INSERT INTO `region` VALUES ('610404', '610400', '渭城区', ',1,610000,610400,610404', 'mainland', '4');
INSERT INTO `region` VALUES ('610422', '610400', '三原县', ',1,610000,610400,610422', 'mainland', '4');
INSERT INTO `region` VALUES ('610423', '610400', '泾阳县', ',1,610000,610400,610423', 'mainland', '4');
INSERT INTO `region` VALUES ('610424', '610400', '乾县', ',1,610000,610400,610424', 'mainland', '4');
INSERT INTO `region` VALUES ('610425', '610400', '礼泉县', ',1,610000,610400,610425', 'mainland', '4');
INSERT INTO `region` VALUES ('610426', '610400', '永寿县', ',1,610000,610400,610426', 'mainland', '4');
INSERT INTO `region` VALUES ('610427', '610400', '彬县', ',1,610000,610400,610427', 'mainland', '4');
INSERT INTO `region` VALUES ('610428', '610400', '长武县', ',1,610000,610400,610428', 'mainland', '4');
INSERT INTO `region` VALUES ('610429', '610400', '旬邑县', ',1,610000,610400,610429', 'mainland', '4');
INSERT INTO `region` VALUES ('610430', '610400', '淳化县', ',1,610000,610400,610430', 'mainland', '4');
INSERT INTO `region` VALUES ('610431', '610400', '武功县', ',1,610000,610400,610431', 'mainland', '4');
INSERT INTO `region` VALUES ('610481', '610400', '兴平市', ',1,610000,610400,610481', 'mainland', '4');
INSERT INTO `region` VALUES ('610482', '610400', '其它区', ',1,610000,610400,610482', 'mainland', '4');
INSERT INTO `region` VALUES ('610500', '610000', '渭南市', ',1,610000,610500', 'mainland', '3');
INSERT INTO `region` VALUES ('610502', '610500', '临渭区', ',1,610000,610500,610502', 'mainland', '4');
INSERT INTO `region` VALUES ('610521', '610500', '华县', ',1,610000,610500,610521', 'mainland', '4');
INSERT INTO `region` VALUES ('610522', '610500', '潼关县', ',1,610000,610500,610522', 'mainland', '4');
INSERT INTO `region` VALUES ('610523', '610500', '大荔县', ',1,610000,610500,610523', 'mainland', '4');
INSERT INTO `region` VALUES ('610524', '610500', '合阳县', ',1,610000,610500,610524', 'mainland', '4');
INSERT INTO `region` VALUES ('610525', '610500', '澄城县', ',1,610000,610500,610525', 'mainland', '4');
INSERT INTO `region` VALUES ('610526', '610500', '蒲城县', ',1,610000,610500,610526', 'mainland', '4');
INSERT INTO `region` VALUES ('610527', '610500', '白水县', ',1,610000,610500,610527', 'mainland', '4');
INSERT INTO `region` VALUES ('610528', '610500', '富平县', ',1,610000,610500,610528', 'mainland', '4');
INSERT INTO `region` VALUES ('610581', '610500', '韩城市', ',1,610000,610500,610581', 'mainland', '4');
INSERT INTO `region` VALUES ('610582', '610500', '华阴市', ',1,610000,610500,610582', 'mainland', '4');
INSERT INTO `region` VALUES ('610583', '610500', '其它区', ',1,610000,610500,610583', 'mainland', '4');
INSERT INTO `region` VALUES ('610600', '610000', '延安市', ',1,610000,610600', 'mainland', '3');
INSERT INTO `region` VALUES ('610602', '610600', '宝塔区', ',1,610000,610600,610602', 'mainland', '4');
INSERT INTO `region` VALUES ('610621', '610600', '延长县', ',1,610000,610600,610621', 'mainland', '4');
INSERT INTO `region` VALUES ('610622', '610600', '延川县', ',1,610000,610600,610622', 'mainland', '4');
INSERT INTO `region` VALUES ('610623', '610600', '子长县', ',1,610000,610600,610623', 'mainland', '4');
INSERT INTO `region` VALUES ('610624', '610600', '安塞县', ',1,610000,610600,610624', 'mainland', '4');
INSERT INTO `region` VALUES ('610625', '610600', '志丹县', ',1,610000,610600,610625', 'mainland', '4');
INSERT INTO `region` VALUES ('610626', '610600', '吴起县', ',1,610000,610600,610626', 'mainland', '4');
INSERT INTO `region` VALUES ('610627', '610600', '甘泉县', ',1,610000,610600,610627', 'mainland', '4');
INSERT INTO `region` VALUES ('610628', '610600', '富县', ',1,610000,610600,610628', 'mainland', '4');
INSERT INTO `region` VALUES ('610629', '610600', '洛川县', ',1,610000,610600,610629', 'mainland', '4');
INSERT INTO `region` VALUES ('610630', '610600', '宜川县', ',1,610000,610600,610630', 'mainland', '4');
INSERT INTO `region` VALUES ('610631', '610600', '黄龙县', ',1,610000,610600,610631', 'mainland', '4');
INSERT INTO `region` VALUES ('610632', '610600', '黄陵县', ',1,610000,610600,610632', 'mainland', '4');
INSERT INTO `region` VALUES ('610633', '610600', '其它区', ',1,610000,610600,610633', 'mainland', '4');
INSERT INTO `region` VALUES ('610700', '610000', '汉中市', ',1,610000,610700', 'mainland', '3');
INSERT INTO `region` VALUES ('610702', '610700', '汉台区', ',1,610000,610700,610702', 'mainland', '4');
INSERT INTO `region` VALUES ('610721', '610700', '南郑县', ',1,610000,610700,610721', 'mainland', '4');
INSERT INTO `region` VALUES ('610722', '610700', '城固县', ',1,610000,610700,610722', 'mainland', '4');
INSERT INTO `region` VALUES ('610723', '610700', '洋县', ',1,610000,610700,610723', 'mainland', '4');
INSERT INTO `region` VALUES ('610724', '610700', '西乡县', ',1,610000,610700,610724', 'mainland', '4');
INSERT INTO `region` VALUES ('610725', '610700', '勉县', ',1,610000,610700,610725', 'mainland', '4');
INSERT INTO `region` VALUES ('610726', '610700', '宁强县', ',1,610000,610700,610726', 'mainland', '4');
INSERT INTO `region` VALUES ('610727', '610700', '略阳县', ',1,610000,610700,610727', 'mainland', '4');
INSERT INTO `region` VALUES ('610728', '610700', '镇巴县', ',1,610000,610700,610728', 'mainland', '4');
INSERT INTO `region` VALUES ('610729', '610700', '留坝县', ',1,610000,610700,610729', 'mainland', '4');
INSERT INTO `region` VALUES ('610730', '610700', '佛坪县', ',1,610000,610700,610730', 'mainland', '4');
INSERT INTO `region` VALUES ('610731', '610700', '其它区', ',1,610000,610700,610731', 'mainland', '4');
INSERT INTO `region` VALUES ('610800', '610000', '榆林市', ',1,610000,610800', 'mainland', '3');
INSERT INTO `region` VALUES ('610802', '610800', '榆阳区', ',1,610000,610800,610802', 'mainland', '4');
INSERT INTO `region` VALUES ('610821', '610800', '神木县', ',1,610000,610800,610821', 'mainland', '4');
INSERT INTO `region` VALUES ('610822', '610800', '府谷县', ',1,610000,610800,610822', 'mainland', '4');
INSERT INTO `region` VALUES ('610823', '610800', '横山县', ',1,610000,610800,610823', 'mainland', '4');
INSERT INTO `region` VALUES ('610824', '610800', '靖边县', ',1,610000,610800,610824', 'mainland', '4');
INSERT INTO `region` VALUES ('610825', '610800', '定边县', ',1,610000,610800,610825', 'mainland', '4');
INSERT INTO `region` VALUES ('610826', '610800', '绥德县', ',1,610000,610800,610826', 'mainland', '4');
INSERT INTO `region` VALUES ('610827', '610800', '米脂县', ',1,610000,610800,610827', 'mainland', '4');
INSERT INTO `region` VALUES ('610828', '610800', '佳县', ',1,610000,610800,610828', 'mainland', '4');
INSERT INTO `region` VALUES ('610829', '610800', '吴堡县', ',1,610000,610800,610829', 'mainland', '4');
INSERT INTO `region` VALUES ('610830', '610800', '清涧县', ',1,610000,610800,610830', 'mainland', '4');
INSERT INTO `region` VALUES ('610831', '610800', '子洲县', ',1,610000,610800,610831', 'mainland', '4');
INSERT INTO `region` VALUES ('610832', '610800', '其它区', ',1,610000,610800,610832', 'mainland', '4');
INSERT INTO `region` VALUES ('610900', '610000', '安康市', ',1,610000,610900', 'mainland', '3');
INSERT INTO `region` VALUES ('610902', '610900', '汉滨区', ',1,610000,610900,610902', 'mainland', '4');
INSERT INTO `region` VALUES ('610921', '610900', '汉阴县', ',1,610000,610900,610921', 'mainland', '4');
INSERT INTO `region` VALUES ('610922', '610900', '石泉县', ',1,610000,610900,610922', 'mainland', '4');
INSERT INTO `region` VALUES ('610923', '610900', '宁陕县', ',1,610000,610900,610923', 'mainland', '4');
INSERT INTO `region` VALUES ('610924', '610900', '紫阳县', ',1,610000,610900,610924', 'mainland', '4');
INSERT INTO `region` VALUES ('610925', '610900', '岚皋县', ',1,610000,610900,610925', 'mainland', '4');
INSERT INTO `region` VALUES ('610926', '610900', '平利县', ',1,610000,610900,610926', 'mainland', '4');
INSERT INTO `region` VALUES ('610927', '610900', '镇坪县', ',1,610000,610900,610927', 'mainland', '4');
INSERT INTO `region` VALUES ('610928', '610900', '旬阳县', ',1,610000,610900,610928', 'mainland', '4');
INSERT INTO `region` VALUES ('610929', '610900', '白河县', ',1,610000,610900,610929', 'mainland', '4');
INSERT INTO `region` VALUES ('610930', '610900', '其它区', ',1,610000,610900,610930', 'mainland', '4');
INSERT INTO `region` VALUES ('611000', '610000', '商洛市', ',1,610000,611000', 'mainland', '3');
INSERT INTO `region` VALUES ('611002', '611000', '商州区', ',1,610000,611000,611002', 'mainland', '4');
INSERT INTO `region` VALUES ('611021', '611000', '洛南县', ',1,610000,611000,611021', 'mainland', '4');
INSERT INTO `region` VALUES ('611022', '611000', '丹凤县', ',1,610000,611000,611022', 'mainland', '4');
INSERT INTO `region` VALUES ('611023', '611000', '商南县', ',1,610000,611000,611023', 'mainland', '4');
INSERT INTO `region` VALUES ('611024', '611000', '山阳县', ',1,610000,611000,611024', 'mainland', '4');
INSERT INTO `region` VALUES ('611025', '611000', '镇安县', ',1,610000,611000,611025', 'mainland', '4');
INSERT INTO `region` VALUES ('611026', '611000', '柞水县', ',1,610000,611000,611026', 'mainland', '4');
INSERT INTO `region` VALUES ('611027', '611000', '其它区', ',1,610000,611000,611027', 'mainland', '4');
INSERT INTO `region` VALUES ('620000', '1', '甘肃省', ',1,620000', 'mainland', '2');
INSERT INTO `region` VALUES ('620100', '620000', '兰州市', ',1,620000,620100', 'mainland', '3');
INSERT INTO `region` VALUES ('620102', '620100', '城关区', ',1,620000,620100,620102', 'mainland', '4');
INSERT INTO `region` VALUES ('620103', '620100', '七里河区', ',1,620000,620100,620103', 'mainland', '4');
INSERT INTO `region` VALUES ('620104', '620100', '西固区', ',1,620000,620100,620104', 'mainland', '4');
INSERT INTO `region` VALUES ('620105', '620100', '安宁区', ',1,620000,620100,620105', 'mainland', '4');
INSERT INTO `region` VALUES ('620111', '620100', '红古区', ',1,620000,620100,620111', 'mainland', '4');
INSERT INTO `region` VALUES ('620121', '620100', '永登县', ',1,620000,620100,620121', 'mainland', '4');
INSERT INTO `region` VALUES ('620122', '620100', '皋兰县', ',1,620000,620100,620122', 'mainland', '4');
INSERT INTO `region` VALUES ('620123', '620100', '榆中县', ',1,620000,620100,620123', 'mainland', '4');
INSERT INTO `region` VALUES ('620124', '620100', '其它区', ',1,620000,620100,620124', 'mainland', '4');
INSERT INTO `region` VALUES ('620200', '620000', '嘉峪关市', ',1,620000,620200', 'mainland', '3');
INSERT INTO `region` VALUES ('620300', '620000', '金昌市', ',1,620000,620300', 'mainland', '3');
INSERT INTO `region` VALUES ('620302', '620300', '金川区', ',1,620000,620300,620302', 'mainland', '4');
INSERT INTO `region` VALUES ('620321', '620300', '永昌县', ',1,620000,620300,620321', 'mainland', '4');
INSERT INTO `region` VALUES ('620322', '620300', '其它区', ',1,620000,620300,620322', 'mainland', '4');
INSERT INTO `region` VALUES ('620400', '620000', '白银市', ',1,620000,620400', 'mainland', '3');
INSERT INTO `region` VALUES ('620402', '620400', '白银区', ',1,620000,620400,620402', 'mainland', '4');
INSERT INTO `region` VALUES ('620403', '620400', '平川区', ',1,620000,620400,620403', 'mainland', '4');
INSERT INTO `region` VALUES ('620421', '620400', '靖远县', ',1,620000,620400,620421', 'mainland', '4');
INSERT INTO `region` VALUES ('620422', '620400', '会宁县', ',1,620000,620400,620422', 'mainland', '4');
INSERT INTO `region` VALUES ('620423', '620400', '景泰县', ',1,620000,620400,620423', 'mainland', '4');
INSERT INTO `region` VALUES ('620424', '620400', '其它区', ',1,620000,620400,620424', 'mainland', '4');
INSERT INTO `region` VALUES ('620500', '620000', '天水市', ',1,620000,620500', 'mainland', '3');
INSERT INTO `region` VALUES ('620502', '620500', '秦州区', ',1,620000,620500,620502', 'mainland', '4');
INSERT INTO `region` VALUES ('620503', '620500', '麦积区', ',1,620000,620500,620503', 'mainland', '4');
INSERT INTO `region` VALUES ('620521', '620500', '清水县', ',1,620000,620500,620521', 'mainland', '4');
INSERT INTO `region` VALUES ('620522', '620500', '秦安县', ',1,620000,620500,620522', 'mainland', '4');
INSERT INTO `region` VALUES ('620523', '620500', '甘谷县', ',1,620000,620500,620523', 'mainland', '4');
INSERT INTO `region` VALUES ('620524', '620500', '武山县', ',1,620000,620500,620524', 'mainland', '4');
INSERT INTO `region` VALUES ('620525', '620500', '张家川回族自治县', ',1,620000,620500,620525', 'mainland', '4');
INSERT INTO `region` VALUES ('620526', '620500', '其它区', ',1,620000,620500,620526', 'mainland', '4');
INSERT INTO `region` VALUES ('620600', '620000', '武威市', ',1,620000,620600', 'mainland', '3');
INSERT INTO `region` VALUES ('620602', '620600', '凉州区', ',1,620000,620600,620602', 'mainland', '4');
INSERT INTO `region` VALUES ('620621', '620600', '民勤县', ',1,620000,620600,620621', 'mainland', '4');
INSERT INTO `region` VALUES ('620622', '620600', '古浪县', ',1,620000,620600,620622', 'mainland', '4');
INSERT INTO `region` VALUES ('620623', '620600', '天祝藏族自治县', ',1,620000,620600,620623', 'mainland', '4');
INSERT INTO `region` VALUES ('620624', '620600', '其它区', ',1,620000,620600,620624', 'mainland', '4');
INSERT INTO `region` VALUES ('620700', '620000', '张掖市', ',1,620000,620700', 'mainland', '3');
INSERT INTO `region` VALUES ('620702', '620700', '甘州区', ',1,620000,620700,620702', 'mainland', '4');
INSERT INTO `region` VALUES ('620721', '620700', '肃南裕固族自治县', ',1,620000,620700,620721', 'mainland', '4');
INSERT INTO `region` VALUES ('620722', '620700', '民乐县', ',1,620000,620700,620722', 'mainland', '4');
INSERT INTO `region` VALUES ('620723', '620700', '临泽县', ',1,620000,620700,620723', 'mainland', '4');
INSERT INTO `region` VALUES ('620724', '620700', '高台县', ',1,620000,620700,620724', 'mainland', '4');
INSERT INTO `region` VALUES ('620725', '620700', '山丹县', ',1,620000,620700,620725', 'mainland', '4');
INSERT INTO `region` VALUES ('620726', '620700', '其它区', ',1,620000,620700,620726', 'mainland', '4');
INSERT INTO `region` VALUES ('620800', '620000', '平凉市', ',1,620000,620800', 'mainland', '3');
INSERT INTO `region` VALUES ('620802', '620800', '崆峒区', ',1,620000,620800,620802', 'mainland', '4');
INSERT INTO `region` VALUES ('620821', '620800', '泾川县', ',1,620000,620800,620821', 'mainland', '4');
INSERT INTO `region` VALUES ('620822', '620800', '灵台县', ',1,620000,620800,620822', 'mainland', '4');
INSERT INTO `region` VALUES ('620823', '620800', '崇信县', ',1,620000,620800,620823', 'mainland', '4');
INSERT INTO `region` VALUES ('620824', '620800', '华亭县', ',1,620000,620800,620824', 'mainland', '4');
INSERT INTO `region` VALUES ('620825', '620800', '庄浪县', ',1,620000,620800,620825', 'mainland', '4');
INSERT INTO `region` VALUES ('620826', '620800', '静宁县', ',1,620000,620800,620826', 'mainland', '4');
INSERT INTO `region` VALUES ('620827', '620800', '其它区', ',1,620000,620800,620827', 'mainland', '4');
INSERT INTO `region` VALUES ('620900', '620000', '酒泉市', ',1,620000,620900', 'mainland', '3');
INSERT INTO `region` VALUES ('620902', '620900', '肃州区', ',1,620000,620900,620902', 'mainland', '4');
INSERT INTO `region` VALUES ('620921', '620900', '金塔县', ',1,620000,620900,620921', 'mainland', '4');
INSERT INTO `region` VALUES ('620922', '620900', '安西县', ',1,620000,620900,620922', 'mainland', '4');
INSERT INTO `region` VALUES ('620923', '620900', '肃北蒙古族自治县', ',1,620000,620900,620923', 'mainland', '4');
INSERT INTO `region` VALUES ('620924', '620900', '阿克塞哈萨克族自治县', ',1,620000,620900,620924', 'mainland', '4');
INSERT INTO `region` VALUES ('620981', '620900', '玉门市', ',1,620000,620900,620981', 'mainland', '4');
INSERT INTO `region` VALUES ('620982', '620900', '敦煌市', ',1,620000,620900,620982', 'mainland', '4');
INSERT INTO `region` VALUES ('620983', '620900', '其它区', ',1,620000,620900,620983', 'mainland', '4');
INSERT INTO `region` VALUES ('621000', '620000', '庆阳市', ',1,620000,621000', 'mainland', '3');
INSERT INTO `region` VALUES ('621002', '621000', '西峰区', ',1,620000,621000,621002', 'mainland', '4');
INSERT INTO `region` VALUES ('621021', '621000', '庆城县', ',1,620000,621000,621021', 'mainland', '4');
INSERT INTO `region` VALUES ('621022', '621000', '环县', ',1,620000,621000,621022', 'mainland', '4');
INSERT INTO `region` VALUES ('621023', '621000', '华池县', ',1,620000,621000,621023', 'mainland', '4');
INSERT INTO `region` VALUES ('621024', '621000', '合水县', ',1,620000,621000,621024', 'mainland', '4');
INSERT INTO `region` VALUES ('621025', '621000', '正宁县', ',1,620000,621000,621025', 'mainland', '4');
INSERT INTO `region` VALUES ('621026', '621000', '宁县', ',1,620000,621000,621026', 'mainland', '4');
INSERT INTO `region` VALUES ('621027', '621000', '镇原县', ',1,620000,621000,621027', 'mainland', '4');
INSERT INTO `region` VALUES ('621028', '621000', '其它区', ',1,620000,621000,621028', 'mainland', '4');
INSERT INTO `region` VALUES ('621100', '620000', '定西市', ',1,620000,621100', 'mainland', '3');
INSERT INTO `region` VALUES ('621102', '621100', '安定区', ',1,620000,621100,621102', 'mainland', '4');
INSERT INTO `region` VALUES ('621121', '621100', '通渭县', ',1,620000,621100,621121', 'mainland', '4');
INSERT INTO `region` VALUES ('621122', '621100', '陇西县', ',1,620000,621100,621122', 'mainland', '4');
INSERT INTO `region` VALUES ('621123', '621100', '渭源县', ',1,620000,621100,621123', 'mainland', '4');
INSERT INTO `region` VALUES ('621124', '621100', '临洮县', ',1,620000,621100,621124', 'mainland', '4');
INSERT INTO `region` VALUES ('621125', '621100', '漳县', ',1,620000,621100,621125', 'mainland', '4');
INSERT INTO `region` VALUES ('621126', '621100', '岷县', ',1,620000,621100,621126', 'mainland', '4');
INSERT INTO `region` VALUES ('621127', '621100', '其它区', ',1,620000,621100,621127', 'mainland', '4');
INSERT INTO `region` VALUES ('621200', '620000', '陇南市', ',1,620000,621200', 'mainland', '3');
INSERT INTO `region` VALUES ('621202', '621200', '武都区', ',1,620000,621200,621202', 'mainland', '4');
INSERT INTO `region` VALUES ('621221', '621200', '成县', ',1,620000,621200,621221', 'mainland', '4');
INSERT INTO `region` VALUES ('621222', '621200', '文县', ',1,620000,621200,621222', 'mainland', '4');
INSERT INTO `region` VALUES ('621223', '621200', '宕昌县', ',1,620000,621200,621223', 'mainland', '4');
INSERT INTO `region` VALUES ('621224', '621200', '康县', ',1,620000,621200,621224', 'mainland', '4');
INSERT INTO `region` VALUES ('621225', '621200', '西和县', ',1,620000,621200,621225', 'mainland', '4');
INSERT INTO `region` VALUES ('621226', '621200', '礼县', ',1,620000,621200,621226', 'mainland', '4');
INSERT INTO `region` VALUES ('621227', '621200', '徽县', ',1,620000,621200,621227', 'mainland', '4');
INSERT INTO `region` VALUES ('621228', '621200', '两当县', ',1,620000,621200,621228', 'mainland', '4');
INSERT INTO `region` VALUES ('621229', '621200', '其它区', ',1,620000,621200,621229', 'mainland', '4');
INSERT INTO `region` VALUES ('622900', '620000', '临夏回族自治州', ',1,620000,622900', 'mainland', '3');
INSERT INTO `region` VALUES ('622901', '622900', '临夏市', ',1,620000,622900,622901', 'mainland', '4');
INSERT INTO `region` VALUES ('622921', '622900', '临夏县', ',1,620000,622900,622921', 'mainland', '4');
INSERT INTO `region` VALUES ('622922', '622900', '康乐县', ',1,620000,622900,622922', 'mainland', '4');
INSERT INTO `region` VALUES ('622923', '622900', '永靖县', ',1,620000,622900,622923', 'mainland', '4');
INSERT INTO `region` VALUES ('622924', '622900', '广河县', ',1,620000,622900,622924', 'mainland', '4');
INSERT INTO `region` VALUES ('622925', '622900', '和政县', ',1,620000,622900,622925', 'mainland', '4');
INSERT INTO `region` VALUES ('622926', '622900', '东乡族自治县', ',1,620000,622900,622926', 'mainland', '4');
INSERT INTO `region` VALUES ('622927', '622900', '积石山保安族东乡族撒拉族自治县', ',1,620000,622900,622927', 'mainland', '4');
INSERT INTO `region` VALUES ('622928', '622900', '其它区', ',1,620000,622900,622928', 'mainland', '4');
INSERT INTO `region` VALUES ('623000', '620000', '甘南藏族自治州', ',1,620000,623000', 'mainland', '3');
INSERT INTO `region` VALUES ('623001', '623000', '合作市', ',1,620000,623000,623001', 'mainland', '4');
INSERT INTO `region` VALUES ('623021', '623000', '临潭县', ',1,620000,623000,623021', 'mainland', '4');
INSERT INTO `region` VALUES ('623022', '623000', '卓尼县', ',1,620000,623000,623022', 'mainland', '4');
INSERT INTO `region` VALUES ('623023', '623000', '舟曲县', ',1,620000,623000,623023', 'mainland', '4');
INSERT INTO `region` VALUES ('623024', '623000', '迭部县', ',1,620000,623000,623024', 'mainland', '4');
INSERT INTO `region` VALUES ('623025', '623000', '玛曲县', ',1,620000,623000,623025', 'mainland', '4');
INSERT INTO `region` VALUES ('623026', '623000', '碌曲县', ',1,620000,623000,623026', 'mainland', '4');
INSERT INTO `region` VALUES ('623027', '623000', '夏河县', ',1,620000,623000,623027', 'mainland', '4');
INSERT INTO `region` VALUES ('623028', '623000', '其它区', ',1,620000,623000,623028', 'mainland', '4');
INSERT INTO `region` VALUES ('630000', '1', '青海省', ',1,630000', 'mainland', '2');
INSERT INTO `region` VALUES ('630100', '630000', '西宁市', ',1,630000,630100', 'mainland', '3');
INSERT INTO `region` VALUES ('630102', '630100', '城东区', ',1,630000,630100,630102', 'mainland', '4');
INSERT INTO `region` VALUES ('630103', '630100', '城中区', ',1,630000,630100,630103', 'mainland', '4');
INSERT INTO `region` VALUES ('630104', '630100', '城西区', ',1,630000,630100,630104', 'mainland', '4');
INSERT INTO `region` VALUES ('630105', '630100', '城北区', ',1,630000,630100,630105', 'mainland', '4');
INSERT INTO `region` VALUES ('630121', '630100', '大通回族土族自治县', ',1,630000,630100,630121', 'mainland', '4');
INSERT INTO `region` VALUES ('630122', '630100', '湟中县', ',1,630000,630100,630122', 'mainland', '4');
INSERT INTO `region` VALUES ('630123', '630100', '湟源县', ',1,630000,630100,630123', 'mainland', '4');
INSERT INTO `region` VALUES ('630124', '630100', '其它区', ',1,630000,630100,630124', 'mainland', '4');
INSERT INTO `region` VALUES ('632100', '630000', '海东地区', ',1,630000,632100', 'mainland', '3');
INSERT INTO `region` VALUES ('632121', '632100', '平安县', ',1,630000,632100,632121', 'mainland', '4');
INSERT INTO `region` VALUES ('632122', '632100', '民和回族土族自治县', ',1,630000,632100,632122', 'mainland', '4');
INSERT INTO `region` VALUES ('632123', '632100', '乐都县', ',1,630000,632100,632123', 'mainland', '4');
INSERT INTO `region` VALUES ('632126', '632100', '互助土族自治县', ',1,630000,632100,632126', 'mainland', '4');
INSERT INTO `region` VALUES ('632127', '632100', '化隆回族自治县', ',1,630000,632100,632127', 'mainland', '4');
INSERT INTO `region` VALUES ('632128', '632100', '循化撒拉族自治县', ',1,630000,632100,632128', 'mainland', '4');
INSERT INTO `region` VALUES ('632129', '632100', '其它区', ',1,630000,632100,632129', 'mainland', '4');
INSERT INTO `region` VALUES ('632200', '630000', '海北藏族自治州', ',1,630000,632200', 'mainland', '3');
INSERT INTO `region` VALUES ('632221', '632200', '门源回族自治县', ',1,630000,632200,632221', 'mainland', '4');
INSERT INTO `region` VALUES ('632222', '632200', '祁连县', ',1,630000,632200,632222', 'mainland', '4');
INSERT INTO `region` VALUES ('632223', '632200', '海晏县', ',1,630000,632200,632223', 'mainland', '4');
INSERT INTO `region` VALUES ('632224', '632200', '刚察县', ',1,630000,632200,632224', 'mainland', '4');
INSERT INTO `region` VALUES ('632225', '632200', '其它区', ',1,630000,632200,632225', 'mainland', '4');
INSERT INTO `region` VALUES ('632300', '630000', '黄南藏族自治州', ',1,630000,632300', 'mainland', '3');
INSERT INTO `region` VALUES ('632321', '632300', '同仁县', ',1,630000,632300,632321', 'mainland', '4');
INSERT INTO `region` VALUES ('632322', '632300', '尖扎县', ',1,630000,632300,632322', 'mainland', '4');
INSERT INTO `region` VALUES ('632323', '632300', '泽库县', ',1,630000,632300,632323', 'mainland', '4');
INSERT INTO `region` VALUES ('632324', '632300', '河南蒙古族自治县', ',1,630000,632300,632324', 'mainland', '4');
INSERT INTO `region` VALUES ('632325', '632300', '其它区', ',1,630000,632300,632325', 'mainland', '4');
INSERT INTO `region` VALUES ('632500', '630000', '海南藏族自治州', ',1,630000,632500', 'mainland', '3');
INSERT INTO `region` VALUES ('632521', '632500', '共和县', ',1,630000,632500,632521', 'mainland', '4');
INSERT INTO `region` VALUES ('632522', '632500', '同德县', ',1,630000,632500,632522', 'mainland', '4');
INSERT INTO `region` VALUES ('632523', '632500', '贵德县', ',1,630000,632500,632523', 'mainland', '4');
INSERT INTO `region` VALUES ('632524', '632500', '兴海县', ',1,630000,632500,632524', 'mainland', '4');
INSERT INTO `region` VALUES ('632525', '632500', '贵南县', ',1,630000,632500,632525', 'mainland', '4');
INSERT INTO `region` VALUES ('632526', '632500', '其它区', ',1,630000,632500,632526', 'mainland', '4');
INSERT INTO `region` VALUES ('632600', '630000', '果洛藏族自治州', ',1,630000,632600', 'mainland', '3');
INSERT INTO `region` VALUES ('632621', '632600', '玛沁县', ',1,630000,632600,632621', 'mainland', '4');
INSERT INTO `region` VALUES ('632622', '632600', '班玛县', ',1,630000,632600,632622', 'mainland', '4');
INSERT INTO `region` VALUES ('632623', '632600', '甘德县', ',1,630000,632600,632623', 'mainland', '4');
INSERT INTO `region` VALUES ('632624', '632600', '达日县', ',1,630000,632600,632624', 'mainland', '4');
INSERT INTO `region` VALUES ('632625', '632600', '久治县', ',1,630000,632600,632625', 'mainland', '4');
INSERT INTO `region` VALUES ('632626', '632600', '玛多县', ',1,630000,632600,632626', 'mainland', '4');
INSERT INTO `region` VALUES ('632627', '632600', '其它区', ',1,630000,632600,632627', 'mainland', '4');
INSERT INTO `region` VALUES ('632700', '630000', '玉树藏族自治州', ',1,630000,632700', 'mainland', '3');
INSERT INTO `region` VALUES ('632721', '632700', '玉树县', ',1,630000,632700,632721', 'mainland', '4');
INSERT INTO `region` VALUES ('632722', '632700', '杂多县', ',1,630000,632700,632722', 'mainland', '4');
INSERT INTO `region` VALUES ('632723', '632700', '称多县', ',1,630000,632700,632723', 'mainland', '4');
INSERT INTO `region` VALUES ('632724', '632700', '治多县', ',1,630000,632700,632724', 'mainland', '4');
INSERT INTO `region` VALUES ('632725', '632700', '囊谦县', ',1,630000,632700,632725', 'mainland', '4');
INSERT INTO `region` VALUES ('632726', '632700', '曲麻莱县', ',1,630000,632700,632726', 'mainland', '4');
INSERT INTO `region` VALUES ('632727', '632700', '其它区', ',1,630000,632700,632727', 'mainland', '4');
INSERT INTO `region` VALUES ('632800', '630000', '海西蒙古族藏族自治州', ',1,630000,632800', 'mainland', '3');
INSERT INTO `region` VALUES ('632801', '632800', '格尔木市', ',1,630000,632800,632801', 'mainland', '4');
INSERT INTO `region` VALUES ('632802', '632800', '德令哈市', ',1,630000,632800,632802', 'mainland', '4');
INSERT INTO `region` VALUES ('632821', '632800', '乌兰县', ',1,630000,632800,632821', 'mainland', '4');
INSERT INTO `region` VALUES ('632822', '632800', '都兰县', ',1,630000,632800,632822', 'mainland', '4');
INSERT INTO `region` VALUES ('632823', '632800', '天峻县', ',1,630000,632800,632823', 'mainland', '4');
INSERT INTO `region` VALUES ('632824', '632800', '其它区', ',1,630000,632800,632824', 'mainland', '4');
INSERT INTO `region` VALUES ('640000', '1', '宁夏回族自治区', ',1,640000', 'mainland', '2');
INSERT INTO `region` VALUES ('640100', '640000', '银川市', ',1,640000,640100', 'mainland', '3');
INSERT INTO `region` VALUES ('640104', '640100', '兴庆区', ',1,640000,640100,640104', 'mainland', '4');
INSERT INTO `region` VALUES ('640105', '640100', '西夏区', ',1,640000,640100,640105', 'mainland', '4');
INSERT INTO `region` VALUES ('640106', '640100', '金凤区', ',1,640000,640100,640106', 'mainland', '4');
INSERT INTO `region` VALUES ('640121', '640100', '永宁县', ',1,640000,640100,640121', 'mainland', '4');
INSERT INTO `region` VALUES ('640122', '640100', '贺兰县', ',1,640000,640100,640122', 'mainland', '4');
INSERT INTO `region` VALUES ('640181', '640100', '灵武市', ',1,640000,640100,640181', 'mainland', '4');
INSERT INTO `region` VALUES ('640182', '640100', '其它区', ',1,640000,640100,640182', 'mainland', '4');
INSERT INTO `region` VALUES ('640200', '640000', '石嘴山市', ',1,640000,640200', 'mainland', '3');
INSERT INTO `region` VALUES ('640202', '640200', '大武口区', ',1,640000,640200,640202', 'mainland', '4');
INSERT INTO `region` VALUES ('640205', '640200', '惠农区', ',1,640000,640200,640205', 'mainland', '4');
INSERT INTO `region` VALUES ('640221', '640200', '平罗县', ',1,640000,640200,640221', 'mainland', '4');
INSERT INTO `region` VALUES ('640222', '640200', '其它区', ',1,640000,640200,640222', 'mainland', '4');
INSERT INTO `region` VALUES ('640300', '640000', '吴忠市', ',1,640000,640300', 'mainland', '3');
INSERT INTO `region` VALUES ('640302', '640300', '利通区', ',1,640000,640300,640302', 'mainland', '4');
INSERT INTO `region` VALUES ('640323', '640300', '盐池县', ',1,640000,640300,640323', 'mainland', '4');
INSERT INTO `region` VALUES ('640324', '640300', '同心县', ',1,640000,640300,640324', 'mainland', '4');
INSERT INTO `region` VALUES ('640381', '640300', '青铜峡市', ',1,640000,640300,640381', 'mainland', '4');
INSERT INTO `region` VALUES ('640382', '640300', '其它区', ',1,640000,640300,640382', 'mainland', '4');
INSERT INTO `region` VALUES ('640400', '640000', '固原市', ',1,640000,640400', 'mainland', '3');
INSERT INTO `region` VALUES ('640402', '640400', '原州区', ',1,640000,640400,640402', 'mainland', '4');
INSERT INTO `region` VALUES ('640422', '640400', '西吉县', ',1,640000,640400,640422', 'mainland', '4');
INSERT INTO `region` VALUES ('640423', '640400', '隆德县', ',1,640000,640400,640423', 'mainland', '4');
INSERT INTO `region` VALUES ('640424', '640400', '泾源县', ',1,640000,640400,640424', 'mainland', '4');
INSERT INTO `region` VALUES ('640425', '640400', '彭阳县', ',1,640000,640400,640425', 'mainland', '4');
INSERT INTO `region` VALUES ('640426', '640400', '其它区', ',1,640000,640400,640426', 'mainland', '4');
INSERT INTO `region` VALUES ('640500', '640000', '中卫市', ',1,640000,640500', 'mainland', '3');
INSERT INTO `region` VALUES ('640502', '640500', '沙坡头区', ',1,640000,640500,640502', 'mainland', '4');
INSERT INTO `region` VALUES ('640521', '640500', '中宁县', ',1,640000,640500,640521', 'mainland', '4');
INSERT INTO `region` VALUES ('640522', '640500', '海原县', ',1,640000,640500,640522', 'mainland', '4');
INSERT INTO `region` VALUES ('640523', '640500', '其它区', ',1,640000,640500,640523', 'mainland', '4');
INSERT INTO `region` VALUES ('650000', '1', '新疆维吾尔自治区', ',1,650000', 'mainland', '2');
INSERT INTO `region` VALUES ('650100', '650000', '乌鲁木齐市', ',1,650000,650100', 'mainland', '3');
INSERT INTO `region` VALUES ('650102', '650100', '天山区', ',1,650000,650100,650102', 'mainland', '4');
INSERT INTO `region` VALUES ('650103', '650100', '沙依巴克区', ',1,650000,650100,650103', 'mainland', '4');
INSERT INTO `region` VALUES ('650104', '650100', '新市区', ',1,650000,650100,650104', 'mainland', '4');
INSERT INTO `region` VALUES ('650105', '650100', '水磨沟区', ',1,650000,650100,650105', 'mainland', '4');
INSERT INTO `region` VALUES ('650106', '650100', '头屯河区', ',1,650000,650100,650106', 'mainland', '4');
INSERT INTO `region` VALUES ('650107', '650100', '达坂城区', ',1,650000,650100,650107', 'mainland', '4');
INSERT INTO `region` VALUES ('650108', '650100', '东山区', ',1,650000,650100,650108', 'mainland', '4');
INSERT INTO `region` VALUES ('650109', '650100', '米东区', ',1,650000,650100,650109', 'mainland', '4');
INSERT INTO `region` VALUES ('650121', '650100', '乌鲁木齐县', ',1,650000,650100,650121', 'mainland', '4');
INSERT INTO `region` VALUES ('650122', '650100', '其它区', ',1,650000,650100,650122', 'mainland', '4');
INSERT INTO `region` VALUES ('650200', '650000', '克拉玛依市', ',1,650000,650200', 'mainland', '3');
INSERT INTO `region` VALUES ('650202', '650200', '独山子区', ',1,650000,650200,650202', 'mainland', '4');
INSERT INTO `region` VALUES ('650203', '650200', '克拉玛依区', ',1,650000,650200,650203', 'mainland', '4');
INSERT INTO `region` VALUES ('650204', '650200', '白碱滩区', ',1,650000,650200,650204', 'mainland', '4');
INSERT INTO `region` VALUES ('650205', '650200', '乌尔禾区', ',1,650000,650200,650205', 'mainland', '4');
INSERT INTO `region` VALUES ('650206', '650200', '其它区', ',1,650000,650200,650206', 'mainland', '4');
INSERT INTO `region` VALUES ('652100', '650000', '吐鲁番地区', ',1,650000,652100', 'mainland', '3');
INSERT INTO `region` VALUES ('652101', '652100', '吐鲁番市', ',1,650000,652100,652101', 'mainland', '4');
INSERT INTO `region` VALUES ('652122', '652100', '鄯善县', ',1,650000,652100,652122', 'mainland', '4');
INSERT INTO `region` VALUES ('652123', '652100', '托克逊县', ',1,650000,652100,652123', 'mainland', '4');
INSERT INTO `region` VALUES ('652124', '652100', '其它区', ',1,650000,652100,652124', 'mainland', '4');
INSERT INTO `region` VALUES ('652200', '650000', '哈密地区', ',1,650000,652200', 'mainland', '3');
INSERT INTO `region` VALUES ('652201', '652200', '哈密市', ',1,650000,652200,652201', 'mainland', '4');
INSERT INTO `region` VALUES ('652222', '652200', '巴里坤哈萨克自治县', ',1,650000,652200,652222', 'mainland', '4');
INSERT INTO `region` VALUES ('652223', '652200', '伊吾县', ',1,650000,652200,652223', 'mainland', '4');
INSERT INTO `region` VALUES ('652224', '652200', '其它区', ',1,650000,652200,652224', 'mainland', '4');
INSERT INTO `region` VALUES ('652300', '650000', '昌吉回族自治州', ',1,650000,652300', 'mainland', '3');
INSERT INTO `region` VALUES ('652301', '652300', '昌吉市', ',1,650000,652300,652301', 'mainland', '4');
INSERT INTO `region` VALUES ('652302', '652300', '阜康市', ',1,650000,652300,652302', 'mainland', '4');
INSERT INTO `region` VALUES ('652303', '652300', '米泉市', ',1,650000,652300,652303', 'mainland', '4');
INSERT INTO `region` VALUES ('652323', '652300', '呼图壁县', ',1,650000,652300,652323', 'mainland', '4');
INSERT INTO `region` VALUES ('652324', '652300', '玛纳斯县', ',1,650000,652300,652324', 'mainland', '4');
INSERT INTO `region` VALUES ('652325', '652300', '奇台县', ',1,650000,652300,652325', 'mainland', '4');
INSERT INTO `region` VALUES ('652327', '652300', '吉木萨尔县', ',1,650000,652300,652327', 'mainland', '4');
INSERT INTO `region` VALUES ('652328', '652300', '木垒哈萨克自治县', ',1,650000,652300,652328', 'mainland', '4');
INSERT INTO `region` VALUES ('652329', '652300', '其它区', ',1,650000,652300,652329', 'mainland', '4');
INSERT INTO `region` VALUES ('652700', '650000', '博尔塔拉蒙古自治州', ',1,650000,652700', 'mainland', '3');
INSERT INTO `region` VALUES ('652701', '652700', '博乐市', ',1,650000,652700,652701', 'mainland', '4');
INSERT INTO `region` VALUES ('652722', '652700', '精河县', ',1,650000,652700,652722', 'mainland', '4');
INSERT INTO `region` VALUES ('652723', '652700', '温泉县', ',1,650000,652700,652723', 'mainland', '4');
INSERT INTO `region` VALUES ('652724', '652700', '其它区', ',1,650000,652700,652724', 'mainland', '4');
INSERT INTO `region` VALUES ('652800', '650000', '巴音郭楞蒙古自治州', ',1,650000,652800', 'mainland', '3');
INSERT INTO `region` VALUES ('652801', '652800', '库尔勒市', ',1,650000,652800,652801', 'mainland', '4');
INSERT INTO `region` VALUES ('652822', '652800', '轮台县', ',1,650000,652800,652822', 'mainland', '4');
INSERT INTO `region` VALUES ('652823', '652800', '尉犁县', ',1,650000,652800,652823', 'mainland', '4');
INSERT INTO `region` VALUES ('652824', '652800', '若羌县', ',1,650000,652800,652824', 'mainland', '4');
INSERT INTO `region` VALUES ('652825', '652800', '且末县', ',1,650000,652800,652825', 'mainland', '4');
INSERT INTO `region` VALUES ('652826', '652800', '焉耆回族自治县', ',1,650000,652800,652826', 'mainland', '4');
INSERT INTO `region` VALUES ('652827', '652800', '和静县', ',1,650000,652800,652827', 'mainland', '4');
INSERT INTO `region` VALUES ('652828', '652800', '和硕县', ',1,650000,652800,652828', 'mainland', '4');
INSERT INTO `region` VALUES ('652829', '652800', '博湖县', ',1,650000,652800,652829', 'mainland', '4');
INSERT INTO `region` VALUES ('652830', '652800', '其它区', ',1,650000,652800,652830', 'mainland', '4');
INSERT INTO `region` VALUES ('652900', '650000', '阿克苏地区', ',1,650000,652900', 'mainland', '3');
INSERT INTO `region` VALUES ('652901', '652900', '阿克苏市', ',1,650000,652900,652901', 'mainland', '4');
INSERT INTO `region` VALUES ('652922', '652900', '温宿县', ',1,650000,652900,652922', 'mainland', '4');
INSERT INTO `region` VALUES ('652923', '652900', '库车县', ',1,650000,652900,652923', 'mainland', '4');
INSERT INTO `region` VALUES ('652924', '652900', '沙雅县', ',1,650000,652900,652924', 'mainland', '4');
INSERT INTO `region` VALUES ('652925', '652900', '新和县', ',1,650000,652900,652925', 'mainland', '4');
INSERT INTO `region` VALUES ('652926', '652900', '拜城县', ',1,650000,652900,652926', 'mainland', '4');
INSERT INTO `region` VALUES ('652927', '652900', '乌什县', ',1,650000,652900,652927', 'mainland', '4');
INSERT INTO `region` VALUES ('652928', '652900', '阿瓦提县', ',1,650000,652900,652928', 'mainland', '4');
INSERT INTO `region` VALUES ('652929', '652900', '柯坪县', ',1,650000,652900,652929', 'mainland', '4');
INSERT INTO `region` VALUES ('652930', '652900', '其它区', ',1,650000,652900,652930', 'mainland', '4');
INSERT INTO `region` VALUES ('653000', '650000', '克孜勒苏柯尔克孜自治州', ',1,650000,653000', 'mainland', '3');
INSERT INTO `region` VALUES ('653001', '653000', '阿图什市', ',1,650000,653000,653001', 'mainland', '4');
INSERT INTO `region` VALUES ('653022', '653000', '阿克陶县', ',1,650000,653000,653022', 'mainland', '4');
INSERT INTO `region` VALUES ('653023', '653000', '阿合奇县', ',1,650000,653000,653023', 'mainland', '4');
INSERT INTO `region` VALUES ('653024', '653000', '乌恰县', ',1,650000,653000,653024', 'mainland', '4');
INSERT INTO `region` VALUES ('653025', '653000', '其它区', ',1,650000,653000,653025', 'mainland', '4');
INSERT INTO `region` VALUES ('653100', '650000', '喀什地区', ',1,650000,653100', 'mainland', '3');
INSERT INTO `region` VALUES ('653101', '653100', '喀什市', ',1,650000,653100,653101', 'mainland', '4');
INSERT INTO `region` VALUES ('653121', '653100', '疏附县', ',1,650000,653100,653121', 'mainland', '4');
INSERT INTO `region` VALUES ('653122', '653100', '疏勒县', ',1,650000,653100,653122', 'mainland', '4');
INSERT INTO `region` VALUES ('653123', '653100', '英吉沙县', ',1,650000,653100,653123', 'mainland', '4');
INSERT INTO `region` VALUES ('653124', '653100', '泽普县', ',1,650000,653100,653124', 'mainland', '4');
INSERT INTO `region` VALUES ('653125', '653100', '莎车县', ',1,650000,653100,653125', 'mainland', '4');
INSERT INTO `region` VALUES ('653126', '653100', '叶城县', ',1,650000,653100,653126', 'mainland', '4');
INSERT INTO `region` VALUES ('653127', '653100', '麦盖提县', ',1,650000,653100,653127', 'mainland', '4');
INSERT INTO `region` VALUES ('653128', '653100', '岳普湖县', ',1,650000,653100,653128', 'mainland', '4');
INSERT INTO `region` VALUES ('653129', '653100', '伽师县', ',1,650000,653100,653129', 'mainland', '4');
INSERT INTO `region` VALUES ('653130', '653100', '巴楚县', ',1,650000,653100,653130', 'mainland', '4');
INSERT INTO `region` VALUES ('653131', '653100', '塔什库尔干塔吉克自治县', ',1,650000,653100,653131', 'mainland', '4');
INSERT INTO `region` VALUES ('653132', '653100', '其它区', ',1,650000,653100,653132', 'mainland', '4');
INSERT INTO `region` VALUES ('653200', '650000', '和田地区', ',1,650000,653200', 'mainland', '3');
INSERT INTO `region` VALUES ('653201', '653200', '和田市', ',1,650000,653200,653201', 'mainland', '4');
INSERT INTO `region` VALUES ('653221', '653200', '和田县', ',1,650000,653200,653221', 'mainland', '4');
INSERT INTO `region` VALUES ('653222', '653200', '墨玉县', ',1,650000,653200,653222', 'mainland', '4');
INSERT INTO `region` VALUES ('653223', '653200', '皮山县', ',1,650000,653200,653223', 'mainland', '4');
INSERT INTO `region` VALUES ('653224', '653200', '洛浦县', ',1,650000,653200,653224', 'mainland', '4');
INSERT INTO `region` VALUES ('653225', '653200', '策勒县', ',1,650000,653200,653225', 'mainland', '4');
INSERT INTO `region` VALUES ('653226', '653200', '于田县', ',1,650000,653200,653226', 'mainland', '4');
INSERT INTO `region` VALUES ('653227', '653200', '民丰县', ',1,650000,653200,653227', 'mainland', '4');
INSERT INTO `region` VALUES ('653228', '653200', '其它区', ',1,650000,653200,653228', 'mainland', '4');
INSERT INTO `region` VALUES ('654000', '650000', '伊犁哈萨克自治州', ',1,650000,654000', 'mainland', '3');
INSERT INTO `region` VALUES ('654002', '654000', '伊宁市', ',1,650000,654000,654002', 'mainland', '4');
INSERT INTO `region` VALUES ('654003', '654000', '奎屯市', ',1,650000,654000,654003', 'mainland', '4');
INSERT INTO `region` VALUES ('654021', '654000', '伊宁县', ',1,650000,654000,654021', 'mainland', '4');
INSERT INTO `region` VALUES ('654022', '654000', '察布查尔锡伯自治县', ',1,650000,654000,654022', 'mainland', '4');
INSERT INTO `region` VALUES ('654023', '654000', '霍城县', ',1,650000,654000,654023', 'mainland', '4');
INSERT INTO `region` VALUES ('654024', '654000', '巩留县', ',1,650000,654000,654024', 'mainland', '4');
INSERT INTO `region` VALUES ('654025', '654000', '新源县', ',1,650000,654000,654025', 'mainland', '4');
INSERT INTO `region` VALUES ('654026', '654000', '昭苏县', ',1,650000,654000,654026', 'mainland', '4');
INSERT INTO `region` VALUES ('654027', '654000', '特克斯县', ',1,650000,654000,654027', 'mainland', '4');
INSERT INTO `region` VALUES ('654028', '654000', '尼勒克县', ',1,650000,654000,654028', 'mainland', '4');
INSERT INTO `region` VALUES ('654029', '654000', '其它区', ',1,650000,654000,654029', 'mainland', '4');
INSERT INTO `region` VALUES ('654200', '650000', '塔城地区', ',1,650000,654200', 'mainland', '3');
INSERT INTO `region` VALUES ('654201', '654200', '塔城市', ',1,650000,654200,654201', 'mainland', '4');
INSERT INTO `region` VALUES ('654202', '654200', '乌苏市', ',1,650000,654200,654202', 'mainland', '4');
INSERT INTO `region` VALUES ('654221', '654200', '额敏县', ',1,650000,654200,654221', 'mainland', '4');
INSERT INTO `region` VALUES ('654223', '654200', '沙湾县', ',1,650000,654200,654223', 'mainland', '4');
INSERT INTO `region` VALUES ('654224', '654200', '托里县', ',1,650000,654200,654224', 'mainland', '4');
INSERT INTO `region` VALUES ('654225', '654200', '裕民县', ',1,650000,654200,654225', 'mainland', '4');
INSERT INTO `region` VALUES ('654226', '654200', '和布克赛尔蒙古自治县', ',1,650000,654200,654226', 'mainland', '4');
INSERT INTO `region` VALUES ('654227', '654200', '其它区', ',1,650000,654200,654227', 'mainland', '4');
INSERT INTO `region` VALUES ('654300', '650000', '阿勒泰地区', ',1,650000,654300', 'mainland', '3');
INSERT INTO `region` VALUES ('654301', '654300', '阿勒泰市', ',1,650000,654300,654301', 'mainland', '4');
INSERT INTO `region` VALUES ('654321', '654300', '布尔津县', ',1,650000,654300,654321', 'mainland', '4');
INSERT INTO `region` VALUES ('654322', '654300', '富蕴县', ',1,650000,654300,654322', 'mainland', '4');
INSERT INTO `region` VALUES ('654323', '654300', '福海县', ',1,650000,654300,654323', 'mainland', '4');
INSERT INTO `region` VALUES ('654324', '654300', '哈巴河县', ',1,650000,654300,654324', 'mainland', '4');
INSERT INTO `region` VALUES ('654325', '654300', '青河县', ',1,650000,654300,654325', 'mainland', '4');
INSERT INTO `region` VALUES ('654326', '654300', '吉木乃县', ',1,650000,654300,654326', 'mainland', '4');
INSERT INTO `region` VALUES ('654327', '654300', '其它区', ',1,650000,654300,654327', 'mainland', '4');
INSERT INTO `region` VALUES ('659001', '650000', '石河子市', ',1,650000,659001', 'mainland', '4');
INSERT INTO `region` VALUES ('659002', '650000', '阿拉尔市', ',1,650000,659002', 'mainland', '4');
INSERT INTO `region` VALUES ('659003', '650000', '图木舒克市', ',1,650000,659003', 'mainland', '4');
INSERT INTO `region` VALUES ('659004', '650000', '五家渠市', ',1,650000,659004', 'mainland', '4');
INSERT INTO `region` VALUES ('710000', '1', '台湾省', ',1,710000', 'mainland', '2');
INSERT INTO `region` VALUES ('710100', '710000', '台北市', ',1,710000,710100', 'mainland', '3');
INSERT INTO `region` VALUES ('710101', '710100', '中正区', ',1,710000,710100,710101', 'mainland', '4');
INSERT INTO `region` VALUES ('710102', '710100', '大同区', ',1,710000,710100,710102', 'mainland', '4');
INSERT INTO `region` VALUES ('710103', '710100', '中山区', ',1,710000,710100,710103', 'mainland', '4');
INSERT INTO `region` VALUES ('710104', '710100', '松山区', ',1,710000,710100,710104', 'mainland', '4');
INSERT INTO `region` VALUES ('710105', '710100', '大安区', ',1,710000,710100,710105', 'mainland', '4');
INSERT INTO `region` VALUES ('710106', '710100', '万华区', ',1,710000,710100,710106', 'mainland', '4');
INSERT INTO `region` VALUES ('710107', '710100', '信义区', ',1,710000,710100,710107', 'mainland', '4');
INSERT INTO `region` VALUES ('710108', '710100', '士林区', ',1,710000,710100,710108', 'mainland', '4');
INSERT INTO `region` VALUES ('710109', '710100', '北投区', ',1,710000,710100,710109', 'mainland', '4');
INSERT INTO `region` VALUES ('710110', '710100', '内湖区', ',1,710000,710100,710110', 'mainland', '4');
INSERT INTO `region` VALUES ('710111', '710100', '南港区', ',1,710000,710100,710111', 'mainland', '4');
INSERT INTO `region` VALUES ('710112', '710100', '文山区', ',1,710000,710100,710112', 'mainland', '4');
INSERT INTO `region` VALUES ('710113', '710100', '其它区', ',1,710000,710100,710113', 'mainland', '4');
INSERT INTO `region` VALUES ('710200', '710000', '高雄市', ',1,710000,710200', 'mainland', '3');
INSERT INTO `region` VALUES ('710201', '710200', '新兴区', ',1,710000,710200,710201', 'mainland', '4');
INSERT INTO `region` VALUES ('710202', '710200', '前金区', ',1,710000,710200,710202', 'mainland', '4');
INSERT INTO `region` VALUES ('710203', '710200', '芩雅区', ',1,710000,710200,710203', 'mainland', '4');
INSERT INTO `region` VALUES ('710204', '710200', '盐埕区', ',1,710000,710200,710204', 'mainland', '4');
INSERT INTO `region` VALUES ('710205', '710200', '鼓山区', ',1,710000,710200,710205', 'mainland', '4');
INSERT INTO `region` VALUES ('710206', '710200', '旗津区', ',1,710000,710200,710206', 'mainland', '4');
INSERT INTO `region` VALUES ('710207', '710200', '前镇区', ',1,710000,710200,710207', 'mainland', '4');
INSERT INTO `region` VALUES ('710208', '710200', '三民区', ',1,710000,710200,710208', 'mainland', '4');
INSERT INTO `region` VALUES ('710209', '710200', '左营区', ',1,710000,710200,710209', 'mainland', '4');
INSERT INTO `region` VALUES ('710210', '710200', '楠梓区', ',1,710000,710200,710210', 'mainland', '4');
INSERT INTO `region` VALUES ('710211', '710200', '小港区', ',1,710000,710200,710211', 'mainland', '4');
INSERT INTO `region` VALUES ('710212', '710200', '其它区', ',1,710000,710200,710212', 'mainland', '4');
INSERT INTO `region` VALUES ('710300', '710000', '台南市', ',1,710000,710300', 'mainland', '3');
INSERT INTO `region` VALUES ('710301', '710300', '中西区', ',1,710000,710300,710301', 'mainland', '4');
INSERT INTO `region` VALUES ('710302', '710300', '东区', ',1,710000,710300,710302', 'mainland', '4');
INSERT INTO `region` VALUES ('710303', '710300', '南区', ',1,710000,710300,710303', 'mainland', '4');
INSERT INTO `region` VALUES ('710304', '710300', '北区', ',1,710000,710300,710304', 'mainland', '4');
INSERT INTO `region` VALUES ('710305', '710300', '安平区', ',1,710000,710300,710305', 'mainland', '4');
INSERT INTO `region` VALUES ('710306', '710300', '安南区', ',1,710000,710300,710306', 'mainland', '4');
INSERT INTO `region` VALUES ('710307', '710300', '其它区', ',1,710000,710300,710307', 'mainland', '4');
INSERT INTO `region` VALUES ('710400', '710000', '台中市', ',1,710000,710400', 'mainland', '3');
INSERT INTO `region` VALUES ('710401', '710400', '中区', ',1,710000,710400,710401', 'mainland', '4');
INSERT INTO `region` VALUES ('710402', '710400', '东区', ',1,710000,710400,710402', 'mainland', '4');
INSERT INTO `region` VALUES ('710403', '710400', '南区', ',1,710000,710400,710403', 'mainland', '4');
INSERT INTO `region` VALUES ('710404', '710400', '西区', ',1,710000,710400,710404', 'mainland', '4');
INSERT INTO `region` VALUES ('710405', '710400', '北区', ',1,710000,710400,710405', 'mainland', '4');
INSERT INTO `region` VALUES ('710406', '710400', '北屯区', ',1,710000,710400,710406', 'mainland', '4');
INSERT INTO `region` VALUES ('710407', '710400', '西屯区', ',1,710000,710400,710407', 'mainland', '4');
INSERT INTO `region` VALUES ('710408', '710400', '南屯区', ',1,710000,710400,710408', 'mainland', '4');
INSERT INTO `region` VALUES ('710409', '710400', '其它区', ',1,710000,710400,710409', 'mainland', '4');
INSERT INTO `region` VALUES ('710500', '710000', '金门县', ',1,710000,710500', 'mainland', '3');
INSERT INTO `region` VALUES ('710600', '710000', '南投县', ',1,710000,710600', 'mainland', '3');
INSERT INTO `region` VALUES ('710700', '710000', '基隆市', ',1,710000,710700', 'mainland', '3');
INSERT INTO `region` VALUES ('710701', '710700', '仁爱区', ',1,710000,710700,710701', 'mainland', '4');
INSERT INTO `region` VALUES ('710702', '710700', '信义区', ',1,710000,710700,710702', 'mainland', '4');
INSERT INTO `region` VALUES ('710703', '710700', '中正区', ',1,710000,710700,710703', 'mainland', '4');
INSERT INTO `region` VALUES ('710704', '710700', '中山区', ',1,710000,710700,710704', 'mainland', '4');
INSERT INTO `region` VALUES ('710705', '710700', '安乐区', ',1,710000,710700,710705', 'mainland', '4');
INSERT INTO `region` VALUES ('710706', '710700', '暖暖区', ',1,710000,710700,710706', 'mainland', '4');
INSERT INTO `region` VALUES ('710707', '710700', '七堵区', ',1,710000,710700,710707', 'mainland', '4');
INSERT INTO `region` VALUES ('710708', '710700', '其它区', ',1,710000,710700,710708', 'mainland', '4');
INSERT INTO `region` VALUES ('710800', '710000', '新竹市', ',1,710000,710800', 'mainland', '3');
INSERT INTO `region` VALUES ('710801', '710800', '东区', ',1,710000,710800,710801', 'mainland', '4');
INSERT INTO `region` VALUES ('710802', '710800', '北区', ',1,710000,710800,710802', 'mainland', '4');
INSERT INTO `region` VALUES ('710803', '710800', '香山区', ',1,710000,710800,710803', 'mainland', '4');
INSERT INTO `region` VALUES ('710804', '710800', '其它区', ',1,710000,710800,710804', 'mainland', '4');
INSERT INTO `region` VALUES ('710900', '710000', '嘉义市', ',1,710000,710900', 'mainland', '3');
INSERT INTO `region` VALUES ('710901', '710900', '东区', ',1,710000,710900,710901', 'mainland', '4');
INSERT INTO `region` VALUES ('710902', '710900', '西区', ',1,710000,710900,710902', 'mainland', '4');
INSERT INTO `region` VALUES ('710903', '710900', '其它区', ',1,710000,710900,710903', 'mainland', '4');
INSERT INTO `region` VALUES ('711100', '710000', '台北县', ',1,710000,711100', 'mainland', '4');
INSERT INTO `region` VALUES ('711200', '710000', '宜兰县', ',1,710000,711200', 'mainland', '4');
INSERT INTO `region` VALUES ('711300', '710000', '新竹县', ',1,710000,711300', 'mainland', '4');
INSERT INTO `region` VALUES ('711400', '710000', '桃园县', ',1,710000,711400', 'mainland', '4');
INSERT INTO `region` VALUES ('711500', '710000', '苗栗县', ',1,710000,711500', 'mainland', '4');
INSERT INTO `region` VALUES ('711600', '710000', '台中县', ',1,710000,711600', 'mainland', '4');
INSERT INTO `region` VALUES ('711700', '710000', '彰化县', ',1,710000,711700', 'mainland', '4');
INSERT INTO `region` VALUES ('711900', '710000', '嘉义县', ',1,710000,711900', 'mainland', '4');
INSERT INTO `region` VALUES ('712100', '710000', '云林县', ',1,710000,712100', 'mainland', '4');
INSERT INTO `region` VALUES ('712200', '710000', '台南县', ',1,710000,712200', 'mainland', '4');
INSERT INTO `region` VALUES ('712300', '710000', '高雄县', ',1,710000,712300', 'mainland', '4');
INSERT INTO `region` VALUES ('712400', '710000', '屏东县', ',1,710000,712400', 'mainland', '4');
INSERT INTO `region` VALUES ('712500', '710000', '台东县', ',1,710000,712500', 'mainland', '4');
INSERT INTO `region` VALUES ('712600', '710000', '花莲县', ',1,710000,712600', 'mainland', '4');
INSERT INTO `region` VALUES ('712700', '710000', '澎湖县', ',1,710000,712700', 'mainland', '4');
INSERT INTO `region` VALUES ('810000', '1', '香港特别行政区', ',1,810000', 'mainland', '2');
INSERT INTO `region` VALUES ('810100', '810000', '香港岛', ',1,810000,810100', 'mainland', '3');
INSERT INTO `region` VALUES ('810200', '810000', '九龙', ',1,810000,810200', 'mainland', '3');
INSERT INTO `region` VALUES ('810300', '810000', '新界', ',1,810000,810300', 'mainland', '3');
INSERT INTO `region` VALUES ('820000', '1', '澳门特别行政区', ',1,820000', 'mainland', '2');
INSERT INTO `region` VALUES ('820100', '820000', '澳门半岛', ',1,820000,820100', 'mainland', '3');
INSERT INTO `region` VALUES ('820200', '820000', '离岛', ',1,820000,820200', 'mainland', '3');
INSERT INTO `region` VALUES ('990000', '1', '海外', ',1,990000', 'mainland', '2');
INSERT INTO `region` VALUES ('990100', '990000', '海外', ',1,990000,990100', 'mainland', '3');

-- ----------------------------
-- Table structure for `search_log`
-- ----------------------------
DROP TABLE IF EXISTS `search_log`;
CREATE TABLE `search_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT '0',
  `keyword` varchar(255) NOT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `point_fk_1` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of search_log
-- ----------------------------
INSERT INTO `search_log` VALUES ('1', 'ap7r18c1vffq8l433s7hv8k3p4', '4', 'mac', '127.0.0.1', '1425889884', '1425889884');
INSERT INTO `search_log` VALUES ('2', 'ap7r18c1vffq8l433s7hv8k3p4', '4', 'mac', '127.0.0.1', '1425889902', '1425889902');
INSERT INTO `search_log` VALUES ('3', 'ap7r18c1vffq8l433s7hv8k3p4', '4', 'iphone', '127.0.0.1', '1425889907', '1425889907');
INSERT INTO `search_log` VALUES ('4', 'ae4ebbfhfg228a7b0gtqpubds5', null, 'mate', '127.0.0.1', '1425890119', '1425890119');
INSERT INTO `search_log` VALUES ('5', '0riaesian6o41iicraqvrbber3', '4', 'mac', '127.0.0.1', '1426217392', '1426217392');
INSERT INTO `search_log` VALUES ('6', '0riaesian6o41iicraqvrbber3', '4', 'mac', '127.0.0.1', '1426217489', '1426217489');
INSERT INTO `search_log` VALUES ('7', '0riaesian6o41iicraqvrbber3', '4', 'mac', '127.0.0.1', '1426217492', '1426217492');
INSERT INTO `search_log` VALUES ('8', '0riaesian6o41iicraqvrbber3', '4', 'mac', '127.0.0.1', '1426217502', '1426217502');
INSERT INTO `search_log` VALUES ('9', '0riaesian6o41iicraqvrbber3', '4', 'mac', '127.0.0.1', '1426217503', '1426217503');

-- ----------------------------
-- Table structure for `setting`
-- ----------------------------
DROP TABLE IF EXISTS `setting`;
CREATE TABLE `setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `code` varchar(32) NOT NULL,
  `type` varchar(32) NOT NULL,
  `store_range` varchar(255) DEFAULT NULL,
  `store_dir` varchar(255) DEFAULT NULL,
  `value` text,
  `sort_order` int(11) NOT NULL DEFAULT '50',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `code` (`code`),
  KEY `sort_order` (`sort_order`)
) ENGINE=InnoDB AUTO_INCREMENT=3116 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of setting
-- ----------------------------
INSERT INTO `setting` VALUES ('11', '0', 'info', 'group', '', '', '', '50');
INSERT INTO `setting` VALUES ('21', '0', 'basic', 'group', '', '', '', '50');
INSERT INTO `setting` VALUES ('31', '0', 'smtp', 'group', '', '', '', '50');
INSERT INTO `setting` VALUES ('1111', '11', 'siteName', 'text', '', '', 'Your Site', '50');
INSERT INTO `setting` VALUES ('1112', '11', 'siteTitle', 'text', '', '', 'Your Site Title', '50');
INSERT INTO `setting` VALUES ('1113', '11', 'siteKeyword', 'text', '', '', 'Your Site Keyword', '50');
INSERT INTO `setting` VALUES ('2111', '21', 'timezone', 'select', '-12,-11,-10,-9,-8,-7,-6,-5,-4,-3.5,-3,-2,-1,0,1,2,3,3.5,4,4.5,5,5.5,5.75,6,6.5,7,8,9,9.5,10,11,12', '', '8', '50');
INSERT INTO `setting` VALUES ('2112', '21', 'commentCheck', 'select', '0,1', '', '1', '50');
INSERT INTO `setting` VALUES ('3111', '31', 'smtpHost', 'text', '', '', 'localhost', '50');
INSERT INTO `setting` VALUES ('3112', '31', 'smtpPort', 'text', '', '', '', '50');
INSERT INTO `setting` VALUES ('3113', '31', 'smtpUser', 'text', '', '', '', '50');
INSERT INTO `setting` VALUES ('3114', '31', 'smtpPassword', 'password', '', '', '', '50');
INSERT INTO `setting` VALUES ('3115', '31', 'smtpMail', 'text', '', '', '', '50');

-- ----------------------------
-- Table structure for `shipment`
-- ----------------------------
DROP TABLE IF EXISTS `shipment`;
CREATE TABLE `shipment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `config` text,
  `print` text,
  `is_cod` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(11) NOT NULL DEFAULT '50',
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shipment
-- ----------------------------
INSERT INTO `shipment` VALUES ('1', 'SFKD', '顺丰快递', '', 'http://www.sf-express.com', '', '', '0', '50', '1', '1427870846', '1427870882');


-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `access_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00',
  `point` int(11) NOT NULL DEFAULT '0',
  `recommended_by` int(11) NOT NULL DEFAULT '0',
  `recommended_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `supported_by` int(11) NOT NULL DEFAULT '1',
  `auth_role` int(11) DEFAULT NULL,
  `role` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'user',
  `status` smallint(6) NOT NULL DEFAULT '1',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `role` (`role`),
  KEY `status` (`status`),
  KEY `created_at` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'bPdqSVmrWdkx-x7_hplXE_Y0Ak9mwdoE', null, null, '$2y$13$nPfitehXdoDuXh54XubLQeoM1K3x7o3FC2cRntMlB5Ek8MxO.Mohq', '', 'admin@demo.com', '0.00', '92', '0', null, '1', '1', 'admin', '1', '1422844005', '1426671417');
INSERT INTO `user` VALUES ('2', 'funson', 'kKhH4ApssxRXV8KMVDIdjWbfLHuZ8QKX', null, null, '$2y$13$mPADph/vUIG99kA1va69AuSdGFPSh41ypRCUKSyNgjFOmqV3ba9iS', '7Mgfilq9bMR_v3HryeVkywghZcsl4meV_1424760602', 'aaaaaa@qq.com', '0.00', '0', '0', null, '1', null, 'user', '1', '1424760601', '1424760601');
INSERT INTO `user` VALUES ('3', 'f1u', 'b9HEakeX52Hi4t5zrwRpMUS8weXseT0z', null, '', '$2y$13$LLNmu6r0F2Kyh579DiSAeeGjtdZa9gI8JjYyYFkvcxJERRCXe2aCa', 'EA6QF3z-y-_ZSIM0sscNaQtQMzUUY0I2_1424760683', 'sssssssssss@qq.com', '0.00', '0', '0', null, '1', null, 'user', '1', '1424760682', '1424760682');
INSERT INTO `user` VALUES ('4', 'shflg1234', 'Q23gMd-bAM9zAjAMXctUKZTAg5FO6zSm', null, '', '$2y$13$qd721qcGi4mX8K8dzJsiuOPm9lqQTKKQMtP0hqrct7ZjtN6fS9ASW', null, 'shflg1234@163.com', '0.00', '0', '0', null, '1', null, 'user', '1', '1424760732', '1426650201');
INSERT INTO `user` VALUES ('5', 'funson861', 'GCOaVEA51DhG2iw5eKP0iQxyJ-OFMk6X', null, null, '$2y$13$YXLc19vytQzXouIB8dH3kuowXc5xtM8CxJzTepMOvfeo9neA31H0q', null, 'W2@qq.com', '0.00', '0', '0', null, '1', null, 'user', '1', '1424761292', '1424761292');
INSERT INTO `user` VALUES ('6', 'funson2', 'mmA_gaxTef8VPjOfovqIbZrsjuZiQz1C', null, null, '$2y$13$JgmjDCstpiPe1F8AvasfIOgqAWt8mwhWucGiRPl77XfUo/6j2dRlS', null, 'aaaa@qq.com', '0.00', '0', '0', null, '2', null, 'user', '1', '1424761739', '1424761739');
INSERT INTO `user` VALUES ('7', 'funson3', 'pMtAbZV6b0b6CXFR9yFls3Hy5QZduCML', null, null, '$2y$13$vg62tLxcl3Kme3OsCOod0uKHnz1WYXHo8/Xh78pIL3XhC1ybUKsoS', null, 'W21@qq.com', '0.00', '0', '0', null, '1', null, 'user', '1', '1424761861', '1424761861');
INSERT INTO `user` VALUES ('8', 'funson10', 'zr7F7vSIm699lDMuwRm2u7vZpUWDJWYb', null, null, '$2y$13$JmQZrmIzPAg4E/EGZnLiGukN6FK1xxrXeCbamMfGq2kYx/KUAgeZy', null, 'adssf@qq.com', '0.00', '0', '0', null, '1', null, 'user', '1', '1424762742', '1424762742');
INSERT INTO `user` VALUES ('9', 'funson100', 'yyaQ_U9-T02-C6mLglNtJkpXYZoktAch', null, null, '$2y$13$e0fSrMONQ5qMG.Il0pRVte3xj3ljXqk6e.3HrigPygy32HKZmp4JG', null, 'funson100@gmail.com', '0.00', '0', '2', null, '2', '1', 'user', '1', '1425374246', '1427944121');
INSERT INTO `user` VALUES ('10', 'testaaa', '1X5jgHtlr2daEYUFPxWJqV6FPodbcbWu', null, null, '$2y$13$JL9lTKf6W0AkuBcXiwUa0upQd3FYRTZhqOLbJid83ksg1lBz9bgpO', 'CjLjmN5oKHfx7ksJ6xROmvP61Fkrx8gp_1425624392', 'aaaaaaaaa@aa.com', '0.00', '0', '0', null, '1', '1', 'user', '1', '1425624391', '1425624391');
INSERT INTO `user` VALUES ('11', 'tttttt', '1Jkkpwrt1rs5p40ZjGIMTuNhhOTuMafp', null, null, '$2y$13$8lsP4QVwwLpq7cWz/L2wz.Fgj70u2sWyX7sZDbTIiAtMX1iTtHAQ.', null, 'ttttttt@qq.com', '0.00', '0', '1', null, '1', null, 'user', '1', '1427880736', '1427942919');
INSERT INTO `user` VALUES ('12', 'shflg12345', 'exYJ6pPz6cwA1vL0oK9JLbnyLLwGx09J', null, null, '$2y$13$bCGLNjrTUZCAblwZsRfMyuzpkbO2ThBGCJoBThc5wum0csBEXnlxi', null, 'ssfs@qq.com', '0.00', '0', '0', null, '1', null, 'user', '1', '1427880850', '1427880850');
INSERT INTO `user` VALUES ('13', 'funson22', '7BrnagtxCk9pJji2ZYEdsQQ7YZV0RsY9', null, null, '$2y$13$0iEd8QcwixXCwi5TNyXuTe6iLpjqX.W/n.ily9kukqRiYt.FP51xO', null, 'sdfs@qq.com', '0.00', '0', '6', null, '2', null, 'user', '1', '1427880985', '1427942919');
INSERT INTO `user` VALUES ('14', 'ffffff', 'bl0O23p1typGlOEPwBjyrPC72gPwijyp', null, null, '$2y$13$lCefczQmpVTXpYQiSfcdd.4Ym3QjS8tOqoC2QvneoF/5dgOYblnDm', null, 'ffffffffsd@qq.com', '0.00', '0', '0', 'fuasd', '1', null, 'user', '-1', '1427936047', '1427942859');
INSERT INTO `user` VALUES ('15', 'ssssssssssss', 'thRA6v5q-LVo4M0M_z34CI6qcEQRY8vT', null, null, '$2y$13$O5GCd7GIlDZ8alQFAo5YZuvJAFWwH5MDaDuc1BdwKMJjJ/Y9FdeHe', null, 'sssss1ssss@qq.com', '0.00', '0', '6', 'funson2', '2', null, 'user', '1', '1427936200', '1427942919');
INSERT INTO `user` VALUES ('16', 'hahaa', 'fS_yXCcBbYyOLNIKc116iXRpjKBf7FQZ', null, null, '$2y$13$hC/LPRPmVG93olMo0cf7nuvPuombOBVDeZZdoP/DGPWaTUhXwpKlO', null, 'haha@qq.com', '0.00', '0', '8', 'funson10', '1', null, 'user', '1', '1427937282', '1427942919');

-- ----------------------------
-- Table structure for `user_email`
-- ----------------------------
DROP TABLE IF EXISTS `user_email`;
CREATE TABLE `user_email` (
  `user_id` int(11) NOT NULL,
  `email` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `token` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`user_id`,`token`),
  CONSTRAINT `FK_user_email_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user_email
-- ----------------------------
