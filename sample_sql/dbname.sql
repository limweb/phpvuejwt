/*
Navicat MySQL Data Transfer

Source Server         : Mysql.Local
Source Server Version : 100206
Source Host           : localhost:3306
Source Database       : dbname

Target Server Type    : MYSQL
Target Server Version : 100206
File Encoding         : 65001

Date: 2017-08-21 21:59:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for companies
-- ----------------------------
DROP TABLE IF EXISTS `companies`;
CREATE TABLE `companies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `companyname` varchar(255) DEFAULT NULL,
  `comp_uuid` varchar(37) DEFAULT NULL COMMENT 'ไว้อ้างอิงข้อมูลของ company นั้น ๆ ',
  `comp_code` varchar(37) DEFAULT NULL COMMENT 'uuid for company อ้างอิง package',
  `path` varchar(255) DEFAULT NULL COMMENT 'path or prefix',
  `status` int(1) DEFAULT 1 COMMENT '0 inactive 1 active',
  `sort` int(4) DEFAULT 0,
  `created_by` varchar(255) DEFAULT 'system',
  `updated_by` varchar(255) DEFAULT 'system',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL COMMENT 'softdelete',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of companies
-- ----------------------------
INSERT INTO `companies` VALUES ('1', 'TEST COMPANY CO.,LTD.', '97274750916624387', 'DATAA', 'test', '1', '0', 'tlen', 'tlen', '2017-08-18 15:06:19', '2017-08-18 15:49:50', null);
INSERT INTO `companies` VALUES ('2', 'TLEN CO.,LTD.', '97274750916624388', '-1', 'teat1', '1', '0', 'tlen', 'tlen', '2017-08-18 15:43:49', '2017-08-21 15:42:36', null);
INSERT INTO `companies` VALUES ('3', 'DATAZ CO.,LTD.', '97274750916624389', 'DATAZ', 'zdata', '1', '0', 'tlen', 'tlen', '2017-08-18 15:50:48', '2017-08-18 15:51:03', null);
INSERT INTO `companies` VALUES ('24', 'tomato co.,ltd.', '97274750916624392', '0001-00000000-599a74df-b99d-a7182cf6', '/', '1', '0', 'system', 'system', '2017-08-21 14:56:27', '2017-08-21 15:41:41', null);
INSERT INTO `companies` VALUES ('25', 'ketshopweb co.,ltd.', '97274750916624393', '0001-00000000-599a74df-b99d-a7182cf6', '/', '1', '0', 'system', 'system', '2017-08-21 15:46:00', '2017-08-21 15:46:00', null);
INSERT INTO `companies` VALUES ('26', 'servit co.,ltd.', '97274750916624394', '-1', '/', '1', '0', 'system', 'system', '2017-08-21 15:46:54', '2017-08-21 15:46:54', null);

-- ----------------------------
-- Table structure for modules
-- ----------------------------
DROP TABLE IF EXISTS `modules`;
CREATE TABLE `modules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(255) NOT NULL,
  `route` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `parent` int(10) unsigned DEFAULT NULL,
  `level` int(2) unsigned DEFAULT 0,
  `doctype` varchar(30) DEFAULT NULL COMMENT 'IV PO ...',
  `status` int(1) DEFAULT 1,
  `created_by` varchar(255) DEFAULT 'system',
  `updated_by` varchar(255) DEFAULT 'system',
  `update_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `creatd_at` timestamp NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of modules
-- ----------------------------
INSERT INTO `modules` VALUES ('1', 'ข้อสอบ', 'QuestionController', 'ข้อสอบ', '0', '0', null, '1', 'system', 'system', '2017-08-21 11:23:02', '2017-08-21 11:23:02', null);
INSERT INTO `modules` VALUES ('2', 'คำตอน', 'AnswerController', 'คำตอบ', '0', '0', null, '1', 'system', 'system', '2017-08-21 11:23:02', '2017-08-21 11:23:02', null);
INSERT INTO `modules` VALUES ('3', 'forall', 'Forallcontroller', 'sharemodule', '0', '0', null, '1', 'system', 'system', '2017-08-21 11:23:02', '2017-08-21 11:23:02', null);

-- ----------------------------
-- Table structure for packages
-- ----------------------------
DROP TABLE IF EXISTS `packages`;
CREATE TABLE `packages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `uuid` varchar(37) DEFAULT NULL,
  `comp_db` int(2) unsigned DEFAULT NULL COMMENT 'จำนวน database ที่สร้างได้',
  `account` int(2) unsigned DEFAULT NULL COMMENT 'จำนวน user or account ย่อยที่สร้างเพิ่ม 0 unlimmit  1  cannot add  >=2  เท่ากับจำนวนที่สามารถสร้างได้',
  `modules` text DEFAULT NULL,
  `tb_limit` text DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `status` int(1) DEFAULT 1,
  `json_data` text DEFAULT NULL,
  `promotionid` varchar(37) DEFAULT NULL COMMENT 'กำหนดช่วงโปรโมชั่น',
  `showpublic` int(1) DEFAULT 1 COMMENT '1 public  0 private',
  `level` int(2) unsigned DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` varchar(255) DEFAULT 'system',
  `updated_by` varchar(255) DEFAULT 'system',
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of packages
-- ----------------------------
INSERT INTO `packages` VALUES ('1', 'ALL', 'ALL', '-1', '999', '999', null, null, null, '1', null, '*', '0', '0', '2017-08-19 16:29:42', '2017-08-21 05:42:49', 'system', 'system', null);
INSERT INTO `packages` VALUES ('2', 'free', 'free', 'DATAA', '1', '1', '[{\"id\":1,\"module\":\"\\u0e02\\u0e49\\u0e2d\\u0e2a\\u0e2d\\u0e1a\",\"route\":\"QuestionController\",\"description\":\"\\u0e02\\u0e49\\u0e2d\\u0e2a\\u0e2d\\u0e1a\",\"parent\":0,\"level\":0,\"doctype\":null,\"status\":1},{\"id\":2,\"module\":\"\\u0e04\\u0e33\\u0e15\\u0e2d\\u0e19\",\"route\":\"AnswerController\",\"description\":\"\\u0e04\\u0e33\\u0e15\\u0e2d\\u0e1a\",\"parent\":0,\"level\":0,\"doctype\":null,\"status\":1},{\"id\":3,\"module\":\"forall\",\"route\":\"Forallcontroller\",\"description\":\"sharemodule\",\"parent\":0,\"level\":0,\"doctype\":null,\"status\":1}]', null, null, '1', null, '1', '1', '0', '2017-08-19 16:29:42', '2017-08-21 05:54:49', 'system', 'system', null);
INSERT INTO `packages` VALUES ('3', 'พรีเมี่ยม', 'พรีเมี่ยม', 'DATAZ', '3', '3', null, null, null, '1', null, '1', '1', '0', '2017-08-19 16:57:47', '2017-08-21 05:43:10', 'system', 'system', null);
INSERT INTO `packages` VALUES ('4', 'โปร', 'โปร', 'A', '5', '5', null, null, null, '1', null, '1', '1', '0', '2017-08-19 16:57:51', '2017-08-21 05:43:22', 'system', 'system', null);
INSERT INTO `packages` VALUES ('5', 'พลัส', 'พลัส', 'B', '10', '10', null, null, null, '1', null, '1', '1', '0', '2017-08-19 16:57:54', '2017-08-21 05:43:23', 'system', 'system', null);
INSERT INTO `packages` VALUES ('30', 'พรีเมี่ยม', 'พรีเมี่ยม', '0001-00000000-599a74df-b99d-a7182cf6', '3', '3', '[{\"id\":1,\"module\":\"\\u0e02\\u0e49\\u0e2d\\u0e2a\\u0e2d\\u0e1a\",\"route\":\"QuestionController\",\"description\":\"\\u0e02\\u0e49\\u0e2d\\u0e2a\\u0e2d\\u0e1a\",\"parent\":0,\"level\":0,\"doctype\":null,\"status\":1,\"created_by\":\"system\",\"updated_by\":\"system\",\"update_at\":\"2017-08-21 11:23:02\",\"creatd_at\":\"2017-08-21 11:23:02\",\"deleted_at\":null},{\"id\":2,\"module\":\"\\u0e04\\u0e33\\u0e15\\u0e2d\\u0e19\",\"route\":\"AnswerController\",\"description\":\"\\u0e04\\u0e33\\u0e15\\u0e2d\\u0e1a\",\"parent\":0,\"level\":0,\"doctype\":null,\"status\":1,\"created_by\":\"system\",\"updated_by\":\"system\",\"update_at\":\"2017-08-21 11:23:02\",\"creatd_at\":\"2017-08-21 11:23:02\",\"deleted_at\":null},{\"id\":3,\"module\":\"forall\",\"route\":\"Forallcontroller\",\"description\":\"sharemodule\",\"parent\":0,\"level\":0,\"doctype\":null,\"status\":1,\"created_by\":\"system\",\"updated_by\":\"system\",\"update_at\":\"2017-08-21 11:23:02\",\"creatd_at\":\"2017-08-21 11:23:02\",\"deleted_at\":null}]', null, null, '1', '{\"id\":3,\"name\":\"\\u0e1e\\u0e23\\u0e35\\u0e40\\u0e21\\u0e35\\u0e48\\u0e22\\u0e21\",\"desc\":\"\\u0e1e\\u0e23\\u0e35\\u0e40\\u0e21\\u0e35\\u0e48\\u0e22\\u0e21\",\"comp_db\":3,\"account\":3,\"modules\":null,\"tb_limit\":null,\"remark\":null,\"status\":1,\"json_data\":null,\"promotionid\":\"1\",\"showpublic\":1,\"level\":0,\"created_at\":\"2017-08-19 16:57:47\",\"updated_at\":\"2017-08-19 17:18:56\",\"created_by\":\"system\",\"updated_by\":\"system\"}', '1', '1', '0', '2017-08-21 14:56:27', '2017-08-21 17:07:02', 'system', 'system', null);

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `comp_code` varchar(37) NOT NULL,
  `role_id` int(11) unsigned DEFAULT NULL,
  `module_id` int(11) unsigned DEFAULT NULL,
  `isRead` int(1) DEFAULT 1,
  `isAdd` int(1) DEFAULT NULL,
  `isDelete` int(1) DEFAULT NULL,
  `idEdit` int(1) DEFAULT NULL,
  `isPrint` int(1) DEFAULT NULL,
  `isExport` int(1) DEFAULT NULL,
  `isCancel` int(1) DEFAULT NULL,
  `isApprove` int(1) DEFAULT NULL,
  `isMauthor` int(1) DEFAULT 0 COMMENT 'Modify Anather no parent',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES ('1', '********', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `permissions` VALUES ('2', '********', '1', '2', '1', '1', '1', '1', '1', '1', '1', '1', '0');
INSERT INTO `permissions` VALUES ('3', '********', '1', '3', '1', '1', '0', '0', '1', '1', '0', '0', '0');
INSERT INTO `permissions` VALUES ('4', 'DATAZ', '4', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `permissions` VALUES ('5', 'DATAZ', '4', '2', '1', '1', '0', '1', '1', '1', '0', '0', '0');
INSERT INTO `permissions` VALUES ('7', '********', '2', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `permissions` VALUES ('8', '********', '2', '2', '1', '1', '1', '1', '1', '1', '1', '1', '0');
INSERT INTO `permissions` VALUES ('9', '********', '2', '3', '1', '1', '0', '0', '1', '1', '0', '0', '0');
INSERT INTO `permissions` VALUES ('10', '********', '3', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `permissions` VALUES ('11', '********', '3', '2', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `permissions` VALUES ('12', '********', '3', '3', '1', '1', '1', '1', '1', '1', '1', '1', '0');
INSERT INTO `permissions` VALUES ('13', 'DATAZ', '4', '3', '1', '1', '0', '1', '1', '1', '0', '0', '0');

-- ----------------------------
-- Table structure for profiles
-- ----------------------------
DROP TABLE IF EXISTS `profiles`;
CREATE TABLE `profiles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `comp_code` varchar(37) DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `fname` varchar(255) DEFAULT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `provice` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `zipcode` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` varchar(255) DEFAULT 'system',
  `updated_by` varchar(255) DEFAULT 'system',
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of profiles
-- ----------------------------
INSERT INTO `profiles` VALUES ('5', '0001-00000000-599a74df-b99d-a7182cf6', '27', 'teststaff', 'lname', 'email', '$address1', '$address2', 'JJ', 'BKK', 'TH', '10250', '023005507', '2017-08-21 14:52:18', '2017-08-21 14:52:18', 'system', 'system', null);
INSERT INTO `profiles` VALUES ('6', '0001-00000000-599a74df-b99d-a7182cf6', '28', 'testuser', 'lname', 'email', '$address1', '$address2', 'JJ', 'BKK', 'TH', '10250', '023005507', '2017-08-21 14:52:55', '2017-08-21 14:52:55', 'system', 'system', null);
INSERT INTO `profiles` VALUES ('7', '0001-00000000-599a922b-70a1-e945c928', '29', 'tomato', 'lname', 'tomato@tomato.com', 'tomato1', 'tomato2', 'JJ', 'BKK', 'TH', '10250', '023005507', '2017-08-21 14:56:27', '2017-08-21 14:56:27', 'system', 'system', null);
INSERT INTO `profiles` VALUES ('8', 'DATAZ', '30', 'datazuser', 'lname', 'email', '$address1', '$address2', 'JJ', 'BKK', 'TH', '10250', '023005507', '2017-08-21 15:20:35', '2017-08-21 15:20:35', 'system', 'system', null);
INSERT INTO `profiles` VALUES ('9', '-1', '31', 'tim', 'lname', 'email', '$address1', '$address2', 'JJ', 'BKK', 'TH', '10250', '023005507', '2017-08-21 15:47:30', '2017-08-21 15:47:30', 'system', 'system', null);
INSERT INTO `profiles` VALUES ('10', '0001-00000000-599a74df-b99d-a7182cf6', '32', 'chaijan', 'lname', 'email', '$address1', '$address2', 'JJ', 'BKK', 'TH', '10250', '023005507', '2017-08-21 21:56:03', '2017-08-21 21:56:03', 'system', 'system', null);

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `role` varchar(255) NOT NULL COMMENT 'ชื่อ Role',
  `description` varchar(255) DEFAULT NULL COMMENT 'คำอธิบาย',
  `comp_code` varchar(37) DEFAULT NULL COMMENT '******** ใช้ร่วมกัน  นอกเหนือ ตาม Group',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', 'admin', 'admin', '*********', '2017-08-21 10:19:23', '2017-08-21 10:19:23', null);
INSERT INTO `roles` VALUES ('2', 'staff', 'staff', '*********', '2017-08-21 10:19:23', '2017-08-21 10:19:23', null);
INSERT INTO `roles` VALUES ('3', 'user', 'user', '*********', '2017-08-21 10:19:23', '2017-08-21 10:19:23', null);
INSERT INTO `roles` VALUES ('4', 'dataz_admin', 'dataz_admin', '0001-00000000-599a74df-b99d-a7182cf6', '2017-08-21 10:19:23', '2017-08-21 14:11:22', null);

-- ----------------------------
-- Table structure for roles_copy
-- ----------------------------
DROP TABLE IF EXISTS `roles_copy`;
CREATE TABLE `roles_copy` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `role` varchar(255) NOT NULL COMMENT 'ชื่อ Role',
  `description` varchar(255) DEFAULT NULL COMMENT 'คำอธิบาย',
  `comp_code` varchar(37) DEFAULT NULL COMMENT '******** ใช้ร่วมกัน  นอกเหนือ ตาม Group',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roles_copy
-- ----------------------------

-- ----------------------------
-- Table structure for sys_modules
-- ----------------------------
DROP TABLE IF EXISTS `sys_modules`;
CREATE TABLE `sys_modules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(255) NOT NULL,
  `route` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `parent` int(10) unsigned DEFAULT NULL,
  `level` int(2) unsigned DEFAULT 0,
  `doctype` varchar(30) DEFAULT NULL COMMENT 'IV PO ...',
  `status` int(1) DEFAULT 1,
  `created_by` varchar(255) DEFAULT 'system',
  `updated_by` varchar(255) DEFAULT 'system',
  `update_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `creatd_at` timestamp NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_modules
-- ----------------------------
INSERT INTO `sys_modules` VALUES ('1', 'ข้อสอบ', 'QuestionController', 'ข้อสอบ', '0', '0', null, '1', 'system', 'system', '2017-08-21 11:23:02', '2017-08-21 11:23:02', null);
INSERT INTO `sys_modules` VALUES ('2', 'คำตอน', 'AnswerController', 'คำตอบ', '0', '0', null, '1', 'system', 'system', '2017-08-21 11:23:02', '2017-08-21 11:23:02', null);
INSERT INTO `sys_modules` VALUES ('3', 'forall', 'Forallcontroller', 'sharemodule', '0', '0', null, '1', 'system', 'system', '2017-08-21 11:23:02', '2017-08-21 11:23:02', null);

-- ----------------------------
-- Table structure for sys_packages
-- ----------------------------
DROP TABLE IF EXISTS `sys_packages`;
CREATE TABLE `sys_packages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `comp_db` int(2) unsigned DEFAULT NULL COMMENT 'จำนวน database ที่สร้างได้',
  `account` int(2) unsigned DEFAULT NULL COMMENT 'จำนวน user or account ย่อยที่สร้างเพิ่ม 0 unlimmit  1  cannot add  >=2  เท่ากับจำนวนที่สามารถสร้างได้',
  `modules` varchar(255) DEFAULT NULL,
  `tb_limit` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `status` int(1) DEFAULT 1,
  `json_data` text DEFAULT NULL,
  `promotionid` varchar(37) DEFAULT NULL,
  `showpublic` int(1) DEFAULT 1 COMMENT '1 public  0 private',
  `level` int(2) unsigned DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_packages
-- ----------------------------
INSERT INTO `sys_packages` VALUES ('1', 'ALL', 'ALL', '999', '999', null, null, null, '1', null, '*', '0', '0', '2017-08-19 16:29:42', '2017-08-19 17:21:17', 'system', 'system');
INSERT INTO `sys_packages` VALUES ('2', 'free', 'free', '1', '1', null, null, null, '1', null, '1', '1', '0', '2017-08-19 16:29:42', '2017-08-19 17:21:22', 'system', 'system');
INSERT INTO `sys_packages` VALUES ('3', 'พรีเมี่ยม', 'พรีเมี่ยม', '3', '3', null, null, null, '1', null, '1', '1', '0', '2017-08-19 16:57:47', '2017-08-19 17:18:56', 'system', 'system');
INSERT INTO `sys_packages` VALUES ('4', 'โปร', 'โปร', '5', '5', null, null, null, '1', null, '1', '1', '0', '2017-08-19 16:57:51', '2017-08-19 17:18:57', 'system', 'system');
INSERT INTO `sys_packages` VALUES ('5', 'พลัส', 'พลัส', '10', '10', null, null, null, '1', null, '1', '1', '0', '2017-08-19 16:57:54', '2017-08-19 17:18:59', 'system', 'system');

-- ----------------------------
-- Table structure for sys_permissions
-- ----------------------------
DROP TABLE IF EXISTS `sys_permissions`;
CREATE TABLE `sys_permissions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(1) NOT NULL,
  `isRead` int(1) DEFAULT 1,
  `isAdd` int(1) DEFAULT NULL,
  `isDelete` int(1) DEFAULT NULL,
  `idEdit` int(1) DEFAULT NULL,
  `isPrint` int(1) DEFAULT NULL,
  `isExport` int(1) DEFAULT NULL,
  `isCancel` int(1) DEFAULT NULL,
  `isApprove` int(1) DEFAULT NULL,
  `isMauthor` int(1) DEFAULT 0 COMMENT 'Modify Anather no parent',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_permissions
-- ----------------------------
INSERT INTO `sys_permissions` VALUES ('1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `sys_permissions` VALUES ('2', '2', '1', '1', '0', '1', '1', '1', '1', '1', '0');
INSERT INTO `sys_permissions` VALUES ('3', '3', '1', '1', '0', '1', '1', '1', '0', '0', '0');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role_id` int(10) unsigned DEFAULT NULL COMMENT 'สิทธิ์',
  `status` int(1) DEFAULT 1 COMMENT '0/1  active ',
  `uuid` varchar(37) DEFAULT NULL COMMENT 'ตัวแบกบริษัท หรือ acc เพื่อแบบแยก ฐานข้อมูล  0 ไม่มีบริษัทใหญ่สด',
  `default_select_comp` int(10) unsigned DEFAULT NULL COMMENT 'last select company',
  `chkpermiss` int(1) DEFAULT 1 COMMENT '0 ตรวจสอบ ถ้าไม่มือถือว่า false 1  ไม่ตรวจสอบ ผ่านตลอด',
  `sysadmin` int(1) unsigned DEFAULT 0 COMMENT '1 for all company    ใช้สร้าง user ต่าง ๆ เริ่มต้น',
  `parent_id` int(11) DEFAULT 0 COMMENT '0 root  ',
  `modules` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `created_by` varchar(255) DEFAULT 'system',
  `updated_by` varchar(255) DEFAULT 'system',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user` (`user`,`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'xxxx', 'secret', '2', '1', 'DATAA', '1', '1', '0', '2', null, '2017-08-19 17:43:36', '2017-08-20 23:46:02', null, 'system', 'system');
INSERT INTO `users` VALUES ('2', 'admin', 'secret', '1', '1', 'DATAA', '0', '1', '0', '0', null, '2017-08-19 17:43:36', '2017-08-20 23:46:51', null, 'system', 'system');
INSERT INTO `users` VALUES ('3', 'manager', 'secret', '1', '1', 'DATAZ', '3', '1', '0', '0', null, '2017-08-19 17:43:36', '2017-08-21 12:01:26', null, 'system', 'system');
INSERT INTO `users` VALUES ('4', 'tlen', '4105', '1', '1', '-1', '1', '0', '1', '0', null, '2017-08-19 17:43:36', '2017-08-20 23:46:04', null, 'system', 'system');
INSERT INTO `users` VALUES ('5', 'test', 'secret', '2', '1', 'DATAZ', '3', '1', '0', '3', null, '2017-08-19 17:43:36', '2017-08-21 12:02:48', null, 'system', 'system');
INSERT INTO `users` VALUES ('27', 'teststaff', '$2y$10$eKlpi/8vMoDe13jNedMq9eVyKK1pR0qv2OfHuVCwGtqvAaEYbh1Pa', '2', '1', '0001-00000000-599a74df-b99d-a7182cf6', '24', '1', '0', '29', null, '2017-08-21 14:52:18', '2017-08-21 15:16:32', null, 'system', 'system');
INSERT INTO `users` VALUES ('28', 'testuser', '$2y$10$t0ykXLxnvMc6j5H4T8ZVEuSOIbRI3CFpwmPKOAsCfC7WOPAw7QX12', '3', '1', '0001-00000000-599a74df-b99d-a7182cf6', '24', '1', '0', '29', null, '2017-08-21 14:52:55', '2017-08-21 15:19:22', null, 'system', 'system');
INSERT INTO `users` VALUES ('29', 'tomato', '$2y$10$kvAv36SMj45LBZ.Js.dAvOMDuHO23IQ6GxyQBzRZNT2qrsVz4aQ6.', '1', '1', '0001-00000000-599a74df-b99d-a7182cf6', '25', '1', '0', '0', '[{\"id\":1,\"module\":\"\\u0e02\\u0e49\\u0e2d\\u0e2a\\u0e2d\\u0e1a\",\"route\":\"QuestionController\",\"description\":\"\\u0e02\\u0e49\\u0e2d\\u0e2a\\u0e2d\\u0e1a\",\"parent\":0,\"level\":0,\"doctype\":null,\"status\":1,\"created_by\":\"system\",\"updated_by\":\"system\",\"update_at\":\"2017-08-21 11:23:02\",\"creatd_at\":\"2017-08-21 11:23:02\",\"deleted_at\":null,\"permission\":{\"id\":1,\"comp_code\":\"********\",\"role_id\":1,\"module_id\":1,\"isRead\":1,\"isAdd\":1,\"isDelete\":1,\"idEdit\":1,\"isPrint\":1,\"isExport\":1,\"isCancel\":1,\"isApprove\":1,\"isMauthor\":1}},{\"id\":2,\"module\":\"\\u0e04\\u0e33\\u0e15\\u0e2d\\u0e19\",\"route\":\"AnswerController\",\"description\":\"\\u0e04\\u0e33\\u0e15\\u0e2d\\u0e1a\",\"parent\":0,\"level\":0,\"doctype\":null,\"status\":1,\"created_by\":\"system\",\"updated_by\":\"system\",\"update_at\":\"2017-08-21 11:23:02\",\"creatd_at\":\"2017-08-21 11:23:02\",\"deleted_at\":null,\"permission\":{\"id\":2,\"comp_code\":\"********\",\"role_id\":1,\"module_id\":2,\"isRead\":1,\"isAdd\":1,\"isDelete\":1,\"idEdit\":1,\"isPrint\":1,\"isExport\":1,\"isCancel\":1,\"isApprove\":1,\"isMauthor\":0}},{\"id\":3,\"module\":\"forall\",\"route\":\"Forallcontroller\",\"description\":\"sharemodule\",\"parent\":0,\"level\":0,\"doctype\":null,\"status\":1,\"created_by\":\"system\",\"updated_by\":\"system\",\"update_at\":\"2017-08-21 11:23:02\",\"creatd_at\":\"2017-08-21 11:23:02\",\"deleted_at\":null,\"permission\":{\"id\":3,\"comp_code\":\"********\",\"role_id\":1,\"module_id\":3,\"isRead\":1,\"isAdd\":1,\"isDelete\":0,\"idEdit\":0,\"isPrint\":1,\"isExport\":1,\"isCancel\":0,\"isApprove\":0,\"isMauthor\":0}}]', '2017-08-21 14:56:27', '2017-08-21 18:19:52', null, 'system', 'system');
INSERT INTO `users` VALUES ('30', 'datazuser', '$2y$10$QmnPdmP9.j2Ift9SzlWF7.0CgDSblRx.6rI6mQj5GDCU3c8eW0a7K', '2', '1', 'DATAZ', '3', '1', '0', '3', null, '2017-08-21 15:20:35', '2017-08-21 15:20:35', null, 'system', 'system');
INSERT INTO `users` VALUES ('31', 'tim', '$2y$10$g8/rG3iEV1ToiXirILP0H.iX54F7Fexb/xB5AGCSgVU7.PVdCXroW', '2', '1', '-1', '26', '0', '0', '4', null, '2017-08-21 15:47:30', '2017-08-21 15:47:39', null, 'system', 'system');
INSERT INTO `users` VALUES ('32', 'chaijan', '$2y$10$tU7/N9vOtWSelSj5.grJpO2pL2N.45kIA0DhoAW3h7tPFj8sAcTby', '1', '1', '0001-00000000-599a74df-b99d-a7182cf6', '25', '1', '0', '29', null, '2017-08-21 21:56:03', '2017-08-21 21:56:03', null, 'system', 'system');
SET FOREIGN_KEY_CHECKS=1;
