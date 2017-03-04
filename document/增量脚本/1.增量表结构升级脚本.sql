/*
Navicat MySQL Data Transfer

Source Server         : ����MYSQL
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
  `model_type` int(11) DEFAULT NULL COMMENT 'ģ������ֵ����ֵ������model_type_name��ͬ��һ��ʹ����������һ��ʹ����������',
  `model_type_name` varchar(255) DEFAULT NULL COMMENT 'ģ�����ƣ���������ȹ���ʱ���',
  `model_name` varchar(255) DEFAULT NULL,
  `start_time` varchar(255) DEFAULT NULL,
  `end_time` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` varchar(255) DEFAULT NULL,
  `is_use` varchar(255) DEFAULT '0' COMMENT '�Ƿ�Ϊ��ǰʹ��״̬ģ�ͣ�0���� 1����',
  `is_delete` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL COMMENT '��һ���Ϊ4��',
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
  `code` varchar(255) DEFAULT NULL COMMENT '����',
  `name` varchar(255) DEFAULT NULL COMMENT '����',
  `is_delete` varchar(255) DEFAULT NULL COMMENT '�Ƿ�ɾ��',
  `ext_type` varchar(255) DEFAULT NULL COMMENT '��չ����',
  `parent` int(11) DEFAULT NULL COMMENT '����',
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
  `onduty_staff_type` int(11) DEFAULT NULL COMMENT '1:�쵼ֵ��(ֻ��дonduty_staff1)��2:С��ֵ�࣬3:��ֵ��',
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
  `end_time` datetime DEFAULT NULL COMMENT '�������ڣ����δ��д�����ʾ����ѭ����',
  `rule_type` varchar(10) DEFAULT NULL COMMENT '1:�쵼ֵ�����2��С�ֶ�ֵ�����3����ֵ�����',
  `start_teamid` int(11) DEFAULT NULL,
  `start_team_orderno` int(11) DEFAULT NULL,
  `last_team_orderno` int(11) DEFAULT NULL,
  `is_Enable` int(11) DEFAULT '1' COMMENT '�Ƿ����ã�1�����ã�0��δ����',
  `is_Delete` int(11) DEFAULT '0' COMMENT '1:ɾ����0:δɾ��',
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
  `on_duty_time` datetime DEFAULT NULL COMMENT 'ֵ��ʱ�䣬ʱ���ʽ��yyyy-MM-dd ��ʽ',
  `dalance_status` varchar(7) DEFAULT NULL COMMENT '���㷽ʽ��1����ȷ�ϣ����ã���2�����ݣ�3:ֵ���',
  `remarks` varchar(500) DEFAULT NULL,
  `on_duty_type` varchar(7) DEFAULT NULL COMMENT '1:�쵼ֵ�࣬2��С�ֶ�ֵ�࣬3����ֵ��',
  `create_time` datetime DEFAULT NULL,
  `create_user` varchar(25) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` varchar(25) DEFAULT NULL,
  `is_delete` varchar(1) NOT NULL COMMENT 'ɾ��״̬��0����1����',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_onduty_histroy
-- ----------------------------
DROP TABLE IF EXISTS `oa_onduty_histroy`;
CREATE TABLE `oa_onduty_histroy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `team_orderno` int(11) DEFAULT NULL COMMENT 'ֵ����id',
  `onduty_type` int(11) DEFAULT NULL COMMENT '1:�쵼ֵ�࣬2��С�ֶ�ֵ�࣬3����ֵ��',
  `exec_time` datetime DEFAULT NULL COMMENT '����ֵ���ִ��ʱ��',
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
  `publisher` varchar(25) DEFAULT NULL COMMENT '�����˱��',
  `keyword` varchar(500) DEFAULT NULL COMMENT '�ؼ���',
  `read_count` int(11) DEFAULT NULL COMMENT '�Ķ�����',
  `department_id` int(11) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '��������',
  `top` varchar(7) DEFAULT NULL COMMENT '�ö���1���ö���0��Ĭ��',
  `status` varchar(7) DEFAULT NULL COMMENT '����״̬��1��Ĭ��״̬��\r\n2���ݸ�״̬��3��ɾ��״̬\r\n',
  `orderby` int(11) DEFAULT NULL COMMENT '����˳��',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_notice_attachment
-- ----------------------------
DROP TABLE IF EXISTS `oa_notice_attachment`;
CREATE TABLE `oa_notice_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notice_id` int(11) DEFAULT NULL COMMENT '֪ͨ�����id',
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
  `accept_obj` varchar(25) DEFAULT NULL COMMENT '������',
  PRIMARY KEY (`notice_id`,`accept_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_job_history
-- ----------------------------
DROP TABLE IF EXISTS `oa_job_history`;
CREATE TABLE `oa_job_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_type` varchar(255) DEFAULT NULL COMMENT '1:��ʾ��ʼ��������Ա��״̬',
  `execute_time` datetime DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL COMMENT '��ע',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_day_settings
-- ----------------------------
DROP TABLE IF EXISTS `oa_day_settings`;
CREATE TABLE `oa_day_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day_time` datetime DEFAULT NULL COMMENT '������',
  `status` varchar(7) DEFAULT NULL COMMENT '����״̬��1�������գ�2�������գ�3����н��',
  `create_time` datetime DEFAULT NULL,
  `create_user` varchar(25) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` varchar(25) DEFAULT NULL,
  `is_delete` varchar(1) NOT NULL COMMENT 'ɾ��״̬��0����1����',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3000 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_attendance_info
-- ----------------------------
DROP TABLE IF EXISTS `oa_attendance_info`;
CREATE TABLE `oa_attendance_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '�ο�ְ����Ϣ��(STAFF_INFO)ID',
  `staff_info_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `attendance_status` varchar(7) DEFAULT NULL COMMENT '����״̬��1���ڸڣ�2�������3����٣�4��ȱ��,5��ֵ��',
  `onduty_type` varchar(7) DEFAULT NULL COMMENT '1:�쵼ֵ�࣬2:С�ֶ�ֵ�࣬3����ֵ��',
  `balance_status` varchar(7) DEFAULT NULL COMMENT '���㷽ʽ��1����ȷ�ϣ����ã���2�����ݣ�3:ֵ���',
  `attendance_time` datetime DEFAULT NULL COMMENT '�������ڣ�ʱ���ʽ��yyyy-MM-dd��ʽ',
  `times_detail_id` int(11) DEFAULT NULL COMMENT 'ʱ���ģ��ID,�ο�ʱ���ģ�ͱ�ID',
  `remarks` varchar(500) DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `create_user` varchar(25) DEFAULT NULL,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_user` varchar(25) DEFAULT NULL,
  `is_delete` varchar(1) DEFAULT '0' COMMENT 'ɾ��״̬��0����1����',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8129 DEFAULT CHARSET=utf8;


ALTER TABLE department_info
ADD COLUMN `isKqsyShow` int(11),
ADD COLUMN `kqsyOrder` int(11);
