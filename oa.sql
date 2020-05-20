/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : oa

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2020-05-18 12:06:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for claim_voucher
-- ----------------------------
DROP TABLE IF EXISTS `claim_voucher`;
CREATE TABLE `claim_voucher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cause` varchar(100) DEFAULT NULL,
  `create_sn` char(5) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `next_deal_sn` char(5) DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_2` (`next_deal_sn`),
  KEY `FK_Reference_3` (`create_sn`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of claim_voucher
-- ----------------------------
INSERT INTO `claim_voucher` VALUES ('54', '报销车费', '10004', '2020-05-18 11:38:29', null, '650', '已打款');
INSERT INTO `claim_voucher` VALUES ('55', '报销娃娃-大于5000元单子', '10004', '2020-05-18 11:44:36', null, '100000', '已打款');
INSERT INTO `claim_voucher` VALUES ('56', '报销机器人--测试审批打回', '10004', '2020-05-18 11:49:25', '10004', '10', '已打回');
INSERT INTO `claim_voucher` VALUES ('57', '报销个人物品', '10004', '2020-05-18 11:52:53', null, '50', '已终止');
INSERT INTO `claim_voucher` VALUES ('58', '报销苹果手机-测试复审打回', '10004', '2020-05-18 11:57:11', '10002', '60', '已审核');
INSERT INTO `claim_voucher` VALUES ('59', '测试--复审打回-A', '10004', '2020-05-18 11:58:32', '10003', '10000002', '已提交');
INSERT INTO `claim_voucher` VALUES ('60', '测试---复审拒绝', '10004', '2020-05-18 12:03:15', null, '60000000', '已终止');

-- ----------------------------
-- Table structure for claim_voucher_item
-- ----------------------------
DROP TABLE IF EXISTS `claim_voucher_item`;
CREATE TABLE `claim_voucher_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `claim_voucher_id` int(11) DEFAULT NULL,
  `item` varchar(20) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `comment` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_4` (`claim_voucher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of claim_voucher_item
-- ----------------------------
INSERT INTO `claim_voucher_item` VALUES ('63', '54', '交通', '150', '南京出差到北京');
INSERT INTO `claim_voucher_item` VALUES ('64', '54', '餐饮', '500', '肯德基，麦当劳');
INSERT INTO `claim_voucher_item` VALUES ('65', '55', '交通', '100000', '从南京到伊拉克');
INSERT INTO `claim_voucher_item` VALUES ('66', '56', '交通', '10', '南京到新疆');
INSERT INTO `claim_voucher_item` VALUES ('67', '57', '办公', '50', '瞎搞');
INSERT INTO `claim_voucher_item` VALUES ('68', '58', '交通', '60', 'bbb');
INSERT INTO `claim_voucher_item` VALUES ('69', '59', '交通', '10000002', 'bbb');
INSERT INTO `claim_voucher_item` VALUES ('70', '60', '交通', '60000000', 'bbb');

-- ----------------------------
-- Table structure for deal_record
-- ----------------------------
DROP TABLE IF EXISTS `deal_record`;
CREATE TABLE `deal_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `claim_voucher_id` int(11) DEFAULT NULL,
  `deal_sn` char(5) DEFAULT NULL,
  `deal_time` datetime DEFAULT NULL,
  `deal_way` varchar(20) DEFAULT NULL,
  `deal_result` varchar(20) DEFAULT NULL,
  `comment` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_5` (`claim_voucher_id`),
  KEY `FK_Reference_6` (`deal_sn`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of deal_record
-- ----------------------------
INSERT INTO `deal_record` VALUES ('130', '54', '10004', '2020-05-18 11:39:31', '提交', '已提交', '无');
INSERT INTO `deal_record` VALUES ('131', '54', '10003', '2020-05-18 11:40:56', '通过', '已审核', '');
INSERT INTO `deal_record` VALUES ('132', '54', '10002', '2020-05-18 11:42:24', '打款', '已打款', '');
INSERT INTO `deal_record` VALUES ('133', '55', '10004', '2020-05-18 11:44:53', '提交', '已提交', '无');
INSERT INTO `deal_record` VALUES ('134', '55', '10003', '2020-05-18 11:45:35', '通过', '待复审', '部门经理审核通过');
INSERT INTO `deal_record` VALUES ('135', '55', '10001', '2020-05-18 11:46:55', '通过', '已审核', 'bos');
INSERT INTO `deal_record` VALUES ('136', '55', '10002', '2020-05-18 11:47:38', '打款', '已打款', '财务通过');
INSERT INTO `deal_record` VALUES ('137', '56', '10004', '2020-05-18 11:49:29', '提交', '已提交', '无');
INSERT INTO `deal_record` VALUES ('138', '56', '10003', '2020-05-18 11:50:02', '打回', '已打回', '部门经理打回！！！！');
INSERT INTO `deal_record` VALUES ('139', '56', '10004', '2020-05-18 11:50:27', '提交', '已提交', '无');
INSERT INTO `deal_record` VALUES ('140', '56', '10003', '2020-05-18 11:50:47', '打回', '已打回', '');
INSERT INTO `deal_record` VALUES ('141', '57', '10004', '2020-05-18 11:52:59', '提交', '已提交', '无');
INSERT INTO `deal_record` VALUES ('142', '57', '10003', '2020-05-18 11:53:21', '拒绝', '已终止', '拒绝！！！');
INSERT INTO `deal_record` VALUES ('143', '58', '10004', '2020-05-18 11:57:15', '提交', '已提交', '无');
INSERT INTO `deal_record` VALUES ('144', '58', '10003', '2020-05-18 11:57:40', '通过', '已审核', '');
INSERT INTO `deal_record` VALUES ('145', '59', '10004', '2020-05-18 11:58:34', '提交', '已提交', '无');
INSERT INTO `deal_record` VALUES ('146', '59', '10003', '2020-05-18 11:58:45', '通过', '待复审', '!!!');
INSERT INTO `deal_record` VALUES ('147', '59', '10001', '2020-05-18 11:59:05', '打回', '已打回', '');
INSERT INTO `deal_record` VALUES ('148', '59', '10004', '2020-05-18 12:00:00', '提交', '已提交', '无');
INSERT INTO `deal_record` VALUES ('149', '60', '10004', '2020-05-18 12:03:18', '提交', '已提交', '无');
INSERT INTO `deal_record` VALUES ('150', '60', '10003', '2020-05-18 12:03:28', '通过', '待复审', '2222');
INSERT INTO `deal_record` VALUES ('151', '60', '10001', '2020-05-18 12:03:44', '拒绝', '已终止', '3333');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `sn` char(5) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`sn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('10001', '总经理办公室', '星星大厦E座1201');
INSERT INTO `department` VALUES ('10002', '财务部', '星星大厦E座1202');
INSERT INTO `department` VALUES ('10003', '事业部', '星星大厦E座1101');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `sn` char(5) NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `department_sn` char(5) DEFAULT NULL,
  `post` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`sn`),
  KEY `FK_Reference_1` (`department_sn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('10001', '000000', '赵六', '10001', '总经理');
INSERT INTO `employee` VALUES ('10002', '000000', '王五', '10002', '财务');
INSERT INTO `employee` VALUES ('10003', '000000', '李四', '10003', '部门经理');
INSERT INTO `employee` VALUES ('10004', '000000', '张三', '10003', '员工');
