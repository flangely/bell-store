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

 Date: 06/05/2019 23:37:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
  `delete_status` int(1) DEFAULT NULL COMMENT '是否删除:0->否，1->是，2->已生成订单未收货',
  `product_category_id` varchar(32) DEFAULT NULL COMMENT '商品分类',
  `product_sn` varchar(200) DEFAULT NULL,
  `product_brand` varchar(200) DEFAULT NULL COMMENT '商品品牌',
  `product_attr` varchar(500) DEFAULT NULL COMMENT '商品销售属性:[{"key":"颜色","value":"颜色"},{"key":"容量","value":"4G"}]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='购物车表';

-- ----------------------------
-- Records of oms_cart_item
-- ----------------------------
BEGIN;
INSERT INTO `oms_cart_item` VALUES ('82cb124669c311e981bb89d4882f5005', '15560107346597237695', NULL, 'c82f9e86644811e9a66111163ae0b5eb', 1, 58.20, NULL, NULL, NULL, 'http://www.flangely.com/15560106914498752990.png', 'Spring Cloud微服务实战', '翟永超', NULL, 'flangely', '2019-04-28 09:40:05', NULL, 0, '24', '1006', '电子工业出版社', NULL);
INSERT INTO `oms_cart_item` VALUES ('8344216869c311e981bb89d4882f5005', '15560104970188907459', NULL, 'c82f9e86644811e9a66111163ae0b5eb', 8, 97.90, NULL, NULL, NULL, 'http://www.flangely.com/15560104688783909639.png', 'SPRING BOOT编程思想(核心篇)', '小马哥（mercyblitz）', NULL, 'flangely', '2019-04-28 09:40:05', '2019-04-30 21:05:32', 0, '24', '1005', '电子工业出版社', NULL);
INSERT INTO `oms_cart_item` VALUES ('d51c877269b511e981bb89d4882f5005', '15553732939756338472', NULL, 'c82f9e86644811e9a66111163ae0b5eb', 1, 19.80, NULL, NULL, NULL, 'http://www.flangely.com/15553731505558982797.png', '哈佛牛津都在玩的1000个思维游戏', '无', NULL, 'flangely', '2019-04-28 08:02:10', NULL, 0, '12', '1001', '河北少年儿童出版社', NULL);
COMMIT;

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
  `status` int(1) DEFAULT NULL COMMENT '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单;6->退货申请中;7->退货成功;8->退货失败',
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
-- Records of oms_order
-- ----------------------------
BEGIN;
INSERT INTO `oms_order` VALUES ('20190427000436203332', 'c82f9e86644811e9a66111163ae0b5eb', NULL, '201904270000000001', '2019-04-26 11:04:37', 'flangely', 187.30, 187.30, 5.00, 0.00, 2, 0, 0, '顺丰快递', '20190427100942', NULL, NULL, NULL, NULL, NULL, NULL, '肖黎川', '13530446538', '635000', '四川省', '', '达州市', NULL, '开江县', '打完电话卡文化课', 0, 0, '2019-04-27 12:10:31', '2019-04-27 22:09:32', NULL, NULL, '2019-04-27 09:11:44');
INSERT INTO `oms_order` VALUES ('20190427000503678401', 'c82f9e86644811e9a66111163ae0b5eb', NULL, '201904270000000002', '2019-04-26 11:05:03', 'flangely', 42.60, 42.60, 5.00, 0.00, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '法兰距黎', '13158798118', '617067', '四川省', '攀枝花市', '东区', NULL, '四川省攀枝花市东区机场路10号', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES ('20190427150931258981', 'c82f9e86644811e9a66111163ae0b5eb', NULL, '201904270000000003', '2019-04-27 02:09:32', 'flangely', 45.00, 45.00, 5.00, 0.00, 2, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '法兰距黎', '13158798118', '617067', '四川省', '攀枝花市', '东区', NULL, '四川省攀枝花市东区机场路10号', NULL, 0, 0, '2019-04-30 20:26:03', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES ('20190427151007981691', 'c82f9e86644811e9a66111163ae0b5eb', NULL, '201904270000000004', '2019-04-27 02:10:07', 'flangely', 58.20, 58.20, 5.00, 0.00, 0, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '肖黎川', '13530446538', '635000', '四川省', '', '达州市', NULL, '开江县', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES ('20190427215731398795', 'c82f9e86644811e9a66111163ae0b5eb', NULL, '201904270000000005', '2019-04-27 08:57:32', 'flangely', 472.20, 472.20, 5.00, 0.00, 0, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '郑强', '1588188762', '636256', '四川', '成都市', '武侯区', NULL, '天府三街', NULL, 0, 1, NULL, NULL, NULL, NULL, NULL);
COMMIT;

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
-- Records of oms_order_item
-- ----------------------------
BEGIN;
INSERT INTO `oms_order_item` VALUES ('15562946767584657303', '20190427000436203332', '201904270000000001', '15560104970188907459', 'http://www.flangely.com/15560104688783909639.png', 'SPRING BOOT编程思想(核心篇)', '电子工业出版社', '1005', 97.90, 1, NULL, NULL, '24', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_item` VALUES ('15562946767593955838', '20190427000436203332', '201904270000000001', '15553430562773215285', 'http://www.flangely.com/15553429459321877080.png', '拼音认读故事书', '河北少年儿童出版社', '1000', 29.80, 3, NULL, NULL, '10', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_item` VALUES ('15562947034655538378', '20190427000503678401', '201904270000000002', '15553804499901772673', 'http://www.flangely.com/15553804112367177720.png', '养生家常菜一本就够', '中国社会科学出版社', '1005', 22.80, 1, NULL, NULL, '16', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_item` VALUES ('15562947034655651317', '20190427000503678401', '201904270000000002', '15553732939756338472', 'http://www.flangely.com/15553731505558982797.png', '哈佛牛津都在玩的1000个思维游戏', '河北少年儿童出版社', '1001', 19.80, 1, NULL, NULL, '12', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_item` VALUES ('15563489718516138482', '20190427150931258981', '201904270000000003', '15553789430101508818', 'http://www.flangely.com/15553788822873597174.png', '孙子兵法与三十六计全集4册', '中国社会科学出版社', '1003', 45.00, 1, NULL, NULL, '13', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_item` VALUES ('15563490071574027825', '20190427151007981691', '201904270000000004', '15560107346597237695', 'http://www.flangely.com/15560106914498752990.png', 'Spring Cloud微服务实战', '电子工业出版社', '1006', 58.20, 1, NULL, NULL, '24', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_item` VALUES ('15563734516192237200', '20190427215731398795', '201904270000000005', '15553732939756338472', 'http://www.flangely.com/15553731505558982797.png', '哈佛牛津都在玩的1000个思维游戏', '河北少年儿童出版社', '1001', 19.80, 1, NULL, NULL, '12', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_item` VALUES ('15563734516192544413', '20190427215731398795', '201904270000000005', '15553804499901772673', 'http://www.flangely.com/15553804112367177720.png', '养生家常菜一本就够', '中国社会科学出版社', '1005', 22.80, 1, NULL, NULL, '16', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_item` VALUES ('15563734516194662958', '20190427215731398795', '201904270000000005', '15553736649096437842', 'http://www.flangely.com/15553736206488297490.png', '毛泽东选集 (全四册，大32开）', '人民文学出版社', '1002', 73.10, 1, NULL, NULL, '13', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_item` VALUES ('15563734516195861544', '20190427215731398795', '201904270000000005', '15553789430101508818', 'http://www.flangely.com/15553788822873597174.png', '孙子兵法与三十六计全集4册', '中国社会科学出版社', '1003', 45.00, 1, NULL, NULL, '13', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_item` VALUES ('15563734516196348468', '20190427215731398795', '201904270000000005', '15560107346597237695', 'http://www.flangely.com/15560106914498752990.png', 'Spring Cloud微服务实战', '电子工业出版社', '1006', 58.20, 1, NULL, NULL, '24', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_item` VALUES ('15563734516197056332', '20190427215731398795', '201904270000000005', '15553430562773215285', 'http://www.flangely.com/15553429459321877080.png', '拼音认读故事书', '河北少年儿童出版社', '1000', 29.80, 3, NULL, NULL, '10', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_item` VALUES ('15563734516199882174', '20190427215731398795', '201904270000000005', '15553801990761864545', 'http://www.flangely.com/15553801566204711254.png', '做一个专业的班主任', '人民邮电出版社', '1004', 66.00, 1, NULL, NULL, '14', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_item` VALUES ('15563734516199976500', '20190427215731398795', '201904270000000005', '15560104970188907459', 'http://www.flangely.com/15560104688783909639.png', 'SPRING BOOT编程思想(核心篇)', '电子工业出版社', '1005', 97.90, 1, NULL, NULL, '24', NULL, NULL, NULL, NULL);
COMMIT;

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
-- Records of oms_order_operate_history
-- ----------------------------
BEGIN;
INSERT INTO `oms_order_operate_history` VALUES ('15562952091526305555', '20190427000503678401', '后台管理员', '2019-04-26 11:13:29', 4, '订单关闭:打完大无');
INSERT INTO `oms_order_operate_history` VALUES ('15563741722496589166', '20190427000436203332', '后台管理员', '2019-04-27 09:09:32', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES ('15563751848897550235', '20190427150931258981', '后台管理员', '2019-04-27 09:26:25', 4, '订单关闭:111');
INSERT INTO `oms_order_operate_history` VALUES ('15563751848907126290', '20190427215731398795', '后台管理员', '2019-04-27 09:26:25', 4, '订单关闭:111');
INSERT INTO `oms_order_operate_history` VALUES ('6295c1b068f611e98bd058d62a501165', '20190427000436203332', '后台管理员', '2019-04-27 09:11:44', 2, '修改备注信息：打完电话卡文化课');
COMMIT;

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
-- Records of oms_order_return_apply
-- ----------------------------
BEGIN;
INSERT INTO `oms_order_return_apply` VALUES ('0fb088a8691511e98bd058d62a501165', '20190427000436203332', NULL, NULL, '201904270000000001', '2019-04-27 12:51:19', 'flangely', 0.00, NULL, NULL, 1, '2019-04-27 12:51:31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES ('4207f89a691511e98bd058d62a501165', '20190427000503678401', NULL, NULL, '201904270000000002', '2019-04-27 12:52:43', 'flangely', NULL, NULL, NULL, 3, '2019-04-27 12:52:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', NULL, NULL, NULL);
COMMIT;

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
-- Records of oms_order_return_reason
-- ----------------------------
BEGIN;
INSERT INTO `oms_order_return_reason` VALUES ('1891987268f711e98bd058d62a501165', '未按时发货', 0, 1, '2019-04-27 09:16:49');
INSERT INTO `oms_order_return_reason` VALUES ('ebb2f1b668f611e98bd058d62a501165', '不想要了', 0, 1, '2019-04-27 09:15:34');
INSERT INTO `oms_order_return_reason` VALUES ('f973f12e68f611e98bd058d62a501165', '拍错了', 0, 1, '2019-04-27 09:15:57');
COMMIT;

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
-- Records of oms_order_setting
-- ----------------------------
BEGIN;
INSERT INTO `oms_order_setting` VALUES ('1', 30, 60, 15, 7, 15);
COMMIT;

-- ----------------------------
-- Table structure for pms_brand
-- ----------------------------
DROP TABLE IF EXISTS `pms_brand`;
CREATE TABLE `pms_brand` (
  `id` varchar(32) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `first_letter` varchar(8) DEFAULT NULL COMMENT '首字母',
  `sort` int(11) DEFAULT NULL,
  `factory_status` int(1) DEFAULT NULL,
  `show_status` int(1) DEFAULT NULL,
  `product_count` int(11) DEFAULT NULL COMMENT '产品数量',
  `product_comment_count` int(11) DEFAULT NULL COMMENT '产品评论数量',
  `logo` varchar(255) DEFAULT NULL COMMENT 'logo',
  `big_pic` varchar(255) DEFAULT NULL COMMENT '专区大图',
  `brand_story` text COMMENT '出版社故事',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='出版社表';

-- ----------------------------
-- Records of pms_brand
-- ----------------------------
BEGIN;
INSERT INTO `pms_brand` VALUES ('1', '机械工业出版社', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_brand` VALUES ('15553425818306882760', '河北少年儿童出版社', 'HB', 0, 0, 1, NULL, NULL, '', '', '');
INSERT INTO `pms_brand` VALUES ('2', '电子工业出版社', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_brand` VALUES ('3', '中国社会科学出版社', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_brand` VALUES ('4', '人民文学出版社', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_brand` VALUES ('5', '清华大学出版社', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_brand` VALUES ('6', '商务印书馆', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_brand` VALUES ('7', '人民邮电出版社', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL);
COMMIT;

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
-- Records of pms_product
-- ----------------------------
BEGIN;
INSERT INTO `pms_product` VALUES ('15553430562773215285', '15553425818306882760', '10', NULL, NULL, '拼音认读故事书', 'http://www.flangely.com/15553429459321877080.png', '1000', 0, 1, 1, 1, 1, 0, 0, 29.80, NULL, '金帆', '彩图注音版 拼音认读故事书7-10岁 我会自己读 幼儿园大班大图大字识字 儿童文学读物 亲子睡前童话故事书3-6周岁 一', 36.80, 497, 0, '本', 340.00, NULL, '', '', NULL, 'http://www.flangely.com/15553429500091176018.png,http://www.flangely.com/15553429535742520391.png,http://www.flangely.com/15553429575571847888.png,http://www.flangely.com/15553429606653886569.png', NULL, NULL, '<div class=\"prod-detail-container\">\n<div id=\"productDetail\" class=\"lazy-ajax pro-detail-pics\" data-type=\"json\">\n<div id=\"bookconMain\" class=\"bookcon-main\">\n<div>\n<ul class=\"bookcon-param clearfix\">\n<li>作者：&nbsp;无著</li>\n<li>出版社：河北少年儿童出版社</li>\n<li>出版时间：2016</li>\n<li>版权提供：河北少年儿童出版社</li>\n</ul>\n<p><img class=\"err-product\" style=\"border: 0px; word-break: break-all; vertical-align: middle; background: url(\'images/blankbg.gif?v=2015102601\') 50% 50% no-repeat; max-width: 750px;\" src=\"https://image.suning.cn/uimg/sop/commodity/710813023547615720150088_x.jpg\" alt=\"\" /><img class=\"err-product\" style=\"border: 0px; word-break: break-all; vertical-align: middle; background: url(\'images/blankbg.gif?v=2015102601\') 50% 50% no-repeat; max-width: 750px;\" src=\"https://image.suning.cn/uimg/sop/commodity/130432786878743220226185_x.jpg\" alt=\"\" /><img class=\"err-product\" style=\"border: 0px; word-break: break-all; vertical-align: middle; background: url(\'images/blankbg.gif?v=2015102601\') 50% 50% no-repeat; max-width: 750px;\" src=\"https://image.suning.cn/uimg/sop/commodity/173752534116636762079141_x.jpg\" alt=\"\" /><img class=\"err-product\" style=\"border: 0px; word-break: break-all; vertical-align: middle; background: url(\'images/blankbg.gif?v=2015102601\') 50% 50% no-repeat; max-width: 750px;\" src=\"https://image.suning.cn/uimg/sop/commodity/182889213119782535922600_x.jpg\" alt=\"\" /><img class=\"err-product\" style=\"border: 0px; word-break: break-all; vertical-align: middle; background: url(\'images/blankbg.gif?v=2015102601\') 50% 50% no-repeat; max-width: 750px;\" src=\"https://image.suning.cn/uimg/sop/commodity/166969135511653494879546_x.jpg\" alt=\"\" /><img class=\"err-product\" style=\"border: 0px; word-break: break-all; vertical-align: middle; background: url(\'images/blankbg.gif?v=2015102601\') 50% 50% no-repeat; max-width: 750px;\" src=\"https://image.suning.cn/uimg/sop/commodity/165953993518649386333349_x.jpg\" alt=\"\" /><img class=\"err-product\" style=\"border: 0px; word-break: break-all; vertical-align: middle; background: url(\'images/blankbg.gif?v=2015102601\') 50% 50% no-repeat; max-width: 750px;\" src=\"https://image.suning.cn/uimg/sop/commodity/565661917589881268960770_x.jpg\" alt=\"\" /><img class=\"err-product\" style=\"border: 0px; word-break: break-all; vertical-align: middle; background: url(\'images/blankbg.gif?v=2015102601\') 50% 50% no-repeat; max-width: 750px;\" src=\"https://image.suning.cn/uimg/sop/commodity/921227699624830682236008_x.jpg\" alt=\"\" /><img class=\"err-product\" style=\"border: 0px; word-break: break-all; vertical-align: middle; background: url(\'images/blankbg.gif?v=2015102601\') 50% 50% no-repeat; max-width: 750px;\" src=\"https://image.suning.cn/uimg/sop/commodity/693219139208077993670499_x.jpg\" alt=\"\" /><img class=\"err-product\" style=\"border: 0px; word-break: break-all; vertical-align: middle; background: url(\'images/blankbg.gif?v=2015102601\') 50% 50% no-repeat; max-width: 750px;\" src=\"https://image.suning.cn/uimg/sop/commodity/186912067116645512827414_x.jpg\" alt=\"\" /><img class=\"err-product\" style=\"border: 0px; word-break: break-all; vertical-align: middle; background: url(\'images/blankbg.gif?v=2015102601\') 50% 50% no-repeat; max-width: 750px;\" src=\"https://image.suning.cn/uimg/sop/commodity/917563013414404177486319_x.jpg\" alt=\"\" /><img class=\"err-product\" style=\"border: 0px; word-break: break-all; vertical-align: middle; background: url(\'images/blankbg.gif?v=2015102601\') 50% 50% no-repeat; max-width: 750px;\" src=\"https://image.suning.cn/uimg/sop/commodity/139534003412205205874421_x.jpg\" alt=\"\" /><img class=\"err-product\" style=\"border: 0px; word-break: break-all; vertical-align: middle; background: url(\'images/blankbg.gif?v=2015102601\') 50% 50% no-repeat; max-width: 750px;\" src=\"https://image.suning.cn/uimg/sop/commodity/510779904154218987445406_x.jpg\" alt=\"\" /></p>\n</div>\n<div>&nbsp;</div>\n<div>&nbsp;</div>\n<div>&nbsp;</div>\n</div>\n</div>\n</div>\n<div class=\"d-anchor-panel\">&nbsp;</div>', '河北少年儿童出版社', '幼儿启蒙');
INSERT INTO `pms_product` VALUES ('15553732939756338472', '15553425818306882760', '12', NULL, NULL, '哈佛牛津都在玩的1000个思维游戏', 'http://www.flangely.com/15553731505558982797.png', '1001', 0, 1, 1, 1, 1, 0, 0, 19.80, NULL, '无', '脑筋急转弯6-12岁哈佛牛津都在玩的1000个思维游戏儿童逻辑思维训练书籍成人中小学生都能用的书少儿益智游戏脑力开发训练', 29.80, 1997, 0, '本', 280.00, NULL, '', '', NULL, 'http://www.flangely.com/15553731537814979111.png,http://www.flangely.com/15553731583182459480.png,http://www.flangely.com/15553731616257867235.png,http://www.flangely.com/15553731652728958252.png', NULL, NULL, '<ul class=\"bookcon-param clearfix\">\n<li>作者：&nbsp;无著</li>\n<li>出版社：河北少年儿童出版社</li>\n<li>出版时间：2013年10月</li>\n<li>装帧：平装</li>\n</ul>\n<p>版权提供：河北少年儿童出版社</p>\n<p><img class=\"err-product\" style=\"border: 0px; word-break: break-all; vertical-align: middle; background: url(\'images/blankbg.gif?v=2015102601\') 50% 50% no-repeat #ffffff; max-width: 750px; color: #666666; font-family: Arial, \'Microsoft YaHei\', SimSun; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;\" src=\"https://image.suning.cn/uimg/sop/commodity/133054698117561230261300_x.jpg\" alt=\"\" /><img class=\"err-product\" style=\"border: 0px; word-break: break-all; vertical-align: middle; background: url(\'images/blankbg.gif?v=2015102601\') 50% 50% no-repeat #ffffff; max-width: 750px; color: #666666; font-family: Arial, \'Microsoft YaHei\', SimSun; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;\" src=\"https://image.suning.cn/uimg/sop/commodity/520631995833372493483500_x.jpg\" alt=\"\" /><img class=\"err-product\" style=\"border: 0px; word-break: break-all; vertical-align: middle; background: url(\'images/blankbg.gif?v=2015102601\') 50% 50% no-repeat #ffffff; max-width: 750px; color: #666666; font-family: Arial, \'Microsoft YaHei\', SimSun; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;\" src=\"https://image.suning.cn/uimg/sop/commodity/153853938189040646728020_x.jpg\" alt=\"\" /><img class=\"err-product\" style=\"border: 0px; word-break: break-all; vertical-align: middle; background: url(\'images/blankbg.gif?v=2015102601\') 50% 50% no-repeat #ffffff; max-width: 750px; color: #666666; font-family: Arial, \'Microsoft YaHei\', SimSun; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;\" src=\"https://image.suning.cn/uimg/sop/commodity/495897530576055219286300_x.jpg\" alt=\"\" /><img class=\"err-product\" style=\"border: 0px; word-break: break-all; vertical-align: middle; background: url(\'images/blankbg.gif?v=2015102601\') 50% 50% no-repeat #ffffff; max-width: 750px; color: #666666; font-family: Arial, \'Microsoft YaHei\', SimSun; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;\" src=\"https://image.suning.cn/uimg/sop/commodity/173140150737192123137140_x.jpg\" alt=\"\" /><img class=\"err-product\" style=\"border: 0px; word-break: break-all; vertical-align: middle; background: url(\'images/blankbg.gif?v=2015102601\') 50% 50% no-repeat #ffffff; max-width: 750px; color: #666666; font-family: Arial, \'Microsoft YaHei\', SimSun; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;\" src=\"https://image.suning.cn/uimg/sop/commodity/174252960311145482740780_x.jpg\" alt=\"\" /><img class=\"err-product\" style=\"border: 0px; word-break: break-all; vertical-align: middle; background: url(\'images/blankbg.gif?v=2015102601\') 50% 50% no-repeat #ffffff; max-width: 750px; color: #666666; font-family: Arial, \'Microsoft YaHei\', SimSun; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;\" src=\"https://image.suning.cn/uimg/sop/commodity/551145313182175003367480_x.jpg\" alt=\"\" /><img class=\"err-product\" style=\"border: 0px; word-break: break-all; vertical-align: middle; background: url(\'images/blankbg.gif?v=2015102601\') 50% 50% no-repeat #ffffff; max-width: 750px; color: #666666; font-family: Arial, \'Microsoft YaHei\', SimSun; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;\" src=\"https://image.suning.cn/uimg/sop/commodity/162069765615183516359100_x.jpg\" alt=\"\" /><img class=\"err-product\" style=\"border: 0px; word-break: break-all; vertical-align: middle; background: url(\'images/blankbg.gif?v=2015102601\') 50% 50% no-repeat #ffffff; max-width: 750px; color: #666666; font-family: Arial, \'Microsoft YaHei\', SimSun; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;\" src=\"https://image.suning.cn/uimg/sop/commodity/861559009171309339311730_x.jpg\" alt=\"\" /><img class=\"err-product\" style=\"border: 0px; word-break: break-all; vertical-align: middle; background: url(\'images/blankbg.gif?v=2015102601\') 50% 50% no-repeat #ffffff; max-width: 750px; color: #666666; font-family: Arial, \'Microsoft YaHei\', SimSun; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;\" src=\"https://image.suning.cn/uimg/sop/commodity/958964280314727986985000_x.jpg\" alt=\"\" /></p>\n<p>&nbsp;</p>', '河北少年儿童出版社', '益智游戏');
INSERT INTO `pms_product` VALUES ('15553736649096437842', '4', '13', NULL, NULL, '毛泽东选集 (全四册，大32开）', 'http://www.flangely.com/15553736206488297490.png', '1002', 0, 1, 1, 1, 1, 0, 0, 73.10, NULL, '毛泽东', '这部选集，包括了*同志在中国革命各个时期中的重要著作。几年前各地方曾经出过几种不同版本的《*选集》，都是没有经过著者审查的，体例颇为杂乱，文字亦有错讹，有些重要的著作又没有收进去。现在的这部选集，是按照中国共产党成立后所经历的各个历史时期并且按照著作年月次序而编辑的。这部选集尽可能地搜集了一些为各地方过去印行的集子还没有包括在内的重要著作。选集中的各篇著人，都经著者校阅过，其中有些地方著者曾作了一些文字上的修正，也有个别的文章曾作了一些内容上的补充和修改。', 98.00, 2999, 0, '本', 860.00, NULL, '', '', NULL, '', NULL, NULL, '<p>这部选集，包括了*同志在中国革命各个时期中的重要著作。几年前各地方曾经出过几种不同版本的《*选集》，都是没有经过著者审查的，体例颇为杂乱，文字亦有错讹，有些重要的著作又没有收进去。现在的这部选集，是按照中国共产党成立后所经历的各个历史时期并且按照著作年月次序而编辑的。这部选集尽可能地搜集了一些为各地方过去印行的集子还没有包括在内的重要著作。选集中的各篇著人，都经著者校阅过，其中有些地方著者曾作了一些文字上的修正，也有个别的文章曾作了一些内容上的补充和修改。<br />　　下面有几点属于出版事务的声明：<br />　　第一，现在出版的这个选集，还是不很完备的。由于国民党反动派对于革命文献的毁灭，由于在长期战争中革命文献的散失，我们现在还不能够找到*同志的全部著作，特别是*同志所写的许多书信和电报（这些在*同志著作中占很大的部分）。<br />　　第二，有些曾经流行的著作，例如《农村调查》，遵照著者的意见，没有编入；又如《经济问题与财政问题》，也遵照著者的意见，只编进了其中的第一章（即《关于过去工作的基本总结》）。<br />　　第三，选集中作了一些注释。其中一部分是属于题解的，附在各篇第一页的下面；其他部分，有属于政治性质的，有属于技术性质的，都附在文章的末尾。<br />　　第四，本选集有两种装订的本子。一种是各时期的著作合订的一卷本，另一种是四卷本。四卷本的第一卷包括第一次国内革命战争时期和第二次国内革命战争时期的著作；第二卷和第三卷包括抗日战争时期的著作；第四卷包括第三次国内革命战争时期的著作。</p>', '人民文学出版社', '历史政治');
INSERT INTO `pms_product` VALUES ('15553789430101508818', '3', '13', NULL, NULL, '孙子兵法与三十六计全集4册', 'http://www.flangely.com/15553788822873597174.png', '1003', 0, 1, 1, 1, 1, 0, 0, 45.00, NULL, '孙武', '彩色详解 孙子兵法与三十六计全集4册 诠注全译文白对照 古代政治军事谋略丛书 国学经典普及读物 经商 为人处世智慧精囊', 98.00, 7998, 0, '本', 830.00, NULL, '', '', NULL, 'http://www.flangely.com/15553788852416143385.png,http://www.flangely.com/15553788882918507852.png,http://www.flangely.com/15553788915722058296.png,http://www.flangely.com/15553788945239759163.png', NULL, NULL, '<dl>\n<dd>\n<ul class=\"bookcon-param clearfix\">\n<li>作者：&nbsp;孙武著</li>\n<li>出版社：团结出版社</li>\n<li>出版时间：201802</li>\n<li>ISBN：3523523</li>\n<li>版权提供：团结出版社</li>\n</ul>\n</dd>\n</dl>\n<div>\n<p><img class=\"err-product\" style=\"border: 0px; word-break: break-all; vertical-align: middle; background: url(\'images/blankbg.gif?v=2015102601\') 50% 50% no-repeat; max-width: 750px;\" src=\"https://image.suning.cn/uimg/sop/commodity/140221185656206748529384_x.jpg\" alt=\"\" /><img class=\"err-product\" style=\"border: 0px; word-break: break-all; vertical-align: middle; background: url(\'images/blankbg.gif?v=2015102601\') 50% 50% no-repeat; max-width: 750px;\" src=\"https://image.suning.cn/uimg/sop/commodity/101735168697719262763041_x.jpg\" alt=\"\" /><img class=\"err-product\" style=\"border: 0px; word-break: break-all; vertical-align: middle; background: url(\'images/blankbg.gif?v=2015102601\') 50% 50% no-repeat; max-width: 750px;\" src=\"https://image.suning.cn/uimg/sop/commodity/203795069232192677625311_x.jpg\" alt=\"\" /><img class=\"err-product\" style=\"border: 0px; word-break: break-all; vertical-align: middle; background: url(\'images/blankbg.gif?v=2015102601\') 50% 50% no-repeat; max-width: 750px;\" src=\"https://image.suning.cn/uimg/sop/commodity/214157245211902036465339_x.jpg\" alt=\"\" /><img class=\"err-product\" style=\"border: 0px; word-break: break-all; vertical-align: middle; background: url(\'images/blankbg.gif?v=2015102601\') 50% 50% no-repeat; max-width: 750px;\" src=\"https://image.suning.cn/uimg/sop/commodity/381538561336137098830590_x.jpg\" alt=\"\" /><img class=\"err-product\" style=\"border: 0px; word-break: break-all; vertical-align: middle; background: url(\'images/blankbg.gif?v=2015102601\') 50% 50% no-repeat; max-width: 750px;\" src=\"https://image.suning.cn/uimg/sop/commodity/182961415212978513272006_x.jpg\" alt=\"\" /><img class=\"err-product\" style=\"border: 0px; word-break: break-all; vertical-align: middle; background: url(\'images/blankbg.gif?v=2015102601\') 50% 50% no-repeat; max-width: 750px;\" src=\"https://image.suning.cn/uimg/sop/commodity/195940223487539895147677_x.jpg\" alt=\"\" /><img class=\"err-product\" style=\"border: 0px; word-break: break-all; vertical-align: middle; background: url(\'images/blankbg.gif?v=2015102601\') 50% 50% no-repeat; max-width: 750px;\" src=\"https://image.suning.cn/uimg/sop/commodity/964841129191031990493763_x.jpg\" alt=\"\" /><img class=\"err-product\" style=\"border: 0px; word-break: break-all; vertical-align: middle; background: url(\'images/blankbg.gif?v=2015102601\') 50% 50% no-repeat; max-width: 750px;\" src=\"https://image.suning.cn/uimg/sop/commodity/108714722117805790532795_x.jpg\" alt=\"\" /><img class=\"err-product\" style=\"border: 0px; word-break: break-all; vertical-align: middle; background: url(\'images/blankbg.gif?v=2015102601\') 50% 50% no-repeat; max-width: 750px;\" src=\"https://image.suning.cn/uimg/sop/commodity/198799305720621713099814_x.jpg\" alt=\"\" /></p>\n</div>', '中国社会科学出版社', '历史政治');
INSERT INTO `pms_product` VALUES ('15553801990761864545', '7', '14', NULL, NULL, '做一个专业的班主任', 'http://www.flangely.com/15553801566204711254.png', '1004', 0, 1, 1, 1, 1, 0, 0, 66.00, NULL, '王晓春', '教师专业发展 问题学生诊疗手册（第二版）做一个专业的班主任 两本套 王晓春著 班主任工作指南 华东师范大学出版社 9', 88.00, 799, 0, '本', 380.00, NULL, '', '', NULL, 'http://www.flangely.com/15553801598007717868.png,http://www.flangely.com/15553801631157458687.png,http://www.flangely.com/15553801667162344392.png,http://www.flangely.com/15553801712798980958.png', NULL, NULL, '<dl>\n<dt>商品参数</dt>\n<dd>\n<ul class=\"bookcon-param clearfix\">\n<li>作者：&nbsp;王晓春著</li>\n<li>出版社：华东师范大学出版社</li>\n<li>出版时间：出版</li>\n<li>版权提供：华东师范大学出版社</li>\n</ul>\n</dd>\n</dl>\n<p><img id=\"desc-module-1\" class=\"desc_anchor\" style=\"border: 0px; word-break: break-all; vertical-align: middle; max-width: 750px; color: #666666; font-family: Arial, \'Microsoft YaHei\', SimSun; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-style: initial; text-decoration-color: initial;\" /><img class=\"err-product\" style=\"border: 0px; word-break: break-all; vertical-align: middle; background: url(\'images/blankbg.gif?v=2015102601\') 50% 50% no-repeat #ffffff; max-width: 750px; color: #666666; font-family: Arial, \'Microsoft YaHei\', SimSun; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;\" src=\"https://image.suning.cn/uimg/sop/commodity/887720028214327252828168_x.jpg\" width=\"790\" height=\"47\" />&nbsp;<img id=\"desc-module-2\" class=\"desc_anchor\" style=\"border: 0px; word-break: break-all; vertical-align: middle; max-width: 750px; color: #666666; font-family: Arial, \'Microsoft YaHei\', SimSun; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-style: initial; text-decoration-color: initial;\" /><img class=\"err-product\" style=\"border: 0px; word-break: break-all; vertical-align: middle; background: url(\'images/blankbg.gif?v=2015102601\') 50% 50% no-repeat #ffffff; max-width: 750px; color: #666666; font-family: Arial, \'Microsoft YaHei\', SimSun; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;\" src=\"https://image.suning.cn/uimg/sop/commodity/126110752142374559265971_x.jpg\" width=\"790\" height=\"47\" />&nbsp;<img id=\"desc-module-3\" class=\"desc_anchor\" style=\"border: 0px; word-break: break-all; vertical-align: middle; max-width: 750px; color: #666666; font-family: Arial, \'Microsoft YaHei\', SimSun; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-style: initial; text-decoration-color: initial;\" /><img class=\"err-product\" style=\"border: 0px; word-break: break-all; vertical-align: middle; background: url(\'images/blankbg.gif?v=2015102601\') 50% 50% no-repeat #ffffff; max-width: 750px; color: #666666; font-family: Arial, \'Microsoft YaHei\', SimSun; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;\" src=\"https://image.suning.cn/uimg/sop/commodity/210603717698828561399679_x.jpg\" width=\"790\" height=\"47\" /><img class=\"err-product\" style=\"border: 0px; word-break: break-all; vertical-align: middle; background: url(\'images/blankbg.gif?v=2015102601\') 50% 50% no-repeat #ffffff; max-width: 750px; color: #666666; font-family: Arial, \'Microsoft YaHei\', SimSun; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;\" src=\"https://image.suning.cn/uimg/sop/commodity/133680415822888381493782_x.jpg\" /></p>', '人民邮电出版社', '社会科学');
INSERT INTO `pms_product` VALUES ('15553804499901772673', '3', '16', NULL, NULL, '养生家常菜一本就够', 'http://www.flangely.com/15553804112367177720.png', '1005', 0, 1, 1, 1, 1, 0, 0, 22.80, NULL, '甘智荣', '养生家常菜一本就够（健康又营养的家常菜）蒸菜煮菜炖菜技巧书 家常菜谱书大全 酱料美食烹饪制作教程 养生汤品小炒', 29.80, 4998, 0, '本', 680.00, NULL, '', '', NULL, 'http://www.flangely.com/15553804142749852772.png,http://www.flangely.com/15553804175136075760.png,http://www.flangely.com/15553804206746514740.png,http://www.flangely.com/15553804237183018885.png', NULL, NULL, '<dl>\n<dt>商品参数</dt>\n<dd>\n<ul class=\"bookcon-param clearfix\">\n<li>作者：&nbsp;甘智荣　著著</li>\n<li>出版社：江苏科学技术出版社</li>\n<li>出版时间：2015-10-01 00:00:00</li>\n<li>版次：1</li>\n<li>印次：1</li>\n<li>印刷时间：2015-10-01</li>\n<li>开本：16开</li>\n<li>装帧：软精装</li>\n<li>ISBN：9787553742595</li>\n<li>版权提供：江苏科学技术出版社</li>\n</ul>\n</dd>\n</dl>\n<div>\n<p>书名：食在好吃 养生家常菜一本就够<br />：29.8元<br />作者：甘智荣<br />出版社：江苏科学技术出版社<br />出版日期：2015-10-01<br />ISBN：9787553742595<br />字数：<br />页码：160<br />版次：1<br />装帧：软精装<br />开本：16开<br />商品重量：0.4kg<br />编辑推荐<br />养生，是指通过各种方法对人体进行科学调养，以保持生命健康活力，达到颐养生命、增强体质、预防疾病、延年益寿目的的一种行为。本书中介绍的养生，多为食养，即依据食物的性味、功效及不同的搭配等关系带你了解养生之道。并*基础的烹饪知识着手，将养生与烹饪完美融合，介绍了一些养生、烹饪的必备常识，让读者解不同的膳食养生法以及各种食材的烹饪技巧，通过饮食强身健体、延年益寿。本书精心挑选了75 道养生家常菜，并根据不同食疗功效分为增强免疫、开胃消食、保肝护肾、降&ldquo;三高&rdquo;、防癌抗癌等，让读者能够有针对性地选择食材，为家人合理配膳，吃得更营养健康！更多精彩美食好书请点击这里： *受欢迎的家常保健菜（家人都爱吃的家常菜） 烤箱做家常菜一学就会（焗烤美食快速上菜，好味省时更安心！） 家常菜配餐一本就够（好吃家常菜秘诀一点通！） 吃好每天三顿饭（一日三餐，看这一本足够！）<br />内容提要<br />本书从基础的烹饪知识着手，介绍了一些养生、烹饪的必备常识，将养生与烹饪完美融合，让读者朋友了解不同的膳食养生法以及各种食材的烹饪技巧。此外，本书精心挑选了75道养生家常菜，并根据不同食疗功效分为增强免疫力、开胃消食、保肝护肾、降&ldquo;三高&rdquo;、防癌抗癌等5部分，每道菜品都介绍了营养分析、小贴士、制作指导，以及所用材料和做法演示。同时，本书还列出了菜品的口味、烹饪方法和适宜人群，让读者在烹饪过程中能够得心应手，有针对性地选择食材，为家人合理配膳，吃得更营养健康！<br />目录<br />作者介绍<br />甘智荣，中国烹饪的大师、中国雕刻大师、御厨获得者、深圳娱乐频道《食客准备》特邀嘉宾、中粮集团食品开发推广者、劳动局考核就业培训导师，从事烹饪工作20多年，出版专业热菜、冷菜、围边、雕刻等书籍和教学光碟三十多套，拥有丰富的教学经验。<br />文摘</p>\n</div>\n<div>\n<p><img class=\"err-product\" style=\"border: 0px; word-break: break-all; vertical-align: middle; background: url(\'images/blankbg.gif?v=2015102601\') 50% 50% no-repeat; max-width: 750px;\" src=\"https://image.suning.cn/uimg/sop/commodity/204941511481482450273600_x.jpg\" alt=\"\" /><img class=\"err-product\" style=\"border: 0px; word-break: break-all; vertical-align: middle; background: url(\'images/blankbg.gif?v=2015102601\') 50% 50% no-repeat; max-width: 750px;\" src=\"https://image.suning.cn/uimg/sop/commodity/612165921352403454381400_x.jpg\" alt=\"\" /><img class=\"err-product\" style=\"border: 0px; word-break: break-all; vertical-align: middle; background: url(\'images/blankbg.gif?v=2015102601\') 50% 50% no-repeat; max-width: 750px;\" src=\"https://image.suning.cn/uimg/sop/commodity/495786031360368569938000_x.jpg\" alt=\"\" /><img class=\"err-product\" style=\"border: 0px; word-break: break-all; vertical-align: middle; background: url(\'images/blankbg.gif?v=2015102601\') 50% 50% no-repeat; max-width: 750px;\" src=\"https://image.suning.cn/uimg/sop/commodity/613989167208382063354620_x.jpg\" alt=\"\" /><img class=\"err-product\" style=\"border: 0px; word-break: break-all; vertical-align: middle; background: url(\'images/blankbg.gif?v=2015102601\') 50% 50% no-repeat; max-width: 750px;\" src=\"https://image.suning.cn/uimg/sop/commodity/176422604911943811426187_x.jpg\" alt=\"\" /></p>\n</div>', '中国社会科学出版社', '饮食健康');
INSERT INTO `pms_product` VALUES ('15560104970188907459', '2', '24', NULL, NULL, 'SPRING BOOT编程思想(核心篇)', 'http://www.flangely.com/15560104688783909639.png', '1005', 0, 1, 1, 1, 1, 0, 0, 97.90, NULL, '小马哥（mercyblitz）', '本书是《Spring Boot 编程思想》的核心篇，开篇总览Spring Boot核心特性，接着讨论自动装配（Auto-Configuration）与SpringApplication。全书的讨论以Spring Boot为中心，议题发散至Spring技术栈、JSR及Java。希望透过全局的视角，帮助读者了解Spring Boot变迁的历程；经过多方的比较，帮助读者理解Spring Boot特性的原理；整合标准的规范，帮助读者掌握Spring Boot设计的哲学。', 118.00, 9998, 0, '本', 760.00, NULL, '', '', NULL, '', NULL, NULL, '<dl>\n<dt>商品参数</dt>\n<dd>\n<ul class=\"bookcon-param clearfix\">\n<li>作者：&nbsp;小马哥（mercyblitz）著</li>\n<li>出版社：电子工业出版社</li>\n<li>出版时间：2019-04-01 00:00:00</li>\n<li>版次：1</li>\n<li>印次：1</li>\n<li>印刷时间：2019-03-01</li>\n<li>页数：628</li>\n<li>开本：其他</li>\n<li>装帧：平装</li>\n<li>国别/地区：中国</li>\n<li>版权提供：电子工业出版社</li>\n</ul>\n</dd>\n</dl>\n<div class=\"detailpage\" align=\"center\">\n<div class=\"detailpage-top\" align=\"center\">\n<p>SPRING BOOT编程思想(核心篇)</p>\n<div align=\"left\">\n<div>作&nbsp;&nbsp;者:小马哥（mercyblitz） 著</div>\n<img class=\"err-product\" style=\"border: 0px; word-break: break-all; vertical-align: middle; background: url(\'images/blankbg.gif?v=2015102601\') 50% 50% no-repeat; max-width: 750px; float: left;\" src=\"https://image.suning.cn/uimg/sop/commodity/192316208518554215154560_x.png\" alt=\"\" />\n<div>定&nbsp;&nbsp;价:118</div>\n<img class=\"err-product\" style=\"border: 0px; word-break: break-all; vertical-align: middle; background: url(\'images/blankbg.gif?v=2015102601\') 50% 50% no-repeat; max-width: 750px; float: left;\" src=\"https://image.suning.cn/uimg/sop/commodity/192316208518554215154560_x.png\" alt=\"\" />\n<div>出&ensp;版&ensp;社:电子工业出版社</div>\n<img class=\"err-product\" style=\"border: 0px; word-break: break-all; vertical-align: middle; background: url(\'images/blankbg.gif?v=2015102601\') 50% 50% no-repeat; max-width: 750px; float: left;\" src=\"https://image.suning.cn/uimg/sop/commodity/192316208518554215154560_x.png\" alt=\"\" />\n<div>出版日期:2019年04月01日</div>\n<img class=\"err-product\" style=\"border: 0px; word-break: break-all; vertical-align: middle; background: url(\'images/blankbg.gif?v=2015102601\') 50% 50% no-repeat; max-width: 750px; float: left;\" src=\"https://image.suning.cn/uimg/sop/commodity/192316208518554215154560_x.png\" alt=\"\" />\n<div>页&nbsp;&nbsp;数:628</div>\n<img class=\"err-product\" style=\"border: 0px; word-break: break-all; vertical-align: middle; background: url(\'images/blankbg.gif?v=2015102601\') 50% 50% no-repeat; max-width: 750px; float: left;\" src=\"https://image.suning.cn/uimg/sop/commodity/192316208518554215154560_x.png\" alt=\"\" />\n<div>装&nbsp;&nbsp;帧:平装</div>\n<img class=\"err-product\" style=\"border: 0px; word-break: break-all; vertical-align: middle; background: url(\'images/blankbg.gif?v=2015102601\') 50% 50% no-repeat; max-width: 750px; float: left;\" src=\"https://image.suning.cn/uimg/sop/commodity/192316208518554215154560_x.png\" alt=\"\" />\n<div>ISBN:9787121360398</div>\n<img class=\"err-product\" style=\"border: 0px; word-break: break-all; vertical-align: middle; background: url(\'images/blankbg.gif?v=2015102601\') 50% 50% no-repeat; max-width: 750px; float: left;\" src=\"https://image.suning.cn/uimg/sop/commodity/192316208518554215154560_x.png\" alt=\"\" /></div>\n</div>\n<div class=\"detailpage-intro\" align=\"center\"><img class=\"err-product\" style=\"border: 0px; word-break: break-all; vertical-align: middle; background: url(\'images/blankbg.gif?v=2015102601\') 50% 50% no-repeat; max-width: 750px; padding: 30px 0px 0px; width: 750px;\" src=\"https://image.suning.cn/uimg/sop/commodity/103842803819430049501315_x.jpg\" alt=\"主编推荐\" />\n<p>无</p>\n</div>\n<div class=\"detailpage-intro\" align=\"center\"><img class=\"err-product\" style=\"border: 0px; word-break: break-all; vertical-align: middle; background: url(\'images/blankbg.gif?v=2015102601\') 50% 50% no-repeat; max-width: 750px; padding: 30px 0px 0px; width: 750px;\" src=\"https://image.suning.cn/uimg/sop/commodity/210805049093788418318980_x.jpg\" alt=\"内容简介\" />\n<p>本书是《Spring Boot 编程思想》的核心篇，开篇总览Spring Boot核心特性，接着讨论自动装配（Auto-Configuration）与SpringApplication。全书的讨论以Spring Boot为中心，议题发散至Spring技术栈、JSR及Java。希望透过全局的视角，帮助读者了解Spring Boot变迁的历程；经过多方的比较，帮助读者理解Spring Boot特性的原理；整合标准的规范，帮助读者掌握Spring Boot设计的哲学。</p>\n</div>\n<div class=\"detailpage-intro\" align=\"center\"><img class=\"err-product\" style=\"border: 0px; word-break: break-all; vertical-align: middle; background: url(\'images/blankbg.gif?v=2015102601\') 50% 50% no-repeat; max-width: 750px; padding: 30px 0px 0px; width: 750px;\" src=\"https://image.suning.cn/uimg/sop/commodity/291745282335986821534100_x.jpg\" alt=\"作者简介\" />\n<p>无</p>\n</div>\n<div class=\"detailpage-intro\" align=\"center\"><img class=\"err-product\" style=\"border: 0px; word-break: break-all; vertical-align: middle; background: url(\'images/blankbg.gif?v=2015102601\') 50% 50% no-repeat; max-width: 750px; padding: 30px 0px 0px; width: 750px;\" src=\"https://image.suning.cn/uimg/sop/commodity/817893119254758678131900_x.jpg\" alt=\"精彩内容\" />\n<p>无</p>\n</div>\n<div class=\"detailpage-list\" align=\"center\"><img class=\"err-product\" style=\"border: 0px; word-break: break-all; vertical-align: middle; background: url(\'images/blankbg.gif?v=2015102601\') 50% 50% no-repeat; max-width: 750px; padding: 30px 0px 0px; width: 750px;\" src=\"https://image.suning.cn/uimg/sop/commodity/201861010911529924628829_x.png\" alt=\"目录\" />\n<div>部分 总览Spring Boot 章 初览Spring Boot 2 1.1 Spring Framework时代 2 1.2 Spring Boot简介 3 1.3 Spring Boot的特性 5 1.4 准备运行环境 5 1.4.1 装配JDK 8 5 1.4.2 装配Maven 6 1.4.3 装配IDE（集成开发环境） 8 第2章 理解独立的Spring应用 9 2.1 创建Spring Boot应用 10 2.1.1 命令行方式创建Spring Boot应用 11 2.1.2 图形化界面创建Spring Boot应用 21 2.1.3 创建Spring Boot应用可执行JAR 29 2.2 运行Spring Boot应用 31 2.2.1 执行Spring Boot应用可执行JAR 32 2.2.2 Spring Boot应用可执行JAR资源结构 32 2.2.3 FAT JAR和WAR执行模块――spring-boot-loader 36 2.2.4 JarLauncher的实现原理 40 第3章 理解固化的Maven依赖 58 3.1 spring-boot-starter-parent与spring-boot-dependencies简介 58 3.2 理解spring-boot-starter-parent与spring-boot- dependencies 61 第4章 理解嵌入式Web容器 70 4.1 嵌入式Servlet Web容器 71 4.1.1 Tomcat作为嵌入式Servlet Web容器 72 4.1.2 Jetty作为嵌入式Servlet Web容器 77 4.1.3 Undertow作为嵌入式Servlet Web容器 80 4.2 嵌入式Reactive Web容器 82 4.2.1 UndertowServletWebServer作为嵌入式Reactive Web容器 82 4.2.2 UndertowWebServer作为嵌入式Reactive Web容器 84 4.2.3 WebServerInitializedEvent 91 4.2.4 Jetty作为嵌入式Reactive Web容器 93 4.2.5 Tomcat作为嵌入式Reactive Web容器 94 第5章 理解自动装配 96 5.1 理解@SpringBootApplication注解语义 97 5.2 @SpringBootApplication属性别名 103 5.3 @SpringBootApplication标注非引导类 107 5.4 @EnableAutoConfiguration激活自动装配 108 5.5 @SpringBootApplication&ldquo;继承&rdquo;@Configuration CGLIB提升特性 110 5.6 理解自动配置机制 112 5.7 创建自动配置类 116 第6章 理解Production- Ready特性 119 6.1 理解Production-Ready一般性定义 120 6.2 理解Spring Boot Actuator 123 6.3 Spring Boot Actuator Endpoints 124 6.4 理解&ldquo;外部化配置&rdquo; 129 6.5 理解&ldquo;规约大于配置&rdquo; 132 6.6 小马哥有话说 134 6.6.1 Spring Boot作为微服务中间件 134 6.6.2 Spring Boot作为Spring Cloud基础设施 135 6.7 下一站：走向自动装配 135 第2部分 走向自动装配 第7章 走向注解驱动编程（Annotation-Driven） 138 7.1 注解驱动发展史 138 7.1.1 注解驱动启蒙时代：Spring Framework 1.x 138 7.1.2 注解驱动过渡时代：Spring Framework 2.x 139 7.1.3 注解驱动黄金时代：Spring Framework 3.x 142 7.1.4 注解驱动完善时代：Spring Framework 4.x 146 7.1.5 注解驱动当下时代：Spring Framework 5.x 151 7.2 Spring核心注解场景分类 152 7.3 Spring注解编程模型 154 7.3.1 元注解（Meta-Annotations） 154 7.3.2 Spring模式注解（Stereotype Annotations） 155 7.3.3 Spring组合注解（Composed Annotations） 187 7.3.4 Spring注解属性别名和覆盖（Attribute Aliases and Overrides） 195 第8章 Spring注解驱动设计模式 225 8.1 Spring @Enable模块驱动 225 8.1.1 理解@Enable模块驱动 225 8.1.2 自定义@Enable模块驱动 226 8.1.3 @Enable模块驱动原理 236 8.2 Spring Web自动装配 250 8.2.1 理解Web自动装配 250 8.2.2 自定义Web自动装配 254 8.2.3 Web自动装配原理 258 8.3 Spring条件装配 270 8.3.1 理解配置条件装配 271 8.3.2 自定义配置条件装配 274 8.3.3 配置条件装配原理 277 第9章 Spring Boot自动装配 292 9.1 理解Spring Boot自动装配 295 9.1.1 理解@EnableAutoConfiguration 296 9.1.2 优雅地替换自动装配 298 9.1.3 失效自动装配 298 9.2 Spring Boot自动装配原理 299 9.2.1 @EnableAutoConfiguration读取候选装配组件 301 9.2.2 @EnableAutoConfiguration排除自动装配组件 305 9.2.3 @EnableAutoConfiguration过滤自动装配组件 307 9.2.4 @EnableAutoConfiguration自动装配事件 313 9.2.5 @EnableAutoConfiguration自动装配生命周期 317 9.2.6 @EnableAutoConfiguration排序自动装配组件 324 9.2.7 @EnableAutoConfiguration自动装配BasePackages 332 9.3 自定义Spring Boot自动装配 337 9.3.1 自动装配Class命名的潜规则 338 9.3.2 自动装配package命名的潜规则 338 9.3.3 自定义Spring Boot Starter 340 9.4 Spring Boot条件化自动装配 346 9.4.1 Class条件注解 347 9.4.2 Bean条件注解 358 9.4.3 属性条件注解 370 9.4.4 Resource条件注解 376 9.4.5 Web应用条件注解 391 9.4.6 Spring表达式条件注解 397 9.5 小马哥有话说 401 9.6 下一站：理解SpringApplication 402 第3部分 理解SpringApplication 0章 SpringApplication初始化阶段 405 10.1 SpringApplication构造阶段 405 10.1.1 理解SpringApplication主配置类 406 10.1.2 SpringApplication的构造过程 410 10.1.3 推断Web应用类型 411 10.1.4 加载Spring应用上下文初始化器（ApplicationContextInitializer） 412 10.1.5 加载Spring应用事件监听器（ApplicationListener） 415 10.1.6 推断应用引导类 416 10.2 SpringApplication配置阶段 417 10.2.1 自定义SpringApplication 417 10.2.2 调整SpringApplication设置 417 10.2.3 增加SpringApplication配置源 420 10.2.4 调整Spring Boot外部化配置 423 1章 SpringApplication运行阶段 425 11.1 SpringApplication准备阶段 425 11.1.1 理解SpringApplicationRunListeners 426 11.1.2 理解SpringApplicationRunListener 428 11.1.3 理解Spring Boot事件 431 11.1.4 理解Spring事件/监听机制 432 11.1.5 理解Spring Boot事件/监听机制 492 11.1.6 装配ApplicationArguments 509 11.1.7 准备ConfigurableEnvironment 512 11.1.8 创建Spring应用上下文（ConfigurableApplicationContext） 512 11.1.9 Spring应用上下文运行前准备 516 11.2 Spring应用上下文启动阶段 537 11.3 Spring应用上下文启动后阶段 539 11.3.1 afterRefresh方法签名的变化 540 11.3.2 afterRefresh方法语义的变化 541 11.3.3 Spring Boot事件ApplicationStartedEvent语义的变化 543 11.3.4 执行CommandLineRunner和ApplicationRunner 548 2章 SpringApplication结束阶段 550 12.1 SpringApplication正常结束 550 12.2 SpringApplication异常结束 555 12.2.1 Spring Boot异常处理 556 12.2.2 错误分析报告器――FailureAnalysisReporter 562 12.2.3 自定义实现FailureAnalyzer和FailureAnalysisReporter 564 12.2.4 Spring Boot 2.0重构handleRunFailure和reportFailure方法 566 12.2.5 Spring Boot 2.0的SpringBootExceptionReporter接口 567 3章 Spring Boot应用退出 571 13.1 Spring Boot应用正常退出 572 13.1.1 ExitCodeGenerator Bean生成退出码 572 13.1.2 ExitCodeGenerator Bean退出码使用场景 576 13.2 Spring Boot应用异常退出 580 13.2.1 ExitCodeGenerator异常使用场景 582 13.2.2 ExitCodeExceptionMapper Bean映射异常与退出码 587 13.2.3 退出码用于SpringApplication异常结束 589 13.3 小马哥有话说 594 13.4 下一站：运维篇</div>\n</div>\n</div>', '电子工业出版社', '软件工程开发');
INSERT INTO `pms_product` VALUES ('15560107346597237695', '2', '24', NULL, NULL, 'Spring Cloud微服务实战', 'http://www.flangely.com/15560106914498752990.png', '1006', 0, 1, 1, 1, 1, 0, 0, 58.20, NULL, '翟永超', '本书从时下流行的微服务架构概念出发，详细介绍了Spring Cloud针对微服务架构中几大核心要素的解决方案和基础组件。对于各个组件的介绍，本书主要以示例与源码结合的方式来帮助读者更好地理解这些组件的使用方法以及运行原理。同时，在介绍的过程中，还包含了作者在实践中所遇到的一些问题和解决思路，可供读者在实践中作为参考。本书适合所有Java开发人员，尤其适合正在做微服务架构技术选型或正在实施微服务架构的团队查阅和参考。', 89.00, 4997, 0, '本', 480.00, NULL, '', '', NULL, '', NULL, NULL, '<dl>\n<dt>商品参数</dt>\n<dd>\n<ul class=\"bookcon-param clearfix\">\n<li>作者：&nbsp;翟永超 著著</li>\n<li>出版社：电子工业出版社</li>\n<li>出版时间：2017-05-01 00:00:00</li>\n<li>版次：1</li>\n<li>印次：2</li>\n<li>印刷时间：2017-05-01</li>\n<li>字数：586千字</li>\n<li>页数：422</li>\n<li>开本：16开</li>\n<li>装帧：平装</li>\n<li>国别/地区：中国</li>\n<li>版权提供：电子工业出版社</li>\n</ul>\n</dd>\n</dl>\n<div class=\"detailpage\" align=\"center\">\n<div class=\"detailpage-top\" align=\"center\">\n<p>Spring Cloud微服务实战</p>\n<div align=\"left\">\n<div>作&nbsp;&nbsp;者:翟永超 著</div>\n<img class=\"err-product\" style=\"border: 0px; word-break: break-all; vertical-align: middle; background: url(\'images/blankbg.gif?v=2015102601\') 50% 50% no-repeat; max-width: 750px; float: left;\" src=\"https://image.suning.cn/uimg/sop/commodity/192316208518554215154560_x.png\" alt=\"\" />\n<div>定&nbsp;&nbsp;价:89</div>\n<img class=\"err-product\" style=\"border: 0px; word-break: break-all; vertical-align: middle; background: url(\'images/blankbg.gif?v=2015102601\') 50% 50% no-repeat; max-width: 750px; float: left;\" src=\"https://image.suning.cn/uimg/sop/commodity/192316208518554215154560_x.png\" alt=\"\" />\n<div>出&ensp;版&ensp;社:电子工业出版社</div>\n<img class=\"err-product\" style=\"border: 0px; word-break: break-all; vertical-align: middle; background: url(\'images/blankbg.gif?v=2015102601\') 50% 50% no-repeat; max-width: 750px; float: left;\" src=\"https://image.suning.cn/uimg/sop/commodity/192316208518554215154560_x.png\" alt=\"\" />\n<div>出版日期:2017年05月01日</div>\n<img class=\"err-product\" style=\"border: 0px; word-break: break-all; vertical-align: middle; background: url(\'images/blankbg.gif?v=2015102601\') 50% 50% no-repeat; max-width: 750px; float: left;\" src=\"https://image.suning.cn/uimg/sop/commodity/192316208518554215154560_x.png\" alt=\"\" />\n<div>页&nbsp;&nbsp;数:422</div>\n<img class=\"err-product\" style=\"border: 0px; word-break: break-all; vertical-align: middle; background: url(\'images/blankbg.gif?v=2015102601\') 50% 50% no-repeat; max-width: 750px; float: left;\" src=\"https://image.suning.cn/uimg/sop/commodity/192316208518554215154560_x.png\" alt=\"\" />\n<div>装&nbsp;&nbsp;帧:平装</div>\n<img class=\"err-product\" style=\"border: 0px; word-break: break-all; vertical-align: middle; background: url(\'images/blankbg.gif?v=2015102601\') 50% 50% no-repeat; max-width: 750px; float: left;\" src=\"https://image.suning.cn/uimg/sop/commodity/192316208518554215154560_x.png\" alt=\"\" />\n<div>ISBN:9787121313011</div>\n<img class=\"err-product\" style=\"border: 0px; word-break: break-all; vertical-align: middle; background: url(\'images/blankbg.gif?v=2015102601\') 50% 50% no-repeat; max-width: 750px; float: left;\" src=\"https://image.suning.cn/uimg/sop/commodity/192316208518554215154560_x.png\" alt=\"\" /></div>\n</div>\n<div class=\"detailpage-intro\" align=\"center\"><img class=\"err-product\" style=\"border: 0px; word-break: break-all; vertical-align: middle; background: url(\'images/blankbg.gif?v=2015102601\') 50% 50% no-repeat; max-width: 750px; padding: 30px 0px 0px; width: 750px;\" src=\"https://image.suning.cn/uimg/sop/commodity/103842803819430049501315_x.jpg\" alt=\"主编推荐\" />\n<p>无</p>\n</div>\n<div class=\"detailpage-intro\" align=\"center\"><img class=\"err-product\" style=\"border: 0px; word-break: break-all; vertical-align: middle; background: url(\'images/blankbg.gif?v=2015102601\') 50% 50% no-repeat; max-width: 750px; padding: 30px 0px 0px; width: 750px;\" src=\"https://image.suning.cn/uimg/sop/commodity/210805049093788418318980_x.jpg\" alt=\"内容简介\" />\n<p>本书从时下流行的微服务架构概念出发，详细介绍了Spring&nbsp;Cloud针对微服务架构中几大核心要素的解决方案和基础组件。对于各个组件的介绍，本书主要以示例与源码结合的方式来帮助读者更好地理解这些组件的使用方法以及运行原理。同时，在介绍的过程中，还包含了作者在实践中所遇到的一些问题和解决思路，可供读者在实践中作为参考。本书适合所有Java开发人员，尤其适合正在做微服务架构技术选型或正在实施微服务架构的团队查阅和参考。</p>\n</div>\n<div class=\"detailpage-intro\" align=\"center\"><img class=\"err-product\" style=\"border: 0px; word-break: break-all; vertical-align: middle; background: url(\'images/blankbg.gif?v=2015102601\') 50% 50% no-repeat; max-width: 750px; padding: 30px 0px 0px; width: 750px;\" src=\"https://image.suning.cn/uimg/sop/commodity/291745282335986821534100_x.jpg\" alt=\"作者简介\" />\n<p>翟永超，文字水平较高，行文流畅，且工作在编程靠前线，拥有扎实的理论基础和实践经验，相信会为读者奉上一本质量上乘的图书。</p>\n</div>\n<div class=\"detailpage-intro\" align=\"center\"><img class=\"err-product\" style=\"border: 0px; word-break: break-all; vertical-align: middle; background: url(\'images/blankbg.gif?v=2015102601\') 50% 50% no-repeat; max-width: 750px; padding: 30px 0px 0px; width: 750px;\" src=\"https://image.suning.cn/uimg/sop/commodity/817893119254758678131900_x.jpg\" alt=\"精彩内容\" />\n<p>无</p>\n</div>\n<div class=\"detailpage-list\" align=\"center\"><img class=\"err-product\" style=\"border: 0px; word-break: break-all; vertical-align: middle; background: url(\'images/blankbg.gif?v=2015102601\') 50% 50% no-repeat; max-width: 750px; padding: 30px 0px 0px; width: 750px;\" src=\"https://image.suning.cn/uimg/sop/commodity/201861010911529924628829_x.png\" alt=\"目录\" />\n<div>目录<br /><br /><br /><br />第1章&nbsp;&nbsp;基础知识 1<br />什么是微服务架构 1<br />与单体系统的区别 1<br />如何实施微服务 2<br />为什么选择Spring&nbsp;Cloud 6<br />Spring&nbsp;Cloud简介 7<br />版本说明 8<br />第2章&nbsp;&nbsp;微服务构建：Spring&nbsp;Boot 11<br />框架简介 12<br />快速入门 13<br />项目构建与解析 13<br />实现RESTful&nbsp;API 17<br />配置详解 20<br />配置文件 20<br />自定义参数 22<br />参数引用 22<br />使用随机数 23<br />命令行参数 23<br />多环境配置 24<br />加载顺序 25<br />监控与管理 26<br />初识actuator 27<br />原生端点 28<br />小结 38<br />第3章&nbsp;&nbsp;服务治理：Spring&nbsp;Cloud&nbsp;Eureka 39<br />服务治理 39<br />Netflix&nbsp;Eureka 40<br />搭建服务注册中心 41<br />注册服务提供者 43<br />高可用注册中心 46<br />服务发现与消费 48<br />Eureka详解 51<br />基础架构 52<br />服务治理机制 52<br />源码分析 56<br />配置详解 65<br />服务注册类配置 65<br />服务实例类配置 67<br />跨平台支持 71<br />第4章&nbsp;&nbsp;客户端负载均衡：Spring&nbsp;Cloud&nbsp;Ribbon 73<br />客户端负载均衡 73<br />RestTemplate详解 75<br />GET请求 75<br />POST请求 77<br />PUT请求 79<br />DELETE请求 79<br />源码分析 80<br />负载均衡器 91<br />负载均衡策略 109<br />配置详解 123<br />自动化配置 124<br />Camden版本对RibbonClient配置的优化 125<br />参数配置 127<br />与Eureka结合 127<br />重试机制 128<br />第5章&nbsp;&nbsp;服务容错保护：Spring&nbsp;Cloud&nbsp;Hystrix 130<br />快速入门 131<br />原理分析 135<br />工作流程 135<br />断路器原理 144<br />依赖隔离 148<br />使用详解 151<br />创建请求命令 151<br />定义服务降级 154<br />异常处理 157<br />命令名称、分组以及线程池划分 158<br />请求缓存 159<br />请求合并 166<br />属性详解 172<br />Command属性 174<br />collapser属性 184<br />threadPool属性 185<br />Hystrix仪表盘 187<br />Turbine集群监控 192<br />构建监控聚合服务 192<br />与消息代理结合 196<br />第6章&nbsp;&nbsp;声明式服务调用：Spring&nbsp;Cloud&nbsp;Feign 199<br />快速入门 200<br />参数绑定 202<br />继承特性 205<br />Ribbon配置 209<br />全局配置 209<br />指定服务配置 209<br />重试机制 210<br />Hystrix配置 211<br />全局配置 211<br />禁用Hystrix 211<br />指定命令配置 212<br />服务降级配置 212<br />其他配置 214<br />请求压缩 214<br />日志配置 215<br />第7章&nbsp;&nbsp;API网关服务：Spring&nbsp;Cloud&nbsp;Zuul 217<br />快速入门 219<br />构建网关 220<br />请求路由 221<br />请求过滤 223<br />路由详解 226<br />传统路由配置 226<br />服务路由配置 228<br />服务路由的默认规则 229<br />自定义路由映射规则 229<br />路径匹配 230<br />路由前缀 233<br />本地跳转 234<br />Cookie与头信息 235<br />Hystrix和Ribbon支持 236<br />过滤器详解 238<br />过滤器 238<br />请求生命周期 239<br />核心过滤器 240<br />异常处理 244<br />禁用过滤器 256<br />动态加载 257<br />动态路由 257<br />动态过滤器 261<br />第8章&nbsp;&nbsp;分布式配置中心：Spring&nbsp;Cloud&nbsp;Config 267<br />快速入门 267<br />构建配置中心 268<br />配置规则详解 269<br />客户端配置映射 272<br />服务端详解 274<br />基础架构 274<br />Git配置仓库 276<br />SVN配置仓库 279<br />本地仓库 279<br />本地文件系统 279<br />健康监测 280<br />属性覆盖 281<br />安全保护 281<br />加密解密 282<br />高可用配置 286<br />客户端详解 286<br />URI指定配置中心 287<br />服务化配置中心 287<br />失败快速响应与重试 290<br />获取远程配置 292<br />动态刷新配置 293<br />第9章&nbsp;&nbsp;消息总线：Spring&nbsp;Cloud&nbsp;Bus 295<br />消息代理 295<br />RabbitMQ实现消息总线 296<br />基本概念 297<br />安装与使用 298<br />快速入门 302<br />整合Spring&nbsp;Cloud&nbsp;Bus 306<br />原理分析 307<br />指定刷新范围 308<br />架构优化 309<br />RabbitMQ配置 310<br />Kafka实现消息总线 312<br />Kafka简介 312<br />快速入门 313<br />整合Spring&nbsp;Cloud&nbsp;Bus 315<br />Kafka配置 318<br />深入理解 318<br />源码分析 320<br />其他消息代理的支持 342<br />第10章&nbsp;&nbsp;消息驱动的微服务：Spring&nbsp;Cloud&nbsp;Stream 344<br />快速入门 344<br />核心概念 349<br />绑定器 350<br />发布-订阅模式 351<br />消费组 353<br />消息分区 354<br />使用详解 355<br />开启绑定功能 355<br />绑定消息通道 356<br />消息生产与消费 360<br />响应式编程 366<br />消费组与消息分区 368<br />消息类型 370<br />绑定器详解 373<br />绑定器SPI 373<br />自动化配置 374<br />多绑定器配置 374<br />RabbitMQ与Kafka绑定器 376<br />配置详解 376<br />基础配置 377<br />绑定通道配置 377<br />绑定器配置 379<br />第11章&nbsp;&nbsp;分布式服务跟踪：Spring&nbsp;Cloud&nbsp;Sleuth 386<br />快速入门 386<br />准备工作 386<br />实现跟踪 389<br />跟踪原理 390<br />抽样收集 392<br />与Logstash整合 394<br />与Zipkin整合 397<br />HTTP收集 398<br />消息中间件收集 402<br />收集原理 404<br />数据存储 414<br />API接口 417<br />附录A&nbsp;&nbsp;Starter&nbsp;POMs 419<br />后记 421</div>\n</div>\n</div>', '电子工业出版社', '软件工程开发');
INSERT INTO `pms_product` VALUES ('15571507925003552931', '7', '24', NULL, NULL, 'Redis实战', 'http://www.flangely.com/15571507508552058060.png', '1008', 0, 1, 1, 1, 1, 0, 0, 54.50, NULL, '卡尔森', 'Redis设计与实现作者黄健宏译 Redis之父作序推荐 Redis开发与运维入门', 69.00, 1000, 0, '本', 390.00, NULL, '', '', NULL, 'http://www.flangely.com/15571507546224059179.png,http://www.flangely.com/15571507575346302543.png,http://www.flangely.com/15571507611706306456.png,http://www.flangely.com/15571507638869722765.png', NULL, NULL, '<dl>\n<dt>商品参数</dt>\n<dd>\n<ul class=\"bookcon-param clearfix\">\n<li>作者：&nbsp;[美]约西亚 L.卡尔森（Josiah L. Carlson）著<span class=\"divider\">|</span>&nbsp;黄健宏译</li>\n<li>出版社：人民邮电出版社</li>\n<li>出版时间：2015-11-01 00:00:00</li>\n<li>版次：1</li>\n<li>印次：1</li>\n<li>印刷时间：2015-11-01</li>\n<li>开本：16开</li>\n<li>装帧：平装</li>\n<li>ISBN：9787115402844</li>\n<li>版权提供：人民邮电出版社</li>\n</ul>\n</dd>\n</dl>\n<dl>\n<dt>编辑推荐</dt>\n<dd>&nbsp; &nbsp; &nbsp; 当你需要以接近实时的速度访问快速变动的数据流时，Redis这样的键值数据库就是你的极好选择。通过接纳散列、字符串、列表等多种数据类型，Redis对键值对模式进行了扩展，它既提供了极其快速的内存数据集操作，又可以在运行时轻松地将这些数据持久化到磁盘上面。除此之外，Redis还是免费的、开源的。<br />　　本书对Redis本身以及它的键值对模型进行了介绍，读者将接触到包括缓存、分布式广告定向等实际使用案例，学到如何从小型的作业任务开始，扩展Redis以适应大规模的数据集，以及如何与其他传统的关系数据库或是其他NoSQL存储系统进行集成。有经验的开发者应该会对集群和服务器脚本编程等较为深入的内容感兴趣。<br />　　本书主要内容<br />　　全面介绍Redis<br />　　预处理实时数据<br />　　管理内存数据集<br />　　发布/订阅及配置<br />　　持久化到磁盘<br />　　本书面向熟悉数据库概念的开发者。阅读本书既不要求读者预先了解NoSQL数据库概念，也不要求读者有任何Redis使用经验。本书也适合具备编程能力的系统管理员阅读。<br />　　要下载本书代码可以访问manning.com/RedisinAction。</dd>\n</dl>\n<dl class=\"mt20\">\n<dt>内容简介</dt>\n<dd>&nbsp; &nbsp; &nbsp; 本书深入浅出地介绍了Redis的5种数据类型，并通过多个实用示例展示了Redis的用法。除此之外，书中还讲述了Redis的优化方法以及扩展方法，是一本对于学习和使用 Redis 来说不可多得的参考书籍。<br />　　本书一共由三个部分组成。首部分对Redis进行了介绍，说明了Redis的基本使用方法、它拥有的5种数据结构以及操作这5种数据结构的命令，并讲解了如何使用Redis去构建文章展示网站、cookie、购物车、网页缓存、数据库行缓存等一系列程序。第二部分对Redis命令进行了更详细的介绍，并展示了如何使用Redis去构建更为复杂的辅助工具和应用程序，并在结尾展示了如何使用Redis去构建一个简单的社交网站。第三部分对Redis用户经常会遇到的一些问题进行了介绍，讲解了降低Redis内存占用的方法、扩展Redis性能的方法以及使用Lua语言进行脚本编程的方法。</dd>\n</dl>\n<dl class=\"mt20\">\n<dt>作者简介</dt>\n<dd>作者介绍<br />　　Josiah L. Carlson博士既是一位经验丰富的数据库专家，也是一位活跃的Redis社区贡献者。<br />　　译者简介<br />　　黄健宏（huangz），男，1990年出生，目前是程序员、技术图书作者和译者。著有《Redis设计与实现》，翻译了《Redis命令参考》《Disque使用教程》等技术文档。想要了解更多关于黄健宏的信息，请访问他的个人网站huangz.me。</dd>\n</dl>\n<dl class=\"mt20\">\n<dt>目录</dt>\n<dd>目录<br /><br />第一部分　入门<br />第1章　初识Redis　2<br />1.1　Redis简介　3<br />1.1.1　Redis与其他数据库和软件的对比　3<br />1.1.2　附加特性　4<br />1.1.3　使用Redis的理由　5<br />1.2　Redis数据结构简介　6<br />1.2.1　Redis中的字符串　7<br />1.2.2　Redis中的列表　9<br />1.2.3　Redis的集合　10<br />1.2.4　Redis的散列　11<br />1.2.5　Redis的有序集合　12<br />1.3　你好Redis　13<br />1.3.1　对文章进行投票　15<br />1.3.2　发布并获取文章　17<br />1.3.3　对文章进行分组　19<br />1.4　寻求帮助　21<br />1.5　小结　21<br />第2章　使用Redis构建Web应用　23<br />2.1　登录和cookie缓存　24<br />2.2　使用Redis实现购物车　28<br />2.3　网页缓存　29<br />2.4　数据行缓存　30<br />2.5　网页分析　33<br />2.6　小结　34<br />第二部分　核心概念<br />第3章　Redis命令　38<br />3.1　字符串　39<br />3.2　列表　42<br />3.3　集合　44<br />3.4　散列　46<br />3.5　有序集合　48<br />3.6　发布与订阅　52<br />3.7　其他命令　54<br />3.7.1　排序　54<br />3.7.2　基本的Redis事务　56<br />3.7.3　键的过期时间　58<br />3.8　小结　60<br />第4章　数据安全与性能保障　61<br />4.1　持久化选项　61<br />4.1.1　快照持久化　62<br />4.1.2　AOF持久化　66<br />4.1.3　重写/压缩AOF文件　67<br />4.2　复制　68<br />4.2.1　配置Redis的配置选项　69<br />4.2.2　Redis复制的启动过程　70<br />4.2.3　主从链　71<br />4.2.4　检验磁盘写入　72<br />4.3　处理系统故障　73<br />4.3.1　验证快照文件和AOF文件　74<br />4.3.2　更换故障主服务器　75<br />4.4　Redis事务　76<br />4.4.1　定义用户信息和用户包裹　77<br />4.4.2　将物品放到市场上销售　78<br />4.4.3　购买物品　80<br />4.5　非事务型流水线　82<br />4.6　关于性能方面的注意事项　85<br />4.7　小结　87<br />第5章　使用Redis构建支持程序　88<br />5.1　使用Redis来记录日志　88<br />5.1.1　**日志　89<br />5.1.2　常见日志　90<br />5.2　计数器和统计数据　91<br />5.2.1　将计数器存储到Redis里面　91<br />5.2.2　使用Redis存储统计数据　96<br />5.2.3　简化统计数据的记录与发现　98<br />5.3　查找IP所属城市以及国家　100<br />5.3.1　载入位置表格　100<br />5.3.2　查找IP所属城市　102<br />5.4　服务的发现与配置　103<br />5.4.1　使用Redis存储配置信息　103<br />5.4.2　为每个应用程序组件分别配置一个Redis服务器　104<br />5.4.3　自动Redis连接管理　106<br />5.5　小结　107<br />第6章　使用Redis构建应用程序组件　109<br />6.1　自动补全　109<br />6.1.1　自动补全*近联系人　110<br />6.1.2　通讯录自动补全　112<br />6.2　分布式锁　115<br />6.2.1　锁的重要性　116<br />6.2.2　简易锁　118<br />6.2.3　使用Redis构建锁　119<br />6.2.4　细粒度锁　122<br />6.2.5　带有超时限制特性的锁　124<br />6.3　计数信号量　126<br />6.3.1　构建基本的计数信号量　126<br />6.3.2　公平信号量　128<br />6.3.3　刷新信号量　131<br />6.3.4　消除竞争条件　132<br />6.4　任务队列　133<br />6.4.1　先进先出队列　133<br />6.4.2　延迟任务　136<br />6.5　消息拉取　139<br />6.5.1　单接收者消息的发送与订阅替代品　140<br />6.5.2　多接收者消息的发送与订阅替代品　141<br />6.6　使用Redis进行文件分发　145<br />6.6.1　根据地理位置聚合用户数据　146<br />6.6.2　发送日志文件　148<br />6.6.3　接收日志文件　149<br />6.6.4　处理日志文件　150<br />6.7　小结　152<br />第7章　基于搜索的应用程序　153<br />7.1　使用Redis进行搜索　153<br />7.1.1　基本搜索原理　154<br />7.1.2　对搜索结果进行排序　160<br />7.2　有序索引　162<br />7.2.1　使用有序集合对搜索结果进行排序　162<br />7.2.2　使用有序集合实现非数值排序　164<br />7.3　广告定向　166<br />7.3.1　什么是广告服务器？　167<br />7.3.2　对广告进行索引　167<br />7.3.3　执行广告定向操作　170<br />7.3.4　从用户行为中学习　174<br />7.4　职位搜索　180<br />7.4.1　逐个查找合适的职位　180<br />7.4.2　以搜索方式查找合适的职位　181<br />7.5　小结　182<br />第8章　构建简单的社交网站　184<br />8.1　用户和状态　185<br />8.1.1　用户信息　185<br />8.1.2　状态消息　186<br />8.2　主页时间线　187<br />8.3　关注者列表和正在关注列表　188<br />8.4　状态消息的发布与删除　191<br />8.5　流API　194<br />8.5.1　流API提供的数据　195<br />8.5.2　提供数据　196<br />8.5.3　对流消息进行过滤　199<br />8.6　小结　205<br />第三部分　进阶内容<br />第9章　降低内存占用　208<br />9.1　短结构　208<br />9.1.1　压缩列表表示　209<br />9.1.2　集合的整数集合编码　211<br />9.1.3　长压缩列表和大整数集合带来的性能问题　212<br />9.2　分片结构　214<br />9.2.1　分片式散列　215<br />9.2.2　分片集合　218<br />9.3　打包存储二进制位和字节　221<br />9.3.1　决定被存储位置信息的格式　221<br />9.3.2　存储打包后的数据　223<br />9.3.3　对分片字符串进行聚合计算　224<br />9.4　小结　226<br />第10章　扩展Redis　227<br />10.1　扩展读性能　227<br />10.2　扩展写性能和内存容量　230<br />10.2.1　处理分片配置信息　232<br />10.2.2　创建分片服务器连接装饰器　233<br />10.3　扩展复杂的查询　234<br />10.3.1　扩展搜索查询量　235<br />10.3.2　扩展搜索索引大小　235<br />10.3.3　对社交网站进行扩展　240<br />10.4　小结　247<br />第11章　Redis的Lua脚本编程　248<br />11.1　在不编写C代码的情况下添加新功能　248<br />11.1.1　将Lua脚本载入Redis　249<br />11.1.2　创建新的状态消息　251<br />11.2　使用Lua重写锁和信号量　254<br />11.2.1　使用Lua实现锁的原因　254<br />11.2.2　重写锁实现　255<br />11.2.3　使用Lua实现计数信号量　257<br />11.3　移除WATCH/MULTI/EXEC事务　258<br />11.3.1　回顾群组自动补全程序　259<br />11.3.2　再次对物品买卖市场进行改进　261<br />11.4　使用Lua对列表进行分片　263<br />11.4.1　分片列表的构成　263<br />11.4.2　将元素推入分片列表　265<br />11.4.3　从分片里面里面弹出元素　266<br />11.4.4　对分片列表执行阻塞弹出操作　267<br />11.5　小结　270<br />附录A　快速安装指南　271<br />附录B　其他资源和参考资料　279</dd>\n</dl>\n<dl class=\"mt20\">\n<dt>媒体评论</dt>\n<dd>&ldquo;这本书对于Redis的生态系统非常有帮助。&rdquo;<br />　　&mdash;&mdash;摘自&ldquo;Redis之父&rdquo;Salvatore Sanfilippo为本书写的序<br />　　&ldquo;书中介绍的示例都来源于真实的使用案例，这是本书的一个主要优点。&rdquo;<br />　　&mdash;&mdash;Filippo Pacini，SG咨询公司<br />　　&ldquo;本书通过真实而全面的示例，帮助读者从新手成长为专家。&rdquo;<br />　　&mdash;&mdash;Felipe Gutierrez，VMware/Spring Source公司<br />　　&ldquo;这本书提供了极佳的深入分析以及富有洞察力的真实案例。&rdquo;<br />　　&mdash;&mdash;Bobby Abraham，Integri有限责任公司<br />　　&ldquo;此书自有黄金屋，此书自有颜如玉！&rdquo;<br />　　&mdash;&mdash;Leo Cassarani，Unboxed咨询公司</dd>\n</dl>\n<dl class=\"mt20\">\n<dt>图书书摘</dt>\n<dd>\n<p>　　要构建一个文章投票网站，我们首先要做的就是为了这个网站设置一些数值和限制条件：如果一篇文章获得了至少200张支持票（up vote），那么网站就认为这篇文章是一篇有趣的文章；假如这个网站每天发布1000篇文章，而其中的50篇符合网站对有趣文章的要求，那么网站要做的就是把这50篇文章放到文章列表前100位至少一天；另外，这个网站暂时不提供投反对票（down.vote）的功能。&nbsp;<br />　　为了产生一个能够随着时间流逝而不断减少的评分，程序需要根据文章的发布时间和当前时间来计算文章的评分，具体的计算方法为：将文章得到的支持票数量乘以一个常数，然后加上文章的发布时间，得出的结果就是文章的评分。&nbsp;<br />　　我们使用从UTC时区1970年1月1日到现在为止经过的秒数来计算文章的评分，这个值通常被称为Unix时间。之所以选择使用Unix时间，是因为在所有能够运行Redis的平台上面，使用编程语言获取这个值都是一件非常简单的事情。另外，计算评分时与支持票数量相乘的常量为432，这个常量是通过将一天的秒数（86400）除以文章展示一天所需的支持票数量（200）得出的：文章每获得一张支持票，程序就需要将文章的评分增加432分。</p>\n<p>　　&hellip;&hellip;</p>\n</dd>\n</dl>', '人民邮电出版社', '软件工程开发');
COMMIT;

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
INSERT INTO `pms_product_category` VALUES ('13', '3', '历史政治', 1, 1000, '本', 1, 1, 0, NULL, '历史政治', '历史政治');
INSERT INTO `pms_product_category` VALUES ('14', '3', '社会科学', 1, 1000, '本', 1, 1, 0, NULL, '社会科学', '社会科学');
INSERT INTO `pms_product_category` VALUES ('15', '3', '法律', 1, 1000, '本', 1, 1, 0, NULL, '法律', '法律');
INSERT INTO `pms_product_category` VALUES ('16', '5', '饮食健康', 1, 0, '本', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES ('17', '5', '运动健康', 1, 0, '本', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES ('18', '6', '医学', 1, 1000, '本', 1, 1, 0, '', '医学', '医学');
INSERT INTO `pms_product_category` VALUES ('19', '6', '自然科学', 1, 1000, '本', 1, 1, 1, '', '自然科学', '自然科学');
INSERT INTO `pms_product_category` VALUES ('2', '0', '少儿', 0, 1000, '本', 1, 1, 1, NULL, '少儿', '少儿');
INSERT INTO `pms_product_category` VALUES ('20', '4', '人际交往', 1, 0, '本', 1, 1, 0, '', '人际交往', '人际交往');
INSERT INTO `pms_product_category` VALUES ('21', '4', '经济学理论', 1, 0, '本', 1, 1, 0, '', '经济学理论', '经济学理论');
INSERT INTO `pms_product_category` VALUES ('22', '3', '地域文化', 1, 0, '本', 1, 1, 0, '', '地域文化', '地域文化');
INSERT INTO `pms_product_category` VALUES ('23', '5', '体育运动', 1, 0, '本', 1, 1, 0, '', '体育运动', '体育运动');
INSERT INTO `pms_product_category` VALUES ('24', '6', '软件工程开发', 1, 0, '本', 1, 1, 0, '', '软件工程开发', '软件工程开发');
INSERT INTO `pms_product_category` VALUES ('25', '6', '自然科学', 1, 0, '本', 1, 1, 0, '', '自然科学', '自然科学');
INSERT INTO `pms_product_category` VALUES ('26', '4', '购房置业', 1, 0, '本', 0, 0, 0, '', '购房置业', '购房置业');
INSERT INTO `pms_product_category` VALUES ('27', '1', '艺术理论', 1, 0, '本', 1, 1, 0, '', '艺术理论', '艺术理论');
INSERT INTO `pms_product_category` VALUES ('3', '0', '人文社科', 0, 1000, '本', 1, 1, 1, NULL, '人文社科', '人文社科');
INSERT INTO `pms_product_category` VALUES ('4', '0', '经管励志', 0, 1000, '本', 1, 1, 1, NULL, '经管励志', '经管励志');
INSERT INTO `pms_product_category` VALUES ('5', '0', '健康生活', 0, 1000, '本', 1, 1, 1, NULL, '健康生活', '健康生活');
INSERT INTO `pms_product_category` VALUES ('6', '0', '科技', 0, 1000, '本', 1, 1, 1, NULL, '科技', '科技');
INSERT INTO `pms_product_category` VALUES ('7', '1', '小说', 1, 1000, '本', 0, 0, 0, NULL, '小说', '小说');
INSERT INTO `pms_product_category` VALUES ('8', '1', '散文随笔', 1, 1000, '本', 0, 0, 0, NULL, '散文随笔', '散文随笔');
INSERT INTO `pms_product_category` VALUES ('9', '1', '青春文学', 1, 1000, '本', 0, 0, 0, NULL, '青春文学', '青春文学');
COMMIT;

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
-- Records of sms_home_advertise
-- ----------------------------
BEGIN;
INSERT INTO `sms_home_advertise` VALUES ('2e58c8e8651311e996321c70dd047a5b', '庆祝新中国成立70周年', 0, 'http://www.flangely.com/15559468384784997206.png', '2019-04-22 10:27:10', '2019-06-29 11:00:00', 1, 0, 0, 'https://pro.jd.com/mall/active/eCKkLyaHsxXzP3rrFmj5CZfh3ns/index.html', '庆祝新中国成立70周年', 0);
INSERT INTO `sms_home_advertise` VALUES ('30301370651211e996321c70dd047a5b', '期中考试季', 0, 'http://www.flangely.com/15559464230997208450.jpg', '2019-04-22 10:20:15', '2019-06-29 11:00:00', 1, 0, 0, 'https://doudoushuwu.suning.com/', '期中考试季', 0);
INSERT INTO `sms_home_advertise` VALUES ('c367f9ec651111e996321c70dd047a5b', '阅读丈量世界', 0, 'http://www.flangely.com/15559462313352141441.jpg', '2019-04-22 10:17:01', '2019-06-29 11:00:00', 1, 0, 0, 'https://shop.suning.com/70167435/10292554.html', '阅读丈量世界', 0);
INSERT INTO `sms_home_advertise` VALUES ('d89b1cee651211e996321c70dd047a5b', '实现财富自由', 0, 'http://www.flangely.com/15559467005809194842.png', '2019-04-22 10:24:52', '2019-06-29 11:00:00', 1, 0, 0, 'https://pro.jd.com/mall/active/2vy7dZ5DXAg69RHASdnchWABAiTy/index.html', '实现财富自由', 0);
INSERT INTO `sms_home_advertise` VALUES ('f981f046651111e996321c70dd047a5b', '世界读书日', 0, 'http://www.flangely.com/15559463295891219071.jpg', '2019-04-22 10:18:04', '2019-06-29 11:00:00', 1, 0, 0, 'https://cuxiao.suning.com/190422tushu.html', '世界读书日', 0);
COMMIT;

-- ----------------------------
-- Table structure for sms_home_brand
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_brand`;
CREATE TABLE `sms_home_brand` (
  `id` varchar(32) NOT NULL,
  `brand_id` varchar(32) DEFAULT NULL,
  `brand_name` varchar(64) DEFAULT NULL,
  `recommend_status` int(1) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='首页推荐品牌表';

-- ----------------------------
-- Records of sms_home_brand
-- ----------------------------
BEGIN;
INSERT INTO `sms_home_brand` VALUES ('1', '1', '机械工业出版社', 1, 0);
INSERT INTO `sms_home_brand` VALUES ('2', '2', '电子工业出版社', 1, 0);
INSERT INTO `sms_home_brand` VALUES ('3', '3', '中国社会科学出版社', 1, 0);
INSERT INTO `sms_home_brand` VALUES ('4', '4', '人民文学出版社', 1, 0);
INSERT INTO `sms_home_brand` VALUES ('5', '5', '清华大学出版社', 1, 0);
INSERT INTO `sms_home_brand` VALUES ('6', '6', '商务印书馆', 1, 0);
COMMIT;

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
-- Records of sms_home_new_product
-- ----------------------------
BEGIN;
INSERT INTO `sms_home_new_product` VALUES ('b47d95c865a611e99ddcfc7e800aad48', '15553804499901772673', '养生家常菜一本就够', 1, 0);
INSERT INTO `sms_home_new_product` VALUES ('ee4549c4644111e9a66111163ae0b5eb', '15553732939756338472', '哈佛牛津都在玩的1000个思维游戏', 1, 2);
INSERT INTO `sms_home_new_product` VALUES ('ee45a93c644111e9a66111163ae0b5eb', '15553736649096437842', '毛泽东选集 (全四册，大32开）', 1, 1);
INSERT INTO `sms_home_new_product` VALUES ('ee463a32644111e9a66111163ae0b5eb', '15553789430101508818', '孙子兵法与三十六计全集4册', 1, 3);
INSERT INTO `sms_home_new_product` VALUES ('ee469982644111e9a66111163ae0b5eb', '15553801990761864545', '做一个专业的班主任', 1, 0);
INSERT INTO `sms_home_new_product` VALUES ('f235d03265a711e99ddcfc7e800aad48', '15560107346597237695', 'Spring Cloud微服务实战', 1, 0);
INSERT INTO `sms_home_new_product` VALUES ('f236476065a711e99ddcfc7e800aad48', '15560104970188907459', 'SPRING BOOT编程思想(核心篇)', 1, 0);
COMMIT;

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
-- Records of sms_home_recommend_product
-- ----------------------------
BEGIN;
INSERT INTO `sms_home_recommend_product` VALUES ('0eaf286a644211e9a66111163ae0b5eb', '15553430562773215285', '拼音认读故事书', 1, 1);
INSERT INTO `sms_home_recommend_product` VALUES ('0eaf9c5a644211e9a66111163ae0b5eb', '15553732939756338472', '哈佛牛津都在玩的1000个思维游戏', 1, 2);
INSERT INTO `sms_home_recommend_product` VALUES ('0eafed72644211e9a66111163ae0b5eb', '15553736649096437842', '毛泽东选集 (全四册，大32开）', 1, 0);
COMMIT;

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
INSERT INTO `ums_admin` VALUES ('1', 'admin', '$2a$10$DmpkG4j/f0hlATTkF89yauENG4ezRbkCbcDh./QpKQ48WyyvlUaC.', 'http://www.flangely.com/snow01.jpg', '450739863@qq.com', 'admin', '我是管理员', '2019-02-25 23:26:00', '2019-05-06 10:13:05', 1);
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
INSERT INTO `ums_admin_login_log` VALUES ('01ca10cc513411e9813c20ee4aa662f8', '1', '2019-03-28 03:32:22', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('05725c5e3e9011e99a3a1fc272f26831', '1', '2019-03-04 09:13:10', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('05a128883e8e11e99a3a1fc272f26831', '1', '2019-03-04 08:58:51', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('06167cee402011e9a27267aa20a0c3f1', '1', '2019-03-06 08:56:30', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('07b263d0593c11e98cb713c5a1d64e05', '1', '2019-04-07 08:49:57', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('0b3bce24479411e98daee180dfdaa9bf', '1', '2019-03-15 21:34:38', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('0b5f637c69ac11e981bb89d4882f5005', '1', '2019-04-28 06:52:06', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('0f1c2660461d11e99e7f86231b225959', '1', '2019-03-14 00:50:23', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('1144adf63f0911e9a546b21e7d1803c5', '1', '2019-03-04 23:39:39', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('118ccabe3e9111e99a3a1fc272f26831', '1', '2019-03-04 09:20:40', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('15530150297639065705', '1', '2019-03-19 12:03:50', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('15530150561667547923', '1', '2019-03-19 12:04:16', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('163270d6402211e9a27267aa20a0c3f1', '1', '2019-03-06 09:11:16', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('16baeb3c3d1111e9a2e2e7aeb16d0df8', '1', '2019-03-02 11:31:46', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('17d72a86651511e996321c70dd047a5b', '1', '2019-04-22 10:41:28', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('183dd2a4479711e98daee180dfdaa9bf', '1', '2019-03-15 21:56:28', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('184554e65f2211e9b1917ed5b3fee373', '1', '2019-04-14 20:59:25', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('18fcfd904c4811e9bad448c70eef86ce', '1', '2019-03-21 21:13:35', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('1bc2f6be67bf11e9920da553b0795022', '1', '2019-04-25 20:03:31', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('1dd59d0245a111e9b0badb0ca92ce0dd', '1', '2019-03-13 10:03:10', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('2044314e64d611e996321c70dd047a5b', '1', '2019-04-22 03:10:44', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('2260039261e111e980b429d19d9f4476', '1', '2019-04-18 08:51:58', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('2778d16e3d1111e9a2e2e7aeb16d0df8', '1', '2019-03-02 11:32:30', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('279f7f966b5911e98c1c20b631d28d49', '1', '2019-04-30 10:03:47', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('2c41e912644211e9a66111163ae0b5eb', '1', '2019-04-21 09:31:38', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('34b5b84e402011e9a27267aa20a0c3f1', '1', '2019-03-06 08:57:48', '127.0.0.1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:65.0) Gecko/20100101 Firefox/65.0');
INSERT INTO `ums_admin_login_log` VALUES ('3f71d30464d711e996321c70dd047a5b', '1', '2019-04-22 03:18:46', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('494ad4245f7911e9b1917ed5b3fee373', '1', '2019-04-15 07:23:34', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('495abb86513311e9813c20ee4aa662f8', '1', '2019-03-28 03:27:13', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('497011dc402311e9a27267aa20a0c3f1', '1', '2019-03-06 09:19:51', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('4ba995ea461d11e99e7f86231b225959', '1', '2019-03-14 00:52:05', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('538904b03e8611e99a3a1fc272f26831', '1', '2019-03-04 08:03:46', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('59233a0c5d0411e99cb31b36be152fab', '1', '2019-04-12 04:21:27', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('5d07407a54f111e9ab602d0bb1579e15', '1', '2019-04-01 21:45:24', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('60e94562650911e996321c70dd047a5b', '1', '2019-04-22 09:17:37', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('6496dd205b7511e9ac33293aabaa53a0', '1', '2019-04-10 04:45:37', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('649d524e461d11e99e7f86231b225959', '1', '2019-03-14 00:52:47', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('66f33d2e701111e99df4a6e177af081b', '1', '2019-05-06 10:12:46', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('6822601a473c11e99444624b50b18485', '1', '2019-03-15 11:07:18', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('6838c832644211e9a66111163ae0b5eb', '1', '2019-04-21 09:33:19', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('714046d4473d11e99444624b50b18485', '1', '2019-03-15 11:14:43', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('72479e2c701111e99df4a6e177af081b', '1', '2019-05-06 10:13:05', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('76afc0fc64d611e996321c70dd047a5b', '1', '2019-04-22 03:13:09', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('77ef89a2473f11e99444624b50b18485', '1', '2019-03-15 11:29:13', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('831db542478f11e98daee180dfdaa9bf', '1', '2019-03-15 21:02:12', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('833c973664a511e996321c70dd047a5b', '1', '2019-04-21 21:22:45', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('8476dbea4ca711e9bad448c70eef86ce', '1', '2019-03-22 08:36:38', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('851c0f944fc611e9a670e42407b88678', '1', '2019-03-26 07:56:07', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('8960cfa0401111e9a27267aa20a0c3f1', '1', '2019-03-06 07:12:47', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('8e9c8d3467e811e9920da553b0795022', '1', '2019-04-26 01:00:13', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('90a465945f2711e9b1917ed5b3fee373', '1', '2019-04-14 21:38:35', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('9159709a479111e98daee180dfdaa9bf', '1', '2019-03-15 21:16:55', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('9598179c68f211e98bd058d62a501165', '1', '2019-04-27 08:44:31', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('95c28ef24bea11e9a1a9145e9df80324', '1', '2019-03-21 10:04:12', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('98704ef6478e11e98daee180dfdaa9bf', '1', '2019-03-15 20:55:38', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('987be4be5f2611e9b1917ed5b3fee373', '1', '2019-04-14 21:31:38', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('9cbd254064a511e996321c70dd047a5b', '1', '2019-04-21 21:23:27', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('9f0e1d16677711e993e71aa7f8e69846', '1', '2019-04-25 11:31:48', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('a6f2104664d411e996321c70dd047a5b', '1', '2019-04-22 03:00:11', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('a760cdae448811e993b6faa961ea7482', '1', '2019-03-12 00:35:33', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('a9d5186c65a611e99ddcfc7e800aad48', '1', '2019-04-23 04:03:30', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('aca32780461d11e99e7f86231b225959', '1', '2019-03-14 00:54:48', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('b05b2b3e3e8e11e99a3a1fc272f26831', '2', '2019-03-04 09:03:38', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('b1703c28700511e99df4a6e177af081b', '1', '2019-05-06 08:48:57', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('b5132f8e64d411e996321c70dd047a5b', '1', '2019-04-22 03:00:35', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('b588b4605fda11e98b70caa3cf275536', '1', '2019-04-15 19:00:56', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('b5c72c383e9011e99a3a1fc272f26831', '1', '2019-03-04 09:18:06', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('bb77b7744bec11e9a1a9145e9df80324', '1', '2019-03-21 10:19:34', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('bbf7e6745f4211e9b1917ed5b3fee373', '1', '2019-04-15 00:53:04', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('bc9ceb72479311e98daee180dfdaa9bf', '1', '2019-03-15 21:32:26', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('be47c36264d911e996321c70dd047a5b', '1', '2019-04-22 03:36:37', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('c2dc0e7e64d411e996321c70dd047a5b', '1', '2019-04-22 03:00:58', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('c5a7ebfc401f11e9a27267aa20a0c3f1', '1', '2019-03-06 08:54:42', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('cba675f0401f11e9a27267aa20a0c3f1', '1', '2019-03-06 08:54:52', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('cdb590d8644111e9a66111163ae0b5eb', '1', '2019-04-21 09:29:00', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('d187a6b8691111e98bd058d62a501165', '1', '2019-04-27 12:28:06', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('d421a7b2509c11e9a670e42407b88678', '1', '2019-03-27 09:30:12', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('d5a75cb6617811e980b429d19d9f4476', '1', '2019-04-17 20:25:22', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('d651cf44651411e996321c70dd047a5b', '1', '2019-04-22 10:39:38', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('d9f5229c504a11e9a670e42407b88678', '1', '2019-03-26 23:43:23', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('dc9c47de64d911e996321c70dd047a5b', '1', '2019-04-22 03:37:28', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('dfc65e60644611e9a66111163ae0b5eb', '1', '2019-04-21 10:05:18', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('e2933c5e6a2111e9a2d921d3bf420d7a', '1', '2019-04-28 20:55:38', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('e494532a644611e9a66111163ae0b5eb', '1', '2019-04-21 10:05:26', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('e8f4de804d0d11e988992a5d5388b2e2', '1', '2019-03-22 20:49:35', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('e9303af064d411e996321c70dd047a5b', '1', '2019-04-22 03:02:02', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('ec2fa150478d11e98daee180dfdaa9bf', '1', '2019-03-15 20:50:49', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('f3223e1664d211e996321c70dd047a5b', '1', '2019-04-22 02:48:00', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('f3af18684d0d11e988992a5d5388b2e2', '1', '2019-03-22 20:49:53', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
INSERT INTO `ums_admin_login_log` VALUES ('f9a5b992651411e996321c70dd047a5b', '1', '2019-04-22 10:40:37', '0:0:0:0:0:0:0:1', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chr');
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
-- Records of ums_member
-- ----------------------------
BEGIN;
INSERT INTO `ums_member` VALUES ('22fc5f3e64da11e996321c70dd047a5b', 'test', '$2a$10$ZQ9A2Iwth4Qq0do4W0C3EO4GsJx.0FxHZo8qfUPdY0GIte3n75XbO', 'test', '13158798117', NULL, NULL, NULL, NULL, NULL, NULL, '2019-04-22 03:39:26', 1);
INSERT INTO `ums_member` VALUES ('710ff5b868eb11e98bd058d62a501165', 'xiaoxiao', '$2a$10$jxWhoFlUa55/jUE/TL80wukKb6kcHwcOHAC0hjtEtyrDCSdPkWNgO', 'xiaoxiao', '13158797756', NULL, NULL, NULL, NULL, NULL, NULL, '2019-04-27 07:53:23', 1);
INSERT INTO `ums_member` VALUES ('afd1d9546bb311e98d5470fa94f81fb1', 'xiaoming', '$2a$10$q0U7G0Bb8G8ouFP7CXXwo.qHCldUexUIqCuM6qWjNbBqFlGf50bs2', 'xiaoming', '15881865678', NULL, NULL, NULL, NULL, NULL, NULL, '2019-04-30 20:51:50', 1);
INSERT INTO `ums_member` VALUES ('c82f9e86644811e9a66111163ae0b5eb', 'flangely', '$2a$10$P.d16bfDLiO2cjrof58Ay.bkKkWiw17OLnOtVPSV1Wps2ao2RgUBS', 'flangely', '13158798118', 1, 'JAVA工程师', '成都', '450739863@qq.com', NULL, '1996-06-24', '2019-04-21 10:18:57', 1);
COMMIT;

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
-- Records of ums_member_login_log
-- ----------------------------
BEGIN;
INSERT INTO `ums_member_login_log` VALUES ('035dbcde663011e9b6fc202454381ce4', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-23 20:26:41', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('042ecba864dc11e996321c70dd047a5b', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-22 03:52:54', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('05d36d4067bd11e9920da553b0795022', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-25 19:48:36', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('0c10580c675a11e993e71aa7f8e69846', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-25 08:00:06', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('145ec5c8674d11e993e71aa7f8e69846', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-25 06:27:16', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('1493d8fc64f611e996321c70dd047a5b', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-22 06:59:28', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('149e4b2e65ab11e99ddcfc7e800aad48', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-23 04:35:07', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('18d9170464df11e996321c70dd047a5b', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-22 04:14:57', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('1a54e712651511e996321c70dd047a5b', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-22 10:41:32', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('1fce6c8665ab11e99ddcfc7e800aad48', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-23 04:35:26', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('209a59b0650911e996321c70dd047a5b', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-22 09:15:49', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('23213ff4675311e993e71aa7f8e69846', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-25 07:10:38', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('23ffde166baf11e98d5470fa94f81fb1', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-30 20:19:18', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('2d650974675211e993e71aa7f8e69846', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-25 07:03:46', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('2fcb5844675211e993e71aa7f8e69846', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-25 07:03:50', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('304a5428675211e993e71aa7f8e69846', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-25 07:03:51', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('30ae5982675211e993e71aa7f8e69846', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-25 07:03:51', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('31133636675211e993e71aa7f8e69846', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-25 07:03:52', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('37f7c33666f811e993e71aa7f8e69846', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-24 20:19:49', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('3ea5e3f2670211e993e71aa7f8e69846', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-24 21:31:35', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('458cfad268e911e98bd058d62a501165', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-27 07:37:52', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('48bce3f8675311e993e71aa7f8e69846', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-25 07:11:41', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('4dce170268e511e98bd058d62a501165', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-27 07:09:27', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('52f99d52675311e993e71aa7f8e69846', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-25 07:11:58', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('5a0460ec64dc11e996321c70dd047a5b', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-22 03:55:18', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('5cba065c666c11e9b6fc202454381ce4', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-24 03:38:41', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('600e4e34666811e9b6fc202454381ce4', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-24 03:10:09', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('6047e10e675211e993e71aa7f8e69846', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-25 07:05:11', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('62263c96666c11e9b6fc202454381ce4', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-24 03:38:50', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('6b6710b4675211e993e71aa7f8e69846', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-25 07:05:30', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('78dd52de675311e993e71aa7f8e69846', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-25 07:13:02', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('794f021464f911e996321c70dd047a5b', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-22 07:23:46', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('7cec8a2268eb11e98bd058d62a501165', '710ff5b868eb11e98bd058d62a501165', '2019-04-27 07:53:43', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('7cf729e864f711e996321c70dd047a5b', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-22 07:09:33', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('818eadda64e011e996321c70dd047a5b', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-22 04:25:02', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('83f1cb1e66f911e993e71aa7f8e69846', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-24 20:29:06', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('8b379e3a64fb11e996321c70dd047a5b', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-22 07:38:35', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('8b7b1af0650711e996321c70dd047a5b', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-22 09:04:29', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('8f2429d667ea11e9920da553b0795022', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-26 01:14:33', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('918892dc64f911e996321c70dd047a5b', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-22 07:24:26', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('92043732675311e993e71aa7f8e69846', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-25 07:13:44', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('921a118e68e711e98bd058d62a501165', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-27 07:25:41', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('98608712675211e993e71aa7f8e69846', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-25 07:06:45', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('9b465bce650811e996321c70dd047a5b', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-22 09:12:05', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('9b5ed36668e611e98bd058d62a501165', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-27 07:18:47', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('9fd89fc864fc11e996321c70dd047a5b', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-22 07:46:19', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('a4433cc664fc11e996321c70dd047a5b', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-22 07:46:26', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('a611c14264f911e996321c70dd047a5b', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-22 07:25:01', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('a63068c0688411e98bd058d62a501165', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-26 19:37:34', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('a66d7090675211e993e71aa7f8e69846', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-25 07:07:09', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('a7ac9d3a6b5511e98c1c20b631d28d49', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-30 09:38:44', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('a7b9f3d8666c11e9b6fc202454381ce4', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-24 03:40:47', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('a96f78a868e511e98bd058d62a501165', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-27 07:12:01', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('ab92a57a64fc11e996321c70dd047a5b', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-22 07:46:38', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('af46c74e68eb11e98bd058d62a501165', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-27 07:55:08', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('affb81ce666c11e9b6fc202454381ce4', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-24 03:41:01', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('b347f212675311e993e71aa7f8e69846', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-25 07:14:40', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('b48909f0675211e993e71aa7f8e69846', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-25 07:07:33', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('b8adb5a0669c11e9b6fc202454381ce4', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-24 09:24:51', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('bae480ec66f611e993e71aa7f8e69846', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-24 20:09:10', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('bb21a46064dd11e996321c70dd047a5b', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-22 04:05:10', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('bbd378f068e511e98bd058d62a501165', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-27 07:12:32', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('bd0ca23e673f11e993e71aa7f8e69846', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-25 04:51:46', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('bde7ea6464f711e996321c70dd047a5b', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-22 07:11:22', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('bebc7ff0651411e996321c70dd047a5b', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-22 10:38:59', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('c048799064fc11e996321c70dd047a5b', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-22 07:47:13', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('c3e5f336675211e993e71aa7f8e69846', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-25 07:07:58', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('c4181b1a68e511e98bd058d62a501165', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-27 07:12:46', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('c4740126675211e993e71aa7f8e69846', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-25 07:07:59', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('cc8b76e06b1311e98c1c20b631d28d49', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-30 01:47:19', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('cd6e22566b1311e98c1c20b631d28d49', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-30 01:47:21', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('cdab180c69b311e981bb89d4882f5005', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-28 07:47:38', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('cf5d690a68fc11e98bd058d62a501165', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-27 09:57:43', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('d1c13b9a673f11e993e71aa7f8e69846', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-25 04:52:21', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('d2a3ea106b5111e98c1c20b631d28d49', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-30 09:11:18', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('d4681aa867bc11e9920da553b0795022', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-25 19:47:13', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('d629f82e6bb411e98d5470fa94f81fb1', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-30 21:00:04', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('d68ea192666011e9b6fc202454381ce4', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-24 02:16:11', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('e0a05322675211e993e71aa7f8e69846', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-25 07:08:47', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('e178c33664f711e996321c70dd047a5b', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-22 07:12:21', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('e221f288650811e996321c70dd047a5b', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-22 09:14:04', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('e61484d664dc11e996321c70dd047a5b', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-22 03:59:13', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('e846cbaa6b1311e98c1c20b631d28d49', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-30 01:48:06', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('e8958ee064db11e996321c70dd047a5b', '22fc5f3e64da11e996321c70dd047a5b', '2019-04-22 03:52:07', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('ed5c607464f511e996321c70dd047a5b', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-22 06:58:22', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('f1a2a086683c11e9920da553b0795022', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-26 11:04:17', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('f49421e4662e11e9b6fc202454381ce4', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-23 20:19:07', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('fa29c18e666211e9b6fc202454381ce4', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-24 02:31:30', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES ('fdbefcdc651411e996321c70dd047a5b', 'c82f9e86644811e9a66111163ae0b5eb', '2019-04-22 10:40:44', '0:0:0:0:0:0:0:1', NULL, NULL, NULL);
COMMIT;

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
-- Records of ums_member_receive_address
-- ----------------------------
BEGIN;
INSERT INTO `ums_member_receive_address` VALUES ('37bebd4c683411e9920da553b0795022', 'c82f9e86644811e9a66111163ae0b5eb', '肖黎川', '13530446538', 0, '635000', '四川省', '达州市', '开江县', '龙门街');
INSERT INTO `ums_member_receive_address` VALUES ('7567c56068e011e98bd058d62a501165', 'c82f9e86644811e9a66111163ae0b5eb', '郑强', '1588188762', NULL, '636256', '四川', '成都市', '武侯区', '天府三街');
INSERT INTO `ums_member_receive_address` VALUES ('7c8b94c468e111e98bd058d62a501165', 'c82f9e86644811e9a66111163ae0b5eb', '张三', '24213123', NULL, '23524', '四川', '达州', '开江县', '任市镇');
COMMIT;

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
