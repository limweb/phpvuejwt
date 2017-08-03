/*
Navicat MySQL Data Transfer

Source Server         : Mysql.Local
Source Server Version : 100206
Source Host           : localhost:3306
Source Database       : dbname

Target Server Type    : MYSQL
Target Server Version : 100206
File Encoding         : 65001

Date: 2017-08-03 17:47:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for modules
-- ----------------------------
DROP TABLE IF EXISTS `modules`;
CREATE TABLE `modules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(255) NOT NULL,
  `route` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of modules
-- ----------------------------
INSERT INTO `modules` VALUES ('1', 'ข้อสอบ', 'QuestionController', 'ข้อสอบ');
INSERT INTO `modules` VALUES ('2', 'คำตอน', 'AnswerController', 'คำตอบ');

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module_id` int(10) unsigned DEFAULT NULL,
  `permisstion` varchar(255) NOT NULL,
  `desctiption` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES ('1', '1', 'เพิ่ม', null);
INSERT INTO `permissions` VALUES ('2', '1', 'ลบ', null);
INSERT INTO `permissions` VALUES ('3', '1', 'แก้ไข', null);
INSERT INTO `permissions` VALUES ('4', '1', 'อ่าน', null);
INSERT INTO `permissions` VALUES ('5', '1', 'export', null);
INSERT INTO `permissions` VALUES ('6', '1', 'print', null);
INSERT INTO `permissions` VALUES ('7', '2', 'เพิ่ม', null);
INSERT INTO `permissions` VALUES ('8', '2', 'ลบ', null);
INSERT INTO `permissions` VALUES ('9', '2', 'แก้ไข', null);
INSERT INTO `permissions` VALUES ('10', '2', 'อ่าน', null);
INSERT INTO `permissions` VALUES ('11', '2', 'export', null);
INSERT INTO `permissions` VALUES ('12', '2', 'print', null);

-- ----------------------------
-- Table structure for permission_role
-- ----------------------------
DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE `permission_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `permission_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_id` (`role_id`,`permission_id`) USING BTREE,
  KEY `permission_id` (`permission_id`) USING BTREE,
  CONSTRAINT `permission_role_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `permission_role_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission_role
-- ----------------------------
INSERT INTO `permission_role` VALUES ('1', '3', '1');
INSERT INTO `permission_role` VALUES ('3', '3', '2');
INSERT INTO `permission_role` VALUES ('4', '3', '3');
INSERT INTO `permission_role` VALUES ('5', '3', '4');
INSERT INTO `permission_role` VALUES ('6', '3', '5');
INSERT INTO `permission_role` VALUES ('7', '3', '6');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `role` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', 'admin', 'admin', '0');
INSERT INTO `roles` VALUES ('2', 'staff', 'staff', '1');
INSERT INTO `roles` VALUES ('3', 'user', 'user', '2');
INSERT INTO `roles` VALUES ('4', 'superadmin', 'superadmin', '0');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'xxxx', 'yyyy', '2');
INSERT INTO `users` VALUES ('2', 'admin', 'secret', '1');
INSERT INTO `users` VALUES ('3', 'manager', 'secret', '2');
SET FOREIGN_KEY_CHECKS=1;
