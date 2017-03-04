/*
Navicat MySQL Data Transfer

Source Server         : 本机MYSQL
Source Server Version : 50610
Source Host           : 127.0.0.1:3306
Source Database       : disease_control

Target Server Type    : MYSQL
Target Server Version : 50610
File Encoding         : 65001

Date: 2014-12-24 16:07:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for oa_times_model
-- ----------------------------
DROP TABLE IF EXISTS `oa_times_model`;
CREATE TABLE `oa_times_model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model_type` int(11) DEFAULT NULL COMMENT '模型类型值，该值含义与model_type_name相同，一个使用数字描述一个使用中文描述',
  `model_type_name` varchar(255) DEFAULT NULL COMMENT '模型名称：夏令、冬至等工作时间段',
  `model_name` varchar(255) DEFAULT NULL,
  `start_time` varchar(255) DEFAULT NULL,
  `end_time` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` varchar(255) DEFAULT NULL,
  `is_use` varchar(255) DEFAULT '0' COMMENT '是否为当前使用状态模型，0：否 1：是',
  `is_delete` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL COMMENT '将一天分为4段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_times_detail
-- ----------------------------
DROP TABLE IF EXISTS `oa_times_detail`;
CREATE TABLE `oa_times_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_seconds` int(11) DEFAULT NULL,
  `end_seconds` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `model_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `create_user` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_user` varchar(255) DEFAULT NULL,
  `is_delete` varchar(255) DEFAULT '0',
  `order_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8129 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `oa_sys_dict`;
CREATE TABLE `oa_sys_dict` (
  `code` varchar(255) DEFAULT NULL COMMENT '类型',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `is_delete` varchar(255) DEFAULT NULL COMMENT '是否删除',
  `ext_type` varchar(255) DEFAULT NULL COMMENT '扩展类型',
  `parent` int(11) DEFAULT NULL COMMENT '父级',
  `remark` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_onduty_team
-- ----------------------------
DROP TABLE IF EXISTS `oa_onduty_team`;
CREATE TABLE `oa_onduty_team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `onduty_staff1` int(11) DEFAULT NULL,
  `onduty_staff2` int(11) DEFAULT NULL,
  `onduty_staff_type` int(11) DEFAULT NULL COMMENT '1:领导值班(只填写onduty_staff1)，2:小组值班，3:总值班',
  `onduty_order` int(11) DEFAULT NULL,
  `is_delete` int(11) DEFAULT '0',
  `create_user` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_user` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_onduty_rule
-- ----------------------------
DROP TABLE IF EXISTS `oa_onduty_rule`;
CREATE TABLE `oa_onduty_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `end_time` datetime DEFAULT NULL COMMENT '结束日期（如果未填写，则表示无限循环）',
  `rule_type` varchar(10) DEFAULT NULL COMMENT '1:领导值班规则，2：小分队值班规则，3：总值班规则',
  `start_teamid` int(11) DEFAULT NULL,
  `start_team_orderno` int(11) DEFAULT NULL,
  `last_team_orderno` int(11) DEFAULT NULL,
  `is_Enable` int(11) DEFAULT '1' COMMENT '是否启用，1：启用，0：未启用',
  `is_Delete` int(11) DEFAULT '0' COMMENT '1:删除，0:未删除',
  `create_user` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_user` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_onduty_info
-- ----------------------------
DROP TABLE IF EXISTS `oa_onduty_info`;
CREATE TABLE `oa_onduty_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_info_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `on_duty_time` datetime DEFAULT NULL COMMENT '值班时间，时间格式：yyyy-MM-dd 格式',
  `dalance_status` varchar(7) DEFAULT NULL COMMENT '结算方式，1：待确认（弃用），2：调休，3:值班费',
  `remarks` varchar(500) DEFAULT NULL,
  `on_duty_type` varchar(7) DEFAULT NULL COMMENT '1:领导值班，2：小分队值班，3：总值班',
  `create_time` datetime DEFAULT NULL,
  `create_user` varchar(25) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` varchar(25) DEFAULT NULL,
  `is_delete` varchar(1) NOT NULL COMMENT '删除状态，0：否，1：是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_onduty_histroy
-- ----------------------------
DROP TABLE IF EXISTS `oa_onduty_histroy`;
CREATE TABLE `oa_onduty_histroy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `team_orderno` int(11) DEFAULT NULL COMMENT '值班组id',
  `onduty_type` int(11) DEFAULT NULL COMMENT '1:领导值班，2：小分队值班，3：总值班',
  `exec_time` datetime DEFAULT NULL COMMENT '设置值班的执行时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_notice_info
-- ----------------------------
DROP TABLE IF EXISTS `oa_notice_info`;
CREATE TABLE `oa_notice_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notice` varchar(500) DEFAULT NULL,
  `notice_content` blob,
  `publisher` varchar(25) DEFAULT NULL COMMENT '发送人编号',
  `keyword` varchar(500) DEFAULT NULL COMMENT '关键字',
  `read_count` int(11) DEFAULT NULL COMMENT '阅读次数',
  `department_id` int(11) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '发布日期',
  `top` varchar(7) DEFAULT NULL COMMENT '置顶，1：置顶，0：默认',
  `status` varchar(7) DEFAULT NULL COMMENT '发布状态，1：默认状态，\r\n2：草稿状态，3：删除状态\r\n',
  `orderby` int(11) DEFAULT NULL COMMENT '排序顺序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_notice_attachment
-- ----------------------------
DROP TABLE IF EXISTS `oa_notice_attachment`;
CREATE TABLE `oa_notice_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notice_id` int(11) DEFAULT NULL COMMENT '通知公告表id',
  `atachment_name` varchar(300) DEFAULT NULL,
  `atachment_path` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_notice_accept
-- ----------------------------
DROP TABLE IF EXISTS `oa_notice_accept`;
CREATE TABLE `oa_notice_accept` (
  `notice_id` int(11) NOT NULL,
  `accept_id` int(11) NOT NULL,
  `accept_obj` varchar(25) DEFAULT NULL COMMENT '接收人',
  PRIMARY KEY (`notice_id`,`accept_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_job_history
-- ----------------------------
DROP TABLE IF EXISTS `oa_job_history`;
CREATE TABLE `oa_job_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_type` varchar(255) DEFAULT NULL COMMENT '1:表示初始化工作人员的状态',
  `execute_time` datetime DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_day_settings
-- ----------------------------
DROP TABLE IF EXISTS `oa_day_settings`;
CREATE TABLE `oa_day_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day_time` datetime DEFAULT NULL COMMENT '工作日',
  `status` varchar(7) DEFAULT NULL COMMENT '日期状态，1：公休日，2：工作日，3：三薪日',
  `create_time` datetime DEFAULT NULL,
  `create_user` varchar(25) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` varchar(25) DEFAULT NULL,
  `is_delete` varchar(1) NOT NULL COMMENT '删除状态，0：否，1：是',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3000 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_attendance_info
-- ----------------------------
DROP TABLE IF EXISTS `oa_attendance_info`;
CREATE TABLE `oa_attendance_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '参考职工信息表(STAFF_INFO)ID',
  `staff_info_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `attendance_status` varchar(7) DEFAULT NULL COMMENT '考勤状态，1：在岗，2：外出，3：请假，4：缺勤,5：值班',
  `onduty_type` varchar(7) DEFAULT NULL COMMENT '1:领导值班，2:小分队值班，3：总值班',
  `balance_status` varchar(7) DEFAULT NULL COMMENT '结算方式，1：待确认（弃用），2：调休，3:值班费',
  `attendance_time` datetime DEFAULT NULL COMMENT '考勤日期，时间格式：yyyy-MM-dd格式',
  `times_detail_id` int(11) DEFAULT NULL COMMENT '时间段模型ID,参考时间段模型表ID',
  `remarks` varchar(500) DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `create_user` varchar(25) DEFAULT NULL,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_user` varchar(25) DEFAULT NULL,
  `is_delete` varchar(1) DEFAULT '0' COMMENT '删除状态，0：否，1：是',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8129 DEFAULT CHARSET=utf8;


ALTER TABLE department_info
ADD COLUMN `isKqsyShow` int(11),
ADD COLUMN `kqsyOrder` int(11);
