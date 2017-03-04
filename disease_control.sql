/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50532
Source Host           : 127.0.0.1:3306
Source Database       : disease_control

Target Server Type    : MYSQL
Target Server Version : 50532
File Encoding         : 65001

Date: 2014-10-11 22:39:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `assets_info`
-- ----------------------------
DROP TABLE IF EXISTS `assets_info`;
CREATE TABLE `assets_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `storage_mode_id` int(11) NOT NULL,
  `device_type_id` int(11) NOT NULL,
  `device_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `brand_format_id` int(11) NOT NULL,
  `serial_number` varchar(50) NOT NULL,
  `origin_place` varchar(50) NOT NULL,
  `measure_unit` varchar(50) NOT NULL,
  `amount` int(11) NOT NULL,
  `unit_price` double NOT NULL,
  `unit_price1` double NOT NULL,
  `invoice_number` varchar(50) NOT NULL,
  `use_situation_id` int(11) NOT NULL,
  `service_situation_id` int(11) NOT NULL,
  `service_firm` varchar(50) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `buy_staff_id` int(11) NOT NULL,
  `buy_time` date NOT NULL,
  `sign_staff_id` int(11) NOT NULL,
  `sign_time` date NOT NULL,
  `depot_staff_id` int(11) NOT NULL,
  `depot_time` date NOT NULL,
  `use_place_id` int(11) NOT NULL,
  `use_staff_id` int(11) DEFAULT NULL,
  `remark` text,
  `status` int(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3925 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of assets_info
-- ----------------------------
INSERT INTO `assets_info` VALUES ('3921', '', '', '0', '272', '419', '425', '428', '', '', '', '1', '1', '1', '', '1', '0', '', '0', '180', '2014-04-14', '180', '2014-04-14', '180', '2014-04-14', '0', null, '', '1');
INSERT INTO `assets_info` VALUES ('3922', '', '', '0', '272', '419', '425', '428', '', '', '', '1', '1', '1', '', '1', '0', '', '0', '180', '2014-04-14', '180', '2014-04-14', '180', '2014-04-14', '0', null, '', '1');
INSERT INTO `assets_info` VALUES ('3923', '', '', '0', '272', '419', '425', '428', '', '', '', '1', '1', '1', '', '1', '0', '', '0', '180', '2014-04-19', '180', '2014-04-19', '180', '2014-04-19', '0', null, '', '1');
INSERT INTO `assets_info` VALUES ('3924', '', '', '0', '272', '419', '425', '428', '', '', '', '1', '1', '1', '', '1', '0', '', '0', '180', '2014-05-01', '180', '2014-05-01', '180', '2014-05-01', '0', null, '', '1');

-- ----------------------------
-- Table structure for `assets_info_log`
-- ----------------------------
DROP TABLE IF EXISTS `assets_info_log`;
CREATE TABLE `assets_info_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL,
  `assets_id` int(11) NOT NULL,
  `operating_staff_id` int(11) NOT NULL,
  `operating_time` date NOT NULL,
  `use_staff_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of assets_info_log
-- ----------------------------

-- ----------------------------
-- Table structure for `car_info`
-- ----------------------------
DROP TABLE IF EXISTS `car_info`;
CREATE TABLE `car_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(50) NOT NULL,
  `brand_model` varchar(50) DEFAULT NULL,
  `id_num` varchar(50) DEFAULT NULL,
  `seats_num` int(11) NOT NULL,
  `buy_time` date DEFAULT NULL,
  `remark` text,
  `status` int(2) NOT NULL,
  `del_status` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_info
-- ----------------------------
INSERT INTO `car_info` VALUES ('1', '全顺', '全顺', '沪D.09403', '13', '2013-01-01', '', '1', '0');
INSERT INTO `car_info` VALUES ('3', '汇众', '汇众', '沪J.13050', '8', '2013-12-01', '', '1', '0');

-- ----------------------------
-- Table structure for `car_use_apply`
-- ----------------------------
DROP TABLE IF EXISTS `car_use_apply`;
CREATE TABLE `car_use_apply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `apply_department_id` int(11) NOT NULL DEFAULT '0',
  `apply_staff_id` int(11) NOT NULL,
  `audit_staff_id` int(11) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `car_id` int(11) NOT NULL,
  `seats_num` int(11) NOT NULL,
  `destination` varchar(50) NOT NULL,
  `freight` int(2) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `apply_type` int(2) NOT NULL,
  `remark` text,
  `create_time` datetime NOT NULL,
  `audit_time` datetime DEFAULT NULL,
  `status` int(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_use_apply
-- ----------------------------
INSERT INTO `car_use_apply` VALUES ('11', '0', '21', '0', 'edede', '1', '1', 'deded', '0', '2014-01-27 08:30:00', '2014-01-27 10:00:00', '0', 'ededededed', '2014-01-26 13:51:41', '2014-01-27 09:23:49', '1');
INSERT INTO `car_use_apply` VALUES ('12', '0', '21', '0', 'xzxxx', '1', '1', 'xxxx', '0', '2014-01-28 08:30:00', '2014-01-28 10:00:00', '0', 'qxqxqxw', '2014-01-27 09:23:41', '2014-01-27 09:23:53', '-1');
INSERT INTO `car_use_apply` VALUES ('13', '0', '21', '0', '大冲撞', '1', '1', '上海', '0', '2014-02-14 10:00:00', '2014-02-14 11:30:00', '0', 'xxxxxxxx', '2014-02-14 10:30:56', '2014-02-14 10:31:24', '1');
INSERT INTO `car_use_apply` VALUES ('14', '0', '70', '0', '1', '1', '1', '1', '0', '2014-03-12 08:30:00', '2014-03-12 10:00:00', '0', '1', '2014-03-11 14:31:46', '2014-03-11 14:31:56', '1');
INSERT INTO `car_use_apply` VALUES ('15', '0', '180', '0', '', '1', '1', '', '0', '2014-03-12 10:00:00', '2014-03-11 15:30:00', '0', '', '2014-03-11 16:07:47', '2014-03-11 16:08:44', '-1');
INSERT INTO `car_use_apply` VALUES ('16', '0', '180', '0', '1', '1', '1', '1', '0', '2014-03-12 10:00:00', '2014-03-12 20:30:00', '0', '1', '2014-03-11 16:09:05', '2014-03-12 10:48:49', '-1');
INSERT INTO `car_use_apply` VALUES ('17', '0', '70', '0', 'cdc008测试', '1', '1', 'cdc008测试', '0', '2014-03-13 08:30:00', '2014-03-13 10:00:00', '0', 'cdc008测试', '2014-03-12 10:47:57', '2014-03-13 15:52:02', '-1');
INSERT INTO `car_use_apply` VALUES ('18', '0', '70', '0', '008测试2', '1', '1', '008测试2', '1', '2014-03-13 10:00:00', '2014-03-13 11:30:00', '0', '008测试2', '2014-03-12 10:56:42', '2014-03-13 15:52:04', '-1');
INSERT INTO `car_use_apply` VALUES ('19', '0', '175', '0', '137拼车测试1', '1', '1', '137拼车测试1', '0', '2014-03-13 10:00:00', '2014-03-13 11:30:00', '1', '137拼车测试1', '2014-03-12 10:57:27', '2014-03-13 15:52:05', '-1');
INSERT INTO `car_use_apply` VALUES ('20', '0', '70', '0', '测试', '1', '1', '测试', '0', '2014-03-13 13:30:00', '2014-03-13 15:00:00', '0', '', '2014-03-12 14:15:25', '2014-03-12 14:31:04', '-1');
INSERT INTO `car_use_apply` VALUES ('21', '0', '175', '0', '22', '1', '1', '22', '0', '2014-03-15 08:30:00', '2014-03-15 15:00:00', '0', '22', '2014-03-13 15:27:05', '2014-03-13 15:52:07', '-1');
INSERT INTO `car_use_apply` VALUES ('22', '0', '175', '0', '', '1', '1', '', '0', '2014-03-15 15:00:00', '2014-03-16 16:30:00', '0', '', '2014-03-13 15:28:20', '2014-03-13 15:52:08', '-1');
INSERT INTO `car_use_apply` VALUES ('23', '0', '175', '0', '111', '1', '1', '111', '1', '2014-03-14 10:00:00', '2014-03-14 11:30:00', '0', '111', '2014-03-13 15:52:21', '2014-03-13 15:52:27', '1');
INSERT INTO `car_use_apply` VALUES ('24', '0', '175', '0', '', '1', '1', '', '0', '2014-03-14 08:30:00', '2014-03-14 16:00:00', '0', '', '2014-03-13 15:52:46', '2014-03-13 15:53:17', '1');
INSERT INTO `car_use_apply` VALUES ('25', '8', '70', '0', null, '1', '1', '长中心', '0', '2014-03-21 08:30:00', '2014-03-21 11:00:00', '0', '', '2014-03-21 09:58:09', '2014-03-21 09:59:31', '-1');
INSERT INTO `car_use_apply` VALUES ('26', '8', '70', null, null, '1', '1', '长中心', '1', '2014-03-21 07:30:00', '2014-03-21 10:00:00', '0', '', '2014-03-21 09:59:47', null, '-1');
INSERT INTO `car_use_apply` VALUES ('27', '8', '70', null, null, '1', '1', '打发打发', '0', '2014-03-21 10:00:00', '2014-03-21 10:30:00', '0', '', '2014-03-21 10:00:39', null, '-1');
INSERT INTO `car_use_apply` VALUES ('28', '8', '70', '0', null, '1', '1', '12', '0', '2014-03-22 07:30:00', '2014-03-22 10:30:00', '0', '', '2014-03-21 10:04:37', '2014-03-21 10:04:44', '-1');
INSERT INTO `car_use_apply` VALUES ('31', '6', '180', null, null, '1', '1', '111', '0', '2014-03-22 07:30:00', '2014-03-22 08:00:00', '0', '', '2014-03-21 15:00:31', null, '1');
INSERT INTO `car_use_apply` VALUES ('32', '6', '180', null, null, '1', '1', '111111111111111', '0', '2014-03-22 10:00:00', '2014-03-22 10:30:00', '0', '', '2014-03-21 15:47:52', null, '1');
INSERT INTO `car_use_apply` VALUES ('33', '6', '180', null, null, '1', '1', '123456789101112', '0', '2014-03-22 12:00:00', '2014-03-22 12:30:00', '0', '', '2014-03-21 15:48:13', null, '1');
INSERT INTO `car_use_apply` VALUES ('34', '21', '128', null, null, '1', '1', 'xxxxxx', '0', '2014-03-29 07:30:00', '2014-03-29 10:00:00', '0', 'xxxxxxxxxxx', '2014-03-28 18:01:16', null, '-1');
INSERT INTO `car_use_apply` VALUES ('35', '6', '180', null, null, '1', '1', '123', '0', '2014-05-04 12:00:00', '2014-05-04 15:00:00', '0', '123123', '2014-05-04 13:14:26', null, '1');
INSERT INTO `car_use_apply` VALUES ('36', '20', '64', '0', null, '1', '1', '123123', '0', '2014-05-04 15:00:00', '2014-05-04 17:00:00', '0', '1213', '2014-05-04 13:15:08', '2014-05-04 13:16:37', '-1');
INSERT INTO `car_use_apply` VALUES ('37', '6', '180', null, null, '1', '1', '123123', '0', '2014-05-06 12:00:00', '2014-05-06 15:00:00', '0', '123123', '2014-05-06 13:11:19', null, '1');
INSERT INTO `car_use_apply` VALUES ('38', '6', '180', null, null, '1', '1', '看看看', '0', '2014-06-11 12:00:00', '2014-06-11 15:00:00', '0', '', '2014-06-11 12:14:29', null, '1');
INSERT INTO `car_use_apply` VALUES ('39', '6', '180', null, null, '1', '1', '123123', '0', '2014-06-13 10:00:00', '2014-06-13 11:30:00', '0', '123123', '2014-06-13 10:02:52', null, '1');
INSERT INTO `car_use_apply` VALUES ('41', '7', '66', '0', null, '1', '1', '123123', '0', '2014-06-13 12:00:00', '2014-06-13 15:00:00', '1', '123123123', '2014-06-13 10:31:06', '2014-06-13 10:31:36', '-2');
INSERT INTO `car_use_apply` VALUES ('42', '7', '66', '0', null, '1', '1', '111', '0', '2014-06-14 07:30:00', '2014-06-14 16:30:00', '0', '111', '2014-06-13 10:34:16', '2014-06-13 10:34:35', '-2');
INSERT INTO `car_use_apply` VALUES ('43', '6', '180', null, null, '1', '1', '123123', '0', '2014-06-13 12:00:00', '2014-06-13 15:00:00', '1', '12313212', '2014-06-13 10:38:35', null, '-2');
INSERT INTO `car_use_apply` VALUES ('44', '6', '180', null, null, '1', '1', '123123', '0', '2014-06-14 07:30:00', '2014-06-14 16:30:00', '1', '123131313123', '2014-06-13 10:47:35', null, '-2');

-- ----------------------------
-- Table structure for `charge_range`
-- ----------------------------
DROP TABLE IF EXISTS `charge_range`;
CREATE TABLE `charge_range` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` varchar(255) NOT NULL,
  `department_ids` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of charge_range
-- ----------------------------
INSERT INTO `charge_range` VALUES ('1', '21', '2,3,6,7');
INSERT INTO `charge_range` VALUES ('3', '114', '11,15,22,16,9');
INSERT INTO `charge_range` VALUES ('4', '180', '16,18,7,8,9,10,11,12,13,14,33,34,15,19,20,21,22,6');
INSERT INTO `charge_range` VALUES ('6', '85', '10,12,14,13');
INSERT INTO `charge_range` VALUES ('7', '68', '21,33,34');
INSERT INTO `charge_range` VALUES ('8', '64', '7,18,8,19');

-- ----------------------------
-- Table structure for `data_brand`
-- ----------------------------
DROP TABLE IF EXISTS `data_brand`;
CREATE TABLE `data_brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `device_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=842 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of data_brand
-- ----------------------------
INSERT INTO `data_brand` VALUES ('425', '大众', '419');
INSERT INTO `data_brand` VALUES ('426', '其他', '420');
INSERT INTO `data_brand` VALUES ('427', '其他', '421');
INSERT INTO `data_brand` VALUES ('428', '其他', '422');
INSERT INTO `data_brand` VALUES ('429', '其他', '423');
INSERT INTO `data_brand` VALUES ('430', '其他', '424');
INSERT INTO `data_brand` VALUES ('431', '麦尚', '425');
INSERT INTO `data_brand` VALUES ('432', '汉磊', '426');
INSERT INTO `data_brand` VALUES ('433', '其他', '427');
INSERT INTO `data_brand` VALUES ('434', '其他', '428');
INSERT INTO `data_brand` VALUES ('435', '沈苏', '429');
INSERT INTO `data_brand` VALUES ('436', 'Hudson', '430');
INSERT INTO `data_brand` VALUES ('437', 'Hudson', '431');
INSERT INTO `data_brand` VALUES ('438', '三洋', '432');
INSERT INTO `data_brand` VALUES ('439', '三洋', '433');
INSERT INTO `data_brand` VALUES ('440', '惠普', '434');
INSERT INTO `data_brand` VALUES ('441', '惠普', '435');
INSERT INTO `data_brand` VALUES ('442', '夏普', '436');
INSERT INTO `data_brand` VALUES ('443', '三星', '437');
INSERT INTO `data_brand` VALUES ('444', '爱普生', '438');
INSERT INTO `data_brand` VALUES ('445', '蔡司', '439');
INSERT INTO `data_brand` VALUES ('446', 'TSI', '440');
INSERT INTO `data_brand` VALUES ('447', '别克', '441');
INSERT INTO `data_brand` VALUES ('448', '三星', '442');
INSERT INTO `data_brand` VALUES ('449', '富士施乐', '443');
INSERT INTO `data_brand` VALUES ('450', '富士施乐', '444');
INSERT INTO `data_brand` VALUES ('451', '爱普生', '445');
INSERT INTO `data_brand` VALUES ('452', '其他', '446');
INSERT INTO `data_brand` VALUES ('453', '惠普', '445');
INSERT INTO `data_brand` VALUES ('454', '三星', '447');
INSERT INTO `data_brand` VALUES ('455', '百得', '448');
INSERT INTO `data_brand` VALUES ('456', '八益', '449');
INSERT INTO `data_brand` VALUES ('457', '惠普', '450');
INSERT INTO `data_brand` VALUES ('458', 'IBS', '451');
INSERT INTO `data_brand` VALUES ('459', '惠普', '452');
INSERT INTO `data_brand` VALUES ('460', '其他', '453');
INSERT INTO `data_brand` VALUES ('461', '佳能', '444');
INSERT INTO `data_brand` VALUES ('462', '中兴', '454');
INSERT INTO `data_brand` VALUES ('463', 'TSET', '455');
INSERT INTO `data_brand` VALUES ('464', '吉天', '456');
INSERT INTO `data_brand` VALUES ('465', '远天', '457');
INSERT INTO `data_brand` VALUES ('466', '哈希', '458');
INSERT INTO `data_brand` VALUES ('467', 'SKC', '459');
INSERT INTO `data_brand` VALUES ('468', '恒达', '460');
INSERT INTO `data_brand` VALUES ('469', 'UNFOR', '461');
INSERT INTO `data_brand` VALUES ('470', '开能', '462');
INSERT INTO `data_brand` VALUES ('471', '三洋', '463');
INSERT INTO `data_brand` VALUES ('472', '西门子', '464');
INSERT INTO `data_brand` VALUES ('473', 'MOCTIC', '465');
INSERT INTO `data_brand` VALUES ('474', 'MOCTIC', '466');
INSERT INTO `data_brand` VALUES ('475', 'BEE', '467');
INSERT INTO `data_brand` VALUES ('476', '舒尔', '468');
INSERT INTO `data_brand` VALUES ('477', '索尼', '469');
INSERT INTO `data_brand` VALUES ('478', '其他', '470');
INSERT INTO `data_brand` VALUES ('479', '三星', '470');
INSERT INTO `data_brand` VALUES ('480', 'WJD', '471');
INSERT INTO `data_brand` VALUES ('481', '日学', '472');
INSERT INTO `data_brand` VALUES ('482', '白塔金昌', '473');
INSERT INTO `data_brand` VALUES ('483', '维尔康', '474');
INSERT INTO `data_brand` VALUES ('484', '恒达', '475');
INSERT INTO `data_brand` VALUES ('485', '其他', '476');
INSERT INTO `data_brand` VALUES ('486', '理光', '477');
INSERT INTO `data_brand` VALUES ('487', '理光', '478');
INSERT INTO `data_brand` VALUES ('488', '奥林巴斯', '465');
INSERT INTO `data_brand` VALUES ('489', '其他', '479');
INSERT INTO `data_brand` VALUES ('490', '其他', '480');
INSERT INTO `data_brand` VALUES ('491', '其他', '481');
INSERT INTO `data_brand` VALUES ('492', '其他', '482');
INSERT INTO `data_brand` VALUES ('493', '其他', '483');
INSERT INTO `data_brand` VALUES ('494', '其他', '484');
INSERT INTO `data_brand` VALUES ('495', '其他', '485');
INSERT INTO `data_brand` VALUES ('496', '其他', '486');
INSERT INTO `data_brand` VALUES ('497', '其他', '487');
INSERT INTO `data_brand` VALUES ('498', '其他', '488');
INSERT INTO `data_brand` VALUES ('499', '其他', '489');
INSERT INTO `data_brand` VALUES ('500', '其他', '490');
INSERT INTO `data_brand` VALUES ('501', '其他', '491');
INSERT INTO `data_brand` VALUES ('502', '其他', '492');
INSERT INTO `data_brand` VALUES ('503', '其他', '493');
INSERT INTO `data_brand` VALUES ('504', '其他', '494');
INSERT INTO `data_brand` VALUES ('505', '其他', '495');
INSERT INTO `data_brand` VALUES ('506', '其他', '496');
INSERT INTO `data_brand` VALUES ('507', '其他', '471');
INSERT INTO `data_brand` VALUES ('508', '其他', '497');
INSERT INTO `data_brand` VALUES ('509', '其他', '498');
INSERT INTO `data_brand` VALUES ('510', '其他', '499');
INSERT INTO `data_brand` VALUES ('511', '其他', '500');
INSERT INTO `data_brand` VALUES ('512', '其他', '501');
INSERT INTO `data_brand` VALUES ('513', '江铃全顺', '502');
INSERT INTO `data_brand` VALUES ('514', '江铃全顺', '503');
INSERT INTO `data_brand` VALUES ('515', '赛宝', '441');
INSERT INTO `data_brand` VALUES ('516', '汇众', '441');
INSERT INTO `data_brand` VALUES ('517', '依维柯', '504');
INSERT INTO `data_brand` VALUES ('518', '其他', '505');
INSERT INTO `data_brand` VALUES ('519', '其他', '506');
INSERT INTO `data_brand` VALUES ('520', '其他', '507');
INSERT INTO `data_brand` VALUES ('521', '其他', '508');
INSERT INTO `data_brand` VALUES ('522', '其他', '509');
INSERT INTO `data_brand` VALUES ('523', '其他', '510');
INSERT INTO `data_brand` VALUES ('524', '其他', '511');
INSERT INTO `data_brand` VALUES ('525', '其他', '512');
INSERT INTO `data_brand` VALUES ('526', '其他', '513');
INSERT INTO `data_brand` VALUES ('527', '其他', '514');
INSERT INTO `data_brand` VALUES ('528', '其他', '515');
INSERT INTO `data_brand` VALUES ('529', '其他', '516');
INSERT INTO `data_brand` VALUES ('530', '其他', '517');
INSERT INTO `data_brand` VALUES ('531', '其他', '518');
INSERT INTO `data_brand` VALUES ('532', '其他', '519');
INSERT INTO `data_brand` VALUES ('533', '其他', '520');
INSERT INTO `data_brand` VALUES ('534', '其他', '521');
INSERT INTO `data_brand` VALUES ('535', '其他', '522');
INSERT INTO `data_brand` VALUES ('536', '其他', '523');
INSERT INTO `data_brand` VALUES ('537', '其他', '524');
INSERT INTO `data_brand` VALUES ('538', '其他', '525');
INSERT INTO `data_brand` VALUES ('539', '其他', '526');
INSERT INTO `data_brand` VALUES ('540', '其他', '527');
INSERT INTO `data_brand` VALUES ('541', '其他', '528');
INSERT INTO `data_brand` VALUES ('542', '其他', '529');
INSERT INTO `data_brand` VALUES ('543', '其他', '530');
INSERT INTO `data_brand` VALUES ('544', '其他', '531');
INSERT INTO `data_brand` VALUES ('545', '其他', '532');
INSERT INTO `data_brand` VALUES ('546', '其他', '533');
INSERT INTO `data_brand` VALUES ('547', '其他', '534');
INSERT INTO `data_brand` VALUES ('548', '其他', '535');
INSERT INTO `data_brand` VALUES ('549', '其他', '536');
INSERT INTO `data_brand` VALUES ('550', '其他', '537');
INSERT INTO `data_brand` VALUES ('551', '其他', '538');
INSERT INTO `data_brand` VALUES ('552', '其他', '539');
INSERT INTO `data_brand` VALUES ('553', '其他', '540');
INSERT INTO `data_brand` VALUES ('554', '其他', '541');
INSERT INTO `data_brand` VALUES ('555', '其他', '542');
INSERT INTO `data_brand` VALUES ('556', '其他', '543');
INSERT INTO `data_brand` VALUES ('557', '其他', '544');
INSERT INTO `data_brand` VALUES ('558', '其他', '545');
INSERT INTO `data_brand` VALUES ('559', '其他', '546');
INSERT INTO `data_brand` VALUES ('560', '其他', '547');
INSERT INTO `data_brand` VALUES ('561', '其他', '548');
INSERT INTO `data_brand` VALUES ('562', '其他', '549');
INSERT INTO `data_brand` VALUES ('563', '其他', '550');
INSERT INTO `data_brand` VALUES ('564', '其他', '551');
INSERT INTO `data_brand` VALUES ('565', '其他', '552');
INSERT INTO `data_brand` VALUES ('566', '其他', '553');
INSERT INTO `data_brand` VALUES ('567', '其他', '554');
INSERT INTO `data_brand` VALUES ('568', '其他', '555');
INSERT INTO `data_brand` VALUES ('569', '其他', '556');
INSERT INTO `data_brand` VALUES ('570', '其他', '557');
INSERT INTO `data_brand` VALUES ('571', '其他', '558');
INSERT INTO `data_brand` VALUES ('572', '其他', '559');
INSERT INTO `data_brand` VALUES ('573', '其他', '560');
INSERT INTO `data_brand` VALUES ('574', '其他', '561');
INSERT INTO `data_brand` VALUES ('575', '其他', '562');
INSERT INTO `data_brand` VALUES ('576', '其他', '563');
INSERT INTO `data_brand` VALUES ('577', '其他', '564');
INSERT INTO `data_brand` VALUES ('578', '其他', '565');
INSERT INTO `data_brand` VALUES ('579', '其他', '566');
INSERT INTO `data_brand` VALUES ('580', '其他', '567');
INSERT INTO `data_brand` VALUES ('581', '其他', '568');
INSERT INTO `data_brand` VALUES ('582', '其他', '569');
INSERT INTO `data_brand` VALUES ('583', '其他', '570');
INSERT INTO `data_brand` VALUES ('584', '其他', '571');
INSERT INTO `data_brand` VALUES ('585', '其他', '572');
INSERT INTO `data_brand` VALUES ('586', '其他', '573');
INSERT INTO `data_brand` VALUES ('587', '其他', '574');
INSERT INTO `data_brand` VALUES ('588', '其他', '575');
INSERT INTO `data_brand` VALUES ('589', '其他', '576');
INSERT INTO `data_brand` VALUES ('590', '其他', '577');
INSERT INTO `data_brand` VALUES ('591', '其他', '465');
INSERT INTO `data_brand` VALUES ('592', '其他', '578');
INSERT INTO `data_brand` VALUES ('593', '其他', '579');
INSERT INTO `data_brand` VALUES ('594', '其他', '580');
INSERT INTO `data_brand` VALUES ('595', '其他', '581');
INSERT INTO `data_brand` VALUES ('596', '其他', '582');
INSERT INTO `data_brand` VALUES ('597', '其他', '583');
INSERT INTO `data_brand` VALUES ('598', '其他', '584');
INSERT INTO `data_brand` VALUES ('599', '其他', '585');
INSERT INTO `data_brand` VALUES ('600', '其他', '586');
INSERT INTO `data_brand` VALUES ('601', '其他', '587');
INSERT INTO `data_brand` VALUES ('602', '其他', '588');
INSERT INTO `data_brand` VALUES ('603', '其他', '589');
INSERT INTO `data_brand` VALUES ('604', '其他', '590');
INSERT INTO `data_brand` VALUES ('605', '其他', '591');
INSERT INTO `data_brand` VALUES ('606', '其他', '592');
INSERT INTO `data_brand` VALUES ('607', '其他', '593');
INSERT INTO `data_brand` VALUES ('608', '其他', '594');
INSERT INTO `data_brand` VALUES ('609', '其他', '595');
INSERT INTO `data_brand` VALUES ('610', '其他', '596');
INSERT INTO `data_brand` VALUES ('611', '其他', '597');
INSERT INTO `data_brand` VALUES ('612', '其他', '598');
INSERT INTO `data_brand` VALUES ('613', '其他', '599');
INSERT INTO `data_brand` VALUES ('614', '其他', '600');
INSERT INTO `data_brand` VALUES ('615', '其他', '601');
INSERT INTO `data_brand` VALUES ('616', '其他', '602');
INSERT INTO `data_brand` VALUES ('617', '其他', '603');
INSERT INTO `data_brand` VALUES ('618', '其他', '604');
INSERT INTO `data_brand` VALUES ('619', '其他', '605');
INSERT INTO `data_brand` VALUES ('620', '其他', '606');
INSERT INTO `data_brand` VALUES ('621', '其他', '607');
INSERT INTO `data_brand` VALUES ('622', '其他', '608');
INSERT INTO `data_brand` VALUES ('623', '其他', '609');
INSERT INTO `data_brand` VALUES ('624', '其他', '610');
INSERT INTO `data_brand` VALUES ('625', '其他', '450');
INSERT INTO `data_brand` VALUES ('626', '其他', '611');
INSERT INTO `data_brand` VALUES ('627', '其他', '612');
INSERT INTO `data_brand` VALUES ('628', '其他', '613');
INSERT INTO `data_brand` VALUES ('629', '其他', '614');
INSERT INTO `data_brand` VALUES ('630', '其他', '615');
INSERT INTO `data_brand` VALUES ('631', '其他', '616');
INSERT INTO `data_brand` VALUES ('632', '其他', '617');
INSERT INTO `data_brand` VALUES ('633', '其他', '618');
INSERT INTO `data_brand` VALUES ('634', '其他', '619');
INSERT INTO `data_brand` VALUES ('635', '其他', '620');
INSERT INTO `data_brand` VALUES ('636', '其他', '621');
INSERT INTO `data_brand` VALUES ('637', '其他', '622');
INSERT INTO `data_brand` VALUES ('638', '其他', '623');
INSERT INTO `data_brand` VALUES ('639', '其他', '624');
INSERT INTO `data_brand` VALUES ('640', '其他', '625');
INSERT INTO `data_brand` VALUES ('641', '其他', '626');
INSERT INTO `data_brand` VALUES ('642', '其他', '627');
INSERT INTO `data_brand` VALUES ('643', '其他', '628');
INSERT INTO `data_brand` VALUES ('644', '其他', '629');
INSERT INTO `data_brand` VALUES ('645', '其他', '630');
INSERT INTO `data_brand` VALUES ('646', '其他', '631');
INSERT INTO `data_brand` VALUES ('647', '其他', '632');
INSERT INTO `data_brand` VALUES ('648', '其他', '633');
INSERT INTO `data_brand` VALUES ('649', '其他', '634');
INSERT INTO `data_brand` VALUES ('650', '其他', '635');
INSERT INTO `data_brand` VALUES ('651', '其他', '636');
INSERT INTO `data_brand` VALUES ('652', '其他', '637');
INSERT INTO `data_brand` VALUES ('653', '其他', '638');
INSERT INTO `data_brand` VALUES ('654', '其他', '639');
INSERT INTO `data_brand` VALUES ('655', '其他', '640');
INSERT INTO `data_brand` VALUES ('656', '其他', '641');
INSERT INTO `data_brand` VALUES ('657', '其他', '642');
INSERT INTO `data_brand` VALUES ('658', '其他', '643');
INSERT INTO `data_brand` VALUES ('659', '其他', '644');
INSERT INTO `data_brand` VALUES ('660', '其他', '645');
INSERT INTO `data_brand` VALUES ('661', '其他', '646');
INSERT INTO `data_brand` VALUES ('662', '其他', '647');
INSERT INTO `data_brand` VALUES ('663', '其他', '648');
INSERT INTO `data_brand` VALUES ('664', '其他', '649');
INSERT INTO `data_brand` VALUES ('665', '其他', '650');
INSERT INTO `data_brand` VALUES ('666', '其他', '651');
INSERT INTO `data_brand` VALUES ('667', '其他', '652');
INSERT INTO `data_brand` VALUES ('668', '其他', '653');
INSERT INTO `data_brand` VALUES ('669', '其他', '654');
INSERT INTO `data_brand` VALUES ('670', '其他', '655');
INSERT INTO `data_brand` VALUES ('671', '其他', '656');
INSERT INTO `data_brand` VALUES ('672', '其他', '657');
INSERT INTO `data_brand` VALUES ('673', '其他', '658');
INSERT INTO `data_brand` VALUES ('674', '其他', '659');
INSERT INTO `data_brand` VALUES ('675', '其他', '660');
INSERT INTO `data_brand` VALUES ('676', '其他', '661');
INSERT INTO `data_brand` VALUES ('677', '其他', '662');
INSERT INTO `data_brand` VALUES ('678', '其他', '663');
INSERT INTO `data_brand` VALUES ('679', '其他', '664');
INSERT INTO `data_brand` VALUES ('680', '其他', '665');
INSERT INTO `data_brand` VALUES ('681', '其他', '666');
INSERT INTO `data_brand` VALUES ('682', '其他', '667');
INSERT INTO `data_brand` VALUES ('683', '其他', '668');
INSERT INTO `data_brand` VALUES ('684', '其他', '669');
INSERT INTO `data_brand` VALUES ('685', '其他', '670');
INSERT INTO `data_brand` VALUES ('686', '其他', '671');
INSERT INTO `data_brand` VALUES ('687', '其他', '672');
INSERT INTO `data_brand` VALUES ('688', '其他', '673');
INSERT INTO `data_brand` VALUES ('689', '其他', '674');
INSERT INTO `data_brand` VALUES ('690', '其他', '675');
INSERT INTO `data_brand` VALUES ('691', '其他', '676');
INSERT INTO `data_brand` VALUES ('692', '其他', '677');
INSERT INTO `data_brand` VALUES ('693', '其他', '678');
INSERT INTO `data_brand` VALUES ('694', '其他', '679');
INSERT INTO `data_brand` VALUES ('695', '其他', '680');
INSERT INTO `data_brand` VALUES ('696', '其他', '681');
INSERT INTO `data_brand` VALUES ('697', '其他', '682');
INSERT INTO `data_brand` VALUES ('698', '其他', '683');
INSERT INTO `data_brand` VALUES ('699', '其他', '684');
INSERT INTO `data_brand` VALUES ('700', '其他', '685');
INSERT INTO `data_brand` VALUES ('701', '其他', '686');
INSERT INTO `data_brand` VALUES ('702', '其他', '687');
INSERT INTO `data_brand` VALUES ('703', '其他', '688');
INSERT INTO `data_brand` VALUES ('704', '其他', '689');
INSERT INTO `data_brand` VALUES ('705', '其他', '690');
INSERT INTO `data_brand` VALUES ('706', '其他', '691');
INSERT INTO `data_brand` VALUES ('707', '其他', '692');
INSERT INTO `data_brand` VALUES ('708', '其他', '693');
INSERT INTO `data_brand` VALUES ('709', '其他', '694');
INSERT INTO `data_brand` VALUES ('710', '其他', '695');
INSERT INTO `data_brand` VALUES ('711', '其他', '696');
INSERT INTO `data_brand` VALUES ('712', '其他', '697');
INSERT INTO `data_brand` VALUES ('713', '其他', '698');
INSERT INTO `data_brand` VALUES ('714', '其他', '699');
INSERT INTO `data_brand` VALUES ('715', '其他', '700');
INSERT INTO `data_brand` VALUES ('716', '其他', '701');
INSERT INTO `data_brand` VALUES ('717', '其他', '702');
INSERT INTO `data_brand` VALUES ('718', '其他', '703');
INSERT INTO `data_brand` VALUES ('719', '其他', '704');
INSERT INTO `data_brand` VALUES ('720', '其他', '705');
INSERT INTO `data_brand` VALUES ('721', '其他', '706');
INSERT INTO `data_brand` VALUES ('722', '其他', '707');
INSERT INTO `data_brand` VALUES ('723', '其他', '708');
INSERT INTO `data_brand` VALUES ('724', '其他', '709');
INSERT INTO `data_brand` VALUES ('725', '其他', '710');
INSERT INTO `data_brand` VALUES ('726', '其他', '711');
INSERT INTO `data_brand` VALUES ('727', '其他', '712');
INSERT INTO `data_brand` VALUES ('728', '其他', '713');
INSERT INTO `data_brand` VALUES ('729', '其他', '714');
INSERT INTO `data_brand` VALUES ('730', '其他', '715');
INSERT INTO `data_brand` VALUES ('731', '其他', '716');
INSERT INTO `data_brand` VALUES ('732', '其他', '717');
INSERT INTO `data_brand` VALUES ('733', '其他', '718');
INSERT INTO `data_brand` VALUES ('734', '其他', '719');
INSERT INTO `data_brand` VALUES ('735', '其他', '720');
INSERT INTO `data_brand` VALUES ('736', '其他', '721');
INSERT INTO `data_brand` VALUES ('737', '其他', '722');
INSERT INTO `data_brand` VALUES ('738', '其他', '723');
INSERT INTO `data_brand` VALUES ('739', '其他', '724');
INSERT INTO `data_brand` VALUES ('740', '其他', '725');
INSERT INTO `data_brand` VALUES ('741', '其他', '726');
INSERT INTO `data_brand` VALUES ('742', '其他', '727');
INSERT INTO `data_brand` VALUES ('743', '其他', '728');
INSERT INTO `data_brand` VALUES ('744', '其他', '729');
INSERT INTO `data_brand` VALUES ('745', '其他', '730');
INSERT INTO `data_brand` VALUES ('746', '其他', '731');
INSERT INTO `data_brand` VALUES ('747', '其他', '732');
INSERT INTO `data_brand` VALUES ('748', '其他', '733');
INSERT INTO `data_brand` VALUES ('749', '其他', '734');
INSERT INTO `data_brand` VALUES ('750', '其他', '735');
INSERT INTO `data_brand` VALUES ('751', '其他', '736');
INSERT INTO `data_brand` VALUES ('752', '其他', '737');
INSERT INTO `data_brand` VALUES ('753', '其他', '738');
INSERT INTO `data_brand` VALUES ('754', '其他', '739');
INSERT INTO `data_brand` VALUES ('755', '其他', '740');
INSERT INTO `data_brand` VALUES ('756', '其他', '741');
INSERT INTO `data_brand` VALUES ('757', '其他', '742');
INSERT INTO `data_brand` VALUES ('758', '其他', '743');
INSERT INTO `data_brand` VALUES ('759', '其他', '744');
INSERT INTO `data_brand` VALUES ('760', '其他', '745');
INSERT INTO `data_brand` VALUES ('761', '其他', '746');
INSERT INTO `data_brand` VALUES ('762', '其他', '747');
INSERT INTO `data_brand` VALUES ('763', '其他', '748');
INSERT INTO `data_brand` VALUES ('764', '其他', '749');
INSERT INTO `data_brand` VALUES ('765', '其他', '750');
INSERT INTO `data_brand` VALUES ('766', '其他', '751');
INSERT INTO `data_brand` VALUES ('767', '其他', '752');
INSERT INTO `data_brand` VALUES ('768', '其他', '753');
INSERT INTO `data_brand` VALUES ('769', '其他', '754');
INSERT INTO `data_brand` VALUES ('770', '其他', '755');
INSERT INTO `data_brand` VALUES ('771', '其他', '756');
INSERT INTO `data_brand` VALUES ('772', '其他', '757');
INSERT INTO `data_brand` VALUES ('773', '其他', '758');
INSERT INTO `data_brand` VALUES ('774', '其他', '759');
INSERT INTO `data_brand` VALUES ('775', '其他', '760');
INSERT INTO `data_brand` VALUES ('776', '其他', '761');
INSERT INTO `data_brand` VALUES ('777', '其他', '762');
INSERT INTO `data_brand` VALUES ('778', '其他', '763');
INSERT INTO `data_brand` VALUES ('779', '其他', '764');
INSERT INTO `data_brand` VALUES ('780', '其他', '765');
INSERT INTO `data_brand` VALUES ('781', '其他', '477');
INSERT INTO `data_brand` VALUES ('782', '其他', '766');
INSERT INTO `data_brand` VALUES ('783', '其他', '767');
INSERT INTO `data_brand` VALUES ('784', '其他', '768');
INSERT INTO `data_brand` VALUES ('785', '其他', '769');
INSERT INTO `data_brand` VALUES ('786', '其他', '770');
INSERT INTO `data_brand` VALUES ('787', '其他', '771');
INSERT INTO `data_brand` VALUES ('788', '其他', '772');
INSERT INTO `data_brand` VALUES ('789', '其他', '773');
INSERT INTO `data_brand` VALUES ('790', '其他', '774');
INSERT INTO `data_brand` VALUES ('791', '其他', '775');
INSERT INTO `data_brand` VALUES ('792', '其他', '776');
INSERT INTO `data_brand` VALUES ('793', '其他', '777');
INSERT INTO `data_brand` VALUES ('794', '其他', '778');
INSERT INTO `data_brand` VALUES ('795', '其他', '779');
INSERT INTO `data_brand` VALUES ('796', '其他', '780');
INSERT INTO `data_brand` VALUES ('797', '其他', '781');
INSERT INTO `data_brand` VALUES ('798', '其他', '782');
INSERT INTO `data_brand` VALUES ('799', '其他', '783');
INSERT INTO `data_brand` VALUES ('800', '其他', '784');
INSERT INTO `data_brand` VALUES ('801', '其他', '785');
INSERT INTO `data_brand` VALUES ('802', '其他', '786');
INSERT INTO `data_brand` VALUES ('803', '其他', '787');
INSERT INTO `data_brand` VALUES ('804', '其他', '788');
INSERT INTO `data_brand` VALUES ('805', '其他', '789');
INSERT INTO `data_brand` VALUES ('806', '其他', '790');
INSERT INTO `data_brand` VALUES ('807', '其他', '791');
INSERT INTO `data_brand` VALUES ('808', '其他', '792');
INSERT INTO `data_brand` VALUES ('809', '其他', '793');
INSERT INTO `data_brand` VALUES ('810', '其他', '794');
INSERT INTO `data_brand` VALUES ('811', '其他', '795');
INSERT INTO `data_brand` VALUES ('812', '其他', '796');
INSERT INTO `data_brand` VALUES ('813', '其他', '797');
INSERT INTO `data_brand` VALUES ('814', '其他', '798');
INSERT INTO `data_brand` VALUES ('815', '其他', '799');
INSERT INTO `data_brand` VALUES ('816', '其他', '800');
INSERT INTO `data_brand` VALUES ('817', '其他', '801');
INSERT INTO `data_brand` VALUES ('818', '其他', '802');
INSERT INTO `data_brand` VALUES ('819', '其他', '803');
INSERT INTO `data_brand` VALUES ('820', '其他', '804');
INSERT INTO `data_brand` VALUES ('821', '其他', '805');
INSERT INTO `data_brand` VALUES ('822', '其他', '806');
INSERT INTO `data_brand` VALUES ('823', '其他', '807');
INSERT INTO `data_brand` VALUES ('824', '其他', '808');
INSERT INTO `data_brand` VALUES ('825', '其他', '809');
INSERT INTO `data_brand` VALUES ('826', '其他', '810');
INSERT INTO `data_brand` VALUES ('827', '其他', '811');
INSERT INTO `data_brand` VALUES ('828', '其他', '812');
INSERT INTO `data_brand` VALUES ('829', '其他', '813');
INSERT INTO `data_brand` VALUES ('830', '其他', '814');
INSERT INTO `data_brand` VALUES ('831', '其他', '815');
INSERT INTO `data_brand` VALUES ('832', '其他', '816');
INSERT INTO `data_brand` VALUES ('833', '其他', '817');
INSERT INTO `data_brand` VALUES ('834', '其他', '818');
INSERT INTO `data_brand` VALUES ('835', '其他', '819');
INSERT INTO `data_brand` VALUES ('836', '其他', '820');
INSERT INTO `data_brand` VALUES ('837', '其他', '821');
INSERT INTO `data_brand` VALUES ('838', '其他', '822');
INSERT INTO `data_brand` VALUES ('839', '其他', '823');
INSERT INTO `data_brand` VALUES ('840', '其他', '824');
INSERT INTO `data_brand` VALUES ('841', '大宗', '825');

-- ----------------------------
-- Table structure for `data_brand_format`
-- ----------------------------
DROP TABLE IF EXISTS `data_brand_format`;
CREATE TABLE `data_brand_format` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `money` double NOT NULL DEFAULT '0',
  `brand_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=851 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of data_brand_format
-- ----------------------------
INSERT INTO `data_brand_format` VALUES ('428', '1.8T', '288900', '425');
INSERT INTO `data_brand_format` VALUES ('429', '其他', '0', '426');
INSERT INTO `data_brand_format` VALUES ('430', '其他', '0', '427');
INSERT INTO `data_brand_format` VALUES ('431', '其他', '0', '428');
INSERT INTO `data_brand_format` VALUES ('432', '其他', '0', '429');
INSERT INTO `data_brand_format` VALUES ('433', '其他', '0', '430');
INSERT INTO `data_brand_format` VALUES ('434', '其他', '0', '431');
INSERT INTO `data_brand_format` VALUES ('435', '其他', '0', '432');
INSERT INTO `data_brand_format` VALUES ('436', '其他', '0', '433');
INSERT INTO `data_brand_format` VALUES ('437', '其他', '0', '434');
INSERT INTO `data_brand_format` VALUES ('438', 'DKQ-A16D', '2000', '435');
INSERT INTO `data_brand_format` VALUES ('439', '1026BP', '4000', '436');
INSERT INTO `data_brand_format` VALUES ('440', '1035BP', '4000', '437');
INSERT INTO `data_brand_format` VALUES ('441', 'MRP-1014-PC', '75000', '438');
INSERT INTO `data_brand_format` VALUES ('442', 'MDF-U73V', '100000', '439');
INSERT INTO `data_brand_format` VALUES ('443', '8470p', '8020', '440');
INSERT INTO `data_brand_format` VALUES ('444', '6380mt', '5000', '441');
INSERT INTO `data_brand_format` VALUES ('445', 'LCD-40DS4', '3299', '442');
INSERT INTO `data_brand_format` VALUES ('446', '其他', '0', '443');
INSERT INTO `data_brand_format` VALUES ('447', 'LQ-80kf', '1700', '444');
INSERT INTO `data_brand_format` VALUES ('448', 'IOL Master 5.5', '400000', '445');
INSERT INTO `data_brand_format` VALUES ('449', '8534', '85000', '446');
INSERT INTO `data_brand_format` VALUES ('450', '8533', '85000', '446');
INSERT INTO `data_brand_format` VALUES ('451', 'GL8', '249300', '447');
INSERT INTO `data_brand_format` VALUES ('452', 'NX1000', '2995', '443');
INSERT INTO `data_brand_format` VALUES ('453', 'SF-651P', '1890', '448');
INSERT INTO `data_brand_format` VALUES ('454', 'P355D', '2500', '449');
INSERT INTO `data_brand_format` VALUES ('455', 'CP305d', '4795', '450');
INSERT INTO `data_brand_format` VALUES ('456', 'LQ-690K', '2480', '451');
INSERT INTO `data_brand_format` VALUES ('457', '其他', '0', '452');
INSERT INTO `data_brand_format` VALUES ('458', 'PLQ-20Q', '3500', '453');
INSERT INTO `data_brand_format` VALUES ('459', 'UA46ES6100J', '7099', '454');
INSERT INTO `data_brand_format` VALUES ('460', '其他', '0', '455');
INSERT INTO `data_brand_format` VALUES ('461', '一批', '5849', '456');
INSERT INTO `data_brand_format` VALUES ('462', '5330M', '9999', '457');
INSERT INTO `data_brand_format` VALUES ('463', '6560B', '9999', '457');
INSERT INTO `data_brand_format` VALUES ('464', 'IBS', '2000', '458');
INSERT INTO `data_brand_format` VALUES ('465', '6280MT', '4200', '459');
INSERT INTO `data_brand_format` VALUES ('466', '其他', '0', '460');
INSERT INTO `data_brand_format` VALUES ('467', 'MF4330DG', '1998', '461');
INSERT INTO `data_brand_format` VALUES ('468', 'ZXR10', '2348', '462');
INSERT INTO `data_brand_format` VALUES ('469', 'TEST0512', '4000', '463');
INSERT INTO `data_brand_format` VALUES ('470', 'GDYS-101SZ2', '3000', '464');
INSERT INTO `data_brand_format` VALUES ('471', 'QDF-6', '2000', '465');
INSERT INTO `data_brand_format` VALUES ('472', 'PC-II', '4000', '466');
INSERT INTO `data_brand_format` VALUES ('473', 'Qicktake30', '25000', '467');
INSERT INTO `data_brand_format` VALUES ('474', 'ZC-Q', '4000', '468');
INSERT INTO `data_brand_format` VALUES ('475', 'X1', '290000', '469');
INSERT INTO `data_brand_format` VALUES ('476', '1000-2A-1-150', '21975', '470');
INSERT INTO `data_brand_format` VALUES ('477', 'MDF-U73V', '100000', '471');
INSERT INTO `data_brand_format` VALUES ('478', 'KK22F66T1', '3798', '472');
INSERT INTO `data_brand_format` VALUES ('479', 'BA210LED', '8000', '473');
INSERT INTO `data_brand_format` VALUES ('480', 'SMZ161', '7000', '474');
INSERT INTO `data_brand_format` VALUES ('481', 'Beeblot', '300000', '475');
INSERT INTO `data_brand_format` VALUES ('482', '418', '2950', '476');
INSERT INTO `data_brand_format` VALUES ('483', 'LG-690K', '2500', '451');
INSERT INTO `data_brand_format` VALUES ('484', 'EW130', '10000', '477');
INSERT INTO `data_brand_format` VALUES ('485', 'I909', '2480', '478');
INSERT INTO `data_brand_format` VALUES ('486', 'I909', '2480', '479');
INSERT INTO `data_brand_format` VALUES ('487', 'JJ885', '1980', '480');
INSERT INTO `data_brand_format` VALUES ('488', 'SX-11RM', '2599', '481');
INSERT INTO `data_brand_format` VALUES ('489', '202-0', '1730', '482');
INSERT INTO `data_brand_format` VALUES ('490', 'TD4Z-WS', '3900', '483');
INSERT INTO `data_brand_format` VALUES ('491', 'ZC-Q', '4000', '484');
INSERT INTO `data_brand_format` VALUES ('492', '军需88型', '3400', '485');
INSERT INTO `data_brand_format` VALUES ('493', '6450B', '8000', '440');
INSERT INTO `data_brand_format` VALUES ('494', 'MP4000B', '25000', '486');
INSERT INTO `data_brand_format` VALUES ('495', 'DX4446CP', '26000', '487');
INSERT INTO `data_brand_format` VALUES ('496', 'CX21', '7800', '488');
INSERT INTO `data_brand_format` VALUES ('497', '其他', '0', '489');
INSERT INTO `data_brand_format` VALUES ('498', '其他', '0', '490');
INSERT INTO `data_brand_format` VALUES ('499', '其他', '0', '491');
INSERT INTO `data_brand_format` VALUES ('500', '其他', '0', '492');
INSERT INTO `data_brand_format` VALUES ('501', '其他', '0', '493');
INSERT INTO `data_brand_format` VALUES ('502', '其他', '0', '494');
INSERT INTO `data_brand_format` VALUES ('503', '其他', '0', '495');
INSERT INTO `data_brand_format` VALUES ('504', '其他', '0', '496');
INSERT INTO `data_brand_format` VALUES ('505', '其他', '0', '497');
INSERT INTO `data_brand_format` VALUES ('506', '其他', '0', '498');
INSERT INTO `data_brand_format` VALUES ('507', '其他', '0', '499');
INSERT INTO `data_brand_format` VALUES ('508', '其他', '0', '500');
INSERT INTO `data_brand_format` VALUES ('509', '其他', '0', '501');
INSERT INTO `data_brand_format` VALUES ('510', '其他', '0', '502');
INSERT INTO `data_brand_format` VALUES ('511', '其他', '0', '503');
INSERT INTO `data_brand_format` VALUES ('512', '其他', '0', '504');
INSERT INTO `data_brand_format` VALUES ('513', '其他', '0', '505');
INSERT INTO `data_brand_format` VALUES ('514', '其他', '0', '506');
INSERT INTO `data_brand_format` VALUES ('515', '其他', '0', '507');
INSERT INTO `data_brand_format` VALUES ('516', '其他', '0', '508');
INSERT INTO `data_brand_format` VALUES ('517', '其他', '0', '509');
INSERT INTO `data_brand_format` VALUES ('518', '其他', '0', '510');
INSERT INTO `data_brand_format` VALUES ('519', '其他', '0', '511');
INSERT INTO `data_brand_format` VALUES ('520', '其他', '0', '512');
INSERT INTO `data_brand_format` VALUES ('521', 'JX5046XJHDLA-H', '348287', '513');
INSERT INTO `data_brand_format` VALUES ('522', 'JX6545C-M', '207019', '514');
INSERT INTO `data_brand_format` VALUES ('523', '1.6', '68900', '515');
INSERT INTO `data_brand_format` VALUES ('524', 'sh6491', '177376', '516');
INSERT INTO `data_brand_format` VALUES ('525', 'NJ6596AEF', '261004', '517');
INSERT INTO `data_brand_format` VALUES ('526', '其他', '0', '518');
INSERT INTO `data_brand_format` VALUES ('527', '其他', '0', '519');
INSERT INTO `data_brand_format` VALUES ('528', '其他', '0', '520');
INSERT INTO `data_brand_format` VALUES ('529', '其他', '0', '521');
INSERT INTO `data_brand_format` VALUES ('530', '其他', '0', '522');
INSERT INTO `data_brand_format` VALUES ('531', '其他', '0', '523');
INSERT INTO `data_brand_format` VALUES ('532', '其他', '0', '524');
INSERT INTO `data_brand_format` VALUES ('533', '其他', '0', '525');
INSERT INTO `data_brand_format` VALUES ('534', '其他', '0', '526');
INSERT INTO `data_brand_format` VALUES ('535', '其他', '0', '527');
INSERT INTO `data_brand_format` VALUES ('536', '其他', '0', '528');
INSERT INTO `data_brand_format` VALUES ('537', '其他', '0', '529');
INSERT INTO `data_brand_format` VALUES ('538', '其他', '0', '530');
INSERT INTO `data_brand_format` VALUES ('539', '其他', '0', '531');
INSERT INTO `data_brand_format` VALUES ('540', '其他', '0', '532');
INSERT INTO `data_brand_format` VALUES ('541', '其他', '0', '533');
INSERT INTO `data_brand_format` VALUES ('542', '其他', '0', '534');
INSERT INTO `data_brand_format` VALUES ('543', '其他', '0', '535');
INSERT INTO `data_brand_format` VALUES ('544', '其他', '0', '536');
INSERT INTO `data_brand_format` VALUES ('545', '其他', '0', '537');
INSERT INTO `data_brand_format` VALUES ('546', '其他', '0', '538');
INSERT INTO `data_brand_format` VALUES ('547', '其他', '0', '539');
INSERT INTO `data_brand_format` VALUES ('548', '其他', '0', '540');
INSERT INTO `data_brand_format` VALUES ('549', '其他', '0', '541');
INSERT INTO `data_brand_format` VALUES ('550', '其他', '0', '542');
INSERT INTO `data_brand_format` VALUES ('551', '其他', '0', '543');
INSERT INTO `data_brand_format` VALUES ('552', '其他', '0', '544');
INSERT INTO `data_brand_format` VALUES ('553', '其他', '0', '545');
INSERT INTO `data_brand_format` VALUES ('554', '其他', '0', '546');
INSERT INTO `data_brand_format` VALUES ('555', '其他', '0', '547');
INSERT INTO `data_brand_format` VALUES ('556', '其他', '0', '548');
INSERT INTO `data_brand_format` VALUES ('557', '其他', '0', '549');
INSERT INTO `data_brand_format` VALUES ('558', '其他', '0', '550');
INSERT INTO `data_brand_format` VALUES ('559', '其他', '0', '551');
INSERT INTO `data_brand_format` VALUES ('560', '其他', '0', '552');
INSERT INTO `data_brand_format` VALUES ('561', '其他', '0', '553');
INSERT INTO `data_brand_format` VALUES ('562', '其他', '0', '554');
INSERT INTO `data_brand_format` VALUES ('563', '其他', '0', '555');
INSERT INTO `data_brand_format` VALUES ('564', '其他', '0', '556');
INSERT INTO `data_brand_format` VALUES ('565', '其他', '0', '557');
INSERT INTO `data_brand_format` VALUES ('566', '其他', '0', '558');
INSERT INTO `data_brand_format` VALUES ('567', '其他', '0', '559');
INSERT INTO `data_brand_format` VALUES ('568', '其他', '0', '560');
INSERT INTO `data_brand_format` VALUES ('569', '其他', '0', '561');
INSERT INTO `data_brand_format` VALUES ('570', '其他', '0', '562');
INSERT INTO `data_brand_format` VALUES ('571', '其他', '0', '563');
INSERT INTO `data_brand_format` VALUES ('572', '其他', '0', '564');
INSERT INTO `data_brand_format` VALUES ('573', '其他', '0', '565');
INSERT INTO `data_brand_format` VALUES ('574', '其他', '0', '566');
INSERT INTO `data_brand_format` VALUES ('575', '其他', '0', '567');
INSERT INTO `data_brand_format` VALUES ('576', '其他', '0', '568');
INSERT INTO `data_brand_format` VALUES ('577', '其他', '0', '569');
INSERT INTO `data_brand_format` VALUES ('578', '其他', '0', '570');
INSERT INTO `data_brand_format` VALUES ('579', '其他', '0', '571');
INSERT INTO `data_brand_format` VALUES ('580', '其他', '0', '572');
INSERT INTO `data_brand_format` VALUES ('581', '其他', '0', '573');
INSERT INTO `data_brand_format` VALUES ('582', '其他', '0', '574');
INSERT INTO `data_brand_format` VALUES ('583', '其他', '0', '575');
INSERT INTO `data_brand_format` VALUES ('584', '其他', '0', '576');
INSERT INTO `data_brand_format` VALUES ('585', '其他', '0', '577');
INSERT INTO `data_brand_format` VALUES ('586', '其他', '0', '578');
INSERT INTO `data_brand_format` VALUES ('587', '其他', '0', '579');
INSERT INTO `data_brand_format` VALUES ('588', '其他', '0', '580');
INSERT INTO `data_brand_format` VALUES ('589', '其他', '0', '581');
INSERT INTO `data_brand_format` VALUES ('590', '其他', '0', '582');
INSERT INTO `data_brand_format` VALUES ('591', '其他', '0', '583');
INSERT INTO `data_brand_format` VALUES ('592', '其他', '0', '584');
INSERT INTO `data_brand_format` VALUES ('593', '其他', '0', '585');
INSERT INTO `data_brand_format` VALUES ('594', '其他', '0', '586');
INSERT INTO `data_brand_format` VALUES ('595', '其他', '0', '587');
INSERT INTO `data_brand_format` VALUES ('596', '其他', '0', '588');
INSERT INTO `data_brand_format` VALUES ('597', '其他', '0', '589');
INSERT INTO `data_brand_format` VALUES ('598', '其他', '0', '590');
INSERT INTO `data_brand_format` VALUES ('599', '其他', '0', '591');
INSERT INTO `data_brand_format` VALUES ('600', '其他', '0', '592');
INSERT INTO `data_brand_format` VALUES ('601', '其他', '0', '593');
INSERT INTO `data_brand_format` VALUES ('602', '其他', '0', '594');
INSERT INTO `data_brand_format` VALUES ('603', '其他', '0', '595');
INSERT INTO `data_brand_format` VALUES ('604', '其他', '0', '596');
INSERT INTO `data_brand_format` VALUES ('605', '其他', '0', '597');
INSERT INTO `data_brand_format` VALUES ('606', '其他', '0', '598');
INSERT INTO `data_brand_format` VALUES ('607', '其他', '0', '599');
INSERT INTO `data_brand_format` VALUES ('608', '其他', '0', '600');
INSERT INTO `data_brand_format` VALUES ('609', '其他', '0', '601');
INSERT INTO `data_brand_format` VALUES ('610', '其他', '0', '602');
INSERT INTO `data_brand_format` VALUES ('611', '其他', '0', '603');
INSERT INTO `data_brand_format` VALUES ('612', '其他', '0', '604');
INSERT INTO `data_brand_format` VALUES ('613', '其他', '0', '605');
INSERT INTO `data_brand_format` VALUES ('614', '其他', '0', '606');
INSERT INTO `data_brand_format` VALUES ('615', '其他', '0', '607');
INSERT INTO `data_brand_format` VALUES ('616', '其他', '0', '608');
INSERT INTO `data_brand_format` VALUES ('617', '其他', '0', '609');
INSERT INTO `data_brand_format` VALUES ('618', '其他', '0', '610');
INSERT INTO `data_brand_format` VALUES ('619', '其他', '0', '611');
INSERT INTO `data_brand_format` VALUES ('620', '其他', '0', '612');
INSERT INTO `data_brand_format` VALUES ('621', '其他', '0', '613');
INSERT INTO `data_brand_format` VALUES ('622', '其他', '0', '614');
INSERT INTO `data_brand_format` VALUES ('623', '其他', '0', '615');
INSERT INTO `data_brand_format` VALUES ('624', '其他', '0', '616');
INSERT INTO `data_brand_format` VALUES ('625', '其他', '0', '617');
INSERT INTO `data_brand_format` VALUES ('626', '其他', '0', '618');
INSERT INTO `data_brand_format` VALUES ('627', '其他', '0', '619');
INSERT INTO `data_brand_format` VALUES ('628', '其他', '0', '620');
INSERT INTO `data_brand_format` VALUES ('629', '其他', '0', '621');
INSERT INTO `data_brand_format` VALUES ('630', '其他', '0', '622');
INSERT INTO `data_brand_format` VALUES ('631', '其他', '0', '623');
INSERT INTO `data_brand_format` VALUES ('632', '其他', '0', '624');
INSERT INTO `data_brand_format` VALUES ('633', '其他', '0', '625');
INSERT INTO `data_brand_format` VALUES ('634', '其他', '0', '626');
INSERT INTO `data_brand_format` VALUES ('635', '其他', '0', '627');
INSERT INTO `data_brand_format` VALUES ('636', '其他', '0', '628');
INSERT INTO `data_brand_format` VALUES ('637', '其他', '0', '629');
INSERT INTO `data_brand_format` VALUES ('638', '其他', '0', '630');
INSERT INTO `data_brand_format` VALUES ('639', '其他', '0', '631');
INSERT INTO `data_brand_format` VALUES ('640', '其他', '0', '632');
INSERT INTO `data_brand_format` VALUES ('641', '其他', '0', '633');
INSERT INTO `data_brand_format` VALUES ('642', '其他', '0', '634');
INSERT INTO `data_brand_format` VALUES ('643', '其他', '0', '635');
INSERT INTO `data_brand_format` VALUES ('644', '其他', '0', '636');
INSERT INTO `data_brand_format` VALUES ('645', '其他', '0', '637');
INSERT INTO `data_brand_format` VALUES ('646', '其他', '0', '638');
INSERT INTO `data_brand_format` VALUES ('647', '其他', '0', '639');
INSERT INTO `data_brand_format` VALUES ('648', '其他', '0', '640');
INSERT INTO `data_brand_format` VALUES ('649', '其他', '0', '641');
INSERT INTO `data_brand_format` VALUES ('650', '其他', '0', '642');
INSERT INTO `data_brand_format` VALUES ('651', '其他', '0', '643');
INSERT INTO `data_brand_format` VALUES ('652', '其他', '0', '644');
INSERT INTO `data_brand_format` VALUES ('653', '其他', '0', '645');
INSERT INTO `data_brand_format` VALUES ('654', '其他', '0', '646');
INSERT INTO `data_brand_format` VALUES ('655', '其他', '0', '647');
INSERT INTO `data_brand_format` VALUES ('656', '其他', '0', '648');
INSERT INTO `data_brand_format` VALUES ('657', '其他', '0', '649');
INSERT INTO `data_brand_format` VALUES ('658', '其他', '0', '650');
INSERT INTO `data_brand_format` VALUES ('659', '其他', '0', '651');
INSERT INTO `data_brand_format` VALUES ('660', '其他', '0', '652');
INSERT INTO `data_brand_format` VALUES ('661', '其他', '0', '653');
INSERT INTO `data_brand_format` VALUES ('662', '其他', '0', '654');
INSERT INTO `data_brand_format` VALUES ('663', '其他', '0', '655');
INSERT INTO `data_brand_format` VALUES ('664', '其他', '0', '656');
INSERT INTO `data_brand_format` VALUES ('665', '其他', '0', '657');
INSERT INTO `data_brand_format` VALUES ('666', '其他', '0', '658');
INSERT INTO `data_brand_format` VALUES ('667', '其他', '0', '659');
INSERT INTO `data_brand_format` VALUES ('668', '其他', '0', '660');
INSERT INTO `data_brand_format` VALUES ('669', '其他', '0', '661');
INSERT INTO `data_brand_format` VALUES ('670', '其他', '0', '662');
INSERT INTO `data_brand_format` VALUES ('671', '其他', '0', '663');
INSERT INTO `data_brand_format` VALUES ('672', '其他', '0', '664');
INSERT INTO `data_brand_format` VALUES ('673', '其他', '0', '665');
INSERT INTO `data_brand_format` VALUES ('674', '其他', '0', '666');
INSERT INTO `data_brand_format` VALUES ('675', '其他', '0', '667');
INSERT INTO `data_brand_format` VALUES ('676', '其他', '0', '668');
INSERT INTO `data_brand_format` VALUES ('677', '其他', '0', '669');
INSERT INTO `data_brand_format` VALUES ('678', '其他', '0', '670');
INSERT INTO `data_brand_format` VALUES ('679', '其他', '0', '671');
INSERT INTO `data_brand_format` VALUES ('680', '其他', '0', '672');
INSERT INTO `data_brand_format` VALUES ('681', '其他', '0', '673');
INSERT INTO `data_brand_format` VALUES ('682', '其他', '0', '674');
INSERT INTO `data_brand_format` VALUES ('683', '其他', '0', '675');
INSERT INTO `data_brand_format` VALUES ('684', '其他', '0', '676');
INSERT INTO `data_brand_format` VALUES ('685', '其他', '0', '677');
INSERT INTO `data_brand_format` VALUES ('686', '其他', '0', '678');
INSERT INTO `data_brand_format` VALUES ('687', '其他', '0', '679');
INSERT INTO `data_brand_format` VALUES ('688', '其他', '0', '680');
INSERT INTO `data_brand_format` VALUES ('689', '其他', '0', '681');
INSERT INTO `data_brand_format` VALUES ('690', '其他', '0', '682');
INSERT INTO `data_brand_format` VALUES ('691', '其他', '0', '683');
INSERT INTO `data_brand_format` VALUES ('692', '其他', '0', '684');
INSERT INTO `data_brand_format` VALUES ('693', '其他', '0', '685');
INSERT INTO `data_brand_format` VALUES ('694', '其他', '0', '686');
INSERT INTO `data_brand_format` VALUES ('695', '其他', '0', '687');
INSERT INTO `data_brand_format` VALUES ('696', '其他', '0', '688');
INSERT INTO `data_brand_format` VALUES ('697', '其他', '0', '689');
INSERT INTO `data_brand_format` VALUES ('698', '其他', '0', '690');
INSERT INTO `data_brand_format` VALUES ('699', '其他', '0', '691');
INSERT INTO `data_brand_format` VALUES ('700', '其他', '0', '692');
INSERT INTO `data_brand_format` VALUES ('701', '其他', '0', '693');
INSERT INTO `data_brand_format` VALUES ('702', '其他', '0', '694');
INSERT INTO `data_brand_format` VALUES ('703', '其他', '0', '695');
INSERT INTO `data_brand_format` VALUES ('704', '其他', '0', '696');
INSERT INTO `data_brand_format` VALUES ('705', '其他', '0', '697');
INSERT INTO `data_brand_format` VALUES ('706', '其他', '0', '698');
INSERT INTO `data_brand_format` VALUES ('707', '其他', '0', '699');
INSERT INTO `data_brand_format` VALUES ('708', '其他', '0', '700');
INSERT INTO `data_brand_format` VALUES ('709', '其他', '0', '701');
INSERT INTO `data_brand_format` VALUES ('710', '其他', '0', '702');
INSERT INTO `data_brand_format` VALUES ('711', '其他', '0', '703');
INSERT INTO `data_brand_format` VALUES ('712', '其他', '0', '704');
INSERT INTO `data_brand_format` VALUES ('713', '其他', '0', '705');
INSERT INTO `data_brand_format` VALUES ('714', '其他', '0', '706');
INSERT INTO `data_brand_format` VALUES ('715', '其他', '0', '707');
INSERT INTO `data_brand_format` VALUES ('716', '其他', '0', '708');
INSERT INTO `data_brand_format` VALUES ('717', '其他', '0', '709');
INSERT INTO `data_brand_format` VALUES ('718', '其他', '0', '710');
INSERT INTO `data_brand_format` VALUES ('719', '其他', '0', '711');
INSERT INTO `data_brand_format` VALUES ('720', '其他', '0', '712');
INSERT INTO `data_brand_format` VALUES ('721', '其他', '0', '713');
INSERT INTO `data_brand_format` VALUES ('722', '其他', '0', '714');
INSERT INTO `data_brand_format` VALUES ('723', '其他', '0', '715');
INSERT INTO `data_brand_format` VALUES ('724', '其他', '0', '716');
INSERT INTO `data_brand_format` VALUES ('725', '其他', '0', '717');
INSERT INTO `data_brand_format` VALUES ('726', '其他', '0', '718');
INSERT INTO `data_brand_format` VALUES ('727', '其他', '0', '719');
INSERT INTO `data_brand_format` VALUES ('728', '其他', '0', '720');
INSERT INTO `data_brand_format` VALUES ('729', '其他', '0', '721');
INSERT INTO `data_brand_format` VALUES ('730', '其他', '0', '722');
INSERT INTO `data_brand_format` VALUES ('731', '其他', '0', '723');
INSERT INTO `data_brand_format` VALUES ('732', '其他', '0', '724');
INSERT INTO `data_brand_format` VALUES ('733', '其他', '0', '725');
INSERT INTO `data_brand_format` VALUES ('734', '其他', '0', '726');
INSERT INTO `data_brand_format` VALUES ('735', '其他', '0', '727');
INSERT INTO `data_brand_format` VALUES ('736', '其他', '0', '728');
INSERT INTO `data_brand_format` VALUES ('737', '其他', '0', '729');
INSERT INTO `data_brand_format` VALUES ('738', '其他', '0', '730');
INSERT INTO `data_brand_format` VALUES ('739', '其他', '0', '731');
INSERT INTO `data_brand_format` VALUES ('740', '其他', '0', '732');
INSERT INTO `data_brand_format` VALUES ('741', '其他', '0', '733');
INSERT INTO `data_brand_format` VALUES ('742', '其他', '0', '734');
INSERT INTO `data_brand_format` VALUES ('743', '其他', '0', '735');
INSERT INTO `data_brand_format` VALUES ('744', '其他', '0', '736');
INSERT INTO `data_brand_format` VALUES ('745', '其他', '0', '737');
INSERT INTO `data_brand_format` VALUES ('746', '其他', '0', '738');
INSERT INTO `data_brand_format` VALUES ('747', '其他', '0', '739');
INSERT INTO `data_brand_format` VALUES ('748', '其他', '0', '740');
INSERT INTO `data_brand_format` VALUES ('749', '其他', '0', '741');
INSERT INTO `data_brand_format` VALUES ('750', '其他', '0', '742');
INSERT INTO `data_brand_format` VALUES ('751', '其他', '0', '743');
INSERT INTO `data_brand_format` VALUES ('752', '其他', '0', '744');
INSERT INTO `data_brand_format` VALUES ('753', '其他', '0', '745');
INSERT INTO `data_brand_format` VALUES ('754', '其他', '0', '746');
INSERT INTO `data_brand_format` VALUES ('755', '其他', '0', '747');
INSERT INTO `data_brand_format` VALUES ('756', '其他', '0', '748');
INSERT INTO `data_brand_format` VALUES ('757', '其他', '0', '749');
INSERT INTO `data_brand_format` VALUES ('758', '其他', '0', '750');
INSERT INTO `data_brand_format` VALUES ('759', '其他', '0', '751');
INSERT INTO `data_brand_format` VALUES ('760', '其他', '0', '752');
INSERT INTO `data_brand_format` VALUES ('761', '其他', '0', '753');
INSERT INTO `data_brand_format` VALUES ('762', '其他', '0', '754');
INSERT INTO `data_brand_format` VALUES ('763', '其他', '0', '755');
INSERT INTO `data_brand_format` VALUES ('764', '其他', '0', '756');
INSERT INTO `data_brand_format` VALUES ('765', '其他', '0', '757');
INSERT INTO `data_brand_format` VALUES ('766', '其他', '0', '758');
INSERT INTO `data_brand_format` VALUES ('767', '其他', '0', '759');
INSERT INTO `data_brand_format` VALUES ('768', '其他', '0', '760');
INSERT INTO `data_brand_format` VALUES ('769', '其他', '0', '761');
INSERT INTO `data_brand_format` VALUES ('770', '其他', '0', '762');
INSERT INTO `data_brand_format` VALUES ('771', '其他', '0', '763');
INSERT INTO `data_brand_format` VALUES ('772', '其他', '0', '764');
INSERT INTO `data_brand_format` VALUES ('773', '其他', '0', '765');
INSERT INTO `data_brand_format` VALUES ('774', '其他', '0', '766');
INSERT INTO `data_brand_format` VALUES ('775', '其他', '0', '767');
INSERT INTO `data_brand_format` VALUES ('776', '其他', '0', '768');
INSERT INTO `data_brand_format` VALUES ('777', '其他', '0', '769');
INSERT INTO `data_brand_format` VALUES ('778', '其他', '0', '770');
INSERT INTO `data_brand_format` VALUES ('779', '其他', '0', '771');
INSERT INTO `data_brand_format` VALUES ('780', '其他', '0', '772');
INSERT INTO `data_brand_format` VALUES ('781', '其他', '0', '773');
INSERT INTO `data_brand_format` VALUES ('782', '其他', '0', '774');
INSERT INTO `data_brand_format` VALUES ('783', '其他', '0', '775');
INSERT INTO `data_brand_format` VALUES ('784', '其他', '0', '776');
INSERT INTO `data_brand_format` VALUES ('785', '其他', '0', '777');
INSERT INTO `data_brand_format` VALUES ('786', '其他', '0', '778');
INSERT INTO `data_brand_format` VALUES ('787', '其他', '0', '779');
INSERT INTO `data_brand_format` VALUES ('788', '其他', '0', '780');
INSERT INTO `data_brand_format` VALUES ('789', '其他', '0', '781');
INSERT INTO `data_brand_format` VALUES ('790', '其他', '0', '782');
INSERT INTO `data_brand_format` VALUES ('791', '其他', '0', '783');
INSERT INTO `data_brand_format` VALUES ('792', '其他', '0', '784');
INSERT INTO `data_brand_format` VALUES ('793', '其他', '0', '785');
INSERT INTO `data_brand_format` VALUES ('794', '其他', '0', '786');
INSERT INTO `data_brand_format` VALUES ('795', '其他', '0', '787');
INSERT INTO `data_brand_format` VALUES ('796', '其他', '0', '788');
INSERT INTO `data_brand_format` VALUES ('797', '其他', '0', '789');
INSERT INTO `data_brand_format` VALUES ('798', '其他', '0', '790');
INSERT INTO `data_brand_format` VALUES ('799', '其他', '0', '791');
INSERT INTO `data_brand_format` VALUES ('800', '其他', '0', '792');
INSERT INTO `data_brand_format` VALUES ('801', '其他', '0', '793');
INSERT INTO `data_brand_format` VALUES ('802', '其他', '0', '794');
INSERT INTO `data_brand_format` VALUES ('803', '其他', '0', '795');
INSERT INTO `data_brand_format` VALUES ('804', '其他', '0', '796');
INSERT INTO `data_brand_format` VALUES ('805', '其他', '0', '797');
INSERT INTO `data_brand_format` VALUES ('806', '其他', '0', '798');
INSERT INTO `data_brand_format` VALUES ('807', '其他', '0', '799');
INSERT INTO `data_brand_format` VALUES ('808', '其他', '0', '800');
INSERT INTO `data_brand_format` VALUES ('809', '其他', '0', '801');
INSERT INTO `data_brand_format` VALUES ('810', '其他', '0', '802');
INSERT INTO `data_brand_format` VALUES ('811', '其他', '0', '803');
INSERT INTO `data_brand_format` VALUES ('812', '其他', '0', '804');
INSERT INTO `data_brand_format` VALUES ('813', '其他', '0', '805');
INSERT INTO `data_brand_format` VALUES ('814', '其他', '0', '806');
INSERT INTO `data_brand_format` VALUES ('815', '其他', '0', '807');
INSERT INTO `data_brand_format` VALUES ('816', '其他', '0', '808');
INSERT INTO `data_brand_format` VALUES ('817', '其他', '0', '809');
INSERT INTO `data_brand_format` VALUES ('818', '其他', '0', '810');
INSERT INTO `data_brand_format` VALUES ('819', '其他', '0', '811');
INSERT INTO `data_brand_format` VALUES ('820', '其他', '0', '812');
INSERT INTO `data_brand_format` VALUES ('821', '其他', '0', '813');
INSERT INTO `data_brand_format` VALUES ('822', '其他', '0', '814');
INSERT INTO `data_brand_format` VALUES ('823', '其他', '0', '815');
INSERT INTO `data_brand_format` VALUES ('824', '其他', '0', '816');
INSERT INTO `data_brand_format` VALUES ('825', '其他', '0', '817');
INSERT INTO `data_brand_format` VALUES ('826', '其他', '0', '818');
INSERT INTO `data_brand_format` VALUES ('827', '其他', '0', '819');
INSERT INTO `data_brand_format` VALUES ('828', '其他', '0', '820');
INSERT INTO `data_brand_format` VALUES ('829', '其他', '0', '821');
INSERT INTO `data_brand_format` VALUES ('830', '其他', '0', '822');
INSERT INTO `data_brand_format` VALUES ('831', '其他', '0', '823');
INSERT INTO `data_brand_format` VALUES ('832', '其他', '0', '824');
INSERT INTO `data_brand_format` VALUES ('833', '其他', '0', '825');
INSERT INTO `data_brand_format` VALUES ('834', '其他', '0', '826');
INSERT INTO `data_brand_format` VALUES ('835', '其他', '0', '827');
INSERT INTO `data_brand_format` VALUES ('836', '其他', '0', '828');
INSERT INTO `data_brand_format` VALUES ('837', '其他', '0', '829');
INSERT INTO `data_brand_format` VALUES ('838', '其他', '0', '830');
INSERT INTO `data_brand_format` VALUES ('839', '其他', '0', '831');
INSERT INTO `data_brand_format` VALUES ('840', '其他', '0', '832');
INSERT INTO `data_brand_format` VALUES ('841', '其他', '0', '833');
INSERT INTO `data_brand_format` VALUES ('842', '其他', '0', '834');
INSERT INTO `data_brand_format` VALUES ('843', '其他', '0', '835');
INSERT INTO `data_brand_format` VALUES ('844', '其他', '0', '836');
INSERT INTO `data_brand_format` VALUES ('845', '其他', '0', '837');
INSERT INTO `data_brand_format` VALUES ('846', '其他', '0', '838');
INSERT INTO `data_brand_format` VALUES ('847', '其他', '0', '839');
INSERT INTO `data_brand_format` VALUES ('848', '其他', '0', '840');
INSERT INTO `data_brand_format` VALUES ('849', '1.6T', '1111', '841');
INSERT INTO `data_brand_format` VALUES ('850', '1.8T', '1111', '841');

-- ----------------------------
-- Table structure for `data_car_use_time`
-- ----------------------------
DROP TABLE IF EXISTS `data_car_use_time`;
CREATE TABLE `data_car_use_time` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_time` varchar(50) NOT NULL,
  `end_time` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of data_car_use_time
-- ----------------------------
INSERT INTO `data_car_use_time` VALUES ('1', '07:30', '10:00');
INSERT INTO `data_car_use_time` VALUES ('2', '10:00', '11:30');
INSERT INTO `data_car_use_time` VALUES ('3', '12:00', '15:00');
INSERT INTO `data_car_use_time` VALUES ('4', '15:00', '17:00');

-- ----------------------------
-- Table structure for `data_device`
-- ----------------------------
DROP TABLE IF EXISTS `data_device`;
CREATE TABLE `data_device` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=826 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of data_device
-- ----------------------------
INSERT INTO `data_device` VALUES ('419', '帕萨特SVW1830J', '272');
INSERT INTO `data_device` VALUES ('420', 'OA工资单系统', '273');
INSERT INTO `data_device` VALUES ('421', 'OA经费使用系统', '273');
INSERT INTO `data_device` VALUES ('422', 'OA采购系统', '273');
INSERT INTO `data_device` VALUES ('423', '短信系统升级', '273');
INSERT INTO `data_device` VALUES ('424', '公共卫生检测信息管理系统', '273');
INSERT INTO `data_device` VALUES ('425', '课桌', '274');
INSERT INTO `data_device` VALUES ('426', '办公家具', '274');
INSERT INTO `data_device` VALUES ('427', '铁皮柜', '274');
INSERT INTO `data_device` VALUES ('428', '货架', '274');
INSERT INTO `data_device` VALUES ('429', '身份证读卡器', '275');
INSERT INTO `data_device` VALUES ('430', '杀毒喷雾器', '276');
INSERT INTO `data_device` VALUES ('431', '消毒喷雾器', '276');
INSERT INTO `data_device` VALUES ('432', '药品保存箱', '277');
INSERT INTO `data_device` VALUES ('433', '低温冰箱', '278');
INSERT INTO `data_device` VALUES ('434', '便携式计算机', '279');
INSERT INTO `data_device` VALUES ('435', '台式机', '280');
INSERT INTO `data_device` VALUES ('436', '普通电视设备（电视机）', '281');
INSERT INTO `data_device` VALUES ('437', '普通照相机', '282');
INSERT INTO `data_device` VALUES ('438', '针式A4打印机', '283');
INSERT INTO `data_device` VALUES ('439', '光学生物测量仪', '284');
INSERT INTO `data_device` VALUES ('440', 'PM2.5检测仪', '285');
INSERT INTO `data_device` VALUES ('441', '小型客车', '286');
INSERT INTO `data_device` VALUES ('442', '传真通信设备', '287');
INSERT INTO `data_device` VALUES ('443', '激光A4打印机', '288');
INSERT INTO `data_device` VALUES ('444', '激光式打印机', '288');
INSERT INTO `data_device` VALUES ('445', '针式打印机', '283');
INSERT INTO `data_device` VALUES ('446', '家具用具', '274');
INSERT INTO `data_device` VALUES ('447', '彩色液晶电视机', '281');
INSERT INTO `data_device` VALUES ('448', '电动工具枪', '289');
INSERT INTO `data_device` VALUES ('449', '办公用具', '274');
INSERT INTO `data_device` VALUES ('450', '笔记本电脑', '279');
INSERT INTO `data_device` VALUES ('451', '整理箱', '290');
INSERT INTO `data_device` VALUES ('452', '台式计算机', '291');
INSERT INTO `data_device` VALUES ('453', '轮椅', '292');
INSERT INTO `data_device` VALUES ('454', '交换机', '293');
INSERT INTO `data_device` VALUES ('455', '压差计', '294');
INSERT INTO `data_device` VALUES ('456', '浊度计', '295');
INSERT INTO `data_device` VALUES ('457', '测风速计', '296');
INSERT INTO `data_device` VALUES ('458', '余氯比色分析仪器', '297');
INSERT INTO `data_device` VALUES ('459', '六级微生物采样器', '295');
INSERT INTO `data_device` VALUES ('460', '便携大气采样器', '295');
INSERT INTO `data_device` VALUES ('461', 'X射线专用检测仪器', '298');
INSERT INTO `data_device` VALUES ('462', '饮水机', '299');
INSERT INTO `data_device` VALUES ('463', '医用低温箱', '300');
INSERT INTO `data_device` VALUES ('464', '家用电冰箱', '301');
INSERT INTO `data_device` VALUES ('465', '生物显微镜', '302');
INSERT INTO `data_device` VALUES ('466', '体视显微镜', '302');
INSERT INTO `data_device` VALUES ('467', '全自动免疫印迹仪', '303');
INSERT INTO `data_device` VALUES ('468', '话筒设备', '304');
INSERT INTO `data_device` VALUES ('469', '电影投影仪', '305');
INSERT INTO `data_device` VALUES ('470', '便携式无线电话机', '306');
INSERT INTO `data_device` VALUES ('471', '点钞机', '307');
INSERT INTO `data_device` VALUES ('472', '黑、白板（磁板）', '308');
INSERT INTO `data_device` VALUES ('473', '干燥箱', '290');
INSERT INTO `data_device` VALUES ('474', '低速离心机', '309');
INSERT INTO `data_device` VALUES ('475', '便携式大气采样器', '295');
INSERT INTO `data_device` VALUES ('476', '水质污染分析装置', '310');
INSERT INTO `data_device` VALUES ('477', '复印机', '311');
INSERT INTO `data_device` VALUES ('478', '速印机', '312');
INSERT INTO `data_device` VALUES ('479', 'F43闪光灯', '313');
INSERT INTO `data_device` VALUES ('480', 'sony16-105镜头', '314');
INSERT INTO `data_device` VALUES ('481', '惠普笔记本电脑', '279');
INSERT INTO `data_device` VALUES ('482', '打印机兄弟PT9700', '288');
INSERT INTO `data_device` VALUES ('483', '雅马哈功放', '315');
INSERT INTO `data_device` VALUES ('484', 'HP黑白激光打印机', '288');
INSERT INTO `data_device` VALUES ('485', '移门柜', '316');
INSERT INTO `data_device` VALUES ('486', '防化服', '317');
INSERT INTO `data_device` VALUES ('487', '佳能数码相机', '282');
INSERT INTO `data_device` VALUES ('488', '联想笔记本电脑', '279');
INSERT INTO `data_device` VALUES ('489', 'sony单反相机', '282');
INSERT INTO `data_device` VALUES ('490', '录音笔', '318');
INSERT INTO `data_device` VALUES ('491', '惠普电脑5320-B10', '280');
INSERT INTO `data_device` VALUES ('492', '三星数码相机', '282');
INSERT INTO `data_device` VALUES ('493', '风速仪', '319');
INSERT INTO `data_device` VALUES ('494', 'hp笔记本电脑', '279');
INSERT INTO `data_device` VALUES ('495', 'hp2080M电脑', '280');
INSERT INTO `data_device` VALUES ('496', '佳能HPK28数码摄像机', '320');
INSERT INTO `data_device` VALUES ('497', '遥控电动幕布', '317');
INSERT INTO `data_device` VALUES ('498', '效果器', '315');
INSERT INTO `data_device` VALUES ('499', '热水机', '321');
INSERT INTO `data_device` VALUES ('500', '空调', '322');
INSERT INTO `data_device` VALUES ('501', '装订机', '323');
INSERT INTO `data_device` VALUES ('502', '救护车', '324');
INSERT INTO `data_device` VALUES ('503', '大中型客车', '325');
INSERT INTO `data_device` VALUES ('504', '其他专用汽车', '326');
INSERT INTO `data_device` VALUES ('505', '铁制文件柜', '316');
INSERT INTO `data_device` VALUES ('506', '三人更衣橱', '316');
INSERT INTO `data_device` VALUES ('507', '货架', '316');
INSERT INTO `data_device` VALUES ('508', '铁皮文件橱', '316');
INSERT INTO `data_device` VALUES ('509', '铁皮双门橱', '316');
INSERT INTO `data_device` VALUES ('510', '卡片柜', '316');
INSERT INTO `data_device` VALUES ('511', '四斗单门书柜', '316');
INSERT INTO `data_device` VALUES ('512', '床', '327');
INSERT INTO `data_device` VALUES ('513', '柜子', '328');
INSERT INTO `data_device` VALUES ('514', '奥非斯办公台', '328');
INSERT INTO `data_device` VALUES ('515', '课桌', '328');
INSERT INTO `data_device` VALUES ('516', '书柜', '316');
INSERT INTO `data_device` VALUES ('517', '双节文件橱', '316');
INSERT INTO `data_device` VALUES ('518', '抽屉卡片柜', '316');
INSERT INTO `data_device` VALUES ('519', '双门文件橱', '316');
INSERT INTO `data_device` VALUES ('520', '双门橱', '316');
INSERT INTO `data_device` VALUES ('521', '茶几', '328');
INSERT INTO `data_device` VALUES ('522', '台子', '328');
INSERT INTO `data_device` VALUES ('523', '移门橱', '328');
INSERT INTO `data_device` VALUES ('524', '十斗单门橱', '316');
INSERT INTO `data_device` VALUES ('525', '二门更衣橱', '316');
INSERT INTO `data_device` VALUES ('526', '木制文件柜', '316');
INSERT INTO `data_device` VALUES ('527', '宽斗移门橱', '316');
INSERT INTO `data_device` VALUES ('528', '上下两门橱', '316');
INSERT INTO `data_device` VALUES ('529', '五层橱', '328');
INSERT INTO `data_device` VALUES ('530', '矮柜', '316');
INSERT INTO `data_device` VALUES ('531', '二门柜连单层文件柜', '316');
INSERT INTO `data_device` VALUES ('532', '三斗移门橱', '328');
INSERT INTO `data_device` VALUES ('533', '八斗三门橱', '316');
INSERT INTO `data_device` VALUES ('534', '书刊橱', '316');
INSERT INTO `data_device` VALUES ('535', '小双斗加小双门橱', '316');
INSERT INTO `data_device` VALUES ('536', '宽移门柜', '316');
INSERT INTO `data_device` VALUES ('537', '宽二斗开门柜', '316');
INSERT INTO `data_device` VALUES ('538', '文件橱', '316');
INSERT INTO `data_device` VALUES ('539', '铁皮回门更衣橱', '316');
INSERT INTO `data_device` VALUES ('540', '屏风', '317');
INSERT INTO `data_device` VALUES ('541', '办公家具', '316');
INSERT INTO `data_device` VALUES ('542', '二人更衣橱', '316');
INSERT INTO `data_device` VALUES ('543', '椅子', '328');
INSERT INTO `data_device` VALUES ('544', '五层橱', '316');
INSERT INTO `data_device` VALUES ('545', '回斗单门加书橱、五层橱', '316');
INSERT INTO `data_device` VALUES ('546', '文件柜', '316');
INSERT INTO `data_device` VALUES ('547', '三斗移门柜', '316');
INSERT INTO `data_device` VALUES ('548', '铁制货架', '316');
INSERT INTO `data_device` VALUES ('549', '楼梯担架椅', '329');
INSERT INTO `data_device` VALUES ('550', '三门更衣橱', '316');
INSERT INTO `data_device` VALUES ('551', '密集架', '316');
INSERT INTO `data_device` VALUES ('552', '多用处', '328');
INSERT INTO `data_device` VALUES ('553', '双门更衣橱', '316');
INSERT INTO `data_device` VALUES ('554', '三门更衣橱', '328');
INSERT INTO `data_device` VALUES ('555', '三门十斗柜', '316');
INSERT INTO `data_device` VALUES ('556', '箱柜', '316');
INSERT INTO `data_device` VALUES ('557', '实验操作台', '316');
INSERT INTO `data_device` VALUES ('558', '双斗橱', '328');
INSERT INTO `data_device` VALUES ('559', '带门豪华机柜', '316');
INSERT INTO `data_device` VALUES ('560', '三件套沙发', '330');
INSERT INTO `data_device` VALUES ('561', '移门二节上下柜', '316');
INSERT INTO `data_device` VALUES ('562', '办公家具（三套办公台）', '316');
INSERT INTO `data_device` VALUES ('563', '四斗开门柜', '316');
INSERT INTO `data_device` VALUES ('564', '小双斗回门橱加五层橱', '316');
INSERT INTO `data_device` VALUES ('565', '开门高低柜', '316');
INSERT INTO `data_device` VALUES ('566', '会议台', '328');
INSERT INTO `data_device` VALUES ('567', '餐边柜', '316');
INSERT INTO `data_device` VALUES ('568', '玻璃移门', '316');
INSERT INTO `data_device` VALUES ('569', '复印机柜', '316');
INSERT INTO `data_device` VALUES ('570', '信箱柜', '316');
INSERT INTO `data_device` VALUES ('571', '六斗单门柜', '328');
INSERT INTO `data_device` VALUES ('572', '屏风', '316');
INSERT INTO `data_device` VALUES ('573', '实验柜', '316');
INSERT INTO `data_device` VALUES ('574', '铁皮五层橱', '316');
INSERT INTO `data_device` VALUES ('575', '双门文件柜', '316');
INSERT INTO `data_device` VALUES ('576', '电子天平', '331');
INSERT INTO `data_device` VALUES ('577', '离心机', '332');
INSERT INTO `data_device` VALUES ('578', '低温冷藏箱', '290');
INSERT INTO `data_device` VALUES ('579', '低速台式离心机', '332');
INSERT INTO `data_device` VALUES ('580', '工频场谱仪', '333');
INSERT INTO `data_device` VALUES ('581', '热释光计量仪', '334');
INSERT INTO `data_device` VALUES ('582', '电动喷雾器', '335');
INSERT INTO `data_device` VALUES ('583', '紫外线照射机', '335');
INSERT INTO `data_device` VALUES ('584', '余氯比色剂', '336');
INSERT INTO `data_device` VALUES ('585', '微生物采样器', '310');
INSERT INTO `data_device` VALUES ('586', '紫外线照射机', '290');
INSERT INTO `data_device` VALUES ('587', '灭蚊机', '335');
INSERT INTO `data_device` VALUES ('588', '采样机器人', '310');
INSERT INTO `data_device` VALUES ('589', '生物安全运输箱', '290');
INSERT INTO `data_device` VALUES ('590', '恒流低流量模块', '310');
INSERT INTO `data_device` VALUES ('591', '可编程采样泵', '310');
INSERT INTO `data_device` VALUES ('592', '显微镜', '302');
INSERT INTO `data_device` VALUES ('593', '全自动洗板机', '335');
INSERT INTO `data_device` VALUES ('594', '全自动酶标仪', '335');
INSERT INTO `data_device` VALUES ('595', '生物安全运输箱', '337');
INSERT INTO `data_device` VALUES ('596', '个人计量报警仪', '310');
INSERT INTO `data_device` VALUES ('597', '数码体视显微成像系统', '302');
INSERT INTO `data_device` VALUES ('598', '双筒显微镜', '302');
INSERT INTO `data_device` VALUES ('599', '裂隙灯显微镜', '302');
INSERT INTO `data_device` VALUES ('600', '主楼', '338');
INSERT INTO `data_device` VALUES ('601', '辅楼', '338');
INSERT INTO `data_device` VALUES ('602', '车棚', '338');
INSERT INTO `data_device` VALUES ('603', '佳能数码照相机', '282');
INSERT INTO `data_device` VALUES ('604', '便携式呼吸器', '339');
INSERT INTO `data_device` VALUES ('605', '气管插管固定器材', '339');
INSERT INTO `data_device` VALUES ('606', '羽毛球架', '340');
INSERT INTO `data_device` VALUES ('607', '电脑超微粒喷雾器', '341');
INSERT INTO `data_device` VALUES ('608', 'X-N巡测仪', '342');
INSERT INTO `data_device` VALUES ('609', '喷雾器', '341');
INSERT INTO `data_device` VALUES ('610', '大气采样器', '343');
INSERT INTO `data_device` VALUES ('611', 'HP电脑主机', '280');
INSERT INTO `data_device` VALUES ('612', '打印机HP-lj2014', '288');
INSERT INTO `data_device` VALUES ('613', '观片器', '282');
INSERT INTO `data_device` VALUES ('614', '双接双发话筒', '304');
INSERT INTO `data_device` VALUES ('615', '硫化氢传感器', '344');
INSERT INTO `data_device` VALUES ('616', '化学防护服', '343');
INSERT INTO `data_device` VALUES ('617', '生物安全柜', '345');
INSERT INTO `data_device` VALUES ('618', '公共卫生应急指挥系统', '346');
INSERT INTO `data_device` VALUES ('619', '激光打印机HP-1522', '288');
INSERT INTO `data_device` VALUES ('620', '移动硬盘', '347');
INSERT INTO `data_device` VALUES ('621', '松下多功能一体机', '348');
INSERT INTO `data_device` VALUES ('622', '冰箱', '301');
INSERT INTO `data_device` VALUES ('623', '摄影器材', '313');
INSERT INTO `data_device` VALUES ('624', '双头粉尘采样器', '343');
INSERT INTO `data_device` VALUES ('625', '全自动血压计', '349');
INSERT INTO `data_device` VALUES ('626', '多功能射线仪', '343');
INSERT INTO `data_device` VALUES ('627', '氨气传感器', '344');
INSERT INTO `data_device` VALUES ('628', '温湿度计', '349');
INSERT INTO `data_device` VALUES ('629', '躯干夹板', '339');
INSERT INTO `data_device` VALUES ('630', '配件', '313');
INSERT INTO `data_device` VALUES ('631', '传真机', '348');
INSERT INTO `data_device` VALUES ('632', '电脑', '280');
INSERT INTO `data_device` VALUES ('633', '标准流量校正系统恒流', '343');
INSERT INTO `data_device` VALUES ('634', '单次辐射热计', '343');
INSERT INTO `data_device` VALUES ('635', '话筒', '304');
INSERT INTO `data_device` VALUES ('636', '电子密码保险箱', '350');
INSERT INTO `data_device` VALUES ('637', '电动喷雾器', '341');
INSERT INTO `data_device` VALUES ('638', '空气呼吸器', '344');
INSERT INTO `data_device` VALUES ('639', '生物安全运输箱', '351');
INSERT INTO `data_device` VALUES ('640', '空调', '352');
INSERT INTO `data_device` VALUES ('641', '电视机', '281');
INSERT INTO `data_device` VALUES ('642', '加样枪', '343');
INSERT INTO `data_device` VALUES ('643', '生物安全柜', '351');
INSERT INTO `data_device` VALUES ('644', '数字式温度计', '349');
INSERT INTO `data_device` VALUES ('645', '紫外线防护镜', '353');
INSERT INTO `data_device` VALUES ('646', '新科导航仪', '275');
INSERT INTO `data_device` VALUES ('647', '奥林巴斯照相机（附闪光灯）', '282');
INSERT INTO `data_device` VALUES ('648', '便携式余氯比色计', '343');
INSERT INTO `data_device` VALUES ('649', '康能普视小旋风非编卡', '275');
INSERT INTO `data_device` VALUES ('650', '扫描仪', '354');
INSERT INTO `data_device` VALUES ('651', '正压式空气呼吸器', '343');
INSERT INTO `data_device` VALUES ('652', '网络报警系统软件', '275');
INSERT INTO `data_device` VALUES ('653', '电子人体秤', '344');
INSERT INTO `data_device` VALUES ('654', '隔水式恒温箱', '355');
INSERT INTO `data_device` VALUES ('655', '松下数码照相机', '282');
INSERT INTO `data_device` VALUES ('656', '打印机', '288');
INSERT INTO `data_device` VALUES ('657', '碳纤维气体瓶', '343');
INSERT INTO `data_device` VALUES ('658', '对讲机', '356');
INSERT INTO `data_device` VALUES ('659', '照相机', '282');
INSERT INTO `data_device` VALUES ('660', '牙科综合治疗仪', '357');
INSERT INTO `data_device` VALUES ('661', '佳能传真机', '348');
INSERT INTO `data_device` VALUES ('662', '不锈钢展示车', '358');
INSERT INTO `data_device` VALUES ('663', '闪光灯', '282');
INSERT INTO `data_device` VALUES ('664', '表面污染检测仪', '343');
INSERT INTO `data_device` VALUES ('665', '微机热释光剂量仪', '343');
INSERT INTO `data_device` VALUES ('666', '数码相机', '282');
INSERT INTO `data_device` VALUES ('667', 'DVD', '359');
INSERT INTO `data_device` VALUES ('668', '打印机', '348');
INSERT INTO `data_device` VALUES ('669', '酶标仪', '351');
INSERT INTO `data_device` VALUES ('670', '新科数码照相机', '282');
INSERT INTO `data_device` VALUES ('671', '电脑服务器', '280');
INSERT INTO `data_device` VALUES ('672', '有机熏蒸箱', '360');
INSERT INTO `data_device` VALUES ('673', '连续加样枪', '355');
INSERT INTO `data_device` VALUES ('674', '电脑工作站', '280');
INSERT INTO `data_device` VALUES ('675', 'S型皮托管', '343');
INSERT INTO `data_device` VALUES ('676', '工作站', '280');
INSERT INTO `data_device` VALUES ('677', '保险箱T-91', '350');
INSERT INTO `data_device` VALUES ('678', '热球风速仪', '343');
INSERT INTO `data_device` VALUES ('679', '均衡器', '361');
INSERT INTO `data_device` VALUES ('680', '理想笔记本电脑', '279');
INSERT INTO `data_device` VALUES ('681', '摄象机', '320');
INSERT INTO `data_device` VALUES ('682', '手机', '306');
INSERT INTO `data_device` VALUES ('683', '冰柜', '301');
INSERT INTO `data_device` VALUES ('684', '无线话筒', '304');
INSERT INTO `data_device` VALUES ('685', '心电监护机', '292');
INSERT INTO `data_device` VALUES ('686', '呼吸机', '292');
INSERT INTO `data_device` VALUES ('687', '监控设备', '362');
INSERT INTO `data_device` VALUES ('688', '传真机', '287');
INSERT INTO `data_device` VALUES ('689', 'BAG简易呼吸器', '363');
INSERT INTO `data_device` VALUES ('690', '诊察床', '292');
INSERT INTO `data_device` VALUES ('691', '电脑', '364');
INSERT INTO `data_device` VALUES ('692', '噪音计', '343');
INSERT INTO `data_device` VALUES ('693', '可编程流空气采样泵', '343');
INSERT INTO `data_device` VALUES ('694', '心脏按压泵', '363');
INSERT INTO `data_device` VALUES ('695', '噪音仪', '343');
INSERT INTO `data_device` VALUES ('696', '手动投影幕', '305');
INSERT INTO `data_device` VALUES ('697', '颈托', '339');
INSERT INTO `data_device` VALUES ('698', '彩色监视器', '361');
INSERT INTO `data_device` VALUES ('699', '氯气传感器', '344');
INSERT INTO `data_device` VALUES ('700', '紫外线消毒车', '358');
INSERT INTO `data_device` VALUES ('701', 'X射线防护衣', '344');
INSERT INTO `data_device` VALUES ('702', '噪音计声源', '343');
INSERT INTO `data_device` VALUES ('703', '音位校正器', '361');
INSERT INTO `data_device` VALUES ('704', '一氧化碳检测仪', '343');
INSERT INTO `data_device` VALUES ('705', '双卡座', '305');
INSERT INTO `data_device` VALUES ('706', '激光打印机HP-5200', '288');
INSERT INTO `data_device` VALUES ('707', '镜头', '313');
INSERT INTO `data_device` VALUES ('708', '一氧化碳分析仪', '365');
INSERT INTO `data_device` VALUES ('709', '激光粉尘仪', '366');
INSERT INTO `data_device` VALUES ('710', '功放', '315');
INSERT INTO `data_device` VALUES ('711', '樱花热水器', '367');
INSERT INTO `data_device` VALUES ('712', '不锈钢双层器械台', '292');
INSERT INTO `data_device` VALUES ('713', '文件消毒柜', '279');
INSERT INTO `data_device` VALUES ('714', '生物测试有机玻璃方箱', '355');
INSERT INTO `data_device` VALUES ('715', 'MP3', '347');
INSERT INTO `data_device` VALUES ('716', '光盘拷贝机', '275');
INSERT INTO `data_device` VALUES ('717', '三门快速阅读器', '275');
INSERT INTO `data_device` VALUES ('718', '电脑服务器', '275');
INSERT INTO `data_device` VALUES ('719', '主音响', '361');
INSERT INTO `data_device` VALUES ('720', '保险箱', '350');
INSERT INTO `data_device` VALUES ('721', '挥发性有机化合物检测仪', '343');
INSERT INTO `data_device` VALUES ('722', '电源时序器', '361');
INSERT INTO `data_device` VALUES ('723', '粉尘采样器', '343');
INSERT INTO `data_device` VALUES ('724', '检测仪器一批', '346');
INSERT INTO `data_device` VALUES ('725', '高分子夹板', '368');
INSERT INTO `data_device` VALUES ('726', 'X射线防护帽', '344');
INSERT INTO `data_device` VALUES ('727', '分频器', '361');
INSERT INTO `data_device` VALUES ('728', '夏普彩电', '281');
INSERT INTO `data_device` VALUES ('729', '红外CD分析仪', '365');
INSERT INTO `data_device` VALUES ('730', '电容话筒', '304');
INSERT INTO `data_device` VALUES ('731', '微风速仪', '343');
INSERT INTO `data_device` VALUES ('732', '卡西欧电子琴', '369');
INSERT INTO `data_device` VALUES ('733', '冷藏箱', '301');
INSERT INTO `data_device` VALUES ('734', '昆虫饲养架', '355');
INSERT INTO `data_device` VALUES ('735', '数字式照度计', '343');
INSERT INTO `data_device` VALUES ('736', '快速血糖测定仪', '363');
INSERT INTO `data_device` VALUES ('737', 'hp电脑', '280');
INSERT INTO `data_device` VALUES ('738', '灭菌锅', '355');
INSERT INTO `data_device` VALUES ('739', '通用型气体采样泵', '343');
INSERT INTO `data_device` VALUES ('740', '佳能照相机', '282');
INSERT INTO `data_device` VALUES ('741', '辅助音响', '361');
INSERT INTO `data_device` VALUES ('742', 'AV10实物投影仪', '305');
INSERT INTO `data_device` VALUES ('743', '苯传感器', '344');
INSERT INTO `data_device` VALUES ('744', '欧姆龙电子血压计', '349');
INSERT INTO `data_device` VALUES ('745', '全面罩防毒面具', '344');
INSERT INTO `data_device` VALUES ('746', '电脑人体秤', '344');
INSERT INTO `data_device` VALUES ('747', '电子感应血糖仪', '370');
INSERT INTO `data_device` VALUES ('748', '多通道气体检测仪', '344');
INSERT INTO `data_device` VALUES ('749', '心电图机', '371');
INSERT INTO `data_device` VALUES ('750', '不锈钢紫外线205车', '358');
INSERT INTO `data_device` VALUES ('751', '气管插管器材', '363');
INSERT INTO `data_device` VALUES ('752', '可充熄硌电池单元', '344');
INSERT INTO `data_device` VALUES ('753', '水质理快检箱', '366');
INSERT INTO `data_device` VALUES ('754', '恒流低流量模块', '343');
INSERT INTO `data_device` VALUES ('755', '光固化机', '363');
INSERT INTO `data_device` VALUES ('756', '打印机HP-1160', '288');
INSERT INTO `data_device` VALUES ('757', '抽湿机', '372');
INSERT INTO `data_device` VALUES ('758', '气体检测仪', '343');
INSERT INTO `data_device` VALUES ('759', '双气路大气采样器', '343');
INSERT INTO `data_device` VALUES ('760', '低端服务器', '364');
INSERT INTO `data_device` VALUES ('761', '全自动酶标仪', '370');
INSERT INTO `data_device` VALUES ('762', '洗眼器', '373');
INSERT INTO `data_device` VALUES ('763', '防化服', '344');
INSERT INTO `data_device` VALUES ('764', '八联看片灯', '346');
INSERT INTO `data_device` VALUES ('765', '音响', '361');
INSERT INTO `data_device` VALUES ('766', '单联看片灯', '374');
INSERT INTO `data_device` VALUES ('767', '空气呼吸器MASK面罩', '344');
INSERT INTO `data_device` VALUES ('768', '突发事故气体快速检测箱', '343');
INSERT INTO `data_device` VALUES ('769', '有机挥发性气体检测仪', '343');
INSERT INTO `data_device` VALUES ('770', '倾斜式微压计', '343');
INSERT INTO `data_device` VALUES ('771', '阻燃隔热防护服', '343');
INSERT INTO `data_device` VALUES ('772', '超重低音音响', '361');
INSERT INTO `data_device` VALUES ('773', '二氧化碳分析仪', '343');
INSERT INTO `data_device` VALUES ('774', '剂量率仪', '343');
INSERT INTO `data_device` VALUES ('775', '碎纸机', '375');
INSERT INTO `data_device` VALUES ('776', '调音台', '361');
INSERT INTO `data_device` VALUES ('777', '闪光灯', '313');
INSERT INTO `data_device` VALUES ('778', '充电器', '344');
INSERT INTO `data_device` VALUES ('779', '先锋DVD播放机', '359');
INSERT INTO `data_device` VALUES ('780', '二氧化碳检测仪', '343');
INSERT INTO `data_device` VALUES ('781', '照度计', '343');
INSERT INTO `data_device` VALUES ('782', '银员调和器', '376');
INSERT INTO `data_device` VALUES ('783', '打印机HP-1522', '288');
INSERT INTO `data_device` VALUES ('784', '头部固定器', '339');
INSERT INTO `data_device` VALUES ('785', '手提电脑验光仪', '284');
INSERT INTO `data_device` VALUES ('786', '声级计', '343');
INSERT INTO `data_device` VALUES ('787', '电脑点歌机', '377');
INSERT INTO `data_device` VALUES ('788', '甲醛分析仪', '343');
INSERT INTO `data_device` VALUES ('789', '投影仪', '305');
INSERT INTO `data_device` VALUES ('790', '紫外照度计', '355');
INSERT INTO `data_device` VALUES ('791', '噪声频谱分析仪', '378');
INSERT INTO `data_device` VALUES ('792', '空气呼吸器碳钎维瓶', '344');
INSERT INTO `data_device` VALUES ('793', '激光粉尘仪', '343');
INSERT INTO `data_device` VALUES ('794', '除颤仪', '363');
INSERT INTO `data_device` VALUES ('795', '多功能监护', '363');
INSERT INTO `data_device` VALUES ('796', '索尼液晶投影仪', '305');
INSERT INTO `data_device` VALUES ('797', 'HP20英寸液晶显示器', '379');
INSERT INTO `data_device` VALUES ('798', '奥林巴斯照相机', '282');
INSERT INTO `data_device` VALUES ('799', '模块', '275');
INSERT INTO `data_device` VALUES ('800', '充气夹板', '363');
INSERT INTO `data_device` VALUES ('801', '连续测氮仪', '343');
INSERT INTO `data_device` VALUES ('802', '激励器', '361');
INSERT INTO `data_device` VALUES ('803', '灭蚊机', '367');
INSERT INTO `data_device` VALUES ('804', '服务器', '364');
INSERT INTO `data_device` VALUES ('805', '标准皮托管', '343');
INSERT INTO `data_device` VALUES ('806', '电动气雾器', '341');
INSERT INTO `data_device` VALUES ('807', 'CO标准气体', '343');
INSERT INTO `data_device` VALUES ('808', '免疫试验脱水仪', '339');
INSERT INTO `data_device` VALUES ('809', '全自动高压灭菌器', '380');
INSERT INTO `data_device` VALUES ('810', '黑球湿球温度仪', '343');
INSERT INTO `data_device` VALUES ('811', '管理系统POS机', '275');
INSERT INTO `data_device` VALUES ('812', '退火炉', '343');
INSERT INTO `data_device` VALUES ('813', '余氯比色剂', '366');
INSERT INTO `data_device` VALUES ('814', '红外CD2分析仪', '365');
INSERT INTO `data_device` VALUES ('815', '彩电', '281');
INSERT INTO `data_device` VALUES ('816', '个人计量仪', '343');
INSERT INTO `data_device` VALUES ('817', '佳能数码摄象机', '320');
INSERT INTO `data_device` VALUES ('818', '积分声级仪', '343');
INSERT INTO `data_device` VALUES ('819', '爱普生扫描仪', '354');
INSERT INTO `data_device` VALUES ('820', '旋风分离器', '343');
INSERT INTO `data_device` VALUES ('821', '保险箱E83', '350');
INSERT INTO `data_device` VALUES ('822', 'IBM笔记本电脑', '279');
INSERT INTO `data_device` VALUES ('823', '喷墨打印机', '381');
INSERT INTO `data_device` VALUES ('824', '验钞机', '307');
INSERT INTO `data_device` VALUES ('825', '1111', '272');

-- ----------------------------
-- Table structure for `data_device_type`
-- ----------------------------
DROP TABLE IF EXISTS `data_device_type`;
CREATE TABLE `data_device_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=382 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of data_device_type
-- ----------------------------
INSERT INTO `data_device_type` VALUES ('272', '其他客车');
INSERT INTO `data_device_type` VALUES ('273', '其他计算机软件');
INSERT INTO `data_device_type` VALUES ('274', '其他家具用具');
INSERT INTO `data_device_type` VALUES ('275', '其他计算机设备及软件');
INSERT INTO `data_device_type` VALUES ('276', '化学方法消毒设备');
INSERT INTO `data_device_type` VALUES ('277', '药品贮藏设备');
INSERT INTO `data_device_type` VALUES ('278', '医用低温设备');
INSERT INTO `data_device_type` VALUES ('279', '便携式计算机');
INSERT INTO `data_device_type` VALUES ('280', '台式机');
INSERT INTO `data_device_type` VALUES ('281', '普通电视设备（电视机）');
INSERT INTO `data_device_type` VALUES ('282', '普通照相机');
INSERT INTO `data_device_type` VALUES ('283', '针式A4打印机');
INSERT INTO `data_device_type` VALUES ('284', '眼科光学仪器');
INSERT INTO `data_device_type` VALUES ('285', '检测仪');
INSERT INTO `data_device_type` VALUES ('286', '小型客车');
INSERT INTO `data_device_type` VALUES ('287', '传真通信设备');
INSERT INTO `data_device_type` VALUES ('288', '激光A4打印机');
INSERT INTO `data_device_type` VALUES ('289', '电动工具');
INSERT INTO `data_device_type` VALUES ('290', '试验箱及气候环境试验设备');
INSERT INTO `data_device_type` VALUES ('291', '小型机');
INSERT INTO `data_device_type` VALUES ('292', '其他医疗设备');
INSERT INTO `data_device_type` VALUES ('293', '交换机');
INSERT INTO `data_device_type` VALUES ('294', '压力仪表');
INSERT INTO `data_device_type` VALUES ('295', '物理特性分析仪器及校准仪器');
INSERT INTO `data_device_type` VALUES ('296', '消防安全检测设备');
INSERT INTO `data_device_type` VALUES ('297', '光学式分析仪器');
INSERT INTO `data_device_type` VALUES ('298', '医用射线专用检测仪器');
INSERT INTO `data_device_type` VALUES ('299', '民用锅炉');
INSERT INTO `data_device_type` VALUES ('300', '其他石油和化学工业专用设备');
INSERT INTO `data_device_type` VALUES ('301', '制冷电器');
INSERT INTO `data_device_type` VALUES ('302', '显微镜');
INSERT INTO `data_device_type` VALUES ('303', '免疫学设备');
INSERT INTO `data_device_type` VALUES ('304', '话筒设备');
INSERT INTO `data_device_type` VALUES ('305', '其他电影设备');
INSERT INTO `data_device_type` VALUES ('306', '移动通信（网）设备');
INSERT INTO `data_device_type` VALUES ('307', '会计机械');
INSERT INTO `data_device_type` VALUES ('308', '电子白板');
INSERT INTO `data_device_type` VALUES ('309', '离心机');
INSERT INTO `data_device_type` VALUES ('310', '环境监测仪器及综合分析装置');
INSERT INTO `data_device_type` VALUES ('311', '复印机');
INSERT INTO `data_device_type` VALUES ('312', '速印机');
INSERT INTO `data_device_type` VALUES ('313', '其他照相机械及器材');
INSERT INTO `data_device_type` VALUES ('314', '相机镜头');
INSERT INTO `data_device_type` VALUES ('315', '音频功率放大器设备（功放设备）');
INSERT INTO `data_device_type` VALUES ('316', '其他柜');
INSERT INTO `data_device_type` VALUES ('317', '其他被服装具');
INSERT INTO `data_device_type` VALUES ('318', '广播专用录放音设备');
INSERT INTO `data_device_type` VALUES ('319', '其他环保监测设备');
INSERT INTO `data_device_type` VALUES ('320', '摄像机');
INSERT INTO `data_device_type` VALUES ('321', '烹调电器');
INSERT INTO `data_device_type` VALUES ('322', '空调机组');
INSERT INTO `data_device_type` VALUES ('323', '装订机械');
INSERT INTO `data_device_type` VALUES ('324', '救护车');
INSERT INTO `data_device_type` VALUES ('325', '大中型客车');
INSERT INTO `data_device_type` VALUES ('326', '其他专用汽车');
INSERT INTO `data_device_type` VALUES ('327', '床类');
INSERT INTO `data_device_type` VALUES ('328', '台、桌类');
INSERT INTO `data_device_type` VALUES ('329', '椅凳类');
INSERT INTO `data_device_type` VALUES ('330', '沙发类');
INSERT INTO `data_device_type` VALUES ('331', '分析天平及专用天平');
INSERT INTO `data_device_type` VALUES ('332', '生物、医学样品制备设备');
INSERT INTO `data_device_type` VALUES ('333', '其他仪器仪表');
INSERT INTO `data_device_type` VALUES ('334', '光学计量仪器');
INSERT INTO `data_device_type` VALUES ('335', '其他试验仪器及装置');
INSERT INTO `data_device_type` VALUES ('336', '电化学分析仪器');
INSERT INTO `data_device_type` VALUES ('337', '其他分析仪器');
INSERT INTO `data_device_type` VALUES ('338', '医卫慈善用房');
INSERT INTO `data_device_type` VALUES ('339', '其他医用电子仪器');
INSERT INTO `data_device_type` VALUES ('340', '其他体育设备');
INSERT INTO `data_device_type` VALUES ('341', '植保机械');
INSERT INTO `data_device_type` VALUES ('342', '专用X线诊断设备');
INSERT INTO `data_device_type` VALUES ('343', '大气监测装置');
INSERT INTO `data_device_type` VALUES ('344', '医用射线防护用具及装置');
INSERT INTO `data_device_type` VALUES ('345', '尿液化验设备');
INSERT INTO `data_device_type` VALUES ('346', '通用X线诊断设备');
INSERT INTO `data_device_type` VALUES ('347', '移动存储设备');
INSERT INTO `data_device_type` VALUES ('348', '多功能一体机');
INSERT INTO `data_device_type` VALUES ('349', '普通诊察器械');
INSERT INTO `data_device_type` VALUES ('350', '保险柜');
INSERT INTO `data_device_type` VALUES ('351', '生化分析设备');
INSERT INTO `data_device_type` VALUES ('352', '空调');
INSERT INTO `data_device_type` VALUES ('353', '其他大气污染防治设备');
INSERT INTO `data_device_type` VALUES ('354', '扫描仪');
INSERT INTO `data_device_type` VALUES ('355', '其他临床检验设备');
INSERT INTO `data_device_type` VALUES ('356', '通用无线电通信设备');
INSERT INTO `data_device_type` VALUES ('357', '口腔科手术器械');
INSERT INTO `data_device_type` VALUES ('358', '光线、射线灭菌设备');
INSERT INTO `data_device_type` VALUES ('359', '激光视盘机');
INSERT INTO `data_device_type` VALUES ('360', '气体灭菌设备及器具');
INSERT INTO `data_device_type` VALUES ('361', '音响电视组合机');
INSERT INTO `data_device_type` VALUES ('362', '视频监控设备');
INSERT INTO `data_device_type` VALUES ('363', '监护仪器');
INSERT INTO `data_device_type` VALUES ('364', '终端机');
INSERT INTO `data_device_type` VALUES ('365', '其他消防设备');
INSERT INTO `data_device_type` VALUES ('366', '除尘设备');
INSERT INTO `data_device_type` VALUES ('367', '清洁卫生电器');
INSERT INTO `data_device_type` VALUES ('368', '手术及急救器具');
INSERT INTO `data_device_type` VALUES ('369', '键盘乐器');
INSERT INTO `data_device_type` VALUES ('370', '血液学设备');
INSERT INTO `data_device_type` VALUES ('371', '生理参数遥测仪器');
INSERT INTO `data_device_type` VALUES ('372', '其他空气调节电器');
INSERT INTO `data_device_type` VALUES ('373', '眼科手术器械');
INSERT INTO `data_device_type` VALUES ('374', '医用X线附属设备');
INSERT INTO `data_device_type` VALUES ('375', '碎纸机');
INSERT INTO `data_device_type` VALUES ('376', '牙种植设备及配件');
INSERT INTO `data_device_type` VALUES ('377', '其他网络设备');
INSERT INTO `data_device_type` VALUES ('378', '其他噪声控制设备');
INSERT INTO `data_device_type` VALUES ('379', '显示器');
INSERT INTO `data_device_type` VALUES ('380', '压力蒸汽灭菌设备');
INSERT INTO `data_device_type` VALUES ('381', '喷墨A4打印机');

-- ----------------------------
-- Table structure for `data_file_info`
-- ----------------------------
DROP TABLE IF EXISTS `data_file_info`;
CREATE TABLE `data_file_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target_table` varchar(50) NOT NULL,
  `target_id` int(11) NOT NULL,
  `file_name` varchar(50) NOT NULL,
  `file_url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=311 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of data_file_info
-- ----------------------------
INSERT INTO `data_file_info` VALUES ('64', 'funds_apply_info', '54', 'Hydrangeas', 'file/jfgl/RVX0N_1389106190428.jpg');
INSERT INTO `data_file_info` VALUES ('65', 'funds_apply_info', '54', 'QQProtectVi', 'file/jfgl/BPM02_1389096834116.dat');
INSERT INTO `data_file_info` VALUES ('66', 'funds_apply_info', '54', 'QQProtect', 'file/jfgl/486C2_1389096834118.dll');
INSERT INTO `data_file_info` VALUES ('99', 'funds_apply_info', '58', 'KPI', 'file/jfgl/Q06N6_1389611633340.txt');
INSERT INTO `data_file_info` VALUES ('100', 'funds_apply_info', '59', 'KPI', 'file/jfgl/QP00T_1389706443929.txt');
INSERT INTO `data_file_info` VALUES ('101', 'funds_apply_info', '60', 'Jellyfish', 'file/jfgl/P6D00_1389706446099.jpg');
INSERT INTO `data_file_info` VALUES ('102', 'funds_apply_info', '60', 'Koala', 'file/jfgl/888M4_1389706446101.jpg');
INSERT INTO `data_file_info` VALUES ('103', 'funds_apply_info', '61', '本', 'file/jfgl/FK460_1389706605222.txt');
INSERT INTO `data_file_info` VALUES ('111', 'funds_apply_info', '63', 'yygg', 'file/jfgl/6AB8W_1389839309133.jpg');
INSERT INTO `data_file_info` VALUES ('112', 'funds_apply_info', '64', 'yygg', 'file/jfgl/M8080_1389839352991.jpg');
INSERT INTO `data_file_info` VALUES ('115', 'funds_apply_info', '66', 'yygg', 'file/jfgl/NU680_1389850028838.jpg');
INSERT INTO `data_file_info` VALUES ('116', 'funds_apply_info', '62', 'yygg', 'file/jfgl/06YR6_1389842369014.jpg');
INSERT INTO `data_file_info` VALUES ('119', 'funds_apply_info', '71', 'QQProtectUI', 'file/jfgl/KU20S_1390197124870.dll');
INSERT INTO `data_file_info` VALUES ('121', 'funds_apply_info', '74', 'Hydrangeas', 'file/jfgl/Y4RS0_1390225506743.jpg');
INSERT INTO `data_file_info` VALUES ('124', 'funds_apply_info', '75', 'Jellyfish', 'file/jfgl/S6M2C_1390225625043.jpg');
INSERT INTO `data_file_info` VALUES ('130', 'funds_apply_info', '76', 'yygg', 'file/jfgl/K0EE6_1390225882850.jpg');
INSERT INTO `data_file_info` VALUES ('134', 'funds_apply_info', '77', 'Hydrangeas', 'file/jfgl/OV6UU_1390231024931.jpg');
INSERT INTO `data_file_info` VALUES ('140', 'funds_apply_info', '78', '晨滟科技PNG3', 'file/jfgl/4ZK8G_1390234958482.png');
INSERT INTO `data_file_info` VALUES ('145', 'funds_apply_info', '79', 'W82X4_1390653318340', 'file/jfgl/DU6D6_1390654644033.xls');
INSERT INTO `data_file_info` VALUES ('151', 'funds_apply_info', '80', '新建文本文档', 'file/jfgl/B2VA8_1390724187209.txt');
INSERT INTO `data_file_info` VALUES ('152', 'funds_apply_info', '80', '新建文本文档', 'file/jfgl/0I608_1390724058809.txt');
INSERT INTO `data_file_info` VALUES ('157', 'funds_apply_info', '81', '新建文本文档', 'file/jfgl/2RY42_1390809672266.txt');
INSERT INTO `data_file_info` VALUES ('158', 'funds_apply_info', '82', 'Chrysanthemum', 'file/jfgl/8880B_1391496966222.jpg');
INSERT INTO `data_file_info` VALUES ('164', 'funds_apply_info', '83', 'AccessibleMarshal', 'file/jfgl/62682_1392006411320.dll');
INSERT INTO `data_file_info` VALUES ('178', 'funds_apply_info', '88', 'Hydrangeas', 'file/jfgl/40600_1392345273169.jpg');
INSERT INTO `data_file_info` VALUES ('179', 'funds_apply_info', '88', 'Jellyfish', 'file/jfgl/0W80L_1392345273182.jpg');
INSERT INTO `data_file_info` VALUES ('184', 'funds_apply_info', '85', 'application', 'file/jfgl/422J8_1392040743999.ini');
INSERT INTO `data_file_info` VALUES ('191', 'funds_apply_info', '89', 'Hydrangeas', 'file/jfgl/KJ86X_1392345700841.jpg');
INSERT INTO `data_file_info` VALUES ('192', 'funds_apply_info', '89', 'Jellyfish', 'file/jfgl/26R88_1392345700847.jpg');
INSERT INTO `data_file_info` VALUES ('211', 'funds_apply_info', '90', 'Hydrangeas', 'file/jfgl/2ZFWC_1392345861310.jpg');
INSERT INTO `data_file_info` VALUES ('212', 'funds_apply_info', '90', 'Jellyfish', 'file/jfgl/J00XY_1392345861316.jpg');
INSERT INTO `data_file_info` VALUES ('213', 'funds_apply_info', '90', 'Koala', 'file/jfgl/6ZAPF_1392345861321.jpg');
INSERT INTO `data_file_info` VALUES ('218', 'funds_apply_info', '91', 'yygg', 'file/jfgl/C686L_1392346012035.jpg');
INSERT INTO `data_file_info` VALUES ('235', 'funds_apply_info', '95', 'debug', 'file/jfgl/JK484_1392641856462.log');
INSERT INTO `data_file_info` VALUES ('236', 'funds_apply_info', '95', 'VisualElementsManifest', 'file/jfgl/QK8N8_1392641805182.xml');
INSERT INTO `data_file_info` VALUES ('237', 'funds_apply_info', '95', 'chrome', 'file/jfgl/T8K0N_1392641769112.exe');
INSERT INTO `data_file_info` VALUES ('241', 'funds_apply_info', '96', 'debug', 'file/jfgl/86OE6_1392641894548.log');
INSERT INTO `data_file_info` VALUES ('248', 'funds_apply_info', '94', 'Hydrangeas', 'file/jfgl/8CF82_1392367011722.jpg');
INSERT INTO `data_file_info` VALUES ('249', 'funds_apply_info', '94', 'Jellyfish', 'file/jfgl/06UU0_1392367011728.jpg');
INSERT INTO `data_file_info` VALUES ('253', 'funds_apply_info', '101', 'menu_info', 'file/jfgl/8U484_1395812484811.sql');
INSERT INTO `data_file_info` VALUES ('260', 'funds_apply_info', '108', '新建 Microsoft Word 文档', 'file/jfgl/C2R86_1397380478474.doc');
INSERT INTO `data_file_info` VALUES ('265', 'funds_apply_info', '109', '新建 Microsoft Word 文档', 'file/jfgl/8R426_1397418207047.doc');
INSERT INTO `data_file_info` VALUES ('286', 'funds_apply_info', '111', '新建 Microsoft Word 文档', 'file/jfgl/262JC_1397467668893.doc');
INSERT INTO `data_file_info` VALUES ('287', 'funds_apply_info', '111', '新建 Microsoft Word 文档', 'file/jfgl/88Y86_1397467668896.doc');
INSERT INTO `data_file_info` VALUES ('297', 'funds_apply_info', '115', '车管.xlsx', 'file/jfgl/T2QEJ_1397480011427.xlsx');
INSERT INTO `data_file_info` VALUES ('298', 'wzcg_zczl', '103', '长宁疾控数据库修改文档-20140418.doc', 'file/wpcg/zczl/082V8_1398971897976.doc');
INSERT INTO `data_file_info` VALUES ('299', 'wzcg_zczl', '109', '恰尔斯驻场日报.doc', 'file/wpcg/zczl/6LI0V_1399178615205.doc');
INSERT INTO `data_file_info` VALUES ('300', 'wzcg_zczl', '111', '恰尔斯驻场日报.doc', 'file/wpcg/zczl/60U4K_1399179020341.doc');
INSERT INTO `data_file_info` VALUES ('301', 'wzcg_zczl', '115', '恰尔斯驻场日报.doc', 'file/wpcg/zczl/O006N_1399318407268.doc');
INSERT INTO `data_file_info` VALUES ('308', 'funds_apply_info', '112', '新建 Microsoft Word 文档.doc', 'file/jfgl/N0T4V_1397472406660.doc');
INSERT INTO `data_file_info` VALUES ('309', 'funds_apply_info', '112', '新建 Microsoft Word 文档', 'file/jfgl/C4C8G_1397472261110.doc');
INSERT INTO `data_file_info` VALUES ('310', 'funds_apply_info', '112', '新建 Microsoft Word 文档', 'file/jfgl/4I28H_1397472261112.doc');

-- ----------------------------
-- Table structure for `data_funds_name`
-- ----------------------------
DROP TABLE IF EXISTS `data_funds_name`;
CREATE TABLE `data_funds_name` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of data_funds_name
-- ----------------------------
INSERT INTO `data_funds_name` VALUES ('1', '重大公共卫生服务项目');
INSERT INTO `data_funds_name` VALUES ('2', '传染病预警与管理');
INSERT INTO `data_funds_name` VALUES ('3', '慢性病管理及研究');
INSERT INTO `data_funds_name` VALUES ('4', '疾病防控惠及百姓');
INSERT INTO `data_funds_name` VALUES ('5', '健康知识进社区');
INSERT INTO `data_funds_name` VALUES ('6', '公共卫生试剂及成本');
INSERT INTO `data_funds_name` VALUES ('7', '公共卫生仪器强检及维护');
INSERT INTO `data_funds_name` VALUES ('8', '监测设备购置经费');
INSERT INTO `data_funds_name` VALUES ('9', '公共卫生培训资料费、工本费');
INSERT INTO `data_funds_name` VALUES ('10', '外聘人员经费');
INSERT INTO `data_funds_name` VALUES ('11', '实验室整体设备融资租赁及维护费');
INSERT INTO `data_funds_name` VALUES ('12', '公共卫生实验室试剂耗材经费');
INSERT INTO `data_funds_name` VALUES ('13', '流感网络实验室检验成本经费');
INSERT INTO `data_funds_name` VALUES ('14', '专业设备购置经费');
INSERT INTO `data_funds_name` VALUES ('15', '其他');

-- ----------------------------
-- Table structure for `data_funds_type`
-- ----------------------------
DROP TABLE IF EXISTS `data_funds_type`;
CREATE TABLE `data_funds_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` int(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of data_funds_type
-- ----------------------------
INSERT INTO `data_funds_type` VALUES ('1', '专项经费', '1');
INSERT INTO `data_funds_type` VALUES ('2', '公用经费', '1');
INSERT INTO `data_funds_type` VALUES ('3', '市疾控拨款', '1');
INSERT INTO `data_funds_type` VALUES ('4', '市眼防拨款', '1');
INSERT INTO `data_funds_type` VALUES ('5', '市牙防经费', '1');
INSERT INTO `data_funds_type` VALUES ('6', '科研经费', '1');
INSERT INTO `data_funds_type` VALUES ('7', '其他', '1');
INSERT INTO `data_funds_type` VALUES ('8', '123123', '1');

-- ----------------------------
-- Table structure for `data_meeting_room_use_time`
-- ----------------------------
DROP TABLE IF EXISTS `data_meeting_room_use_time`;
CREATE TABLE `data_meeting_room_use_time` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_time` varchar(50) NOT NULL,
  `end_time` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of data_meeting_room_use_time
-- ----------------------------
INSERT INTO `data_meeting_room_use_time` VALUES ('1', '07:30', '11:30');
INSERT INTO `data_meeting_room_use_time` VALUES ('2', '13:00', '17:00');

-- ----------------------------
-- Table structure for `data_mz_info`
-- ----------------------------
DROP TABLE IF EXISTS `data_mz_info`;
CREATE TABLE `data_mz_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of data_mz_info
-- ----------------------------
INSERT INTO `data_mz_info` VALUES ('2', '汉族');
INSERT INTO `data_mz_info` VALUES ('3', '苗族');

-- ----------------------------
-- Table structure for `data_supplier_certificate_type`
-- ----------------------------
DROP TABLE IF EXISTS `data_supplier_certificate_type`;
CREATE TABLE `data_supplier_certificate_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of data_supplier_certificate_type
-- ----------------------------
INSERT INTO `data_supplier_certificate_type` VALUES ('1', '组织机构代码证');
INSERT INTO `data_supplier_certificate_type` VALUES ('2', '营业执照');

-- ----------------------------
-- Table structure for `data_supplier_type`
-- ----------------------------
DROP TABLE IF EXISTS `data_supplier_type`;
CREATE TABLE `data_supplier_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `status` int(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of data_supplier_type
-- ----------------------------
INSERT INTO `data_supplier_type` VALUES ('1', '医疗器械', '1');
INSERT INTO `data_supplier_type` VALUES ('2', '办公用品', '1');

-- ----------------------------
-- Table structure for `data_system`
-- ----------------------------
DROP TABLE IF EXISTS `data_system`;
CREATE TABLE `data_system` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `value` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `remark` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of data_system
-- ----------------------------
INSERT INTO `data_system` VALUES ('1', '采购', '0', 'storage_mode', null);
INSERT INTO `data_system` VALUES ('2', '赠予', '1', 'storage_mode', null);
INSERT INTO `data_system` VALUES ('3', '调拨', '2', 'storage_mode', null);
INSERT INTO `data_system` VALUES ('4', '在用', '0', 'use_situation', null);
INSERT INTO `data_system` VALUES ('5', '在库', '1', 'use_situation', null);
INSERT INTO `data_system` VALUES ('6', '报废', '2', 'use_situation', null);
INSERT INTO `data_system` VALUES ('7', '正常使用', '0', 'service_situation', null);
INSERT INTO `data_system` VALUES ('8', '维修中', '1', 'service_situation', null);
INSERT INTO `data_system` VALUES ('9', '报废', '2', 'service_situation', null);

-- ----------------------------
-- Table structure for `data_use_place`
-- ----------------------------
DROP TABLE IF EXISTS `data_use_place`;
CREATE TABLE `data_use_place` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department_id` int(11) NOT NULL,
  `room_num` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of data_use_place
-- ----------------------------
INSERT INTO `data_use_place` VALUES ('2', '24', '4F');
INSERT INTO `data_use_place` VALUES ('3', '14', '915');
INSERT INTO `data_use_place` VALUES ('4', '11', '803');
INSERT INTO `data_use_place` VALUES ('5', '2', '707');
INSERT INTO `data_use_place` VALUES ('6', '5', '702');
INSERT INTO `data_use_place` VALUES ('7', '8', '001');
INSERT INTO `data_use_place` VALUES ('8', '23', '709');
INSERT INTO `data_use_place` VALUES ('9', '29', '809');
INSERT INTO `data_use_place` VALUES ('10', '6', '801');
INSERT INTO `data_use_place` VALUES ('11', '9', '1015');
INSERT INTO `data_use_place` VALUES ('12', '10', '703');
INSERT INTO `data_use_place` VALUES ('13', '7', '903');
INSERT INTO `data_use_place` VALUES ('14', '25', '911');
INSERT INTO `data_use_place` VALUES ('15', '1', '701');
INSERT INTO `data_use_place` VALUES ('16', '4', '1003');
INSERT INTO `data_use_place` VALUES ('17', '13', '708');

-- ----------------------------
-- Table structure for `data_whcd_info`
-- ----------------------------
DROP TABLE IF EXISTS `data_whcd_info`;
CREATE TABLE `data_whcd_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of data_whcd_info
-- ----------------------------
INSERT INTO `data_whcd_info` VALUES ('1', '博士');
INSERT INTO `data_whcd_info` VALUES ('2', '硕士');
INSERT INTO `data_whcd_info` VALUES ('3', '本科');

-- ----------------------------
-- Table structure for `data_work_status`
-- ----------------------------
DROP TABLE IF EXISTS `data_work_status`;
CREATE TABLE `data_work_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `is_system` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of data_work_status
-- ----------------------------
INSERT INTO `data_work_status` VALUES ('1', '在职', '1');
INSERT INTO `data_work_status` VALUES ('2', '实习', '1');
INSERT INTO `data_work_status` VALUES ('3', '退休', '1');
INSERT INTO `data_work_status` VALUES ('4', '离职', '1');
INSERT INTO `data_work_status` VALUES ('5', '借调', '1');
INSERT INTO `data_work_status` VALUES ('6', '病假', '1');
INSERT INTO `data_work_status` VALUES ('7', '其他', '1');
INSERT INTO `data_work_status` VALUES ('10', '派遣', '0');

-- ----------------------------
-- Table structure for `data_zcjb_info`
-- ----------------------------
DROP TABLE IF EXISTS `data_zcjb_info`;
CREATE TABLE `data_zcjb_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of data_zcjb_info
-- ----------------------------
INSERT INTO `data_zcjb_info` VALUES ('1', '高级');
INSERT INTO `data_zcjb_info` VALUES ('2', '中级');
INSERT INTO `data_zcjb_info` VALUES ('3', '初级');

-- ----------------------------
-- Table structure for `data_zc_info`
-- ----------------------------
DROP TABLE IF EXISTS `data_zc_info`;
CREATE TABLE `data_zc_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of data_zc_info
-- ----------------------------
INSERT INTO `data_zc_info` VALUES ('1', '工程师');
INSERT INTO `data_zc_info` VALUES ('2', '检测员');

-- ----------------------------
-- Table structure for `data_zzmm_info`
-- ----------------------------
DROP TABLE IF EXISTS `data_zzmm_info`;
CREATE TABLE `data_zzmm_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of data_zzmm_info
-- ----------------------------
INSERT INTO `data_zzmm_info` VALUES ('1', '党员');
INSERT INTO `data_zzmm_info` VALUES ('2', '团员');

-- ----------------------------
-- Table structure for `department_info`
-- ----------------------------
DROP TABLE IF EXISTS `department_info`;
CREATE TABLE `department_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `base_id` int(11) NOT NULL DEFAULT '0',
  `status` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department_info
-- ----------------------------
INSERT INTO `department_info` VALUES ('16', '公共卫生监测管理科', null, '0', '1');
INSERT INTO `department_info` VALUES ('17', '体检科', null, '0', '0');
INSERT INTO `department_info` VALUES ('18', '人事科', null, '0', '1');
INSERT INTO `department_info` VALUES ('6', '管理员', null, '0', '1');
INSERT INTO `department_info` VALUES ('7', '行政办公室', null, '0', '1');
INSERT INTO `department_info` VALUES ('8', '综合业务办', null, '6', '1');
INSERT INTO `department_info` VALUES ('9', '健康教育科', null, '0', '1');
INSERT INTO `department_info` VALUES ('10', '传染病防制科', null, '0', '1');
INSERT INTO `department_info` VALUES ('11', '慢性病防制科', null, '0', '1');
INSERT INTO `department_info` VALUES ('12', '免疫预防科', null, '0', '1');
INSERT INTO `department_info` VALUES ('13', '病媒消毒科', null, '0', '1');
INSERT INTO `department_info` VALUES ('14', '性艾结防科', null, '0', '1');
INSERT INTO `department_info` VALUES ('35', '退休', '17', '0', '0');
INSERT INTO `department_info` VALUES ('36', '其他', '0', '0', '1');
INSERT INTO `department_info` VALUES ('33', '理化科', null, '0', '1');
INSERT INTO `department_info` VALUES ('31', '创建办', null, '0', '1');
INSERT INTO `department_info` VALUES ('34', '微检科', null, '0', '1');
INSERT INTO `department_info` VALUES ('32', '借调', '0', '0', '0');
INSERT INTO `department_info` VALUES ('15', '眼防牙防科', null, '0', '1');
INSERT INTO `department_info` VALUES ('19', '财务科', null, '0', '1');
INSERT INTO `department_info` VALUES ('20', '中心领导', null, '0', '1');
INSERT INTO `department_info` VALUES ('21', '质管科', null, '0', '1');
INSERT INTO `department_info` VALUES ('22', '生命统计科', null, '0', '1');
INSERT INTO `department_info` VALUES ('37', '1231231', '0', '16', '1');

-- ----------------------------
-- Table structure for `department_position`
-- ----------------------------
DROP TABLE IF EXISTS `department_position`;
CREATE TABLE `department_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department_id` int(11) NOT NULL,
  `position_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department_position
-- ----------------------------
INSERT INTO `department_position` VALUES ('1', '1', '1');
INSERT INTO `department_position` VALUES ('2', '1', '6');
INSERT INTO `department_position` VALUES ('4', '2', '4');
INSERT INTO `department_position` VALUES ('5', '2', '9');
INSERT INTO `department_position` VALUES ('7', '3', '5');
INSERT INTO `department_position` VALUES ('8', '3', '15');
INSERT INTO `department_position` VALUES ('9', '3', '6');
INSERT INTO `department_position` VALUES ('10', '3', '11');
INSERT INTO `department_position` VALUES ('11', '3', '12');
INSERT INTO `department_position` VALUES ('12', '3', '13');
INSERT INTO `department_position` VALUES ('13', '2', '6');
INSERT INTO `department_position` VALUES ('14', '4', '5');
INSERT INTO `department_position` VALUES ('15', '4', '15');
INSERT INTO `department_position` VALUES ('16', '4', '4');
INSERT INTO `department_position` VALUES ('17', '4', '6');
INSERT INTO `department_position` VALUES ('18', '4', '17');
INSERT INTO `department_position` VALUES ('19', '6', '5');
INSERT INTO `department_position` VALUES ('20', '6', '15');
INSERT INTO `department_position` VALUES ('21', '6', '6');
INSERT INTO `department_position` VALUES ('22', '6', '14');
INSERT INTO `department_position` VALUES ('23', '6', '17');
INSERT INTO `department_position` VALUES ('24', '4', '14');
INSERT INTO `department_position` VALUES ('25', '7', '5');
INSERT INTO `department_position` VALUES ('26', '7', '4');
INSERT INTO `department_position` VALUES ('27', '7', '6');
INSERT INTO `department_position` VALUES ('28', '7', '15');
INSERT INTO `department_position` VALUES ('29', '7', '14');
INSERT INTO `department_position` VALUES ('30', '7', '17');
INSERT INTO `department_position` VALUES ('31', '5', '5');
INSERT INTO `department_position` VALUES ('32', '5', '4');
INSERT INTO `department_position` VALUES ('33', '5', '6');
INSERT INTO `department_position` VALUES ('34', '5', '14');
INSERT INTO `department_position` VALUES ('35', '5', '17');
INSERT INTO `department_position` VALUES ('36', '8', '5');
INSERT INTO `department_position` VALUES ('37', '8', '4');
INSERT INTO `department_position` VALUES ('38', '8', '6');
INSERT INTO `department_position` VALUES ('39', '8', '9');
INSERT INTO `department_position` VALUES ('40', '8', '14');
INSERT INTO `department_position` VALUES ('41', '8', '17');
INSERT INTO `department_position` VALUES ('42', '9', '5');
INSERT INTO `department_position` VALUES ('43', '9', '6');
INSERT INTO `department_position` VALUES ('44', '9', '17');
INSERT INTO `department_position` VALUES ('45', '10', '5');
INSERT INTO `department_position` VALUES ('46', '10', '6');
INSERT INTO `department_position` VALUES ('47', '10', '7');
INSERT INTO `department_position` VALUES ('48', '10', '8');
INSERT INTO `department_position` VALUES ('49', '11', '5');
INSERT INTO `department_position` VALUES ('50', '11', '6');
INSERT INTO `department_position` VALUES ('51', '11', '15');
INSERT INTO `department_position` VALUES ('52', '11', '14');
INSERT INTO `department_position` VALUES ('53', '11', '17');
INSERT INTO `department_position` VALUES ('54', '12', '5');
INSERT INTO `department_position` VALUES ('55', '12', '6');
INSERT INTO `department_position` VALUES ('56', '12', '4');
INSERT INTO `department_position` VALUES ('57', '12', '15');
INSERT INTO `department_position` VALUES ('58', '12', '14');
INSERT INTO `department_position` VALUES ('59', '12', '17');
INSERT INTO `department_position` VALUES ('60', '13', '5');
INSERT INTO `department_position` VALUES ('61', '13', '4');
INSERT INTO `department_position` VALUES ('62', '13', '6');
INSERT INTO `department_position` VALUES ('63', '13', '16');
INSERT INTO `department_position` VALUES ('64', '14', '5');
INSERT INTO `department_position` VALUES ('65', '14', '4');
INSERT INTO `department_position` VALUES ('66', '14', '6');
INSERT INTO `department_position` VALUES ('67', '14', '10');
INSERT INTO `department_position` VALUES ('69', '2', '3');
INSERT INTO `department_position` VALUES ('70', '25', '3');
INSERT INTO `department_position` VALUES ('72', '5', '12');
INSERT INTO `department_position` VALUES ('73', '1', '2');
INSERT INTO `department_position` VALUES ('74', '1', '3');

-- ----------------------------
-- Table structure for `depot_rk_entry`
-- ----------------------------
DROP TABLE IF EXISTS `depot_rk_entry`;
CREATE TABLE `depot_rk_entry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wzcg_info_id` int(11) NOT NULL,
  `device_type_id` int(11) NOT NULL,
  `device_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `brand_format_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL DEFAULT '0',
  `money` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=430 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of depot_rk_entry
-- ----------------------------
INSERT INTO `depot_rk_entry` VALUES ('428', '95', '272', '419', '425', '428', '1', '1');
INSERT INTO `depot_rk_entry` VALUES ('429', '97', '272', '419', '425', '428', '1', '1');

-- ----------------------------
-- Table structure for `funds_apply_info`
-- ----------------------------
DROP TABLE IF EXISTS `funds_apply_info`;
CREATE TABLE `funds_apply_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type_name` varchar(255) NOT NULL,
  `money` double NOT NULL,
  `remark` text NOT NULL,
  `pay_details` text NOT NULL,
  `work_content` text NOT NULL,
  `apply_staff_id` int(11) NOT NULL,
  `apply_department_id` int(11) NOT NULL,
  `apply_time` date NOT NULL,
  `step` int(2) NOT NULL,
  `status` int(2) NOT NULL,
  `is_buy` int(2) NOT NULL,
  `is_syscg` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of funds_apply_info
-- ----------------------------
INSERT INTO `funds_apply_info` VALUES ('111', 'JF-06-20140414-001', '123123', '专项经费', '123123', '123123', '123123', '123123', '180', '6', '2014-04-14', '6', '1', '0', '0');
INSERT INTO `funds_apply_info` VALUES ('112', 'JF-06-20140414-002', '重大公共卫生服务项目', '专项经费', '123123', '123123', '12313', '123123', '180', '6', '2014-04-14', '2', '0', '0', '1');
INSERT INTO `funds_apply_info` VALUES ('113', 'JF-06-20140414-003', '重大公共卫生服务项目', '专项经费', '12345', '22222222222', '333333333333', '11111111111', '180', '6', '2014-04-14', '5', '1', '0', '1');
INSERT INTO `funds_apply_info` VALUES ('114', 'JF-06-20140414-004', '重大公共卫生服务项目', '市牙防经费', '29000', '29000', '29000', '29000', '180', '6', '2014-04-14', '5', '1', '0', '1');
INSERT INTO `funds_apply_info` VALUES ('115', 'JF-06-20140414-005', '传染病预警与管理', '专项经费', '23456', '321', '123', '123', '180', '6', '2014-04-14', '5', '1', '0', '0');
INSERT INTO `funds_apply_info` VALUES ('116', 'JF-20-20140506-001', '重大公共卫生服务项目', '专项经费', '123123', '123', '123', '123', '64', '20', '2014-05-06', '6', '1', '0', '0');

-- ----------------------------
-- Table structure for `funds_apply_info_log`
-- ----------------------------
DROP TABLE IF EXISTS `funds_apply_info_log`;
CREATE TABLE `funds_apply_info_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `apply_id` int(11) NOT NULL,
  `approval_id` int(11) NOT NULL,
  `num` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type_name` varchar(255) NOT NULL,
  `money` double NOT NULL,
  `remark` varchar(255) NOT NULL,
  `pay_details` varchar(255) NOT NULL,
  `work_content` varchar(255) NOT NULL,
  `apply_staff_id` int(11) NOT NULL,
  `apply_department_id` int(11) NOT NULL,
  `apply_time` date NOT NULL,
  `step` int(2) NOT NULL,
  `status` int(2) NOT NULL,
  `is_buy` int(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=383 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of funds_apply_info_log
-- ----------------------------
INSERT INTO `funds_apply_info_log` VALUES ('343', '111', '510', 'JF-06-20140414-001', '123123', '专项经费', '123123', '123123', '123123', '123123', '180', '6', '2014-04-14', '0', '1', '0');
INSERT INTO `funds_apply_info_log` VALUES ('344', '111', '511', 'JF-06-20140414-001', '123123', '专项经费', '123123', '123123', '123123', '123123', '180', '6', '2014-04-14', '1', '1', '0');
INSERT INTO `funds_apply_info_log` VALUES ('345', '111', '512', 'JF-06-20140414-001', '123123', '专项经费', '123123', '123123', '123123', '123123', '180', '6', '2014-04-14', '2', '1', '0');
INSERT INTO `funds_apply_info_log` VALUES ('346', '111', '513', 'JF-06-20140414-001', '123123', '专项经费', '123123', '123123', '123123', '123123', '180', '6', '2014-04-14', '3', '-1', '0');
INSERT INTO `funds_apply_info_log` VALUES ('347', '111', '514', 'JF-06-20140414-001', '123123', '专项经费', '123123', '123123', '123123', '123123', '180', '6', '2014-04-14', '1', '-1', '0');
INSERT INTO `funds_apply_info_log` VALUES ('348', '111', '515', 'JF-06-20140414-001', '123123', '专项经费', '123123', '123123', '123123', '123123', '180', '6', '2014-04-14', '0', '0', '0');
INSERT INTO `funds_apply_info_log` VALUES ('349', '111', '516', 'JF-06-20140414-001', '123123', '专项经费', '123123', '123123', '123123', '123123', '180', '6', '2014-04-14', '1', '1', '0');
INSERT INTO `funds_apply_info_log` VALUES ('350', '111', '517', 'JF-06-20140414-001', '123123', '专项经费', '123123', '123123', '123123', '123123', '180', '6', '2014-04-14', '3', '1', '0');
INSERT INTO `funds_apply_info_log` VALUES ('351', '111', '518', 'JF-06-20140414-001', '123123', '专项经费', '123123', '123123', '123123', '123123', '180', '6', '2014-04-14', '4', '1', '0');
INSERT INTO `funds_apply_info_log` VALUES ('352', '111', '519', 'JF-06-20140414-001', '123123', '专项经费', '123123', '123123', '123123', '123123', '180', '6', '2014-04-14', '5', '1', '0');
INSERT INTO `funds_apply_info_log` VALUES ('353', '111', '520', 'JF-06-20140414-001', '123123', '专项经费', '123123', '123123', '123123', '123123', '180', '6', '2014-04-14', '6', '1', '0');
INSERT INTO `funds_apply_info_log` VALUES ('354', '112', '521', 'JF-06-20140414-002', '重大公共卫生服务项目', '专项经费', '123123', '123123', '12313', '123123', '180', '6', '2014-04-14', '0', '1', '0');
INSERT INTO `funds_apply_info_log` VALUES ('355', '112', '522', 'JF-06-20140414-002', '重大公共卫生服务项目', '专项经费', '123123', '123123', '12313', '123123', '180', '6', '2014-04-14', '1', '1', '0');
INSERT INTO `funds_apply_info_log` VALUES ('356', '112', '523', 'JF-06-20140414-002', '重大公共卫生服务项目', '专项经费', '123123', '123123', '12313', '123123', '180', '6', '2014-04-14', '2', '-1', '0');
INSERT INTO `funds_apply_info_log` VALUES ('357', '113', '524', 'JF-06-20140414-003', '重大公共卫生服务项目', '专项经费', '12345', '22222222222', '333333333333', '11111111111', '180', '6', '2014-04-14', '0', '1', '0');
INSERT INTO `funds_apply_info_log` VALUES ('358', '113', '525', 'JF-06-20140414-003', '重大公共卫生服务项目', '专项经费', '12345', '22222222222', '333333333333', '11111111111', '180', '6', '2014-04-14', '1', '1', '0');
INSERT INTO `funds_apply_info_log` VALUES ('359', '113', '526', 'JF-06-20140414-003', '重大公共卫生服务项目', '专项经费', '12345', '22222222222', '333333333333', '11111111111', '180', '6', '2014-04-14', '2', '1', '0');
INSERT INTO `funds_apply_info_log` VALUES ('360', '113', '527', 'JF-06-20140414-003', '重大公共卫生服务项目', '专项经费', '12345', '22222222222', '333333333333', '11111111111', '180', '6', '2014-04-14', '3', '1', '0');
INSERT INTO `funds_apply_info_log` VALUES ('361', '113', '528', 'JF-06-20140414-003', '重大公共卫生服务项目', '专项经费', '12345', '22222222222', '333333333333', '11111111111', '180', '6', '2014-04-14', '4', '1', '0');
INSERT INTO `funds_apply_info_log` VALUES ('362', '113', '529', 'JF-06-20140414-003', '重大公共卫生服务项目', '专项经费', '12345', '22222222222', '333333333333', '11111111111', '180', '6', '2014-04-14', '5', '1', '0');
INSERT INTO `funds_apply_info_log` VALUES ('363', '114', '530', 'JF-06-20140414-004', '重大公共卫生服务项目', '市牙防经费', '29000', '29000', '29000', '29000', '180', '6', '2014-04-14', '0', '1', '0');
INSERT INTO `funds_apply_info_log` VALUES ('364', '114', '531', 'JF-06-20140414-004', '重大公共卫生服务项目', '市牙防经费', '29000', '29000', '29000', '29000', '180', '6', '2014-04-14', '1', '1', '0');
INSERT INTO `funds_apply_info_log` VALUES ('365', '114', '532', 'JF-06-20140414-004', '重大公共卫生服务项目', '市牙防经费', '29000', '29000', '29000', '29000', '180', '6', '2014-04-14', '2', '1', '0');
INSERT INTO `funds_apply_info_log` VALUES ('366', '114', '533', 'JF-06-20140414-004', '重大公共卫生服务项目', '市牙防经费', '29000', '29000', '29000', '29000', '180', '6', '2014-04-14', '3', '1', '0');
INSERT INTO `funds_apply_info_log` VALUES ('367', '114', '534', 'JF-06-20140414-004', '重大公共卫生服务项目', '市牙防经费', '29000', '29000', '29000', '29000', '180', '6', '2014-04-14', '4', '1', '0');
INSERT INTO `funds_apply_info_log` VALUES ('368', '114', '535', 'JF-06-20140414-004', '重大公共卫生服务项目', '市牙防经费', '29000', '29000', '29000', '29000', '180', '6', '2014-04-14', '5', '1', '0');
INSERT INTO `funds_apply_info_log` VALUES ('369', '115', '536', 'JF-06-20140414-005', '传染病预警与管理', '专项经费', '23456', '321', '123', '123', '180', '6', '2014-04-14', '0', '1', '0');
INSERT INTO `funds_apply_info_log` VALUES ('370', '115', '537', 'JF-06-20140414-005', '传染病预警与管理', '专项经费', '23456', '321', '123', '123', '180', '6', '2014-04-14', '1', '1', '0');
INSERT INTO `funds_apply_info_log` VALUES ('371', '115', '538', 'JF-06-20140414-005', '传染病预警与管理', '专项经费', '23456', '321', '123', '123', '180', '6', '2014-04-14', '3', '1', '0');
INSERT INTO `funds_apply_info_log` VALUES ('372', '115', '539', 'JF-06-20140414-005', '传染病预警与管理', '专项经费', '23456', '321', '123', '123', '180', '6', '2014-04-14', '4', '1', '0');
INSERT INTO `funds_apply_info_log` VALUES ('373', '115', '540', 'JF-06-20140414-005', '传染病预警与管理', '专项经费', '23456', '321', '123', '123', '180', '6', '2014-04-14', '5', '1', '0');
INSERT INTO `funds_apply_info_log` VALUES ('374', '116', '541', 'JF-20-20140506-001', '重大公共卫生服务项目', '专项经费', '123123', '123', '123', '123', '64', '20', '2014-05-06', '0', '1', '0');
INSERT INTO `funds_apply_info_log` VALUES ('375', '112', '542', 'JF-06-20140414-002', '重大公共卫生服务项目', '专项经费', '123123', '123123', '12313', '123123', '180', '6', '2014-05-06', '1', '1', '0');
INSERT INTO `funds_apply_info_log` VALUES ('376', '116', '543', 'JF-20-20140506-001', '重大公共卫生服务项目', '专项经费', '123123', '123', '123', '123', '64', '20', '2014-05-06', '1', '1', '0');
INSERT INTO `funds_apply_info_log` VALUES ('377', '116', '544', 'JF-20-20140506-001', '重大公共卫生服务项目', '专项经费', '123123', '123', '123', '123', '64', '20', '2014-05-06', '3', '1', '0');
INSERT INTO `funds_apply_info_log` VALUES ('378', '116', '545', 'JF-20-20140506-001', '重大公共卫生服务项目', '专项经费', '123123', '123', '123', '123', '64', '20', '2014-05-06', '4', '1', '0');
INSERT INTO `funds_apply_info_log` VALUES ('379', '116', '546', 'JF-20-20140506-001', '重大公共卫生服务项目', '专项经费', '123123', '123', '123', '123', '64', '20', '2014-05-06', '5', '1', '0');
INSERT INTO `funds_apply_info_log` VALUES ('380', '116', '547', 'JF-20-20140506-001', '重大公共卫生服务项目', '专项经费', '123123', '123', '123', '123', '64', '20', '2014-05-06', '6', '1', '0');
INSERT INTO `funds_apply_info_log` VALUES ('381', '112', '548', 'JF-06-20140414-002', '重大公共卫生服务项目', '专项经费', '123123', '123123', '12313', '123123', '180', '6', '2014-06-11', '2', '-1', '0');
INSERT INTO `funds_apply_info_log` VALUES ('382', '112', '549', 'JF-06-20140414-002', '重大公共卫生服务项目', '专项经费', '123123', '123123', '12313', '123123', '180', '6', '2014-06-11', '1', '1', '0');

-- ----------------------------
-- Table structure for `funds_apply_stock_entry`
-- ----------------------------
DROP TABLE IF EXISTS `funds_apply_stock_entry`;
CREATE TABLE `funds_apply_stock_entry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `apply_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `money` double NOT NULL,
  `amount` int(11) NOT NULL,
  `remark` varchar(255) NOT NULL,
  `buy_amount` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=536 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of funds_apply_stock_entry
-- ----------------------------
INSERT INTO `funds_apply_stock_entry` VALUES ('504', '111', '123', '123', '123', '123', '18');
INSERT INTO `funds_apply_stock_entry` VALUES ('505', '111', '12123', '123', '123', '123', '18');
INSERT INTO `funds_apply_stock_entry` VALUES ('506', '111', '124124', '12412', '124124', '1241241424124', '18');
INSERT INTO `funds_apply_stock_entry` VALUES ('515', '113', '1111', '111', '22', '1111', '0');
INSERT INTO `funds_apply_stock_entry` VALUES ('521', '114', '29000', '1', '29000', '29000', '10301');
INSERT INTO `funds_apply_stock_entry` VALUES ('526', '115', 'aaaa', '22', '111', '1123', '111');
INSERT INTO `funds_apply_stock_entry` VALUES ('533', '116', '123', '123', '123', '123', '104');
INSERT INTO `funds_apply_stock_entry` VALUES ('535', '112', '123', '123', '123', '123123', '0');

-- ----------------------------
-- Table structure for `funds_approval`
-- ----------------------------
DROP TABLE IF EXISTS `funds_approval`;
CREATE TABLE `funds_approval` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `apply_id` int(11) NOT NULL,
  `approval_staff_id` int(11) NOT NULL,
  `approval_time` datetime NOT NULL,
  `result` int(2) NOT NULL,
  `step` int(2) NOT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=550 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of funds_approval
-- ----------------------------
INSERT INTO `funds_approval` VALUES ('510', '111', '180', '2014-04-14 17:27:46', '0', '0', '', null, null);
INSERT INTO `funds_approval` VALUES ('511', '111', '180', '2014-04-14 17:40:56', '1', '1', '123123123', null, null);
INSERT INTO `funds_approval` VALUES ('512', '111', '180', '2014-04-14 17:41:06', '1', '2', '123123123', null, null);
INSERT INTO `funds_approval` VALUES ('513', '111', '180', '2014-04-14 17:41:15', '-1', '3', '123123123', null, null);
INSERT INTO `funds_approval` VALUES ('514', '111', '180', '2014-04-14 17:41:28', '-1', '1', '123123123', null, null);
INSERT INTO `funds_approval` VALUES ('515', '111', '180', '2014-04-14 17:52:08', '0', '0', null, null, null);
INSERT INTO `funds_approval` VALUES ('516', '111', '180', '2014-04-14 17:52:18', '1', '1', '12312313', null, null);
INSERT INTO `funds_approval` VALUES ('517', '111', '180', '2014-04-14 18:29:13', '1', '3', '123123', null, null);
INSERT INTO `funds_approval` VALUES ('518', '111', '180', '2014-04-14 18:29:23', '1', '4', '123123123', null, null);
INSERT INTO `funds_approval` VALUES ('519', '111', '180', '2014-04-14 18:29:34', '1', '5', '123123123', null, null);
INSERT INTO `funds_approval` VALUES ('520', '111', '180', '2014-04-14 18:32:23', '1', '6', '1231231233', '新建 Microsoft Word 文档.doc', 'file/jfgl/2L0Q2_1397471545074.doc');
INSERT INTO `funds_approval` VALUES ('521', '112', '180', '2014-04-14 18:36:01', '0', '0', '', null, null);
INSERT INTO `funds_approval` VALUES ('522', '112', '180', '2014-04-14 18:44:19', '1', '1', '123123', null, null);
INSERT INTO `funds_approval` VALUES ('523', '112', '180', '2014-04-14 18:46:44', '-1', '2', '1231231', null, null);
INSERT INTO `funds_approval` VALUES ('524', '113', '180', '2014-04-14 20:28:05', '0', '0', '', null, null);
INSERT INTO `funds_approval` VALUES ('525', '113', '180', '2014-04-14 20:36:07', '1', '1', 'aaa', null, null);
INSERT INTO `funds_approval` VALUES ('526', '113', '180', '2014-04-14 20:37:19', '1', '2', 'bbbb', null, null);
INSERT INTO `funds_approval` VALUES ('527', '113', '180', '2014-04-14 20:37:41', '1', '3', 'ccc', null, null);
INSERT INTO `funds_approval` VALUES ('528', '113', '180', '2014-04-14 20:37:54', '1', '4', 'ddddd', null, null);
INSERT INTO `funds_approval` VALUES ('529', '113', '180', '2014-04-14 20:38:09', '1', '5', 'ty', null, null);
INSERT INTO `funds_approval` VALUES ('530', '114', '180', '2014-04-14 20:45:38', '0', '0', '', null, null);
INSERT INTO `funds_approval` VALUES ('531', '114', '180', '2014-04-14 20:46:22', '1', '1', 'ok', null, null);
INSERT INTO `funds_approval` VALUES ('532', '114', '180', '2014-04-14 20:46:48', '1', '2', '29000', null, null);
INSERT INTO `funds_approval` VALUES ('533', '114', '180', '2014-04-14 20:47:12', '1', '3', '29000', null, null);
INSERT INTO `funds_approval` VALUES ('534', '114', '180', '2014-04-14 20:47:48', '1', '4', '29000', null, null);
INSERT INTO `funds_approval` VALUES ('535', '114', '180', '2014-04-14 20:48:07', '1', '5', '29000', null, null);
INSERT INTO `funds_approval` VALUES ('536', '115', '180', '2014-04-14 20:53:31', '0', '0', '', null, null);
INSERT INTO `funds_approval` VALUES ('537', '115', '180', '2014-04-14 20:53:54', '1', '1', 'aaa', null, null);
INSERT INTO `funds_approval` VALUES ('538', '115', '180', '2014-04-14 20:54:46', '1', '3', 'zzzzz', null, null);
INSERT INTO `funds_approval` VALUES ('539', '115', '180', '2014-04-14 20:55:05', '1', '4', 'xxxx', null, null);
INSERT INTO `funds_approval` VALUES ('540', '115', '180', '2014-04-14 20:55:15', '1', '5', 'bbbbb', null, null);
INSERT INTO `funds_approval` VALUES ('541', '116', '64', '2014-05-06 12:51:10', '0', '0', '', null, null);
INSERT INTO `funds_approval` VALUES ('542', '112', '180', '2014-05-06 12:51:22', '1', '1', '123', null, null);
INSERT INTO `funds_approval` VALUES ('543', '116', '64', '2014-05-06 12:54:56', '1', '1', '123', null, null);
INSERT INTO `funds_approval` VALUES ('544', '116', '180', '2014-05-06 12:55:06', '1', '3', '123', null, null);
INSERT INTO `funds_approval` VALUES ('545', '116', '180', '2014-05-06 12:55:12', '1', '4', '123', null, null);
INSERT INTO `funds_approval` VALUES ('546', '116', '180', '2014-05-06 12:55:23', '1', '5', '123', null, null);
INSERT INTO `funds_approval` VALUES ('547', '116', '180', '2014-05-06 12:55:36', '1', '6', '123', '长宁疾控数据库修改文档-20140418.doc', 'file/jfgl/O2EYA_1399352141135.doc');
INSERT INTO `funds_approval` VALUES ('548', '112', '180', '2014-06-11 10:16:21', '-1', '2', '通过', null, null);
INSERT INTO `funds_approval` VALUES ('549', '112', '180', '2014-06-11 10:17:37', '1', '1', '通过', null, null);

-- ----------------------------
-- Table structure for `meeting_room_apply`
-- ----------------------------
DROP TABLE IF EXISTS `meeting_room_apply`;
CREATE TABLE `meeting_room_apply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `meeting_room_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `apply_staff_id` int(11) NOT NULL,
  `apply_time` datetime NOT NULL,
  `meeting_start_time` datetime NOT NULL,
  `meeting_end_time` datetime NOT NULL,
  `meeting_theme` varchar(255) NOT NULL,
  `meeting_content` varchar(255) DEFAULT NULL,
  `meeting_staff_count` int(11) NOT NULL,
  `meeting_staff_names` varchar(255) NOT NULL,
  `meeting_device_ids` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `audit_staff_id` int(11) DEFAULT NULL,
  `audit_time` datetime DEFAULT NULL,
  `status` int(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meeting_room_apply
-- ----------------------------
INSERT INTO `meeting_room_apply` VALUES ('5', '6', '2', '21', '2013-12-26 00:00:00', '2013-12-26 00:00:00', '2013-12-27 00:00:00', '额范文芳', '分为氛围', '2', '得得，威迪文', '1,2,3', '为地方问问', '0', '2013-12-26 17:39:09', '1');
INSERT INTO `meeting_room_apply` VALUES ('6', '4', '2', '21', '2013-12-26 17:55:20', '2013-12-26 00:00:00', '2013-12-27 00:00:00', '为单位的', '威迪文', '5', '的，二次，德辅道，耳朵肥肥，饿的的', '', '', '0', '2013-12-26 17:55:33', '-1');
INSERT INTO `meeting_room_apply` VALUES ('7', '4', '2', '21', '2013-12-26 19:28:02', '2013-12-26 00:00:00', '2013-12-28 00:00:00', '肥肉', '而非如', '343', '为氛围威风威风为而非为', '3,4,5', '', '0', '2013-12-26 19:28:10', '1');
INSERT INTO `meeting_room_apply` VALUES ('8', '1', '2', '21', '2014-01-20 20:26:51', '2014-01-20 00:00:00', '2014-01-31 00:00:00', 'wedwedwd', 'wdwedew', '30', 'deede', '', '', '0', '2014-02-20 16:56:02', '-1');
INSERT INTO `meeting_room_apply` VALUES ('9', '4', '2', '21', '2014-02-20 16:16:34', '2014-02-21 08:30:00', '2014-02-21 11:30:00', '11112312312', '123123123', '-1171844173', '123123123123', '1,2,8', '1231231212312', null, null, '-1');
INSERT INTO `meeting_room_apply` VALUES ('10', '3', '2', '21', '2014-02-20 16:28:21', '2014-02-21 08:30:00', '2014-02-21 11:30:00', 'sdsfsdf', 'sfsdf', '11', '123123132', '1', '123123123', '0', '2014-02-20 16:56:09', '-1');
INSERT INTO `meeting_room_apply` VALUES ('11', '1', '1', '60', '2014-02-26 19:49:28', '2014-03-01 08:30:00', '2014-03-01 11:30:00', '1231', '3123123', '2', '123123', '1,2,8', '123123', '0', '2014-02-26 19:49:41', '1');
INSERT INTO `meeting_room_apply` VALUES ('12', '2', '8', '175', '2014-03-04 15:42:59', '2014-03-07 08:30:00', '2014-03-07 11:30:00', '测试', '测试', '2', '测试', '4,5,6', '测试', '0', '2014-03-11 15:38:00', '1');
INSERT INTO `meeting_room_apply` VALUES ('13', '1', '8', '175', '2014-03-11 15:36:49', '2014-03-12 08:30:00', '2014-03-12 11:30:00', '1', '1', '1', '1', '1', '1', '0', '2014-03-11 15:38:03', '-1');
INSERT INTO `meeting_room_apply` VALUES ('14', '1', '8', '175', '2014-03-13 14:02:19', '2014-03-14 08:30:00', '2014-03-14 11:30:00', '11111', '1111', '11', '111', '1,2', '', null, null, '-1');
INSERT INTO `meeting_room_apply` VALUES ('15', '1', '8', '70', '2014-03-21 10:02:37', '2014-03-21 13:00:00', '2014-03-21 16:00:00', '111', '11', '11', '11', '', '11', null, null, '-1');
INSERT INTO `meeting_room_apply` VALUES ('16', '1', '9', '106', '2014-03-28 17:52:58', '2014-03-29 07:30:00', '2014-03-29 08:00:00', 'xxxx', 'xxxxxx', '15', 'xxxxxx', '3,8', 'xxxxxxxxx', null, null, '1');
INSERT INTO `meeting_room_apply` VALUES ('17', '1', '21', '128', '2014-03-28 18:00:53', '2014-03-29 13:00:00', '2014-03-29 13:30:00', 'xxx', 'xxxx', '20', 'xxxx', '3,8', 'xxxxxxxxxx', null, null, '-100');
INSERT INTO `meeting_room_apply` VALUES ('18', '2', '21', '128', '2014-03-28 18:31:40', '2014-03-29 07:30:00', '2014-03-29 08:00:00', 'xxxxx', 'xxxxxx', '25', 'xxxxxxxx', '1,7', 'xxxxxxxxxxxxx', null, null, '-100');
INSERT INTO `meeting_room_apply` VALUES ('19', '2', '21', '128', '2014-03-28 19:26:10', '2014-03-29 13:00:00', '2014-03-29 13:30:00', 'xxxxxxxxx', 'xxxxxxxxxx', '20', 'xxxxxxxxxx', '1,7', 'xxxxxxxxxxx', '0', '2014-03-28 19:28:20', '1');
INSERT INTO `meeting_room_apply` VALUES ('20', '3', '6', '180', '2014-03-28 19:33:34', '2014-03-29 07:30:00', '2014-03-29 08:00:00', 'xxxx', 'xxxxxxx', '15', 'xxxxxx', '3,8', 'xxxxxxx', null, null, '1');
INSERT INTO `meeting_room_apply` VALUES ('21', '1', '6', '180', '2014-04-14 21:35:24', '2014-04-15 13:00:00', '2014-04-15 13:30:00', '234', '234', '12', '234', '3,10', '', null, null, '1');
INSERT INTO `meeting_room_apply` VALUES ('22', '1', '20', '64', '2014-05-04 13:19:35', '2014-05-04 13:00:00', '2014-05-04 13:30:00', '12312', '1231', '12', '312312', '3', '123123123', '0', '2014-05-04 13:19:49', '-1');
INSERT INTO `meeting_room_apply` VALUES ('23', '1', '6', '180', '2014-05-06 13:12:40', '2014-05-06 13:00:00', '2014-05-06 13:30:00', '123', '132', '12', '123', '3,8', '123131233', null, null, '1');
INSERT INTO `meeting_room_apply` VALUES ('24', '1', '20', '64', '2014-05-06 13:21:47', '2014-05-07 07:30:00', '2014-05-07 08:00:00', '12312', '12', '12', '12', '3,8', '1212', '0', '2014-05-06 13:21:54', '1');
INSERT INTO `meeting_room_apply` VALUES ('25', '1', '6', '180', '2014-06-13 10:51:15', '2014-06-13 07:30:00', '2014-06-13 08:00:00', '123123123', '', '0', ' ', '5,6', '', null, null, '1');

-- ----------------------------
-- Table structure for `meeting_room_device`
-- ----------------------------
DROP TABLE IF EXISTS `meeting_room_device`;
CREATE TABLE `meeting_room_device` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `device_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meeting_room_device
-- ----------------------------
INSERT INTO `meeting_room_device` VALUES ('1', '音响');
INSERT INTO `meeting_room_device` VALUES ('3', '网络');
INSERT INTO `meeting_room_device` VALUES ('4', '会标');
INSERT INTO `meeting_room_device` VALUES ('5', '指示牌');
INSERT INTO `meeting_room_device` VALUES ('6', '水果');
INSERT INTO `meeting_room_device` VALUES ('7', '茶水');
INSERT INTO `meeting_room_device` VALUES ('8', '席卡');
INSERT INTO `meeting_room_device` VALUES ('10', '投影');

-- ----------------------------
-- Table structure for `meeting_room_info`
-- ----------------------------
DROP TABLE IF EXISTS `meeting_room_info`;
CREATE TABLE `meeting_room_info` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `address` varchar(200) DEFAULT NULL,
  `max_count_use` int(10) NOT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `device_ids` varchar(255) DEFAULT NULL,
  `device_names` varchar(255) DEFAULT NULL,
  `active` int(2) NOT NULL,
  `start_time` date DEFAULT NULL,
  `end_time` date DEFAULT NULL,
  `status` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meeting_room_info
-- ----------------------------
INSERT INTO `meeting_room_info` VALUES ('1', '7楼会议室', null, '20', '', '3,4,5,6,7,8,10', '网络,会标,指示牌,水果,茶水,席卡,投影', '1', null, null, '1');
INSERT INTO `meeting_room_info` VALUES ('2', '9楼大会议室', null, '110', '', '1,3,4,5,6,7,8,10', '音响,网络,会标,指示牌,水果,茶水,席卡,投影', '1', null, null, '1');
INSERT INTO `meeting_room_info` VALUES ('3', '10楼防病办', null, '30', '', '3,4,5,6,7,8,10', '网络,会标,指示牌,水果,茶水,席卡,投影', '1', null, null, '1');
INSERT INTO `meeting_room_info` VALUES ('4', '10楼小会议室', null, '20', '', '3,4,5,6,7,8,9,10', '网线,会标,指示牌,水果,茶水,席卡,空调,投影', '1', null, null, '1');
INSERT INTO `meeting_room_info` VALUES ('5', '11楼会议室', null, '50', '', '', '', '-1', null, null, '1');
INSERT INTO `meeting_room_info` VALUES ('6', '12楼会议室', '12楼', '60', '', '9,10', '空调,投影', '1', '2013-12-12', '2013-12-31', '0');
INSERT INTO `meeting_room_info` VALUES ('7', '13楼会议室', '13楼会议室', '110', '', '', '', '1', null, null, '0');
INSERT INTO `meeting_room_info` VALUES ('8', '6楼会议室', '6楼会议室', '23', '', '', '', '1', null, null, '0');

-- ----------------------------
-- Table structure for `menu_info`
-- ----------------------------
DROP TABLE IF EXISTS `menu_info`;
CREATE TABLE `menu_info` (
  `key` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `parent_key` varchar(10) DEFAULT NULL,
  `status` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu_info
-- ----------------------------
INSERT INTO `menu_info` VALUES ('1', '车辆管理', null, null, '1');
INSERT INTO `menu_info` VALUES ('2', '经费管理', null, null, '1');
INSERT INTO `menu_info` VALUES ('3', '物品采购', null, null, '1');
INSERT INTO `menu_info` VALUES ('4', '供应商管理', null, null, '1');
INSERT INTO `menu_info` VALUES ('5', '固定资产管理', null, null, '1');
INSERT INTO `menu_info` VALUES ('6', '电子工资单', null, null, '1');
INSERT INTO `menu_info` VALUES ('7', '人员管理', null, null, '1');
INSERT INTO `menu_info` VALUES ('1_1', '用车申请', null, '1', '1');
INSERT INTO `menu_info` VALUES ('1_2', '车辆信息', null, '1', '1');
INSERT INTO `menu_info` VALUES ('1_1_2', '用车申请记录创建', '', '1_1', '1');
INSERT INTO `menu_info` VALUES ('1_1_1', '用车申请记录查询', null, '1_1', '1');
INSERT INTO `menu_info` VALUES ('1_1_3', '用车申请记录审批', null, '1_1', '1');
INSERT INTO `menu_info` VALUES ('8_2_3', '删除', '/hysgl/xxwh/del.do', '8_2', '1');
INSERT INTO `menu_info` VALUES ('1_2_1', '车辆信息列表', '/clgl/clxx/list.do', '1_2', '1');
INSERT INTO `menu_info` VALUES ('1_2_2', '车辆信息详情', '/clgl/clxx/info.do', '1_2', '1');
INSERT INTO `menu_info` VALUES ('1_2_3', '车辆信息修改', '/clgl/clxx/update.do', '1_2', '1');
INSERT INTO `menu_info` VALUES ('1_2_4', '车辆信息删除', '/clgl/clxx/delete.do', '1_2', '1');
INSERT INTO `menu_info` VALUES ('1_2_5', '车辆信息添加', '/clgl/clxx/add.do', '1_2', '1');
INSERT INTO `menu_info` VALUES ('4_1', '供应商信息', null, '4', '1');
INSERT INTO `menu_info` VALUES ('4_2', '供应商物品采购查询', null, '4', '1');
INSERT INTO `menu_info` VALUES ('4_3', '供应商年度评审记录', null, '4', '1');
INSERT INTO `menu_info` VALUES ('4_1_1', '供应商信息列表', '/gysgl/gysxx/list.do', '4_1', '1');
INSERT INTO `menu_info` VALUES ('4_1_2', '供应商信息详情', '/gysgl/gysxx/info.do', '4_1', '1');
INSERT INTO `menu_info` VALUES ('4_1_3', '供应商信息修改', '/gysgl/gysxx/update.do', '4_1', '1');
INSERT INTO `menu_info` VALUES ('4_1_4', '供应商信息添加', '/gysgl/gysxx/add.do', '4_1', '1');
INSERT INTO `menu_info` VALUES ('4_1_5', '供应商证书信息', null, '4_1', '1');
INSERT INTO `menu_info` VALUES ('4_1_5_1', '供应商证书信息列表', '/gysgl/gysxx/zsxx/list.do', '4_1_5', '1');
INSERT INTO `menu_info` VALUES ('4_1_5_2', '供应商证书信息详情', '/gysgl/gysxx/zsxx/info.do', '4_1_5', '1');
INSERT INTO `menu_info` VALUES ('4_1_5_3', '供应商证书信息修改', '/gysgl/gysxx/zsxx/update.do', '4_1_5', '1');
INSERT INTO `menu_info` VALUES ('4_1_5_4', '供应商证书信息删除', '/gysgl/gysxx/zsxx/delete.do', '4_1_5', '1');
INSERT INTO `menu_info` VALUES ('4_1_5_5', '供应商证书信息添加', '/gysgl/gysxx/zsxx/add.do', '4_1_5', '1');
INSERT INTO `menu_info` VALUES ('4_2_1', '供应商物品采购列表', '/gysgl/gyscgcx/listByOrder.do', '4_2', '1');
INSERT INTO `menu_info` VALUES ('4_3_1', '供应商年度评审记录列表', '/gysgl/gysnj/list.do', '4_3', '1');
INSERT INTO `menu_info` VALUES ('4_3_2', '供应商年度评审记录添加', '/gysgl/gysnj/add.do', '4_3', '1');
INSERT INTO `menu_info` VALUES ('5_1_5', '归还', '/gdzcgl/zcxx/updateStatus.do', '5_1', '1');
INSERT INTO `menu_info` VALUES ('5_1', '资产信息', null, '5', '1');
INSERT INTO `menu_info` VALUES ('5_1_1', '资产信息列表', '/gdzcgl/zcxx/list.do', '5_1', '1');
INSERT INTO `menu_info` VALUES ('5_1_2', '资产信息修改', '/gdzcgl/zcxx/update.do', '5_1', '1');
INSERT INTO `menu_info` VALUES ('5_1_3', '资产信息添加', '/gdzcgl/zcxx/add.do', '5_1', '1');
INSERT INTO `menu_info` VALUES ('5_1_4', '发放', '/gdzcgl/zcxx/updateStatus.do', '5_1', '1');
INSERT INTO `menu_info` VALUES ('5_1_6', '维修', '/gdzcgl/zcxx/updateStatus.do', '5_1', '1');
INSERT INTO `menu_info` VALUES ('5_1_7', '正常使用', '/gdzcgl/zcxx/updateStatus.do', '5_1', '1');
INSERT INTO `menu_info` VALUES ('7_1', '基本信息', null, '7', '1');
INSERT INTO `menu_info` VALUES ('7_2', '分管范围设置', null, '7', '1');
INSERT INTO `menu_info` VALUES ('7_1_1', '基本信息列表', '/rygl/jbxx/list.do', '7_1', '1');
INSERT INTO `menu_info` VALUES ('7_1_2', '基本信息详情', '/rygl/jbxx/info.do', '7_1', '1');
INSERT INTO `menu_info` VALUES ('7_1_3', '基本信息修改', '/rygl/jbxx/update.do', '7_1', '1');
INSERT INTO `menu_info` VALUES ('7_1_4', '基本信息添加', '/rygl/jbxx/add.do', '7_1', '1');
INSERT INTO `menu_info` VALUES ('8_2_4', '详情', '/hysgl/xxwh/info.do', '8_2', '1');
INSERT INTO `menu_info` VALUES ('8_3', '数据字典设置', null, '8', '1');
INSERT INTO `menu_info` VALUES ('1_3', '数据字典设置', '', '1', '1');
INSERT INTO `menu_info` VALUES ('2_1', '经费申请', null, '2', '1');
INSERT INTO `menu_info` VALUES ('2_2', '部门审批', null, '2', '1');
INSERT INTO `menu_info` VALUES ('2_3', '财务审批', null, '2', '1');
INSERT INTO `menu_info` VALUES ('2_4', '分管审批', null, '2', '1');
INSERT INTO `menu_info` VALUES ('2_5', '中心审批', null, '2', '1');
INSERT INTO `menu_info` VALUES ('2_6', '“三中一大”审批', null, '2', '1');
INSERT INTO `menu_info` VALUES ('2_1_1', '经费申请列表', '/jfgl/list.do', '2_1', '1');
INSERT INTO `menu_info` VALUES ('2_1_2', '经费申请添加', '/jfgl/add.do', '2_1', '1');
INSERT INTO `menu_info` VALUES ('6_1', '工资单模板', null, '6', '1');
INSERT INTO `menu_info` VALUES ('6_2', '工资单管理', null, '6', '1');
INSERT INTO `menu_info` VALUES ('6_3', '我的工资单', null, '6', '1');
INSERT INTO `menu_info` VALUES ('6_4', '工资单查询', null, '6', '1');
INSERT INTO `menu_info` VALUES ('6_1_1', '工资单模板列表', '/dzgzd/gzdgl/gzdmbxz/list.do', '6_1', '1');
INSERT INTO `menu_info` VALUES ('6_1_2', '工资单模板添加', '/xtsz/gzdsz/djmbsz/add.do', '6_1', '1');
INSERT INTO `menu_info` VALUES ('6_1_3', '工资单模板下载', '/dzgzd/gzdgl/gzdmbxz/export.do', '6_1', '1');
INSERT INTO `menu_info` VALUES ('6_2_1', '工资单批次列表', '/dzgzd/gzdgl/gzdpc/list.do', '6_2', '1');
INSERT INTO `menu_info` VALUES ('6_2_5', '工资单明细', null, '6_2', '1');
INSERT INTO `menu_info` VALUES ('6_2_4', '工资单批次删除', '/dzgzd/gzdgl/gzdpc/del.do', '6_2', '1');
INSERT INTO `menu_info` VALUES ('6_2_3', '工资单批次发布', '/dzgzd/gzdgl/gzdpc/release.do', '6_2', '1');
INSERT INTO `menu_info` VALUES ('6_2_2', '工资单批次添加', '/dzgzd/gzdgl/gzdpc/add.do', '6_2', '1');
INSERT INTO `menu_info` VALUES ('6_2_5_1', '工资单明细列表', '/dzgzd/gzdgl/gzdpc/gzdxx/list.do', '6_2_5', '1');
INSERT INTO `menu_info` VALUES ('6_2_6', '上传本月工资单', '/dzgzd/gzdgl/gzdpc/gzdxx/add.do', '6_2', '1');
INSERT INTO `menu_info` VALUES ('6_2_5_2', '批量上传工资单', '/dzgzd/gzdgl/gzdpc/gzdxx/add.do', '6_2_5', '1');
INSERT INTO `menu_info` VALUES ('6_2_5_3', '工资单明细详情', '/dzgzd/gzdgl/gzdpc/gzdxx/info.do', '6_2_5', '1');
INSERT INTO `menu_info` VALUES ('6_2_5_4', '工资单明细修改', '/dzgzd/gzdgl/gzdpc/gzdxx/update.do', '6_2_5', '1');
INSERT INTO `menu_info` VALUES ('6_2_5_5', '工资单明细删除', '/dzgzd/gzdgl/gzdpc/gzdxx/del.do', '6_2_5', '1');
INSERT INTO `menu_info` VALUES ('6_3_1', '我的工资单列表', '/dzgzd/wdgzd/list.do', '6_3', '1');
INSERT INTO `menu_info` VALUES ('6_3_2', '我的工资单详情', '/dzgzd/wdgzd/read.do', '6_3', '1');
INSERT INTO `menu_info` VALUES ('6_4_1', '工资单查询列表', '/dzgzd/wdgzd/listByTable.do', '6_4', '1');
INSERT INTO `menu_info` VALUES ('6_4_2', '工资单详情', '/dzgzd/wdgzd/read.do', '6_4', '1');
INSERT INTO `menu_info` VALUES ('3_1', '采购查询（所有）', null, '3', '1');
INSERT INTO `menu_info` VALUES ('3_2', '采购登记', null, '3', '1');
INSERT INTO `menu_info` VALUES ('3_3', '科室采购', null, '3', '1');
INSERT INTO `menu_info` VALUES ('3_4', '政府采购', null, '3', '1');
INSERT INTO `menu_info` VALUES ('3_5', '集中采购', null, '3', '1');
INSERT INTO `menu_info` VALUES ('3_6', '比价审核', null, '3', '1');
INSERT INTO `menu_info` VALUES ('3_8', '资产验收', null, '3', '1');
INSERT INTO `menu_info` VALUES ('3_9', '资产入库', null, '3', '1');
INSERT INTO `menu_info` VALUES ('3_1_1', '采购查询列表', '/wpcg/list.do', '3_1', '1');
INSERT INTO `menu_info` VALUES ('2_1_3', '经费申请详情', '/jfgl/info.do', '2_1', '1');
INSERT INTO `menu_info` VALUES ('7_1_5', '人员编号校准', null, '7_1', '1');
INSERT INTO `menu_info` VALUES ('2_2_1', '部门审批列表', '/jfgl/list.do', '2_2', '1');
INSERT INTO `menu_info` VALUES ('2_2_2', '部门审批详情', '/jfgl/info.do', '2_2', '1');
INSERT INTO `menu_info` VALUES ('2_2_3', '部门审批', '/jfgl/approval.do', '2_2', '1');
INSERT INTO `menu_info` VALUES ('2_3_1', '财务审批列表', '/jfgl/list.do', '2_3', '1');
INSERT INTO `menu_info` VALUES ('2_3_2', '财务审批详情', '/jfgl/info.do', '2_3', '1');
INSERT INTO `menu_info` VALUES ('2_3_3', '财务审批', '/jfgl/approval.do', '2_3', '1');
INSERT INTO `menu_info` VALUES ('2_4_1', '分管审批列表', '/jfgl/list.do', '2_4', '1');
INSERT INTO `menu_info` VALUES ('2_4_2', '分管审批详情', '/jfgl/info.do', '2_4', '1');
INSERT INTO `menu_info` VALUES ('2_4_3', '分管审批', '/jfgl/approval.do', '2_4', '1');
INSERT INTO `menu_info` VALUES ('2_5_1', '中心审批列表', '/jfgl/list.do', '2_5', '1');
INSERT INTO `menu_info` VALUES ('2_5_2', '中心审批详情', '/jfgl/info.do', '2_5', '1');
INSERT INTO `menu_info` VALUES ('2_5_3', '中心审批', '/jfgl/approval.do', '2_5', '1');
INSERT INTO `menu_info` VALUES ('2_6_1', '“三中一大”审批列表', '/jfgl/list.do', '2_6', '1');
INSERT INTO `menu_info` VALUES ('2_6_2', '“三中一大”审批详情', '/jfgl/info.do', '2_6', '1');
INSERT INTO `menu_info` VALUES ('2_6_3', '“三中一大”审批', '/jfgl/approval.do', '2_6', '1');
INSERT INTO `menu_info` VALUES ('3_1_2', '采购查询详情', '/wpcg/info.do', '3_1', '1');
INSERT INTO `menu_info` VALUES ('3_2_1', '经费列表', '/wpcg/fundsApplyInfoList.do', '3_2', '1');
INSERT INTO `menu_info` VALUES ('3_2_2', '发起采购申请', '/wpcg/initAdd.do', '3_2', '1');
INSERT INTO `menu_info` VALUES ('3_3_1', '查询', '', '3_3', '1');
INSERT INTO `menu_info` VALUES ('3_3_2', '变更、删除', '', '3_3', '1');
INSERT INTO `menu_info` VALUES ('3_4_1', '查询', '', '3_4', '1');
INSERT INTO `menu_info` VALUES ('3_4_2', '变更、删除', '', '3_4', '1');
INSERT INTO `menu_info` VALUES ('3_5_1', '查询', '', '3_5', '1');
INSERT INTO `menu_info` VALUES ('3_5_2', '变更、删除', '', '3_5', '1');
INSERT INTO `menu_info` VALUES ('3_6_1', '查询', '', '3_6', '1');
INSERT INTO `menu_info` VALUES ('3_6_2', '审核', '', '3_6', '1');
INSERT INTO `menu_info` VALUES ('3_8_1', '资产验收列表', '/wpcg/list.do', '3_8', '1');
INSERT INTO `menu_info` VALUES ('3_8_2', '详情', '/wpcg/info.do', '3_8', '1');
INSERT INTO `menu_info` VALUES ('3_9_1', '资产入库列表', '/wpcg/list.do', '3_9', '1');
INSERT INTO `menu_info` VALUES ('3_9_2', '详情', '/wpcg/info.do', '3_9', '1');
INSERT INTO `menu_info` VALUES ('6_5', '我的工资单总计', null, '6', '1');
INSERT INTO `menu_info` VALUES ('6_6', '工资单总计', null, '6', '1');
INSERT INTO `menu_info` VALUES ('6_7', '工资单明细总计', null, '6', '1');
INSERT INTO `menu_info` VALUES ('3_7', '采购查询（部门）', null, '3', '1');
INSERT INTO `menu_info` VALUES ('3_7_1', '查询、导出', '', '3_7', '1');
INSERT INTO `menu_info` VALUES ('3_8_3', '验收', '/wpcg/acceptance.do', '3_8', '1');
INSERT INTO `menu_info` VALUES ('3_9_3', '入库', '/wpcg/storage.do', '3_9', '1');
INSERT INTO `menu_info` VALUES ('2_7', '经费申请查询统计', '', '2', '1');
INSERT INTO `menu_info` VALUES ('2_7_1', '个人查询', '', '2_7', '1');
INSERT INTO `menu_info` VALUES ('2_7_2', '部门查询', '', '2_7', '1');
INSERT INTO `menu_info` VALUES ('3_1_3', '导出', '/wpcg/exportData.do', '3_1', '1');
INSERT INTO `menu_info` VALUES ('8', '会议室申请', null, null, '1');
INSERT INTO `menu_info` VALUES ('8_1', '会议室申请', null, '8', '1');
INSERT INTO `menu_info` VALUES ('8_1_1', '会议室申请记录查询', '', '8_1', '1');
INSERT INTO `menu_info` VALUES ('8_1_2', '会议室申请记录新增', '', '8_1', '1');
INSERT INTO `menu_info` VALUES ('8_1_3', '会议室申请记录审批', null, '8_1', '1');
INSERT INTO `menu_info` VALUES ('8_2', '会议室管理', null, '8', '1');
INSERT INTO `menu_info` VALUES ('8_2_1', '新增', '/hysgl/xxwh/add.do', '8_2', '1');
INSERT INTO `menu_info` VALUES ('8_2_2', '修改', '/hysgl/xxwh/update.do', '8_2', '1');
INSERT INTO `menu_info` VALUES ('7_3', '科室职位设置', null, '7', '1');
INSERT INTO `menu_info` VALUES ('2_8', '数据字典设置', null, '2', '1');
INSERT INTO `menu_info` VALUES ('4_4', '数据字典设置', null, '4', '1');
INSERT INTO `menu_info` VALUES ('5_2', '数据字典设置', null, '5', '1');
INSERT INTO `menu_info` VALUES ('7_4', '数据字典设置', null, '7', '1');
INSERT INTO `menu_info` VALUES ('5_1_8', '打印标签', '', '5_1', '1');
INSERT INTO `menu_info` VALUES ('2_7_3', '所有查询', null, '2_7', '1');
INSERT INTO `menu_info` VALUES ('2_7_4', '数据导出', null, '2_7', '1');
INSERT INTO `menu_info` VALUES ('2_9', '质管科审核', null, '2', '1');
INSERT INTO `menu_info` VALUES ('2_9_1', '查询', null, '2_9', '1');
INSERT INTO `menu_info` VALUES ('2_9_2', '审批', '', '2_9', '1');

-- ----------------------------
-- Table structure for `msg_info`
-- ----------------------------
DROP TABLE IF EXISTS `msg_info`;
CREATE TABLE `msg_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `msg_type` int(11) NOT NULL,
  `msg_title` varchar(255) NOT NULL,
  `msg_content` text NOT NULL,
  `msg_status` int(2) NOT NULL,
  `msg_sender` int(11) NOT NULL,
  `msg_addressee` int(11) NOT NULL,
  `msg_time` date NOT NULL,
  `msg_time1` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of msg_info
-- ----------------------------
INSERT INTO `msg_info` VALUES ('1', '0', '用车申请驳回', '', '1', '0', '64', '2014-05-04', null);
INSERT INTO `msg_info` VALUES ('2', '0', '会议室申请驳回', '您有一条会议室申请被驳回。目的地：null，出车时间：null，回车时间：null。', '1', '0', '64', '2014-05-04', null);
INSERT INTO `msg_info` VALUES ('4', '0', '用车申请通过', '您有一条用车申请被通过。目的地：111，出车时间：2014-06-14 07:30:00.0，回车时间：2014-06-14 16:30:00.0。', '0', '0', '66', '2014-06-13', null);
INSERT INTO `msg_info` VALUES ('5', '0', '用车申请取消', '您有一条用车申请被取消。目的地：111，出车时间：2014-06-14 07:30:00.0，回车时间：2014-06-14 16:30:00.0。', '0', '0', '66', '2014-06-13', null);
INSERT INTO `msg_info` VALUES ('6', '0', '用车申请取消', '您有一条用车申请被取消。目的地：123123，出车时间：2014-06-14 07:30:00.0，回车时间：2014-06-14 16:30:00.0。', '1', '0', '180', '2014-06-13', null);

-- ----------------------------
-- Table structure for `payroll_batch`
-- ----------------------------
DROP TABLE IF EXISTS `payroll_batch`;
CREATE TABLE `payroll_batch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `create_time` date NOT NULL,
  `release_time` date DEFAULT NULL,
  `status` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of payroll_batch
-- ----------------------------
INSERT INTO `payroll_batch` VALUES ('8', '4', '2014-01-05', '2014-05-05', '2015-02-14', '1');
INSERT INTO `payroll_batch` VALUES ('9', '27', '20140210', '2014-02-10', null, '1');
INSERT INTO `payroll_batch` VALUES ('10', '4', 'xxxx', '2014-02-14', '2014-03-19', '1');
INSERT INTO `payroll_batch` VALUES ('11', '4', '2014-3-5', '2014-03-19', null, '1');
INSERT INTO `payroll_batch` VALUES ('12', '4', '111', '2014-03-20', '2014-06-16', '1');
INSERT INTO `payroll_batch` VALUES ('13', '5', '111', '2014-05-29', '2014-05-29', '1');

-- ----------------------------
-- Table structure for `payroll_column_info`
-- ----------------------------
DROP TABLE IF EXISTS `payroll_column_info`;
CREATE TABLE `payroll_column_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `column_name` varchar(50) NOT NULL,
  `column_type` varchar(50) NOT NULL,
  `column_length` int(11) NOT NULL,
  `column_required` int(2) NOT NULL,
  `column_auto` int(2) DEFAULT '0',
  `column_default` varchar(50) NOT NULL,
  `remark` text,
  `index_num` int(11) NOT NULL,
  `system` int(2) NOT NULL DEFAULT '0',
  `status` int(2) NOT NULL,
  `create_time` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of payroll_column_info
-- ----------------------------
INSERT INTO `payroll_column_info` VALUES ('1', '0', '记录编号', 'id', 'int', '11', '1', '1', '', '记录编号', '1', '1', '1', '2013-11-28');
INSERT INTO `payroll_column_info` VALUES ('2', '0', '工资批次编号', 'batch_id', 'int', '11', '1', '0', '', '工资批次编号', '2', '1', '1', '2013-11-28');
INSERT INTO `payroll_column_info` VALUES ('3', '0', '员工姓名', 'staff_name', 'varchar', '50', '1', '0', '', '员工姓名', '4', '1', '1', '2013-11-28');
INSERT INTO `payroll_column_info` VALUES ('5', '0', '合计', 'wage_sum', 'double', '0', '1', '0', '', '工资总和', '100', '1', '1', '2013-11-28');
INSERT INTO `payroll_column_info` VALUES ('26', '0', '阅读状态', 'read_status', 'int', '11', '1', '0', '0', '工资条被工资条所属人阅读的状态。0-未阅读，1-已阅读。', '103', '1', '1', '2013-12-02');
INSERT INTO `payroll_column_info` VALUES ('32', '4', '岗位工资', 'gwgz', 'double', '0', '1', '0', '0', '岗位工资', '11', '0', '1', '2013-12-15');
INSERT INTO `payroll_column_info` VALUES ('33', '4', '薪级工资', 'xjgz', 'double', '0', '1', '0', '0', '薪级工资', '12', '0', '1', '2013-12-15');
INSERT INTO `payroll_column_info` VALUES ('34', '4', '车贴', 'ct', 'double', '0', '1', '0', '0', '车贴', '13', '0', '1', '2013-12-15');
INSERT INTO `payroll_column_info` VALUES ('35', '4', '粮油', 'ly', 'double', '0', '1', '0', '0', '粮油', '14', '0', '1', '2013-12-15');
INSERT INTO `payroll_column_info` VALUES ('36', '4', '护贴', 'ht', 'double', '0', '1', '0', '0', '护贴', '15', '0', '1', '2013-12-15');
INSERT INTO `payroll_column_info` VALUES ('37', '4', '防疫津贴', 'fyjt', 'double', '0', '1', '0', '0', '防疫津贴', '16', '0', '1', '2013-12-15');
INSERT INTO `payroll_column_info` VALUES ('38', '4', '独子', 'dz', 'double', '0', '1', '0', '0', '独子', '17', '0', '1', '2013-12-15');
INSERT INTO `payroll_column_info` VALUES ('39', '4', '加发', 'jf', 'double', '0', '1', '0', '0', '加发', '18', '0', '1', '2013-12-15');
INSERT INTO `payroll_column_info` VALUES ('40', '4', '应发', 'yf', 'double', '0', '1', '0', '0', '应发', '19', '0', '1', '2013-12-15');
INSERT INTO `payroll_column_info` VALUES ('41', '4', '扣除', 'kc', 'double', '0', '1', '0', '0', '扣除', '20', '0', '1', '2013-12-15');
INSERT INTO `payroll_column_info` VALUES ('42', '0', '备注', 'bz', 'text', '0', '0', '0', '', '备注', '101', '0', '1', '2013-12-15');
INSERT INTO `payroll_column_info` VALUES ('43', '5', '保留', 'bl', 'double', '0', '1', '0', '0', '保留', '11', '0', '1', '2013-12-15');
INSERT INTO `payroll_column_info` VALUES ('44', '5', '职岗津贴', 'zgjt', 'double', '0', '1', '0', '0', '职岗津贴', '12', '0', '1', '2013-12-15');
INSERT INTO `payroll_column_info` VALUES ('45', '5', '地差', 'dc', 'double', '0', '1', '0', '0', '地差', '13', '0', '1', '2013-12-15');
INSERT INTO `payroll_column_info` VALUES ('46', '5', '书报', 'sb', 'double', '0', '1', '0', '0', '书报', '14', '0', '1', '2013-12-15');
INSERT INTO `payroll_column_info` VALUES ('47', '5', '技术贴', 'jst', 'double', '0', '1', '0', '0', '技术贴', '15', '0', '0', '2013-12-15');
INSERT INTO `payroll_column_info` VALUES ('48', '5', '通讯', 'tx', 'double', '0', '1', '0', '0', '通讯', '16', '0', '1', '2013-12-15');
INSERT INTO `payroll_column_info` VALUES ('49', '5', '双岗', 'sg', 'double', '0', '1', '0', '0', '双岗', '17', '0', '0', '2013-12-15');
INSERT INTO `payroll_column_info` VALUES ('50', '5', '物价', 'wj', 'double', '0', '1', '0', '0', '物价', '18', '0', '1', '2013-12-15');
INSERT INTO `payroll_column_info` VALUES ('51', '5', '生津', 'sj', 'double', '0', '1', '0', '0', '生津', '19', '0', '1', '2013-12-15');
INSERT INTO `payroll_column_info` VALUES ('52', '5', '房贴', 'ft', 'double', '0', '1', '0', '0', '房贴', '20', '0', '1', '2013-12-15');
INSERT INTO `payroll_column_info` VALUES ('53', '5', '医疗贴', 'ylt', 'double', '0', '1', '0', '0', '医疗贴', '21', '0', '1', '2013-12-15');
INSERT INTO `payroll_column_info` VALUES ('54', '5', '加发', 'jf', 'double', '0', '1', '0', '0', '加发', '22', '0', '1', '2013-12-15');
INSERT INTO `payroll_column_info` VALUES ('55', '5', '应发', 'yf', 'double', '0', '1', '0', '0', '应发', '23', '0', '1', '2013-12-15');
INSERT INTO `payroll_column_info` VALUES ('56', '5', '扣除', 'kc', 'double', '0', '1', '0', '0', '扣除', '24', '0', '1', '2013-12-15');
INSERT INTO `payroll_column_info` VALUES ('57', '6', '分值', 'fz', 'double', '0', '1', '0', '0', '分值', '11', '0', '1', '2013-12-15');
INSERT INTO `payroll_column_info` VALUES ('58', '6', '奖金', 'jj', 'double', '0', '1', '0', '0', '奖金', '12', '0', '1', '2013-12-15');
INSERT INTO `payroll_column_info` VALUES ('59', '6', '工龄奖', 'glj', 'double', '0', '1', '0', '0', '工龄奖', '13', '0', '1', '2013-12-15');
INSERT INTO `payroll_column_info` VALUES ('60', '6', '干部津贴', 'gbjt', 'double', '0', '1', '0', '0', '干部津贴', '14', '0', '1', '2013-12-15');
INSERT INTO `payroll_column_info` VALUES ('61', '6', '加班费', 'jbf', 'double', '0', '1', '0', '0', '加班费', '15', '0', '0', '2013-12-15');
INSERT INTO `payroll_column_info` VALUES ('62', '6', '加发', 'qtj', 'double', '0', '1', '0', '0', '其他（加）', '16', '0', '1', '2013-12-15');
INSERT INTO `payroll_column_info` VALUES ('63', '6', '公积金', 'gjj', 'double', '0', '1', '0', '0', '公积金', '17', '0', '1', '2013-12-15');
INSERT INTO `payroll_column_info` VALUES ('64', '6', '养老金', 'ylj', 'double', '0', '1', '0', '0', '养老金', '18', '0', '1', '2013-12-15');
INSERT INTO `payroll_column_info` VALUES ('65', '6', '医保金', 'ybj', 'double', '0', '1', '0', '0', '医保金', '19', '0', '1', '2013-12-15');
INSERT INTO `payroll_column_info` VALUES ('66', '6', '失业金', 'syj', 'double', '0', '1', '0', '0', '失业金', '20', '0', '1', '2013-12-15');
INSERT INTO `payroll_column_info` VALUES ('67', '6', '个人税', 'grs', 'double', '0', '1', '0', '0', '个人税', '21', '0', '1', '2013-12-15');
INSERT INTO `payroll_column_info` VALUES ('68', '6', '工会经费', 'ghjf', 'double', '0', '1', '0', '0', '工会经费', '22', '0', '1', '2013-12-15');
INSERT INTO `payroll_column_info` VALUES ('69', '6', '其他（减）', 'qtj1', 'double', '0', '1', '0', '0', '其他（减）', '23', '0', '1', '2013-12-15');
INSERT INTO `payroll_column_info` VALUES ('70', '0', '系统编号', 'staff_id', 'int', '11', '1', '0', '0', '员工系统编号', '3', '1', '1', '2013-12-16');
INSERT INTO `payroll_column_info` VALUES ('71', '0', '发布状态', 'release_status', 'int', '11', '1', '0', '0', '发布状态', '104', '1', '1', '2014-01-21');
INSERT INTO `payroll_column_info` VALUES ('72', '9', 'test', 'test', 'text', '0', '0', '0', '', '', '80', '0', '1', '2014-02-10');
INSERT INTO `payroll_column_info` VALUES ('74', '10', 'test1', 'test1', 'text', '0', '0', '0', '', '', '20', '0', '1', '2014-02-10');
INSERT INTO `payroll_column_info` VALUES ('75', '5', '加班费', 'jbf', 'double', '0', '1', '0', '0', '加班费', '17', '0', '1', '2014-05-29');

-- ----------------------------
-- Table structure for `payroll_entry`
-- ----------------------------
DROP TABLE IF EXISTS `payroll_entry`;
CREATE TABLE `payroll_entry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `batch_id` int(11) NOT NULL,
  `staff_name` varchar(50) NOT NULL,
  `wage_sum` double NOT NULL,
  `read_status` int(11) NOT NULL DEFAULT '0',
  `bz` text,
  `staff_id` int(11) NOT NULL DEFAULT '0',
  `release_status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=477 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of payroll_entry
-- ----------------------------
INSERT INTO `payroll_entry` VALUES ('358', '12', '何晓定', '1423', '0', '备注', '125', '1');
INSERT INTO `payroll_entry` VALUES ('359', '12', '庄建林', '1621', '0', '备注', '84', '1');
INSERT INTO `payroll_entry` VALUES ('360', '12', '张泽申', '3564', '0', '备注', '67', '1');
INSERT INTO `payroll_entry` VALUES ('361', '12', '刘海温', '1645', '0', '备注', '135', '1');
INSERT INTO `payroll_entry` VALUES ('362', '12', '薛慈玲', '1577', '0', '备注', '165', '1');
INSERT INTO `payroll_entry` VALUES ('363', '12', '章洁', '2015', '0', '备注', '95', '1');
INSERT INTO `payroll_entry` VALUES ('364', '12', '朱红', '2324', '0', '备注', '70', '1');
INSERT INTO `payroll_entry` VALUES ('365', '12', '钮春瑾', '1605', '0', '备注', '169', '1');
INSERT INTO `payroll_entry` VALUES ('366', '12', '陆劭勣', '1500', '1', '备注', '175', '1');
INSERT INTO `payroll_entry` VALUES ('367', '12', '张佳蕾', '1423', '0', '备注', '116', '1');
INSERT INTO `payroll_entry` VALUES ('368', '12', '刘雯', '1423', '0', '备注', '74', '1');
INSERT INTO `payroll_entry` VALUES ('369', '12', '秦倩', '1473', '0', '备注', '96', '1');
INSERT INTO `payroll_entry` VALUES ('370', '12', '王世雄', '1917', '0', '备注', '139', '1');
INSERT INTO `payroll_entry` VALUES ('371', '12', '贾海昌', '2089', '0', '备注', '97', '1');
INSERT INTO `payroll_entry` VALUES ('372', '12', '崔兆华', '2054', '0', '备注', '99', '1');
INSERT INTO `payroll_entry` VALUES ('373', '12', '袁红妹', '1621', '0', '备注', '183', '1');
INSERT INTO `payroll_entry` VALUES ('374', '12', '孙振海', '1616', '0', '备注', '153', '1');
INSERT INTO `payroll_entry` VALUES ('375', '12', '卫鹭', '1415', '0', '备注', '88', '1');
INSERT INTO `payroll_entry` VALUES ('376', '12', '夏仪', '1467', '0', '备注', '77', '1');
INSERT INTO `payroll_entry` VALUES ('377', '12', '徐仁芳', '2266', '0', '备注', '75', '1');
INSERT INTO `payroll_entry` VALUES ('378', '12', '李颖', '2933', '0', '备注', '174', '1');
INSERT INTO `payroll_entry` VALUES ('379', '12', '袁祖英', '1907', '0', '备注', '102', '1');
INSERT INTO `payroll_entry` VALUES ('380', '12', '汤泓', '1719', '0', '备注', '157', '1');
INSERT INTO `payroll_entry` VALUES ('381', '12', '姜璎慈', '1559', '0', '备注', '141', '1');
INSERT INTO `payroll_entry` VALUES ('382', '12', '田芳', '1667', '0', '备注', '90', '1');
INSERT INTO `payroll_entry` VALUES ('383', '12', '殷为申', '1345', '0', '备注', '103', '1');
INSERT INTO `payroll_entry` VALUES ('384', '12', '刘小祥', '1695', '0', '备注', '162', '1');
INSERT INTO `payroll_entry` VALUES ('385', '12', '戴维佳', '0', '0', '3月起产假，6月停发，3月工资待扣', '73', '1');
INSERT INTO `payroll_entry` VALUES ('386', '12', '庞红', '1745', '0', '备注', '170', '1');
INSERT INTO `payroll_entry` VALUES ('387', '12', '施玮', '1719', '0', '备注', '163', '1');
INSERT INTO `payroll_entry` VALUES ('388', '12', '江燕', '1649', '0', '备注', '168', '1');
INSERT INTO `payroll_entry` VALUES ('389', '12', '戴恒玮', '1387', '0', '备注', '138', '1');
INSERT INTO `payroll_entry` VALUES ('390', '12', '鲁嘉妮', '1371', '0', '备注', '89', '1');
INSERT INTO `payroll_entry` VALUES ('391', '12', '吴国莉', '1463', '0', '备注', '115', '1');
INSERT INTO `payroll_entry` VALUES ('392', '12', '刘俊', '1863', '0', '备注', '79', '1');
INSERT INTO `payroll_entry` VALUES ('393', '12', '潘金羊', '1885', '0', '备注', '154', '1');
INSERT INTO `payroll_entry` VALUES ('394', '12', '徐慧萍', '1719', '0', '备注', '105', '1');
INSERT INTO `payroll_entry` VALUES ('395', '12', '吴金贵', '2968', '0', '备注', '177', '1');
INSERT INTO `payroll_entry` VALUES ('396', '12', '唐传喜', '1675', '0', '备注', '155', '1');
INSERT INTO `payroll_entry` VALUES ('397', '12', '卢国良', '1719', '0', '备注', '179', '1');
INSERT INTO `payroll_entry` VALUES ('398', '12', '徐建兴', '2979', '0', '备注', '113', '1');
INSERT INTO `payroll_entry` VALUES ('399', '12', '顾萍', '2164', '0', '备注', '98', '1');
INSERT INTO `payroll_entry` VALUES ('400', '12', '金蓓', '1987', '0', '备注', '178', '1');
INSERT INTO `payroll_entry` VALUES ('401', '12', '尹宁', '1529', '0', '备注', '167', '1');
INSERT INTO `payroll_entry` VALUES ('402', '12', '张霞', '1689', '0', '备注', '156', '1');
INSERT INTO `payroll_entry` VALUES ('403', '12', '仇晓敏', '2031', '0', '备注', '81', '1');
INSERT INTO `payroll_entry` VALUES ('404', '12', '倪莹青', '2037', '0', '备注', '107', '1');
INSERT INTO `payroll_entry` VALUES ('405', '12', '朱晓华', '1821', '0', '备注', '173', '1');
INSERT INTO `payroll_entry` VALUES ('406', '12', '郑敏', '1607', '0', '备注', '158', '1');
INSERT INTO `payroll_entry` VALUES ('407', '12', '王震宇', '1599', '0', '备注', '109', '1');
INSERT INTO `payroll_entry` VALUES ('408', '12', '沈阳', '2098', '0', '备注', '123', '1');
INSERT INTO `payroll_entry` VALUES ('409', '12', '黄颖', '1741', '0', '备注', '144', '1');
INSERT INTO `payroll_entry` VALUES ('410', '12', '戴寅妍', '1387', '0', '备注', '119', '1');
INSERT INTO `payroll_entry` VALUES ('411', '12', '高祯', '1371', '0', '备注', '86', '1');
INSERT INTO `payroll_entry` VALUES ('412', '12', '蔡蔚', '2031', '0', '备注', '130', '1');
INSERT INTO `payroll_entry` VALUES ('413', '12', '沈斌', '1651', '0', '备注', '137', '1');
INSERT INTO `payroll_entry` VALUES ('414', '12', '胡梅陵', '1759', '0', '备注', '147', '1');
INSERT INTO `payroll_entry` VALUES ('415', '12', '孙嘉孺', '1623', '0', '备注', '146', '1');
INSERT INTO `payroll_entry` VALUES ('416', '12', '陆芸婷', '2427', '0', '补发薪级工资', '148', '1');
INSERT INTO `payroll_entry` VALUES ('417', '12', '徐彦', '1419', '0', '备注', '131', '1');
INSERT INTO `payroll_entry` VALUES ('418', '12', '冯冠华', '1913', '0', '备注', '181', '1');
INSERT INTO `payroll_entry` VALUES ('419', '12', '胡越', '2405', '0', '备注', '64', '1');
INSERT INTO `payroll_entry` VALUES ('420', '12', '王建雄', '1418', '0', '备注', '152', '1');
INSERT INTO `payroll_entry` VALUES ('421', '12', '刘军', '1459', '0', '备注', '151', '1');
INSERT INTO `payroll_entry` VALUES ('422', '12', '蔡恩茂', '2233', '0', '备注', '85', '1');
INSERT INTO `payroll_entry` VALUES ('423', '12', '沈辉', '1519', '0', '备注', '161', '1');
INSERT INTO `payroll_entry` VALUES ('424', '12', '邬竞宙', '1541', '0', '备注', '69', '1');
INSERT INTO `payroll_entry` VALUES ('425', '12', '许浩', '2143', '0', '备注', '68', '1');
INSERT INTO `payroll_entry` VALUES ('426', '12', '黄德生', '2640', '0', '备注', '66', '1');
INSERT INTO `payroll_entry` VALUES ('427', '12', '夏庆华', '2693', '0', '备注', '114', '1');
INSERT INTO `payroll_entry` VALUES ('428', '12', '丛远征', '1607', '0', '备注', '164', '1');
INSERT INTO `payroll_entry` VALUES ('429', '12', '王晓亮', '1328', '0', '备注', '159', '1');
INSERT INTO `payroll_entry` VALUES ('430', '12', '李玉华', '1443', '0', '备注', '92', '1');
INSERT INTO `payroll_entry` VALUES ('431', '12', '张磊', '1423', '0', '备注', '122', '1');
INSERT INTO `payroll_entry` VALUES ('432', '12', '周方家', '1405', '0', '备注', '149', '1');
INSERT INTO `payroll_entry` VALUES ('433', '12', '张云', '1701', '0', '备注', '111', '1');
INSERT INTO `payroll_entry` VALUES ('434', '12', '潘绍卿', '1473', '0', '备注', '166', '1');
INSERT INTO `payroll_entry` VALUES ('435', '12', '张姣艳', '1370', '0', '备注', '110', '1');
INSERT INTO `payroll_entry` VALUES ('436', '12', '王晶', '1561', '0', '备注', '171', '1');
INSERT INTO `payroll_entry` VALUES ('437', '12', '胡嘉', '1485', '0', '备注', '140', '1');
INSERT INTO `payroll_entry` VALUES ('438', '12', '姜玉', '1621', '0', '备注', '83', '1');
INSERT INTO `payroll_entry` VALUES ('439', '12', '李伟荣', '2284', '0', '备注', '72', '1');
INSERT INTO `payroll_entry` VALUES ('440', '12', '周鹏', '1671', '0', '备注', '124', '1');
INSERT INTO `payroll_entry` VALUES ('441', '12', '郑文蔚', '2053', '0', '备注', '91', '1');
INSERT INTO `payroll_entry` VALUES ('442', '12', '李丁芳', '1399', '0', '备注', '172', '1');
INSERT INTO `payroll_entry` VALUES ('443', '12', '褚秀娟', '1559', '0', '备注', '150', '1');
INSERT INTO `payroll_entry` VALUES ('444', '12', '胡文华', '1408', '0', '备注', '182', '1');
INSERT INTO `payroll_entry` VALUES ('445', '12', '唐宝根', '1045', '0', '备注', '189', '1');
INSERT INTO `payroll_entry` VALUES ('446', '12', '李毛弟', '280', '0', '备注', '188', '1');
INSERT INTO `payroll_entry` VALUES ('447', '12', '钱蕾', '1285', '0', '备注', '112', '1');
INSERT INTO `payroll_entry` VALUES ('448', '12', '徐晓意', '1285', '0', '备注', '117', '1');
INSERT INTO `payroll_entry` VALUES ('449', '12', '王苇沁', '1285', '0', '备注', '118', '1');
INSERT INTO `payroll_entry` VALUES ('450', '12', '吕嗣翔', '1241', '0', '备注', '108', '1');
INSERT INTO `payroll_entry` VALUES ('451', '12', '曾素清', '1649', '0', '备注', '76', '1');
INSERT INTO `payroll_entry` VALUES ('452', '12', '陆颖', '1493', '0', '备注', '186', '1');
INSERT INTO `payroll_entry` VALUES ('453', '12', '仇玉珍', '1689', '0', '备注', '185', '1');
INSERT INTO `payroll_entry` VALUES ('454', '12', '徐唐胜', '2400', '0', '备注', '184', '1');
INSERT INTO `payroll_entry` VALUES ('455', '12', '陆忠胜', '1849', '0', '备注', '176', '1');
INSERT INTO `payroll_entry` VALUES ('456', '12', '赵琦', '1657', '0', '备注', '160', '1');
INSERT INTO `payroll_entry` VALUES ('457', '12', '王国强', '1710', '0', '备注', '187', '1');
INSERT INTO `payroll_entry` VALUES ('458', '12', '黄峥', '2173', '0', '备注', '145', '1');
INSERT INTO `payroll_entry` VALUES ('459', '12', '毕磊', '1443', '0', '备注', '120', '1');
INSERT INTO `payroll_entry` VALUES ('460', '12', '林征', '1753', '0', '备注', '104', '1');
INSERT INTO `payroll_entry` VALUES ('461', '12', '贾迎春', '1923', '0', '备注', '93', '1');
INSERT INTO `payroll_entry` VALUES ('462', '12', '张岭', '1863', '0', '备注', '94', '1');
INSERT INTO `payroll_entry` VALUES ('463', '12', '郭家胤', '1453', '0', '备注', '87', '1');
INSERT INTO `payroll_entry` VALUES ('464', '12', '倪佳琳', '1773', '0', '备注', '101', '1');
INSERT INTO `payroll_entry` VALUES ('465', '12', '党劲梅', '1857', '0', '备注', '100', '1');
INSERT INTO `payroll_entry` VALUES ('466', '12', '许珺', '1453', '0', '备注', '132', '1');
INSERT INTO `payroll_entry` VALUES ('467', '12', '梁卫玖', '1943', '0', '备注', '82', '1');
INSERT INTO `payroll_entry` VALUES ('468', '12', '陈玉兰', '1423', '0', '备注', '142', '1');
INSERT INTO `payroll_entry` VALUES ('469', '12', '金晶', '1443', '0', '备注', '133', '1');
INSERT INTO `payroll_entry` VALUES ('470', '12', '李胤颖', '1285', '0', '备注', '143', '1');
INSERT INTO `payroll_entry` VALUES ('471', '12', '陈国平', '2129', '0', '备注', '136', '1');
INSERT INTO `payroll_entry` VALUES ('472', '12', '袁秀芳', '2115', '0', '备注', '80', '1');
INSERT INTO `payroll_entry` VALUES ('473', '12', '俞进明', '2054', '0', '备注', '126', '1');
INSERT INTO `payroll_entry` VALUES ('474', '12', '路瑶', '1445', '0', '备注', '128', '1');
INSERT INTO `payroll_entry` VALUES ('475', '12', '李纪龙', '1593', '0', '备注', '129', '1');
INSERT INTO `payroll_entry` VALUES ('476', '12', '石屏', '1649', '0', '备注', '127', '1');

-- ----------------------------
-- Table structure for `payroll_entry_1387095737`
-- ----------------------------
DROP TABLE IF EXISTS `payroll_entry_1387095737`;
CREATE TABLE `payroll_entry_1387095737` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `batch_id` int(11) NOT NULL,
  `staff_name` varchar(50) NOT NULL,
  `wage_sum` double NOT NULL,
  `read_status` int(11) NOT NULL DEFAULT '0',
  `bz` text,
  `gwgz` double NOT NULL DEFAULT '0',
  `xjgz` double NOT NULL DEFAULT '0',
  `ct` double NOT NULL DEFAULT '0',
  `ly` double NOT NULL DEFAULT '0',
  `ht` double NOT NULL DEFAULT '0',
  `fyjt` double NOT NULL DEFAULT '0',
  `dz` double NOT NULL DEFAULT '0',
  `jf` double NOT NULL DEFAULT '0',
  `yf` double NOT NULL DEFAULT '0',
  `kc` double NOT NULL DEFAULT '0',
  `staff_id` int(11) NOT NULL DEFAULT '0',
  `release_status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=477 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of payroll_entry_1387095737
-- ----------------------------
INSERT INTO `payroll_entry_1387095737` VALUES ('358', '12', '何晓定', '1423', '0', '备注', '590', '233', '440', '6', '0', '154', '0', '0', '1423', '0', '125', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('359', '12', '庄建林', '1621', '0', '备注', '680', '341', '440', '6', '0', '154', '0', '0', '1621', '0', '84', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('360', '12', '张泽申', '3564', '0', '备注', '1630', '1334', '440', '6', '0', '154', '0', '0', '3564', '0', '67', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('361', '12', '刘海温', '1645', '0', '备注', '680', '365', '440', '6', '0', '154', '0', '0', '1645', '0', '135', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('362', '12', '薛慈玲', '1577', '0', '备注', '680', '253', '440', '6', '0', '198', '0', '0', '1577', '0', '165', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('363', '12', '章洁', '2015', '0', '备注', '930', '499', '440', '6', '0', '110', '30', '0', '2015', '0', '95', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('364', '12', '朱红', '2324', '0', '备注', '780', '944', '440', '6', '0', '154', '0', '0', '2324', '0', '70', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('365', '12', '钮春瑾', '1605', '0', '备注', '680', '295', '440', '6', '0', '154', '30', '0', '1605', '0', '169', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('366', '12', '陆劭勣', '1500', '1', '备注', '590', '295', '440', '6', '0', '110', '0', '0', '1500', '0', '175', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('367', '12', '张佳蕾', '1423', '0', '备注', '590', '233', '440', '6', '0', '154', '0', '0', '1423', '0', '116', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('368', '12', '刘雯', '1423', '0', '备注', '590', '233', '440', '6', '0', '154', '0', '0', '1423', '0', '74', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('369', '12', '秦倩', '1473', '0', '备注', '590', '253', '440', '6', '0', '154', '30', '0', '1473', '0', '96', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('370', '12', '王世雄', '1917', '0', '备注', '550', '767', '440', '6', '0', '154', '0', '0', '1917', '0', '139', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('371', '12', '贾海昌', '2089', '0', '备注', '620', '869', '440', '6', '0', '154', '0', '0', '2089', '0', '97', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('372', '12', '崔兆华', '2054', '0', '备注', '620', '834', '440', '6', '0', '154', '0', '0', '2054', '0', '99', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('373', '12', '袁红妹', '1621', '0', '备注', '545', '432', '440', '6', '0', '198', '0', '0', '1621', '0', '183', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('374', '12', '孙振海', '1616', '0', '备注', '540', '432', '440', '6', '0', '198', '0', '0', '1616', '0', '153', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('375', '12', '卫鹭', '1415', '0', '备注', '590', '181', '440', '6', '0', '198', '0', '0', '1415', '0', '88', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('376', '12', '夏仪', '1467', '0', '备注', '590', '233', '440', '6', '0', '198', '0', '0', '1467', '0', '77', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('377', '12', '徐仁芳', '2266', '0', '备注', '803', '809', '440', '6', '10', '198', '0', '0', '2266', '0', '75', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('378', '12', '李颖', '2933', '0', '备注', '1420', '869', '440', '6', '0', '198', '0', '0', '2933', '0', '174', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('379', '12', '袁祖英', '1907', '0', '备注', '620', '643', '440', '6', '0', '198', '0', '0', '1907', '0', '102', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('380', '12', '汤泓', '1719', '0', '备注', '680', '365', '440', '6', '0', '198', '30', '0', '1719', '0', '157', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('381', '12', '姜璎慈', '1559', '0', '备注', '590', '295', '440', '6', '0', '198', '30', '0', '1559', '0', '141', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('382', '12', '田芳', '1667', '0', '备注', '550', '443', '440', '6', '0', '198', '30', '0', '1667', '0', '90', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('383', '12', '殷为申', '1345', '0', '备注', '550', '151', '440', '6', '0', '198', '0', '0', '1345', '0', '103', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('384', '12', '刘小祥', '1695', '0', '备注', '680', '341', '440', '6', '0', '198', '30', '0', '1695', '0', '162', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('385', '12', '戴维佳', '0', '0', '3月起产假，6月停发，3月工资待扣', '770', '0', '440', '6', '0', '198', '0', '0', '1414', '1414', '73', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('386', '12', '庞红', '1745', '0', '备注', '680', '391', '440', '6', '0', '198', '30', '0', '1745', '0', '170', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('387', '12', '施玮', '1719', '0', '备注', '680', '365', '440', '6', '0', '198', '30', '0', '1719', '0', '163', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('388', '12', '江燕', '1649', '0', '备注', '680', '295', '440', '6', '0', '198', '30', '0', '1649', '0', '168', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('389', '12', '戴恒玮', '1387', '0', '备注', '590', '197', '440', '6', '0', '154', '0', '0', '1387', '0', '138', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('390', '12', '鲁嘉妮', '1371', '0', '备注', '590', '181', '440', '6', '0', '154', '0', '0', '1371', '0', '89', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('391', '12', '吴国莉', '1463', '0', '备注', '590', '273', '440', '6', '0', '154', '0', '0', '1463', '0', '115', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('392', '12', '刘俊', '1863', '0', '备注', '620', '643', '440', '6', '0', '154', '0', '0', '1863', '0', '79', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('393', '12', '潘金羊', '1885', '0', '备注', '550', '735', '440', '6', '0', '154', '0', '0', '1885', '0', '154', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('394', '12', '徐慧萍', '1719', '0', '备注', '680', '365', '440', '6', '0', '198', '30', '0', '1719', '0', '105', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('395', '12', '吴金贵', '2968', '0', '备注', '1420', '904', '440', '6', '0', '198', '0', '0', '2968', '0', '177', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('396', '12', '唐传喜', '1675', '0', '备注', '680', '365', '440', '6', '0', '154', '30', '0', '1675', '0', '155', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('397', '12', '卢国良', '1719', '0', '备注', '680', '365', '440', '6', '0', '198', '30', '0', '1719', '0', '179', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('398', '12', '徐建兴', '2979', '0', '备注', '1180', '1199', '440', '6', '0', '154', '0', '0', '2979', '0', '113', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('399', '12', '顾萍', '2164', '0', '备注', '730', '834', '440', '6', '0', '154', '0', '0', '2164', '0', '98', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('400', '12', '金蓓', '1987', '0', '备注', '730', '613', '440', '6', '0', '198', '0', '0', '1987', '0', '178', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('401', '12', '尹宁', '1529', '0', '备注', '590', '295', '440', '6', '0', '198', '0', '0', '1529', '0', '167', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('402', '12', '张霞', '1689', '0', '备注', '680', '365', '440', '6', '0', '198', '0', '0', '1689', '0', '156', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('403', '12', '仇晓敏', '2031', '0', '备注', '620', '767', '440', '6', '0', '198', '0', '0', '2031', '0', '81', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('404', '12', '倪莹青', '2037', '0', '备注', '780', '583', '440', '6', '0', '198', '30', '0', '2037', '0', '107', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('405', '12', '朱晓华', '1821', '0', '备注', '730', '417', '440', '6', '0', '198', '30', '0', '1821', '0', '173', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('406', '12', '郑敏', '1607', '0', '备注', '680', '253', '440', '6', '0', '198', '30', '0', '1607', '0', '158', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('407', '12', '王震宇', '1599', '0', '备注', '590', '365', '440', '6', '0', '198', '0', '0', '1599', '0', '109', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('408', '12', '沈阳', '2098', '0', '备注', '620', '834', '440', '6', '0', '198', '0', '0', '2098', '0', '123', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('409', '12', '黄颖', '1741', '0', '备注', '680', '417', '440', '6', '0', '198', '0', '0', '1741', '0', '144', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('410', '12', '戴寅妍', '1387', '0', '备注', '590', '197', '440', '6', '0', '154', '0', '0', '1387', '0', '119', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('411', '12', '高祯', '1371', '0', '备注', '590', '181', '440', '6', '0', '154', '0', '0', '1371', '0', '86', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('412', '12', '蔡蔚', '2031', '0', '备注', '930', '471', '440', '6', '0', '154', '30', '0', '2031', '0', '130', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('413', '12', '沈斌', '1651', '0', '备注', '680', '341', '440', '6', '0', '154', '30', '0', '1651', '0', '137', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('414', '12', '胡梅陵', '1759', '0', '备注', '730', '443', '440', '6', '0', '110', '30', '0', '1759', '0', '147', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('415', '12', '孙嘉孺', '1623', '0', '备注', '620', '417', '440', '6', '0', '110', '30', '0', '1623', '0', '146', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('416', '12', '陆芸婷', '2427', '0', '补发薪级工资', '590', '233', '440', '6', '0', '110', '30', '1018', '2427', '0', '148', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('417', '12', '徐彦', '1419', '0', '备注', '590', '273', '440', '6', '0', '110', '0', '0', '1419', '0', '131', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('418', '12', '冯冠华', '1913', '0', '备注', '590', '767', '440', '6', '0', '110', '0', '0', '1913', '0', '181', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('419', '12', '胡越', '2405', '0', '备注', '1040', '735', '440', '6', '0', '154', '30', '0', '2405', '0', '64', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('420', '12', '王建雄', '1418', '0', '备注', '540', '248', '440', '6', '0', '154', '30', '0', '1418', '0', '152', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('421', '12', '刘军', '1459', '0', '备注', '540', '363', '440', '6', '0', '110', '0', '0', '1459', '0', '151', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('422', '12', '蔡恩茂', '2233', '0', '备注', '930', '703', '440', '6', '0', '154', '0', '0', '2233', '0', '85', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('423', '12', '沈辉', '1519', '0', '备注', '680', '253', '440', '6', '0', '110', '30', '0', '1519', '0', '161', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('424', '12', '邬竞宙', '1541', '0', '备注', '590', '365', '440', '6', '0', '110', '30', '0', '1541', '0', '69', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('425', '12', '许浩', '2143', '0', '备注', '930', '613', '440', '6', '0', '154', '0', '0', '2143', '0', '68', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('426', '12', '黄德生', '2640', '0', '备注', '930', '1154', '440', '6', '0', '110', '0', '0', '2640', '0', '66', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('427', '12', '夏庆华', '2693', '0', '备注', '1420', '643', '440', '6', '0', '154', '30', '0', '2693', '0', '114', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('428', '12', '丛远征', '1607', '0', '备注', '680', '341', '440', '6', '0', '110', '30', '0', '1607', '0', '164', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('429', '12', '王晓亮', '1328', '0', '备注', '540', '202', '440', '6', '0', '110', '30', '0', '1328', '0', '159', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('430', '12', '李玉华', '1443', '0', '备注', '590', '253', '440', '6', '0', '154', '0', '0', '1443', '0', '92', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('431', '12', '张磊', '1423', '0', '备注', '590', '233', '440', '6', '0', '154', '0', '0', '1423', '0', '122', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('432', '12', '周方家', '1405', '0', '备注', '590', '215', '440', '6', '0', '154', '0', '0', '1405', '0', '149', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('433', '12', '张云', '1701', '0', '备注', '680', '391', '440', '6', '0', '154', '30', '0', '1701', '0', '111', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('434', '12', '潘绍卿', '1473', '0', '备注', '590', '253', '440', '6', '0', '154', '30', '0', '1473', '0', '166', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('435', '12', '张姣艳', '1370', '0', '备注', '770', '0', '440', '6', '0', '154', '0', '0', '1370', '0', '110', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('436', '12', '王晶', '1561', '0', '备注', '590', '341', '440', '6', '0', '154', '30', '0', '1561', '0', '171', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('437', '12', '胡嘉', '1485', '0', '备注', '590', '295', '440', '6', '0', '154', '0', '0', '1485', '0', '140', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('438', '12', '姜玉', '1621', '0', '备注', '680', '341', '440', '6', '0', '154', '0', '0', '1621', '0', '83', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('439', '12', '李伟荣', '2284', '0', '备注', '780', '904', '440', '6', '0', '154', '0', '0', '2284', '0', '72', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('440', '12', '周鹏', '1671', '0', '备注', '680', '391', '440', '6', '0', '154', '0', '0', '1671', '0', '124', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('441', '12', '郑文蔚', '2053', '0', '备注', '780', '643', '440', '6', '0', '154', '30', '0', '2053', '0', '91', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('442', '12', '李丁芳', '1399', '0', '备注', '590', '253', '440', '6', '0', '110', '0', '0', '1399', '0', '172', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('443', '12', '褚秀娟', '1559', '0', '备注', '590', '295', '440', '6', '0', '198', '30', '0', '1559', '0', '150', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('444', '12', '胡文华', '1408', '0', '备注', '540', '282', '440', '6', '0', '110', '30', '0', '1408', '0', '182', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('445', '12', '唐宝根', '1045', '0', '备注', '486', '553', '0', '6', '0', '0', '0', '0', '1045', '0', '189', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('446', '12', '李毛弟', '280', '0', '备注', '280', '0', '0', '0', '0', '0', '0', '0', '280', '0', '188', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('447', '12', '钱蕾', '1285', '0', '备注', '685', '0', '440', '6', '0', '154', '0', '0', '1285', '0', '112', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('448', '12', '徐晓意', '1285', '0', '备注', '685', '0', '440', '6', '0', '154', '0', '0', '1285', '0', '117', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('449', '12', '王苇沁', '1285', '0', '备注', '685', '0', '440', '6', '0', '154', '0', '0', '1285', '0', '118', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('450', '12', '吕嗣翔', '1241', '0', '备注', '685', '0', '440', '6', '0', '110', '0', '0', '1241', '0', '108', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('451', '12', '曾素清', '1649', '0', '备注', '680', '295', '440', '6', '0', '198', '30', '0', '1649', '0', '76', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('452', '12', '陆颖', '1493', '0', '备注', '590', '273', '440', '6', '0', '154', '30', '0', '1493', '0', '186', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('453', '12', '仇玉珍', '1689', '0', '备注', '550', '583', '440', '6', '0', '110', '0', '0', '1689', '0', '185', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('454', '12', '徐唐胜', '2400', '0', '备注', '780', '1064', '440', '6', '0', '110', '0', '0', '2400', '0', '184', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('455', '12', '陆忠胜', '1849', '0', '备注', '590', '673', '440', '6', '0', '110', '30', '0', '1849', '0', '176', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('456', '12', '赵琦', '1657', '0', '备注', '680', '391', '440', '6', '0', '110', '30', '0', '1657', '0', '160', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('457', '12', '王国强', '1710', '0', '备注', '720', '984', '0', '6', '0', '0', '0', '0', '1710', '0', '187', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('458', '12', '黄峥', '2173', '0', '备注', '930', '613', '440', '6', '0', '154', '30', '0', '2173', '0', '145', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('459', '12', '毕磊', '1443', '0', '备注', '590', '253', '440', '6', '0', '154', '0', '0', '1443', '0', '120', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('460', '12', '林征', '1753', '0', '备注', '680', '443', '440', '6', '0', '154', '30', '0', '1753', '0', '104', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('461', '12', '贾迎春', '1923', '0', '备注', '680', '643', '440', '6', '0', '154', '0', '0', '1923', '0', '93', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('462', '12', '张岭', '1863', '0', '备注', '680', '583', '440', '6', '0', '154', '0', '0', '1863', '0', '94', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('463', '12', '郭家胤', '1453', '0', '备注', '590', '233', '440', '6', '0', '154', '30', '0', '1453', '0', '87', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('464', '12', '倪佳琳', '1773', '0', '备注', '730', '443', '440', '6', '0', '154', '0', '0', '1773', '0', '101', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('465', '12', '党劲梅', '1857', '0', '备注', '730', '527', '440', '6', '0', '154', '0', '0', '1857', '0', '100', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('466', '12', '许珺', '1453', '0', '备注', '590', '233', '440', '6', '0', '154', '30', '0', '1453', '0', '132', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('467', '12', '梁卫玖', '1943', '0', '备注', '730', '613', '440', '6', '0', '154', '0', '0', '1943', '0', '82', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('468', '12', '陈玉兰', '1423', '0', '备注', '590', '233', '440', '6', '0', '154', '0', '0', '1423', '0', '142', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('469', '12', '金晶', '1443', '0', '备注', '590', '253', '440', '6', '0', '154', '0', '0', '1443', '0', '133', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('470', '12', '李胤颖', '1285', '0', '备注', '685', '0', '440', '6', '0', '154', '0', '0', '1285', '0', '143', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('471', '12', '陈国平', '2129', '0', '备注', '730', '799', '440', '6', '0', '154', '0', '0', '2129', '0', '136', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('472', '12', '袁秀芳', '2115', '0', '备注', '780', '735', '440', '6', '0', '154', '0', '0', '2115', '0', '80', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('473', '12', '俞进明', '2054', '0', '备注', '620', '834', '440', '6', '0', '154', '0', '0', '2054', '0', '126', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('474', '12', '路瑶', '1445', '0', '备注', '550', '295', '440', '6', '0', '154', '0', '0', '1445', '0', '128', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('475', '12', '李纪龙', '1593', '0', '备注', '540', '409', '440', '6', '0', '198', '0', '0', '1593', '0', '129', '1');
INSERT INTO `payroll_entry_1387095737` VALUES ('476', '12', '石屏', '1649', '0', '备注', '550', '499', '440', '6', '0', '154', '0', '0', '1649', '0', '127', '1');

-- ----------------------------
-- Table structure for `payroll_entry_1387096501`
-- ----------------------------
DROP TABLE IF EXISTS `payroll_entry_1387096501`;
CREATE TABLE `payroll_entry_1387096501` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `batch_id` int(11) NOT NULL,
  `staff_name` varchar(50) NOT NULL,
  `wage_sum` double NOT NULL,
  `read_status` int(11) NOT NULL DEFAULT '0',
  `bz` text,
  `bl` double NOT NULL DEFAULT '0',
  `zgjt` double NOT NULL DEFAULT '0',
  `dc` double NOT NULL DEFAULT '0',
  `sb` double NOT NULL DEFAULT '0',
  `jst` double NOT NULL DEFAULT '0',
  `tx` double NOT NULL DEFAULT '0',
  `sg` double NOT NULL DEFAULT '0',
  `wj` double NOT NULL DEFAULT '0',
  `sj` double NOT NULL DEFAULT '0',
  `ft` double NOT NULL DEFAULT '0',
  `ylt` double NOT NULL DEFAULT '0',
  `jf` double NOT NULL DEFAULT '0',
  `yf` double NOT NULL DEFAULT '0',
  `kc` double NOT NULL DEFAULT '0',
  `staff_id` int(11) NOT NULL DEFAULT '0',
  `release_status` int(11) NOT NULL DEFAULT '0',
  `jbf` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of payroll_entry_1387096501
-- ----------------------------

-- ----------------------------
-- Table structure for `payroll_entry_1387097110`
-- ----------------------------
DROP TABLE IF EXISTS `payroll_entry_1387097110`;
CREATE TABLE `payroll_entry_1387097110` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `batch_id` int(11) NOT NULL,
  `staff_name` varchar(50) NOT NULL,
  `wage_sum` double NOT NULL,
  `read_status` int(11) NOT NULL DEFAULT '0',
  `bz` text,
  `fz` double NOT NULL DEFAULT '0',
  `jj` double NOT NULL DEFAULT '0',
  `glj` double NOT NULL DEFAULT '0',
  `gbjt` double NOT NULL DEFAULT '0',
  `jbf` double NOT NULL DEFAULT '0',
  `qtj` double NOT NULL DEFAULT '0',
  `gjj` double NOT NULL DEFAULT '0',
  `ylj` double NOT NULL DEFAULT '0',
  `ybj` double NOT NULL DEFAULT '0',
  `syj` double NOT NULL DEFAULT '0',
  `grs` double NOT NULL DEFAULT '0',
  `ghjf` double NOT NULL DEFAULT '0',
  `qtj1` double NOT NULL DEFAULT '0',
  `staff_id` int(11) NOT NULL DEFAULT '0',
  `release_status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of payroll_entry_1387097110
-- ----------------------------

-- ----------------------------
-- Table structure for `payroll_table_info`
-- ----------------------------
DROP TABLE IF EXISTS `payroll_table_info`;
CREATE TABLE `payroll_table_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `table_name` varchar(50) NOT NULL,
  `remark` text,
  `build` int(2) NOT NULL,
  `version` int(11) NOT NULL,
  `status` int(2) NOT NULL,
  `create_time` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of payroll_table_info
-- ----------------------------
INSERT INTO `payroll_table_info` VALUES ('4', '5号工资条', 'payroll_entry_1387095737', '5号工资条', '1', '1390273435', '1', '2013-12-15');
INSERT INTO `payroll_table_info` VALUES ('5', '20号工资条', 'payroll_entry_1387096501', '20号工资条', '1', '1401344454', '1', '2013-12-15');
INSERT INTO `payroll_table_info` VALUES ('6', '20号奖金条', 'payroll_entry_1387097110', '20号奖金条', '1', '1401344354', '1', '2013-12-15');

-- ----------------------------
-- Table structure for `position_info`
-- ----------------------------
DROP TABLE IF EXISTS `position_info`;
CREATE TABLE `position_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `status` int(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of position_info
-- ----------------------------
INSERT INTO `position_info` VALUES ('1', '书记', '1');
INSERT INTO `position_info` VALUES ('2', '中心主任', '1');
INSERT INTO `position_info` VALUES ('3', '中心副主任', '1');
INSERT INTO `position_info` VALUES ('4', '办公室主任', '1');
INSERT INTO `position_info` VALUES ('5', '综合办主任', '1');
INSERT INTO `position_info` VALUES ('6', '科长', '1');
INSERT INTO `position_info` VALUES ('7', '科员', '1');
INSERT INTO `position_info` VALUES ('8', '实习', '1');
INSERT INTO `position_info` VALUES ('20', '副科长', '1');
INSERT INTO `position_info` VALUES ('21', '科长助理', '1');

-- ----------------------------
-- Table structure for `purchase_order`
-- ----------------------------
DROP TABLE IF EXISTS `purchase_order`;
CREATE TABLE `purchase_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `funds_apply_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `type` int(11) DEFAULT NULL,
  `cg_type` int(11) NOT NULL DEFAULT '0',
  `money` double(11,0) NOT NULL,
  `step` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `sign_supplier_id` int(11) DEFAULT NULL,
  `sign_contract_num` varchar(255) DEFAULT NULL,
  `create_time` date NOT NULL,
  `cg_file` text,
  `ysd_key` varchar(255) DEFAULT NULL,
  `ys_staff_id` int(11) DEFAULT NULL,
  `ys_time` date DEFAULT NULL,
  `ys_file` text,
  `rkd_key` varchar(255) DEFAULT NULL,
  `rk_staff_id` int(11) DEFAULT NULL,
  `rk_time` date DEFAULT NULL,
  `zc_remark` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of purchase_order
-- ----------------------------
INSERT INTO `purchase_order` VALUES ('94', '111', 'CG-06-20140419-001', '3', '0', '0', '6', '2', '0', null, '2014-04-19', null, 'YS-06-20140419-001', '180', '2014-04-19', '长宁疾控数据库修改文档-20140418.doc,file/wpcg/zcys/82246_1397888197812.doc', 'RK-06-20140419-001', '180', '2014-04-19', null);
INSERT INTO `purchase_order` VALUES ('95', '111', 'CG-06-20140419-002', '0', '0', '0', '6', '2', '0', null, '2014-04-19', null, 'YS-06-20140419-002', '180', '2014-04-19', '', 'RK-06-20140419-002', '180', '2014-04-19', null);
INSERT INTO `purchase_order` VALUES ('96', '111', 'CG-06-20140419-003', '2', '0', '0', '2', '0', '0', null, '2014-04-19', null, null, null, null, null, null, null, null, null);
INSERT INTO `purchase_order` VALUES ('97', '115', 'CG-06-20140501-001', '0', '0', '0', '6', '2', '0', null, '2014-05-01', null, 'YS-06-20140501-001', '180', '2014-05-01', '[P4L@(AKP2VJ82`KS@}0NI6.jpg,file/wpcg/zcys/6U4U4_1398931486568.jpg', 'RK-06-20140501-001', '180', '2014-05-01', null);
INSERT INTO `purchase_order` VALUES ('101', '115', 'CG-06-20140501-005', '0', '0', '0', '2', '0', '0', null, '2014-05-01', null, null, null, null, null, null, null, null, null);
INSERT INTO `purchase_order` VALUES ('102', '115', 'CG-06-20140501-006', '0', '0', '0', '2', '0', '0', null, '2014-05-01', null, null, null, null, null, null, null, null, null);
INSERT INTO `purchase_order` VALUES ('103', '115', 'CG-06-20140502-001', '2', '0', '0', '5', '0', '0', null, '2014-05-02', null, null, null, null, null, null, null, null, '123');
INSERT INTO `purchase_order` VALUES ('104', '115', 'CG-06-20140502-002', '3', '0', '0', '6', '0', '0', null, '2014-05-02', null, 'YS-06-20140502-001', '180', '2014-05-02', '长宁疾控数据库修改文档-20140418.doc,file/wpcg/zcys/G6T2A_1398975151417.doc', null, null, null, null);
INSERT INTO `purchase_order` VALUES ('105', '115', 'CG-06-20140502-003', '0', '0', '0', '6', '0', '0', null, '2014-05-02', null, 'YS-06-20140502-002', '180', '2014-05-02', '长宁疾控数据库修改文档-20140418.doc,file/wpcg/zcys/264P8_1398975800236.doc', null, null, null, null);
INSERT INTO `purchase_order` VALUES ('106', '115', 'CG-06-20140502-004', '3', '0', '0', '5', '0', '0', null, '2014-05-02', null, null, null, null, null, null, null, null, null);
INSERT INTO `purchase_order` VALUES ('109', '114', 'CG-06-20140504-001', '2', '0', '0', '5', '0', '0', null, '2014-05-04', null, null, null, null, null, null, null, null, '100');
INSERT INTO `purchase_order` VALUES ('110', '114', 'CG-06-20140504-002', '2', '0', '0', '5', '0', '0', null, '2014-05-04', null, null, null, null, null, null, null, null, '');
INSERT INTO `purchase_order` VALUES ('111', '114', 'CG-06-20140504-003', '2', '0', '0', '5', '0', '0', null, '2014-05-04', null, null, null, null, null, null, null, null, '1000');
INSERT INTO `purchase_order` VALUES ('112', '115', 'CG-06-20140504-004', '0', '0', '0', '2', '0', '0', null, '2014-05-04', null, null, null, null, null, null, null, null, null);
INSERT INTO `purchase_order` VALUES ('114', '115', 'CG-06-20140506-001', '0', '0', '0', '5', '0', '0', null, '2014-05-06', null, null, null, null, null, null, null, null, null);
INSERT INTO `purchase_order` VALUES ('115', '115', 'CG-06-20140506-002', '2', '0', '0', '5', '0', '0', null, '2014-05-06', null, null, null, null, null, null, null, null, '12312312');
INSERT INTO `purchase_order` VALUES ('116', '114', 'CG-06-20140506-003', '0', '0', '0', '2', '0', '0', null, '2014-05-06', null, null, null, null, null, null, null, null, null);
INSERT INTO `purchase_order` VALUES ('117', '114', 'CG-06-20140506-004', '0', '0', '0', '2', '0', '0', null, '2014-05-06', null, null, null, null, null, null, null, null, null);
INSERT INTO `purchase_order` VALUES ('118', '116', 'CG-20-20140506-005', '0', '0', '0', '1', '0', '0', null, '2014-05-06', null, null, null, null, null, null, null, null, null);
INSERT INTO `purchase_order` VALUES ('119', '111', 'CG-06-20140611-001', '0', '0', '0', '2', '0', '0', null, '2014-06-11', null, null, null, null, null, null, null, null, null);
INSERT INTO `purchase_order` VALUES ('120', '116', 'CG-20-20140611-002', '0', '0', '0', '1', '0', '0', null, '2014-06-11', null, null, null, null, null, null, null, null, null);
INSERT INTO `purchase_order` VALUES ('121', '116', 'CG-20-20140611-003', '0', '0', '0', '1', '0', '0', null, '2014-06-11', null, null, null, null, null, null, null, null, null);
INSERT INTO `purchase_order` VALUES ('122', '111', 'CG-06-20140611-004', '0', '0', '0', '2', '0', '0', null, '2014-06-11', null, null, null, null, null, null, null, null, null);
INSERT INTO `purchase_order` VALUES ('123', '111', 'CG-06-20140611-005', '0', '0', '0', '2', '0', '0', null, '2014-06-11', null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `purchase_order_audit`
-- ----------------------------
DROP TABLE IF EXISTS `purchase_order_audit`;
CREATE TABLE `purchase_order_audit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `audit_staff_id` int(11) NOT NULL,
  `step` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `remark` text NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of purchase_order_audit
-- ----------------------------
INSERT INTO `purchase_order_audit` VALUES ('60', '94', '180', '2', '-1', '123123', '2014-04-19 14:15:49');
INSERT INTO `purchase_order_audit` VALUES ('61', '94', '180', '2', '1', '123132', '2014-04-19 14:16:18');
INSERT INTO `purchase_order_audit` VALUES ('62', '95', '180', '2', '-1', '123', '2014-04-19 14:17:41');
INSERT INTO `purchase_order_audit` VALUES ('63', '95', '180', '2', '1', '123', '2014-04-19 14:18:01');
INSERT INTO `purchase_order_audit` VALUES ('64', '97', '180', '2', '1', '13123', '2014-05-01 16:04:22');
INSERT INTO `purchase_order_audit` VALUES ('65', '104', '180', '2', '1', '123', '2014-05-02 03:52:58');
INSERT INTO `purchase_order_audit` VALUES ('66', '105', '180', '2', '1', '123123', '2014-05-02 04:23:05');
INSERT INTO `purchase_order_audit` VALUES ('67', '106', '180', '2', '1', '123', '2014-05-02 04:30:36');
INSERT INTO `purchase_order_audit` VALUES ('68', '114', '180', '2', '1', '123123123', '2014-05-06 03:31:29');

-- ----------------------------
-- Table structure for `purchase_order_entry`
-- ----------------------------
DROP TABLE IF EXISTS `purchase_order_entry`;
CREATE TABLE `purchase_order_entry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `funds_apply_entry_id` int(11) NOT NULL,
  `sg_amount` int(11) NOT NULL DEFAULT '0',
  `amount` int(11) NOT NULL DEFAULT '0',
  `ys_amount` int(11) NOT NULL DEFAULT '0',
  `money` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=179 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of purchase_order_entry
-- ----------------------------
INSERT INTO `purchase_order_entry` VALUES ('138', '94', '504', '1', '1', '1', '0');
INSERT INTO `purchase_order_entry` VALUES ('139', '94', '505', '1', '0', '0', '0');
INSERT INTO `purchase_order_entry` VALUES ('140', '94', '506', '1', '1', '1', '0');
INSERT INTO `purchase_order_entry` VALUES ('141', '95', '504', '1', '1', '1', '0');
INSERT INTO `purchase_order_entry` VALUES ('142', '95', '505', '1', '1', '1', '0');
INSERT INTO `purchase_order_entry` VALUES ('143', '95', '506', '1', '1', '1', '0');
INSERT INTO `purchase_order_entry` VALUES ('144', '96', '504', '1', '1', '0', '0');
INSERT INTO `purchase_order_entry` VALUES ('145', '96', '505', '1', '1', '0', '0');
INSERT INTO `purchase_order_entry` VALUES ('146', '96', '506', '1', '1', '0', '0');
INSERT INTO `purchase_order_entry` VALUES ('147', '97', '526', '10', '1', '1', '0');
INSERT INTO `purchase_order_entry` VALUES ('151', '101', '526', '5', '5', '0', '0');
INSERT INTO `purchase_order_entry` VALUES ('152', '102', '526', '1', '1', '0', '0');
INSERT INTO `purchase_order_entry` VALUES ('153', '103', '526', '4', '2', '0', '0');
INSERT INTO `purchase_order_entry` VALUES ('154', '104', '526', '5', '1', '1', '0');
INSERT INTO `purchase_order_entry` VALUES ('155', '105', '526', '5', '5', '5', '0');
INSERT INTO `purchase_order_entry` VALUES ('156', '106', '526', '5', '5', '0', '0');
INSERT INTO `purchase_order_entry` VALUES ('159', '109', '521', '100', '100', '0', '0');
INSERT INTO `purchase_order_entry` VALUES ('160', '110', '521', '100', '0', '0', '0');
INSERT INTO `purchase_order_entry` VALUES ('161', '111', '521', '100', '100', '0', '0');
INSERT INTO `purchase_order_entry` VALUES ('162', '112', '526', '10', '10', '0', '0');
INSERT INTO `purchase_order_entry` VALUES ('163', '114', '526', '10', '10', '0', '10');
INSERT INTO `purchase_order_entry` VALUES ('164', '115', '526', '10', '10', '0', '100');
INSERT INTO `purchase_order_entry` VALUES ('165', '116', '521', '130', '100', '0', '10.1');
INSERT INTO `purchase_order_entry` VALUES ('166', '117', '521', '1', '1', '0', '10.11');
INSERT INTO `purchase_order_entry` VALUES ('167', '118', '533', '3', '0', '0', null);
INSERT INTO `purchase_order_entry` VALUES ('168', '119', '504', '10', '1', '0', '1');
INSERT INTO `purchase_order_entry` VALUES ('169', '119', '505', '10', '1', '0', '1');
INSERT INTO `purchase_order_entry` VALUES ('170', '119', '506', '10', '1', '0', '1');
INSERT INTO `purchase_order_entry` VALUES ('171', '120', '533', '1', '0', '0', null);
INSERT INTO `purchase_order_entry` VALUES ('172', '121', '533', '100', '0', '0', null);
INSERT INTO `purchase_order_entry` VALUES ('173', '122', '504', '1', '1', '0', '1');
INSERT INTO `purchase_order_entry` VALUES ('174', '122', '505', '1', '1', '0', '1');
INSERT INTO `purchase_order_entry` VALUES ('175', '122', '506', '1', '1', '0', '1');
INSERT INTO `purchase_order_entry` VALUES ('176', '123', '504', '1', '1', '0', '1');
INSERT INTO `purchase_order_entry` VALUES ('177', '123', '505', '1', '1', '0', '1');
INSERT INTO `purchase_order_entry` VALUES ('178', '123', '506', '1', '1', '0', '1');

-- ----------------------------
-- Table structure for `purchase_order_supplier`
-- ----------------------------
DROP TABLE IF EXISTS `purchase_order_supplier`;
CREATE TABLE `purchase_order_supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `money` double NOT NULL,
  `file_url` varchar(255) NOT NULL,
  `status` int(2) NOT NULL,
  `selected` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of purchase_order_supplier
-- ----------------------------
INSERT INTO `purchase_order_supplier` VALUES ('103', '94', '1', '111123', 'file/wpcg/868Z2_1397888175169.doc', '0', '0');
INSERT INTO `purchase_order_supplier` VALUES ('104', '94', '8', '123', 'file/wpcg/804KQ_1397888175169.doc', '1', '1');
INSERT INTO `purchase_order_supplier` VALUES ('107', '95', '1', '123', 'file/wpcg/K4R66_1397888278192.doc', '1', '1');
INSERT INTO `purchase_order_supplier` VALUES ('108', '97', '1', '1', 'file/wpcg/8I406_1398931452917.jpg', '1', '1');
INSERT INTO `purchase_order_supplier` VALUES ('109', '104', '1', '1', 'file/wpcg/4S486_1398973862258.doc', '1', '1');
INSERT INTO `purchase_order_supplier` VALUES ('110', '105', '1', '5', 'file/wpcg/N48R0_1398975768952.doc', '1', '1');
INSERT INTO `purchase_order_supplier` VALUES ('111', '102', '1', '1', 'file/wpcg/62O0Z_1398975915667.doc', '1', '0');
INSERT INTO `purchase_order_supplier` VALUES ('112', '101', '1', '5', 'file/wpcg/SF22Q_1398976016100.doc', '1', '0');
INSERT INTO `purchase_order_supplier` VALUES ('113', '106', '1', '5', 'file/wpcg/NOC2T_1398976124746.doc', '1', '1');
INSERT INTO `purchase_order_supplier` VALUES ('114', '112', '1', '1', 'file/wpcg/2W0T6_1399191254309.jpg', '1', '0');
INSERT INTO `purchase_order_supplier` VALUES ('115', '114', '1', '1', 'file/wpcg/KYZ8P_1399318008355.doc', '1', '1');
INSERT INTO `purchase_order_supplier` VALUES ('116', '116', '1', '1', 'file/wpcg/8UJRH_1399345281161.doc', '1', '0');
INSERT INTO `purchase_order_supplier` VALUES ('117', '117', '1', '1', 'file/wpcg/4L28Q_1399346028489.doc', '1', '0');
INSERT INTO `purchase_order_supplier` VALUES ('118', '119', '1', '123.1', 'file/wpcg/22466_1402458260036.xls', '1', '0');
INSERT INTO `purchase_order_supplier` VALUES ('119', '119', '8', '1000', 'file/wpcg/P24J8_1402458260036.xls', '0', '0');
INSERT INTO `purchase_order_supplier` VALUES ('120', '122', '1', '11', 'file/wpcg/26XNA_1402459818862.xls', '1', '0');
INSERT INTO `purchase_order_supplier` VALUES ('121', '123', '8', '12', 'file/wpcg/08428_1402461536051.xls', '1', '0');

-- ----------------------------
-- Table structure for `role_info`
-- ----------------------------
DROP TABLE IF EXISTS `role_info`;
CREATE TABLE `role_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `status` int(2) NOT NULL,
  `insert_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_info
-- ----------------------------
INSERT INTO `role_info` VALUES ('1', '科长', '1', '2013-08-11 11:32:58');
INSERT INTO `role_info` VALUES ('9', '业务部', '0', '2013-08-22 13:17:29');
INSERT INTO `role_info` VALUES ('10', '工程部', '0', '2013-08-22 13:17:49');
INSERT INTO `role_info` VALUES ('11', 'teshu ', '0', '2013-08-22 21:41:09');
INSERT INTO `role_info` VALUES ('12', '测试角色12', '0', '2013-08-29 11:36:15');
INSERT INTO `role_info` VALUES ('13', 'yyy', '0', '2013-10-16 10:35:32');
INSERT INTO `role_info` VALUES ('14', 'zzz', '0', '2013-10-16 10:54:27');
INSERT INTO `role_info` VALUES ('15', 'yyy', '0', '2013-10-16 11:14:45');
INSERT INTO `role_info` VALUES ('16', '采购员', '0', '2013-11-15 11:04:35');
INSERT INTO `role_info` VALUES ('17', '科员', '1', '2014-03-04 15:29:39');
INSERT INTO `role_info` VALUES ('19', '人事科长', '1', '2014-03-12 10:41:11');
INSERT INTO `role_info` VALUES ('20', '财务科长', '1', '2014-03-12 10:41:35');
INSERT INTO `role_info` VALUES ('21', '中心领导', '1', '2014-03-12 10:41:59');
INSERT INTO `role_info` VALUES ('22', '办公室管理人员', '1', '2014-03-21 09:33:07');
INSERT INTO `role_info` VALUES ('23', '管理员', '1', '2014-03-21 09:53:16');

-- ----------------------------
-- Table structure for `role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `menu_key` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2730 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_menu
-- ----------------------------
INSERT INTO `role_menu` VALUES ('1', '4', '1_1_1');
INSERT INTO `role_menu` VALUES ('2', '4', '1_1_2');
INSERT INTO `role_menu` VALUES ('3', '4', '1_1_3');
INSERT INTO `role_menu` VALUES ('4', '4', '1_1_4');
INSERT INTO `role_menu` VALUES ('5', '4', '1_1_1');
INSERT INTO `role_menu` VALUES ('6', '4', '1_1_2');
INSERT INTO `role_menu` VALUES ('7', '4', '1_1_3');
INSERT INTO `role_menu` VALUES ('8', '4', '1_1_4');
INSERT INTO `role_menu` VALUES ('9', '4', '1_2_1');
INSERT INTO `role_menu` VALUES ('10', '4', '1_2_2');
INSERT INTO `role_menu` VALUES ('11', '4', '1_2_3');
INSERT INTO `role_menu` VALUES ('12', '4', '1_2_4');
INSERT INTO `role_menu` VALUES ('17', '6', '1_3_2');
INSERT INTO `role_menu` VALUES ('18', '6', '1_3_1');
INSERT INTO `role_menu` VALUES ('27', '2', '8_1_1');
INSERT INTO `role_menu` VALUES ('28', '2', '8_1_5');
INSERT INTO `role_menu` VALUES ('29', '2', '8_1_6');
INSERT INTO `role_menu` VALUES ('30', '2', '8_1_2');
INSERT INTO `role_menu` VALUES ('45', '7', '1');
INSERT INTO `role_menu` VALUES ('46', '7', '1_1');
INSERT INTO `role_menu` VALUES ('47', '7', '1_1_1');
INSERT INTO `role_menu` VALUES ('51', '8', '5');
INSERT INTO `role_menu` VALUES ('52', '8', '5_1');
INSERT INTO `role_menu` VALUES ('53', '8', '6');
INSERT INTO `role_menu` VALUES ('54', '8', '6_1');
INSERT INTO `role_menu` VALUES ('55', '8', '6_1_1');
INSERT INTO `role_menu` VALUES ('56', '8', '6_1_2');
INSERT INTO `role_menu` VALUES ('57', '8', '7');
INSERT INTO `role_menu` VALUES ('58', '8', '7_1');
INSERT INTO `role_menu` VALUES ('59', '8', '9');
INSERT INTO `role_menu` VALUES ('60', '8', '9_1');
INSERT INTO `role_menu` VALUES ('104', '7', '1');
INSERT INTO `role_menu` VALUES ('105', '7', '1_1');
INSERT INTO `role_menu` VALUES ('106', '7', '1_1_1');
INSERT INTO `role_menu` VALUES ('107', '7', '3');
INSERT INTO `role_menu` VALUES ('108', '7', '3_1');
INSERT INTO `role_menu` VALUES ('109', '7', '3_1_1');
INSERT INTO `role_menu` VALUES ('110', '7', '3_2');
INSERT INTO `role_menu` VALUES ('111', '7', '3_2_1');
INSERT INTO `role_menu` VALUES ('112', '7', '3_2_2');
INSERT INTO `role_menu` VALUES ('113', '7', '5');
INSERT INTO `role_menu` VALUES ('114', '7', '5_2');
INSERT INTO `role_menu` VALUES ('115', '7', '5_2_1');
INSERT INTO `role_menu` VALUES ('116', '7', '5_2_1_1');
INSERT INTO `role_menu` VALUES ('117', '7', '5_7');
INSERT INTO `role_menu` VALUES ('118', '7', '6');
INSERT INTO `role_menu` VALUES ('119', '7', '6_1');
INSERT INTO `role_menu` VALUES ('120', '7', '6_1_1');
INSERT INTO `role_menu` VALUES ('121', '7', '6_1_1_1');
INSERT INTO `role_menu` VALUES ('122', '7', '6_7');
INSERT INTO `role_menu` VALUES ('123', '7', '3');
INSERT INTO `role_menu` VALUES ('124', '7', '3_1');
INSERT INTO `role_menu` VALUES ('125', '7', '3_1_1');
INSERT INTO `role_menu` VALUES ('126', '7', '3_2');
INSERT INTO `role_menu` VALUES ('127', '7', '3_2_1');
INSERT INTO `role_menu` VALUES ('128', '7', '3_2_2');
INSERT INTO `role_menu` VALUES ('129', '7', '5');
INSERT INTO `role_menu` VALUES ('130', '7', '5_2');
INSERT INTO `role_menu` VALUES ('131', '7', '5_2_1');
INSERT INTO `role_menu` VALUES ('132', '7', '5_2_1_1');
INSERT INTO `role_menu` VALUES ('133', '7', '5_7');
INSERT INTO `role_menu` VALUES ('134', '7', '6');
INSERT INTO `role_menu` VALUES ('135', '7', '6_1');
INSERT INTO `role_menu` VALUES ('136', '7', '6_1_1');
INSERT INTO `role_menu` VALUES ('137', '7', '6_1_1_1');
INSERT INTO `role_menu` VALUES ('138', '7', '6_7');
INSERT INTO `role_menu` VALUES ('139', '7', '1');
INSERT INTO `role_menu` VALUES ('140', '7', '1_1');
INSERT INTO `role_menu` VALUES ('141', '7', '1_1_1');
INSERT INTO `role_menu` VALUES ('142', '7', '3');
INSERT INTO `role_menu` VALUES ('143', '7', '3_1');
INSERT INTO `role_menu` VALUES ('144', '7', '3_1_1');
INSERT INTO `role_menu` VALUES ('145', '7', '3_2');
INSERT INTO `role_menu` VALUES ('146', '7', '3_2_1');
INSERT INTO `role_menu` VALUES ('147', '7', '3_2_2');
INSERT INTO `role_menu` VALUES ('148', '7', '5');
INSERT INTO `role_menu` VALUES ('149', '7', '5_2');
INSERT INTO `role_menu` VALUES ('150', '7', '5_2_1');
INSERT INTO `role_menu` VALUES ('151', '7', '5_2_1_1');
INSERT INTO `role_menu` VALUES ('152', '7', '5_7');
INSERT INTO `role_menu` VALUES ('153', '7', '6');
INSERT INTO `role_menu` VALUES ('154', '7', '6_1');
INSERT INTO `role_menu` VALUES ('155', '7', '6_1_1');
INSERT INTO `role_menu` VALUES ('156', '7', '6_1_1_1');
INSERT INTO `role_menu` VALUES ('157', '7', '6_7');
INSERT INTO `role_menu` VALUES ('167', '10', '1');
INSERT INTO `role_menu` VALUES ('168', '10', '1_2');
INSERT INTO `role_menu` VALUES ('169', '10', '1_2_2');
INSERT INTO `role_menu` VALUES ('170', '10', '1_2_2_1');
INSERT INTO `role_menu` VALUES ('171', '10', '1_2_2_1_1');
INSERT INTO `role_menu` VALUES ('172', '10', '1_2_2_1_2');
INSERT INTO `role_menu` VALUES ('173', '10', '1_2_2_1_3');
INSERT INTO `role_menu` VALUES ('174', '10', '1_2_2_1_4');
INSERT INTO `role_menu` VALUES ('175', '10', '1_2_2_1_5');
INSERT INTO `role_menu` VALUES ('176', '11', '1');
INSERT INTO `role_menu` VALUES ('177', '11', '1_1');
INSERT INTO `role_menu` VALUES ('178', '11', '1_1_1');
INSERT INTO `role_menu` VALUES ('179', '11', '1_1_2');
INSERT INTO `role_menu` VALUES ('180', '11', '1_1_3');
INSERT INTO `role_menu` VALUES ('181', '11', '1_1_4');
INSERT INTO `role_menu` VALUES ('182', '11', '1_1_5');
INSERT INTO `role_menu` VALUES ('183', '11', '1_2');
INSERT INTO `role_menu` VALUES ('184', '11', '1_2_1');
INSERT INTO `role_menu` VALUES ('185', '11', '1_2_1_1');
INSERT INTO `role_menu` VALUES ('186', '11', '1_2_1_2');
INSERT INTO `role_menu` VALUES ('187', '11', '1_2_1_3');
INSERT INTO `role_menu` VALUES ('188', '11', '1_2_1_4');
INSERT INTO `role_menu` VALUES ('189', '11', '1_2_2');
INSERT INTO `role_menu` VALUES ('190', '11', '1_2_2_1');
INSERT INTO `role_menu` VALUES ('191', '11', '1_2_2_1_1');
INSERT INTO `role_menu` VALUES ('192', '11', '1_2_2_1_2');
INSERT INTO `role_menu` VALUES ('193', '11', '1_2_2_1_3');
INSERT INTO `role_menu` VALUES ('194', '11', '1_2_2_1_4');
INSERT INTO `role_menu` VALUES ('195', '11', '1_2_2_1_5');
INSERT INTO `role_menu` VALUES ('196', '11', '1_2_2_2');
INSERT INTO `role_menu` VALUES ('197', '11', '1_2_2_2_1');
INSERT INTO `role_menu` VALUES ('198', '11', '1_2_2_2_3');
INSERT INTO `role_menu` VALUES ('199', '11', '1_2_2_2_2');
INSERT INTO `role_menu` VALUES ('200', '11', '1_2_2_2_4');
INSERT INTO `role_menu` VALUES ('201', '11', '1_2_2_2_5');
INSERT INTO `role_menu` VALUES ('202', '11', '1_3');
INSERT INTO `role_menu` VALUES ('203', '11', '1_3_1');
INSERT INTO `role_menu` VALUES ('204', '11', '1_3_2');
INSERT INTO `role_menu` VALUES ('205', '11', '1_3_3');
INSERT INTO `role_menu` VALUES ('206', '11', '1_3_4');
INSERT INTO `role_menu` VALUES ('207', '11', '1_3_5');
INSERT INTO `role_menu` VALUES ('208', '11', '1_4');
INSERT INTO `role_menu` VALUES ('209', '11', '1_4_1');
INSERT INTO `role_menu` VALUES ('210', '11', '1_4_2');
INSERT INTO `role_menu` VALUES ('211', '11', '1_4_3');
INSERT INTO `role_menu` VALUES ('212', '11', '1_4_4');
INSERT INTO `role_menu` VALUES ('213', '11', '1_4_5');
INSERT INTO `role_menu` VALUES ('214', '11', '1_5');
INSERT INTO `role_menu` VALUES ('215', '11', '1_5_1');
INSERT INTO `role_menu` VALUES ('216', '11', '1_5_2');
INSERT INTO `role_menu` VALUES ('217', '11', '1_5_3');
INSERT INTO `role_menu` VALUES ('218', '11', '1_5_4');
INSERT INTO `role_menu` VALUES ('219', '11', '1_5_5');
INSERT INTO `role_menu` VALUES ('220', '11', '1_5_6');
INSERT INTO `role_menu` VALUES ('221', '11', '1_6');
INSERT INTO `role_menu` VALUES ('222', '11', '1_6_1');
INSERT INTO `role_menu` VALUES ('223', '11', '1_6_2');
INSERT INTO `role_menu` VALUES ('224', '11', '1_6_3');
INSERT INTO `role_menu` VALUES ('225', '11', '1_6_4');
INSERT INTO `role_menu` VALUES ('226', '11', '1_6_5');
INSERT INTO `role_menu` VALUES ('227', '11', '1_7');
INSERT INTO `role_menu` VALUES ('228', '11', '1_8');
INSERT INTO `role_menu` VALUES ('229', '11', '1_9');
INSERT INTO `role_menu` VALUES ('230', '11', '3');
INSERT INTO `role_menu` VALUES ('231', '11', '3_1');
INSERT INTO `role_menu` VALUES ('232', '11', '3_1_1');
INSERT INTO `role_menu` VALUES ('233', '11', '3_1_2');
INSERT INTO `role_menu` VALUES ('234', '11', '3_1_3');
INSERT INTO `role_menu` VALUES ('235', '11', '3_1_4');
INSERT INTO `role_menu` VALUES ('236', '11', '3_1_5');
INSERT INTO `role_menu` VALUES ('237', '11', '3_2');
INSERT INTO `role_menu` VALUES ('238', '11', '3_2_1');
INSERT INTO `role_menu` VALUES ('239', '11', '3_2_2');
INSERT INTO `role_menu` VALUES ('240', '11', '5');
INSERT INTO `role_menu` VALUES ('241', '11', '5_1');
INSERT INTO `role_menu` VALUES ('242', '11', '5_1_1');
INSERT INTO `role_menu` VALUES ('243', '11', '5_1_2');
INSERT INTO `role_menu` VALUES ('244', '11', '5_1_3');
INSERT INTO `role_menu` VALUES ('245', '11', '5_1_4');
INSERT INTO `role_menu` VALUES ('246', '11', '5_1_5');
INSERT INTO `role_menu` VALUES ('247', '11', '5_2');
INSERT INTO `role_menu` VALUES ('248', '11', '5_2_1');
INSERT INTO `role_menu` VALUES ('249', '11', '5_2_1_1');
INSERT INTO `role_menu` VALUES ('250', '11', '5_2_1_2');
INSERT INTO `role_menu` VALUES ('251', '11', '5_2_1_3');
INSERT INTO `role_menu` VALUES ('252', '11', '5_2_1_4');
INSERT INTO `role_menu` VALUES ('253', '11', '5_2_1_5');
INSERT INTO `role_menu` VALUES ('254', '11', '5_2_2');
INSERT INTO `role_menu` VALUES ('255', '11', '5_2_2_1');
INSERT INTO `role_menu` VALUES ('256', '11', '5_2_2_2');
INSERT INTO `role_menu` VALUES ('257', '11', '5_2_2_3');
INSERT INTO `role_menu` VALUES ('258', '11', '5_2_2_4');
INSERT INTO `role_menu` VALUES ('259', '11', '5_2_2_5');
INSERT INTO `role_menu` VALUES ('260', '11', '5_2_3');
INSERT INTO `role_menu` VALUES ('261', '11', '5_3');
INSERT INTO `role_menu` VALUES ('262', '11', '5_3_1');
INSERT INTO `role_menu` VALUES ('263', '11', '5_3_1_1');
INSERT INTO `role_menu` VALUES ('264', '11', '5_3_1_2');
INSERT INTO `role_menu` VALUES ('265', '11', '5_3_1_3');
INSERT INTO `role_menu` VALUES ('266', '11', '5_3_1_4');
INSERT INTO `role_menu` VALUES ('267', '11', '5_3_1_5');
INSERT INTO `role_menu` VALUES ('268', '11', '5_3_2');
INSERT INTO `role_menu` VALUES ('269', '11', '5_3_2_1');
INSERT INTO `role_menu` VALUES ('270', '11', '5_3_2_2');
INSERT INTO `role_menu` VALUES ('271', '11', '5_3_2_3');
INSERT INTO `role_menu` VALUES ('272', '11', '5_3_2_4');
INSERT INTO `role_menu` VALUES ('273', '11', '5_3_2_5');
INSERT INTO `role_menu` VALUES ('274', '11', '5_4');
INSERT INTO `role_menu` VALUES ('275', '11', '5_4_1');
INSERT INTO `role_menu` VALUES ('276', '11', '5_4_2');
INSERT INTO `role_menu` VALUES ('277', '11', '5_4_3');
INSERT INTO `role_menu` VALUES ('278', '11', '5_4_4');
INSERT INTO `role_menu` VALUES ('279', '11', '5_4_5');
INSERT INTO `role_menu` VALUES ('280', '11', '5_5');
INSERT INTO `role_menu` VALUES ('281', '11', '5_5_1');
INSERT INTO `role_menu` VALUES ('282', '11', '5_5_2');
INSERT INTO `role_menu` VALUES ('283', '11', '5_5_3');
INSERT INTO `role_menu` VALUES ('284', '11', '5_5_4');
INSERT INTO `role_menu` VALUES ('285', '11', '5_5_5');
INSERT INTO `role_menu` VALUES ('286', '11', '5_6');
INSERT INTO `role_menu` VALUES ('287', '11', '5_6_1');
INSERT INTO `role_menu` VALUES ('288', '11', '5_6_2');
INSERT INTO `role_menu` VALUES ('289', '11', '5_6_3');
INSERT INTO `role_menu` VALUES ('290', '11', '5_6_4');
INSERT INTO `role_menu` VALUES ('291', '11', '5_6_5');
INSERT INTO `role_menu` VALUES ('292', '11', '5_7');
INSERT INTO `role_menu` VALUES ('293', '11', '1');
INSERT INTO `role_menu` VALUES ('294', '11', '1_1');
INSERT INTO `role_menu` VALUES ('295', '11', '1_1_1');
INSERT INTO `role_menu` VALUES ('296', '11', '1_1_2');
INSERT INTO `role_menu` VALUES ('297', '11', '1_1_3');
INSERT INTO `role_menu` VALUES ('298', '11', '1_1_4');
INSERT INTO `role_menu` VALUES ('299', '11', '1_1_5');
INSERT INTO `role_menu` VALUES ('300', '11', '1_2');
INSERT INTO `role_menu` VALUES ('301', '11', '1_2_1');
INSERT INTO `role_menu` VALUES ('302', '11', '1_2_1_1');
INSERT INTO `role_menu` VALUES ('303', '11', '1_2_1_2');
INSERT INTO `role_menu` VALUES ('304', '11', '1_2_1_3');
INSERT INTO `role_menu` VALUES ('305', '11', '1_2_1_4');
INSERT INTO `role_menu` VALUES ('306', '11', '1_2_2');
INSERT INTO `role_menu` VALUES ('307', '11', '1_2_2_1');
INSERT INTO `role_menu` VALUES ('308', '11', '1_2_2_1_1');
INSERT INTO `role_menu` VALUES ('309', '11', '1_2_2_1_2');
INSERT INTO `role_menu` VALUES ('310', '11', '1_2_2_1_3');
INSERT INTO `role_menu` VALUES ('311', '11', '1_2_2_1_4');
INSERT INTO `role_menu` VALUES ('312', '11', '1_2_2_1_5');
INSERT INTO `role_menu` VALUES ('313', '11', '1_2_2_2');
INSERT INTO `role_menu` VALUES ('314', '11', '1_2_2_2_1');
INSERT INTO `role_menu` VALUES ('315', '11', '1_2_2_2_3');
INSERT INTO `role_menu` VALUES ('316', '11', '1_2_2_2_2');
INSERT INTO `role_menu` VALUES ('317', '11', '1_2_2_2_4');
INSERT INTO `role_menu` VALUES ('318', '11', '1_2_2_2_5');
INSERT INTO `role_menu` VALUES ('319', '11', '1_3');
INSERT INTO `role_menu` VALUES ('320', '11', '1_3_1');
INSERT INTO `role_menu` VALUES ('321', '11', '1_3_2');
INSERT INTO `role_menu` VALUES ('322', '11', '1_3_3');
INSERT INTO `role_menu` VALUES ('323', '11', '1_3_4');
INSERT INTO `role_menu` VALUES ('324', '11', '1_3_5');
INSERT INTO `role_menu` VALUES ('325', '11', '1_4');
INSERT INTO `role_menu` VALUES ('326', '11', '1_4_1');
INSERT INTO `role_menu` VALUES ('327', '11', '1_4_2');
INSERT INTO `role_menu` VALUES ('328', '11', '1_4_3');
INSERT INTO `role_menu` VALUES ('329', '11', '1_4_4');
INSERT INTO `role_menu` VALUES ('330', '11', '1_4_5');
INSERT INTO `role_menu` VALUES ('331', '11', '1_5');
INSERT INTO `role_menu` VALUES ('332', '11', '1_5_1');
INSERT INTO `role_menu` VALUES ('333', '11', '1_5_2');
INSERT INTO `role_menu` VALUES ('334', '11', '1_5_3');
INSERT INTO `role_menu` VALUES ('335', '11', '1_5_4');
INSERT INTO `role_menu` VALUES ('336', '11', '1_5_5');
INSERT INTO `role_menu` VALUES ('337', '11', '1_5_6');
INSERT INTO `role_menu` VALUES ('338', '11', '1_6');
INSERT INTO `role_menu` VALUES ('339', '11', '1_6_1');
INSERT INTO `role_menu` VALUES ('340', '11', '1_6_2');
INSERT INTO `role_menu` VALUES ('341', '11', '1_6_3');
INSERT INTO `role_menu` VALUES ('342', '11', '1_6_4');
INSERT INTO `role_menu` VALUES ('343', '11', '1_6_5');
INSERT INTO `role_menu` VALUES ('344', '11', '1_7');
INSERT INTO `role_menu` VALUES ('345', '11', '1_8');
INSERT INTO `role_menu` VALUES ('346', '11', '1_9');
INSERT INTO `role_menu` VALUES ('347', '11', '3');
INSERT INTO `role_menu` VALUES ('348', '11', '3_1');
INSERT INTO `role_menu` VALUES ('349', '11', '3_1_1');
INSERT INTO `role_menu` VALUES ('350', '11', '3_1_2');
INSERT INTO `role_menu` VALUES ('351', '11', '3_1_3');
INSERT INTO `role_menu` VALUES ('352', '11', '3_1_4');
INSERT INTO `role_menu` VALUES ('353', '11', '3_1_5');
INSERT INTO `role_menu` VALUES ('354', '11', '3_2');
INSERT INTO `role_menu` VALUES ('355', '11', '3_2_1');
INSERT INTO `role_menu` VALUES ('356', '11', '3_2_2');
INSERT INTO `role_menu` VALUES ('357', '11', '5');
INSERT INTO `role_menu` VALUES ('358', '11', '5_1');
INSERT INTO `role_menu` VALUES ('359', '11', '5_1_1');
INSERT INTO `role_menu` VALUES ('360', '11', '5_1_2');
INSERT INTO `role_menu` VALUES ('361', '11', '5_1_3');
INSERT INTO `role_menu` VALUES ('362', '11', '5_1_4');
INSERT INTO `role_menu` VALUES ('363', '11', '5_1_5');
INSERT INTO `role_menu` VALUES ('364', '11', '5_2');
INSERT INTO `role_menu` VALUES ('365', '11', '5_2_1');
INSERT INTO `role_menu` VALUES ('366', '11', '5_2_1_1');
INSERT INTO `role_menu` VALUES ('367', '11', '5_2_1_2');
INSERT INTO `role_menu` VALUES ('368', '11', '5_2_1_3');
INSERT INTO `role_menu` VALUES ('369', '11', '5_2_1_4');
INSERT INTO `role_menu` VALUES ('370', '11', '5_2_1_5');
INSERT INTO `role_menu` VALUES ('371', '11', '5_2_2');
INSERT INTO `role_menu` VALUES ('372', '11', '5_2_2_1');
INSERT INTO `role_menu` VALUES ('373', '11', '5_2_2_2');
INSERT INTO `role_menu` VALUES ('374', '11', '5_2_2_3');
INSERT INTO `role_menu` VALUES ('375', '11', '5_2_2_4');
INSERT INTO `role_menu` VALUES ('376', '11', '5_2_2_5');
INSERT INTO `role_menu` VALUES ('377', '11', '5_2_3');
INSERT INTO `role_menu` VALUES ('378', '11', '5_3');
INSERT INTO `role_menu` VALUES ('379', '11', '5_3_1');
INSERT INTO `role_menu` VALUES ('380', '11', '5_3_1_1');
INSERT INTO `role_menu` VALUES ('381', '11', '5_3_1_2');
INSERT INTO `role_menu` VALUES ('382', '11', '5_3_1_3');
INSERT INTO `role_menu` VALUES ('383', '11', '5_3_1_4');
INSERT INTO `role_menu` VALUES ('384', '11', '5_3_1_5');
INSERT INTO `role_menu` VALUES ('385', '11', '5_3_2');
INSERT INTO `role_menu` VALUES ('386', '11', '5_3_2_1');
INSERT INTO `role_menu` VALUES ('387', '11', '5_3_2_2');
INSERT INTO `role_menu` VALUES ('388', '11', '5_3_2_3');
INSERT INTO `role_menu` VALUES ('389', '11', '5_3_2_4');
INSERT INTO `role_menu` VALUES ('390', '11', '5_3_2_5');
INSERT INTO `role_menu` VALUES ('391', '11', '5_4');
INSERT INTO `role_menu` VALUES ('392', '11', '5_4_1');
INSERT INTO `role_menu` VALUES ('393', '11', '5_4_2');
INSERT INTO `role_menu` VALUES ('394', '11', '5_4_3');
INSERT INTO `role_menu` VALUES ('395', '11', '5_4_4');
INSERT INTO `role_menu` VALUES ('396', '11', '5_4_5');
INSERT INTO `role_menu` VALUES ('397', '11', '5_5');
INSERT INTO `role_menu` VALUES ('398', '11', '5_5_1');
INSERT INTO `role_menu` VALUES ('399', '11', '5_5_2');
INSERT INTO `role_menu` VALUES ('400', '11', '5_5_3');
INSERT INTO `role_menu` VALUES ('401', '11', '5_5_4');
INSERT INTO `role_menu` VALUES ('402', '11', '5_5_5');
INSERT INTO `role_menu` VALUES ('403', '11', '5_6');
INSERT INTO `role_menu` VALUES ('404', '11', '5_6_1');
INSERT INTO `role_menu` VALUES ('405', '11', '5_6_2');
INSERT INTO `role_menu` VALUES ('406', '11', '5_6_3');
INSERT INTO `role_menu` VALUES ('407', '11', '5_6_4');
INSERT INTO `role_menu` VALUES ('408', '11', '5_6_5');
INSERT INTO `role_menu` VALUES ('409', '11', '5_7');
INSERT INTO `role_menu` VALUES ('410', '12', '1');
INSERT INTO `role_menu` VALUES ('411', '12', '1_1');
INSERT INTO `role_menu` VALUES ('412', '12', '1_1_1');
INSERT INTO `role_menu` VALUES ('413', '12', '1_1_2');
INSERT INTO `role_menu` VALUES ('414', '12', '1_1_3');
INSERT INTO `role_menu` VALUES ('415', '12', '1_1_4');
INSERT INTO `role_menu` VALUES ('416', '12', '1_1_5');
INSERT INTO `role_menu` VALUES ('417', '12', '1_2');
INSERT INTO `role_menu` VALUES ('418', '12', '1_2_1');
INSERT INTO `role_menu` VALUES ('419', '12', '1_2_1_1');
INSERT INTO `role_menu` VALUES ('420', '12', '1_2_1_2');
INSERT INTO `role_menu` VALUES ('421', '12', '1_2_1_3');
INSERT INTO `role_menu` VALUES ('422', '12', '1_2_1_4');
INSERT INTO `role_menu` VALUES ('423', '12', '1_2_2');
INSERT INTO `role_menu` VALUES ('424', '12', '1_2_2_1');
INSERT INTO `role_menu` VALUES ('425', '12', '1_2_2_1_1');
INSERT INTO `role_menu` VALUES ('426', '12', '1_2_2_1_2');
INSERT INTO `role_menu` VALUES ('427', '12', '1_2_2_1_3');
INSERT INTO `role_menu` VALUES ('428', '12', '1_2_2_1_4');
INSERT INTO `role_menu` VALUES ('429', '12', '1_2_2_1_5');
INSERT INTO `role_menu` VALUES ('430', '12', '1_2_2_2');
INSERT INTO `role_menu` VALUES ('431', '12', '1_2_2_2_1');
INSERT INTO `role_menu` VALUES ('432', '12', '1_2_2_2_3');
INSERT INTO `role_menu` VALUES ('433', '12', '1_2_2_2_2');
INSERT INTO `role_menu` VALUES ('434', '12', '1_2_2_2_4');
INSERT INTO `role_menu` VALUES ('435', '12', '1_2_2_2_5');
INSERT INTO `role_menu` VALUES ('436', '12', '1_3');
INSERT INTO `role_menu` VALUES ('437', '12', '1_3_1');
INSERT INTO `role_menu` VALUES ('438', '12', '1_3_2');
INSERT INTO `role_menu` VALUES ('439', '12', '1_3_3');
INSERT INTO `role_menu` VALUES ('440', '12', '1_3_4');
INSERT INTO `role_menu` VALUES ('441', '12', '1_3_5');
INSERT INTO `role_menu` VALUES ('442', '12', '1_4');
INSERT INTO `role_menu` VALUES ('443', '12', '1_4_1');
INSERT INTO `role_menu` VALUES ('444', '12', '1_4_2');
INSERT INTO `role_menu` VALUES ('445', '12', '1_4_3');
INSERT INTO `role_menu` VALUES ('446', '12', '1_4_4');
INSERT INTO `role_menu` VALUES ('447', '12', '1_4_5');
INSERT INTO `role_menu` VALUES ('448', '12', '1_5');
INSERT INTO `role_menu` VALUES ('449', '12', '1_5_1');
INSERT INTO `role_menu` VALUES ('450', '12', '1_5_2');
INSERT INTO `role_menu` VALUES ('451', '12', '1_5_3');
INSERT INTO `role_menu` VALUES ('452', '12', '1_5_4');
INSERT INTO `role_menu` VALUES ('453', '12', '1_5_5');
INSERT INTO `role_menu` VALUES ('454', '12', '1_5_6');
INSERT INTO `role_menu` VALUES ('455', '12', '1_6');
INSERT INTO `role_menu` VALUES ('456', '12', '1_6_1');
INSERT INTO `role_menu` VALUES ('457', '12', '1_6_2');
INSERT INTO `role_menu` VALUES ('458', '12', '1_6_3');
INSERT INTO `role_menu` VALUES ('459', '12', '1_6_4');
INSERT INTO `role_menu` VALUES ('460', '12', '1_6_5');
INSERT INTO `role_menu` VALUES ('461', '12', '1_7');
INSERT INTO `role_menu` VALUES ('462', '12', '1_8');
INSERT INTO `role_menu` VALUES ('463', '12', '1_9');
INSERT INTO `role_menu` VALUES ('464', '12', '1');
INSERT INTO `role_menu` VALUES ('465', '12', '1_1');
INSERT INTO `role_menu` VALUES ('466', '12', '1_1_1');
INSERT INTO `role_menu` VALUES ('467', '12', '1_1_2');
INSERT INTO `role_menu` VALUES ('468', '12', '1_1_3');
INSERT INTO `role_menu` VALUES ('469', '12', '1_1_4');
INSERT INTO `role_menu` VALUES ('470', '12', '1_1_5');
INSERT INTO `role_menu` VALUES ('471', '12', '1_2');
INSERT INTO `role_menu` VALUES ('472', '12', '1_2_1');
INSERT INTO `role_menu` VALUES ('473', '12', '1_2_1_1');
INSERT INTO `role_menu` VALUES ('474', '12', '1_2_1_2');
INSERT INTO `role_menu` VALUES ('475', '12', '1_2_1_3');
INSERT INTO `role_menu` VALUES ('476', '12', '1_2_1_4');
INSERT INTO `role_menu` VALUES ('477', '12', '1_2_2');
INSERT INTO `role_menu` VALUES ('478', '12', '1_2_2_1');
INSERT INTO `role_menu` VALUES ('479', '12', '1_2_2_1_1');
INSERT INTO `role_menu` VALUES ('480', '12', '1_2_2_1_2');
INSERT INTO `role_menu` VALUES ('481', '12', '1_2_2_1_3');
INSERT INTO `role_menu` VALUES ('482', '12', '1_2_2_1_4');
INSERT INTO `role_menu` VALUES ('483', '12', '1_2_2_1_5');
INSERT INTO `role_menu` VALUES ('484', '12', '1_2_2_2');
INSERT INTO `role_menu` VALUES ('485', '12', '1_2_2_2_1');
INSERT INTO `role_menu` VALUES ('486', '12', '1_2_2_2_3');
INSERT INTO `role_menu` VALUES ('487', '12', '1_2_2_2_2');
INSERT INTO `role_menu` VALUES ('488', '12', '1_2_2_2_4');
INSERT INTO `role_menu` VALUES ('489', '12', '1_2_2_2_5');
INSERT INTO `role_menu` VALUES ('490', '12', '1_3');
INSERT INTO `role_menu` VALUES ('491', '12', '1_3_1');
INSERT INTO `role_menu` VALUES ('492', '12', '1_3_2');
INSERT INTO `role_menu` VALUES ('493', '12', '1_3_3');
INSERT INTO `role_menu` VALUES ('494', '12', '1_3_4');
INSERT INTO `role_menu` VALUES ('495', '12', '1_3_5');
INSERT INTO `role_menu` VALUES ('496', '12', '1_4');
INSERT INTO `role_menu` VALUES ('497', '12', '1_4_1');
INSERT INTO `role_menu` VALUES ('498', '12', '1_4_2');
INSERT INTO `role_menu` VALUES ('499', '12', '1_4_3');
INSERT INTO `role_menu` VALUES ('500', '12', '1_4_4');
INSERT INTO `role_menu` VALUES ('501', '12', '1_4_5');
INSERT INTO `role_menu` VALUES ('502', '12', '1_5');
INSERT INTO `role_menu` VALUES ('503', '12', '1_5_1');
INSERT INTO `role_menu` VALUES ('504', '12', '1_5_2');
INSERT INTO `role_menu` VALUES ('505', '12', '1_5_3');
INSERT INTO `role_menu` VALUES ('506', '12', '1_5_4');
INSERT INTO `role_menu` VALUES ('507', '12', '1_5_5');
INSERT INTO `role_menu` VALUES ('508', '12', '1_5_6');
INSERT INTO `role_menu` VALUES ('509', '12', '1_6');
INSERT INTO `role_menu` VALUES ('510', '12', '1_6_1');
INSERT INTO `role_menu` VALUES ('511', '12', '1_6_2');
INSERT INTO `role_menu` VALUES ('512', '12', '1_6_3');
INSERT INTO `role_menu` VALUES ('513', '12', '1_6_4');
INSERT INTO `role_menu` VALUES ('514', '12', '1_6_5');
INSERT INTO `role_menu` VALUES ('515', '12', '1_7');
INSERT INTO `role_menu` VALUES ('516', '12', '1_8');
INSERT INTO `role_menu` VALUES ('517', '12', '1_9');
INSERT INTO `role_menu` VALUES ('518', '12', '2');
INSERT INTO `role_menu` VALUES ('519', '12', '2_1');
INSERT INTO `role_menu` VALUES ('520', '12', '2_1_1');
INSERT INTO `role_menu` VALUES ('521', '12', '2_1_2');
INSERT INTO `role_menu` VALUES ('522', '12', '2_1_3');
INSERT INTO `role_menu` VALUES ('523', '12', '2_2');
INSERT INTO `role_menu` VALUES ('524', '12', '2_2_1');
INSERT INTO `role_menu` VALUES ('525', '12', '2_2_2');
INSERT INTO `role_menu` VALUES ('526', '12', '2_3');
INSERT INTO `role_menu` VALUES ('527', '12', '2_3_1');
INSERT INTO `role_menu` VALUES ('528', '12', '2_3_2');
INSERT INTO `role_menu` VALUES ('529', '12', '2_4');
INSERT INTO `role_menu` VALUES ('530', '12', '2_4_1');
INSERT INTO `role_menu` VALUES ('531', '12', '2_4_2');
INSERT INTO `role_menu` VALUES ('532', '12', '2_5');
INSERT INTO `role_menu` VALUES ('533', '12', '2_5_1');
INSERT INTO `role_menu` VALUES ('534', '12', '2_5_2');
INSERT INTO `role_menu` VALUES ('535', '12', '2_6');
INSERT INTO `role_menu` VALUES ('536', '12', '2_6_1');
INSERT INTO `role_menu` VALUES ('537', '12', '2_6_2');
INSERT INTO `role_menu` VALUES ('538', '9', '1');
INSERT INTO `role_menu` VALUES ('539', '9', '1_1');
INSERT INTO `role_menu` VALUES ('540', '9', '1_1_1');
INSERT INTO `role_menu` VALUES ('541', '9', '1_1_2');
INSERT INTO `role_menu` VALUES ('542', '9', '1_1_3');
INSERT INTO `role_menu` VALUES ('543', '9', '1_2');
INSERT INTO `role_menu` VALUES ('544', '9', '1_2_1');
INSERT INTO `role_menu` VALUES ('545', '9', '1_2_1_1');
INSERT INTO `role_menu` VALUES ('546', '9', '1_2_1_2');
INSERT INTO `role_menu` VALUES ('547', '9', '1_5');
INSERT INTO `role_menu` VALUES ('548', '9', '1_5_2');
INSERT INTO `role_menu` VALUES ('560', '13', '1');
INSERT INTO `role_menu` VALUES ('561', '13', '1_2');
INSERT INTO `role_menu` VALUES ('562', '13', '1_2_1');
INSERT INTO `role_menu` VALUES ('563', '13', '1_2_1_1');
INSERT INTO `role_menu` VALUES ('564', '13', '1_2_1_2');
INSERT INTO `role_menu` VALUES ('565', '13', '1_2_1_4');
INSERT INTO `role_menu` VALUES ('566', '14', '1');
INSERT INTO `role_menu` VALUES ('567', '14', '1_8');
INSERT INTO `role_menu` VALUES ('568', '14', '1_8_1');
INSERT INTO `role_menu` VALUES ('569', '14', '1_8_2');
INSERT INTO `role_menu` VALUES ('570', '14', '1_8_3');
INSERT INTO `role_menu` VALUES ('571', '14', '1_8_4');
INSERT INTO `role_menu` VALUES ('572', '14', '1_8_5');
INSERT INTO `role_menu` VALUES ('626', '15', '1');
INSERT INTO `role_menu` VALUES ('627', '15', '1_6');
INSERT INTO `role_menu` VALUES ('628', '15', '1_6_2');
INSERT INTO `role_menu` VALUES ('629', '15', '1_6_2_1');
INSERT INTO `role_menu` VALUES ('630', '15', '1_6_2_1_1');
INSERT INTO `role_menu` VALUES ('631', '15', '1_6_2_1_2');
INSERT INTO `role_menu` VALUES ('632', '15', '1_6_2_1_3');
INSERT INTO `role_menu` VALUES ('633', '15', '1_6_2_1_4');
INSERT INTO `role_menu` VALUES ('634', '15', '1_6_2_1_5');
INSERT INTO `role_menu` VALUES ('635', '15', '1_6_2_2');
INSERT INTO `role_menu` VALUES ('636', '15', '1_6_2_2_1');
INSERT INTO `role_menu` VALUES ('637', '15', '1_6_2_2_2');
INSERT INTO `role_menu` VALUES ('638', '15', '1_6_2_2_3');
INSERT INTO `role_menu` VALUES ('639', '15', '1_6_2_2_4');
INSERT INTO `role_menu` VALUES ('640', '15', '1_6_2_2_5');
INSERT INTO `role_menu` VALUES ('641', '15', '1_7');
INSERT INTO `role_menu` VALUES ('642', '15', '1_7_5');
INSERT INTO `role_menu` VALUES ('643', '15', '1_7_1');
INSERT INTO `role_menu` VALUES ('644', '15', '1_7_2');
INSERT INTO `role_menu` VALUES ('645', '15', '1_7_3');
INSERT INTO `role_menu` VALUES ('646', '15', '1_7_4');
INSERT INTO `role_menu` VALUES ('647', '15', '4');
INSERT INTO `role_menu` VALUES ('648', '15', '4_3');
INSERT INTO `role_menu` VALUES ('649', '15', '4_3_1');
INSERT INTO `role_menu` VALUES ('650', '15', '4_3_2');
INSERT INTO `role_menu` VALUES ('651', '15', '10');
INSERT INTO `role_menu` VALUES ('652', '15', '10_10');
INSERT INTO `role_menu` VALUES ('653', '15', '10_10_1');
INSERT INTO `role_menu` VALUES ('654', '15', '10_10_2');
INSERT INTO `role_menu` VALUES ('655', '15', '10_10_3');
INSERT INTO `role_menu` VALUES ('656', '15', '10_10_4');
INSERT INTO `role_menu` VALUES ('926', '16', '7');
INSERT INTO `role_menu` VALUES ('927', '16', '7_1');
INSERT INTO `role_menu` VALUES ('928', '16', '7_1_1');
INSERT INTO `role_menu` VALUES ('929', '16', '7_1_2');
INSERT INTO `role_menu` VALUES ('930', '16', '7_1_3');
INSERT INTO `role_menu` VALUES ('931', '16', '7_1_4');
INSERT INTO `role_menu` VALUES ('932', '16', '7_1_5');
INSERT INTO `role_menu` VALUES ('933', '16', '7_2');
INSERT INTO `role_menu` VALUES ('934', '16', '7_2_1');
INSERT INTO `role_menu` VALUES ('935', '16', '7_2_2');
INSERT INTO `role_menu` VALUES ('936', '16', '7_2_4');
INSERT INTO `role_menu` VALUES ('937', '16', '7_2_5');
INSERT INTO `role_menu` VALUES ('938', '16', '7_2_6');
INSERT INTO `role_menu` VALUES ('939', '16', '7_2_7');
INSERT INTO `role_menu` VALUES ('940', '16', '7_3');
INSERT INTO `role_menu` VALUES ('941', '16', '7_3_1');
INSERT INTO `role_menu` VALUES ('942', '16', '7_3_2');
INSERT INTO `role_menu` VALUES ('943', '16', '7_3_4');
INSERT INTO `role_menu` VALUES ('944', '16', '7_3_5');
INSERT INTO `role_menu` VALUES ('945', '16', '7_3_6');
INSERT INTO `role_menu` VALUES ('946', '16', '7_3_7');
INSERT INTO `role_menu` VALUES ('947', '16', '7_3_8');
INSERT INTO `role_menu` VALUES ('948', '16', '7_4');
INSERT INTO `role_menu` VALUES ('949', '16', '7_4_1');
INSERT INTO `role_menu` VALUES ('950', '16', '7_4_2');
INSERT INTO `role_menu` VALUES ('951', '16', '7_4_3');
INSERT INTO `role_menu` VALUES ('952', '16', '7_4_4');
INSERT INTO `role_menu` VALUES ('953', '16', '7_4_5');
INSERT INTO `role_menu` VALUES ('954', '16', '7_5');
INSERT INTO `role_menu` VALUES ('955', '16', '7_5_2');
INSERT INTO `role_menu` VALUES ('956', '16', '7_5_1');
INSERT INTO `role_menu` VALUES ('957', '16', '7_5_3');
INSERT INTO `role_menu` VALUES ('958', '16', '11');
INSERT INTO `role_menu` VALUES ('959', '16', '11_1');
INSERT INTO `role_menu` VALUES ('960', '16', '11_1_1');
INSERT INTO `role_menu` VALUES ('961', '16', '11_1_2');
INSERT INTO `role_menu` VALUES ('962', '16', '11_1_3');
INSERT INTO `role_menu` VALUES ('963', '16', '11_1_4');
INSERT INTO `role_menu` VALUES ('964', '16', '11_1_5');
INSERT INTO `role_menu` VALUES ('2148', '18', '1');
INSERT INTO `role_menu` VALUES ('2149', '18', '1_1');
INSERT INTO `role_menu` VALUES ('2150', '18', '1_1_1');
INSERT INTO `role_menu` VALUES ('2151', '18', '1_1_2');
INSERT INTO `role_menu` VALUES ('2152', '18', '1_1_2_1');
INSERT INTO `role_menu` VALUES ('2153', '18', '1_1_2_2');
INSERT INTO `role_menu` VALUES ('2154', '18', '1_1_2_3');
INSERT INTO `role_menu` VALUES ('2155', '18', '1_2');
INSERT INTO `role_menu` VALUES ('2156', '18', '1_2_1');
INSERT INTO `role_menu` VALUES ('2157', '18', '1_2_2');
INSERT INTO `role_menu` VALUES ('2158', '18', '1_2_3');
INSERT INTO `role_menu` VALUES ('2159', '18', '1_2_4');
INSERT INTO `role_menu` VALUES ('2160', '18', '1_2_5');
INSERT INTO `role_menu` VALUES ('2161', '18', '2');
INSERT INTO `role_menu` VALUES ('2162', '18', '2_1');
INSERT INTO `role_menu` VALUES ('2163', '18', '2_1_1');
INSERT INTO `role_menu` VALUES ('2164', '18', '2_1_2');
INSERT INTO `role_menu` VALUES ('2165', '18', '2_1_3');
INSERT INTO `role_menu` VALUES ('2166', '18', '2_1_4');
INSERT INTO `role_menu` VALUES ('2167', '18', '2_2');
INSERT INTO `role_menu` VALUES ('2168', '18', '2_2_1');
INSERT INTO `role_menu` VALUES ('2169', '18', '2_2_2');
INSERT INTO `role_menu` VALUES ('2170', '18', '2_2_3');
INSERT INTO `role_menu` VALUES ('2171', '18', '2_3');
INSERT INTO `role_menu` VALUES ('2172', '18', '2_3_1');
INSERT INTO `role_menu` VALUES ('2173', '18', '2_3_2');
INSERT INTO `role_menu` VALUES ('2174', '18', '2_3_3');
INSERT INTO `role_menu` VALUES ('2175', '18', '2_4');
INSERT INTO `role_menu` VALUES ('2176', '18', '2_4_1');
INSERT INTO `role_menu` VALUES ('2177', '18', '2_4_2');
INSERT INTO `role_menu` VALUES ('2178', '18', '2_4_3');
INSERT INTO `role_menu` VALUES ('2179', '18', '2_5');
INSERT INTO `role_menu` VALUES ('2180', '18', '2_5_1');
INSERT INTO `role_menu` VALUES ('2181', '18', '2_5_2');
INSERT INTO `role_menu` VALUES ('2182', '18', '2_5_3');
INSERT INTO `role_menu` VALUES ('2183', '18', '2_6');
INSERT INTO `role_menu` VALUES ('2184', '18', '2_6_1');
INSERT INTO `role_menu` VALUES ('2185', '18', '2_6_2');
INSERT INTO `role_menu` VALUES ('2186', '18', '2_6_3');
INSERT INTO `role_menu` VALUES ('2187', '18', '2_7');
INSERT INTO `role_menu` VALUES ('2188', '18', '2_7_1');
INSERT INTO `role_menu` VALUES ('2189', '18', '2_7_2');
INSERT INTO `role_menu` VALUES ('2190', '18', '3');
INSERT INTO `role_menu` VALUES ('2191', '18', '3_1');
INSERT INTO `role_menu` VALUES ('2192', '18', '3_1_1');
INSERT INTO `role_menu` VALUES ('2193', '18', '3_1_2');
INSERT INTO `role_menu` VALUES ('2194', '18', '3_1_3');
INSERT INTO `role_menu` VALUES ('2195', '18', '3_2');
INSERT INTO `role_menu` VALUES ('2196', '18', '3_2_1');
INSERT INTO `role_menu` VALUES ('2197', '18', '3_2_2');
INSERT INTO `role_menu` VALUES ('2198', '18', '3_3');
INSERT INTO `role_menu` VALUES ('2199', '18', '3_3_1');
INSERT INTO `role_menu` VALUES ('2200', '18', '3_3_2');
INSERT INTO `role_menu` VALUES ('2201', '18', '3_3_3');
INSERT INTO `role_menu` VALUES ('2202', '18', '3_3_4');
INSERT INTO `role_menu` VALUES ('2203', '18', '3_3_5');
INSERT INTO `role_menu` VALUES ('2204', '18', '3_3_6');
INSERT INTO `role_menu` VALUES ('2205', '18', '3_3_7');
INSERT INTO `role_menu` VALUES ('2206', '18', '3_4');
INSERT INTO `role_menu` VALUES ('2207', '18', '3_4_1');
INSERT INTO `role_menu` VALUES ('2208', '18', '3_4_2');
INSERT INTO `role_menu` VALUES ('2209', '18', '3_4_3');
INSERT INTO `role_menu` VALUES ('2210', '18', '3_4_4');
INSERT INTO `role_menu` VALUES ('2211', '18', '3_5');
INSERT INTO `role_menu` VALUES ('2212', '18', '3_5_1');
INSERT INTO `role_menu` VALUES ('2213', '18', '3_5_2');
INSERT INTO `role_menu` VALUES ('2214', '18', '3_5_3');
INSERT INTO `role_menu` VALUES ('2215', '18', '3_6');
INSERT INTO `role_menu` VALUES ('2216', '18', '3_6_1');
INSERT INTO `role_menu` VALUES ('2217', '18', '3_6_2');
INSERT INTO `role_menu` VALUES ('2218', '18', '3_6_3');
INSERT INTO `role_menu` VALUES ('2219', '18', '3_7');
INSERT INTO `role_menu` VALUES ('2220', '18', '3_7_1');
INSERT INTO `role_menu` VALUES ('2221', '18', '3_7_2');
INSERT INTO `role_menu` VALUES ('2222', '18', '3_7_3');
INSERT INTO `role_menu` VALUES ('2223', '18', '3_8');
INSERT INTO `role_menu` VALUES ('2224', '18', '3_8_1');
INSERT INTO `role_menu` VALUES ('2225', '18', '3_8_2');
INSERT INTO `role_menu` VALUES ('2226', '18', '3_8_3');
INSERT INTO `role_menu` VALUES ('2227', '18', '3_9');
INSERT INTO `role_menu` VALUES ('2228', '18', '3_9_1');
INSERT INTO `role_menu` VALUES ('2229', '18', '3_9_2');
INSERT INTO `role_menu` VALUES ('2230', '18', '3_9_3');
INSERT INTO `role_menu` VALUES ('2231', '18', '4');
INSERT INTO `role_menu` VALUES ('2232', '18', '4_1');
INSERT INTO `role_menu` VALUES ('2233', '18', '4_1_1');
INSERT INTO `role_menu` VALUES ('2234', '18', '4_1_2');
INSERT INTO `role_menu` VALUES ('2235', '18', '4_1_3');
INSERT INTO `role_menu` VALUES ('2236', '18', '4_1_4');
INSERT INTO `role_menu` VALUES ('2237', '18', '4_1_5');
INSERT INTO `role_menu` VALUES ('2238', '18', '4_1_5_1');
INSERT INTO `role_menu` VALUES ('2239', '18', '4_1_5_2');
INSERT INTO `role_menu` VALUES ('2240', '18', '4_1_5_3');
INSERT INTO `role_menu` VALUES ('2241', '18', '4_1_5_4');
INSERT INTO `role_menu` VALUES ('2242', '18', '4_1_5_5');
INSERT INTO `role_menu` VALUES ('2243', '18', '4_2');
INSERT INTO `role_menu` VALUES ('2244', '18', '4_2_1');
INSERT INTO `role_menu` VALUES ('2245', '18', '4_3');
INSERT INTO `role_menu` VALUES ('2246', '18', '4_3_1');
INSERT INTO `role_menu` VALUES ('2247', '18', '4_3_2');
INSERT INTO `role_menu` VALUES ('2248', '18', '5');
INSERT INTO `role_menu` VALUES ('2249', '18', '5_1');
INSERT INTO `role_menu` VALUES ('2250', '18', '5_1_5');
INSERT INTO `role_menu` VALUES ('2251', '18', '5_1_1');
INSERT INTO `role_menu` VALUES ('2252', '18', '5_1_2');
INSERT INTO `role_menu` VALUES ('2253', '18', '5_1_3');
INSERT INTO `role_menu` VALUES ('2254', '18', '5_1_4');
INSERT INTO `role_menu` VALUES ('2255', '18', '5_1_6');
INSERT INTO `role_menu` VALUES ('2256', '18', '5_1_7');
INSERT INTO `role_menu` VALUES ('2257', '18', '6');
INSERT INTO `role_menu` VALUES ('2258', '18', '6_1');
INSERT INTO `role_menu` VALUES ('2259', '18', '6_1_1');
INSERT INTO `role_menu` VALUES ('2260', '18', '6_1_2');
INSERT INTO `role_menu` VALUES ('2261', '18', '6_1_3');
INSERT INTO `role_menu` VALUES ('2262', '18', '6_2');
INSERT INTO `role_menu` VALUES ('2263', '18', '6_2_1');
INSERT INTO `role_menu` VALUES ('2264', '18', '6_2_5');
INSERT INTO `role_menu` VALUES ('2265', '18', '6_2_5_1');
INSERT INTO `role_menu` VALUES ('2266', '18', '6_2_5_2');
INSERT INTO `role_menu` VALUES ('2267', '18', '6_2_5_3');
INSERT INTO `role_menu` VALUES ('2268', '18', '6_2_5_4');
INSERT INTO `role_menu` VALUES ('2269', '18', '6_2_5_5');
INSERT INTO `role_menu` VALUES ('2270', '18', '6_2_4');
INSERT INTO `role_menu` VALUES ('2271', '18', '6_2_3');
INSERT INTO `role_menu` VALUES ('2272', '18', '6_2_2');
INSERT INTO `role_menu` VALUES ('2273', '18', '6_2_6');
INSERT INTO `role_menu` VALUES ('2274', '18', '6_3');
INSERT INTO `role_menu` VALUES ('2275', '18', '6_3_1');
INSERT INTO `role_menu` VALUES ('2276', '18', '6_3_2');
INSERT INTO `role_menu` VALUES ('2277', '18', '6_4');
INSERT INTO `role_menu` VALUES ('2278', '18', '6_4_1');
INSERT INTO `role_menu` VALUES ('2279', '18', '6_4_2');
INSERT INTO `role_menu` VALUES ('2280', '18', '7');
INSERT INTO `role_menu` VALUES ('2281', '18', '7_1');
INSERT INTO `role_menu` VALUES ('2282', '18', '7_1_1');
INSERT INTO `role_menu` VALUES ('2283', '18', '7_1_2');
INSERT INTO `role_menu` VALUES ('2284', '18', '7_1_3');
INSERT INTO `role_menu` VALUES ('2285', '18', '7_1_4');
INSERT INTO `role_menu` VALUES ('2286', '18', '7_2');
INSERT INTO `role_menu` VALUES ('2287', '18', '7_2_1');
INSERT INTO `role_menu` VALUES ('2288', '18', '7_2_2');
INSERT INTO `role_menu` VALUES ('2289', '18', '7_2_3');
INSERT INTO `role_menu` VALUES ('2290', '18', '7_2_4');
INSERT INTO `role_menu` VALUES ('2291', '18', '8');
INSERT INTO `role_menu` VALUES ('2292', '18', '8_1');
INSERT INTO `role_menu` VALUES ('2293', '18', '8_1_1');
INSERT INTO `role_menu` VALUES ('2294', '18', '8_1_2');
INSERT INTO `role_menu` VALUES ('2295', '18', '8_1_2_1');
INSERT INTO `role_menu` VALUES ('2296', '18', '8_1_2_2');
INSERT INTO `role_menu` VALUES ('2297', '18', '8_2');
INSERT INTO `role_menu` VALUES ('2298', '18', '8_2_1');
INSERT INTO `role_menu` VALUES ('2299', '18', '8_2_2');
INSERT INTO `role_menu` VALUES ('2383', '1', '1');
INSERT INTO `role_menu` VALUES ('2384', '1', '1_1');
INSERT INTO `role_menu` VALUES ('2385', '1', '1_1_2');
INSERT INTO `role_menu` VALUES ('2386', '1', '1_1_1');
INSERT INTO `role_menu` VALUES ('2387', '1', '2');
INSERT INTO `role_menu` VALUES ('2388', '1', '2_1');
INSERT INTO `role_menu` VALUES ('2389', '1', '2_1_1');
INSERT INTO `role_menu` VALUES ('2390', '1', '2_1_2');
INSERT INTO `role_menu` VALUES ('2391', '1', '2_1_3');
INSERT INTO `role_menu` VALUES ('2392', '1', '2_1_4');
INSERT INTO `role_menu` VALUES ('2393', '1', '2_2');
INSERT INTO `role_menu` VALUES ('2394', '1', '2_2_1');
INSERT INTO `role_menu` VALUES ('2395', '1', '2_2_2');
INSERT INTO `role_menu` VALUES ('2396', '1', '2_2_3');
INSERT INTO `role_menu` VALUES ('2397', '1', '8');
INSERT INTO `role_menu` VALUES ('2398', '1', '8_1');
INSERT INTO `role_menu` VALUES ('2399', '1', '8_1_1');
INSERT INTO `role_menu` VALUES ('2400', '1', '8_1_2');
INSERT INTO `role_menu` VALUES ('2401', '17', '1');
INSERT INTO `role_menu` VALUES ('2402', '17', '1_1');
INSERT INTO `role_menu` VALUES ('2403', '17', '1_1_2');
INSERT INTO `role_menu` VALUES ('2404', '17', '1_1_1');
INSERT INTO `role_menu` VALUES ('2405', '17', '2');
INSERT INTO `role_menu` VALUES ('2406', '17', '2_1');
INSERT INTO `role_menu` VALUES ('2407', '17', '2_1_1');
INSERT INTO `role_menu` VALUES ('2408', '17', '2_1_2');
INSERT INTO `role_menu` VALUES ('2409', '17', '2_1_3');
INSERT INTO `role_menu` VALUES ('2410', '17', '2_1_4');
INSERT INTO `role_menu` VALUES ('2411', '17', '6');
INSERT INTO `role_menu` VALUES ('2412', '17', '6_3');
INSERT INTO `role_menu` VALUES ('2413', '17', '6_3_1');
INSERT INTO `role_menu` VALUES ('2414', '17', '6_3_2');
INSERT INTO `role_menu` VALUES ('2415', '17', '8');
INSERT INTO `role_menu` VALUES ('2416', '17', '8_1');
INSERT INTO `role_menu` VALUES ('2417', '17', '8_1_1');
INSERT INTO `role_menu` VALUES ('2418', '17', '8_1_2');
INSERT INTO `role_menu` VALUES ('2441', '19', '1');
INSERT INTO `role_menu` VALUES ('2442', '19', '1_1');
INSERT INTO `role_menu` VALUES ('2443', '19', '1_1_2');
INSERT INTO `role_menu` VALUES ('2444', '19', '1_1_1');
INSERT INTO `role_menu` VALUES ('2445', '19', '2');
INSERT INTO `role_menu` VALUES ('2446', '19', '2_1');
INSERT INTO `role_menu` VALUES ('2447', '19', '2_1_1');
INSERT INTO `role_menu` VALUES ('2448', '19', '2_1_2');
INSERT INTO `role_menu` VALUES ('2449', '19', '2_1_3');
INSERT INTO `role_menu` VALUES ('2450', '19', '2_1_4');
INSERT INTO `role_menu` VALUES ('2451', '19', '2_2');
INSERT INTO `role_menu` VALUES ('2452', '19', '2_2_1');
INSERT INTO `role_menu` VALUES ('2453', '19', '2_2_2');
INSERT INTO `role_menu` VALUES ('2454', '19', '2_2_3');
INSERT INTO `role_menu` VALUES ('2455', '19', '6');
INSERT INTO `role_menu` VALUES ('2456', '19', '6_1');
INSERT INTO `role_menu` VALUES ('2457', '19', '6_1_1');
INSERT INTO `role_menu` VALUES ('2458', '19', '6_1_2');
INSERT INTO `role_menu` VALUES ('2459', '19', '6_1_3');
INSERT INTO `role_menu` VALUES ('2460', '19', '6_2');
INSERT INTO `role_menu` VALUES ('2461', '19', '6_2_1');
INSERT INTO `role_menu` VALUES ('2462', '19', '6_2_5');
INSERT INTO `role_menu` VALUES ('2463', '19', '6_2_5_1');
INSERT INTO `role_menu` VALUES ('2464', '19', '6_2_5_2');
INSERT INTO `role_menu` VALUES ('2465', '19', '6_2_5_3');
INSERT INTO `role_menu` VALUES ('2466', '19', '6_2_5_4');
INSERT INTO `role_menu` VALUES ('2467', '19', '6_2_5_5');
INSERT INTO `role_menu` VALUES ('2468', '19', '6_2_4');
INSERT INTO `role_menu` VALUES ('2469', '19', '6_2_3');
INSERT INTO `role_menu` VALUES ('2470', '19', '6_2_2');
INSERT INTO `role_menu` VALUES ('2471', '19', '6_2_6');
INSERT INTO `role_menu` VALUES ('2472', '19', '6_3');
INSERT INTO `role_menu` VALUES ('2473', '19', '6_3_1');
INSERT INTO `role_menu` VALUES ('2474', '19', '6_3_2');
INSERT INTO `role_menu` VALUES ('2475', '19', '6_4');
INSERT INTO `role_menu` VALUES ('2476', '19', '6_4_1');
INSERT INTO `role_menu` VALUES ('2477', '19', '6_4_2');
INSERT INTO `role_menu` VALUES ('2478', '19', '7');
INSERT INTO `role_menu` VALUES ('2479', '19', '7_1');
INSERT INTO `role_menu` VALUES ('2480', '19', '7_1_1');
INSERT INTO `role_menu` VALUES ('2481', '19', '7_1_2');
INSERT INTO `role_menu` VALUES ('2482', '19', '7_1_3');
INSERT INTO `role_menu` VALUES ('2483', '19', '7_1_4');
INSERT INTO `role_menu` VALUES ('2484', '19', '7_2');
INSERT INTO `role_menu` VALUES ('2485', '19', '7_3');
INSERT INTO `role_menu` VALUES ('2486', '19', '7_4');
INSERT INTO `role_menu` VALUES ('2487', '19', '8');
INSERT INTO `role_menu` VALUES ('2488', '19', '8_1');
INSERT INTO `role_menu` VALUES ('2489', '19', '8_1_1');
INSERT INTO `role_menu` VALUES ('2490', '19', '8_1_2');
INSERT INTO `role_menu` VALUES ('2491', '20', '1');
INSERT INTO `role_menu` VALUES ('2492', '20', '1_1');
INSERT INTO `role_menu` VALUES ('2493', '20', '1_1_2');
INSERT INTO `role_menu` VALUES ('2494', '20', '1_1_1');
INSERT INTO `role_menu` VALUES ('2495', '20', '2');
INSERT INTO `role_menu` VALUES ('2496', '20', '2_1');
INSERT INTO `role_menu` VALUES ('2497', '20', '2_1_1');
INSERT INTO `role_menu` VALUES ('2498', '20', '2_1_2');
INSERT INTO `role_menu` VALUES ('2499', '20', '2_1_3');
INSERT INTO `role_menu` VALUES ('2500', '20', '2_1_4');
INSERT INTO `role_menu` VALUES ('2501', '20', '2_2');
INSERT INTO `role_menu` VALUES ('2502', '20', '2_2_1');
INSERT INTO `role_menu` VALUES ('2503', '20', '2_2_2');
INSERT INTO `role_menu` VALUES ('2504', '20', '2_2_3');
INSERT INTO `role_menu` VALUES ('2505', '20', '2_3');
INSERT INTO `role_menu` VALUES ('2506', '20', '2_3_1');
INSERT INTO `role_menu` VALUES ('2507', '20', '2_3_2');
INSERT INTO `role_menu` VALUES ('2508', '20', '2_3_3');
INSERT INTO `role_menu` VALUES ('2509', '20', '2_7');
INSERT INTO `role_menu` VALUES ('2510', '20', '2_7_1');
INSERT INTO `role_menu` VALUES ('2511', '20', '2_7_2');
INSERT INTO `role_menu` VALUES ('2512', '20', '6');
INSERT INTO `role_menu` VALUES ('2513', '20', '6_3');
INSERT INTO `role_menu` VALUES ('2514', '20', '6_3_1');
INSERT INTO `role_menu` VALUES ('2515', '20', '6_3_2');
INSERT INTO `role_menu` VALUES ('2516', '20', '8');
INSERT INTO `role_menu` VALUES ('2517', '20', '8_1');
INSERT INTO `role_menu` VALUES ('2518', '20', '8_1_1');
INSERT INTO `role_menu` VALUES ('2519', '20', '8_1_2');
INSERT INTO `role_menu` VALUES ('2520', '21', '1');
INSERT INTO `role_menu` VALUES ('2521', '21', '1_1');
INSERT INTO `role_menu` VALUES ('2522', '21', '1_1_2');
INSERT INTO `role_menu` VALUES ('2523', '21', '1_1_1');
INSERT INTO `role_menu` VALUES ('2524', '21', '2');
INSERT INTO `role_menu` VALUES ('2525', '21', '2_1');
INSERT INTO `role_menu` VALUES ('2526', '21', '2_1_1');
INSERT INTO `role_menu` VALUES ('2527', '21', '2_1_2');
INSERT INTO `role_menu` VALUES ('2528', '21', '2_1_3');
INSERT INTO `role_menu` VALUES ('2529', '21', '2_1_4');
INSERT INTO `role_menu` VALUES ('2530', '21', '2_4');
INSERT INTO `role_menu` VALUES ('2531', '21', '2_4_1');
INSERT INTO `role_menu` VALUES ('2532', '21', '2_4_2');
INSERT INTO `role_menu` VALUES ('2533', '21', '2_4_3');
INSERT INTO `role_menu` VALUES ('2534', '21', '2_7');
INSERT INTO `role_menu` VALUES ('2535', '21', '2_7_1');
INSERT INTO `role_menu` VALUES ('2536', '21', '7');
INSERT INTO `role_menu` VALUES ('2537', '21', '7_1');
INSERT INTO `role_menu` VALUES ('2538', '21', '7_1_1');
INSERT INTO `role_menu` VALUES ('2539', '21', '7_1_2');
INSERT INTO `role_menu` VALUES ('2540', '21', '8');
INSERT INTO `role_menu` VALUES ('2541', '21', '8_1');
INSERT INTO `role_menu` VALUES ('2542', '21', '8_1_1');
INSERT INTO `role_menu` VALUES ('2543', '21', '8_1_2');
INSERT INTO `role_menu` VALUES ('2544', '22', '1');
INSERT INTO `role_menu` VALUES ('2545', '22', '1_1');
INSERT INTO `role_menu` VALUES ('2546', '22', '1_1_2');
INSERT INTO `role_menu` VALUES ('2547', '22', '1_1_1');
INSERT INTO `role_menu` VALUES ('2548', '22', '1_1_3');
INSERT INTO `role_menu` VALUES ('2549', '22', '1_2');
INSERT INTO `role_menu` VALUES ('2550', '22', '1_2_1');
INSERT INTO `role_menu` VALUES ('2551', '22', '1_2_2');
INSERT INTO `role_menu` VALUES ('2552', '22', '1_2_3');
INSERT INTO `role_menu` VALUES ('2553', '22', '1_2_4');
INSERT INTO `role_menu` VALUES ('2554', '22', '1_2_5');
INSERT INTO `role_menu` VALUES ('2555', '22', '2');
INSERT INTO `role_menu` VALUES ('2556', '22', '2_1');
INSERT INTO `role_menu` VALUES ('2557', '22', '2_1_1');
INSERT INTO `role_menu` VALUES ('2558', '22', '2_1_2');
INSERT INTO `role_menu` VALUES ('2559', '22', '2_1_3');
INSERT INTO `role_menu` VALUES ('2560', '22', '2_1_4');
INSERT INTO `role_menu` VALUES ('2561', '22', '6');
INSERT INTO `role_menu` VALUES ('2562', '22', '6_3');
INSERT INTO `role_menu` VALUES ('2563', '22', '6_3_1');
INSERT INTO `role_menu` VALUES ('2564', '22', '6_3_2');
INSERT INTO `role_menu` VALUES ('2565', '22', '8');
INSERT INTO `role_menu` VALUES ('2566', '22', '8_1');
INSERT INTO `role_menu` VALUES ('2567', '22', '8_1_1');
INSERT INTO `role_menu` VALUES ('2568', '22', '8_1_2');
INSERT INTO `role_menu` VALUES ('2569', '22', '8_1_3');
INSERT INTO `role_menu` VALUES ('2570', '22', '8_2');
INSERT INTO `role_menu` VALUES ('2571', '22', '8_2_3');
INSERT INTO `role_menu` VALUES ('2572', '22', '8_2_4');
INSERT INTO `role_menu` VALUES ('2573', '22', '8_2_1');
INSERT INTO `role_menu` VALUES ('2574', '22', '8_2_2');
INSERT INTO `role_menu` VALUES ('2575', '23', '1');
INSERT INTO `role_menu` VALUES ('2576', '23', '1_1');
INSERT INTO `role_menu` VALUES ('2577', '23', '1_1_2');
INSERT INTO `role_menu` VALUES ('2578', '23', '1_1_1');
INSERT INTO `role_menu` VALUES ('2579', '23', '1_1_3');
INSERT INTO `role_menu` VALUES ('2580', '23', '1_2');
INSERT INTO `role_menu` VALUES ('2581', '23', '1_2_1');
INSERT INTO `role_menu` VALUES ('2582', '23', '1_2_2');
INSERT INTO `role_menu` VALUES ('2583', '23', '1_2_3');
INSERT INTO `role_menu` VALUES ('2584', '23', '1_2_4');
INSERT INTO `role_menu` VALUES ('2585', '23', '1_2_5');
INSERT INTO `role_menu` VALUES ('2586', '23', '1_3');
INSERT INTO `role_menu` VALUES ('2587', '23', '2');
INSERT INTO `role_menu` VALUES ('2588', '23', '2_1');
INSERT INTO `role_menu` VALUES ('2589', '23', '2_1_1');
INSERT INTO `role_menu` VALUES ('2590', '23', '2_1_2');
INSERT INTO `role_menu` VALUES ('2591', '23', '2_1_3');
INSERT INTO `role_menu` VALUES ('2592', '23', '2_1_4');
INSERT INTO `role_menu` VALUES ('2593', '23', '2_2');
INSERT INTO `role_menu` VALUES ('2594', '23', '2_2_1');
INSERT INTO `role_menu` VALUES ('2595', '23', '2_2_2');
INSERT INTO `role_menu` VALUES ('2596', '23', '2_2_3');
INSERT INTO `role_menu` VALUES ('2597', '23', '2_3');
INSERT INTO `role_menu` VALUES ('2598', '23', '2_3_1');
INSERT INTO `role_menu` VALUES ('2599', '23', '2_3_2');
INSERT INTO `role_menu` VALUES ('2600', '23', '2_3_3');
INSERT INTO `role_menu` VALUES ('2601', '23', '2_4');
INSERT INTO `role_menu` VALUES ('2602', '23', '2_4_1');
INSERT INTO `role_menu` VALUES ('2603', '23', '2_4_2');
INSERT INTO `role_menu` VALUES ('2604', '23', '2_4_3');
INSERT INTO `role_menu` VALUES ('2605', '23', '2_5');
INSERT INTO `role_menu` VALUES ('2606', '23', '2_5_1');
INSERT INTO `role_menu` VALUES ('2607', '23', '2_5_2');
INSERT INTO `role_menu` VALUES ('2608', '23', '2_5_3');
INSERT INTO `role_menu` VALUES ('2609', '23', '2_6');
INSERT INTO `role_menu` VALUES ('2610', '23', '2_6_1');
INSERT INTO `role_menu` VALUES ('2611', '23', '2_6_2');
INSERT INTO `role_menu` VALUES ('2612', '23', '2_6_3');
INSERT INTO `role_menu` VALUES ('2613', '23', '2_7');
INSERT INTO `role_menu` VALUES ('2614', '23', '2_7_1');
INSERT INTO `role_menu` VALUES ('2615', '23', '2_7_2');
INSERT INTO `role_menu` VALUES ('2616', '23', '2_8');
INSERT INTO `role_menu` VALUES ('2617', '23', '3');
INSERT INTO `role_menu` VALUES ('2618', '23', '3_1');
INSERT INTO `role_menu` VALUES ('2619', '23', '3_1_1');
INSERT INTO `role_menu` VALUES ('2620', '23', '3_1_2');
INSERT INTO `role_menu` VALUES ('2621', '23', '3_1_3');
INSERT INTO `role_menu` VALUES ('2622', '23', '3_2');
INSERT INTO `role_menu` VALUES ('2623', '23', '3_2_1');
INSERT INTO `role_menu` VALUES ('2624', '23', '3_2_2');
INSERT INTO `role_menu` VALUES ('2625', '23', '3_3');
INSERT INTO `role_menu` VALUES ('2626', '23', '3_3_1');
INSERT INTO `role_menu` VALUES ('2627', '23', '3_3_2');
INSERT INTO `role_menu` VALUES ('2628', '23', '3_3_3');
INSERT INTO `role_menu` VALUES ('2629', '23', '3_3_4');
INSERT INTO `role_menu` VALUES ('2630', '23', '3_3_5');
INSERT INTO `role_menu` VALUES ('2631', '23', '3_3_6');
INSERT INTO `role_menu` VALUES ('2632', '23', '3_3_7');
INSERT INTO `role_menu` VALUES ('2633', '23', '3_4');
INSERT INTO `role_menu` VALUES ('2634', '23', '3_4_1');
INSERT INTO `role_menu` VALUES ('2635', '23', '3_4_2');
INSERT INTO `role_menu` VALUES ('2636', '23', '3_4_3');
INSERT INTO `role_menu` VALUES ('2637', '23', '3_4_4');
INSERT INTO `role_menu` VALUES ('2638', '23', '3_5');
INSERT INTO `role_menu` VALUES ('2639', '23', '3_5_1');
INSERT INTO `role_menu` VALUES ('2640', '23', '3_5_2');
INSERT INTO `role_menu` VALUES ('2641', '23', '3_5_3');
INSERT INTO `role_menu` VALUES ('2642', '23', '3_6');
INSERT INTO `role_menu` VALUES ('2643', '23', '3_6_1');
INSERT INTO `role_menu` VALUES ('2644', '23', '3_6_2');
INSERT INTO `role_menu` VALUES ('2645', '23', '3_6_3');
INSERT INTO `role_menu` VALUES ('2646', '23', '3_7');
INSERT INTO `role_menu` VALUES ('2647', '23', '3_7_1');
INSERT INTO `role_menu` VALUES ('2648', '23', '3_7_2');
INSERT INTO `role_menu` VALUES ('2649', '23', '3_7_3');
INSERT INTO `role_menu` VALUES ('2650', '23', '3_8');
INSERT INTO `role_menu` VALUES ('2651', '23', '3_8_1');
INSERT INTO `role_menu` VALUES ('2652', '23', '3_8_2');
INSERT INTO `role_menu` VALUES ('2653', '23', '3_8_3');
INSERT INTO `role_menu` VALUES ('2654', '23', '3_9');
INSERT INTO `role_menu` VALUES ('2655', '23', '3_9_1');
INSERT INTO `role_menu` VALUES ('2656', '23', '3_9_2');
INSERT INTO `role_menu` VALUES ('2657', '23', '3_9_3');
INSERT INTO `role_menu` VALUES ('2658', '23', '4');
INSERT INTO `role_menu` VALUES ('2659', '23', '4_1');
INSERT INTO `role_menu` VALUES ('2660', '23', '4_1_1');
INSERT INTO `role_menu` VALUES ('2661', '23', '4_1_2');
INSERT INTO `role_menu` VALUES ('2662', '23', '4_1_3');
INSERT INTO `role_menu` VALUES ('2663', '23', '4_1_4');
INSERT INTO `role_menu` VALUES ('2664', '23', '4_1_5');
INSERT INTO `role_menu` VALUES ('2665', '23', '4_1_5_1');
INSERT INTO `role_menu` VALUES ('2666', '23', '4_1_5_2');
INSERT INTO `role_menu` VALUES ('2667', '23', '4_1_5_3');
INSERT INTO `role_menu` VALUES ('2668', '23', '4_1_5_4');
INSERT INTO `role_menu` VALUES ('2669', '23', '4_1_5_5');
INSERT INTO `role_menu` VALUES ('2670', '23', '4_2');
INSERT INTO `role_menu` VALUES ('2671', '23', '4_2_1');
INSERT INTO `role_menu` VALUES ('2672', '23', '4_3');
INSERT INTO `role_menu` VALUES ('2673', '23', '4_3_1');
INSERT INTO `role_menu` VALUES ('2674', '23', '4_3_2');
INSERT INTO `role_menu` VALUES ('2675', '23', '4_4');
INSERT INTO `role_menu` VALUES ('2676', '23', '5');
INSERT INTO `role_menu` VALUES ('2677', '23', '5_1');
INSERT INTO `role_menu` VALUES ('2678', '23', '5_1_5');
INSERT INTO `role_menu` VALUES ('2679', '23', '5_1_1');
INSERT INTO `role_menu` VALUES ('2680', '23', '5_1_2');
INSERT INTO `role_menu` VALUES ('2681', '23', '5_1_3');
INSERT INTO `role_menu` VALUES ('2682', '23', '5_1_4');
INSERT INTO `role_menu` VALUES ('2683', '23', '5_1_6');
INSERT INTO `role_menu` VALUES ('2684', '23', '5_1_7');
INSERT INTO `role_menu` VALUES ('2685', '23', '5_1_8');
INSERT INTO `role_menu` VALUES ('2686', '23', '5_2');
INSERT INTO `role_menu` VALUES ('2687', '23', '6');
INSERT INTO `role_menu` VALUES ('2688', '23', '6_1');
INSERT INTO `role_menu` VALUES ('2689', '23', '6_1_1');
INSERT INTO `role_menu` VALUES ('2690', '23', '6_1_2');
INSERT INTO `role_menu` VALUES ('2691', '23', '6_1_3');
INSERT INTO `role_menu` VALUES ('2692', '23', '6_2');
INSERT INTO `role_menu` VALUES ('2693', '23', '6_2_1');
INSERT INTO `role_menu` VALUES ('2694', '23', '6_2_5');
INSERT INTO `role_menu` VALUES ('2695', '23', '6_2_5_1');
INSERT INTO `role_menu` VALUES ('2696', '23', '6_2_5_2');
INSERT INTO `role_menu` VALUES ('2697', '23', '6_2_5_3');
INSERT INTO `role_menu` VALUES ('2698', '23', '6_2_5_4');
INSERT INTO `role_menu` VALUES ('2699', '23', '6_2_5_5');
INSERT INTO `role_menu` VALUES ('2700', '23', '6_2_4');
INSERT INTO `role_menu` VALUES ('2701', '23', '6_2_3');
INSERT INTO `role_menu` VALUES ('2702', '23', '6_2_2');
INSERT INTO `role_menu` VALUES ('2703', '23', '6_2_6');
INSERT INTO `role_menu` VALUES ('2704', '23', '6_3');
INSERT INTO `role_menu` VALUES ('2705', '23', '6_3_1');
INSERT INTO `role_menu` VALUES ('2706', '23', '6_3_2');
INSERT INTO `role_menu` VALUES ('2707', '23', '6_4');
INSERT INTO `role_menu` VALUES ('2708', '23', '6_4_1');
INSERT INTO `role_menu` VALUES ('2709', '23', '6_4_2');
INSERT INTO `role_menu` VALUES ('2710', '23', '7');
INSERT INTO `role_menu` VALUES ('2711', '23', '7_1');
INSERT INTO `role_menu` VALUES ('2712', '23', '7_1_1');
INSERT INTO `role_menu` VALUES ('2713', '23', '7_1_2');
INSERT INTO `role_menu` VALUES ('2714', '23', '7_1_3');
INSERT INTO `role_menu` VALUES ('2715', '23', '7_1_4');
INSERT INTO `role_menu` VALUES ('2716', '23', '7_2');
INSERT INTO `role_menu` VALUES ('2717', '23', '7_3');
INSERT INTO `role_menu` VALUES ('2718', '23', '7_4');
INSERT INTO `role_menu` VALUES ('2719', '23', '8');
INSERT INTO `role_menu` VALUES ('2720', '23', '8_3');
INSERT INTO `role_menu` VALUES ('2721', '23', '8_1');
INSERT INTO `role_menu` VALUES ('2722', '23', '8_1_1');
INSERT INTO `role_menu` VALUES ('2723', '23', '8_1_2');
INSERT INTO `role_menu` VALUES ('2724', '23', '8_1_3');
INSERT INTO `role_menu` VALUES ('2725', '23', '8_2');
INSERT INTO `role_menu` VALUES ('2726', '23', '8_2_3');
INSERT INTO `role_menu` VALUES ('2727', '23', '8_2_4');
INSERT INTO `role_menu` VALUES ('2728', '23', '8_2_1');
INSERT INTO `role_menu` VALUES ('2729', '23', '8_2_2');

-- ----------------------------
-- Table structure for `staff_info`
-- ----------------------------
DROP TABLE IF EXISTS `staff_info`;
CREATE TABLE `staff_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `index_num` int(11) NOT NULL DEFAULT '0',
  `name` varchar(20) NOT NULL,
  `department_id` int(11) DEFAULT '0',
  `position_id` int(11) DEFAULT '0',
  `id_num` varchar(18) DEFAULT '0',
  `sex` int(2) DEFAULT '0',
  `birth_date` date DEFAULT NULL,
  `age` int(11) DEFAULT '0',
  `education` int(2) DEFAULT '0',
  `political_landscape` int(2) DEFAULT '0',
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `landline` varchar(20) DEFAULT NULL,
  `zip_code` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `enter_time` date DEFAULT NULL,
  `insert_time` datetime DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  `work_status` int(11) NOT NULL DEFAULT '0',
  `mz_id` int(11) DEFAULT '0',
  `zc_id` int(11) DEFAULT '0',
  `zcjb_id` int(11) DEFAULT '0',
  `zzmm_id` int(11) DEFAULT '0',
  `whcd_id` int(11) DEFAULT NULL,
  `zc_time` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=184 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of staff_info
-- ----------------------------
INSERT INTO `staff_info` VALUES ('64', '1', '胡越', '20', '1', '333433434343434', '1', null, '0', '0', '0', '', '', '', '', '', null, null, '1', '1', '2', '1', '1', '1', '1', '2014-03-28');
INSERT INTO `staff_info` VALUES ('65', '0', '孙晨光', '36', '2', '123456', '1', '2014-03-01', '0', '3', '1', '', '', '', '', '', '2014-03-01', null, '1', '3', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('66', '2', '黄德生', '7', '4', '123456', '1', '2014-03-07', '0', '1', '1', '', '', '', '', '', '2014-03-07', null, '1', '1', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('67', '0', '张泽申', '8', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('68', '0', '许浩', '20', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('69', '0', '邬竞宙', '18', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('70', '0', '朱红', '8', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('71', '0', '周克', '15', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('72', '0', '李伟荣', '11', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('73', '0', '戴维佳', '12', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('74', '0', '刘雯', '9', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('75', '0', '徐仁芳', '13', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('76', '0', '曾素清', '14', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('77', '0', '夏仪', '13', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('78', '0', '朱斌', '18', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('79', '0', '刘俊', '16', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('80', '0', '袁秀芳', '21', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('81', '0', '仇晓敏', '14', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('82', '0', '梁卫玖', '33', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('83', '0', '姜玉', '11', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('84', '0', '庄建林', '8', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('85', '0', '蔡恩茂', '20', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('86', '0', '高祯', '15', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('87', '0', '郭家胤', '34', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('88', '0', '卫鹭', '10', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('89', '0', '鲁嘉妮', '16', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('90', '0', '田芳', '10', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('91', '0', '郑文蔚', '22', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('92', '0', '李玉华', '11', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('93', '0', '贾迎春', '34', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('94', '0', '张岭', '34', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('95', '0', '章洁', '8', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('96', '0', '秦倩', '9', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('97', '0', '贾海昌', '9', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('98', '0', '顾萍', '16', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('99', '0', '崔兆华', '9', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('100', '0', '党劲梅', '34', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('101', '0', '倪佳琳', '34', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('102', '0', '袁祖英', '10', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('103', '0', '殷为申', '13', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('104', '0', '林征', '34', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('105', '0', '徐慧萍', '16', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('106', '0', '杨怀霞', '9', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('107', '0', '倪莹青', '14', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('108', '0', '吕嗣翔', '7', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('109', '0', '王震宇', '14', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('110', '0', '张姣艳', '11', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('111', '0', '张云', '11', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('112', '0', '钱蕾', '9', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('113', '0', '徐建兴', '16', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('114', '0', '夏庆华', '20', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('115', '0', '吴国莉', '16', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('116', '0', '张佳蕾', '9', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('117', '0', '徐晓意', '15', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('118', '0', '王苇沁', '14', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('119', '0', '戴寅妍', '15', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('120', '0', '毕磊', '34', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('121', '0', '唐政', '14', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('122', '0', '张磊', '11', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('123', '0', '沈阳', '14', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('124', '0', '周鹏', '11', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('125', '0', '何晓定', '8', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('126', '0', '俞进明', '21', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('127', '0', '石屏', '21', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('128', '0', '路瑶', '21', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('129', '0', '李纪龙', '21', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('130', '0', '蔡蔚', '15', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('131', '0', '徐彦', '19', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('132', '0', '许珺', '33', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('133', '0', '金晶', '33', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('134', '0', '张步', '11', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('135', '0', '刘海温', '21', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('136', '0', '陈国平', '33', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('137', '0', '沈斌', '15', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('138', '0', '戴恒玮', '16', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('139', '0', '王世雄', '9', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('140', '0', '胡嘉', '11', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('141', '0', '姜璎慈', '10', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('142', '0', '陈玉兰', '33', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('143', '0', '李胤颖', '33', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('144', '0', '黄颖', '14', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('145', '0', '黄峥', '34', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('146', '0', '孙嘉孺', '19', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('147', '0', '胡梅陵', '19', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('148', '0', '陆芸婷', '19', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('149', '0', '周方家', '11', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('150', '0', '褚秀娟', '13', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('151', '0', '刘军', '7', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('152', '0', '王建雄', '7', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('153', '0', '孙振海', '10', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('154', '0', '潘金羊', '16', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('155', '0', '唐传喜', '16', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('156', '0', '张霞', '14', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('157', '0', '汤泓', '13', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('158', '0', '郑敏', '14', '1', '123456', '0', '2014-03-01', '0', '3', '1', '', '', '', '', '', '2014-03-01', null, '1', '1', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('159', '0', '王晓亮', '7', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('160', '0', '赵琦', '31', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('161', '0', '沈辉', '7', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('162', '0', '刘小祥', '12', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('163', '0', '施玮', '12', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('164', '0', '丛远征', '7', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('165', '0', '薛慈玲', '21', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('166', '0', '潘绍卿', '11', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('167', '0', '尹宁', '14', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('168', '0', '江燕', '12', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('169', '0', '钮春瑾', '8', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('170', '0', '庞红', '12', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('171', '0', '王晶', '22', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('172', '0', '李丁芳', '7', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('173', '0', '朱晓华', '14', '1', '123456', '1', null, '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('174', '0', '李颖', '10', '6', '123456', '1', '2014-03-01', '0', '3', '2', '', '', '', '', '', '2014-03-01', null, '1', '1', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('175', '0', '陆劭勣', '8', '7', '123456', '1', '2007-02-01', '7', '3', '1', '', '', '', '', '', '2014-03-13', null, '1', '1', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('176', '0', '陆忠胜', '31', '7', '123456', '1', '2014-03-01', '0', '3', '2', '', '', '', '', '', '2014-03-01', null, '1', '1', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('177', '0', '吴金贵', '16', '5', '123456', '1', '2014-03-01', '0', '4', '2', '', '', '', '', '', '2014-03-01', null, '1', '1', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('178', '0', '金蓓', '16', '7', '123456', '0', '2014-03-01', '0', '3', '1', '', '', '', '', '', '2014-03-07', null, '1', '1', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('179', '0', '卢国良', '16', '7', '123456', '1', '2014-03-01', '0', '4', '1', '', '', '', '', '', '2014-03-01', null, '1', '1', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('180', '0', '管理员', '6', '5', '0', '1', '2014-01-01', '1', '1', '1', '0', '', '', '', '', '2014-01-01', '2014-03-04 14:55:50', '1', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('181', '0', 'xxxx', '7', '0', '', '1', null, '0', '0', '0', '', '', '', '', '', null, '2014-03-28 22:48:28', '1', '1', '0', '0', '0', '0', '0', null);
INSERT INTO `staff_info` VALUES ('182', '0', 'rrrrrrrrr', '7', '7', '', '1', null, '0', '0', '0', '', '', '', '', '', null, '2014-03-28 23:07:57', '1', '1', '2', '1', '1', '1', '1', '2014-03-28');
INSERT INTO `staff_info` VALUES ('183', '0', 'xxxxx', '7', '7', '343434343', '1', '2014-03-28', '0', '0', '0', '', '', '', '', '', null, '2014-03-28 23:09:43', '1', '1', '2', '1', '1', '1', '2', '2014-03-07');

-- ----------------------------
-- Table structure for `supplier_certificate`
-- ----------------------------
DROP TABLE IF EXISTS `supplier_certificate`;
CREATE TABLE `supplier_certificate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `num` varchar(255) DEFAULT NULL,
  `file_url1` varchar(255) DEFAULT NULL,
  `expiry_time` date DEFAULT NULL,
  `need_inspection` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of supplier_certificate
-- ----------------------------
INSERT INTO `supplier_certificate` VALUES ('11', '1', '1', '1', 'file/gysgl/0OO6K_1392792910438.docx', '2014-02-01', '0');
INSERT INTO `supplier_certificate` VALUES ('12', '1', '1', '11', 'file/gysgl/CA2VP_1392792939376.docx', '2014-02-23', '0');
INSERT INTO `supplier_certificate` VALUES ('13', '1', '1', '11111', 'file/gysgl/GVP2Y_1392792955368.docx', '2014-07-18', '0');

-- ----------------------------
-- Table structure for `supplier_info`
-- ----------------------------
DROP TABLE IF EXISTS `supplier_info`;
CREATE TABLE `supplier_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `business_license_num` varchar(255) NOT NULL,
  `business_license_file_url` varchar(50) NOT NULL,
  `business_license_expiry_time` date NOT NULL,
  `type` int(11) NOT NULL,
  `complex_level` int(11) NOT NULL,
  `contact_name` varchar(50) NOT NULL,
  `contact_phone` varchar(11) NOT NULL,
  `address` varchar(100) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `create_time` date NOT NULL,
  `last_inspection_time` date DEFAULT NULL,
  `status` int(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of supplier_info
-- ----------------------------
INSERT INTO `supplier_info` VALUES ('1', '哈药集团', 'hyjt001', 'file/jfgl/204P8_1390234608376.jpg', '2014-08-23', '1', '3', '哈药小红', '12345678901', '上海fafasf', '21', '2013-12-19', '2014-01-27', '1');
INSERT INTO `supplier_info` VALUES ('2', '飞利浦照明', 'flpzm', 'file/jfgl/4YC64_1390234657933.jpg', '2014-04-23', '1', '1', '飞利浦小蓝', '123456', '飞利浦照明', '21', '2014-01-09', '2014-01-14', '1');
INSERT INTO `supplier_info` VALUES ('3', 'Dell', 'dell001', 'file/jfgl/FG0ML_1390234689623.jpg', '2014-01-15', '2', '2', 'Dell小绿', '12345678901', '上海', '21', '2014-01-10', null, '1');
INSERT INTO `supplier_info` VALUES ('4', '上海制药', 'shzy001', 'file/jfgl/0KW8W_1390234725218.png', '2014-01-15', '1', '1', '上海制药小黄', '02155887788', '上海制药公司', '21', '2014-01-14', null, '1');
INSERT INTO `supplier_info` VALUES ('6', 'xxxx', 'xxxxx', 'file/jfgl/84PWB_1390785886483.jpg', '2014-01-31', '1', '1', 'xxxxxxxx', '11335695566', 'xxxxx', '21', '2014-01-27', null, '1');
INSERT INTO `supplier_info` VALUES ('7', '111', '111', 'file/gysgl/RE2S2_1392103090332.dll', '2014-03-05', '1', '1', '1111', '11111', '1111111', '21', '2014-02-11', null, '1');
INSERT INTO `supplier_info` VALUES ('8', 'xxxxxx', 'xxxxx', 'file/gysgl/42F8P_1392346583419.jpg', '2014-07-25', '2', '1', 'xxxxxxxxxx', 'xxxxxxxxx', 'xxxxxxxxx', '21', '2014-02-14', '2014-02-14', '1');
INSERT INTO `supplier_info` VALUES ('9', '123123', '123123123', 'file/gysgl/8VP00_1402452428583.xls', '2014-06-12', '1', '1', '123123', '123123', '123123', '180', '2014-06-11', null, '1');
INSERT INTO `supplier_info` VALUES ('10', '123123', '123', 'file/gysgl/O84MU_1402452649037.xls', '2014-06-12', '1', '1', '123123', '123123', '123123', '180', '2014-06-11', null, '1');

-- ----------------------------
-- Table structure for `supplier_inspection_log`
-- ----------------------------
DROP TABLE IF EXISTS `supplier_inspection_log`;
CREATE TABLE `supplier_inspection_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) NOT NULL,
  `complex_level` int(11) NOT NULL,
  `price_level` int(11) NOT NULL,
  `quality_level` int(11) NOT NULL,
  `service_level` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `remark` text,
  `staff_id` int(11) NOT NULL,
  `create_time` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of supplier_inspection_log
-- ----------------------------
INSERT INTO `supplier_inspection_log` VALUES ('6', '1', '1', '1', '1', '1', '0', '', '21', '2014-01-26');
INSERT INTO `supplier_inspection_log` VALUES ('7', '1', '1', '1', '1', '1', '2014', 'sdfwsfwef', '21', '2014-01-26');
INSERT INTO `supplier_inspection_log` VALUES ('8', '1', '1', '1', '1', '1', '2015', 'wegwerfwefwe', '21', '2014-01-26');
INSERT INTO `supplier_inspection_log` VALUES ('9', '1', '1', '1', '1', '1', '2013', '', '21', '2014-01-27');
INSERT INTO `supplier_inspection_log` VALUES ('10', '1', '1', '1', '1', '1', '2013', '', '21', '2014-01-27');
INSERT INTO `supplier_inspection_log` VALUES ('11', '1', '1', '1', '1', '1', '2013', '', '21', '2014-01-27');
INSERT INTO `supplier_inspection_log` VALUES ('12', '1', '1', '1', '1', '1', '2014', '', '21', '2014-01-27');
INSERT INTO `supplier_inspection_log` VALUES ('13', '1', '1', '1', '1', '1', '2015', 'wqwd', '21', '2014-01-27');
INSERT INTO `supplier_inspection_log` VALUES ('14', '1', '1', '1', '1', '1', '2014', 'qwdqwd', '21', '2014-01-27');
INSERT INTO `supplier_inspection_log` VALUES ('15', '8', '1', '1', '1', '1', '2014', 'xxxxx', '21', '2014-02-14');

-- ----------------------------
-- Table structure for `user_info`
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `pwd` varchar(50) NOT NULL,
  `grade` int(2) NOT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `status` int(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `staff_id` (`staff_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '1', '180', '23', '1');
INSERT INTO `user_info` VALUES ('10', 'cdc137', 'e10adc3949ba59abbe56e057f20f883e', '0', '175', '0', '1');
INSERT INTO `user_info` VALUES ('11', 'cdc008', '96e79218965eb72c92a549dd5a330112', '0', '70', '0', '1');
INSERT INTO `user_info` VALUES ('12', 'cdc000', 'e10adc3949ba59abbe56e057f20f883e', '0', '0', '0', '1');
INSERT INTO `user_info` VALUES ('13', 'cdc117', '96e79218965eb72c92a549dd5a330112', '0', '161', '1', '1');
INSERT INTO `user_info` VALUES ('14', 'cdc114', '96e79218965eb72c92a549dd5a330112', '0', '159', '0', '1');
INSERT INTO `user_info` VALUES ('15', 'cdc093', '96e79218965eb72c92a549dd5a330112', '0', '147', '1', '1');
INSERT INTO `user_info` VALUES ('16', 'cdc139', '96e79218965eb72c92a549dd5a330112', '0', '177', '1', '1');
INSERT INTO `user_info` VALUES ('17', 'cdc142', '96e79218965eb72c92a549dd5a330112', '0', '179', '0', '1');
INSERT INTO `user_info` VALUES ('18', 'cdc002', 'e10adc3949ba59abbe56e057f20f883e', '0', '66', '0', '1');
INSERT INTO `user_info` VALUES ('19', 'cdc003', '96e79218965eb72c92a549dd5a330112', '0', '67', '0', '1');
INSERT INTO `user_info` VALUES ('20', 'cdc005', '96e79218965eb72c92a549dd5a330112', '0', '68', '21', '1');
INSERT INTO `user_info` VALUES ('21', 'cdc007', '96e79218965eb72c92a549dd5a330112', '0', '69', '19', '1');
INSERT INTO `user_info` VALUES ('22', 'cdc012', '96e79218965eb72c92a549dd5a330112', '0', '71', '17', '1');
INSERT INTO `user_info` VALUES ('23', 'cdc013', '96e79218965eb72c92a549dd5a330112', '0', '72', '17', '1');
INSERT INTO `user_info` VALUES ('24', 'cdc015', '96e79218965eb72c92a549dd5a330112', '0', '73', '17', '1');
INSERT INTO `user_info` VALUES ('25', 'cdc016', '96e79218965eb72c92a549dd5a330112', '0', '74', '17', '1');
INSERT INTO `user_info` VALUES ('26', 'cdc017', '96e79218965eb72c92a549dd5a330112', '0', '75', '17', '1');
INSERT INTO `user_info` VALUES ('27', 'cdc018', '96e79218965eb72c92a549dd5a330112', '0', '76', '17', '1');
INSERT INTO `user_info` VALUES ('28', 'cdc019', '96e79218965eb72c92a549dd5a330112', '0', '77', '0', '1');
INSERT INTO `user_info` VALUES ('29', 'cdc020', '96e79218965eb72c92a549dd5a330112', '0', '78', '0', '1');
INSERT INTO `user_info` VALUES ('30', 'cdc021', '96e79218965eb72c92a549dd5a330112', '0', '79', '17', '1');
INSERT INTO `user_info` VALUES ('31', 'cdc023', '96e79218965eb72c92a549dd5a330112', '0', '80', '17', '1');
INSERT INTO `user_info` VALUES ('32', 'cdc024', '96e79218965eb72c92a549dd5a330112', '0', '81', '17', '1');
INSERT INTO `user_info` VALUES ('33', 'cdc025', '96e79218965eb72c92a549dd5a330112', '0', '82', '1', '1');
INSERT INTO `user_info` VALUES ('34', 'cdc026', 'e3ceb5881a0a1fdaad01296d7554868d', '0', '83', '1', '1');
INSERT INTO `user_info` VALUES ('35', 'cdc027', '96e79218965eb72c92a549dd5a330112', '0', '84', '17', '1');
INSERT INTO `user_info` VALUES ('36', 'cdc028', '96e79218965eb72c92a549dd5a330112', '0', '85', '21', '1');
INSERT INTO `user_info` VALUES ('37', 'cdc029', '96e79218965eb72c92a549dd5a330112', '0', '86', '17', '1');
INSERT INTO `user_info` VALUES ('38', 'cdc030', '96e79218965eb72c92a549dd5a330112', '0', '87', '17', '1');
INSERT INTO `user_info` VALUES ('39', 'cdc031', '96e79218965eb72c92a549dd5a330112', '0', '88', '17', '1');
INSERT INTO `user_info` VALUES ('40', 'cdc032', '96e79218965eb72c92a549dd5a330112', '0', '89', '17', '1');
INSERT INTO `user_info` VALUES ('41', 'cdc033', '96e79218965eb72c92a549dd5a330112', '0', '90', '17', '1');
INSERT INTO `user_info` VALUES ('42', 'cdc034', '96e79218965eb72c92a549dd5a330112', '0', '91', '1', '1');
INSERT INTO `user_info` VALUES ('43', 'cdc035', '96e79218965eb72c92a549dd5a330112', '0', '92', '17', '1');
INSERT INTO `user_info` VALUES ('44', 'cdc036', '96e79218965eb72c92a549dd5a330112', '0', '93', '17', '1');
INSERT INTO `user_info` VALUES ('45', 'cdc037', '96e79218965eb72c92a549dd5a330112', '0', '94', '17', '1');
INSERT INTO `user_info` VALUES ('46', 'cdc038', '96e79218965eb72c92a549dd5a330112', '0', '95', '1', '1');
INSERT INTO `user_info` VALUES ('47', 'cdc039', '96e79218965eb72c92a549dd5a330112', '0', '96', '17', '1');
INSERT INTO `user_info` VALUES ('48', 'cdc040', '96e79218965eb72c92a549dd5a330112', '0', '97', '17', '1');
INSERT INTO `user_info` VALUES ('49', 'cdc041', '96e79218965eb72c92a549dd5a330112', '0', '98', '17', '1');
INSERT INTO `user_info` VALUES ('50', 'cdc042', '96e79218965eb72c92a549dd5a330112', '0', '99', '17', '1');
INSERT INTO `user_info` VALUES ('51', 'cdc043', '96e79218965eb72c92a549dd5a330112', '0', '100', '17', '1');
INSERT INTO `user_info` VALUES ('52', 'cdc045', '96e79218965eb72c92a549dd5a330112', '0', '101', '1', '1');
INSERT INTO `user_info` VALUES ('53', 'cdc046', '96e79218965eb72c92a549dd5a330112', '0', '102', '17', '1');
INSERT INTO `user_info` VALUES ('54', 'cdc047', '96e79218965eb72c92a549dd5a330112', '0', '103', '17', '1');
INSERT INTO `user_info` VALUES ('55', 'cdc048', '96e79218965eb72c92a549dd5a330112', '0', '104', '17', '1');
INSERT INTO `user_info` VALUES ('56', 'cdc049', '96e79218965eb72c92a549dd5a330112', '0', '105', '17', '1');
INSERT INTO `user_info` VALUES ('57', 'cdc051', '96e79218965eb72c92a549dd5a330112', '0', '107', '1', '1');
INSERT INTO `user_info` VALUES ('58', 'cdc052', '96e79218965eb72c92a549dd5a330112', '0', '108', '0', '1');
INSERT INTO `user_info` VALUES ('59', 'cdc053', '96e79218965eb72c92a549dd5a330112', '0', '109', '0', '1');
INSERT INTO `user_info` VALUES ('60', 'cdc054', '96e79218965eb72c92a549dd5a330112', '0', '110', '0', '1');
INSERT INTO `user_info` VALUES ('61', 'cdc055', '96e79218965eb72c92a549dd5a330112', '0', '111', '0', '1');
INSERT INTO `user_info` VALUES ('62', 'cdc057', '96e79218965eb72c92a549dd5a330112', '0', '113', '0', '1');
INSERT INTO `user_info` VALUES ('63', 'cdc059', '96e79218965eb72c92a549dd5a330112', '0', '115', '0', '1');
INSERT INTO `user_info` VALUES ('64', 'cdc060', '96e79218965eb72c92a549dd5a330112', '0', '116', '0', '1');
INSERT INTO `user_info` VALUES ('65', 'cdc061', '96e79218965eb72c92a549dd5a330112', '0', '117', '0', '1');
INSERT INTO `user_info` VALUES ('66', 'cdc062', '96e79218965eb72c92a549dd5a330112', '0', '118', '0', '1');
INSERT INTO `user_info` VALUES ('67', 'cdc063', '96e79218965eb72c92a549dd5a330112', '0', '119', '0', '1');
INSERT INTO `user_info` VALUES ('68', 'cdc064', '96e79218965eb72c92a549dd5a330112', '0', '120', '0', '1');
INSERT INTO `user_info` VALUES ('69', 'cdc066', '96e79218965eb72c92a549dd5a330112', '0', '122', '0', '1');
INSERT INTO `user_info` VALUES ('70', 'cdc067', '96e79218965eb72c92a549dd5a330112', '0', '123', '0', '1');
INSERT INTO `user_info` VALUES ('71', 'cdc068', '96e79218965eb72c92a549dd5a330112', '0', '124', '0', '1');
INSERT INTO `user_info` VALUES ('72', 'cdc069', '96e79218965eb72c92a549dd5a330112', '0', '125', '0', '1');
INSERT INTO `user_info` VALUES ('73', 'cdc070', '96e79218965eb72c92a549dd5a330112', '0', '126', '0', '1');
INSERT INTO `user_info` VALUES ('74', 'cdc071', '96e79218965eb72c92a549dd5a330112', '0', '127', '0', '1');
INSERT INTO `user_info` VALUES ('75', 'cdc073', '96e79218965eb72c92a549dd5a330112', '0', '129', '0', '1');
INSERT INTO `user_info` VALUES ('76', 'cdc074', '96e79218965eb72c92a549dd5a330112', '0', '130', '0', '1');
INSERT INTO `user_info` VALUES ('77', 'cdc075', '96e79218965eb72c92a549dd5a330112', '0', '131', '0', '1');
INSERT INTO `user_info` VALUES ('78', 'cdc076', '96e79218965eb72c92a549dd5a330112', '0', '132', '0', '1');
INSERT INTO `user_info` VALUES ('79', 'cdc077', '96e79218965eb72c92a549dd5a330112', '0', '133', '0', '1');
INSERT INTO `user_info` VALUES ('80', 'cdc078', '96e79218965eb72c92a549dd5a330112', '0', '134', '0', '1');
INSERT INTO `user_info` VALUES ('81', 'cdc079', '96e79218965eb72c92a549dd5a330112', '0', '135', '0', '1');
INSERT INTO `user_info` VALUES ('82', 'cdc080', '96e79218965eb72c92a549dd5a330112', '0', '136', '0', '1');
INSERT INTO `user_info` VALUES ('83', 'cdc081', '96e79218965eb72c92a549dd5a330112', '0', '137', '0', '1');
INSERT INTO `user_info` VALUES ('84', 'cdc082', '96e79218965eb72c92a549dd5a330112', '0', '138', '0', '1');
INSERT INTO `user_info` VALUES ('85', 'cdc083', '96e79218965eb72c92a549dd5a330112', '0', '139', '0', '1');
INSERT INTO `user_info` VALUES ('86', 'cdc084', '96e79218965eb72c92a549dd5a330112', '0', '140', '0', '1');
INSERT INTO `user_info` VALUES ('87', 'cdc085', '96e79218965eb72c92a549dd5a330112', '0', '141', '0', '1');
INSERT INTO `user_info` VALUES ('88', 'cdc086', '96e79218965eb72c92a549dd5a330112', '0', '142', '0', '1');
INSERT INTO `user_info` VALUES ('89', 'cdc087', '96e79218965eb72c92a549dd5a330112', '0', '143', '0', '1');
INSERT INTO `user_info` VALUES ('90', 'cdc088', '96e79218965eb72c92a549dd5a330112', '0', '144', '0', '1');
INSERT INTO `user_info` VALUES ('91', 'cdc089', '96e79218965eb72c92a549dd5a330112', '0', '145', '0', '1');
INSERT INTO `user_info` VALUES ('92', 'cdc091', '96e79218965eb72c92a549dd5a330112', '0', '146', '0', '1');
INSERT INTO `user_info` VALUES ('93', 'cdc094', '96e79218965eb72c92a549dd5a330112', '0', '148', '0', '1');
INSERT INTO `user_info` VALUES ('94', 'cdc095', '96e79218965eb72c92a549dd5a330112', '0', '149', '0', '1');
INSERT INTO `user_info` VALUES ('95', 'cdc097', '96e79218965eb72c92a549dd5a330112', '0', '150', '0', '1');
INSERT INTO `user_info` VALUES ('96', 'cdc099', '96e79218965eb72c92a549dd5a330112', '0', '151', '0', '1');
INSERT INTO `user_info` VALUES ('97', 'cdc103', '96e79218965eb72c92a549dd5a330112', '0', '152', '0', '1');
INSERT INTO `user_info` VALUES ('98', 'cdc105', '96e79218965eb72c92a549dd5a330112', '0', '153', '0', '1');
INSERT INTO `user_info` VALUES ('99', 'cdc108', '96e79218965eb72c92a549dd5a330112', '0', '154', '0', '1');
INSERT INTO `user_info` VALUES ('100', 'cdc110', '96e79218965eb72c92a549dd5a330112', '0', '155', '0', '1');
INSERT INTO `user_info` VALUES ('101', 'cdc111', '96e79218965eb72c92a549dd5a330112', '0', '156', '0', '1');
INSERT INTO `user_info` VALUES ('102', 'cdc112', '96e79218965eb72c92a549dd5a330112', '0', '157', '0', '1');
INSERT INTO `user_info` VALUES ('103', 'cdc113', '96e79218965eb72c92a549dd5a330112', '0', '158', '0', '1');
INSERT INTO `user_info` VALUES ('104', 'cdc115', '96e79218965eb72c92a549dd5a330112', '0', '160', '0', '1');
INSERT INTO `user_info` VALUES ('105', 'cdc118', '96e79218965eb72c92a549dd5a330112', '0', '162', '0', '1');
INSERT INTO `user_info` VALUES ('106', 'cdc119', '96e79218965eb72c92a549dd5a330112', '0', '163', '0', '1');
INSERT INTO `user_info` VALUES ('107', 'cdc122', '96e79218965eb72c92a549dd5a330112', '0', '165', '0', '1');
INSERT INTO `user_info` VALUES ('108', 'cdc124', '96e79218965eb72c92a549dd5a330112', '0', '166', '0', '1');
INSERT INTO `user_info` VALUES ('109', 'cdc125', '96e79218965eb72c92a549dd5a330112', '0', '167', '0', '1');
INSERT INTO `user_info` VALUES ('110', 'cdc126', '96e79218965eb72c92a549dd5a330112', '0', '168', '0', '1');
INSERT INTO `user_info` VALUES ('111', 'cdc127', '96e79218965eb72c92a549dd5a330112', '0', '169', '0', '1');
INSERT INTO `user_info` VALUES ('112', 'cdc128', '96e79218965eb72c92a549dd5a330112', '0', '170', '0', '1');
INSERT INTO `user_info` VALUES ('113', 'cdc130', '96e79218965eb72c92a549dd5a330112', '0', '171', '0', '1');
INSERT INTO `user_info` VALUES ('114', 'cdc131', '96e79218965eb72c92a549dd5a330112', '0', '172', '0', '1');
INSERT INTO `user_info` VALUES ('115', 'cdc132', '96e79218965eb72c92a549dd5a330112', '0', '173', '0', '1');
INSERT INTO `user_info` VALUES ('116', 'cdc133', '96e79218965eb72c92a549dd5a330112', '0', '174', '0', '1');
INSERT INTO `user_info` VALUES ('117', 'cdc138', '96e79218965eb72c92a549dd5a330112', '0', '176', '0', '1');
INSERT INTO `user_info` VALUES ('118', 'cdc140', '96e79218965eb72c92a549dd5a330112', '0', '178', '0', '1');
INSERT INTO `user_info` VALUES ('120', 'xxxxxx', 'e10adc3949ba59abbe56e057f20f883e', '0', '128', '17', '1');

-- ----------------------------
-- Table structure for `user_menu`
-- ----------------------------
DROP TABLE IF EXISTS `user_menu`;
CREATE TABLE `user_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `menu_key` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9725 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_menu
-- ----------------------------
INSERT INTO `user_menu` VALUES ('3785', '8', '1');
INSERT INTO `user_menu` VALUES ('3786', '8', '1_1');
INSERT INTO `user_menu` VALUES ('3787', '8', '1_1_1');
INSERT INTO `user_menu` VALUES ('3788', '8', '1_1_2');
INSERT INTO `user_menu` VALUES ('3789', '8', '1_1_5');
INSERT INTO `user_menu` VALUES ('3790', '8', '1_1_6');
INSERT INTO `user_menu` VALUES ('3791', '8', '1_2');
INSERT INTO `user_menu` VALUES ('3792', '8', '1_2_1');
INSERT INTO `user_menu` VALUES ('3793', '8', '1_2_1_1');
INSERT INTO `user_menu` VALUES ('3794', '8', '1_2_1_2');
INSERT INTO `user_menu` VALUES ('3795', '8', '1_2_1_4');
INSERT INTO `user_menu` VALUES ('3796', '8', '1_2_2');
INSERT INTO `user_menu` VALUES ('3797', '8', '1_2_2_1');
INSERT INTO `user_menu` VALUES ('3798', '8', '1_2_2_1_1');
INSERT INTO `user_menu` VALUES ('3799', '8', '1_2_2_1_2');
INSERT INTO `user_menu` VALUES ('3800', '8', '1_2_2_1_5');
INSERT INTO `user_menu` VALUES ('3801', '8', '1_2_2_2');
INSERT INTO `user_menu` VALUES ('3802', '8', '1_2_2_2_1');
INSERT INTO `user_menu` VALUES ('3803', '8', '1_2_2_2_3');
INSERT INTO `user_menu` VALUES ('3804', '8', '1_2_2_2_2');
INSERT INTO `user_menu` VALUES ('3805', '8', '1_3');
INSERT INTO `user_menu` VALUES ('3806', '8', '1_3_1');
INSERT INTO `user_menu` VALUES ('3807', '8', '1_3_2');
INSERT INTO `user_menu` VALUES ('3808', '8', '1_3_3');
INSERT INTO `user_menu` VALUES ('3809', '8', '1_3_5');
INSERT INTO `user_menu` VALUES ('3810', '8', '1_4');
INSERT INTO `user_menu` VALUES ('3811', '8', '1_4_1');
INSERT INTO `user_menu` VALUES ('3812', '8', '1_4_2');
INSERT INTO `user_menu` VALUES ('3813', '8', '1_4_3');
INSERT INTO `user_menu` VALUES ('3814', '8', '1_5');
INSERT INTO `user_menu` VALUES ('3815', '8', '1_5_1');
INSERT INTO `user_menu` VALUES ('3816', '8', '1_5_1_1');
INSERT INTO `user_menu` VALUES ('3817', '8', '1_5_1_2');
INSERT INTO `user_menu` VALUES ('3818', '8', '1_5_1_3');
INSERT INTO `user_menu` VALUES ('3819', '8', '1_5_2');
INSERT INTO `user_menu` VALUES ('3820', '8', '1_5_2_1');
INSERT INTO `user_menu` VALUES ('3821', '8', '1_5_2_2');
INSERT INTO `user_menu` VALUES ('3822', '8', '1_5_2_3');
INSERT INTO `user_menu` VALUES ('3823', '8', '1_5_3');
INSERT INTO `user_menu` VALUES ('3824', '8', '1_5_3_1');
INSERT INTO `user_menu` VALUES ('3825', '8', '1_5_3_2');
INSERT INTO `user_menu` VALUES ('3826', '8', '1_5_4');
INSERT INTO `user_menu` VALUES ('3827', '8', '1_5_4_1');
INSERT INTO `user_menu` VALUES ('3828', '8', '1_5_4_2');
INSERT INTO `user_menu` VALUES ('3829', '8', '1_5_5');
INSERT INTO `user_menu` VALUES ('3830', '8', '1_5_5_1');
INSERT INTO `user_menu` VALUES ('3831', '8', '1_5_5_2');
INSERT INTO `user_menu` VALUES ('3832', '8', '1_5_5_3');
INSERT INTO `user_menu` VALUES ('3833', '8', '1_5_6');
INSERT INTO `user_menu` VALUES ('3834', '8', '1_5_6_1');
INSERT INTO `user_menu` VALUES ('3835', '8', '1_5_6_2');
INSERT INTO `user_menu` VALUES ('3836', '8', '1_5_6_3');
INSERT INTO `user_menu` VALUES ('3837', '8', '1_6');
INSERT INTO `user_menu` VALUES ('3838', '8', '1_6_1');
INSERT INTO `user_menu` VALUES ('3839', '8', '1_6_1_1');
INSERT INTO `user_menu` VALUES ('3840', '8', '1_6_1_1_1');
INSERT INTO `user_menu` VALUES ('3841', '8', '1_6_1_1_2');
INSERT INTO `user_menu` VALUES ('3842', '8', '1_6_1_1_3');
INSERT INTO `user_menu` VALUES ('3843', '8', '1_6_1_1_4');
INSERT INTO `user_menu` VALUES ('3844', '8', '1_6_1_1_5');
INSERT INTO `user_menu` VALUES ('3845', '8', '1_6_1_2');
INSERT INTO `user_menu` VALUES ('3846', '8', '1_6_1_2_1');
INSERT INTO `user_menu` VALUES ('3847', '8', '1_6_1_2_2');
INSERT INTO `user_menu` VALUES ('3848', '8', '1_6_1_2_3');
INSERT INTO `user_menu` VALUES ('3849', '8', '1_6_1_2_4');
INSERT INTO `user_menu` VALUES ('3850', '8', '1_6_1_2_5');
INSERT INTO `user_menu` VALUES ('3851', '8', '1_6_2');
INSERT INTO `user_menu` VALUES ('3852', '8', '1_6_2_1');
INSERT INTO `user_menu` VALUES ('3853', '8', '1_6_2_1_1');
INSERT INTO `user_menu` VALUES ('3854', '8', '1_6_2_1_2');
INSERT INTO `user_menu` VALUES ('3855', '8', '1_6_2_1_3');
INSERT INTO `user_menu` VALUES ('3856', '8', '1_6_2_1_4');
INSERT INTO `user_menu` VALUES ('3857', '8', '1_6_2_1_5');
INSERT INTO `user_menu` VALUES ('3858', '8', '1_6_2_2');
INSERT INTO `user_menu` VALUES ('3859', '8', '1_6_2_2_1');
INSERT INTO `user_menu` VALUES ('3860', '8', '1_6_2_2_2');
INSERT INTO `user_menu` VALUES ('3861', '8', '1_6_2_2_3');
INSERT INTO `user_menu` VALUES ('3862', '8', '1_6_2_2_4');
INSERT INTO `user_menu` VALUES ('3863', '8', '1_6_2_2_5');
INSERT INTO `user_menu` VALUES ('3864', '8', '1_6_3');
INSERT INTO `user_menu` VALUES ('3865', '8', '1_6_3_1');
INSERT INTO `user_menu` VALUES ('3866', '8', '1_6_3_1_1');
INSERT INTO `user_menu` VALUES ('3867', '8', '1_6_3_1_2');
INSERT INTO `user_menu` VALUES ('3868', '8', '1_6_3_1_3');
INSERT INTO `user_menu` VALUES ('3869', '8', '1_6_3_1_4');
INSERT INTO `user_menu` VALUES ('3870', '8', '1_6_3_1_5');
INSERT INTO `user_menu` VALUES ('3871', '8', '1_6_3_2');
INSERT INTO `user_menu` VALUES ('3872', '8', '1_6_3_2_1');
INSERT INTO `user_menu` VALUES ('3873', '8', '1_6_3_2_2');
INSERT INTO `user_menu` VALUES ('3874', '8', '1_6_3_2_3');
INSERT INTO `user_menu` VALUES ('3875', '8', '1_6_3_2_4');
INSERT INTO `user_menu` VALUES ('3876', '8', '1_6_3_2_5');
INSERT INTO `user_menu` VALUES ('3877', '8', '1_6_4');
INSERT INTO `user_menu` VALUES ('3878', '8', '1_6_4_1');
INSERT INTO `user_menu` VALUES ('3879', '8', '1_6_4_2');
INSERT INTO `user_menu` VALUES ('3880', '8', '1_6_4_3');
INSERT INTO `user_menu` VALUES ('3881', '8', '1_6_4_5');
INSERT INTO `user_menu` VALUES ('3882', '8', '1_6_4_4');
INSERT INTO `user_menu` VALUES ('3883', '8', '1_6_5');
INSERT INTO `user_menu` VALUES ('3884', '8', '1_6_5_1');
INSERT INTO `user_menu` VALUES ('3885', '8', '1_6_5_2');
INSERT INTO `user_menu` VALUES ('3886', '8', '1_6_5_3');
INSERT INTO `user_menu` VALUES ('3887', '8', '1_6_5_4');
INSERT INTO `user_menu` VALUES ('3888', '8', '1_6_5_5');
INSERT INTO `user_menu` VALUES ('3889', '8', '1_6_6');
INSERT INTO `user_menu` VALUES ('3890', '8', '1_6_6_1');
INSERT INTO `user_menu` VALUES ('3891', '8', '1_6_6_2');
INSERT INTO `user_menu` VALUES ('3892', '8', '1_6_6_3');
INSERT INTO `user_menu` VALUES ('3893', '8', '1_6_6_4');
INSERT INTO `user_menu` VALUES ('3894', '8', '1_6_6_5');
INSERT INTO `user_menu` VALUES ('3895', '8', '1_6_7');
INSERT INTO `user_menu` VALUES ('3896', '8', '1_6_7_1');
INSERT INTO `user_menu` VALUES ('3897', '8', '1_6_7_2');
INSERT INTO `user_menu` VALUES ('3898', '8', '1_6_7_3');
INSERT INTO `user_menu` VALUES ('3899', '8', '1_6_7_4');
INSERT INTO `user_menu` VALUES ('3900', '8', '1_6_8');
INSERT INTO `user_menu` VALUES ('3901', '8', '1_6_8_1');
INSERT INTO `user_menu` VALUES ('3902', '8', '1_6_8_2');
INSERT INTO `user_menu` VALUES ('3903', '8', '1_6_8_3');
INSERT INTO `user_menu` VALUES ('3904', '8', '1_6_8_4');
INSERT INTO `user_menu` VALUES ('3905', '8', '1_6_8_5');
INSERT INTO `user_menu` VALUES ('3906', '8', '1_7');
INSERT INTO `user_menu` VALUES ('3907', '8', '1_7_5');
INSERT INTO `user_menu` VALUES ('3908', '8', '1_7_1');
INSERT INTO `user_menu` VALUES ('3909', '8', '1_7_2');
INSERT INTO `user_menu` VALUES ('3910', '8', '1_7_3');
INSERT INTO `user_menu` VALUES ('3911', '8', '1_7_4');
INSERT INTO `user_menu` VALUES ('3912', '8', '1_8');
INSERT INTO `user_menu` VALUES ('3913', '8', '1_8_1');
INSERT INTO `user_menu` VALUES ('3914', '8', '1_8_2');
INSERT INTO `user_menu` VALUES ('3915', '8', '1_8_3');
INSERT INTO `user_menu` VALUES ('3916', '8', '1_8_4');
INSERT INTO `user_menu` VALUES ('3917', '8', '1_8_5');
INSERT INTO `user_menu` VALUES ('3918', '8', '2');
INSERT INTO `user_menu` VALUES ('3919', '8', '2_1');
INSERT INTO `user_menu` VALUES ('3920', '8', '2_1_1');
INSERT INTO `user_menu` VALUES ('3921', '8', '2_1_1_1');
INSERT INTO `user_menu` VALUES ('3922', '8', '2_1_1_2');
INSERT INTO `user_menu` VALUES ('3923', '8', '2_1_1_3');
INSERT INTO `user_menu` VALUES ('3924', '8', '2_1_1_3_1');
INSERT INTO `user_menu` VALUES ('3925', '8', '2_1_1_3_2');
INSERT INTO `user_menu` VALUES ('3926', '8', '2_1_1_3_3');
INSERT INTO `user_menu` VALUES ('3927', '8', '2_1_1_4');
INSERT INTO `user_menu` VALUES ('3928', '8', '2_1_1_4_1');
INSERT INTO `user_menu` VALUES ('3929', '8', '2_1_1_4_2');
INSERT INTO `user_menu` VALUES ('3930', '8', '2_1_1_4_3');
INSERT INTO `user_menu` VALUES ('3931', '8', '2_1_2');
INSERT INTO `user_menu` VALUES ('3932', '8', '2_1_2_4');
INSERT INTO `user_menu` VALUES ('3933', '8', '2_1_2_1');
INSERT INTO `user_menu` VALUES ('3934', '8', '2_1_2_2');
INSERT INTO `user_menu` VALUES ('3935', '8', '2_1_2_3');
INSERT INTO `user_menu` VALUES ('3936', '8', '2_2');
INSERT INTO `user_menu` VALUES ('3937', '8', '2_2_1');
INSERT INTO `user_menu` VALUES ('3938', '8', '2_2_1_2');
INSERT INTO `user_menu` VALUES ('3939', '8', '2_2_1_1');
INSERT INTO `user_menu` VALUES ('3940', '8', '2_2_1_3');
INSERT INTO `user_menu` VALUES ('3941', '8', '2_2_1_4');
INSERT INTO `user_menu` VALUES ('3942', '8', '2_3');
INSERT INTO `user_menu` VALUES ('3943', '8', '2_3_1');
INSERT INTO `user_menu` VALUES ('3944', '8', '2_3_1_2');
INSERT INTO `user_menu` VALUES ('3945', '8', '2_3_1_1');
INSERT INTO `user_menu` VALUES ('3946', '8', '2_3_1_3');
INSERT INTO `user_menu` VALUES ('3947', '8', '2_3_1_4');
INSERT INTO `user_menu` VALUES ('3948', '8', '2_4');
INSERT INTO `user_menu` VALUES ('3949', '8', '2_4_1');
INSERT INTO `user_menu` VALUES ('3950', '8', '2_4_1_1');
INSERT INTO `user_menu` VALUES ('3951', '8', '2_4_1_2');
INSERT INTO `user_menu` VALUES ('3952', '8', '2_4_1_3');
INSERT INTO `user_menu` VALUES ('3953', '8', '2_6');
INSERT INTO `user_menu` VALUES ('3954', '8', '2_6_1');
INSERT INTO `user_menu` VALUES ('3955', '8', '2_6_1_2');
INSERT INTO `user_menu` VALUES ('3956', '8', '2_6_1_1');
INSERT INTO `user_menu` VALUES ('3957', '8', '2_6_1_3');
INSERT INTO `user_menu` VALUES ('3958', '8', '2_6_1_4');
INSERT INTO `user_menu` VALUES ('3959', '8', '3');
INSERT INTO `user_menu` VALUES ('3960', '8', '3_1');
INSERT INTO `user_menu` VALUES ('3961', '8', '3_1_1');
INSERT INTO `user_menu` VALUES ('3962', '8', '3_1_2');
INSERT INTO `user_menu` VALUES ('3963', '8', '3_1_3');
INSERT INTO `user_menu` VALUES ('3964', '8', '3_1_4');
INSERT INTO `user_menu` VALUES ('3965', '8', '3_1_5');
INSERT INTO `user_menu` VALUES ('3966', '8', '4');
INSERT INTO `user_menu` VALUES ('3967', '8', '4_2');
INSERT INTO `user_menu` VALUES ('3968', '8', '4_2_1');
INSERT INTO `user_menu` VALUES ('3969', '8', '4_2_2');
INSERT INTO `user_menu` VALUES ('3970', '8', '4_2_3');
INSERT INTO `user_menu` VALUES ('3971', '8', '4_2_4');
INSERT INTO `user_menu` VALUES ('3972', '8', '4_2_5');
INSERT INTO `user_menu` VALUES ('3973', '8', '4_2_6');
INSERT INTO `user_menu` VALUES ('3974', '8', '4_2_7');
INSERT INTO `user_menu` VALUES ('3975', '8', '4_2_8');
INSERT INTO `user_menu` VALUES ('3976', '8', '4_2_9');
INSERT INTO `user_menu` VALUES ('3977', '8', '4_3');
INSERT INTO `user_menu` VALUES ('3978', '8', '4_3_1');
INSERT INTO `user_menu` VALUES ('3979', '8', '4_3_2');
INSERT INTO `user_menu` VALUES ('3980', '8', '5');
INSERT INTO `user_menu` VALUES ('3981', '8', '5_1');
INSERT INTO `user_menu` VALUES ('3982', '8', '5_1_1');
INSERT INTO `user_menu` VALUES ('3983', '8', '5_1_2');
INSERT INTO `user_menu` VALUES ('3984', '8', '5_1_3');
INSERT INTO `user_menu` VALUES ('3985', '8', '5_1_4');
INSERT INTO `user_menu` VALUES ('3986', '8', '5_2');
INSERT INTO `user_menu` VALUES ('3987', '8', '5_2_1');
INSERT INTO `user_menu` VALUES ('3988', '8', '5_2_1_1');
INSERT INTO `user_menu` VALUES ('3989', '8', '5_2_1_2');
INSERT INTO `user_menu` VALUES ('3990', '8', '5_2_1_3');
INSERT INTO `user_menu` VALUES ('3991', '8', '5_2_1_4');
INSERT INTO `user_menu` VALUES ('3992', '8', '5_2_1_5');
INSERT INTO `user_menu` VALUES ('3993', '8', '5_2_2');
INSERT INTO `user_menu` VALUES ('3994', '8', '5_2_2_1');
INSERT INTO `user_menu` VALUES ('3995', '8', '5_2_2_2');
INSERT INTO `user_menu` VALUES ('3996', '8', '5_2_2_3');
INSERT INTO `user_menu` VALUES ('3997', '8', '5_2_2_4');
INSERT INTO `user_menu` VALUES ('3998', '8', '5_2_2_5');
INSERT INTO `user_menu` VALUES ('3999', '8', '5_3');
INSERT INTO `user_menu` VALUES ('4000', '8', '5_3_1');
INSERT INTO `user_menu` VALUES ('4001', '8', '5_3_1_1');
INSERT INTO `user_menu` VALUES ('4002', '8', '5_3_1_2');
INSERT INTO `user_menu` VALUES ('4003', '8', '5_3_1_3');
INSERT INTO `user_menu` VALUES ('4004', '8', '5_3_1_4');
INSERT INTO `user_menu` VALUES ('4005', '8', '5_3_1_5');
INSERT INTO `user_menu` VALUES ('4006', '8', '5_3_2');
INSERT INTO `user_menu` VALUES ('4007', '8', '5_3_2_1');
INSERT INTO `user_menu` VALUES ('4008', '8', '5_3_2_2');
INSERT INTO `user_menu` VALUES ('4009', '8', '5_3_2_4');
INSERT INTO `user_menu` VALUES ('4010', '8', '5_3_2_5');
INSERT INTO `user_menu` VALUES ('4011', '8', '5_4');
INSERT INTO `user_menu` VALUES ('4012', '8', '5_4_1');
INSERT INTO `user_menu` VALUES ('4013', '8', '5_4_2');
INSERT INTO `user_menu` VALUES ('4014', '8', '5_4_3');
INSERT INTO `user_menu` VALUES ('4015', '8', '5_4_4');
INSERT INTO `user_menu` VALUES ('4016', '8', '5_4_5');
INSERT INTO `user_menu` VALUES ('4017', '8', '5_5');
INSERT INTO `user_menu` VALUES ('4018', '8', '5_5_1');
INSERT INTO `user_menu` VALUES ('4019', '8', '5_5_2');
INSERT INTO `user_menu` VALUES ('4020', '8', '5_5_3');
INSERT INTO `user_menu` VALUES ('4021', '8', '5_5_4');
INSERT INTO `user_menu` VALUES ('4022', '8', '5_5_5');
INSERT INTO `user_menu` VALUES ('4023', '8', '5_5_6');
INSERT INTO `user_menu` VALUES ('4024', '8', '5_5_6_1');
INSERT INTO `user_menu` VALUES ('4025', '8', '5_5_6_2');
INSERT INTO `user_menu` VALUES ('4026', '8', '5_5_6_3');
INSERT INTO `user_menu` VALUES ('4027', '8', '5_5_6_4');
INSERT INTO `user_menu` VALUES ('4028', '8', '5_5_6_5');
INSERT INTO `user_menu` VALUES ('4029', '8', '6');
INSERT INTO `user_menu` VALUES ('4030', '8', '6_1');
INSERT INTO `user_menu` VALUES ('4031', '8', '6_1_1');
INSERT INTO `user_menu` VALUES ('4032', '8', '6_1_1_1');
INSERT INTO `user_menu` VALUES ('4033', '8', '6_1_1_2');
INSERT INTO `user_menu` VALUES ('4034', '8', '6_1_1_3');
INSERT INTO `user_menu` VALUES ('4035', '8', '6_1_1_4');
INSERT INTO `user_menu` VALUES ('4036', '8', '6_1_1_5');
INSERT INTO `user_menu` VALUES ('4037', '8', '6_1_2');
INSERT INTO `user_menu` VALUES ('4038', '8', '6_1_2_1');
INSERT INTO `user_menu` VALUES ('4039', '8', '6_1_2_2');
INSERT INTO `user_menu` VALUES ('4040', '8', '6_1_2_3');
INSERT INTO `user_menu` VALUES ('4041', '8', '6_1_2_4');
INSERT INTO `user_menu` VALUES ('4042', '8', '6_1_2_5');
INSERT INTO `user_menu` VALUES ('4043', '8', '6_2');
INSERT INTO `user_menu` VALUES ('4044', '8', '6_2_1');
INSERT INTO `user_menu` VALUES ('4045', '8', '6_2_2');
INSERT INTO `user_menu` VALUES ('4046', '8', '6_2_3');
INSERT INTO `user_menu` VALUES ('4047', '8', '6_2_4');
INSERT INTO `user_menu` VALUES ('4048', '8', '6_2_5');
INSERT INTO `user_menu` VALUES ('4049', '8', '6_3');
INSERT INTO `user_menu` VALUES ('4050', '8', '6_3_1');
INSERT INTO `user_menu` VALUES ('4051', '8', '6_3_2');
INSERT INTO `user_menu` VALUES ('4052', '8', '6_3_3');
INSERT INTO `user_menu` VALUES ('4053', '8', '6_3_4');
INSERT INTO `user_menu` VALUES ('4054', '8', '6_3_5');
INSERT INTO `user_menu` VALUES ('4055', '8', '6_4');
INSERT INTO `user_menu` VALUES ('4056', '8', '6_4_1');
INSERT INTO `user_menu` VALUES ('4057', '8', '6_4_2');
INSERT INTO `user_menu` VALUES ('4058', '8', '6_4_3');
INSERT INTO `user_menu` VALUES ('4059', '8', '6_4_4');
INSERT INTO `user_menu` VALUES ('4060', '8', '6_4_5');
INSERT INTO `user_menu` VALUES ('4061', '8', '6_5');
INSERT INTO `user_menu` VALUES ('4062', '8', '6_5_1');
INSERT INTO `user_menu` VALUES ('4063', '8', '6_5_2');
INSERT INTO `user_menu` VALUES ('4064', '8', '6_5_3');
INSERT INTO `user_menu` VALUES ('4065', '8', '6_5_4');
INSERT INTO `user_menu` VALUES ('4066', '8', '6_5_5');
INSERT INTO `user_menu` VALUES ('4067', '8', '6_6');
INSERT INTO `user_menu` VALUES ('4068', '8', '6_6_1');
INSERT INTO `user_menu` VALUES ('4069', '8', '6_6_1_1');
INSERT INTO `user_menu` VALUES ('4070', '8', '6_6_1_2');
INSERT INTO `user_menu` VALUES ('4071', '8', '6_6_1_3');
INSERT INTO `user_menu` VALUES ('4072', '8', '6_6_1_4');
INSERT INTO `user_menu` VALUES ('4073', '8', '6_6_1_5');
INSERT INTO `user_menu` VALUES ('4074', '8', '6_6_2');
INSERT INTO `user_menu` VALUES ('4075', '8', '6_6_2_1');
INSERT INTO `user_menu` VALUES ('4076', '8', '6_6_2_2');
INSERT INTO `user_menu` VALUES ('4077', '8', '6_6_2_3');
INSERT INTO `user_menu` VALUES ('4078', '8', '6_6_3');
INSERT INTO `user_menu` VALUES ('4079', '8', '6_6_3_1');
INSERT INTO `user_menu` VALUES ('4080', '8', '6_6_3_2');
INSERT INTO `user_menu` VALUES ('4081', '8', '6_6_3_3');
INSERT INTO `user_menu` VALUES ('4082', '8', '6_6_4');
INSERT INTO `user_menu` VALUES ('4083', '8', '6_6_4_1');
INSERT INTO `user_menu` VALUES ('4084', '8', '6_6_4_2');
INSERT INTO `user_menu` VALUES ('4085', '8', '6_6_4_3');
INSERT INTO `user_menu` VALUES ('4086', '8', '6_7');
INSERT INTO `user_menu` VALUES ('4087', '8', '6_7_1');
INSERT INTO `user_menu` VALUES ('4088', '8', '6_7_2');
INSERT INTO `user_menu` VALUES ('4089', '8', '6_7_3');
INSERT INTO `user_menu` VALUES ('4090', '8', '6_7_4');
INSERT INTO `user_menu` VALUES ('4091', '8', '6_7_5');
INSERT INTO `user_menu` VALUES ('4092', '8', '7');
INSERT INTO `user_menu` VALUES ('4093', '8', '7_1');
INSERT INTO `user_menu` VALUES ('4094', '8', '7_1_1');
INSERT INTO `user_menu` VALUES ('4095', '8', '7_1_2');
INSERT INTO `user_menu` VALUES ('4096', '8', '7_1_3');
INSERT INTO `user_menu` VALUES ('4097', '8', '7_1_4');
INSERT INTO `user_menu` VALUES ('4098', '8', '7_1_5');
INSERT INTO `user_menu` VALUES ('4099', '8', '7_2');
INSERT INTO `user_menu` VALUES ('4100', '8', '7_2_1');
INSERT INTO `user_menu` VALUES ('4101', '8', '7_2_2');
INSERT INTO `user_menu` VALUES ('4102', '8', '7_2_4');
INSERT INTO `user_menu` VALUES ('4103', '8', '7_2_5');
INSERT INTO `user_menu` VALUES ('4104', '8', '7_2_6');
INSERT INTO `user_menu` VALUES ('4105', '8', '7_2_7');
INSERT INTO `user_menu` VALUES ('4106', '8', '7_3');
INSERT INTO `user_menu` VALUES ('4107', '8', '7_3_1');
INSERT INTO `user_menu` VALUES ('4108', '8', '7_3_2');
INSERT INTO `user_menu` VALUES ('4109', '8', '7_3_4');
INSERT INTO `user_menu` VALUES ('4110', '8', '7_3_5');
INSERT INTO `user_menu` VALUES ('4111', '8', '7_3_6');
INSERT INTO `user_menu` VALUES ('4112', '8', '7_3_7');
INSERT INTO `user_menu` VALUES ('4113', '8', '7_3_8');
INSERT INTO `user_menu` VALUES ('4114', '8', '7_4');
INSERT INTO `user_menu` VALUES ('4115', '8', '7_4_1');
INSERT INTO `user_menu` VALUES ('4116', '8', '7_4_2');
INSERT INTO `user_menu` VALUES ('4117', '8', '7_4_3');
INSERT INTO `user_menu` VALUES ('4118', '8', '7_4_4');
INSERT INTO `user_menu` VALUES ('4119', '8', '7_4_5');
INSERT INTO `user_menu` VALUES ('4120', '8', '7_5');
INSERT INTO `user_menu` VALUES ('4121', '8', '7_5_2');
INSERT INTO `user_menu` VALUES ('4122', '8', '7_5_1');
INSERT INTO `user_menu` VALUES ('4123', '8', '7_5_3');
INSERT INTO `user_menu` VALUES ('4124', '8', '8');
INSERT INTO `user_menu` VALUES ('4125', '8', '8_1');
INSERT INTO `user_menu` VALUES ('4126', '8', '8_2');
INSERT INTO `user_menu` VALUES ('4127', '8', '8_5');
INSERT INTO `user_menu` VALUES ('4128', '8', '8_6');
INSERT INTO `user_menu` VALUES ('4129', '8', '9');
INSERT INTO `user_menu` VALUES ('4130', '8', '9_1');
INSERT INTO `user_menu` VALUES ('4131', '8', '9_1_1');
INSERT INTO `user_menu` VALUES ('4132', '8', '9_1_2');
INSERT INTO `user_menu` VALUES ('4133', '8', '9_1_3');
INSERT INTO `user_menu` VALUES ('4134', '8', '9_1_4');
INSERT INTO `user_menu` VALUES ('4135', '8', '9_1_5');
INSERT INTO `user_menu` VALUES ('4136', '8', '10');
INSERT INTO `user_menu` VALUES ('4137', '8', '10_1');
INSERT INTO `user_menu` VALUES ('4138', '8', '10_1_1');
INSERT INTO `user_menu` VALUES ('4139', '8', '10_1_2');
INSERT INTO `user_menu` VALUES ('4140', '8', '10_1_3');
INSERT INTO `user_menu` VALUES ('4141', '8', '10_1_4');
INSERT INTO `user_menu` VALUES ('4142', '8', '10_2');
INSERT INTO `user_menu` VALUES ('4143', '8', '10_2_1');
INSERT INTO `user_menu` VALUES ('4144', '8', '10_2_1_1');
INSERT INTO `user_menu` VALUES ('4145', '8', '10_2_1_2');
INSERT INTO `user_menu` VALUES ('4146', '8', '10_2_1_3');
INSERT INTO `user_menu` VALUES ('4147', '8', '10_2_2');
INSERT INTO `user_menu` VALUES ('4148', '8', '10_2_2_1');
INSERT INTO `user_menu` VALUES ('4149', '8', '10_2_2_2');
INSERT INTO `user_menu` VALUES ('4150', '8', '10_2_2_3');
INSERT INTO `user_menu` VALUES ('4151', '8', '10_3');
INSERT INTO `user_menu` VALUES ('4152', '8', '10_3_1');
INSERT INTO `user_menu` VALUES ('4153', '8', '10_3_2');
INSERT INTO `user_menu` VALUES ('4154', '8', '10_3_3');
INSERT INTO `user_menu` VALUES ('4155', '8', '10_3_4');
INSERT INTO `user_menu` VALUES ('4156', '8', '10_4');
INSERT INTO `user_menu` VALUES ('4157', '8', '10_4_1');
INSERT INTO `user_menu` VALUES ('4158', '8', '10_4_2');
INSERT INTO `user_menu` VALUES ('4159', '8', '10_4_3');
INSERT INTO `user_menu` VALUES ('4160', '8', '10_5');
INSERT INTO `user_menu` VALUES ('4161', '8', '10_5_1');
INSERT INTO `user_menu` VALUES ('4162', '8', '10_5_1_1');
INSERT INTO `user_menu` VALUES ('4163', '8', '10_5_1_2');
INSERT INTO `user_menu` VALUES ('4164', '8', '10_5_1_3');
INSERT INTO `user_menu` VALUES ('4165', '8', '10_5_2');
INSERT INTO `user_menu` VALUES ('4166', '8', '10_5_2_1');
INSERT INTO `user_menu` VALUES ('4167', '8', '10_5_2_2');
INSERT INTO `user_menu` VALUES ('4168', '8', '10_5_2_3');
INSERT INTO `user_menu` VALUES ('4169', '8', '10_5_3');
INSERT INTO `user_menu` VALUES ('4170', '8', '10_5_3_1');
INSERT INTO `user_menu` VALUES ('4171', '8', '10_5_3_2');
INSERT INTO `user_menu` VALUES ('4172', '8', '10_5_4');
INSERT INTO `user_menu` VALUES ('4173', '8', '10_5_4_1');
INSERT INTO `user_menu` VALUES ('4174', '8', '10_5_4_2');
INSERT INTO `user_menu` VALUES ('4175', '8', '10_5_5');
INSERT INTO `user_menu` VALUES ('4176', '8', '10_5_5_1');
INSERT INTO `user_menu` VALUES ('4177', '8', '10_5_5_2');
INSERT INTO `user_menu` VALUES ('4178', '8', '10_5_6');
INSERT INTO `user_menu` VALUES ('4179', '8', '10_5_6_1');
INSERT INTO `user_menu` VALUES ('4180', '8', '10_5_6_2');
INSERT INTO `user_menu` VALUES ('4181', '8', '10_5_6_3');
INSERT INTO `user_menu` VALUES ('4182', '8', '10_6');
INSERT INTO `user_menu` VALUES ('4183', '8', '10_6_1');
INSERT INTO `user_menu` VALUES ('4184', '8', '10_6_2');
INSERT INTO `user_menu` VALUES ('4185', '8', '10_6_3');
INSERT INTO `user_menu` VALUES ('4186', '8', '10_7');
INSERT INTO `user_menu` VALUES ('4187', '8', '10_7_1');
INSERT INTO `user_menu` VALUES ('4188', '8', '10_7_2');
INSERT INTO `user_menu` VALUES ('4189', '8', '10_7_3');
INSERT INTO `user_menu` VALUES ('4190', '8', '10_8');
INSERT INTO `user_menu` VALUES ('4191', '8', '10_8_1');
INSERT INTO `user_menu` VALUES ('4192', '8', '10_8_1_1');
INSERT INTO `user_menu` VALUES ('4193', '8', '10_8_1_2');
INSERT INTO `user_menu` VALUES ('4194', '8', '10_8_1_3');
INSERT INTO `user_menu` VALUES ('4195', '8', '10_8_1_4');
INSERT INTO `user_menu` VALUES ('4196', '8', '10_8_2');
INSERT INTO `user_menu` VALUES ('4197', '8', '10_8_2_1');
INSERT INTO `user_menu` VALUES ('4198', '8', '10_8_2_2');
INSERT INTO `user_menu` VALUES ('4199', '8', '10_8_2_3');
INSERT INTO `user_menu` VALUES ('4200', '8', '10_8_2_4');
INSERT INTO `user_menu` VALUES ('4201', '8', '10_8_3');
INSERT INTO `user_menu` VALUES ('4202', '8', '10_8_3_1');
INSERT INTO `user_menu` VALUES ('4203', '8', '10_8_3_2');
INSERT INTO `user_menu` VALUES ('4204', '8', '10_8_3_3');
INSERT INTO `user_menu` VALUES ('4205', '8', '10_8_3_4');
INSERT INTO `user_menu` VALUES ('4206', '8', '10_8_4');
INSERT INTO `user_menu` VALUES ('4207', '8', '10_8_4_1');
INSERT INTO `user_menu` VALUES ('4208', '8', '10_8_4_2');
INSERT INTO `user_menu` VALUES ('4209', '8', '10_8_4_3');
INSERT INTO `user_menu` VALUES ('4210', '8', '10_8_4_4');
INSERT INTO `user_menu` VALUES ('4211', '8', '10_8_5');
INSERT INTO `user_menu` VALUES ('4212', '8', '10_8_5_1');
INSERT INTO `user_menu` VALUES ('4213', '8', '10_8_5_2');
INSERT INTO `user_menu` VALUES ('4214', '8', '10_8_5_3');
INSERT INTO `user_menu` VALUES ('4215', '8', '10_8_5_4');
INSERT INTO `user_menu` VALUES ('4216', '8', '10_8_6');
INSERT INTO `user_menu` VALUES ('4217', '8', '10_8_6_1');
INSERT INTO `user_menu` VALUES ('4218', '8', '10_8_6_2');
INSERT INTO `user_menu` VALUES ('4219', '8', '10_8_6_3');
INSERT INTO `user_menu` VALUES ('4220', '8', '10_8_6_4');
INSERT INTO `user_menu` VALUES ('4221', '8', '10_8_7');
INSERT INTO `user_menu` VALUES ('4222', '8', '10_8_7_1');
INSERT INTO `user_menu` VALUES ('4223', '8', '10_8_7_2');
INSERT INTO `user_menu` VALUES ('4224', '8', '10_8_7_3');
INSERT INTO `user_menu` VALUES ('4225', '8', '10_8_7_4');
INSERT INTO `user_menu` VALUES ('4226', '8', '10_8_8');
INSERT INTO `user_menu` VALUES ('4227', '8', '10_8_8_1');
INSERT INTO `user_menu` VALUES ('4228', '8', '10_8_8_2');
INSERT INTO `user_menu` VALUES ('4229', '8', '10_8_8_3');
INSERT INTO `user_menu` VALUES ('4230', '8', '10_8_8_4');
INSERT INTO `user_menu` VALUES ('4231', '8', '10_8_8_5');
INSERT INTO `user_menu` VALUES ('4232', '8', '10_9');
INSERT INTO `user_menu` VALUES ('4233', '8', '10_9_1');
INSERT INTO `user_menu` VALUES ('4234', '8', '10_9_2');
INSERT INTO `user_menu` VALUES ('4235', '8', '10_9_3');
INSERT INTO `user_menu` VALUES ('4236', '8', '10_9_4');
INSERT INTO `user_menu` VALUES ('4237', '8', '10_10');
INSERT INTO `user_menu` VALUES ('4238', '8', '10_10_1');
INSERT INTO `user_menu` VALUES ('4239', '8', '10_10_2');
INSERT INTO `user_menu` VALUES ('4240', '8', '10_10_3');
INSERT INTO `user_menu` VALUES ('4241', '8', '10_10_4');
INSERT INTO `user_menu` VALUES ('4242', '8', '11');
INSERT INTO `user_menu` VALUES ('4243', '8', '11_1');
INSERT INTO `user_menu` VALUES ('4244', '8', '11_1_1');
INSERT INTO `user_menu` VALUES ('4245', '8', '11_1_2');
INSERT INTO `user_menu` VALUES ('4246', '8', '11_1_3');
INSERT INTO `user_menu` VALUES ('4247', '8', '11_1_4');
INSERT INTO `user_menu` VALUES ('4248', '8', '11_1_5');
INSERT INTO `user_menu` VALUES ('4249', '8', '12');
INSERT INTO `user_menu` VALUES ('4250', '8', '12_1');
INSERT INTO `user_menu` VALUES ('4251', '8', '12_1_1');
INSERT INTO `user_menu` VALUES ('4252', '8', '12_1_2');
INSERT INTO `user_menu` VALUES ('4253', '8', '12_1_3');
INSERT INTO `user_menu` VALUES ('4254', '8', '12_1_4');
INSERT INTO `user_menu` VALUES ('4255', '8', '12_5');
INSERT INTO `user_menu` VALUES ('4256', '8', '12_5_1');
INSERT INTO `user_menu` VALUES ('4257', '8', '12_5_2');
INSERT INTO `user_menu` VALUES ('4258', '8', '12_5_3');
INSERT INTO `user_menu` VALUES ('4259', '8', '12_5_4');
INSERT INTO `user_menu` VALUES ('4260', '8', '12_5_5');
INSERT INTO `user_menu` VALUES ('4261', '8', '12_4');
INSERT INTO `user_menu` VALUES ('4262', '8', '12_4_1');
INSERT INTO `user_menu` VALUES ('4263', '8', '12_4_1_1');
INSERT INTO `user_menu` VALUES ('4264', '8', '12_4_1_2');
INSERT INTO `user_menu` VALUES ('4265', '8', '12_4_2');
INSERT INTO `user_menu` VALUES ('4266', '8', '12_4_2_1');
INSERT INTO `user_menu` VALUES ('4267', '8', '12_4_2_2');
INSERT INTO `user_menu` VALUES ('4268', '8', '12_4_3');
INSERT INTO `user_menu` VALUES ('4269', '8', '12_4_3_1');
INSERT INTO `user_menu` VALUES ('4270', '8', '12_4_3_2');
INSERT INTO `user_menu` VALUES ('4271', '8', '12_4_4');
INSERT INTO `user_menu` VALUES ('4272', '8', '12_4_4_1');
INSERT INTO `user_menu` VALUES ('4273', '8', '12_4_4_2');
INSERT INTO `user_menu` VALUES ('4274', '8', '12_4_5');
INSERT INTO `user_menu` VALUES ('4275', '8', '12_4_5_1');
INSERT INTO `user_menu` VALUES ('4276', '8', '12_4_5_2');
INSERT INTO `user_menu` VALUES ('4277', '8', '12_4_6');
INSERT INTO `user_menu` VALUES ('4278', '8', '12_4_6_1');
INSERT INTO `user_menu` VALUES ('4279', '8', '12_4_6_2');
INSERT INTO `user_menu` VALUES ('4280', '8', '12_4_6_3');
INSERT INTO `user_menu` VALUES ('4281', '8', '12_2');
INSERT INTO `user_menu` VALUES ('4282', '8', '12_2_1');
INSERT INTO `user_menu` VALUES ('4283', '8', '12_2_2');
INSERT INTO `user_menu` VALUES ('4284', '8', '12_2_3');
INSERT INTO `user_menu` VALUES ('4285', '8', '12_2_4');
INSERT INTO `user_menu` VALUES ('4286', '8', '12_3');
INSERT INTO `user_menu` VALUES ('4287', '8', '12_3_1');
INSERT INTO `user_menu` VALUES ('4288', '8', '12_3_2');
INSERT INTO `user_menu` VALUES ('4289', '8', '12_3_3');
INSERT INTO `user_menu` VALUES ('5755', '7', '10_10_3');
INSERT INTO `user_menu` VALUES ('5754', '7', '10_10_2');
INSERT INTO `user_menu` VALUES ('5753', '7', '10_10_1');
INSERT INTO `user_menu` VALUES ('5752', '7', '10_10');
INSERT INTO `user_menu` VALUES ('5751', '7', '10_9_4');
INSERT INTO `user_menu` VALUES ('5750', '7', '10_9_3');
INSERT INTO `user_menu` VALUES ('5749', '7', '10_9_2');
INSERT INTO `user_menu` VALUES ('5748', '7', '10_9_1');
INSERT INTO `user_menu` VALUES ('5747', '7', '10_9');
INSERT INTO `user_menu` VALUES ('5746', '7', '10_8_8_5');
INSERT INTO `user_menu` VALUES ('5745', '7', '10_8_8_4');
INSERT INTO `user_menu` VALUES ('5744', '7', '10_8_8_3');
INSERT INTO `user_menu` VALUES ('5743', '7', '10_8_8_2');
INSERT INTO `user_menu` VALUES ('5742', '7', '10_8_8_1');
INSERT INTO `user_menu` VALUES ('5741', '7', '10_8_8');
INSERT INTO `user_menu` VALUES ('5740', '7', '10_8_7_4');
INSERT INTO `user_menu` VALUES ('5739', '7', '10_8_7_3');
INSERT INTO `user_menu` VALUES ('5738', '7', '10_8_7_2');
INSERT INTO `user_menu` VALUES ('5737', '7', '10_8_7_1');
INSERT INTO `user_menu` VALUES ('5736', '7', '10_8_7');
INSERT INTO `user_menu` VALUES ('5735', '7', '10_8_6_4');
INSERT INTO `user_menu` VALUES ('5734', '7', '10_8_6_3');
INSERT INTO `user_menu` VALUES ('5733', '7', '10_8_6_2');
INSERT INTO `user_menu` VALUES ('5732', '7', '10_8_6_1');
INSERT INTO `user_menu` VALUES ('5731', '7', '10_8_6');
INSERT INTO `user_menu` VALUES ('5730', '7', '10_8_5_4');
INSERT INTO `user_menu` VALUES ('5729', '7', '10_8_5_3');
INSERT INTO `user_menu` VALUES ('5728', '7', '10_8_5_2');
INSERT INTO `user_menu` VALUES ('5727', '7', '10_8_5_1');
INSERT INTO `user_menu` VALUES ('5726', '7', '10_8_5');
INSERT INTO `user_menu` VALUES ('5725', '7', '10_8_4_4');
INSERT INTO `user_menu` VALUES ('5724', '7', '10_8_4_3');
INSERT INTO `user_menu` VALUES ('5723', '7', '10_8_4_2');
INSERT INTO `user_menu` VALUES ('5722', '7', '10_8_4_1');
INSERT INTO `user_menu` VALUES ('5721', '7', '10_8_4');
INSERT INTO `user_menu` VALUES ('5720', '7', '10_8_3_4');
INSERT INTO `user_menu` VALUES ('5719', '7', '10_8_3_3');
INSERT INTO `user_menu` VALUES ('5718', '7', '10_8_3_2');
INSERT INTO `user_menu` VALUES ('5717', '7', '10_8_3_1');
INSERT INTO `user_menu` VALUES ('5716', '7', '10_8_3');
INSERT INTO `user_menu` VALUES ('5715', '7', '10_8_2_4');
INSERT INTO `user_menu` VALUES ('5714', '7', '10_8_2_3');
INSERT INTO `user_menu` VALUES ('5713', '7', '10_8_2_2');
INSERT INTO `user_menu` VALUES ('5712', '7', '10_8_2_1');
INSERT INTO `user_menu` VALUES ('5711', '7', '10_8_2');
INSERT INTO `user_menu` VALUES ('5710', '7', '10_8_1_4');
INSERT INTO `user_menu` VALUES ('5709', '7', '10_8_1_3');
INSERT INTO `user_menu` VALUES ('5708', '7', '10_8_1_2');
INSERT INTO `user_menu` VALUES ('5707', '7', '10_8_1_1');
INSERT INTO `user_menu` VALUES ('5706', '7', '10_8_1');
INSERT INTO `user_menu` VALUES ('5705', '7', '10_8');
INSERT INTO `user_menu` VALUES ('5704', '7', '10_7_3');
INSERT INTO `user_menu` VALUES ('5703', '7', '10_7_2');
INSERT INTO `user_menu` VALUES ('5702', '7', '10_7_1');
INSERT INTO `user_menu` VALUES ('5701', '7', '10_7');
INSERT INTO `user_menu` VALUES ('5700', '7', '10_6_3');
INSERT INTO `user_menu` VALUES ('5699', '7', '10_6_2');
INSERT INTO `user_menu` VALUES ('5698', '7', '10_6_1');
INSERT INTO `user_menu` VALUES ('5697', '7', '10_6');
INSERT INTO `user_menu` VALUES ('5696', '7', '10_5_6_3');
INSERT INTO `user_menu` VALUES ('5695', '7', '10_5_6_2');
INSERT INTO `user_menu` VALUES ('5694', '7', '10_5_6_1');
INSERT INTO `user_menu` VALUES ('5693', '7', '10_5_6');
INSERT INTO `user_menu` VALUES ('5692', '7', '10_5_5_2');
INSERT INTO `user_menu` VALUES ('5691', '7', '10_5_5_1');
INSERT INTO `user_menu` VALUES ('5690', '7', '10_5_5');
INSERT INTO `user_menu` VALUES ('5689', '7', '10_5_4_2');
INSERT INTO `user_menu` VALUES ('5688', '7', '10_5_4_1');
INSERT INTO `user_menu` VALUES ('5687', '7', '10_5_4');
INSERT INTO `user_menu` VALUES ('5686', '7', '10_5_3_2');
INSERT INTO `user_menu` VALUES ('5685', '7', '10_5_3_1');
INSERT INTO `user_menu` VALUES ('5684', '7', '10_5_3');
INSERT INTO `user_menu` VALUES ('5683', '7', '10_5_2_3');
INSERT INTO `user_menu` VALUES ('5682', '7', '10_5_2_2');
INSERT INTO `user_menu` VALUES ('5681', '7', '10_5_2_1');
INSERT INTO `user_menu` VALUES ('5680', '7', '10_5_2');
INSERT INTO `user_menu` VALUES ('5679', '7', '10_5_1_3');
INSERT INTO `user_menu` VALUES ('5678', '7', '10_5_1_2');
INSERT INTO `user_menu` VALUES ('5677', '7', '10_5_1_1');
INSERT INTO `user_menu` VALUES ('5676', '7', '10_5_1');
INSERT INTO `user_menu` VALUES ('5675', '7', '10_5');
INSERT INTO `user_menu` VALUES ('5674', '7', '10_4_3');
INSERT INTO `user_menu` VALUES ('5673', '7', '10_4_2');
INSERT INTO `user_menu` VALUES ('5672', '7', '10_4_1');
INSERT INTO `user_menu` VALUES ('5671', '7', '10_4');
INSERT INTO `user_menu` VALUES ('5670', '7', '10_3_4');
INSERT INTO `user_menu` VALUES ('5669', '7', '10_3_3');
INSERT INTO `user_menu` VALUES ('5668', '7', '10_3_2');
INSERT INTO `user_menu` VALUES ('5667', '7', '10_3_1');
INSERT INTO `user_menu` VALUES ('5666', '7', '10_3');
INSERT INTO `user_menu` VALUES ('5665', '7', '10_2_2_3');
INSERT INTO `user_menu` VALUES ('5664', '7', '10_2_2_2');
INSERT INTO `user_menu` VALUES ('5663', '7', '10_2_2_1');
INSERT INTO `user_menu` VALUES ('5662', '7', '10_2_2');
INSERT INTO `user_menu` VALUES ('5661', '7', '10_2_1_3');
INSERT INTO `user_menu` VALUES ('5660', '7', '10_2_1_2');
INSERT INTO `user_menu` VALUES ('5659', '7', '10_2_1_1');
INSERT INTO `user_menu` VALUES ('5658', '7', '10_2_1');
INSERT INTO `user_menu` VALUES ('5657', '7', '10_2');
INSERT INTO `user_menu` VALUES ('5656', '7', '10_1_4');
INSERT INTO `user_menu` VALUES ('5655', '7', '10_1_3');
INSERT INTO `user_menu` VALUES ('5654', '7', '10_1_2');
INSERT INTO `user_menu` VALUES ('5653', '7', '10_1_1');
INSERT INTO `user_menu` VALUES ('5652', '7', '10_1');
INSERT INTO `user_menu` VALUES ('5651', '7', '10');
INSERT INTO `user_menu` VALUES ('5650', '7', '9_1_5');
INSERT INTO `user_menu` VALUES ('5649', '7', '9_1_4');
INSERT INTO `user_menu` VALUES ('5648', '7', '9_1_3');
INSERT INTO `user_menu` VALUES ('5647', '7', '9_1_2');
INSERT INTO `user_menu` VALUES ('5646', '7', '9_1_1');
INSERT INTO `user_menu` VALUES ('5645', '7', '9_1');
INSERT INTO `user_menu` VALUES ('5644', '7', '9');
INSERT INTO `user_menu` VALUES ('5643', '7', '8_6');
INSERT INTO `user_menu` VALUES ('5642', '7', '8_5');
INSERT INTO `user_menu` VALUES ('5641', '7', '8_2');
INSERT INTO `user_menu` VALUES ('5640', '7', '8_1');
INSERT INTO `user_menu` VALUES ('5639', '7', '8');
INSERT INTO `user_menu` VALUES ('5638', '7', '7_5_3');
INSERT INTO `user_menu` VALUES ('5637', '7', '7_5_1');
INSERT INTO `user_menu` VALUES ('5636', '7', '7_5_2');
INSERT INTO `user_menu` VALUES ('5635', '7', '7_5');
INSERT INTO `user_menu` VALUES ('5634', '7', '7_4_5');
INSERT INTO `user_menu` VALUES ('5633', '7', '7_4_4');
INSERT INTO `user_menu` VALUES ('5632', '7', '7_4_3');
INSERT INTO `user_menu` VALUES ('5631', '7', '7_4_2');
INSERT INTO `user_menu` VALUES ('5630', '7', '7_4_1');
INSERT INTO `user_menu` VALUES ('5629', '7', '7_4');
INSERT INTO `user_menu` VALUES ('5628', '7', '7_3_8');
INSERT INTO `user_menu` VALUES ('5627', '7', '7_3_7');
INSERT INTO `user_menu` VALUES ('5626', '7', '7_3_6');
INSERT INTO `user_menu` VALUES ('5625', '7', '7_3_5');
INSERT INTO `user_menu` VALUES ('5624', '7', '7_3_4');
INSERT INTO `user_menu` VALUES ('5623', '7', '7_3_2');
INSERT INTO `user_menu` VALUES ('5622', '7', '7_3_1');
INSERT INTO `user_menu` VALUES ('5621', '7', '7_3');
INSERT INTO `user_menu` VALUES ('5620', '7', '7_2_7');
INSERT INTO `user_menu` VALUES ('5619', '7', '7_2_6');
INSERT INTO `user_menu` VALUES ('5618', '7', '7_2_5');
INSERT INTO `user_menu` VALUES ('5617', '7', '7_2_4');
INSERT INTO `user_menu` VALUES ('5616', '7', '7_2_2');
INSERT INTO `user_menu` VALUES ('5615', '7', '7_2_1');
INSERT INTO `user_menu` VALUES ('5614', '7', '7_2');
INSERT INTO `user_menu` VALUES ('5613', '7', '7_1_5');
INSERT INTO `user_menu` VALUES ('5612', '7', '7_1_4');
INSERT INTO `user_menu` VALUES ('5611', '7', '7_1_3');
INSERT INTO `user_menu` VALUES ('5610', '7', '7_1_2');
INSERT INTO `user_menu` VALUES ('5609', '7', '7_1_1');
INSERT INTO `user_menu` VALUES ('5608', '7', '7_1');
INSERT INTO `user_menu` VALUES ('5607', '7', '7');
INSERT INTO `user_menu` VALUES ('5606', '7', '6_7_5');
INSERT INTO `user_menu` VALUES ('5605', '7', '6_7_4');
INSERT INTO `user_menu` VALUES ('5604', '7', '6_7_3');
INSERT INTO `user_menu` VALUES ('5603', '7', '6_7_2');
INSERT INTO `user_menu` VALUES ('5602', '7', '6_7_1');
INSERT INTO `user_menu` VALUES ('5601', '7', '6_7');
INSERT INTO `user_menu` VALUES ('5600', '7', '6_6_4_3');
INSERT INTO `user_menu` VALUES ('5599', '7', '6_6_4_2');
INSERT INTO `user_menu` VALUES ('5598', '7', '6_6_4_1');
INSERT INTO `user_menu` VALUES ('5597', '7', '6_6_4');
INSERT INTO `user_menu` VALUES ('5596', '7', '6_6_3_3');
INSERT INTO `user_menu` VALUES ('5595', '7', '6_6_3_2');
INSERT INTO `user_menu` VALUES ('5594', '7', '6_6_3_1');
INSERT INTO `user_menu` VALUES ('5593', '7', '6_6_3');
INSERT INTO `user_menu` VALUES ('5592', '7', '6_6_2_3');
INSERT INTO `user_menu` VALUES ('5591', '7', '6_6_2_2');
INSERT INTO `user_menu` VALUES ('5590', '7', '6_6_2_1');
INSERT INTO `user_menu` VALUES ('5589', '7', '6_6_2');
INSERT INTO `user_menu` VALUES ('5588', '7', '6_6_1_5');
INSERT INTO `user_menu` VALUES ('5587', '7', '6_6_1_4');
INSERT INTO `user_menu` VALUES ('5586', '7', '6_6_1_3');
INSERT INTO `user_menu` VALUES ('5585', '7', '6_6_1_2');
INSERT INTO `user_menu` VALUES ('5584', '7', '6_6_1_1');
INSERT INTO `user_menu` VALUES ('5583', '7', '6_6_1');
INSERT INTO `user_menu` VALUES ('5582', '7', '6_6');
INSERT INTO `user_menu` VALUES ('5581', '7', '6_5_5');
INSERT INTO `user_menu` VALUES ('5580', '7', '6_5_4');
INSERT INTO `user_menu` VALUES ('5579', '7', '6_5_3');
INSERT INTO `user_menu` VALUES ('5578', '7', '6_5_2');
INSERT INTO `user_menu` VALUES ('5577', '7', '6_5_1');
INSERT INTO `user_menu` VALUES ('5576', '7', '6_5');
INSERT INTO `user_menu` VALUES ('5575', '7', '6_4_5');
INSERT INTO `user_menu` VALUES ('5574', '7', '6_4_4');
INSERT INTO `user_menu` VALUES ('5573', '7', '6_4_3');
INSERT INTO `user_menu` VALUES ('5572', '7', '6_4_2');
INSERT INTO `user_menu` VALUES ('5571', '7', '6_4_1');
INSERT INTO `user_menu` VALUES ('5570', '7', '6_4');
INSERT INTO `user_menu` VALUES ('5569', '7', '6_3_5');
INSERT INTO `user_menu` VALUES ('5568', '7', '6_3_4');
INSERT INTO `user_menu` VALUES ('5567', '7', '6_3_3');
INSERT INTO `user_menu` VALUES ('5566', '7', '6_3_2');
INSERT INTO `user_menu` VALUES ('5565', '7', '6_3_1');
INSERT INTO `user_menu` VALUES ('5564', '7', '6_3');
INSERT INTO `user_menu` VALUES ('5563', '7', '6_2_5');
INSERT INTO `user_menu` VALUES ('5562', '7', '6_2_4');
INSERT INTO `user_menu` VALUES ('5561', '7', '6_2_3');
INSERT INTO `user_menu` VALUES ('5560', '7', '6_2_2');
INSERT INTO `user_menu` VALUES ('5559', '7', '6_2_1');
INSERT INTO `user_menu` VALUES ('5558', '7', '6_2');
INSERT INTO `user_menu` VALUES ('5557', '7', '6_1_2_5');
INSERT INTO `user_menu` VALUES ('5556', '7', '6_1_2_4');
INSERT INTO `user_menu` VALUES ('5555', '7', '6_1_2_3');
INSERT INTO `user_menu` VALUES ('5554', '7', '6_1_2_2');
INSERT INTO `user_menu` VALUES ('5553', '7', '6_1_2_1');
INSERT INTO `user_menu` VALUES ('5552', '7', '6_1_2');
INSERT INTO `user_menu` VALUES ('5551', '7', '6_1_1_5');
INSERT INTO `user_menu` VALUES ('5550', '7', '6_1_1_4');
INSERT INTO `user_menu` VALUES ('5549', '7', '6_1_1_3');
INSERT INTO `user_menu` VALUES ('5548', '7', '6_1_1_2');
INSERT INTO `user_menu` VALUES ('5547', '7', '6_1_1_1');
INSERT INTO `user_menu` VALUES ('5546', '7', '6_1_1');
INSERT INTO `user_menu` VALUES ('5545', '7', '6_1');
INSERT INTO `user_menu` VALUES ('5544', '7', '6');
INSERT INTO `user_menu` VALUES ('5543', '7', '5_5_6_5');
INSERT INTO `user_menu` VALUES ('5542', '7', '5_5_6_4');
INSERT INTO `user_menu` VALUES ('5541', '7', '5_5_6_3');
INSERT INTO `user_menu` VALUES ('5540', '7', '5_5_6_2');
INSERT INTO `user_menu` VALUES ('5539', '7', '5_5_6_1');
INSERT INTO `user_menu` VALUES ('5538', '7', '5_5_6');
INSERT INTO `user_menu` VALUES ('5537', '7', '5_5_5');
INSERT INTO `user_menu` VALUES ('5536', '7', '5_5_4');
INSERT INTO `user_menu` VALUES ('5535', '7', '5_5_3');
INSERT INTO `user_menu` VALUES ('5534', '7', '5_5_2');
INSERT INTO `user_menu` VALUES ('5533', '7', '5_5_1');
INSERT INTO `user_menu` VALUES ('5532', '7', '5_5');
INSERT INTO `user_menu` VALUES ('5531', '7', '5_4_5');
INSERT INTO `user_menu` VALUES ('5530', '7', '5_4_4');
INSERT INTO `user_menu` VALUES ('5529', '7', '5_4_3');
INSERT INTO `user_menu` VALUES ('5528', '7', '5_4_2');
INSERT INTO `user_menu` VALUES ('5527', '7', '5_4_1');
INSERT INTO `user_menu` VALUES ('5526', '7', '5_4');
INSERT INTO `user_menu` VALUES ('5525', '7', '5_3_2_5');
INSERT INTO `user_menu` VALUES ('5524', '7', '5_3_2_4');
INSERT INTO `user_menu` VALUES ('5523', '7', '5_3_2_2');
INSERT INTO `user_menu` VALUES ('5522', '7', '5_3_2_1');
INSERT INTO `user_menu` VALUES ('5521', '7', '5_3_2');
INSERT INTO `user_menu` VALUES ('5520', '7', '5_3_1_5');
INSERT INTO `user_menu` VALUES ('5519', '7', '5_3_1_4');
INSERT INTO `user_menu` VALUES ('5518', '7', '5_3_1_3');
INSERT INTO `user_menu` VALUES ('5517', '7', '5_3_1_2');
INSERT INTO `user_menu` VALUES ('5516', '7', '5_3_1_1');
INSERT INTO `user_menu` VALUES ('5515', '7', '5_3_1');
INSERT INTO `user_menu` VALUES ('5514', '7', '5_3');
INSERT INTO `user_menu` VALUES ('5513', '7', '5_2_2_5');
INSERT INTO `user_menu` VALUES ('5512', '7', '5_2_2_4');
INSERT INTO `user_menu` VALUES ('5511', '7', '5_2_2_3');
INSERT INTO `user_menu` VALUES ('5510', '7', '5_2_2_2');
INSERT INTO `user_menu` VALUES ('5509', '7', '5_2_2_1');
INSERT INTO `user_menu` VALUES ('5508', '7', '5_2_2');
INSERT INTO `user_menu` VALUES ('5507', '7', '5_2_1_5');
INSERT INTO `user_menu` VALUES ('5506', '7', '5_2_1_4');
INSERT INTO `user_menu` VALUES ('5505', '7', '5_2_1_3');
INSERT INTO `user_menu` VALUES ('5504', '7', '5_2_1_2');
INSERT INTO `user_menu` VALUES ('5503', '7', '5_2_1_1');
INSERT INTO `user_menu` VALUES ('5502', '7', '5_2_1');
INSERT INTO `user_menu` VALUES ('5501', '7', '5_2');
INSERT INTO `user_menu` VALUES ('5500', '7', '5_1_4');
INSERT INTO `user_menu` VALUES ('5499', '7', '5_1_3');
INSERT INTO `user_menu` VALUES ('5498', '7', '5_1_2');
INSERT INTO `user_menu` VALUES ('5497', '7', '5_1_1');
INSERT INTO `user_menu` VALUES ('5496', '7', '5_1');
INSERT INTO `user_menu` VALUES ('5495', '7', '5');
INSERT INTO `user_menu` VALUES ('5494', '7', '4_3_2');
INSERT INTO `user_menu` VALUES ('5493', '7', '4_3_1');
INSERT INTO `user_menu` VALUES ('5492', '7', '4_3');
INSERT INTO `user_menu` VALUES ('5491', '7', '4_2_9');
INSERT INTO `user_menu` VALUES ('5490', '7', '4_2_8');
INSERT INTO `user_menu` VALUES ('5489', '7', '4_2_7');
INSERT INTO `user_menu` VALUES ('5488', '7', '4_2_6');
INSERT INTO `user_menu` VALUES ('5487', '7', '4_2_5');
INSERT INTO `user_menu` VALUES ('5486', '7', '4_2_4');
INSERT INTO `user_menu` VALUES ('5485', '7', '4_2_3');
INSERT INTO `user_menu` VALUES ('5484', '7', '4_2_2');
INSERT INTO `user_menu` VALUES ('5483', '7', '4_2_1');
INSERT INTO `user_menu` VALUES ('5482', '7', '4_2');
INSERT INTO `user_menu` VALUES ('5481', '7', '4');
INSERT INTO `user_menu` VALUES ('5480', '7', '3_1_5');
INSERT INTO `user_menu` VALUES ('5479', '7', '3_1_4');
INSERT INTO `user_menu` VALUES ('5478', '7', '3_1_3');
INSERT INTO `user_menu` VALUES ('5477', '7', '3_1_2');
INSERT INTO `user_menu` VALUES ('5476', '7', '3_1_1');
INSERT INTO `user_menu` VALUES ('5475', '7', '3_1');
INSERT INTO `user_menu` VALUES ('5474', '7', '3');
INSERT INTO `user_menu` VALUES ('5473', '7', '2_6_1_4');
INSERT INTO `user_menu` VALUES ('5472', '7', '2_6_1_3');
INSERT INTO `user_menu` VALUES ('5471', '7', '2_6_1_1');
INSERT INTO `user_menu` VALUES ('5470', '7', '2_6_1_2');
INSERT INTO `user_menu` VALUES ('5469', '7', '2_6_1');
INSERT INTO `user_menu` VALUES ('5468', '7', '2_6');
INSERT INTO `user_menu` VALUES ('5467', '7', '2_4_1_3');
INSERT INTO `user_menu` VALUES ('5466', '7', '2_4_1_2');
INSERT INTO `user_menu` VALUES ('5465', '7', '2_4_1_1');
INSERT INTO `user_menu` VALUES ('5464', '7', '2_4_1');
INSERT INTO `user_menu` VALUES ('5463', '7', '2_4');
INSERT INTO `user_menu` VALUES ('5462', '7', '2_3_1_4');
INSERT INTO `user_menu` VALUES ('5461', '7', '2_3_1_3');
INSERT INTO `user_menu` VALUES ('5460', '7', '2_3_1_1');
INSERT INTO `user_menu` VALUES ('5459', '7', '2_3_1_2');
INSERT INTO `user_menu` VALUES ('5458', '7', '2_3_1');
INSERT INTO `user_menu` VALUES ('5457', '7', '2_3');
INSERT INTO `user_menu` VALUES ('5456', '7', '2_2_1_4');
INSERT INTO `user_menu` VALUES ('5455', '7', '2_2_1_3');
INSERT INTO `user_menu` VALUES ('5454', '7', '2_2_1_1');
INSERT INTO `user_menu` VALUES ('5453', '7', '2_2_1_2');
INSERT INTO `user_menu` VALUES ('5452', '7', '2_2_1');
INSERT INTO `user_menu` VALUES ('5451', '7', '2_2');
INSERT INTO `user_menu` VALUES ('5450', '7', '2_1_2_3');
INSERT INTO `user_menu` VALUES ('5449', '7', '2_1_2_2');
INSERT INTO `user_menu` VALUES ('5448', '7', '2_1_2_1');
INSERT INTO `user_menu` VALUES ('5447', '7', '2_1_2_4');
INSERT INTO `user_menu` VALUES ('5446', '7', '2_1_2');
INSERT INTO `user_menu` VALUES ('5445', '7', '2_1_1_4_3');
INSERT INTO `user_menu` VALUES ('5444', '7', '2_1_1_4_2');
INSERT INTO `user_menu` VALUES ('5443', '7', '2_1_1_4_1');
INSERT INTO `user_menu` VALUES ('5442', '7', '2_1_1_4');
INSERT INTO `user_menu` VALUES ('5441', '7', '2_1_1_3_3');
INSERT INTO `user_menu` VALUES ('5440', '7', '2_1_1_3_2');
INSERT INTO `user_menu` VALUES ('5439', '7', '2_1_1_3_1');
INSERT INTO `user_menu` VALUES ('5438', '7', '2_1_1_3');
INSERT INTO `user_menu` VALUES ('5437', '7', '2_1_1_2');
INSERT INTO `user_menu` VALUES ('5436', '7', '2_1_1_1');
INSERT INTO `user_menu` VALUES ('5435', '7', '2_1_1');
INSERT INTO `user_menu` VALUES ('5434', '7', '2_1');
INSERT INTO `user_menu` VALUES ('5433', '7', '2');
INSERT INTO `user_menu` VALUES ('5432', '7', '1_8_5');
INSERT INTO `user_menu` VALUES ('5431', '7', '1_8_4');
INSERT INTO `user_menu` VALUES ('5430', '7', '1_8_3');
INSERT INTO `user_menu` VALUES ('5429', '7', '1_8_2');
INSERT INTO `user_menu` VALUES ('5428', '7', '1_8_1');
INSERT INTO `user_menu` VALUES ('5427', '7', '1_8');
INSERT INTO `user_menu` VALUES ('5426', '7', '1_7_4');
INSERT INTO `user_menu` VALUES ('5425', '7', '1_7_3');
INSERT INTO `user_menu` VALUES ('5424', '7', '1_7_2');
INSERT INTO `user_menu` VALUES ('5423', '7', '1_7_1');
INSERT INTO `user_menu` VALUES ('5422', '7', '1_7_5');
INSERT INTO `user_menu` VALUES ('5421', '7', '1_7');
INSERT INTO `user_menu` VALUES ('5420', '7', '1_6_8_5');
INSERT INTO `user_menu` VALUES ('5419', '7', '1_6_8_4');
INSERT INTO `user_menu` VALUES ('5418', '7', '1_6_8_3');
INSERT INTO `user_menu` VALUES ('5417', '7', '1_6_8_2');
INSERT INTO `user_menu` VALUES ('5416', '7', '1_6_8_1');
INSERT INTO `user_menu` VALUES ('5415', '7', '1_6_8');
INSERT INTO `user_menu` VALUES ('5414', '7', '1_6_7_4');
INSERT INTO `user_menu` VALUES ('5413', '7', '1_6_7_3');
INSERT INTO `user_menu` VALUES ('5412', '7', '1_6_7_2');
INSERT INTO `user_menu` VALUES ('5411', '7', '1_6_7_1');
INSERT INTO `user_menu` VALUES ('5410', '7', '1_6_7');
INSERT INTO `user_menu` VALUES ('5409', '7', '1_6_6_5');
INSERT INTO `user_menu` VALUES ('5408', '7', '1_6_6_4');
INSERT INTO `user_menu` VALUES ('5407', '7', '1_6_6_3');
INSERT INTO `user_menu` VALUES ('5406', '7', '1_6_6_2');
INSERT INTO `user_menu` VALUES ('5405', '7', '1_6_6_1');
INSERT INTO `user_menu` VALUES ('5404', '7', '1_6_6');
INSERT INTO `user_menu` VALUES ('5403', '7', '1_6_5_5');
INSERT INTO `user_menu` VALUES ('5402', '7', '1_6_5_4');
INSERT INTO `user_menu` VALUES ('5401', '7', '1_6_5_3');
INSERT INTO `user_menu` VALUES ('5400', '7', '1_6_5_2');
INSERT INTO `user_menu` VALUES ('5399', '7', '1_6_5_1');
INSERT INTO `user_menu` VALUES ('5398', '7', '1_6_5');
INSERT INTO `user_menu` VALUES ('5397', '7', '1_6_4_4');
INSERT INTO `user_menu` VALUES ('5396', '7', '1_6_4_5');
INSERT INTO `user_menu` VALUES ('5395', '7', '1_6_4_3');
INSERT INTO `user_menu` VALUES ('5394', '7', '1_6_4_2');
INSERT INTO `user_menu` VALUES ('5393', '7', '1_6_4_1');
INSERT INTO `user_menu` VALUES ('5392', '7', '1_6_4');
INSERT INTO `user_menu` VALUES ('5391', '7', '1_6_3_2_5');
INSERT INTO `user_menu` VALUES ('5390', '7', '1_6_3_2_4');
INSERT INTO `user_menu` VALUES ('5389', '7', '1_6_3_2_3');
INSERT INTO `user_menu` VALUES ('5388', '7', '1_6_3_2_2');
INSERT INTO `user_menu` VALUES ('5387', '7', '1_6_3_2_1');
INSERT INTO `user_menu` VALUES ('5386', '7', '1_6_3_2');
INSERT INTO `user_menu` VALUES ('5385', '7', '1_6_3_1_5');
INSERT INTO `user_menu` VALUES ('5384', '7', '1_6_3_1_4');
INSERT INTO `user_menu` VALUES ('5383', '7', '1_6_3_1_3');
INSERT INTO `user_menu` VALUES ('5382', '7', '1_6_3_1_2');
INSERT INTO `user_menu` VALUES ('5381', '7', '1_6_3_1_1');
INSERT INTO `user_menu` VALUES ('5380', '7', '1_6_3_1');
INSERT INTO `user_menu` VALUES ('5379', '7', '1_6_3');
INSERT INTO `user_menu` VALUES ('5378', '7', '1_6_2_2_5');
INSERT INTO `user_menu` VALUES ('5377', '7', '1_6_2_2_4');
INSERT INTO `user_menu` VALUES ('5376', '7', '1_6_2_2_3');
INSERT INTO `user_menu` VALUES ('5375', '7', '1_6_2_2_2');
INSERT INTO `user_menu` VALUES ('5374', '7', '1_6_2_2_1');
INSERT INTO `user_menu` VALUES ('5373', '7', '1_6_2_2');
INSERT INTO `user_menu` VALUES ('5372', '7', '1_6_2_1_5');
INSERT INTO `user_menu` VALUES ('5371', '7', '1_6_2_1_4');
INSERT INTO `user_menu` VALUES ('5370', '7', '1_6_2_1_3');
INSERT INTO `user_menu` VALUES ('5369', '7', '1_6_2_1_2');
INSERT INTO `user_menu` VALUES ('5368', '7', '1_6_2_1_1');
INSERT INTO `user_menu` VALUES ('5367', '7', '1_6_2_1');
INSERT INTO `user_menu` VALUES ('5366', '7', '1_6_2');
INSERT INTO `user_menu` VALUES ('5365', '7', '1_6_1_2_5');
INSERT INTO `user_menu` VALUES ('5364', '7', '1_6_1_2_4');
INSERT INTO `user_menu` VALUES ('5363', '7', '1_6_1_2_3');
INSERT INTO `user_menu` VALUES ('5362', '7', '1_6_1_2_2');
INSERT INTO `user_menu` VALUES ('5361', '7', '1_6_1_2_1');
INSERT INTO `user_menu` VALUES ('5360', '7', '1_6_1_2');
INSERT INTO `user_menu` VALUES ('5359', '7', '1_6_1_1_5');
INSERT INTO `user_menu` VALUES ('5358', '7', '1_6_1_1_4');
INSERT INTO `user_menu` VALUES ('5357', '7', '1_6_1_1_3');
INSERT INTO `user_menu` VALUES ('5356', '7', '1_6_1_1_2');
INSERT INTO `user_menu` VALUES ('5355', '7', '1_6_1_1_1');
INSERT INTO `user_menu` VALUES ('5354', '7', '1_6_1_1');
INSERT INTO `user_menu` VALUES ('5353', '7', '1_6_1');
INSERT INTO `user_menu` VALUES ('5352', '7', '1_6');
INSERT INTO `user_menu` VALUES ('5351', '7', '1_5_6_3');
INSERT INTO `user_menu` VALUES ('5350', '7', '1_5_6_2');
INSERT INTO `user_menu` VALUES ('5349', '7', '1_5_6_1');
INSERT INTO `user_menu` VALUES ('5348', '7', '1_5_6');
INSERT INTO `user_menu` VALUES ('5347', '7', '1_5_5_3');
INSERT INTO `user_menu` VALUES ('5346', '7', '1_5_5_2');
INSERT INTO `user_menu` VALUES ('5345', '7', '1_5_5_1');
INSERT INTO `user_menu` VALUES ('5344', '7', '1_5_5');
INSERT INTO `user_menu` VALUES ('5343', '7', '1_5_4_2');
INSERT INTO `user_menu` VALUES ('5342', '7', '1_5_4_1');
INSERT INTO `user_menu` VALUES ('5341', '7', '1_5_4');
INSERT INTO `user_menu` VALUES ('5340', '7', '1_5_3_2');
INSERT INTO `user_menu` VALUES ('5339', '7', '1_5_3_1');
INSERT INTO `user_menu` VALUES ('5338', '7', '1_5_3');
INSERT INTO `user_menu` VALUES ('5337', '7', '1_5_2_3');
INSERT INTO `user_menu` VALUES ('5336', '7', '1_5_2_2');
INSERT INTO `user_menu` VALUES ('5335', '7', '1_5_2_1');
INSERT INTO `user_menu` VALUES ('5334', '7', '1_5_2');
INSERT INTO `user_menu` VALUES ('5333', '7', '1_5_1_3');
INSERT INTO `user_menu` VALUES ('5332', '7', '1_5_1_2');
INSERT INTO `user_menu` VALUES ('5331', '7', '1_5_1_1');
INSERT INTO `user_menu` VALUES ('5330', '7', '1_5_1');
INSERT INTO `user_menu` VALUES ('5329', '7', '1_5');
INSERT INTO `user_menu` VALUES ('5328', '7', '1_4_3');
INSERT INTO `user_menu` VALUES ('5327', '7', '1_4_2');
INSERT INTO `user_menu` VALUES ('5326', '7', '1_4_1');
INSERT INTO `user_menu` VALUES ('5325', '7', '1_4');
INSERT INTO `user_menu` VALUES ('5324', '7', '1_3_5');
INSERT INTO `user_menu` VALUES ('5323', '7', '1_3_3');
INSERT INTO `user_menu` VALUES ('5322', '7', '1_3_2');
INSERT INTO `user_menu` VALUES ('5321', '7', '1_3_1');
INSERT INTO `user_menu` VALUES ('5320', '7', '1_3');
INSERT INTO `user_menu` VALUES ('5319', '7', '1_2_2_2_2');
INSERT INTO `user_menu` VALUES ('5318', '7', '1_2_2_2_3');
INSERT INTO `user_menu` VALUES ('5317', '7', '1_2_2_2_1');
INSERT INTO `user_menu` VALUES ('5316', '7', '1_2_2_2');
INSERT INTO `user_menu` VALUES ('5315', '7', '1_2_2_1_5');
INSERT INTO `user_menu` VALUES ('5314', '7', '1_2_2_1_2');
INSERT INTO `user_menu` VALUES ('5313', '7', '1_2_2_1_1');
INSERT INTO `user_menu` VALUES ('5312', '7', '1_2_2_1');
INSERT INTO `user_menu` VALUES ('5311', '7', '1_2_2');
INSERT INTO `user_menu` VALUES ('5310', '7', '1_2_1_4');
INSERT INTO `user_menu` VALUES ('5309', '7', '1_2_1_2');
INSERT INTO `user_menu` VALUES ('5308', '7', '1_2_1_1');
INSERT INTO `user_menu` VALUES ('5307', '7', '1_2_1');
INSERT INTO `user_menu` VALUES ('5306', '7', '1_2');
INSERT INTO `user_menu` VALUES ('5305', '7', '1_1_6');
INSERT INTO `user_menu` VALUES ('5304', '7', '1_1_5');
INSERT INTO `user_menu` VALUES ('5303', '7', '1_1_2');
INSERT INTO `user_menu` VALUES ('5302', '7', '1_1_1');
INSERT INTO `user_menu` VALUES ('5301', '7', '1_1');
INSERT INTO `user_menu` VALUES ('5300', '7', '1');
INSERT INTO `user_menu` VALUES ('5756', '7', '10_10_4');
INSERT INTO `user_menu` VALUES ('5757', '7', '11');
INSERT INTO `user_menu` VALUES ('5758', '7', '11_1');
INSERT INTO `user_menu` VALUES ('5759', '7', '11_1_1');
INSERT INTO `user_menu` VALUES ('5760', '7', '11_1_2');
INSERT INTO `user_menu` VALUES ('5761', '7', '11_1_3');
INSERT INTO `user_menu` VALUES ('5762', '7', '11_1_4');
INSERT INTO `user_menu` VALUES ('5763', '7', '11_1_5');
INSERT INTO `user_menu` VALUES ('5764', '7', '12');
INSERT INTO `user_menu` VALUES ('5765', '7', '12_1');
INSERT INTO `user_menu` VALUES ('5766', '7', '12_1_1');
INSERT INTO `user_menu` VALUES ('5767', '7', '12_1_2');
INSERT INTO `user_menu` VALUES ('5768', '7', '12_1_3');
INSERT INTO `user_menu` VALUES ('5769', '7', '12_1_4');
INSERT INTO `user_menu` VALUES ('5770', '7', '12_5');
INSERT INTO `user_menu` VALUES ('5771', '7', '12_5_1');
INSERT INTO `user_menu` VALUES ('5772', '7', '12_5_2');
INSERT INTO `user_menu` VALUES ('5773', '7', '12_5_3');
INSERT INTO `user_menu` VALUES ('5774', '7', '12_5_4');
INSERT INTO `user_menu` VALUES ('5775', '7', '12_5_5');
INSERT INTO `user_menu` VALUES ('5776', '7', '12_4');
INSERT INTO `user_menu` VALUES ('5777', '7', '12_4_1');
INSERT INTO `user_menu` VALUES ('5778', '7', '12_4_1_1');
INSERT INTO `user_menu` VALUES ('5779', '7', '12_4_1_2');
INSERT INTO `user_menu` VALUES ('5780', '7', '12_4_2');
INSERT INTO `user_menu` VALUES ('5781', '7', '12_4_2_1');
INSERT INTO `user_menu` VALUES ('5782', '7', '12_4_2_2');
INSERT INTO `user_menu` VALUES ('5783', '7', '12_4_3');
INSERT INTO `user_menu` VALUES ('5784', '7', '12_4_3_1');
INSERT INTO `user_menu` VALUES ('5785', '7', '12_4_3_2');
INSERT INTO `user_menu` VALUES ('5786', '7', '12_4_4');
INSERT INTO `user_menu` VALUES ('5787', '7', '12_4_4_1');
INSERT INTO `user_menu` VALUES ('5788', '7', '12_4_4_2');
INSERT INTO `user_menu` VALUES ('5789', '7', '12_4_5');
INSERT INTO `user_menu` VALUES ('5790', '7', '12_4_5_1');
INSERT INTO `user_menu` VALUES ('5791', '7', '12_4_5_2');
INSERT INTO `user_menu` VALUES ('5792', '7', '12_4_6');
INSERT INTO `user_menu` VALUES ('5793', '7', '12_4_6_1');
INSERT INTO `user_menu` VALUES ('5794', '7', '12_4_6_2');
INSERT INTO `user_menu` VALUES ('5795', '7', '12_4_6_3');
INSERT INTO `user_menu` VALUES ('5796', '7', '12_2');
INSERT INTO `user_menu` VALUES ('5797', '7', '12_2_1');
INSERT INTO `user_menu` VALUES ('5798', '7', '12_2_2');
INSERT INTO `user_menu` VALUES ('5799', '7', '12_2_3');
INSERT INTO `user_menu` VALUES ('5800', '7', '12_2_4');
INSERT INTO `user_menu` VALUES ('5801', '7', '12_3');
INSERT INTO `user_menu` VALUES ('5802', '7', '12_3_1');
INSERT INTO `user_menu` VALUES ('5803', '7', '12_3_2');
INSERT INTO `user_menu` VALUES ('5804', '7', '12_3_3');
INSERT INTO `user_menu` VALUES ('8733', '1', '8_1_2');
INSERT INTO `user_menu` VALUES ('8732', '1', '8_1_1');
INSERT INTO `user_menu` VALUES ('8731', '1', '8_1');
INSERT INTO `user_menu` VALUES ('8730', '1', '8_3');
INSERT INTO `user_menu` VALUES ('8729', '1', '8');
INSERT INTO `user_menu` VALUES ('8728', '1', '7_4');
INSERT INTO `user_menu` VALUES ('8727', '1', '7_3');
INSERT INTO `user_menu` VALUES ('8726', '1', '7_2');
INSERT INTO `user_menu` VALUES ('8725', '1', '7_1_4');
INSERT INTO `user_menu` VALUES ('8724', '1', '7_1_3');
INSERT INTO `user_menu` VALUES ('8723', '1', '7_1_2');
INSERT INTO `user_menu` VALUES ('8722', '1', '7_1_1');
INSERT INTO `user_menu` VALUES ('8721', '1', '7_1');
INSERT INTO `user_menu` VALUES ('8720', '1', '7');
INSERT INTO `user_menu` VALUES ('8719', '1', '6_4_2');
INSERT INTO `user_menu` VALUES ('8718', '1', '6_4_1');
INSERT INTO `user_menu` VALUES ('8717', '1', '6_4');
INSERT INTO `user_menu` VALUES ('8716', '1', '6_3_2');
INSERT INTO `user_menu` VALUES ('8715', '1', '6_3_1');
INSERT INTO `user_menu` VALUES ('8714', '1', '6_3');
INSERT INTO `user_menu` VALUES ('8713', '1', '6_2_6');
INSERT INTO `user_menu` VALUES ('8712', '1', '6_2_2');
INSERT INTO `user_menu` VALUES ('8711', '1', '6_2_3');
INSERT INTO `user_menu` VALUES ('8710', '1', '6_2_4');
INSERT INTO `user_menu` VALUES ('8709', '1', '6_2_5_5');
INSERT INTO `user_menu` VALUES ('8708', '1', '6_2_5_4');
INSERT INTO `user_menu` VALUES ('8707', '1', '6_2_5_3');
INSERT INTO `user_menu` VALUES ('8706', '1', '6_2_5_2');
INSERT INTO `user_menu` VALUES ('8705', '1', '6_2_5_1');
INSERT INTO `user_menu` VALUES ('8704', '1', '6_2_5');
INSERT INTO `user_menu` VALUES ('8703', '1', '6_2_1');
INSERT INTO `user_menu` VALUES ('8702', '1', '6_2');
INSERT INTO `user_menu` VALUES ('8701', '1', '6_1_3');
INSERT INTO `user_menu` VALUES ('8700', '1', '6_1_2');
INSERT INTO `user_menu` VALUES ('8699', '1', '6_1_1');
INSERT INTO `user_menu` VALUES ('8698', '1', '6_1');
INSERT INTO `user_menu` VALUES ('8697', '1', '6');
INSERT INTO `user_menu` VALUES ('8696', '1', '5_2');
INSERT INTO `user_menu` VALUES ('8695', '1', '5_1_8');
INSERT INTO `user_menu` VALUES ('8694', '1', '5_1_7');
INSERT INTO `user_menu` VALUES ('8693', '1', '5_1_6');
INSERT INTO `user_menu` VALUES ('8692', '1', '5_1_4');
INSERT INTO `user_menu` VALUES ('8691', '1', '5_1_3');
INSERT INTO `user_menu` VALUES ('8690', '1', '5_1_2');
INSERT INTO `user_menu` VALUES ('8689', '1', '5_1_1');
INSERT INTO `user_menu` VALUES ('8688', '1', '5_1_5');
INSERT INTO `user_menu` VALUES ('8687', '1', '5_1');
INSERT INTO `user_menu` VALUES ('8686', '1', '5');
INSERT INTO `user_menu` VALUES ('8685', '1', '4_4');
INSERT INTO `user_menu` VALUES ('8684', '1', '4_3_2');
INSERT INTO `user_menu` VALUES ('8683', '1', '4_3_1');
INSERT INTO `user_menu` VALUES ('8682', '1', '4_3');
INSERT INTO `user_menu` VALUES ('8681', '1', '4_2_1');
INSERT INTO `user_menu` VALUES ('8680', '1', '4_2');
INSERT INTO `user_menu` VALUES ('8679', '1', '4_1_5_5');
INSERT INTO `user_menu` VALUES ('8678', '1', '4_1_5_4');
INSERT INTO `user_menu` VALUES ('8677', '1', '4_1_5_3');
INSERT INTO `user_menu` VALUES ('8676', '1', '4_1_5_2');
INSERT INTO `user_menu` VALUES ('8675', '1', '4_1_5_1');
INSERT INTO `user_menu` VALUES ('8674', '1', '4_1_5');
INSERT INTO `user_menu` VALUES ('8673', '1', '4_1_4');
INSERT INTO `user_menu` VALUES ('8672', '1', '4_1_3');
INSERT INTO `user_menu` VALUES ('8671', '1', '4_1_2');
INSERT INTO `user_menu` VALUES ('8670', '1', '4_1_1');
INSERT INTO `user_menu` VALUES ('8669', '1', '4_1');
INSERT INTO `user_menu` VALUES ('8668', '1', '4');
INSERT INTO `user_menu` VALUES ('8667', '1', '3_9_3');
INSERT INTO `user_menu` VALUES ('8666', '1', '3_9_2');
INSERT INTO `user_menu` VALUES ('8665', '1', '3_9_1');
INSERT INTO `user_menu` VALUES ('8664', '1', '3_9');
INSERT INTO `user_menu` VALUES ('8663', '1', '3_8_3');
INSERT INTO `user_menu` VALUES ('8662', '1', '3_8_2');
INSERT INTO `user_menu` VALUES ('8661', '1', '3_8_1');
INSERT INTO `user_menu` VALUES ('8660', '1', '3_8');
INSERT INTO `user_menu` VALUES ('8659', '1', '3_7_3');
INSERT INTO `user_menu` VALUES ('8658', '1', '3_7_2');
INSERT INTO `user_menu` VALUES ('8657', '1', '3_7_1');
INSERT INTO `user_menu` VALUES ('8656', '1', '3_7');
INSERT INTO `user_menu` VALUES ('8655', '1', '3_6_3');
INSERT INTO `user_menu` VALUES ('8654', '1', '3_6_2');
INSERT INTO `user_menu` VALUES ('8653', '1', '3_6_1');
INSERT INTO `user_menu` VALUES ('8652', '1', '3_6');
INSERT INTO `user_menu` VALUES ('8651', '1', '3_5_3');
INSERT INTO `user_menu` VALUES ('8650', '1', '3_5_2');
INSERT INTO `user_menu` VALUES ('8649', '1', '3_5_1');
INSERT INTO `user_menu` VALUES ('8648', '1', '3_5');
INSERT INTO `user_menu` VALUES ('8647', '1', '3_4_4');
INSERT INTO `user_menu` VALUES ('8646', '1', '3_4_3');
INSERT INTO `user_menu` VALUES ('8645', '1', '3_4_2');
INSERT INTO `user_menu` VALUES ('8644', '1', '3_4_1');
INSERT INTO `user_menu` VALUES ('8643', '1', '3_4');
INSERT INTO `user_menu` VALUES ('8642', '1', '3_3_7');
INSERT INTO `user_menu` VALUES ('8641', '1', '3_3_6');
INSERT INTO `user_menu` VALUES ('8640', '1', '3_3_5');
INSERT INTO `user_menu` VALUES ('8639', '1', '3_3_4');
INSERT INTO `user_menu` VALUES ('8638', '1', '3_3_3');
INSERT INTO `user_menu` VALUES ('8637', '1', '3_3_2');
INSERT INTO `user_menu` VALUES ('8636', '1', '3_3_1');
INSERT INTO `user_menu` VALUES ('8635', '1', '3_3');
INSERT INTO `user_menu` VALUES ('8634', '1', '3_2_2');
INSERT INTO `user_menu` VALUES ('8633', '1', '3_2_1');
INSERT INTO `user_menu` VALUES ('8632', '1', '3_2');
INSERT INTO `user_menu` VALUES ('8631', '1', '3_1_3');
INSERT INTO `user_menu` VALUES ('8630', '1', '3_1_2');
INSERT INTO `user_menu` VALUES ('8629', '1', '3_1_1');
INSERT INTO `user_menu` VALUES ('8628', '1', '3_1');
INSERT INTO `user_menu` VALUES ('8627', '1', '3');
INSERT INTO `user_menu` VALUES ('8626', '1', '2_8');
INSERT INTO `user_menu` VALUES ('8625', '1', '2_7_2');
INSERT INTO `user_menu` VALUES ('8624', '1', '2_7_1');
INSERT INTO `user_menu` VALUES ('8623', '1', '2_7');
INSERT INTO `user_menu` VALUES ('8622', '1', '2_6_3');
INSERT INTO `user_menu` VALUES ('8621', '1', '2_6_2');
INSERT INTO `user_menu` VALUES ('8620', '1', '2_6_1');
INSERT INTO `user_menu` VALUES ('8619', '1', '2_6');
INSERT INTO `user_menu` VALUES ('8618', '1', '2_5_3');
INSERT INTO `user_menu` VALUES ('8617', '1', '2_5_2');
INSERT INTO `user_menu` VALUES ('8616', '1', '2_5_1');
INSERT INTO `user_menu` VALUES ('8615', '1', '2_5');
INSERT INTO `user_menu` VALUES ('8614', '1', '2_4_3');
INSERT INTO `user_menu` VALUES ('8613', '1', '2_4_2');
INSERT INTO `user_menu` VALUES ('8612', '1', '2_4_1');
INSERT INTO `user_menu` VALUES ('8611', '1', '2_4');
INSERT INTO `user_menu` VALUES ('8610', '1', '2_3_3');
INSERT INTO `user_menu` VALUES ('8609', '1', '2_3_2');
INSERT INTO `user_menu` VALUES ('8608', '1', '2_3_1');
INSERT INTO `user_menu` VALUES ('8607', '1', '2_3');
INSERT INTO `user_menu` VALUES ('8606', '1', '2_2_3');
INSERT INTO `user_menu` VALUES ('8605', '1', '2_2_2');
INSERT INTO `user_menu` VALUES ('8604', '1', '2_2_1');
INSERT INTO `user_menu` VALUES ('8603', '1', '2_2');
INSERT INTO `user_menu` VALUES ('8602', '1', '2_1_4');
INSERT INTO `user_menu` VALUES ('8601', '1', '2_1_3');
INSERT INTO `user_menu` VALUES ('8600', '1', '2_1_2');
INSERT INTO `user_menu` VALUES ('8599', '1', '2_1_1');
INSERT INTO `user_menu` VALUES ('8598', '1', '2_1');
INSERT INTO `user_menu` VALUES ('6615', '9', '11_1_5');
INSERT INTO `user_menu` VALUES ('6614', '9', '11_1_4');
INSERT INTO `user_menu` VALUES ('6613', '9', '11_1_3');
INSERT INTO `user_menu` VALUES ('6612', '9', '11_1_2');
INSERT INTO `user_menu` VALUES ('6611', '9', '11_1_1');
INSERT INTO `user_menu` VALUES ('6610', '9', '11_1');
INSERT INTO `user_menu` VALUES ('6609', '9', '11');
INSERT INTO `user_menu` VALUES ('6608', '9', '7_5_3');
INSERT INTO `user_menu` VALUES ('6607', '9', '7_5_1');
INSERT INTO `user_menu` VALUES ('6606', '9', '7_5_2');
INSERT INTO `user_menu` VALUES ('6605', '9', '7_5');
INSERT INTO `user_menu` VALUES ('6604', '9', '7_4_5');
INSERT INTO `user_menu` VALUES ('6603', '9', '7_4_4');
INSERT INTO `user_menu` VALUES ('6602', '9', '7_4_3');
INSERT INTO `user_menu` VALUES ('6601', '9', '7_4_2');
INSERT INTO `user_menu` VALUES ('6600', '9', '7_4_1');
INSERT INTO `user_menu` VALUES ('6599', '9', '7_4');
INSERT INTO `user_menu` VALUES ('6598', '9', '7_3_8');
INSERT INTO `user_menu` VALUES ('6597', '9', '7_3_7');
INSERT INTO `user_menu` VALUES ('6596', '9', '7_3_6');
INSERT INTO `user_menu` VALUES ('6595', '9', '7_3_5');
INSERT INTO `user_menu` VALUES ('6594', '9', '7_3_4');
INSERT INTO `user_menu` VALUES ('6593', '9', '7_3_2');
INSERT INTO `user_menu` VALUES ('6592', '9', '7_3_1');
INSERT INTO `user_menu` VALUES ('6591', '9', '7_3');
INSERT INTO `user_menu` VALUES ('6590', '9', '7_2_7');
INSERT INTO `user_menu` VALUES ('6589', '9', '7_2_6');
INSERT INTO `user_menu` VALUES ('6588', '9', '7_2_5');
INSERT INTO `user_menu` VALUES ('6587', '9', '7_2_4');
INSERT INTO `user_menu` VALUES ('6586', '9', '7_2_2');
INSERT INTO `user_menu` VALUES ('6585', '9', '7_2_1');
INSERT INTO `user_menu` VALUES ('6584', '9', '7_2');
INSERT INTO `user_menu` VALUES ('6583', '9', '7_1_5');
INSERT INTO `user_menu` VALUES ('6582', '9', '7_1_4');
INSERT INTO `user_menu` VALUES ('6581', '9', '7_1_3');
INSERT INTO `user_menu` VALUES ('6580', '9', '7_1_2');
INSERT INTO `user_menu` VALUES ('6579', '9', '7_1_1');
INSERT INTO `user_menu` VALUES ('6578', '9', '7_1');
INSERT INTO `user_menu` VALUES ('6577', '9', '7');
INSERT INTO `user_menu` VALUES ('6576', '5', '2_6_1_4');
INSERT INTO `user_menu` VALUES ('6575', '5', '2_6_1_3');
INSERT INTO `user_menu` VALUES ('6574', '5', '2_6_1_1');
INSERT INTO `user_menu` VALUES ('6573', '5', '2_6_1_2');
INSERT INTO `user_menu` VALUES ('6572', '5', '2_6_1');
INSERT INTO `user_menu` VALUES ('6571', '5', '2_6');
INSERT INTO `user_menu` VALUES ('6570', '5', '2_4_1_3');
INSERT INTO `user_menu` VALUES ('6569', '5', '2_4_1_2');
INSERT INTO `user_menu` VALUES ('6568', '5', '2_4_1_1');
INSERT INTO `user_menu` VALUES ('6567', '5', '2_4_1');
INSERT INTO `user_menu` VALUES ('6566', '5', '2_4');
INSERT INTO `user_menu` VALUES ('6565', '5', '2_3_1_4');
INSERT INTO `user_menu` VALUES ('6564', '5', '2_3_1_3');
INSERT INTO `user_menu` VALUES ('6563', '5', '2_3_1_1');
INSERT INTO `user_menu` VALUES ('6562', '5', '2_3_1_2');
INSERT INTO `user_menu` VALUES ('6561', '5', '2_3_1');
INSERT INTO `user_menu` VALUES ('6560', '5', '2_3');
INSERT INTO `user_menu` VALUES ('6559', '5', '2_2_1_4');
INSERT INTO `user_menu` VALUES ('6558', '5', '2_2_1_3');
INSERT INTO `user_menu` VALUES ('6557', '5', '2_2_1_1');
INSERT INTO `user_menu` VALUES ('6556', '5', '2_2_1_2');
INSERT INTO `user_menu` VALUES ('6555', '5', '2_2_1');
INSERT INTO `user_menu` VALUES ('6554', '5', '2_2');
INSERT INTO `user_menu` VALUES ('6553', '5', '2_1_2_3');
INSERT INTO `user_menu` VALUES ('6552', '5', '2_1_2_2');
INSERT INTO `user_menu` VALUES ('6551', '5', '2_1_2_1');
INSERT INTO `user_menu` VALUES ('6550', '5', '2_1_2_4');
INSERT INTO `user_menu` VALUES ('6549', '5', '2_1_2');
INSERT INTO `user_menu` VALUES ('6548', '5', '2_1_1_4_3');
INSERT INTO `user_menu` VALUES ('6547', '5', '2_1_1_4_2');
INSERT INTO `user_menu` VALUES ('6546', '5', '2_1_1_4_1');
INSERT INTO `user_menu` VALUES ('6545', '5', '2_1_1_4');
INSERT INTO `user_menu` VALUES ('6544', '5', '2_1_1_3_3');
INSERT INTO `user_menu` VALUES ('6543', '5', '2_1_1_3_2');
INSERT INTO `user_menu` VALUES ('6542', '5', '2_1_1_3_1');
INSERT INTO `user_menu` VALUES ('6541', '5', '2_1_1_3');
INSERT INTO `user_menu` VALUES ('6540', '5', '2_1_1_2');
INSERT INTO `user_menu` VALUES ('6539', '5', '2_1_1_1');
INSERT INTO `user_menu` VALUES ('6538', '5', '2_1_1');
INSERT INTO `user_menu` VALUES ('6537', '5', '2_1');
INSERT INTO `user_menu` VALUES ('6536', '5', '2');
INSERT INTO `user_menu` VALUES ('6535', '5', '1_8_5');
INSERT INTO `user_menu` VALUES ('6534', '5', '1_8_4');
INSERT INTO `user_menu` VALUES ('6533', '5', '1_8_3');
INSERT INTO `user_menu` VALUES ('6532', '5', '1_8_2');
INSERT INTO `user_menu` VALUES ('6531', '5', '1_8_1');
INSERT INTO `user_menu` VALUES ('6530', '5', '1_8');
INSERT INTO `user_menu` VALUES ('6529', '5', '1_2_2_2_2');
INSERT INTO `user_menu` VALUES ('6528', '5', '1_2_2_2_3');
INSERT INTO `user_menu` VALUES ('6527', '5', '1_2_2_2_1');
INSERT INTO `user_menu` VALUES ('6526', '5', '1_2_2_2');
INSERT INTO `user_menu` VALUES ('6525', '5', '1_2_2_1_5');
INSERT INTO `user_menu` VALUES ('6524', '5', '1_2_2_1_2');
INSERT INTO `user_menu` VALUES ('6523', '5', '1_2_2_1_1');
INSERT INTO `user_menu` VALUES ('6522', '5', '1_2_2_1');
INSERT INTO `user_menu` VALUES ('6521', '5', '1_2_2');
INSERT INTO `user_menu` VALUES ('6520', '5', '1_2_1_4');
INSERT INTO `user_menu` VALUES ('6519', '5', '1_2_1_2');
INSERT INTO `user_menu` VALUES ('6518', '5', '1_2_1_1');
INSERT INTO `user_menu` VALUES ('6517', '5', '1_2_1');
INSERT INTO `user_menu` VALUES ('6516', '5', '1_2');
INSERT INTO `user_menu` VALUES ('6515', '5', '1_1_6');
INSERT INTO `user_menu` VALUES ('6514', '5', '1_1_5');
INSERT INTO `user_menu` VALUES ('6513', '5', '1_1_2');
INSERT INTO `user_menu` VALUES ('6512', '5', '1_1_1');
INSERT INTO `user_menu` VALUES ('6511', '5', '1_1');
INSERT INTO `user_menu` VALUES ('6510', '5', '1');
INSERT INTO `user_menu` VALUES ('8597', '1', '2');
INSERT INTO `user_menu` VALUES ('8596', '1', '1_3');
INSERT INTO `user_menu` VALUES ('8595', '1', '1_2_5');
INSERT INTO `user_menu` VALUES ('8594', '1', '1_2_4');
INSERT INTO `user_menu` VALUES ('8593', '1', '1_2_3');
INSERT INTO `user_menu` VALUES ('8592', '1', '1_2_2');
INSERT INTO `user_menu` VALUES ('8591', '1', '1_2_1');
INSERT INTO `user_menu` VALUES ('8590', '1', '1_2');
INSERT INTO `user_menu` VALUES ('8589', '1', '1_1_3');
INSERT INTO `user_menu` VALUES ('8588', '1', '1_1_1');
INSERT INTO `user_menu` VALUES ('7851', '17', '4_3_2');
INSERT INTO `user_menu` VALUES ('8587', '1', '1_1_2');
INSERT INTO `user_menu` VALUES ('8586', '1', '1_1');
INSERT INTO `user_menu` VALUES ('8585', '1', '1');
INSERT INTO `user_menu` VALUES ('8990', '11', '8_1');
INSERT INTO `user_menu` VALUES ('8989', '11', '8');
INSERT INTO `user_menu` VALUES ('8988', '11', '6_3_2');
INSERT INTO `user_menu` VALUES ('8987', '11', '6_3_1');
INSERT INTO `user_menu` VALUES ('8986', '11', '6_3');
INSERT INTO `user_menu` VALUES ('8985', '11', '6');
INSERT INTO `user_menu` VALUES ('8984', '11', '2_7_1');
INSERT INTO `user_menu` VALUES ('8983', '11', '2_7');
INSERT INTO `user_menu` VALUES ('8982', '11', '2_1_4');
INSERT INTO `user_menu` VALUES ('8981', '11', '2_1_3');
INSERT INTO `user_menu` VALUES ('8980', '11', '2_1_2');
INSERT INTO `user_menu` VALUES ('8979', '11', '2_1_1');
INSERT INTO `user_menu` VALUES ('8978', '11', '2_1');
INSERT INTO `user_menu` VALUES ('8977', '11', '2');
INSERT INTO `user_menu` VALUES ('8976', '11', '1_1_1');
INSERT INTO `user_menu` VALUES ('8975', '11', '1_1_2');
INSERT INTO `user_menu` VALUES ('8974', '11', '1_1');
INSERT INTO `user_menu` VALUES ('6954', '13', '1');
INSERT INTO `user_menu` VALUES ('6955', '13', '1_1');
INSERT INTO `user_menu` VALUES ('6956', '13', '1_1_1');
INSERT INTO `user_menu` VALUES ('6957', '13', '1_1_2');
INSERT INTO `user_menu` VALUES ('6958', '13', '1_1_2_1');
INSERT INTO `user_menu` VALUES ('6959', '13', '1_1_2_2');
INSERT INTO `user_menu` VALUES ('6960', '13', '1_1_2_3');
INSERT INTO `user_menu` VALUES ('6961', '13', '1_2');
INSERT INTO `user_menu` VALUES ('6962', '13', '1_2_1');
INSERT INTO `user_menu` VALUES ('6963', '13', '1_2_2');
INSERT INTO `user_menu` VALUES ('6964', '13', '1_2_3');
INSERT INTO `user_menu` VALUES ('6965', '13', '1_2_4');
INSERT INTO `user_menu` VALUES ('6966', '13', '1_2_5');
INSERT INTO `user_menu` VALUES ('6967', '13', '8');
INSERT INTO `user_menu` VALUES ('6968', '13', '8_1');
INSERT INTO `user_menu` VALUES ('6969', '13', '8_1_1');
INSERT INTO `user_menu` VALUES ('6970', '13', '8_1_2');
INSERT INTO `user_menu` VALUES ('6971', '13', '8_1_2_1');
INSERT INTO `user_menu` VALUES ('6972', '13', '8_1_2_2');
INSERT INTO `user_menu` VALUES ('6973', '13', '8_2');
INSERT INTO `user_menu` VALUES ('6974', '13', '8_2_1');
INSERT INTO `user_menu` VALUES ('6975', '13', '8_2_2');
INSERT INTO `user_menu` VALUES ('7850', '17', '4_3_1');
INSERT INTO `user_menu` VALUES ('7849', '17', '4_3');
INSERT INTO `user_menu` VALUES ('7848', '17', '4_2_1');
INSERT INTO `user_menu` VALUES ('7847', '17', '4_2');
INSERT INTO `user_menu` VALUES ('7846', '17', '4_1_5_5');
INSERT INTO `user_menu` VALUES ('7845', '17', '4_1_5_4');
INSERT INTO `user_menu` VALUES ('7844', '17', '4_1_5_3');
INSERT INTO `user_menu` VALUES ('7607', '16', '8_1_1');
INSERT INTO `user_menu` VALUES ('7606', '16', '8_1');
INSERT INTO `user_menu` VALUES ('7605', '16', '8');
INSERT INTO `user_menu` VALUES ('7604', '16', '2_2_3');
INSERT INTO `user_menu` VALUES ('7603', '16', '2_2_2');
INSERT INTO `user_menu` VALUES ('7602', '16', '2_2_1');
INSERT INTO `user_menu` VALUES ('7601', '16', '2_2');
INSERT INTO `user_menu` VALUES ('7600', '16', '2_1_4');
INSERT INTO `user_menu` VALUES ('7599', '16', '2_1_3');
INSERT INTO `user_menu` VALUES ('7598', '16', '2_1_2');
INSERT INTO `user_menu` VALUES ('7597', '16', '2_1_1');
INSERT INTO `user_menu` VALUES ('7596', '16', '2_1');
INSERT INTO `user_menu` VALUES ('7595', '16', '2');
INSERT INTO `user_menu` VALUES ('7594', '16', '1_1_1');
INSERT INTO `user_menu` VALUES ('7593', '16', '1_1');
INSERT INTO `user_menu` VALUES ('7592', '16', '1');
INSERT INTO `user_menu` VALUES ('7558', '14', '8_2_2');
INSERT INTO `user_menu` VALUES ('7557', '14', '8_2_1');
INSERT INTO `user_menu` VALUES ('7556', '14', '8_2');
INSERT INTO `user_menu` VALUES ('7555', '14', '8_1_2_2');
INSERT INTO `user_menu` VALUES ('7554', '14', '8_1_2_1');
INSERT INTO `user_menu` VALUES ('7553', '14', '8_1_2');
INSERT INTO `user_menu` VALUES ('7552', '14', '8_1_1');
INSERT INTO `user_menu` VALUES ('7551', '14', '8_1');
INSERT INTO `user_menu` VALUES ('7550', '14', '8');
INSERT INTO `user_menu` VALUES ('7549', '14', '5_1_7');
INSERT INTO `user_menu` VALUES ('7548', '14', '5_1_6');
INSERT INTO `user_menu` VALUES ('7547', '14', '5_1_4');
INSERT INTO `user_menu` VALUES ('7546', '14', '5_1_3');
INSERT INTO `user_menu` VALUES ('7545', '14', '5_1_2');
INSERT INTO `user_menu` VALUES ('7544', '14', '5_1_1');
INSERT INTO `user_menu` VALUES ('7543', '14', '5_1_5');
INSERT INTO `user_menu` VALUES ('7542', '14', '5_1');
INSERT INTO `user_menu` VALUES ('7541', '14', '5');
INSERT INTO `user_menu` VALUES ('7540', '14', '4_3_2');
INSERT INTO `user_menu` VALUES ('7539', '14', '4_3_1');
INSERT INTO `user_menu` VALUES ('7538', '14', '4_3');
INSERT INTO `user_menu` VALUES ('7537', '14', '4_2_1');
INSERT INTO `user_menu` VALUES ('7536', '14', '4_2');
INSERT INTO `user_menu` VALUES ('7535', '14', '4_1_5_5');
INSERT INTO `user_menu` VALUES ('7534', '14', '4_1_5_4');
INSERT INTO `user_menu` VALUES ('7533', '14', '4_1_5_3');
INSERT INTO `user_menu` VALUES ('7532', '14', '4_1_5_2');
INSERT INTO `user_menu` VALUES ('7531', '14', '4_1_5_1');
INSERT INTO `user_menu` VALUES ('7530', '14', '4_1_5');
INSERT INTO `user_menu` VALUES ('7529', '14', '4_1_4');
INSERT INTO `user_menu` VALUES ('7528', '14', '4_1_3');
INSERT INTO `user_menu` VALUES ('7527', '14', '4_1_2');
INSERT INTO `user_menu` VALUES ('7526', '14', '4_1_1');
INSERT INTO `user_menu` VALUES ('7525', '14', '4_1');
INSERT INTO `user_menu` VALUES ('7524', '14', '4');
INSERT INTO `user_menu` VALUES ('7523', '14', '3_9_3');
INSERT INTO `user_menu` VALUES ('7522', '14', '3_9_2');
INSERT INTO `user_menu` VALUES ('7521', '14', '3_9_1');
INSERT INTO `user_menu` VALUES ('7520', '14', '3_9');
INSERT INTO `user_menu` VALUES ('7519', '14', '3_8_3');
INSERT INTO `user_menu` VALUES ('7518', '14', '3_8_2');
INSERT INTO `user_menu` VALUES ('7517', '14', '3_8_1');
INSERT INTO `user_menu` VALUES ('7516', '14', '3_8');
INSERT INTO `user_menu` VALUES ('7515', '14', '3_7_3');
INSERT INTO `user_menu` VALUES ('7514', '14', '3_7_2');
INSERT INTO `user_menu` VALUES ('7513', '14', '3_7_1');
INSERT INTO `user_menu` VALUES ('7512', '14', '3_7');
INSERT INTO `user_menu` VALUES ('7511', '14', '3_6_3');
INSERT INTO `user_menu` VALUES ('7510', '14', '3_6_2');
INSERT INTO `user_menu` VALUES ('7509', '14', '3_6_1');
INSERT INTO `user_menu` VALUES ('7508', '14', '3_6');
INSERT INTO `user_menu` VALUES ('7507', '14', '3_5_3');
INSERT INTO `user_menu` VALUES ('7506', '14', '3_5_2');
INSERT INTO `user_menu` VALUES ('7505', '14', '3_5_1');
INSERT INTO `user_menu` VALUES ('7504', '14', '3_5');
INSERT INTO `user_menu` VALUES ('7503', '14', '3_4_4');
INSERT INTO `user_menu` VALUES ('7502', '14', '3_4_3');
INSERT INTO `user_menu` VALUES ('7501', '14', '3_4_2');
INSERT INTO `user_menu` VALUES ('7500', '14', '3_4_1');
INSERT INTO `user_menu` VALUES ('7499', '14', '3_4');
INSERT INTO `user_menu` VALUES ('7498', '14', '3_3_7');
INSERT INTO `user_menu` VALUES ('7497', '14', '3_3_6');
INSERT INTO `user_menu` VALUES ('7496', '14', '3_3_5');
INSERT INTO `user_menu` VALUES ('7495', '14', '3_3_4');
INSERT INTO `user_menu` VALUES ('7494', '14', '3_3_3');
INSERT INTO `user_menu` VALUES ('7493', '14', '3_3_2');
INSERT INTO `user_menu` VALUES ('7065', '15', '2');
INSERT INTO `user_menu` VALUES ('7066', '15', '2_1');
INSERT INTO `user_menu` VALUES ('7067', '15', '2_1_1');
INSERT INTO `user_menu` VALUES ('7068', '15', '2_1_2');
INSERT INTO `user_menu` VALUES ('7069', '15', '2_1_3');
INSERT INTO `user_menu` VALUES ('7070', '15', '2_1_4');
INSERT INTO `user_menu` VALUES ('7071', '15', '2_2');
INSERT INTO `user_menu` VALUES ('7072', '15', '2_2_1');
INSERT INTO `user_menu` VALUES ('7073', '15', '2_2_2');
INSERT INTO `user_menu` VALUES ('7074', '15', '2_2_3');
INSERT INTO `user_menu` VALUES ('7075', '15', '2_3');
INSERT INTO `user_menu` VALUES ('7076', '15', '2_3_1');
INSERT INTO `user_menu` VALUES ('7077', '15', '2_3_2');
INSERT INTO `user_menu` VALUES ('7078', '15', '2_3_3');
INSERT INTO `user_menu` VALUES ('7079', '15', '2_4');
INSERT INTO `user_menu` VALUES ('7080', '15', '2_4_1');
INSERT INTO `user_menu` VALUES ('7081', '15', '2_4_2');
INSERT INTO `user_menu` VALUES ('7082', '15', '2_4_3');
INSERT INTO `user_menu` VALUES ('7083', '15', '2_5');
INSERT INTO `user_menu` VALUES ('7084', '15', '2_5_1');
INSERT INTO `user_menu` VALUES ('7085', '15', '2_5_2');
INSERT INTO `user_menu` VALUES ('7086', '15', '2_5_3');
INSERT INTO `user_menu` VALUES ('7087', '15', '2_6');
INSERT INTO `user_menu` VALUES ('7088', '15', '2_6_1');
INSERT INTO `user_menu` VALUES ('7089', '15', '2_6_2');
INSERT INTO `user_menu` VALUES ('7090', '15', '2_6_3');
INSERT INTO `user_menu` VALUES ('7091', '15', '2_7');
INSERT INTO `user_menu` VALUES ('7092', '15', '2_7_1');
INSERT INTO `user_menu` VALUES ('7093', '15', '2_7_2');
INSERT INTO `user_menu` VALUES ('7094', '15', '3');
INSERT INTO `user_menu` VALUES ('7095', '15', '3_1');
INSERT INTO `user_menu` VALUES ('7096', '15', '3_1_1');
INSERT INTO `user_menu` VALUES ('7097', '15', '3_1_2');
INSERT INTO `user_menu` VALUES ('7098', '15', '3_1_3');
INSERT INTO `user_menu` VALUES ('7099', '15', '3_2');
INSERT INTO `user_menu` VALUES ('7100', '15', '3_2_1');
INSERT INTO `user_menu` VALUES ('7101', '15', '3_2_2');
INSERT INTO `user_menu` VALUES ('7102', '15', '3_3');
INSERT INTO `user_menu` VALUES ('7103', '15', '3_3_1');
INSERT INTO `user_menu` VALUES ('7104', '15', '3_3_2');
INSERT INTO `user_menu` VALUES ('7105', '15', '3_3_3');
INSERT INTO `user_menu` VALUES ('7106', '15', '3_3_4');
INSERT INTO `user_menu` VALUES ('7107', '15', '3_3_5');
INSERT INTO `user_menu` VALUES ('7108', '15', '3_3_6');
INSERT INTO `user_menu` VALUES ('7109', '15', '3_3_7');
INSERT INTO `user_menu` VALUES ('7110', '15', '3_4');
INSERT INTO `user_menu` VALUES ('7111', '15', '3_4_1');
INSERT INTO `user_menu` VALUES ('7112', '15', '3_4_2');
INSERT INTO `user_menu` VALUES ('7113', '15', '3_4_3');
INSERT INTO `user_menu` VALUES ('7114', '15', '3_4_4');
INSERT INTO `user_menu` VALUES ('7115', '15', '3_5');
INSERT INTO `user_menu` VALUES ('7116', '15', '3_5_1');
INSERT INTO `user_menu` VALUES ('7117', '15', '3_5_2');
INSERT INTO `user_menu` VALUES ('7118', '15', '3_5_3');
INSERT INTO `user_menu` VALUES ('7119', '15', '3_6');
INSERT INTO `user_menu` VALUES ('7120', '15', '3_6_1');
INSERT INTO `user_menu` VALUES ('7121', '15', '3_6_2');
INSERT INTO `user_menu` VALUES ('7122', '15', '3_6_3');
INSERT INTO `user_menu` VALUES ('7123', '15', '3_7');
INSERT INTO `user_menu` VALUES ('7124', '15', '3_7_1');
INSERT INTO `user_menu` VALUES ('7125', '15', '3_7_2');
INSERT INTO `user_menu` VALUES ('7126', '15', '3_7_3');
INSERT INTO `user_menu` VALUES ('7127', '15', '3_8');
INSERT INTO `user_menu` VALUES ('7128', '15', '3_8_1');
INSERT INTO `user_menu` VALUES ('7129', '15', '3_8_2');
INSERT INTO `user_menu` VALUES ('7130', '15', '3_8_3');
INSERT INTO `user_menu` VALUES ('7131', '15', '3_9');
INSERT INTO `user_menu` VALUES ('7132', '15', '3_9_1');
INSERT INTO `user_menu` VALUES ('7133', '15', '3_9_2');
INSERT INTO `user_menu` VALUES ('7134', '15', '3_9_3');
INSERT INTO `user_menu` VALUES ('7135', '15', '6');
INSERT INTO `user_menu` VALUES ('7136', '15', '6_1');
INSERT INTO `user_menu` VALUES ('7137', '15', '6_1_1');
INSERT INTO `user_menu` VALUES ('7138', '15', '6_1_2');
INSERT INTO `user_menu` VALUES ('7139', '15', '6_1_3');
INSERT INTO `user_menu` VALUES ('7140', '15', '6_2');
INSERT INTO `user_menu` VALUES ('7141', '15', '6_2_1');
INSERT INTO `user_menu` VALUES ('7142', '15', '6_2_5');
INSERT INTO `user_menu` VALUES ('7143', '15', '6_2_5_1');
INSERT INTO `user_menu` VALUES ('7144', '15', '6_2_5_2');
INSERT INTO `user_menu` VALUES ('7145', '15', '6_2_5_3');
INSERT INTO `user_menu` VALUES ('7146', '15', '6_2_5_4');
INSERT INTO `user_menu` VALUES ('7147', '15', '6_2_5_5');
INSERT INTO `user_menu` VALUES ('7148', '15', '6_2_4');
INSERT INTO `user_menu` VALUES ('7149', '15', '6_2_3');
INSERT INTO `user_menu` VALUES ('7150', '15', '6_2_2');
INSERT INTO `user_menu` VALUES ('7151', '15', '6_2_6');
INSERT INTO `user_menu` VALUES ('7152', '15', '6_3');
INSERT INTO `user_menu` VALUES ('7153', '15', '6_3_1');
INSERT INTO `user_menu` VALUES ('7154', '15', '6_3_2');
INSERT INTO `user_menu` VALUES ('7155', '15', '6_4');
INSERT INTO `user_menu` VALUES ('7156', '15', '6_4_1');
INSERT INTO `user_menu` VALUES ('7157', '15', '6_4_2');
INSERT INTO `user_menu` VALUES ('9724', '10', '8_2_2');
INSERT INTO `user_menu` VALUES ('9723', '10', '8_2_1');
INSERT INTO `user_menu` VALUES ('9722', '10', '8_2_4');
INSERT INTO `user_menu` VALUES ('9721', '10', '8_2_3');
INSERT INTO `user_menu` VALUES ('9720', '10', '8_2');
INSERT INTO `user_menu` VALUES ('9719', '10', '8_1_3');
INSERT INTO `user_menu` VALUES ('9718', '10', '8_1_2');
INSERT INTO `user_menu` VALUES ('9717', '10', '8_1_1');
INSERT INTO `user_menu` VALUES ('9716', '10', '8_1');
INSERT INTO `user_menu` VALUES ('9715', '10', '8');
INSERT INTO `user_menu` VALUES ('7492', '14', '3_3_1');
INSERT INTO `user_menu` VALUES ('7491', '14', '3_3');
INSERT INTO `user_menu` VALUES ('7490', '14', '3_2_2');
INSERT INTO `user_menu` VALUES ('7489', '14', '3_2_1');
INSERT INTO `user_menu` VALUES ('7488', '14', '3_2');
INSERT INTO `user_menu` VALUES ('7487', '14', '3_1_3');
INSERT INTO `user_menu` VALUES ('7486', '14', '3_1_2');
INSERT INTO `user_menu` VALUES ('7485', '14', '3_1_1');
INSERT INTO `user_menu` VALUES ('7484', '14', '3_1');
INSERT INTO `user_menu` VALUES ('7483', '14', '3');
INSERT INTO `user_menu` VALUES ('7482', '14', '2_1_4');
INSERT INTO `user_menu` VALUES ('7481', '14', '2_1_3');
INSERT INTO `user_menu` VALUES ('7480', '14', '2_1_2');
INSERT INTO `user_menu` VALUES ('7479', '14', '2_1_1');
INSERT INTO `user_menu` VALUES ('7478', '14', '2_1');
INSERT INTO `user_menu` VALUES ('7477', '14', '2');
INSERT INTO `user_menu` VALUES ('7476', '14', '1_2_5');
INSERT INTO `user_menu` VALUES ('7475', '14', '1_2_4');
INSERT INTO `user_menu` VALUES ('7474', '14', '1_2_3');
INSERT INTO `user_menu` VALUES ('7473', '14', '1_2_2');
INSERT INTO `user_menu` VALUES ('7472', '14', '1_2_1');
INSERT INTO `user_menu` VALUES ('7471', '14', '1_2');
INSERT INTO `user_menu` VALUES ('7470', '14', '1_1_2_3');
INSERT INTO `user_menu` VALUES ('7469', '14', '1_1_2_2');
INSERT INTO `user_menu` VALUES ('7468', '14', '1_1_2_1');
INSERT INTO `user_menu` VALUES ('7467', '14', '1_1_2');
INSERT INTO `user_menu` VALUES ('7466', '14', '1_1_1');
INSERT INTO `user_menu` VALUES ('7465', '14', '1_1');
INSERT INTO `user_menu` VALUES ('7464', '14', '1');
INSERT INTO `user_menu` VALUES ('7843', '17', '4_1_5_2');
INSERT INTO `user_menu` VALUES ('7842', '17', '4_1_5_1');
INSERT INTO `user_menu` VALUES ('7841', '17', '4_1_5');
INSERT INTO `user_menu` VALUES ('7840', '17', '4_1_4');
INSERT INTO `user_menu` VALUES ('7839', '17', '4_1_3');
INSERT INTO `user_menu` VALUES ('7838', '17', '4_1_2');
INSERT INTO `user_menu` VALUES ('7837', '17', '4_1_1');
INSERT INTO `user_menu` VALUES ('7836', '17', '4_1');
INSERT INTO `user_menu` VALUES ('7835', '17', '4');
INSERT INTO `user_menu` VALUES ('7834', '17', '3_9_3');
INSERT INTO `user_menu` VALUES ('7833', '17', '3_9_2');
INSERT INTO `user_menu` VALUES ('7832', '17', '3_9_1');
INSERT INTO `user_menu` VALUES ('7831', '17', '3_9');
INSERT INTO `user_menu` VALUES ('7830', '17', '3_8_3');
INSERT INTO `user_menu` VALUES ('7829', '17', '3_8_2');
INSERT INTO `user_menu` VALUES ('7828', '17', '3_8_1');
INSERT INTO `user_menu` VALUES ('7827', '17', '3_8');
INSERT INTO `user_menu` VALUES ('7826', '17', '3_7_3');
INSERT INTO `user_menu` VALUES ('7825', '17', '3_7_2');
INSERT INTO `user_menu` VALUES ('7824', '17', '3_7_1');
INSERT INTO `user_menu` VALUES ('7823', '17', '3_7');
INSERT INTO `user_menu` VALUES ('7822', '17', '3_6_3');
INSERT INTO `user_menu` VALUES ('7821', '17', '3_6_2');
INSERT INTO `user_menu` VALUES ('7820', '17', '3_6_1');
INSERT INTO `user_menu` VALUES ('7819', '17', '3_6');
INSERT INTO `user_menu` VALUES ('7818', '17', '3_5_3');
INSERT INTO `user_menu` VALUES ('7817', '17', '3_5_2');
INSERT INTO `user_menu` VALUES ('7816', '17', '3_5_1');
INSERT INTO `user_menu` VALUES ('7815', '17', '3_5');
INSERT INTO `user_menu` VALUES ('7814', '17', '3_4_4');
INSERT INTO `user_menu` VALUES ('7813', '17', '3_4_3');
INSERT INTO `user_menu` VALUES ('7812', '17', '3_4_2');
INSERT INTO `user_menu` VALUES ('7811', '17', '3_4_1');
INSERT INTO `user_menu` VALUES ('7810', '17', '3_4');
INSERT INTO `user_menu` VALUES ('7809', '17', '3_3_7');
INSERT INTO `user_menu` VALUES ('7808', '17', '3_3_6');
INSERT INTO `user_menu` VALUES ('7807', '17', '3_3_5');
INSERT INTO `user_menu` VALUES ('7806', '17', '3_3_4');
INSERT INTO `user_menu` VALUES ('7805', '17', '3_3_3');
INSERT INTO `user_menu` VALUES ('7804', '17', '3_3_2');
INSERT INTO `user_menu` VALUES ('7803', '17', '3_3_1');
INSERT INTO `user_menu` VALUES ('7802', '17', '3_3');
INSERT INTO `user_menu` VALUES ('7801', '17', '3_2_2');
INSERT INTO `user_menu` VALUES ('7800', '17', '3_2_1');
INSERT INTO `user_menu` VALUES ('7799', '17', '3_2');
INSERT INTO `user_menu` VALUES ('7798', '17', '3_1_3');
INSERT INTO `user_menu` VALUES ('7797', '17', '3_1_2');
INSERT INTO `user_menu` VALUES ('7796', '17', '3_1_1');
INSERT INTO `user_menu` VALUES ('7795', '17', '3_1');
INSERT INTO `user_menu` VALUES ('7794', '17', '3');
INSERT INTO `user_menu` VALUES ('7793', '17', '2_7_2');
INSERT INTO `user_menu` VALUES ('7792', '17', '2_7_1');
INSERT INTO `user_menu` VALUES ('7791', '17', '2_7');
INSERT INTO `user_menu` VALUES ('7790', '17', '2_6_3');
INSERT INTO `user_menu` VALUES ('7789', '17', '2_6_2');
INSERT INTO `user_menu` VALUES ('7788', '17', '2_6_1');
INSERT INTO `user_menu` VALUES ('7787', '17', '2_6');
INSERT INTO `user_menu` VALUES ('7786', '17', '2_5_3');
INSERT INTO `user_menu` VALUES ('7785', '17', '2_5_2');
INSERT INTO `user_menu` VALUES ('7784', '17', '2_5_1');
INSERT INTO `user_menu` VALUES ('7783', '17', '2_5');
INSERT INTO `user_menu` VALUES ('7782', '17', '2_4_3');
INSERT INTO `user_menu` VALUES ('7781', '17', '2_4_2');
INSERT INTO `user_menu` VALUES ('7780', '17', '2_4_1');
INSERT INTO `user_menu` VALUES ('7779', '17', '2_4');
INSERT INTO `user_menu` VALUES ('7778', '17', '2_3_3');
INSERT INTO `user_menu` VALUES ('7777', '17', '2_3_2');
INSERT INTO `user_menu` VALUES ('7776', '17', '2_3_1');
INSERT INTO `user_menu` VALUES ('7775', '17', '2_3');
INSERT INTO `user_menu` VALUES ('7774', '17', '2_2_3');
INSERT INTO `user_menu` VALUES ('7773', '17', '2_2_2');
INSERT INTO `user_menu` VALUES ('7772', '17', '2_2_1');
INSERT INTO `user_menu` VALUES ('7771', '17', '2_2');
INSERT INTO `user_menu` VALUES ('7770', '17', '2_1_4');
INSERT INTO `user_menu` VALUES ('7769', '17', '2_1_3');
INSERT INTO `user_menu` VALUES ('7768', '17', '2_1_2');
INSERT INTO `user_menu` VALUES ('7767', '17', '2_1_1');
INSERT INTO `user_menu` VALUES ('7766', '17', '2_1');
INSERT INTO `user_menu` VALUES ('7765', '17', '2');
INSERT INTO `user_menu` VALUES ('7852', '17', '5');
INSERT INTO `user_menu` VALUES ('7853', '17', '5_1');
INSERT INTO `user_menu` VALUES ('7854', '17', '5_1_5');
INSERT INTO `user_menu` VALUES ('7855', '17', '5_1_1');
INSERT INTO `user_menu` VALUES ('7856', '17', '5_1_2');
INSERT INTO `user_menu` VALUES ('7857', '17', '5_1_3');
INSERT INTO `user_menu` VALUES ('7858', '17', '5_1_4');
INSERT INTO `user_menu` VALUES ('7859', '17', '5_1_6');
INSERT INTO `user_menu` VALUES ('7860', '17', '5_1_7');
INSERT INTO `user_menu` VALUES ('9714', '10', '7_4');
INSERT INTO `user_menu` VALUES ('9713', '10', '7_3');
INSERT INTO `user_menu` VALUES ('9712', '10', '7_2');
INSERT INTO `user_menu` VALUES ('9711', '10', '7_1_4');
INSERT INTO `user_menu` VALUES ('9710', '10', '7_1_3');
INSERT INTO `user_menu` VALUES ('9709', '10', '7_1_2');
INSERT INTO `user_menu` VALUES ('9708', '10', '7_1_1');
INSERT INTO `user_menu` VALUES ('9707', '10', '7_1');
INSERT INTO `user_menu` VALUES ('9706', '10', '7');
INSERT INTO `user_menu` VALUES ('9705', '10', '6_4_2');
INSERT INTO `user_menu` VALUES ('9704', '10', '6_4_1');
INSERT INTO `user_menu` VALUES ('9703', '10', '6_4');
INSERT INTO `user_menu` VALUES ('9702', '10', '6_3_2');
INSERT INTO `user_menu` VALUES ('9701', '10', '6_3_1');
INSERT INTO `user_menu` VALUES ('9700', '10', '6_3');
INSERT INTO `user_menu` VALUES ('9699', '10', '6_2_6');
INSERT INTO `user_menu` VALUES ('9698', '10', '6_2_2');
INSERT INTO `user_menu` VALUES ('9697', '10', '6_2_3');
INSERT INTO `user_menu` VALUES ('9696', '10', '6_2_4');
INSERT INTO `user_menu` VALUES ('9695', '10', '6_2_5_5');
INSERT INTO `user_menu` VALUES ('9694', '10', '6_2_5_4');
INSERT INTO `user_menu` VALUES ('9693', '10', '6_2_5_3');
INSERT INTO `user_menu` VALUES ('9692', '10', '6_2_5_2');
INSERT INTO `user_menu` VALUES ('9691', '10', '6_2_5_1');
INSERT INTO `user_menu` VALUES ('9690', '10', '6_2_5');
INSERT INTO `user_menu` VALUES ('9689', '10', '6_2_1');
INSERT INTO `user_menu` VALUES ('9688', '10', '6_2');
INSERT INTO `user_menu` VALUES ('9687', '10', '6_1_3');
INSERT INTO `user_menu` VALUES ('9686', '10', '6_1_2');
INSERT INTO `user_menu` VALUES ('9685', '10', '6_1_1');
INSERT INTO `user_menu` VALUES ('9684', '10', '6_1');
INSERT INTO `user_menu` VALUES ('9683', '10', '6');
INSERT INTO `user_menu` VALUES ('9682', '10', '5_2');
INSERT INTO `user_menu` VALUES ('9681', '10', '5_1_8');
INSERT INTO `user_menu` VALUES ('9680', '10', '5_1_7');
INSERT INTO `user_menu` VALUES ('9679', '10', '5_1_6');
INSERT INTO `user_menu` VALUES ('9678', '10', '5_1_4');
INSERT INTO `user_menu` VALUES ('9677', '10', '5_1_3');
INSERT INTO `user_menu` VALUES ('9676', '10', '5_1_2');
INSERT INTO `user_menu` VALUES ('9675', '10', '5_1_1');
INSERT INTO `user_menu` VALUES ('9674', '10', '5_1_5');
INSERT INTO `user_menu` VALUES ('9673', '10', '5_1');
INSERT INTO `user_menu` VALUES ('9672', '10', '5');
INSERT INTO `user_menu` VALUES ('9671', '10', '4_4');
INSERT INTO `user_menu` VALUES ('9670', '10', '4_3_2');
INSERT INTO `user_menu` VALUES ('9669', '10', '4_3_1');
INSERT INTO `user_menu` VALUES ('9668', '10', '4_3');
INSERT INTO `user_menu` VALUES ('9667', '10', '4_2_1');
INSERT INTO `user_menu` VALUES ('9666', '10', '4_2');
INSERT INTO `user_menu` VALUES ('9665', '10', '4_1_5_5');
INSERT INTO `user_menu` VALUES ('9664', '10', '4_1_5_4');
INSERT INTO `user_menu` VALUES ('9663', '10', '4_1_5_3');
INSERT INTO `user_menu` VALUES ('9662', '10', '4_1_5_2');
INSERT INTO `user_menu` VALUES ('9661', '10', '4_1_5_1');
INSERT INTO `user_menu` VALUES ('9660', '10', '4_1_5');
INSERT INTO `user_menu` VALUES ('9659', '10', '4_1_4');
INSERT INTO `user_menu` VALUES ('9658', '10', '4_1_3');
INSERT INTO `user_menu` VALUES ('9657', '10', '4_1_2');
INSERT INTO `user_menu` VALUES ('9656', '10', '4_1_1');
INSERT INTO `user_menu` VALUES ('9655', '10', '4_1');
INSERT INTO `user_menu` VALUES ('9654', '10', '4');
INSERT INTO `user_menu` VALUES ('9653', '10', '3_7_1');
INSERT INTO `user_menu` VALUES ('9652', '10', '3_7');
INSERT INTO `user_menu` VALUES ('9651', '10', '3_9_3');
INSERT INTO `user_menu` VALUES ('9650', '10', '3_9_2');
INSERT INTO `user_menu` VALUES ('9649', '10', '3_9_1');
INSERT INTO `user_menu` VALUES ('9648', '10', '3_9');
INSERT INTO `user_menu` VALUES ('9647', '10', '3_8_3');
INSERT INTO `user_menu` VALUES ('9646', '10', '3_8_2');
INSERT INTO `user_menu` VALUES ('9645', '10', '3_8_1');
INSERT INTO `user_menu` VALUES ('9644', '10', '3_8');
INSERT INTO `user_menu` VALUES ('9643', '10', '3_6_2');
INSERT INTO `user_menu` VALUES ('9642', '10', '3_6_1');
INSERT INTO `user_menu` VALUES ('9641', '10', '3_6');
INSERT INTO `user_menu` VALUES ('9640', '10', '3_5_2');
INSERT INTO `user_menu` VALUES ('9639', '10', '3_5_1');
INSERT INTO `user_menu` VALUES ('9638', '10', '3_5');
INSERT INTO `user_menu` VALUES ('9637', '10', '3_4_2');
INSERT INTO `user_menu` VALUES ('9636', '10', '3_4_1');
INSERT INTO `user_menu` VALUES ('9635', '10', '3_4');
INSERT INTO `user_menu` VALUES ('9634', '10', '3_3_2');
INSERT INTO `user_menu` VALUES ('9633', '10', '3_3_1');
INSERT INTO `user_menu` VALUES ('9632', '10', '3_3');
INSERT INTO `user_menu` VALUES ('9631', '10', '3_2_2');
INSERT INTO `user_menu` VALUES ('9630', '10', '3_2_1');
INSERT INTO `user_menu` VALUES ('9629', '10', '3_2');
INSERT INTO `user_menu` VALUES ('9628', '10', '3_1_3');
INSERT INTO `user_menu` VALUES ('9627', '10', '3_1_2');
INSERT INTO `user_menu` VALUES ('9626', '10', '3_1_1');
INSERT INTO `user_menu` VALUES ('9625', '10', '3_1');
INSERT INTO `user_menu` VALUES ('9624', '10', '3');
INSERT INTO `user_menu` VALUES ('9623', '10', '2_8');
INSERT INTO `user_menu` VALUES ('9622', '10', '2_7_2');
INSERT INTO `user_menu` VALUES ('9621', '10', '2_7_1');
INSERT INTO `user_menu` VALUES ('9620', '10', '2_7');
INSERT INTO `user_menu` VALUES ('9619', '10', '2_6_3');
INSERT INTO `user_menu` VALUES ('9618', '10', '2_6_2');
INSERT INTO `user_menu` VALUES ('9617', '10', '2_6_1');
INSERT INTO `user_menu` VALUES ('9616', '10', '2_6');
INSERT INTO `user_menu` VALUES ('9615', '10', '2_5_3');
INSERT INTO `user_menu` VALUES ('9614', '10', '2_5_2');
INSERT INTO `user_menu` VALUES ('9613', '10', '2_5_1');
INSERT INTO `user_menu` VALUES ('9612', '10', '2_5');
INSERT INTO `user_menu` VALUES ('9611', '10', '2_4_3');
INSERT INTO `user_menu` VALUES ('9610', '10', '2_4_2');
INSERT INTO `user_menu` VALUES ('9609', '10', '2_4_1');
INSERT INTO `user_menu` VALUES ('9608', '10', '2_4');
INSERT INTO `user_menu` VALUES ('9607', '10', '2_3_3');
INSERT INTO `user_menu` VALUES ('9606', '10', '2_3_2');
INSERT INTO `user_menu` VALUES ('9605', '10', '2_3_1');
INSERT INTO `user_menu` VALUES ('9604', '10', '2_3');
INSERT INTO `user_menu` VALUES ('9603', '10', '2_2_3');
INSERT INTO `user_menu` VALUES ('9602', '10', '2_2_2');
INSERT INTO `user_menu` VALUES ('9601', '10', '2_2_1');
INSERT INTO `user_menu` VALUES ('9600', '10', '2_2');
INSERT INTO `user_menu` VALUES ('9599', '10', '2_1_3');
INSERT INTO `user_menu` VALUES ('9598', '10', '2_1_2');
INSERT INTO `user_menu` VALUES ('9597', '10', '2_1_1');
INSERT INTO `user_menu` VALUES ('9596', '10', '2_1');
INSERT INTO `user_menu` VALUES ('9595', '10', '2');
INSERT INTO `user_menu` VALUES ('9594', '10', '1_2_5');
INSERT INTO `user_menu` VALUES ('9593', '10', '1_2_4');
INSERT INTO `user_menu` VALUES ('9592', '10', '1_2_3');
INSERT INTO `user_menu` VALUES ('9591', '10', '1_2_2');
INSERT INTO `user_menu` VALUES ('9590', '10', '1_2_1');
INSERT INTO `user_menu` VALUES ('9589', '10', '1_2');
INSERT INTO `user_menu` VALUES ('9588', '10', '1_1_1');
INSERT INTO `user_menu` VALUES ('9587', '10', '1_1_2');
INSERT INTO `user_menu` VALUES ('9586', '10', '1_1');
INSERT INTO `user_menu` VALUES ('9585', '10', '1');
INSERT INTO `user_menu` VALUES ('8037', '20', '1');
INSERT INTO `user_menu` VALUES ('8038', '20', '1_1');
INSERT INTO `user_menu` VALUES ('8039', '20', '1_1_2');
INSERT INTO `user_menu` VALUES ('8040', '20', '1_1_1');
INSERT INTO `user_menu` VALUES ('8041', '20', '2');
INSERT INTO `user_menu` VALUES ('8042', '20', '2_1');
INSERT INTO `user_menu` VALUES ('8043', '20', '2_1_1');
INSERT INTO `user_menu` VALUES ('8044', '20', '2_1_2');
INSERT INTO `user_menu` VALUES ('8045', '20', '2_1_3');
INSERT INTO `user_menu` VALUES ('8046', '20', '2_1_4');
INSERT INTO `user_menu` VALUES ('8047', '20', '2_4');
INSERT INTO `user_menu` VALUES ('8048', '20', '2_4_1');
INSERT INTO `user_menu` VALUES ('8049', '20', '2_4_2');
INSERT INTO `user_menu` VALUES ('8050', '20', '2_4_3');
INSERT INTO `user_menu` VALUES ('8051', '20', '2_7');
INSERT INTO `user_menu` VALUES ('8052', '20', '2_7_1');
INSERT INTO `user_menu` VALUES ('8053', '20', '7');
INSERT INTO `user_menu` VALUES ('8054', '20', '7_1');
INSERT INTO `user_menu` VALUES ('8055', '20', '7_1_1');
INSERT INTO `user_menu` VALUES ('8056', '20', '7_1_2');
INSERT INTO `user_menu` VALUES ('8057', '20', '8');
INSERT INTO `user_menu` VALUES ('8058', '20', '8_1');
INSERT INTO `user_menu` VALUES ('8059', '20', '8_1_1');
INSERT INTO `user_menu` VALUES ('8060', '20', '8_1_2');
INSERT INTO `user_menu` VALUES ('8061', '21', '1');
INSERT INTO `user_menu` VALUES ('8062', '21', '1_1');
INSERT INTO `user_menu` VALUES ('8063', '21', '1_1_2');
INSERT INTO `user_menu` VALUES ('8064', '21', '1_1_1');
INSERT INTO `user_menu` VALUES ('8065', '21', '2');
INSERT INTO `user_menu` VALUES ('8066', '21', '2_1');
INSERT INTO `user_menu` VALUES ('8067', '21', '2_1_1');
INSERT INTO `user_menu` VALUES ('8068', '21', '2_1_2');
INSERT INTO `user_menu` VALUES ('8069', '21', '2_1_3');
INSERT INTO `user_menu` VALUES ('8070', '21', '2_1_4');
INSERT INTO `user_menu` VALUES ('8071', '21', '2_2');
INSERT INTO `user_menu` VALUES ('8072', '21', '2_2_1');
INSERT INTO `user_menu` VALUES ('8073', '21', '2_2_2');
INSERT INTO `user_menu` VALUES ('8074', '21', '2_2_3');
INSERT INTO `user_menu` VALUES ('8075', '21', '6');
INSERT INTO `user_menu` VALUES ('8076', '21', '6_1');
INSERT INTO `user_menu` VALUES ('8077', '21', '6_1_1');
INSERT INTO `user_menu` VALUES ('8078', '21', '6_1_2');
INSERT INTO `user_menu` VALUES ('8079', '21', '6_1_3');
INSERT INTO `user_menu` VALUES ('8080', '21', '6_2');
INSERT INTO `user_menu` VALUES ('8081', '21', '6_2_1');
INSERT INTO `user_menu` VALUES ('8082', '21', '6_2_5');
INSERT INTO `user_menu` VALUES ('8083', '21', '6_2_5_1');
INSERT INTO `user_menu` VALUES ('8084', '21', '6_2_5_2');
INSERT INTO `user_menu` VALUES ('8085', '21', '6_2_5_3');
INSERT INTO `user_menu` VALUES ('8086', '21', '6_2_5_4');
INSERT INTO `user_menu` VALUES ('8087', '21', '6_2_5_5');
INSERT INTO `user_menu` VALUES ('8088', '21', '6_2_4');
INSERT INTO `user_menu` VALUES ('8089', '21', '6_2_3');
INSERT INTO `user_menu` VALUES ('8090', '21', '6_2_2');
INSERT INTO `user_menu` VALUES ('8091', '21', '6_2_6');
INSERT INTO `user_menu` VALUES ('8092', '21', '6_3');
INSERT INTO `user_menu` VALUES ('8093', '21', '6_3_1');
INSERT INTO `user_menu` VALUES ('8094', '21', '6_3_2');
INSERT INTO `user_menu` VALUES ('8095', '21', '6_4');
INSERT INTO `user_menu` VALUES ('8096', '21', '6_4_1');
INSERT INTO `user_menu` VALUES ('8097', '21', '6_4_2');
INSERT INTO `user_menu` VALUES ('8098', '21', '7');
INSERT INTO `user_menu` VALUES ('8099', '21', '7_1');
INSERT INTO `user_menu` VALUES ('8100', '21', '7_1_1');
INSERT INTO `user_menu` VALUES ('8101', '21', '7_1_2');
INSERT INTO `user_menu` VALUES ('8102', '21', '7_1_3');
INSERT INTO `user_menu` VALUES ('8103', '21', '7_1_4');
INSERT INTO `user_menu` VALUES ('8104', '21', '7_2');
INSERT INTO `user_menu` VALUES ('8105', '21', '7_3');
INSERT INTO `user_menu` VALUES ('8106', '21', '7_4');
INSERT INTO `user_menu` VALUES ('8107', '21', '8');
INSERT INTO `user_menu` VALUES ('8108', '21', '8_1');
INSERT INTO `user_menu` VALUES ('8109', '21', '8_1_1');
INSERT INTO `user_menu` VALUES ('8110', '21', '8_1_2');
INSERT INTO `user_menu` VALUES ('8973', '11', '1');
INSERT INTO `user_menu` VALUES ('8129', '22', '1');
INSERT INTO `user_menu` VALUES ('8130', '22', '1_1');
INSERT INTO `user_menu` VALUES ('8131', '22', '1_1_2');
INSERT INTO `user_menu` VALUES ('8132', '22', '1_1_1');
INSERT INTO `user_menu` VALUES ('8133', '22', '2');
INSERT INTO `user_menu` VALUES ('8134', '22', '2_1');
INSERT INTO `user_menu` VALUES ('8135', '22', '2_1_1');
INSERT INTO `user_menu` VALUES ('8136', '22', '2_1_2');
INSERT INTO `user_menu` VALUES ('8137', '22', '2_1_3');
INSERT INTO `user_menu` VALUES ('8138', '22', '2_1_4');
INSERT INTO `user_menu` VALUES ('8139', '22', '6');
INSERT INTO `user_menu` VALUES ('8140', '22', '6_3');
INSERT INTO `user_menu` VALUES ('8141', '22', '6_3_1');
INSERT INTO `user_menu` VALUES ('8142', '22', '6_3_2');
INSERT INTO `user_menu` VALUES ('8143', '22', '8');
INSERT INTO `user_menu` VALUES ('8144', '22', '8_1');
INSERT INTO `user_menu` VALUES ('8145', '22', '8_1_1');
INSERT INTO `user_menu` VALUES ('8146', '22', '8_1_2');
INSERT INTO `user_menu` VALUES ('8147', '23', '1');
INSERT INTO `user_menu` VALUES ('8148', '23', '1_1');
INSERT INTO `user_menu` VALUES ('8149', '23', '1_1_2');
INSERT INTO `user_menu` VALUES ('8150', '23', '1_1_1');
INSERT INTO `user_menu` VALUES ('8151', '23', '2');
INSERT INTO `user_menu` VALUES ('8152', '23', '2_1');
INSERT INTO `user_menu` VALUES ('8153', '23', '2_1_1');
INSERT INTO `user_menu` VALUES ('8154', '23', '2_1_2');
INSERT INTO `user_menu` VALUES ('8155', '23', '2_1_3');
INSERT INTO `user_menu` VALUES ('8156', '23', '2_1_4');
INSERT INTO `user_menu` VALUES ('8157', '23', '6');
INSERT INTO `user_menu` VALUES ('8158', '23', '6_3');
INSERT INTO `user_menu` VALUES ('8159', '23', '6_3_1');
INSERT INTO `user_menu` VALUES ('8160', '23', '6_3_2');
INSERT INTO `user_menu` VALUES ('8161', '23', '8');
INSERT INTO `user_menu` VALUES ('8162', '23', '8_1');
INSERT INTO `user_menu` VALUES ('8163', '23', '8_1_1');
INSERT INTO `user_menu` VALUES ('8164', '23', '8_1_2');
INSERT INTO `user_menu` VALUES ('8200', '24', '8_1_2');
INSERT INTO `user_menu` VALUES ('8199', '24', '8_1_1');
INSERT INTO `user_menu` VALUES ('8198', '24', '8_1');
INSERT INTO `user_menu` VALUES ('8197', '24', '8');
INSERT INTO `user_menu` VALUES ('8196', '24', '6_3_2');
INSERT INTO `user_menu` VALUES ('8195', '24', '6_3_1');
INSERT INTO `user_menu` VALUES ('8194', '24', '6_3');
INSERT INTO `user_menu` VALUES ('8193', '24', '6');
INSERT INTO `user_menu` VALUES ('8192', '24', '2_1_4');
INSERT INTO `user_menu` VALUES ('8191', '24', '2_1_3');
INSERT INTO `user_menu` VALUES ('8190', '24', '2_1_2');
INSERT INTO `user_menu` VALUES ('8189', '24', '2_1_1');
INSERT INTO `user_menu` VALUES ('8188', '24', '2_1');
INSERT INTO `user_menu` VALUES ('8187', '24', '2');
INSERT INTO `user_menu` VALUES ('8186', '24', '1_1_1');
INSERT INTO `user_menu` VALUES ('8185', '24', '1_1_2');
INSERT INTO `user_menu` VALUES ('8184', '24', '1_1');
INSERT INTO `user_menu` VALUES ('8183', '24', '1');
INSERT INTO `user_menu` VALUES ('8201', '25', '1');
INSERT INTO `user_menu` VALUES ('8202', '25', '1_1');
INSERT INTO `user_menu` VALUES ('8203', '25', '1_1_2');
INSERT INTO `user_menu` VALUES ('8204', '25', '1_1_1');
INSERT INTO `user_menu` VALUES ('8205', '25', '2');
INSERT INTO `user_menu` VALUES ('8206', '25', '2_1');
INSERT INTO `user_menu` VALUES ('8207', '25', '2_1_1');
INSERT INTO `user_menu` VALUES ('8208', '25', '2_1_2');
INSERT INTO `user_menu` VALUES ('8209', '25', '2_1_3');
INSERT INTO `user_menu` VALUES ('8210', '25', '2_1_4');
INSERT INTO `user_menu` VALUES ('8211', '25', '6');
INSERT INTO `user_menu` VALUES ('8212', '25', '6_3');
INSERT INTO `user_menu` VALUES ('8213', '25', '6_3_1');
INSERT INTO `user_menu` VALUES ('8214', '25', '6_3_2');
INSERT INTO `user_menu` VALUES ('8215', '25', '8');
INSERT INTO `user_menu` VALUES ('8216', '25', '8_1');
INSERT INTO `user_menu` VALUES ('8217', '25', '8_1_1');
INSERT INTO `user_menu` VALUES ('8218', '25', '8_1_2');
INSERT INTO `user_menu` VALUES ('8272', '26', '8_1_2');
INSERT INTO `user_menu` VALUES ('8271', '26', '8_1_1');
INSERT INTO `user_menu` VALUES ('8270', '26', '8_1');
INSERT INTO `user_menu` VALUES ('8269', '26', '8');
INSERT INTO `user_menu` VALUES ('8268', '26', '6_3_2');
INSERT INTO `user_menu` VALUES ('8267', '26', '6_3_1');
INSERT INTO `user_menu` VALUES ('8266', '26', '6_3');
INSERT INTO `user_menu` VALUES ('8265', '26', '6');
INSERT INTO `user_menu` VALUES ('8264', '26', '2_1_4');
INSERT INTO `user_menu` VALUES ('8263', '26', '2_1_3');
INSERT INTO `user_menu` VALUES ('8262', '26', '2_1_2');
INSERT INTO `user_menu` VALUES ('8261', '26', '2_1_1');
INSERT INTO `user_menu` VALUES ('8260', '26', '2_1');
INSERT INTO `user_menu` VALUES ('8259', '26', '2');
INSERT INTO `user_menu` VALUES ('8258', '26', '1_1_1');
INSERT INTO `user_menu` VALUES ('8257', '26', '1_1_2');
INSERT INTO `user_menu` VALUES ('8256', '26', '1_1');
INSERT INTO `user_menu` VALUES ('8255', '26', '1');
INSERT INTO `user_menu` VALUES ('8237', '27', '1');
INSERT INTO `user_menu` VALUES ('8238', '27', '1_1');
INSERT INTO `user_menu` VALUES ('8239', '27', '1_1_2');
INSERT INTO `user_menu` VALUES ('8240', '27', '1_1_1');
INSERT INTO `user_menu` VALUES ('8241', '27', '2');
INSERT INTO `user_menu` VALUES ('8242', '27', '2_1');
INSERT INTO `user_menu` VALUES ('8243', '27', '2_1_1');
INSERT INTO `user_menu` VALUES ('8244', '27', '2_1_2');
INSERT INTO `user_menu` VALUES ('8245', '27', '2_1_3');
INSERT INTO `user_menu` VALUES ('8246', '27', '2_1_4');
INSERT INTO `user_menu` VALUES ('8247', '27', '6');
INSERT INTO `user_menu` VALUES ('8248', '27', '6_3');
INSERT INTO `user_menu` VALUES ('8249', '27', '6_3_1');
INSERT INTO `user_menu` VALUES ('8250', '27', '6_3_2');
INSERT INTO `user_menu` VALUES ('8251', '27', '8');
INSERT INTO `user_menu` VALUES ('8252', '27', '8_1');
INSERT INTO `user_menu` VALUES ('8253', '27', '8_1_1');
INSERT INTO `user_menu` VALUES ('8254', '27', '8_1_2');
INSERT INTO `user_menu` VALUES ('8273', '30', '1');
INSERT INTO `user_menu` VALUES ('8274', '30', '1_1');
INSERT INTO `user_menu` VALUES ('8275', '30', '1_1_2');
INSERT INTO `user_menu` VALUES ('8276', '30', '1_1_1');
INSERT INTO `user_menu` VALUES ('8277', '30', '2');
INSERT INTO `user_menu` VALUES ('8278', '30', '2_1');
INSERT INTO `user_menu` VALUES ('8279', '30', '2_1_1');
INSERT INTO `user_menu` VALUES ('8280', '30', '2_1_2');
INSERT INTO `user_menu` VALUES ('8281', '30', '2_1_3');
INSERT INTO `user_menu` VALUES ('8282', '30', '2_1_4');
INSERT INTO `user_menu` VALUES ('8283', '30', '6');
INSERT INTO `user_menu` VALUES ('8284', '30', '6_3');
INSERT INTO `user_menu` VALUES ('8285', '30', '6_3_1');
INSERT INTO `user_menu` VALUES ('8286', '30', '6_3_2');
INSERT INTO `user_menu` VALUES ('8287', '30', '8');
INSERT INTO `user_menu` VALUES ('8288', '30', '8_1');
INSERT INTO `user_menu` VALUES ('8289', '30', '8_1_1');
INSERT INTO `user_menu` VALUES ('8290', '30', '8_1_2');
INSERT INTO `user_menu` VALUES ('8291', '31', '1');
INSERT INTO `user_menu` VALUES ('8292', '31', '1_1');
INSERT INTO `user_menu` VALUES ('8293', '31', '1_1_2');
INSERT INTO `user_menu` VALUES ('8294', '31', '1_1_1');
INSERT INTO `user_menu` VALUES ('8295', '31', '2');
INSERT INTO `user_menu` VALUES ('8296', '31', '2_1');
INSERT INTO `user_menu` VALUES ('8297', '31', '2_1_1');
INSERT INTO `user_menu` VALUES ('8298', '31', '2_1_2');
INSERT INTO `user_menu` VALUES ('8299', '31', '2_1_3');
INSERT INTO `user_menu` VALUES ('8300', '31', '2_1_4');
INSERT INTO `user_menu` VALUES ('8301', '31', '6');
INSERT INTO `user_menu` VALUES ('8302', '31', '6_3');
INSERT INTO `user_menu` VALUES ('8303', '31', '6_3_1');
INSERT INTO `user_menu` VALUES ('8304', '31', '6_3_2');
INSERT INTO `user_menu` VALUES ('8305', '31', '8');
INSERT INTO `user_menu` VALUES ('8306', '31', '8_1');
INSERT INTO `user_menu` VALUES ('8307', '31', '8_1_1');
INSERT INTO `user_menu` VALUES ('8308', '31', '8_1_2');
INSERT INTO `user_menu` VALUES ('8309', '32', '1');
INSERT INTO `user_menu` VALUES ('8310', '32', '1_1');
INSERT INTO `user_menu` VALUES ('8311', '32', '1_1_2');
INSERT INTO `user_menu` VALUES ('8312', '32', '1_1_1');
INSERT INTO `user_menu` VALUES ('8313', '32', '2');
INSERT INTO `user_menu` VALUES ('8314', '32', '2_1');
INSERT INTO `user_menu` VALUES ('8315', '32', '2_1_1');
INSERT INTO `user_menu` VALUES ('8316', '32', '2_1_2');
INSERT INTO `user_menu` VALUES ('8317', '32', '2_1_3');
INSERT INTO `user_menu` VALUES ('8318', '32', '2_1_4');
INSERT INTO `user_menu` VALUES ('8319', '32', '6');
INSERT INTO `user_menu` VALUES ('8320', '32', '6_3');
INSERT INTO `user_menu` VALUES ('8321', '32', '6_3_1');
INSERT INTO `user_menu` VALUES ('8322', '32', '6_3_2');
INSERT INTO `user_menu` VALUES ('8323', '32', '8');
INSERT INTO `user_menu` VALUES ('8324', '32', '8_1');
INSERT INTO `user_menu` VALUES ('8325', '32', '8_1_1');
INSERT INTO `user_menu` VALUES ('8326', '32', '8_1_2');
INSERT INTO `user_menu` VALUES ('8327', '33', '1');
INSERT INTO `user_menu` VALUES ('8328', '33', '1_1');
INSERT INTO `user_menu` VALUES ('8329', '33', '1_1_2');
INSERT INTO `user_menu` VALUES ('8330', '33', '1_1_1');
INSERT INTO `user_menu` VALUES ('8331', '33', '2');
INSERT INTO `user_menu` VALUES ('8332', '33', '2_1');
INSERT INTO `user_menu` VALUES ('8333', '33', '2_1_1');
INSERT INTO `user_menu` VALUES ('8334', '33', '2_1_2');
INSERT INTO `user_menu` VALUES ('8335', '33', '2_1_3');
INSERT INTO `user_menu` VALUES ('8336', '33', '2_1_4');
INSERT INTO `user_menu` VALUES ('8337', '33', '2_2');
INSERT INTO `user_menu` VALUES ('8338', '33', '2_2_1');
INSERT INTO `user_menu` VALUES ('8339', '33', '2_2_2');
INSERT INTO `user_menu` VALUES ('8340', '33', '2_2_3');
INSERT INTO `user_menu` VALUES ('8341', '33', '8');
INSERT INTO `user_menu` VALUES ('8342', '33', '8_1');
INSERT INTO `user_menu` VALUES ('8343', '33', '8_1_1');
INSERT INTO `user_menu` VALUES ('8344', '33', '8_1_2');
INSERT INTO `user_menu` VALUES ('8345', '34', '1');
INSERT INTO `user_menu` VALUES ('8346', '34', '1_1');
INSERT INTO `user_menu` VALUES ('8347', '34', '1_1_2');
INSERT INTO `user_menu` VALUES ('8348', '34', '1_1_1');
INSERT INTO `user_menu` VALUES ('8349', '34', '2');
INSERT INTO `user_menu` VALUES ('8350', '34', '2_1');
INSERT INTO `user_menu` VALUES ('8351', '34', '2_1_1');
INSERT INTO `user_menu` VALUES ('8352', '34', '2_1_2');
INSERT INTO `user_menu` VALUES ('8353', '34', '2_1_3');
INSERT INTO `user_menu` VALUES ('8354', '34', '2_1_4');
INSERT INTO `user_menu` VALUES ('8355', '34', '2_2');
INSERT INTO `user_menu` VALUES ('8356', '34', '2_2_1');
INSERT INTO `user_menu` VALUES ('8357', '34', '2_2_2');
INSERT INTO `user_menu` VALUES ('8358', '34', '2_2_3');
INSERT INTO `user_menu` VALUES ('8359', '34', '8');
INSERT INTO `user_menu` VALUES ('8360', '34', '8_1');
INSERT INTO `user_menu` VALUES ('8361', '34', '8_1_1');
INSERT INTO `user_menu` VALUES ('8362', '34', '8_1_2');
INSERT INTO `user_menu` VALUES ('8363', '35', '1');
INSERT INTO `user_menu` VALUES ('8364', '35', '1_1');
INSERT INTO `user_menu` VALUES ('8365', '35', '1_1_2');
INSERT INTO `user_menu` VALUES ('8366', '35', '1_1_1');
INSERT INTO `user_menu` VALUES ('8367', '35', '2');
INSERT INTO `user_menu` VALUES ('8368', '35', '2_1');
INSERT INTO `user_menu` VALUES ('8369', '35', '2_1_1');
INSERT INTO `user_menu` VALUES ('8370', '35', '2_1_2');
INSERT INTO `user_menu` VALUES ('8371', '35', '2_1_3');
INSERT INTO `user_menu` VALUES ('8372', '35', '2_1_4');
INSERT INTO `user_menu` VALUES ('8373', '35', '6');
INSERT INTO `user_menu` VALUES ('8374', '35', '6_3');
INSERT INTO `user_menu` VALUES ('8375', '35', '6_3_1');
INSERT INTO `user_menu` VALUES ('8376', '35', '6_3_2');
INSERT INTO `user_menu` VALUES ('8377', '35', '8');
INSERT INTO `user_menu` VALUES ('8378', '35', '8_1');
INSERT INTO `user_menu` VALUES ('8379', '35', '8_1_1');
INSERT INTO `user_menu` VALUES ('8380', '35', '8_1_2');
INSERT INTO `user_menu` VALUES ('8381', '36', '1');
INSERT INTO `user_menu` VALUES ('8382', '36', '1_1');
INSERT INTO `user_menu` VALUES ('8383', '36', '1_1_2');
INSERT INTO `user_menu` VALUES ('8384', '36', '1_1_1');
INSERT INTO `user_menu` VALUES ('8385', '36', '2');
INSERT INTO `user_menu` VALUES ('8386', '36', '2_1');
INSERT INTO `user_menu` VALUES ('8387', '36', '2_1_1');
INSERT INTO `user_menu` VALUES ('8388', '36', '2_1_2');
INSERT INTO `user_menu` VALUES ('8389', '36', '2_1_3');
INSERT INTO `user_menu` VALUES ('8390', '36', '2_1_4');
INSERT INTO `user_menu` VALUES ('8391', '36', '2_4');
INSERT INTO `user_menu` VALUES ('8392', '36', '2_4_1');
INSERT INTO `user_menu` VALUES ('8393', '36', '2_4_2');
INSERT INTO `user_menu` VALUES ('8394', '36', '2_4_3');
INSERT INTO `user_menu` VALUES ('8395', '36', '2_7');
INSERT INTO `user_menu` VALUES ('8396', '36', '2_7_1');
INSERT INTO `user_menu` VALUES ('8397', '36', '7');
INSERT INTO `user_menu` VALUES ('8398', '36', '7_1');
INSERT INTO `user_menu` VALUES ('8399', '36', '7_1_1');
INSERT INTO `user_menu` VALUES ('8400', '36', '7_1_2');
INSERT INTO `user_menu` VALUES ('8401', '36', '8');
INSERT INTO `user_menu` VALUES ('8402', '36', '8_1');
INSERT INTO `user_menu` VALUES ('8403', '36', '8_1_1');
INSERT INTO `user_menu` VALUES ('8404', '36', '8_1_2');
INSERT INTO `user_menu` VALUES ('8405', '37', '1');
INSERT INTO `user_menu` VALUES ('8406', '37', '1_1');
INSERT INTO `user_menu` VALUES ('8407', '37', '1_1_2');
INSERT INTO `user_menu` VALUES ('8408', '37', '1_1_1');
INSERT INTO `user_menu` VALUES ('8409', '37', '2');
INSERT INTO `user_menu` VALUES ('8410', '37', '2_1');
INSERT INTO `user_menu` VALUES ('8411', '37', '2_1_1');
INSERT INTO `user_menu` VALUES ('8412', '37', '2_1_2');
INSERT INTO `user_menu` VALUES ('8413', '37', '2_1_3');
INSERT INTO `user_menu` VALUES ('8414', '37', '2_1_4');
INSERT INTO `user_menu` VALUES ('8415', '37', '6');
INSERT INTO `user_menu` VALUES ('8416', '37', '6_3');
INSERT INTO `user_menu` VALUES ('8417', '37', '6_3_1');
INSERT INTO `user_menu` VALUES ('8418', '37', '6_3_2');
INSERT INTO `user_menu` VALUES ('8419', '37', '8');
INSERT INTO `user_menu` VALUES ('8420', '37', '8_1');
INSERT INTO `user_menu` VALUES ('8421', '37', '8_1_1');
INSERT INTO `user_menu` VALUES ('8422', '37', '8_1_2');
INSERT INTO `user_menu` VALUES ('8423', '38', '1');
INSERT INTO `user_menu` VALUES ('8424', '38', '1_1');
INSERT INTO `user_menu` VALUES ('8425', '38', '1_1_2');
INSERT INTO `user_menu` VALUES ('8426', '38', '1_1_1');
INSERT INTO `user_menu` VALUES ('8427', '38', '2');
INSERT INTO `user_menu` VALUES ('8428', '38', '2_1');
INSERT INTO `user_menu` VALUES ('8429', '38', '2_1_1');
INSERT INTO `user_menu` VALUES ('8430', '38', '2_1_2');
INSERT INTO `user_menu` VALUES ('8431', '38', '2_1_3');
INSERT INTO `user_menu` VALUES ('8432', '38', '2_1_4');
INSERT INTO `user_menu` VALUES ('8433', '38', '6');
INSERT INTO `user_menu` VALUES ('8434', '38', '6_3');
INSERT INTO `user_menu` VALUES ('8435', '38', '6_3_1');
INSERT INTO `user_menu` VALUES ('8436', '38', '6_3_2');
INSERT INTO `user_menu` VALUES ('8437', '38', '8');
INSERT INTO `user_menu` VALUES ('8438', '38', '8_1');
INSERT INTO `user_menu` VALUES ('8439', '38', '8_1_1');
INSERT INTO `user_menu` VALUES ('8440', '38', '8_1_2');
INSERT INTO `user_menu` VALUES ('8441', '39', '1');
INSERT INTO `user_menu` VALUES ('8442', '39', '1_1');
INSERT INTO `user_menu` VALUES ('8443', '39', '1_1_2');
INSERT INTO `user_menu` VALUES ('8444', '39', '1_1_1');
INSERT INTO `user_menu` VALUES ('8445', '39', '2');
INSERT INTO `user_menu` VALUES ('8446', '39', '2_1');
INSERT INTO `user_menu` VALUES ('8447', '39', '2_1_1');
INSERT INTO `user_menu` VALUES ('8448', '39', '2_1_2');
INSERT INTO `user_menu` VALUES ('8449', '39', '2_1_3');
INSERT INTO `user_menu` VALUES ('8450', '39', '2_1_4');
INSERT INTO `user_menu` VALUES ('8451', '39', '6');
INSERT INTO `user_menu` VALUES ('8452', '39', '6_3');
INSERT INTO `user_menu` VALUES ('8453', '39', '6_3_1');
INSERT INTO `user_menu` VALUES ('8454', '39', '6_3_2');
INSERT INTO `user_menu` VALUES ('8455', '39', '8');
INSERT INTO `user_menu` VALUES ('8456', '39', '8_1');
INSERT INTO `user_menu` VALUES ('8457', '39', '8_1_1');
INSERT INTO `user_menu` VALUES ('8458', '39', '8_1_2');
INSERT INTO `user_menu` VALUES ('8459', '40', '1');
INSERT INTO `user_menu` VALUES ('8460', '40', '1_1');
INSERT INTO `user_menu` VALUES ('8461', '40', '1_1_2');
INSERT INTO `user_menu` VALUES ('8462', '40', '1_1_1');
INSERT INTO `user_menu` VALUES ('8463', '40', '2');
INSERT INTO `user_menu` VALUES ('8464', '40', '2_1');
INSERT INTO `user_menu` VALUES ('8465', '40', '2_1_1');
INSERT INTO `user_menu` VALUES ('8466', '40', '2_1_2');
INSERT INTO `user_menu` VALUES ('8467', '40', '2_1_3');
INSERT INTO `user_menu` VALUES ('8468', '40', '2_1_4');
INSERT INTO `user_menu` VALUES ('8469', '40', '6');
INSERT INTO `user_menu` VALUES ('8470', '40', '6_3');
INSERT INTO `user_menu` VALUES ('8471', '40', '6_3_1');
INSERT INTO `user_menu` VALUES ('8472', '40', '6_3_2');
INSERT INTO `user_menu` VALUES ('8473', '40', '8');
INSERT INTO `user_menu` VALUES ('8474', '40', '8_1');
INSERT INTO `user_menu` VALUES ('8475', '40', '8_1_1');
INSERT INTO `user_menu` VALUES ('8476', '40', '8_1_2');
INSERT INTO `user_menu` VALUES ('8477', '41', '1');
INSERT INTO `user_menu` VALUES ('8478', '41', '1_1');
INSERT INTO `user_menu` VALUES ('8479', '41', '1_1_2');
INSERT INTO `user_menu` VALUES ('8480', '41', '1_1_1');
INSERT INTO `user_menu` VALUES ('8481', '41', '2');
INSERT INTO `user_menu` VALUES ('8482', '41', '2_1');
INSERT INTO `user_menu` VALUES ('8483', '41', '2_1_1');
INSERT INTO `user_menu` VALUES ('8484', '41', '2_1_2');
INSERT INTO `user_menu` VALUES ('8485', '41', '2_1_3');
INSERT INTO `user_menu` VALUES ('8486', '41', '2_1_4');
INSERT INTO `user_menu` VALUES ('8487', '41', '6');
INSERT INTO `user_menu` VALUES ('8488', '41', '6_3');
INSERT INTO `user_menu` VALUES ('8489', '41', '6_3_1');
INSERT INTO `user_menu` VALUES ('8490', '41', '6_3_2');
INSERT INTO `user_menu` VALUES ('8491', '41', '8');
INSERT INTO `user_menu` VALUES ('8492', '41', '8_1');
INSERT INTO `user_menu` VALUES ('8493', '41', '8_1_1');
INSERT INTO `user_menu` VALUES ('8494', '41', '8_1_2');
INSERT INTO `user_menu` VALUES ('8495', '42', '1');
INSERT INTO `user_menu` VALUES ('8496', '42', '1_1');
INSERT INTO `user_menu` VALUES ('8497', '42', '1_1_2');
INSERT INTO `user_menu` VALUES ('8498', '42', '1_1_1');
INSERT INTO `user_menu` VALUES ('8499', '42', '2');
INSERT INTO `user_menu` VALUES ('8500', '42', '2_1');
INSERT INTO `user_menu` VALUES ('8501', '42', '2_1_1');
INSERT INTO `user_menu` VALUES ('8502', '42', '2_1_2');
INSERT INTO `user_menu` VALUES ('8503', '42', '2_1_3');
INSERT INTO `user_menu` VALUES ('8504', '42', '2_1_4');
INSERT INTO `user_menu` VALUES ('8505', '42', '2_2');
INSERT INTO `user_menu` VALUES ('8506', '42', '2_2_1');
INSERT INTO `user_menu` VALUES ('8507', '42', '2_2_2');
INSERT INTO `user_menu` VALUES ('8508', '42', '2_2_3');
INSERT INTO `user_menu` VALUES ('8509', '42', '8');
INSERT INTO `user_menu` VALUES ('8510', '42', '8_1');
INSERT INTO `user_menu` VALUES ('8511', '42', '8_1_1');
INSERT INTO `user_menu` VALUES ('8512', '42', '8_1_2');
INSERT INTO `user_menu` VALUES ('8513', '43', '1');
INSERT INTO `user_menu` VALUES ('8514', '43', '1_1');
INSERT INTO `user_menu` VALUES ('8515', '43', '1_1_2');
INSERT INTO `user_menu` VALUES ('8516', '43', '1_1_1');
INSERT INTO `user_menu` VALUES ('8517', '43', '2');
INSERT INTO `user_menu` VALUES ('8518', '43', '2_1');
INSERT INTO `user_menu` VALUES ('8519', '43', '2_1_1');
INSERT INTO `user_menu` VALUES ('8520', '43', '2_1_2');
INSERT INTO `user_menu` VALUES ('8521', '43', '2_1_3');
INSERT INTO `user_menu` VALUES ('8522', '43', '2_1_4');
INSERT INTO `user_menu` VALUES ('8523', '43', '6');
INSERT INTO `user_menu` VALUES ('8524', '43', '6_3');
INSERT INTO `user_menu` VALUES ('8525', '43', '6_3_1');
INSERT INTO `user_menu` VALUES ('8526', '43', '6_3_2');
INSERT INTO `user_menu` VALUES ('8527', '43', '8');
INSERT INTO `user_menu` VALUES ('8528', '43', '8_1');
INSERT INTO `user_menu` VALUES ('8529', '43', '8_1_1');
INSERT INTO `user_menu` VALUES ('8530', '43', '8_1_2');
INSERT INTO `user_menu` VALUES ('8531', '44', '1');
INSERT INTO `user_menu` VALUES ('8532', '44', '1_1');
INSERT INTO `user_menu` VALUES ('8533', '44', '1_1_2');
INSERT INTO `user_menu` VALUES ('8534', '44', '1_1_1');
INSERT INTO `user_menu` VALUES ('8535', '44', '2');
INSERT INTO `user_menu` VALUES ('8536', '44', '2_1');
INSERT INTO `user_menu` VALUES ('8537', '44', '2_1_1');
INSERT INTO `user_menu` VALUES ('8538', '44', '2_1_2');
INSERT INTO `user_menu` VALUES ('8539', '44', '2_1_3');
INSERT INTO `user_menu` VALUES ('8540', '44', '2_1_4');
INSERT INTO `user_menu` VALUES ('8541', '44', '6');
INSERT INTO `user_menu` VALUES ('8542', '44', '6_3');
INSERT INTO `user_menu` VALUES ('8543', '44', '6_3_1');
INSERT INTO `user_menu` VALUES ('8544', '44', '6_3_2');
INSERT INTO `user_menu` VALUES ('8545', '44', '8');
INSERT INTO `user_menu` VALUES ('8546', '44', '8_1');
INSERT INTO `user_menu` VALUES ('8547', '44', '8_1_1');
INSERT INTO `user_menu` VALUES ('8548', '44', '8_1_2');
INSERT INTO `user_menu` VALUES ('8549', '45', '1');
INSERT INTO `user_menu` VALUES ('8550', '45', '1_1');
INSERT INTO `user_menu` VALUES ('8551', '45', '1_1_2');
INSERT INTO `user_menu` VALUES ('8552', '45', '1_1_1');
INSERT INTO `user_menu` VALUES ('8553', '45', '2');
INSERT INTO `user_menu` VALUES ('8554', '45', '2_1');
INSERT INTO `user_menu` VALUES ('8555', '45', '2_1_1');
INSERT INTO `user_menu` VALUES ('8556', '45', '2_1_2');
INSERT INTO `user_menu` VALUES ('8557', '45', '2_1_3');
INSERT INTO `user_menu` VALUES ('8558', '45', '2_1_4');
INSERT INTO `user_menu` VALUES ('8559', '45', '6');
INSERT INTO `user_menu` VALUES ('8560', '45', '6_3');
INSERT INTO `user_menu` VALUES ('8561', '45', '6_3_1');
INSERT INTO `user_menu` VALUES ('8562', '45', '6_3_2');
INSERT INTO `user_menu` VALUES ('8563', '45', '8');
INSERT INTO `user_menu` VALUES ('8564', '45', '8_1');
INSERT INTO `user_menu` VALUES ('8565', '45', '8_1_1');
INSERT INTO `user_menu` VALUES ('8566', '45', '8_1_2');
INSERT INTO `user_menu` VALUES ('8567', '46', '1');
INSERT INTO `user_menu` VALUES ('8568', '46', '1_1');
INSERT INTO `user_menu` VALUES ('8569', '46', '1_1_2');
INSERT INTO `user_menu` VALUES ('8570', '46', '1_1_1');
INSERT INTO `user_menu` VALUES ('8571', '46', '2');
INSERT INTO `user_menu` VALUES ('8572', '46', '2_1');
INSERT INTO `user_menu` VALUES ('8573', '46', '2_1_1');
INSERT INTO `user_menu` VALUES ('8574', '46', '2_1_2');
INSERT INTO `user_menu` VALUES ('8575', '46', '2_1_3');
INSERT INTO `user_menu` VALUES ('8576', '46', '2_1_4');
INSERT INTO `user_menu` VALUES ('8577', '46', '2_2');
INSERT INTO `user_menu` VALUES ('8578', '46', '2_2_1');
INSERT INTO `user_menu` VALUES ('8579', '46', '2_2_2');
INSERT INTO `user_menu` VALUES ('8580', '46', '2_2_3');
INSERT INTO `user_menu` VALUES ('8581', '46', '8');
INSERT INTO `user_menu` VALUES ('8582', '46', '8_1');
INSERT INTO `user_menu` VALUES ('8583', '46', '8_1_1');
INSERT INTO `user_menu` VALUES ('8584', '46', '8_1_2');
INSERT INTO `user_menu` VALUES ('8734', '1', '8_1_3');
INSERT INTO `user_menu` VALUES ('8735', '1', '8_2');
INSERT INTO `user_menu` VALUES ('8736', '1', '8_2_3');
INSERT INTO `user_menu` VALUES ('8737', '1', '8_2_4');
INSERT INTO `user_menu` VALUES ('8738', '1', '8_2_1');
INSERT INTO `user_menu` VALUES ('8739', '1', '8_2_2');
INSERT INTO `user_menu` VALUES ('8740', '47', '1');
INSERT INTO `user_menu` VALUES ('8741', '47', '1_1');
INSERT INTO `user_menu` VALUES ('8742', '47', '1_1_2');
INSERT INTO `user_menu` VALUES ('8743', '47', '1_1_1');
INSERT INTO `user_menu` VALUES ('8744', '47', '2');
INSERT INTO `user_menu` VALUES ('8745', '47', '2_1');
INSERT INTO `user_menu` VALUES ('8746', '47', '2_1_1');
INSERT INTO `user_menu` VALUES ('8747', '47', '2_1_2');
INSERT INTO `user_menu` VALUES ('8748', '47', '2_1_3');
INSERT INTO `user_menu` VALUES ('8749', '47', '2_1_4');
INSERT INTO `user_menu` VALUES ('8750', '47', '6');
INSERT INTO `user_menu` VALUES ('8751', '47', '6_3');
INSERT INTO `user_menu` VALUES ('8752', '47', '6_3_1');
INSERT INTO `user_menu` VALUES ('8753', '47', '6_3_2');
INSERT INTO `user_menu` VALUES ('8754', '47', '8');
INSERT INTO `user_menu` VALUES ('8755', '47', '8_1');
INSERT INTO `user_menu` VALUES ('8756', '47', '8_1_1');
INSERT INTO `user_menu` VALUES ('8757', '47', '8_1_2');
INSERT INTO `user_menu` VALUES ('8758', '48', '1');
INSERT INTO `user_menu` VALUES ('8759', '48', '1_1');
INSERT INTO `user_menu` VALUES ('8760', '48', '1_1_2');
INSERT INTO `user_menu` VALUES ('8761', '48', '1_1_1');
INSERT INTO `user_menu` VALUES ('8762', '48', '2');
INSERT INTO `user_menu` VALUES ('8763', '48', '2_1');
INSERT INTO `user_menu` VALUES ('8764', '48', '2_1_1');
INSERT INTO `user_menu` VALUES ('8765', '48', '2_1_2');
INSERT INTO `user_menu` VALUES ('8766', '48', '2_1_3');
INSERT INTO `user_menu` VALUES ('8767', '48', '2_1_4');
INSERT INTO `user_menu` VALUES ('8768', '48', '6');
INSERT INTO `user_menu` VALUES ('8769', '48', '6_3');
INSERT INTO `user_menu` VALUES ('8770', '48', '6_3_1');
INSERT INTO `user_menu` VALUES ('8771', '48', '6_3_2');
INSERT INTO `user_menu` VALUES ('8772', '48', '8');
INSERT INTO `user_menu` VALUES ('8773', '48', '8_1');
INSERT INTO `user_menu` VALUES ('8774', '48', '8_1_1');
INSERT INTO `user_menu` VALUES ('8775', '48', '8_1_2');
INSERT INTO `user_menu` VALUES ('8776', '49', '1');
INSERT INTO `user_menu` VALUES ('8777', '49', '1_1');
INSERT INTO `user_menu` VALUES ('8778', '49', '1_1_2');
INSERT INTO `user_menu` VALUES ('8779', '49', '1_1_1');
INSERT INTO `user_menu` VALUES ('8780', '49', '2');
INSERT INTO `user_menu` VALUES ('8781', '49', '2_1');
INSERT INTO `user_menu` VALUES ('8782', '49', '2_1_1');
INSERT INTO `user_menu` VALUES ('8783', '49', '2_1_2');
INSERT INTO `user_menu` VALUES ('8784', '49', '2_1_3');
INSERT INTO `user_menu` VALUES ('8785', '49', '2_1_4');
INSERT INTO `user_menu` VALUES ('8786', '49', '6');
INSERT INTO `user_menu` VALUES ('8787', '49', '6_3');
INSERT INTO `user_menu` VALUES ('8788', '49', '6_3_1');
INSERT INTO `user_menu` VALUES ('8789', '49', '6_3_2');
INSERT INTO `user_menu` VALUES ('8790', '49', '8');
INSERT INTO `user_menu` VALUES ('8791', '49', '8_1');
INSERT INTO `user_menu` VALUES ('8792', '49', '8_1_1');
INSERT INTO `user_menu` VALUES ('8793', '49', '8_1_2');
INSERT INTO `user_menu` VALUES ('8794', '50', '1');
INSERT INTO `user_menu` VALUES ('8795', '50', '1_1');
INSERT INTO `user_menu` VALUES ('8796', '50', '1_1_2');
INSERT INTO `user_menu` VALUES ('8797', '50', '1_1_1');
INSERT INTO `user_menu` VALUES ('8798', '50', '2');
INSERT INTO `user_menu` VALUES ('8799', '50', '2_1');
INSERT INTO `user_menu` VALUES ('8800', '50', '2_1_1');
INSERT INTO `user_menu` VALUES ('8801', '50', '2_1_2');
INSERT INTO `user_menu` VALUES ('8802', '50', '2_1_3');
INSERT INTO `user_menu` VALUES ('8803', '50', '2_1_4');
INSERT INTO `user_menu` VALUES ('8804', '50', '6');
INSERT INTO `user_menu` VALUES ('8805', '50', '6_3');
INSERT INTO `user_menu` VALUES ('8806', '50', '6_3_1');
INSERT INTO `user_menu` VALUES ('8807', '50', '6_3_2');
INSERT INTO `user_menu` VALUES ('8808', '50', '8');
INSERT INTO `user_menu` VALUES ('8809', '50', '8_1');
INSERT INTO `user_menu` VALUES ('8810', '50', '8_1_1');
INSERT INTO `user_menu` VALUES ('8811', '50', '8_1_2');
INSERT INTO `user_menu` VALUES ('8812', '51', '1');
INSERT INTO `user_menu` VALUES ('8813', '51', '1_1');
INSERT INTO `user_menu` VALUES ('8814', '51', '1_1_2');
INSERT INTO `user_menu` VALUES ('8815', '51', '1_1_1');
INSERT INTO `user_menu` VALUES ('8816', '51', '2');
INSERT INTO `user_menu` VALUES ('8817', '51', '2_1');
INSERT INTO `user_menu` VALUES ('8818', '51', '2_1_1');
INSERT INTO `user_menu` VALUES ('8819', '51', '2_1_2');
INSERT INTO `user_menu` VALUES ('8820', '51', '2_1_3');
INSERT INTO `user_menu` VALUES ('8821', '51', '2_1_4');
INSERT INTO `user_menu` VALUES ('8822', '51', '6');
INSERT INTO `user_menu` VALUES ('8823', '51', '6_3');
INSERT INTO `user_menu` VALUES ('8824', '51', '6_3_1');
INSERT INTO `user_menu` VALUES ('8825', '51', '6_3_2');
INSERT INTO `user_menu` VALUES ('8826', '51', '8');
INSERT INTO `user_menu` VALUES ('8827', '51', '8_1');
INSERT INTO `user_menu` VALUES ('8828', '51', '8_1_1');
INSERT INTO `user_menu` VALUES ('8829', '51', '8_1_2');
INSERT INTO `user_menu` VALUES ('8830', '52', '1');
INSERT INTO `user_menu` VALUES ('8831', '52', '1_1');
INSERT INTO `user_menu` VALUES ('8832', '52', '1_1_2');
INSERT INTO `user_menu` VALUES ('8833', '52', '1_1_1');
INSERT INTO `user_menu` VALUES ('8834', '52', '2');
INSERT INTO `user_menu` VALUES ('8835', '52', '2_1');
INSERT INTO `user_menu` VALUES ('8836', '52', '2_1_1');
INSERT INTO `user_menu` VALUES ('8837', '52', '2_1_2');
INSERT INTO `user_menu` VALUES ('8838', '52', '2_1_3');
INSERT INTO `user_menu` VALUES ('8839', '52', '2_1_4');
INSERT INTO `user_menu` VALUES ('8840', '52', '2_2');
INSERT INTO `user_menu` VALUES ('8841', '52', '2_2_1');
INSERT INTO `user_menu` VALUES ('8842', '52', '2_2_2');
INSERT INTO `user_menu` VALUES ('8843', '52', '2_2_3');
INSERT INTO `user_menu` VALUES ('8844', '52', '8');
INSERT INTO `user_menu` VALUES ('8845', '52', '8_1');
INSERT INTO `user_menu` VALUES ('8846', '52', '8_1_1');
INSERT INTO `user_menu` VALUES ('8847', '52', '8_1_2');
INSERT INTO `user_menu` VALUES ('8848', '53', '1');
INSERT INTO `user_menu` VALUES ('8849', '53', '1_1');
INSERT INTO `user_menu` VALUES ('8850', '53', '1_1_2');
INSERT INTO `user_menu` VALUES ('8851', '53', '1_1_1');
INSERT INTO `user_menu` VALUES ('8852', '53', '2');
INSERT INTO `user_menu` VALUES ('8853', '53', '2_1');
INSERT INTO `user_menu` VALUES ('8854', '53', '2_1_1');
INSERT INTO `user_menu` VALUES ('8855', '53', '2_1_2');
INSERT INTO `user_menu` VALUES ('8856', '53', '2_1_3');
INSERT INTO `user_menu` VALUES ('8857', '53', '2_1_4');
INSERT INTO `user_menu` VALUES ('8858', '53', '6');
INSERT INTO `user_menu` VALUES ('8859', '53', '6_3');
INSERT INTO `user_menu` VALUES ('8860', '53', '6_3_1');
INSERT INTO `user_menu` VALUES ('8861', '53', '6_3_2');
INSERT INTO `user_menu` VALUES ('8862', '53', '8');
INSERT INTO `user_menu` VALUES ('8863', '53', '8_1');
INSERT INTO `user_menu` VALUES ('8864', '53', '8_1_1');
INSERT INTO `user_menu` VALUES ('8865', '53', '8_1_2');
INSERT INTO `user_menu` VALUES ('8866', '54', '1');
INSERT INTO `user_menu` VALUES ('8867', '54', '1_1');
INSERT INTO `user_menu` VALUES ('8868', '54', '1_1_2');
INSERT INTO `user_menu` VALUES ('8869', '54', '1_1_1');
INSERT INTO `user_menu` VALUES ('8870', '54', '2');
INSERT INTO `user_menu` VALUES ('8871', '54', '2_1');
INSERT INTO `user_menu` VALUES ('8872', '54', '2_1_1');
INSERT INTO `user_menu` VALUES ('8873', '54', '2_1_2');
INSERT INTO `user_menu` VALUES ('8874', '54', '2_1_3');
INSERT INTO `user_menu` VALUES ('8875', '54', '2_1_4');
INSERT INTO `user_menu` VALUES ('8876', '54', '6');
INSERT INTO `user_menu` VALUES ('8877', '54', '6_3');
INSERT INTO `user_menu` VALUES ('8878', '54', '6_3_1');
INSERT INTO `user_menu` VALUES ('8879', '54', '6_3_2');
INSERT INTO `user_menu` VALUES ('8880', '54', '8');
INSERT INTO `user_menu` VALUES ('8881', '54', '8_1');
INSERT INTO `user_menu` VALUES ('8882', '54', '8_1_1');
INSERT INTO `user_menu` VALUES ('8883', '54', '8_1_2');
INSERT INTO `user_menu` VALUES ('8884', '55', '1');
INSERT INTO `user_menu` VALUES ('8885', '55', '1_1');
INSERT INTO `user_menu` VALUES ('8886', '55', '1_1_2');
INSERT INTO `user_menu` VALUES ('8887', '55', '1_1_1');
INSERT INTO `user_menu` VALUES ('8888', '55', '2');
INSERT INTO `user_menu` VALUES ('8889', '55', '2_1');
INSERT INTO `user_menu` VALUES ('8890', '55', '2_1_1');
INSERT INTO `user_menu` VALUES ('8891', '55', '2_1_2');
INSERT INTO `user_menu` VALUES ('8892', '55', '2_1_3');
INSERT INTO `user_menu` VALUES ('8893', '55', '2_1_4');
INSERT INTO `user_menu` VALUES ('8894', '55', '6');
INSERT INTO `user_menu` VALUES ('8895', '55', '6_3');
INSERT INTO `user_menu` VALUES ('8896', '55', '6_3_1');
INSERT INTO `user_menu` VALUES ('8897', '55', '6_3_2');
INSERT INTO `user_menu` VALUES ('8898', '55', '8');
INSERT INTO `user_menu` VALUES ('8899', '55', '8_1');
INSERT INTO `user_menu` VALUES ('8900', '55', '8_1_1');
INSERT INTO `user_menu` VALUES ('8901', '55', '8_1_2');
INSERT INTO `user_menu` VALUES ('8902', '56', '1');
INSERT INTO `user_menu` VALUES ('8903', '56', '1_1');
INSERT INTO `user_menu` VALUES ('8904', '56', '1_1_2');
INSERT INTO `user_menu` VALUES ('8905', '56', '1_1_1');
INSERT INTO `user_menu` VALUES ('8906', '56', '2');
INSERT INTO `user_menu` VALUES ('8907', '56', '2_1');
INSERT INTO `user_menu` VALUES ('8908', '56', '2_1_1');
INSERT INTO `user_menu` VALUES ('8909', '56', '2_1_2');
INSERT INTO `user_menu` VALUES ('8910', '56', '2_1_3');
INSERT INTO `user_menu` VALUES ('8911', '56', '2_1_4');
INSERT INTO `user_menu` VALUES ('8912', '56', '6');
INSERT INTO `user_menu` VALUES ('8913', '56', '6_3');
INSERT INTO `user_menu` VALUES ('8914', '56', '6_3_1');
INSERT INTO `user_menu` VALUES ('8915', '56', '6_3_2');
INSERT INTO `user_menu` VALUES ('8916', '56', '8');
INSERT INTO `user_menu` VALUES ('8917', '56', '8_1');
INSERT INTO `user_menu` VALUES ('8918', '56', '8_1_1');
INSERT INTO `user_menu` VALUES ('8919', '56', '8_1_2');
INSERT INTO `user_menu` VALUES ('8920', '57', '1');
INSERT INTO `user_menu` VALUES ('8921', '57', '1_1');
INSERT INTO `user_menu` VALUES ('8922', '57', '1_1_2');
INSERT INTO `user_menu` VALUES ('8923', '57', '1_1_1');
INSERT INTO `user_menu` VALUES ('8924', '57', '2');
INSERT INTO `user_menu` VALUES ('8925', '57', '2_1');
INSERT INTO `user_menu` VALUES ('8926', '57', '2_1_1');
INSERT INTO `user_menu` VALUES ('8927', '57', '2_1_2');
INSERT INTO `user_menu` VALUES ('8928', '57', '2_1_3');
INSERT INTO `user_menu` VALUES ('8929', '57', '2_1_4');
INSERT INTO `user_menu` VALUES ('8930', '57', '2_2');
INSERT INTO `user_menu` VALUES ('8931', '57', '2_2_1');
INSERT INTO `user_menu` VALUES ('8932', '57', '2_2_2');
INSERT INTO `user_menu` VALUES ('8933', '57', '2_2_3');
INSERT INTO `user_menu` VALUES ('8934', '57', '8');
INSERT INTO `user_menu` VALUES ('8935', '57', '8_1');
INSERT INTO `user_menu` VALUES ('8936', '57', '8_1_1');
INSERT INTO `user_menu` VALUES ('8937', '57', '8_1_2');
INSERT INTO `user_menu` VALUES ('8991', '11', '8_1_1');
INSERT INTO `user_menu` VALUES ('8992', '11', '8_1_2');
INSERT INTO `user_menu` VALUES ('9584', '18', '2_8');
INSERT INTO `user_menu` VALUES ('9583', '18', '2');
INSERT INTO `user_menu` VALUES ('9582', '18', '1_1_1');
INSERT INTO `user_menu` VALUES ('9581', '18', '1_1_2');
INSERT INTO `user_menu` VALUES ('9579', '18', '1');
INSERT INTO `user_menu` VALUES ('9580', '18', '1_1');
INSERT INTO `user_menu` VALUES ('9480', '120', '8_1_2');
INSERT INTO `user_menu` VALUES ('9479', '120', '8_1_1');
INSERT INTO `user_menu` VALUES ('9478', '120', '8_1');
INSERT INTO `user_menu` VALUES ('9477', '120', '8');
INSERT INTO `user_menu` VALUES ('9476', '120', '6_3_2');
INSERT INTO `user_menu` VALUES ('9475', '120', '6_3_1');
INSERT INTO `user_menu` VALUES ('9474', '120', '6_3');
INSERT INTO `user_menu` VALUES ('9473', '120', '6');
INSERT INTO `user_menu` VALUES ('9472', '120', '2_1_3');
INSERT INTO `user_menu` VALUES ('9471', '120', '2_1_2');
INSERT INTO `user_menu` VALUES ('9470', '120', '2_1_1');
INSERT INTO `user_menu` VALUES ('9469', '120', '2_1');
INSERT INTO `user_menu` VALUES ('9468', '120', '2');
INSERT INTO `user_menu` VALUES ('9467', '120', '1_1_1');
INSERT INTO `user_menu` VALUES ('9466', '120', '1_1_2');
INSERT INTO `user_menu` VALUES ('9465', '120', '1_1');
INSERT INTO `user_menu` VALUES ('9464', '120', '1');

-- ----------------------------
-- Table structure for `work_date_plan`
-- ----------------------------
DROP TABLE IF EXISTS `work_date_plan`;
CREATE TABLE `work_date_plan` (
  ` plan_time` datetime NOT NULL,
  `type` int(2) NOT NULL,
  PRIMARY KEY (` plan_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_date_plan
-- ----------------------------

-- ----------------------------
-- Table structure for `work_info`
-- ----------------------------
DROP TABLE IF EXISTS `work_info`;
CREATE TABLE `work_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `entry_id` int(11) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `audit_status` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_info
-- ----------------------------

-- ----------------------------
-- Table structure for `work_log`
-- ----------------------------
DROP TABLE IF EXISTS `work_log`;
CREATE TABLE `work_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `entry_id` int(11) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `type` int(2) NOT NULL,
  `audit_status` int(2) NOT NULL,
  `work_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_log
-- ----------------------------

-- ----------------------------
-- Table structure for `work_moth_count`
-- ----------------------------
DROP TABLE IF EXISTS `work_moth_count`;
CREATE TABLE `work_moth_count` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) NOT NULL,
  `start_time` date NOT NULL,
  `end_time` date NOT NULL,
  `quanqin_count` double NOT NULL,
  `gj_count` double NOT NULL,
  `tx_count` double NOT NULL,
  `bj_count` double NOT NULL,
  `sj_count` double NOT NULL,
  `wc_count` double NOT NULL,
  `ds_count` double NOT NULL,
  `jx_count` double NOT NULL,
  `queqin_count` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_moth_count
-- ----------------------------

-- ----------------------------
-- Table structure for `work_type`
-- ----------------------------
DROP TABLE IF EXISTS `work_type`;
CREATE TABLE `work_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_type
-- ----------------------------
INSERT INTO `work_type` VALUES ('1', '在岗');
INSERT INTO `work_type` VALUES ('2', '外出');
INSERT INTO `work_type` VALUES ('3', '值班');
INSERT INTO `work_type` VALUES ('4', '请假');
INSERT INTO `work_type` VALUES ('5', '缺勤');

-- ----------------------------
-- Table structure for `work_type_entry`
-- ----------------------------
DROP TABLE IF EXISTS `work_type_entry`;
CREATE TABLE `work_type_entry` (
  `id` int(11) NOT NULL,
  `work_type_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_type_entry
-- ----------------------------
