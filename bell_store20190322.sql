/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : localhost:3306
 Source Schema         : bell_store

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 22/03/2019 22:29:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cms_subject
-- ----------------------------
DROP TABLE IF EXISTS `cms_subject`;
CREATE TABLE `cms_subject` (
  `id` varchar(32) NOT NULL,
  `category_id` varchar(32) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `pic` varchar(500) DEFAULT NULL COMMENT '专题主图',
  `product_count` int(11) DEFAULT NULL COMMENT '关联产品数量',
  `recommend_status` int(1) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `collect_count` int(11) DEFAULT NULL,
  `read_count` int(11) DEFAULT NULL,
  `comment_count` int(11) DEFAULT NULL,
  `album_pics` varchar(1000) DEFAULT NULL COMMENT '画册图片用逗号分割',
  `description` varchar(1000) DEFAULT NULL,
  `show_status` int(1) DEFAULT NULL COMMENT '显示状态：0->不显示；1->显示',
  `content` mediumtext,
  `category_name` varchar(200) DEFAULT NULL COMMENT '专题分类名称',
  `forward_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='专题表';

-- ----------------------------
-- Table structure for cms_subject_category
-- ----------------------------
DROP TABLE IF EXISTS `cms_subject_category`;
CREATE TABLE `cms_subject_category` (
  `id` varchar(32) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `icon` varchar(500) DEFAULT NULL,
  `subject_count` int(11) DEFAULT NULL COMMENT '专题数量',
  `show_status` int(1) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='专题分类表';

-- ----------------------------
-- Table structure for cms_subject_comment
-- ----------------------------
DROP TABLE IF EXISTS `cms_subject_comment`;
CREATE TABLE `cms_subject_comment` (
  `id` varchar(32) NOT NULL,
  `subject_id` varchar(32) DEFAULT NULL,
  `member_nick_name` varchar(255) DEFAULT NULL,
  `member_icon` varchar(255) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `show_status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='专题评论表';

-- ----------------------------
-- Table structure for cms_subject_product_relation
-- ----------------------------
DROP TABLE IF EXISTS `cms_subject_product_relation`;
CREATE TABLE `cms_subject_product_relation` (
  `id` varchar(32) NOT NULL,
  `subject_id` varchar(32) DEFAULT NULL,
  `product_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='专题商品关系表';

-- ----------------------------
-- Table structure for oms_cart_item
-- ----------------------------
DROP TABLE IF EXISTS `oms_cart_item`;
CREATE TABLE `oms_cart_item` (
  `id` varchar(32) NOT NULL,
  `product_id` varchar(32) DEFAULT NULL,
  `product_sku_id` varchar(32) DEFAULT NULL,
  `member_id` varchar(32) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL COMMENT '购买数量',
  `price` decimal(10,2) DEFAULT NULL COMMENT '添加到购物车的价格',
  `sp1` varchar(200) DEFAULT NULL COMMENT '销售属性1',
  `sp2` varchar(200) DEFAULT NULL COMMENT '销售属性2',
  `sp3` varchar(200) DEFAULT NULL COMMENT '销售属性3',
  `product_pic` varchar(1000) DEFAULT NULL COMMENT '商品主图',
  `product_name` varchar(500) DEFAULT NULL COMMENT '商品名称',
  `product_sub_title` varchar(500) DEFAULT NULL COMMENT '商品副标题（卖点）',
  `product_sku_code` varchar(200) DEFAULT NULL COMMENT '商品sku条码',
  `member_nickname` varchar(500) DEFAULT NULL COMMENT '会员昵称',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_date` datetime DEFAULT NULL COMMENT '修改时间',
  `delete_status` int(1) DEFAULT NULL COMMENT '是否删除:0->否，1->是',
  `product_category_id` varchar(32) DEFAULT NULL COMMENT '商品分类',
  `product_sn` varchar(200) DEFAULT NULL,
  `product_brand` varchar(200) DEFAULT NULL COMMENT '商品品牌',
  `product_attr` varchar(500) DEFAULT NULL COMMENT '商品销售属性:[{"key":"颜色","value":"颜色"},{"key":"容量","value":"4G"}]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='购物车表';

-- ----------------------------
-- Table structure for oms_company_address
-- ----------------------------
DROP TABLE IF EXISTS `oms_company_address`;
CREATE TABLE `oms_company_address` (
  `id` varchar(32) NOT NULL,
  `address_name` varchar(200) DEFAULT NULL COMMENT '名称',
  `send_status` int(1) DEFAULT NULL COMMENT '默认发货地址：0->否；1->是',
  `receive_status` int(1) DEFAULT NULL COMMENT '是否默认收货地址：0->否；1->是',
  `name` varchar(64) DEFAULT NULL COMMENT '收发货人姓名',
  `phone` varchar(64) DEFAULT NULL COMMENT '收货人电话',
  `province` varchar(64) DEFAULT NULL COMMENT '省/直辖市',
  `city` varchar(64) DEFAULT NULL COMMENT '市',
  `region` varchar(64) DEFAULT NULL COMMENT '区/县',
  `detail_address` varchar(200) DEFAULT NULL COMMENT '详细地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司收发货地址表';

-- ----------------------------
-- Table structure for oms_order
-- ----------------------------
DROP TABLE IF EXISTS `oms_order`;
CREATE TABLE `oms_order` (
  `id` varchar(32) NOT NULL,
  `member_id` varchar(32) DEFAULT NULL,
  `coupon_id` varchar(32) DEFAULT NULL,
  `order_sn` varchar(64) DEFAULT NULL COMMENT '订单编号',
  `create_time` datetime DEFAULT NULL COMMENT '提交时间',
  `member_username` varchar(64) DEFAULT NULL COMMENT '用户账号',
  `total_amount` decimal(10,2) DEFAULT NULL COMMENT '订单总金额',
  `pay_amount` decimal(10,2) DEFAULT NULL COMMENT '应付金额（实际支付金额）',
  `freight_amount` decimal(10,2) DEFAULT NULL COMMENT '运费金额',
  `discount_amount` decimal(10,2) DEFAULT NULL COMMENT '管理员后台调整订单使用的折扣金额',
  `pay_type` int(1) DEFAULT NULL COMMENT '支付方式：0->未支付；1->支付宝；2->微信',
  `source_type` int(1) DEFAULT NULL COMMENT '订单来源：0->PC订单；1->app订单',
  `status` int(1) DEFAULT NULL COMMENT '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
  `delivery_company` varchar(64) DEFAULT NULL COMMENT '物流公司(配送方式)',
  `delivery_sn` varchar(64) DEFAULT NULL COMMENT '物流单号',
  `auto_confirm_day` int(11) DEFAULT NULL COMMENT '自动确认时间（天）',
  `bill_type` int(1) DEFAULT NULL COMMENT '发票类型：0->不开发票；1->电子发票；2->纸质发票',
  `bill_header` varchar(200) DEFAULT NULL COMMENT '发票抬头',
  `bill_content` varchar(200) DEFAULT NULL COMMENT '发票内容',
  `bill_receiver_phone` varchar(32) DEFAULT NULL COMMENT '收票人电话',
  `bill_receiver_email` varchar(64) DEFAULT NULL COMMENT '收票人邮箱',
  `receiver_name` varchar(100) DEFAULT NULL COMMENT '收货人姓名',
  `receiver_phone` varchar(32) DEFAULT NULL COMMENT '收货人电话',
  `receiver_post_code` varchar(32) DEFAULT NULL COMMENT '收货人邮编',
  `receiver_province` varchar(32) DEFAULT NULL COMMENT '省/直辖市',
  `receiver_city` varchar(32) DEFAULT NULL COMMENT '市',
  `receiver_region` varchar(32) DEFAULT NULL COMMENT '区/县',
  `oms_ordercol` varchar(32) DEFAULT NULL COMMENT '详细地址',
  `receiver_detail_address` varchar(200) DEFAULT NULL,
  `note` varchar(500) DEFAULT NULL COMMENT '订单备注',
  `confirm_status` int(1) DEFAULT NULL COMMENT '确认收货状态：0->未确认；1->已确认',
  `delete_status` int(1) DEFAULT NULL COMMENT '删除状态：0->未删除；1->已删除',
  `payment_time` datetime DEFAULT NULL COMMENT '支付时间',
  `delivery_time` datetime DEFAULT NULL COMMENT '发货时间',
  `receive_time` datetime DEFAULT NULL COMMENT '确认收货时间',
  `comment_time` datetime DEFAULT NULL COMMENT '评价时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单表';

-- ----------------------------
-- Table structure for oms_order_item
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_item`;
CREATE TABLE `oms_order_item` (
  `id` varchar(32) NOT NULL,
  `order_id` varchar(32) DEFAULT NULL COMMENT '订单id',
  `order_sn` varchar(64) DEFAULT NULL COMMENT '订单编号',
  `product_id` varchar(32) DEFAULT NULL,
  `product_pic` varchar(500) DEFAULT NULL,
  `product_name` varchar(200) DEFAULT NULL,
  `product_brand` varchar(200) DEFAULT NULL,
  `product_sn` varchar(64) DEFAULT NULL,
  `product_price` decimal(10,2) DEFAULT NULL COMMENT '销售价格',
  `product_quantity` int(11) DEFAULT NULL COMMENT '购买数量',
  `product_sku_id` varchar(32) DEFAULT NULL COMMENT '商品sku编号',
  `product_sku_code` varchar(50) DEFAULT NULL COMMENT '商品sku条码',
  `product_category_id` varchar(32) DEFAULT NULL COMMENT '商品分类id',
  `sp1` varchar(100) DEFAULT NULL COMMENT '商品的销售属性',
  `sp2` varchar(100) DEFAULT NULL,
  `sp3` varchar(100) DEFAULT NULL,
  `product_attr` varchar(500) DEFAULT NULL COMMENT '商品销售属性:[{"key":"颜色","value":"颜色"},{"key":"容量","value":"4G"}]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单中所包含的商品';

-- ----------------------------
-- Table structure for oms_order_operate_history
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_operate_history`;
CREATE TABLE `oms_order_operate_history` (
  `id` varchar(32) NOT NULL,
  `order_id` varchar(32) DEFAULT NULL COMMENT '订单id',
  `operate_man` varchar(100) DEFAULT NULL COMMENT '操作人：用户；系统；后台管理员',
  `create_time` datetime DEFAULT NULL COMMENT '操作时间',
  `order_status` int(1) DEFAULT NULL COMMENT '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
  `note` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单操作历史记录';

-- ----------------------------
-- Table structure for oms_order_return_apply
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_return_apply`;
CREATE TABLE `oms_order_return_apply` (
  `id` varchar(32) NOT NULL,
  `order_id` varchar(32) DEFAULT NULL COMMENT '订单id',
  `company_address_id` varchar(32) DEFAULT NULL,
  `product_id` varchar(32) DEFAULT NULL COMMENT '退货商品id',
  `order_sn` varchar(64) DEFAULT NULL COMMENT '订单编号',
  `create_time` datetime DEFAULT NULL COMMENT '申请时间',
  `member_username` varchar(64) DEFAULT NULL COMMENT '会员用户名',
  `return_amount` decimal(10,2) DEFAULT NULL COMMENT '退款金额',
  `return_name` varchar(100) DEFAULT NULL COMMENT '退货人姓名',
  `return_phone` varchar(32) DEFAULT NULL COMMENT '退货人电话',
  `status` int(1) DEFAULT NULL COMMENT '申请状态：0->待处理；1->退货中；2->已完成；3->已拒绝',
  `handle_time` datetime DEFAULT NULL COMMENT '处理时间',
  `product_pic` varchar(500) DEFAULT NULL COMMENT '商品图片',
  `product_name` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `product_brand` varchar(200) DEFAULT NULL COMMENT '商品品牌',
  `product_attr` varchar(500) DEFAULT NULL COMMENT '商品销售属性：颜色：红色；尺码：xl;',
  `product_count` int(11) DEFAULT NULL COMMENT '退货数量',
  `product_price` decimal(10,2) DEFAULT NULL COMMENT '商品单价',
  `product_real_price` decimal(10,2) DEFAULT NULL COMMENT '商品实际支付单价',
  `reason` varchar(200) DEFAULT NULL COMMENT '原因',
  `description` varchar(500) DEFAULT NULL COMMENT '描述',
  `proof_pics` varchar(1000) DEFAULT NULL COMMENT '凭证图片，以逗号隔开',
  `handle_note` varchar(500) DEFAULT NULL COMMENT '处理备注',
  `handle_man` varchar(100) DEFAULT NULL COMMENT '处理人员',
  `receive_man` varchar(100) DEFAULT NULL COMMENT '收货人',
  `receive_time` datetime DEFAULT NULL COMMENT '收货时间',
  `receive_note` varchar(500) DEFAULT NULL COMMENT '收货备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单退货申请';

-- ----------------------------
-- Table structure for oms_order_return_reason
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_return_reason`;
CREATE TABLE `oms_order_return_reason` (
  `id` varchar(32) NOT NULL,
  `name` varchar(100) DEFAULT NULL COMMENT '退货类型',
  `sort` int(11) DEFAULT NULL COMMENT '顺序',
  `status` int(1) DEFAULT NULL COMMENT '状态：0->不启用；1->启用',
  `create_time` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='退货原因表';

-- ----------------------------
-- Table structure for oms_order_setting
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_setting`;
CREATE TABLE `oms_order_setting` (
  `id` varchar(32) NOT NULL,
  `flash_order_overtime` int(11) DEFAULT NULL COMMENT '秒杀订单超时关闭时间(分)',
  `normal_order_overtime` int(11) DEFAULT NULL COMMENT '正常订单超时时间(分)',
  `confirm_overtime` int(11) DEFAULT NULL COMMENT '发货后自动确认收货时间（天）',
  `finish_overtime` int(11) DEFAULT NULL COMMENT '自动完成交易时间，不能申请售后（天）',
  `comment_overtime` int(11) DEFAULT NULL COMMENT '订单完成后自动好评时间（天）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单设置表';

-- ----------------------------
-- Table structure for pms_album
-- ----------------------------
DROP TABLE IF EXISTS `pms_album`;
CREATE TABLE `pms_album` (
  `id` varchar(32) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `cover_pic` varchar(1000) DEFAULT NULL,
  `pic_count` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='相册表';

-- ----------------------------
-- Table structure for pms_album_pic
-- ----------------------------
DROP TABLE IF EXISTS `pms_album_pic`;
CREATE TABLE `pms_album_pic` (
  `id` varchar(32) NOT NULL,
  `album_id` varchar(32) DEFAULT NULL,
  `pic` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='画册图片表';

-- ----------------------------
-- Table structure for pms_brand
-- ----------------------------
DROP TABLE IF EXISTS `pms_brand`;
CREATE TABLE `pms_brand` (
  `id` varchar(32) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `first_letter` varchar(8) DEFAULT NULL COMMENT '首字母',
  `sort` int(11) DEFAULT NULL,
  `factory_status` int(1) DEFAULT NULL COMMENT '是否为品牌制造商：0->不是；1->是',
  `show_status` int(1) DEFAULT NULL,
  `product_count` int(11) DEFAULT NULL COMMENT '产品数量',
  `product_comment_count` int(11) DEFAULT NULL COMMENT '产品评论数量',
  `logo` varchar(255) DEFAULT NULL COMMENT '品牌logo',
  `big_pic` varchar(255) DEFAULT NULL COMMENT '专区大图',
  `brand_story` text COMMENT '品牌故事',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='品牌表';

-- ----------------------------
-- Records of pms_brand
-- ----------------------------
BEGIN;
INSERT INTO `pms_brand` VALUES ('1', '机械工业出版社', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_brand` VALUES ('2', '电子工业出版社', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_brand` VALUES ('3', '中国社会科学出版社', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_brand` VALUES ('4', '人民文学出版社', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_brand` VALUES ('5', '清华大学出版社', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_brand` VALUES ('6', '商务印书馆', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_brand` VALUES ('7', '人民邮电出版社', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for pms_comment
-- ----------------------------
DROP TABLE IF EXISTS `pms_comment`;
CREATE TABLE `pms_comment` (
  `id` varchar(32) NOT NULL,
  `product_id` varchar(32) DEFAULT NULL,
  `member_nick_name` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `star` int(3) DEFAULT NULL COMMENT '评价星数：0->5',
  `member_ip` varchar(64) DEFAULT NULL COMMENT '评价的ip',
  `create_time` datetime DEFAULT NULL,
  `show_status` int(1) DEFAULT NULL,
  `product_attribute` varchar(255) DEFAULT NULL COMMENT '购买时的商品属性',
  `collect_couont` int(11) DEFAULT NULL COMMENT '评论总数',
  `read_count` int(11) DEFAULT NULL,
  `content` mediumtext,
  `pics` varchar(1000) DEFAULT NULL COMMENT '上传图片地址，以逗号隔开',
  `member_icon` varchar(255) DEFAULT NULL COMMENT '评论用户头像',
  `replay_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品评价表';

-- ----------------------------
-- Table structure for pms_comment_replay
-- ----------------------------
DROP TABLE IF EXISTS `pms_comment_replay`;
CREATE TABLE `pms_comment_replay` (
  `id` varchar(32) NOT NULL,
  `comment_id` varchar(32) DEFAULT NULL,
  `member_nick_name` varchar(255) DEFAULT NULL,
  `member_icon` varchar(255) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `type` int(1) DEFAULT NULL COMMENT '评论人员类型；0->会员；1->管理员',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品评价回复表';

-- ----------------------------
-- Table structure for pms_feight_template
-- ----------------------------
DROP TABLE IF EXISTS `pms_feight_template`;
CREATE TABLE `pms_feight_template` (
  `id` varchar(32) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `charge_type` int(1) DEFAULT NULL COMMENT '计费类型:0->按重量；1->按件数',
  `first_weight` decimal(10,2) DEFAULT NULL COMMENT '首重kg',
  `first_fee` decimal(10,2) DEFAULT NULL COMMENT '首费（元）',
  `continue_weight` decimal(10,2) DEFAULT NULL,
  `continme_fee` decimal(10,2) DEFAULT NULL,
  `dest` varchar(255) DEFAULT NULL COMMENT '目的地（省、市）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='运费模板';

-- ----------------------------
-- Table structure for pms_product
-- ----------------------------
DROP TABLE IF EXISTS `pms_product`;
CREATE TABLE `pms_product` (
  `id` varchar(32) NOT NULL,
  `brand_id` varchar(32) DEFAULT NULL COMMENT '品牌id',
  `product_category_id` varchar(32) DEFAULT NULL COMMENT '商品分类id',
  `feight_template_id` varchar(32) DEFAULT NULL COMMENT '运费计算类型id',
  `product_attribute_category_id` varchar(32) DEFAULT NULL COMMENT '商品参数分类',
  `name` varchar(64) DEFAULT NULL,
  `picture_url` varchar(255) DEFAULT NULL COMMENT '图片url',
  `product_sn` varchar(64) DEFAULT NULL COMMENT '货号',
  `delete_status` int(1) DEFAULT NULL COMMENT '删除状态：0->未删除；1->已删除',
  `publish_status` int(1) DEFAULT NULL COMMENT '上架状态：0->下架；1->上架',
  `new_status` int(1) DEFAULT NULL COMMENT '新品状态:0->不是新品；1->新品',
  `recommand_status` int(1) DEFAULT NULL COMMENT '推荐状态；0->不推荐；1->推荐',
  `verify_status` int(1) DEFAULT NULL COMMENT '审核状态：0->未审核；1->审核通过',
  `sort` int(11) DEFAULT NULL COMMENT '顺序',
  `sale` int(11) DEFAULT NULL COMMENT '销量',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `promotion_price` decimal(10,2) DEFAULT NULL COMMENT '促销价格',
  `sub_title` varchar(255) DEFAULT NULL COMMENT '副标题',
  `description` mediumtext COMMENT '商品描述',
  `original_price` decimal(10,2) DEFAULT NULL COMMENT '市场价',
  `stock` int(11) DEFAULT NULL COMMENT '库存',
  `low_stock` int(11) DEFAULT NULL COMMENT '库存预警值',
  `unit` varchar(16) DEFAULT NULL COMMENT '单位',
  `weight` decimal(10,2) DEFAULT NULL COMMENT '商品重量，默认为克',
  `preview_status` int(1) DEFAULT NULL COMMENT '是否为预告商品：0->不是；1->是',
  `service_ids` varchar(64) DEFAULT NULL COMMENT '以逗号分割的产品服务：1->无忧退货；2->快速退款；3->免费包邮',
  `keywords` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `album_pics` varchar(255) DEFAULT NULL COMMENT '画册图片，连产品图片限制为5张，以逗号分割',
  `detail_title` varchar(255) DEFAULT NULL,
  `detail_desc` mediumtext COMMENT '商品详细介绍',
  `detail_html` longtext COMMENT '产品详情网页内容',
  `brand_name` varchar(255) DEFAULT NULL COMMENT '品牌名称',
  `product_category_name` varchar(255) DEFAULT NULL COMMENT '商品分类名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品信息表';

-- ----------------------------
-- Table structure for pms_product_attribute
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_attribute`;
CREATE TABLE `pms_product_attribute` (
  `id` varchar(32) NOT NULL,
  `product_attribute_category_id` varchar(32) DEFAULT NULL COMMENT '书籍分类id',
  `name` varchar(64) DEFAULT NULL,
  `select_type` int(1) DEFAULT NULL COMMENT '属性选择类型：0->唯一；1->单选；2->多选',
  `input_type` int(1) DEFAULT NULL COMMENT '属性录入方式：0->手工录入；1->从列表中选取',
  `input_list` varchar(255) DEFAULT NULL COMMENT '可选值列表，以逗号隔开',
  `sort` int(11) DEFAULT NULL COMMENT '排序字段：最高的可以单独上传图片',
  `search_type` int(1) DEFAULT NULL COMMENT '检索类型；0->不需要进行检索；1->关键字检索；2->范围检索',
  `hand_add_status` int(1) DEFAULT NULL COMMENT '是否支持手动新增；0->不支持；1->支持',
  `type` int(1) DEFAULT NULL COMMENT '属性的类型；0->规格；1->参数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品属性参数表';

-- ----------------------------
-- Table structure for pms_product_attribute_category
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_attribute_category`;
CREATE TABLE `pms_product_attribute_category` (
  `id` varchar(32) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `attribute_count` int(11) DEFAULT NULL COMMENT '属性数量',
  `param_count` int(11) DEFAULT NULL COMMENT '参数数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品属性分类表';

-- ----------------------------
-- Table structure for pms_product_attribute_value
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_attribute_value`;
CREATE TABLE `pms_product_attribute_value` (
  `id` varchar(32) NOT NULL,
  `product_id` varchar(32) DEFAULT NULL,
  `product_attribute_id` varchar(32) DEFAULT NULL,
  `value` varchar(64) DEFAULT NULL COMMENT '手动添加规格或参数的值，参数单值，规格有多个时以逗号隔开',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='存储产品参数信息的表';

-- ----------------------------
-- Table structure for pms_product_category
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_category`;
CREATE TABLE `pms_product_category` (
  `id` varchar(32) NOT NULL,
  `parent_id` varchar(32) DEFAULT NULL COMMENT '上机分类的编号：0表示一级分类',
  `name` varchar(64) DEFAULT NULL,
  `level` int(1) DEFAULT NULL COMMENT '分类级别：0->1级；1->2级',
  `product_count` int(11) DEFAULT NULL,
  `product_unit` varchar(64) DEFAULT NULL,
  `nav_status` int(1) DEFAULT NULL COMMENT '是否显示在导航栏：0->不显示；1->显示',
  `show_status` int(1) DEFAULT NULL COMMENT '显示状态：0->不显示；1->显示',
  `sort` int(11) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `keywords` varchar(255) DEFAULT NULL,
  `description` mediumtext COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品分类';

-- ----------------------------
-- Records of pms_product_category
-- ----------------------------
BEGIN;
INSERT INTO `pms_product_category` VALUES ('1', '0', '文学艺术', 0, 1000, '本', 1, 1, 1, NULL, '文学艺术', '文学艺术');
INSERT INTO `pms_product_category` VALUES ('10', '2', '幼儿启蒙', 1, 1000, '本', 0, 0, 0, NULL, '幼儿启蒙', '幼儿启蒙');
INSERT INTO `pms_product_category` VALUES ('11', '2', '玩具书', 1, 1000, '本', 0, 0, 0, NULL, '玩具书', '益智游戏');
INSERT INTO `pms_product_category` VALUES ('12', '2', '益智游戏', 1, 1000, '本', 0, 0, 0, NULL, '益智游戏', '益智游戏');
INSERT INTO `pms_product_category` VALUES ('13', '3', '历史政治', 1, 1000, '本', 0, 0, 0, NULL, '历史政治', '历史政治');
INSERT INTO `pms_product_category` VALUES ('14', '3', '社会科学', 1, 1000, '本', 0, 0, 0, NULL, '社会科学', '社会科学');
INSERT INTO `pms_product_category` VALUES ('15', '3', '法律', 1, 1000, '本', 0, 0, 0, NULL, '法律', '法律');
INSERT INTO `pms_product_category` VALUES ('2', '0', '少儿', 0, 1000, '本', 1, 1, 1, NULL, '少儿', '少儿');
INSERT INTO `pms_product_category` VALUES ('3', '0', '人文社科', 0, 1000, '本', 1, 1, 1, NULL, '人文社科', '人文社科');
INSERT INTO `pms_product_category` VALUES ('3ca17ffc402511e9a27267aa20a0c3f1', '6', 'IT', 1, 0, '本', 0, 0, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES ('4', '0', '经管励志', 0, 1000, '本', 1, 1, 1, NULL, '经管励志', '经管励志');
INSERT INTO `pms_product_category` VALUES ('4b32c60c402511e9a27267aa20a0c3f1', '6', 'IT', 1, 0, '本', 0, 0, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES ('5', '0', '健康生活', 0, 1000, '本', 1, 1, 1, NULL, '健康生活', '健康生活');
INSERT INTO `pms_product_category` VALUES ('6', '0', '科技', 0, 1000, '本', 1, 1, 1, NULL, '科技', '科技');
INSERT INTO `pms_product_category` VALUES ('7', '1', '小说', 1, 1000, '本', 0, 0, 0, NULL, '小说', '小说');
INSERT INTO `pms_product_category` VALUES ('8', '1', '散文随笔', 1, 1000, '本', 0, 0, 0, NULL, '散文随笔', '散文随笔');
INSERT INTO `pms_product_category` VALUES ('9', '1', '青春文学', 1, 1000, '本', 0, 0, 0, NULL, '青春文学', '青春文学');
COMMIT;

-- ----------------------------
-- Table structure for pms_product_category_attribute_relation
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_category_attribute_relation`;
CREATE TABLE `pms_product_category_attribute_relation` (
  `id` varchar(32) NOT NULL,
  `product_category_id` varchar(32) DEFAULT NULL,
  `product_attribute_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品的分类和属性关系表，用于设置分类筛选条件，只支持一级';

-- ----------------------------
-- Table structure for pms_product_operate_log
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_operate_log`;
CREATE TABLE `pms_product_operate_log` (
  `id` varchar(32) NOT NULL,
  `product_id` varchar(32) DEFAULT NULL,
  `price_old` decimal(10,2) DEFAULT NULL,
  `price_new` decimal(10,2) DEFAULT NULL,
  `sale_price_old` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品操作日志表';

-- ----------------------------
-- Table structure for pms_product_vertify_record
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_vertify_record`;
CREATE TABLE `pms_product_vertify_record` (
  `id` varchar(32) NOT NULL,
  `product_id` varchar(32) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `vertify_man` varchar(64) DEFAULT NULL COMMENT '审核人',
  `status` int(1) DEFAULT NULL,
  `detail` varchar(255) DEFAULT NULL COMMENT '反馈详情',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品审核记录';

-- ----------------------------
-- Table structure for pms_sku_stock
-- ----------------------------
DROP TABLE IF EXISTS `pms_sku_stock`;
CREATE TABLE `pms_sku_stock` (
  `id` varchar(32) NOT NULL,
  `product_id` varchar(32) DEFAULT NULL,
  `sku_code` varchar(64) DEFAULT NULL COMMENT 'sku编码',
  `price` decimal(10,2) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL COMMENT '库存',
  `low_stock` int(11) DEFAULT NULL COMMENT '预警库存',
  `sp1` varchar(64) DEFAULT NULL,
  `sp2` varchar(64) DEFAULT NULL,
  `sp3` varchar(64) DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL COMMENT '展示图片',
  `sale` int(11) DEFAULT NULL COMMENT '销量',
  `lock_stock` int(11) DEFAULT NULL COMMENT '锁定库存',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='sku的库存';

-- ----------------------------
-- Table structure for sms_home_advertise
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_advertise`;
CREATE TABLE `sms_home_advertise` (
  `id` varchar(32) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `type` int(1) DEFAULT NULL COMMENT '轮播位置：0->PC首页轮播；1->app首页轮播',
  `pic` varchar(500) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `status` int(1) DEFAULT NULL COMMENT '上下线状态：0->下线；1->上线',
  `click_count` int(11) DEFAULT NULL COMMENT '点击数',
  `order_count` int(11) DEFAULT NULL COMMENT '下单数',
  `url` varchar(500) DEFAULT NULL COMMENT '链接地址',
  `note` varchar(500) DEFAULT NULL COMMENT '备注',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='首页轮播广告表';

-- ----------------------------
-- Table structure for sms_home_new_product
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_new_product`;
CREATE TABLE `sms_home_new_product` (
  `id` varchar(32) NOT NULL,
  `product_id` varchar(32) DEFAULT NULL,
  `product_name` varchar(64) DEFAULT NULL,
  `recommend_status` int(1) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='新鲜好物表';

-- ----------------------------
-- Table structure for sms_home_recommend_product
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_recommend_product`;
CREATE TABLE `sms_home_recommend_product` (
  `id` varchar(32) NOT NULL,
  `product_id` varchar(32) DEFAULT NULL,
  `product_name` varchar(64) DEFAULT NULL,
  `recommend_status` int(1) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='人气推荐商品表';

-- ----------------------------
-- Table structure for sms_home_recommend_subject
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_recommend_subject`;
CREATE TABLE `sms_home_recommend_subject` (
  `id` varchar(32) NOT NULL,
  `subject_id` varchar(32) DEFAULT NULL,
  `subject_name` varchar(64) DEFAULT NULL,
  `recommend_status` int(1) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='首页推荐专题表';

-- ----------------------------
-- Table structure for ums_admin
-- ----------------------------
DROP TABLE IF EXISTS `ums_admin`;
CREATE TABLE `ums_admin` (
  `id` varchar(32) NOT NULL,
  `username` varchar(64) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `icon` varchar(500) DEFAULT NULL COMMENT '头像',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `nick_name` varchar(100) DEFAULT NULL COMMENT '昵称',
  `note` varchar(500) DEFAULT NULL COMMENT '备注信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `status` int(1) DEFAULT NULL COMMENT '帐号启用状态：0->禁用；1->启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='后台用户表';

-- ----------------------------
-- Records of ums_admin
-- ----------------------------
BEGIN;
INSERT INTO `ums_admin` VALUES ('1', 'admin', '$2a$10$DmpkG4j/f0hlATTkF89yauENG4ezRbkCbcDh./QpKQ48WyyvlUaC.', NULL, '450739863@qq.com', 'admin', '我是管理员', '2019-02-25 23:26:00', '2019-03-22 08:36:35', 1);
INSERT INTO `ums_admin` VALUES ('15530133578948237401', 'xlc3', '$2a$10$yDJBaIbEjGYxe2q2Je5EOOERNHeaYnt2QiQYyZdWSbYcW5MP3tuP2', NULL, 'xlc3@qq.com', 'xlc3', 'xlc3', '2019-03-19 11:35:58', NULL, 1);
INSERT INTO `ums_admin` VALUES ('2', 'test', '$2a$10$4G9CmEKWL/rJzPmIjzT/P.qKujIn6/axCbH6Jak5m49eqpc7aEUY6', NULL, 'test@qq.com', 'test', 'test账户', '2019-03-02 10:04:34', '2019-03-04 09:03:38', 1);
INSERT INTO `ums_admin` VALUES ('bc1749443d0811e9a2e2e7aeb16d0df8', 'test2', '$2a$10$EpAVB92WjPvs1Ele99YaE.faMn7eHCvy0aFYtjEy77DY9znOqxX/e', NULL, 'test@qq.com', 'test', 'test账户', '2019-03-02 10:32:14', NULL, 1);
COMMIT;

-- ----------------------------
-- Table structure for ums_admin_login_log
-- ----------------------------
DROP TABLE IF EXISTS `ums_admin_login_log`;
CREATE TABLE `ums_admin_login_log` (
  `id` varchar(32) NOT NULL,
  `admin_id` varchar(32) DEFAULT NULL COMMENT '管理员id',
  `create_time` datetime DEFAULT NULL COMMENT '登录时间',
  `ip` varchar(64) DEFAULT NULL COMMENT 'ip地址',
  `address` varchar(100) DEFAULT NULL,
  `user_agent` varchar(100) DEFAULT NULL COMMENT '浏览器类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='后台用户登录日志表';

-- ----------------------------
-- Records of ums_admin_login_log
-- ----------------------------
BEGIN;
INSERT INTO `ums_admin_login_log` VALUES ('05725c5e3e9011e99a3a1fc272f26831', '1', '2019-03-04 09:13:10', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('05a128883e8e11e99a3a1fc272f26831', '1', '2019-03-04 08:58:51', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('06167cee402011e9a27267aa20a0c3f1', '1', '2019-03-06 08:56:30', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('0b3bce24479411e98daee180dfdaa9bf', '1', '2019-03-15 21:34:38', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('0f1c2660461d11e99e7f86231b225959', '1', '2019-03-14 00:50:23', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('1144adf63f0911e9a546b21e7d1803c5', '1', '2019-03-04 23:39:39', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('118ccabe3e9111e99a3a1fc272f26831', '1', '2019-03-04 09:20:40', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('15530150297639065705', '1', '2019-03-19 12:03:50', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('15530150561667547923', '1', '2019-03-19 12:04:16', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('163270d6402211e9a27267aa20a0c3f1', '1', '2019-03-06 09:11:16', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('16baeb3c3d1111e9a2e2e7aeb16d0df8', '1', '2019-03-02 11:31:46', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('183dd2a4479711e98daee180dfdaa9bf', '1', '2019-03-15 21:56:28', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('18fcfd904c4811e9bad448c70eef86ce', '1', '2019-03-21 21:13:35', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('1dd59d0245a111e9b0badb0ca92ce0dd', '1', '2019-03-13 10:03:10', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('2778d16e3d1111e9a2e2e7aeb16d0df8', '1', '2019-03-02 11:32:30', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('34b5b84e402011e9a27267aa20a0c3f1', '1', '2019-03-06 08:57:48', '127.0.0.1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:65.0) Gecko/20100101 Firefox/65.0');
INSERT INTO `ums_admin_login_log` VALUES ('497011dc402311e9a27267aa20a0c3f1', '1', '2019-03-06 09:19:51', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('4ba995ea461d11e99e7f86231b225959', '1', '2019-03-14 00:52:05', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('538904b03e8611e99a3a1fc272f26831', '1', '2019-03-04 08:03:46', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('649d524e461d11e99e7f86231b225959', '1', '2019-03-14 00:52:47', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('6822601a473c11e99444624b50b18485', '1', '2019-03-15 11:07:18', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('714046d4473d11e99444624b50b18485', '1', '2019-03-15 11:14:43', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('77ef89a2473f11e99444624b50b18485', '1', '2019-03-15 11:29:13', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('831db542478f11e98daee180dfdaa9bf', '1', '2019-03-15 21:02:12', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('8476dbea4ca711e9bad448c70eef86ce', '1', '2019-03-22 08:36:38', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('8960cfa0401111e9a27267aa20a0c3f1', '1', '2019-03-06 07:12:47', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('9159709a479111e98daee180dfdaa9bf', '1', '2019-03-15 21:16:55', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('95c28ef24bea11e9a1a9145e9df80324', '1', '2019-03-21 10:04:12', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('98704ef6478e11e98daee180dfdaa9bf', '1', '2019-03-15 20:55:38', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('a760cdae448811e993b6faa961ea7482', '1', '2019-03-12 00:35:33', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('aca32780461d11e99e7f86231b225959', '1', '2019-03-14 00:54:48', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('b05b2b3e3e8e11e99a3a1fc272f26831', '2', '2019-03-04 09:03:38', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('b5c72c383e9011e99a3a1fc272f26831', '1', '2019-03-04 09:18:06', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('bb77b7744bec11e9a1a9145e9df80324', '1', '2019-03-21 10:19:34', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('bc9ceb72479311e98daee180dfdaa9bf', '1', '2019-03-15 21:32:26', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('c5a7ebfc401f11e9a27267aa20a0c3f1', '1', '2019-03-06 08:54:42', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('cba675f0401f11e9a27267aa20a0c3f1', '1', '2019-03-06 08:54:52', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('ec2fa150478d11e98daee180dfdaa9bf', '1', '2019-03-15 20:50:49', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('fc5460a6479311e98daee180dfdaa9bf', '1', '2019-03-15 21:34:13', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
COMMIT;

-- ----------------------------
-- Table structure for ums_admin_permission_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_admin_permission_relation`;
CREATE TABLE `ums_admin_permission_relation` (
  `id` varchar(32) NOT NULL,
  `admin_id` varchar(32) DEFAULT NULL,
  `permission_id` varchar(32) DEFAULT NULL,
  `type` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='后台用户和权限关系表(除角色中定义的权限以外的加减权限)';

-- ----------------------------
-- Table structure for ums_admin_role_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_admin_role_relation`;
CREATE TABLE `ums_admin_role_relation` (
  `id` varchar(32) NOT NULL,
  `admin_id` varchar(32) DEFAULT NULL,
  `role_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='后台用户和角色关系表';

-- ----------------------------
-- Records of ums_admin_role_relation
-- ----------------------------
BEGIN;
INSERT INTO `ums_admin_role_relation` VALUES ('1', '1', '5');
INSERT INTO `ums_admin_role_relation` VALUES ('2', '2', '1');
INSERT INTO `ums_admin_role_relation` VALUES ('3', '2', '2');
INSERT INTO `ums_admin_role_relation` VALUES ('4', '2', '3');
COMMIT;

-- ----------------------------
-- Table structure for ums_member
-- ----------------------------
DROP TABLE IF EXISTS `ums_member`;
CREATE TABLE `ums_member` (
  `id` varchar(32) NOT NULL,
  `user_name` varchar(32) DEFAULT NULL COMMENT '用户名',
  `user_password` varchar(64) DEFAULT NULL COMMENT '用户密码',
  `nickname` varchar(64) DEFAULT NULL COMMENT '用户昵称',
  `phone` varchar(64) DEFAULT NULL COMMENT '手机号码',
  `gender` int(1) DEFAULT NULL COMMENT '性别：0->未知；1->男；2->女',
  `job` varchar(64) DEFAULT NULL COMMENT '职业',
  `city` varchar(64) DEFAULT NULL COMMENT '所在城市',
  `email` varchar(64) DEFAULT NULL COMMENT '邮箱',
  `icon` varchar(255) DEFAULT NULL COMMENT '头像',
  `birthday` date DEFAULT NULL COMMENT '出生日期',
  `create_time` datetime DEFAULT NULL COMMENT '注册时间',
  `status` int(1) DEFAULT NULL COMMENT '账户状态:0->禁用;1->启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商城前台会员表';

-- ----------------------------
-- Table structure for ums_member_login_log
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_login_log`;
CREATE TABLE `ums_member_login_log` (
  `id` varchar(32) NOT NULL,
  `member_id` varchar(32) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `ip` varchar(64) DEFAULT NULL,
  `login_type` int(1) DEFAULT NULL COMMENT '登录类型：0->PC；1->android;2->ios;3->小程序',
  `city` varchar(64) DEFAULT NULL,
  `province` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员登录记录';

-- ----------------------------
-- Table structure for ums_member_receive_address
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_receive_address`;
CREATE TABLE `ums_member_receive_address` (
  `id` varchar(32) NOT NULL,
  `member_id` varchar(32) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL COMMENT '收货人姓名',
  `phone_number` varchar(64) DEFAULT NULL COMMENT '收货人手机号码',
  `default_status` int(1) DEFAULT NULL COMMENT '是否为默认 0->非默认, 1->默认',
  `post_code` varchar(100) DEFAULT NULL COMMENT '邮政编码',
  `province` varchar(100) DEFAULT NULL COMMENT '省份/直辖市',
  `city` varchar(100) DEFAULT NULL COMMENT '城市',
  `region` varchar(100) DEFAULT NULL COMMENT '区/县',
  `detail_address` varchar(128) DEFAULT NULL COMMENT '详细地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员收货地址表';

-- ----------------------------
-- Table structure for ums_permission
-- ----------------------------
DROP TABLE IF EXISTS `ums_permission`;
CREATE TABLE `ums_permission` (
  `id` varchar(32) NOT NULL,
  `pid` varchar(32) DEFAULT NULL COMMENT '父级权限id',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `icon` varchar(500) DEFAULT NULL COMMENT '图标',
  `type` int(1) DEFAULT NULL COMMENT '权限类型：0->目录；1->菜单；2->按钮（接口绑定权限）',
  `uri` varchar(200) DEFAULT NULL COMMENT '前端资源路径',
  `status` int(1) DEFAULT NULL COMMENT '启用状态；0->禁用；1->启用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `sort` int(11) DEFAULT NULL COMMENT '顺序',
  `value` varchar(200) DEFAULT NULL COMMENT '权限值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='后台用户权限表';

-- ----------------------------
-- Records of ums_permission
-- ----------------------------
BEGIN;
INSERT INTO `ums_permission` VALUES ('1', '0', '商品', 'product', 0, '', 1, '2019-03-02 23:31:49', 0, NULL);
INSERT INTO `ums_permission` VALUES ('10', '4', '修改商品分类', NULL, 2, '/pms/productCate/update', 1, '2019-03-02 23:43:01', 0, 'pms:productCategory:update');
INSERT INTO `ums_permission` VALUES ('11', '4', '删除商品分类', NULL, 2, '/pms/productCate/delete', 1, '2019-03-02 23:44:41', 0, 'pms:productCategory:delete');
INSERT INTO `ums_permission` VALUES ('12', '5', '添加商品类型', NULL, 2, '/pms/productAttr/create', 1, '2019-03-02 23:46:45', 0, 'pms:productAttribute:create');
INSERT INTO `ums_permission` VALUES ('13', '5', '修改商品类型', NULL, 2, '/pms/productAttr/update', 1, '2019-03-02 23:47:46', 0, 'pms:productAttribute:update');
INSERT INTO `ums_permission` VALUES ('14', '5', '删除商品类型', NULL, 2, '/pms/productAttr/delete', 1, '2019-03-02 23:48:46', 0, 'pms:productAttribute:delete');
INSERT INTO `ums_permission` VALUES ('15', '6', '添加出版社', NULL, 2, '/pms/brand/add', 1, '2019-03-02 23:49:28', 0, 'pms:brand:create');
INSERT INTO `ums_permission` VALUES ('16', '6', '修改出版社', NULL, 2, '/pms/brand/update', 1, '2019-03-02 23:50:19', 0, 'pms:brand:update');
INSERT INTO `ums_permission` VALUES ('17', '6', '删除出版社', NULL, 2, '/pms/brand/delete', 1, '2019-03-02 23:51:03', 0, 'pms:brand:delete');
INSERT INTO `ums_permission` VALUES ('18', '0', '首页', 'home', 0, '', 1, '2019-03-02 23:52:11', 0, NULL);
INSERT INTO `ums_permission` VALUES ('2', '1', '商品列表', 'product-list', 1, '/pms/product/index', 1, '2019-03-02 23:32:59', 0, 'pms:product:read');
INSERT INTO `ums_permission` VALUES ('3', '1', '添加商品', 'product-add', 1, '/pms/product/add', 1, '2019-03-02 23:33:51', 0, 'pms:product:create');
INSERT INTO `ums_permission` VALUES ('4', '1', '商品分类', 'product-cate', 1, '/pms/productCate/index', 1, '2019-03-02 23:35:07', 0, 'pms:productCategory:read');
INSERT INTO `ums_permission` VALUES ('5', '1', '商品类型', NULL, 1, '/pms/productAttr/index', 1, '2019-03-02 23:36:17', 0, 'pms:productAttribute:read');
INSERT INTO `ums_permission` VALUES ('6', '1', '出版社管理', NULL, 1, '/pms/brand/index', 1, '2019-03-02 23:37:22', 0, 'pms:brand:read');
INSERT INTO `ums_permission` VALUES ('7', '2', '编辑商品', NULL, 2, '/pms/product/updateProduct', 1, '2019-03-02 23:38:28', 0, 'pms:product:update');
INSERT INTO `ums_permission` VALUES ('8', '2', '删除商品', NULL, 2, '/pms/product/delete', 1, '2019-03-02 23:43:04', 0, 'pms:product:delete');
INSERT INTO `ums_permission` VALUES ('9', '4', '添加商品分类', NULL, 2, '/pms/productCate/create', 1, '2019-03-02 23:41:35', 0, 'pms:productCategory:create');
COMMIT;

-- ----------------------------
-- Table structure for ums_role
-- ----------------------------
DROP TABLE IF EXISTS `ums_role`;
CREATE TABLE `ums_role` (
  `id` varchar(32) NOT NULL,
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `description` varchar(500) DEFAULT NULL COMMENT '描述',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `status` int(1) DEFAULT NULL COMMENT '状态 0:禁用->1:启用',
  `sort` int(11) DEFAULT NULL COMMENT '顺序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='后台用户角色表';

-- ----------------------------
-- Records of ums_role
-- ----------------------------
BEGIN;
INSERT INTO `ums_role` VALUES ('1', '书籍管理员', '书籍管理员', '2019-03-02 23:53:06', 1, 0);
INSERT INTO `ums_role` VALUES ('2', '书籍分类管理员', '书籍分类管理员', '2019-03-02 23:53:33', 1, 0);
INSERT INTO `ums_role` VALUES ('3', '书籍类型管理员', '书籍类型管理员', '2019-03-02 23:53:59', 1, 0);
INSERT INTO `ums_role` VALUES ('4', '出版社管理员', '出版社管理员', '2019-03-02 23:54:24', 1, 0);
INSERT INTO `ums_role` VALUES ('5', '超级管理员', '超级管理员', '2019-03-02 23:54:54', 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for ums_role_permission_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_role_permission_relation`;
CREATE TABLE `ums_role_permission_relation` (
  `id` varchar(32) NOT NULL,
  `role_id` varchar(32) DEFAULT NULL,
  `permission_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='后台用户角色和权限关系表';

-- ----------------------------
-- Records of ums_role_permission_relation
-- ----------------------------
BEGIN;
INSERT INTO `ums_role_permission_relation` VALUES ('1', '1', '1');
INSERT INTO `ums_role_permission_relation` VALUES ('10', '3', '5');
INSERT INTO `ums_role_permission_relation` VALUES ('11', '3', '12');
INSERT INTO `ums_role_permission_relation` VALUES ('12', '3', '13');
INSERT INTO `ums_role_permission_relation` VALUES ('13', '3', '14');
INSERT INTO `ums_role_permission_relation` VALUES ('14', '4', '6');
INSERT INTO `ums_role_permission_relation` VALUES ('15', '4', '15');
INSERT INTO `ums_role_permission_relation` VALUES ('16', '4', '16');
INSERT INTO `ums_role_permission_relation` VALUES ('17', '4', '17');
INSERT INTO `ums_role_permission_relation` VALUES ('18', '5', '1');
INSERT INTO `ums_role_permission_relation` VALUES ('19', '5', '2');
INSERT INTO `ums_role_permission_relation` VALUES ('2', '1', '2');
INSERT INTO `ums_role_permission_relation` VALUES ('20', '5', '3');
INSERT INTO `ums_role_permission_relation` VALUES ('21', '5', '4');
INSERT INTO `ums_role_permission_relation` VALUES ('22', '5', '5');
INSERT INTO `ums_role_permission_relation` VALUES ('23', '5', '6');
INSERT INTO `ums_role_permission_relation` VALUES ('24', '5', '7');
INSERT INTO `ums_role_permission_relation` VALUES ('25', '5', '8');
INSERT INTO `ums_role_permission_relation` VALUES ('26', '5', '9');
INSERT INTO `ums_role_permission_relation` VALUES ('27', '5', '10');
INSERT INTO `ums_role_permission_relation` VALUES ('28', '5', '11');
INSERT INTO `ums_role_permission_relation` VALUES ('29', '5', '12');
INSERT INTO `ums_role_permission_relation` VALUES ('3', '1', '3');
INSERT INTO `ums_role_permission_relation` VALUES ('30', '5', '13');
INSERT INTO `ums_role_permission_relation` VALUES ('31', '5', '14');
INSERT INTO `ums_role_permission_relation` VALUES ('32', '5', '15');
INSERT INTO `ums_role_permission_relation` VALUES ('33', '5', '16');
INSERT INTO `ums_role_permission_relation` VALUES ('34', '5', '17');
INSERT INTO `ums_role_permission_relation` VALUES ('35', '5', '18');
INSERT INTO `ums_role_permission_relation` VALUES ('4', '1', '7');
INSERT INTO `ums_role_permission_relation` VALUES ('5', '1', '8');
INSERT INTO `ums_role_permission_relation` VALUES ('6', '2', '4');
INSERT INTO `ums_role_permission_relation` VALUES ('7', '2', '9');
INSERT INTO `ums_role_permission_relation` VALUES ('8', '2', '10');
INSERT INTO `ums_role_permission_relation` VALUES ('9', '2', '11');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
