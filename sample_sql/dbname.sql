/*
Navicat MySQL Data Transfer

Source Server         : Mysql.Local
Source Server Version : 100206
Source Host           : localhost:3306
Source Database       : dbname

Target Server Type    : MYSQL
Target Server Version : 100206
File Encoding         : 65001

Date: 2017-08-31 16:28:35
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
-- Table structure for dbcolumninfos
-- ----------------------------
DROP TABLE IF EXISTS `dbcolumninfos`;
CREATE TABLE `dbcolumninfos` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tbname` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `length` int(11) DEFAULT 0,
  `show` int(1) DEFAULT 1,
  `type` varchar(255) DEFAULT NULL,
  `sort` int(3) DEFAULT 0,
  `json` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dbcolumninfos
-- ----------------------------
INSERT INTO `dbcolumninfos` VALUES ('1', 'companies', 'id', '10', '1', 'number', '0', '{\"Field\":\"id\",\"Type\":\"int(10) unsigned\",\"Null\":\"NO\",\"Key\":\"PRI\",\"Default\":null,\"Extra\":\"auto_increment\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('2', 'companies', 'companyname', '255', '1', 'text', '0', '{\"Field\":\"companyname\",\"Type\":\"varchar(255)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('3', 'companies', 'comp_uuid', '37', '1', 'text', '0', '{\"Field\":\"comp_uuid\",\"Type\":\"varchar(37)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('4', 'companies', 'comp_code', '37', '1', 'text', '0', '{\"Field\":\"comp_code\",\"Type\":\"varchar(37)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('5', 'companies', 'path', '255', '1', 'text', '0', '{\"Field\":\"path\",\"Type\":\"varchar(255)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('6', 'companies', 'status', '1', '1', 'number', '0', '{\"Field\":\"status\",\"Type\":\"int(1)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"1\",\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('7', 'companies', 'sort', '4', '1', 'number', '0', '{\"Field\":\"sort\",\"Type\":\"int(4)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"0\",\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('8', 'companies', 'created_by', '255', '0', 'text', '0', '{\"Field\":\"created_by\",\"Type\":\"varchar(255)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"system\",\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('9', 'companies', 'updated_by', '255', '0', 'text', '0', '{\"Field\":\"updated_by\",\"Type\":\"varchar(255)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"system\",\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('10', 'companies', 'created_at', '0', '0', 'datetime', '0', '{\"Field\":\"created_at\",\"Type\":\"timestamp\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"current_timestamp()\",\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('11', 'companies', 'updated_at', '0', '0', 'datetime', '0', '{\"Field\":\"updated_at\",\"Type\":\"timestamp\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"current_timestamp()\",\"Extra\":\"on update current_timestamp()\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('12', 'companies', 'deleted_at', '0', '0', 'datetime', '0', '{\"Field\":\"deleted_at\",\"Type\":\"datetime\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('13', 'dbcolumninfos', 'id', '11', '1', 'number', '0', '{\"Field\":\"id\",\"Type\":\"int(11) unsigned\",\"Null\":\"NO\",\"Key\":\"PRI\",\"Default\":null,\"Extra\":\"auto_increment\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('14', 'dbcolumninfos', 'tbname', '255', '1', 'text', '0', '{\"Field\":\"tbname\",\"Type\":\"varchar(255)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('15', 'dbcolumninfos', 'field', '255', '1', 'text', '0', '{\"Field\":\"field\",\"Type\":\"varchar(255)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('16', 'dbcolumninfos', 'length', '11', '1', 'number', '0', '{\"Field\":\"length\",\"Type\":\"int(11)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"0\",\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('17', 'dbcolumninfos', 'show', '1', '1', 'number', '0', '{\"Field\":\"show\",\"Type\":\"int(1)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"1\",\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('18', 'dbcolumninfos', 'type', '255', '1', 'text', '0', '{\"Field\":\"type\",\"Type\":\"varchar(255)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('19', 'dbcolumninfos', 'sort', '3', '1', 'number', '0', '{\"Field\":\"sort\",\"Type\":\"int(3)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"0\",\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('20', 'dbcolumninfos', 'json', '0', '1', 'textarea', '0', '{\"Field\":\"json\",\"Type\":\"text\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('21', 'dbcolumninfos', 'created_at', '0', '0', 'datetime', '0', '{\"Field\":\"created_at\",\"Type\":\"timestamp\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"current_timestamp()\",\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('22', 'dbcolumninfos', 'updated_at', '0', '0', 'datetime', '0', '{\"Field\":\"updated_at\",\"Type\":\"timestamp\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"current_timestamp()\",\"Extra\":\"on update current_timestamp()\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('23', 'modules', 'id', '10', '1', 'number', '0', '{\"Field\":\"id\",\"Type\":\"int(10) unsigned\",\"Null\":\"NO\",\"Key\":\"PRI\",\"Default\":null,\"Extra\":\"auto_increment\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('24', 'modules', 'module', '255', '1', 'text', '0', '{\"Field\":\"module\",\"Type\":\"varchar(255)\",\"Null\":\"NO\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('25', 'modules', 'route', '255', '1', 'text', '0', '{\"Field\":\"route\",\"Type\":\"varchar(255)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('26', 'modules', 'description', '255', '1', 'text', '0', '{\"Field\":\"description\",\"Type\":\"varchar(255)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('27', 'modules', 'parent', '10', '1', 'number', '0', '{\"Field\":\"parent\",\"Type\":\"int(10) unsigned\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('28', 'modules', 'level', '2', '1', 'number', '0', '{\"Field\":\"level\",\"Type\":\"int(2) unsigned\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"0\",\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('29', 'modules', 'doctype', '30', '1', 'text', '0', '{\"Field\":\"doctype\",\"Type\":\"varchar(30)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('30', 'modules', 'status', '1', '1', 'number', '0', '{\"Field\":\"status\",\"Type\":\"int(1)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"1\",\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('31', 'modules', 'created_by', '255', '0', 'text', '0', '{\"Field\":\"created_by\",\"Type\":\"varchar(255)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"system\",\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('32', 'modules', 'updated_by', '255', '0', 'text', '0', '{\"Field\":\"updated_by\",\"Type\":\"varchar(255)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"system\",\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('33', 'modules', 'updated_at', '0', '0', 'datetime', '0', '{\"Field\":\"updated_at\",\"Type\":\"timestamp\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"current_timestamp()\",\"Extra\":\"on update current_timestamp()\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('34', 'modules', 'created_at', '0', '0', 'datetime', '0', '{\"Field\":\"created_at\",\"Type\":\"timestamp\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"current_timestamp()\",\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('35', 'modules', 'deleted_at', '0', '0', 'datetime', '0', '{\"Field\":\"deleted_at\",\"Type\":\"timestamp\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('36', 'packages', 'id', '11', '1', 'number', '0', '{\"Field\":\"id\",\"Type\":\"int(11) unsigned\",\"Null\":\"NO\",\"Key\":\"PRI\",\"Default\":null,\"Extra\":\"auto_increment\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('37', 'packages', 'name', '255', '1', 'text', '0', '{\"Field\":\"name\",\"Type\":\"varchar(255)\",\"Null\":\"NO\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('38', 'packages', 'desc', '255', '1', 'text', '0', '{\"Field\":\"desc\",\"Type\":\"varchar(255)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('39', 'packages', 'uuid', '37', '1', 'text', '0', '{\"Field\":\"uuid\",\"Type\":\"varchar(37)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('40', 'packages', 'comp_db', '2', '1', 'number', '0', '{\"Field\":\"comp_db\",\"Type\":\"int(2) unsigned\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('41', 'packages', 'account', '2', '1', 'number', '0', '{\"Field\":\"account\",\"Type\":\"int(2) unsigned\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('42', 'packages', 'modules', '0', '1', 'textarea', '0', '{\"Field\":\"modules\",\"Type\":\"text\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('43', 'packages', 'tb_limit', '0', '1', 'textarea', '0', '{\"Field\":\"tb_limit\",\"Type\":\"text\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('44', 'packages', 'remark', '255', '1', 'text', '0', '{\"Field\":\"remark\",\"Type\":\"varchar(255)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('45', 'packages', 'status', '1', '1', 'number', '0', '{\"Field\":\"status\",\"Type\":\"int(1)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"1\",\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('46', 'packages', 'json_data', '0', '1', 'textarea', '0', '{\"Field\":\"json_data\",\"Type\":\"text\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('47', 'packages', 'promotionid', '37', '1', 'text', '0', '{\"Field\":\"promotionid\",\"Type\":\"varchar(37)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('48', 'packages', 'showpublic', '1', '1', 'number', '0', '{\"Field\":\"showpublic\",\"Type\":\"int(1)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"1\",\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('49', 'packages', 'level', '2', '1', 'number', '0', '{\"Field\":\"level\",\"Type\":\"int(2) unsigned\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"0\",\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('50', 'packages', 'created_at', '0', '0', 'datetime', '0', '{\"Field\":\"created_at\",\"Type\":\"timestamp\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"current_timestamp()\",\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('51', 'packages', 'updated_at', '0', '0', 'datetime', '0', '{\"Field\":\"updated_at\",\"Type\":\"timestamp\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"current_timestamp()\",\"Extra\":\"on update current_timestamp()\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('52', 'packages', 'created_by', '255', '0', 'text', '0', '{\"Field\":\"created_by\",\"Type\":\"varchar(255)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"system\",\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('53', 'packages', 'updated_by', '255', '0', 'text', '0', '{\"Field\":\"updated_by\",\"Type\":\"varchar(255)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"system\",\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('54', 'packages', 'deleted_at', '0', '0', 'datetime', '0', '{\"Field\":\"deleted_at\",\"Type\":\"datetime\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('55', 'permissions', 'id', '11', '1', 'number', '0', '{\"Field\":\"id\",\"Type\":\"int(11) unsigned\",\"Null\":\"NO\",\"Key\":\"PRI\",\"Default\":null,\"Extra\":\"auto_increment\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('56', 'permissions', 'comp_code', '37', '1', 'text', '0', '{\"Field\":\"comp_code\",\"Type\":\"varchar(37)\",\"Null\":\"NO\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('57', 'permissions', 'role_id', '11', '1', 'number', '0', '{\"Field\":\"role_id\",\"Type\":\"int(11) unsigned\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('58', 'permissions', 'module_id', '11', '1', 'number', '0', '{\"Field\":\"module_id\",\"Type\":\"int(11) unsigned\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('59', 'permissions', 'isRead', '1', '1', 'number', '0', '{\"Field\":\"isRead\",\"Type\":\"int(1)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"1\",\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('60', 'permissions', 'isAdd', '1', '1', 'number', '0', '{\"Field\":\"isAdd\",\"Type\":\"int(1)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('61', 'permissions', 'isDelete', '1', '1', 'number', '0', '{\"Field\":\"isDelete\",\"Type\":\"int(1)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('62', 'permissions', 'idEdit', '1', '1', 'number', '0', '{\"Field\":\"idEdit\",\"Type\":\"int(1)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('63', 'permissions', 'isPrint', '1', '1', 'number', '0', '{\"Field\":\"isPrint\",\"Type\":\"int(1)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('64', 'permissions', 'isExport', '1', '1', 'number', '0', '{\"Field\":\"isExport\",\"Type\":\"int(1)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('65', 'permissions', 'isCancel', '1', '1', 'number', '0', '{\"Field\":\"isCancel\",\"Type\":\"int(1)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('66', 'permissions', 'isApprove', '1', '1', 'number', '0', '{\"Field\":\"isApprove\",\"Type\":\"int(1)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('67', 'permissions', 'isMauthor', '1', '1', 'number', '0', '{\"Field\":\"isMauthor\",\"Type\":\"int(1)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"0\",\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('68', 'profiles', 'id', '10', '1', 'number', '0', '{\"Field\":\"id\",\"Type\":\"int(10) unsigned\",\"Null\":\"NO\",\"Key\":\"PRI\",\"Default\":null,\"Extra\":\"auto_increment\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('69', 'profiles', 'comp_code', '37', '1', 'text', '0', '{\"Field\":\"comp_code\",\"Type\":\"varchar(37)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('70', 'profiles', 'user_id', '10', '1', 'number', '0', '{\"Field\":\"user_id\",\"Type\":\"int(10) unsigned\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('71', 'profiles', 'fname', '255', '1', 'text', '0', '{\"Field\":\"fname\",\"Type\":\"varchar(255)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('72', 'profiles', 'lname', '255', '1', 'text', '0', '{\"Field\":\"lname\",\"Type\":\"varchar(255)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('73', 'profiles', 'email', '255', '1', 'text', '0', '{\"Field\":\"email\",\"Type\":\"varchar(255)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('74', 'profiles', 'address1', '255', '1', 'text', '0', '{\"Field\":\"address1\",\"Type\":\"varchar(255)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('75', 'profiles', 'address2', '255', '1', 'text', '0', '{\"Field\":\"address2\",\"Type\":\"varchar(255)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('76', 'profiles', 'district', '255', '1', 'text', '0', '{\"Field\":\"district\",\"Type\":\"varchar(255)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('77', 'profiles', 'provice', '255', '1', 'text', '0', '{\"Field\":\"provice\",\"Type\":\"varchar(255)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('78', 'profiles', 'country', '255', '1', 'text', '0', '{\"Field\":\"country\",\"Type\":\"varchar(255)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('79', 'profiles', 'zipcode', '255', '1', 'text', '0', '{\"Field\":\"zipcode\",\"Type\":\"varchar(255)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('80', 'profiles', 'tel', '255', '1', 'text', '0', '{\"Field\":\"tel\",\"Type\":\"varchar(255)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('81', 'profiles', 'created_at', '0', '0', 'datetime', '0', '{\"Field\":\"created_at\",\"Type\":\"timestamp\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"current_timestamp()\",\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('82', 'profiles', 'updated_at', '0', '0', 'datetime', '0', '{\"Field\":\"updated_at\",\"Type\":\"timestamp\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"current_timestamp()\",\"Extra\":\"on update current_timestamp()\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('83', 'profiles', 'created_by', '255', '0', 'text', '0', '{\"Field\":\"created_by\",\"Type\":\"varchar(255)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"system\",\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('84', 'profiles', 'updated_by', '255', '0', 'text', '0', '{\"Field\":\"updated_by\",\"Type\":\"varchar(255)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"system\",\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('85', 'profiles', 'deleted_at', '0', '0', 'datetime', '0', '{\"Field\":\"deleted_at\",\"Type\":\"datetime\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('86', 'roles', 'id', '11', '1', 'number', '0', '{\"Field\":\"id\",\"Type\":\"int(11) unsigned\",\"Null\":\"NO\",\"Key\":\"PRI\",\"Default\":null,\"Extra\":\"auto_increment\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('87', 'roles', 'role', '255', '1', 'text', '0', '{\"Field\":\"role\",\"Type\":\"varchar(255)\",\"Null\":\"NO\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('88', 'roles', 'description', '255', '1', 'text', '0', '{\"Field\":\"description\",\"Type\":\"varchar(255)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('89', 'roles', 'comp_code', '37', '1', 'text', '0', '{\"Field\":\"comp_code\",\"Type\":\"varchar(37)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('90', 'roles', 'created_at', '0', '0', 'datetime', '0', '{\"Field\":\"created_at\",\"Type\":\"timestamp\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"current_timestamp()\",\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('91', 'roles', 'updated_at', '0', '0', 'datetime', '0', '{\"Field\":\"updated_at\",\"Type\":\"timestamp\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"current_timestamp()\",\"Extra\":\"on update current_timestamp()\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('92', 'roles', 'deleted_at', '0', '0', 'datetime', '0', '{\"Field\":\"deleted_at\",\"Type\":\"timestamp\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('93', 'roles_copy', 'id', '11', '1', 'number', '0', '{\"Field\":\"id\",\"Type\":\"int(11) unsigned\",\"Null\":\"NO\",\"Key\":\"PRI\",\"Default\":null,\"Extra\":\"auto_increment\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('94', 'roles_copy', 'role', '255', '1', 'text', '0', '{\"Field\":\"role\",\"Type\":\"varchar(255)\",\"Null\":\"NO\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('95', 'roles_copy', 'description', '255', '1', 'text', '0', '{\"Field\":\"description\",\"Type\":\"varchar(255)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('96', 'roles_copy', 'comp_code', '37', '1', 'text', '0', '{\"Field\":\"comp_code\",\"Type\":\"varchar(37)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('97', 'roles_copy', 'created_at', '0', '0', 'datetime', '0', '{\"Field\":\"created_at\",\"Type\":\"timestamp\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"current_timestamp()\",\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('98', 'roles_copy', 'updated_at', '0', '0', 'datetime', '0', '{\"Field\":\"updated_at\",\"Type\":\"timestamp\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"current_timestamp()\",\"Extra\":\"on update current_timestamp()\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('99', 'roles_copy', 'deleted_at', '0', '0', 'datetime', '0', '{\"Field\":\"deleted_at\",\"Type\":\"timestamp\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('100', 'sys_modules', 'id', '10', '1', 'number', '0', '{\"Field\":\"id\",\"Type\":\"int(10) unsigned\",\"Null\":\"NO\",\"Key\":\"PRI\",\"Default\":null,\"Extra\":\"auto_increment\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('101', 'sys_modules', 'module', '255', '1', 'text', '0', '{\"Field\":\"module\",\"Type\":\"varchar(255)\",\"Null\":\"NO\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('102', 'sys_modules', 'route', '255', '1', 'text', '0', '{\"Field\":\"route\",\"Type\":\"varchar(255)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('103', 'sys_modules', 'description', '255', '1', 'text', '0', '{\"Field\":\"description\",\"Type\":\"varchar(255)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('104', 'sys_modules', 'parent', '10', '1', 'number', '0', '{\"Field\":\"parent\",\"Type\":\"int(10) unsigned\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('105', 'sys_modules', 'level', '2', '1', 'number', '0', '{\"Field\":\"level\",\"Type\":\"int(2) unsigned\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"0\",\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('106', 'sys_modules', 'doctype', '30', '1', 'text', '0', '{\"Field\":\"doctype\",\"Type\":\"varchar(30)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('107', 'sys_modules', 'status', '1', '1', 'number', '0', '{\"Field\":\"status\",\"Type\":\"int(1)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"1\",\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('108', 'sys_modules', 'created_by', '255', '0', 'text', '0', '{\"Field\":\"created_by\",\"Type\":\"varchar(255)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"system\",\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('109', 'sys_modules', 'updated_by', '255', '0', 'text', '0', '{\"Field\":\"updated_by\",\"Type\":\"varchar(255)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"system\",\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('110', 'sys_modules', 'update_at', '0', '1', 'datetime', '0', '{\"Field\":\"update_at\",\"Type\":\"timestamp\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"current_timestamp()\",\"Extra\":\"on update current_timestamp()\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('111', 'sys_modules', 'creatd_at', '0', '1', 'datetime', '0', '{\"Field\":\"creatd_at\",\"Type\":\"timestamp\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"current_timestamp()\",\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('112', 'sys_modules', 'deleted_at', '0', '0', 'datetime', '0', '{\"Field\":\"deleted_at\",\"Type\":\"timestamp\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('113', 'sys_packages', 'id', '11', '1', 'number', '0', '{\"Field\":\"id\",\"Type\":\"int(11) unsigned\",\"Null\":\"NO\",\"Key\":\"PRI\",\"Default\":null,\"Extra\":\"auto_increment\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('114', 'sys_packages', 'name', '255', '1', 'text', '0', '{\"Field\":\"name\",\"Type\":\"varchar(255)\",\"Null\":\"NO\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('115', 'sys_packages', 'desc', '255', '1', 'text', '0', '{\"Field\":\"desc\",\"Type\":\"varchar(255)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('116', 'sys_packages', 'comp_db', '2', '1', 'number', '0', '{\"Field\":\"comp_db\",\"Type\":\"int(2) unsigned\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('117', 'sys_packages', 'account', '2', '1', 'number', '0', '{\"Field\":\"account\",\"Type\":\"int(2) unsigned\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('118', 'sys_packages', 'modules', '255', '1', 'text', '0', '{\"Field\":\"modules\",\"Type\":\"varchar(255)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('119', 'sys_packages', 'tb_limit', '255', '1', 'text', '0', '{\"Field\":\"tb_limit\",\"Type\":\"varchar(255)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('120', 'sys_packages', 'remark', '255', '1', 'text', '0', '{\"Field\":\"remark\",\"Type\":\"varchar(255)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('121', 'sys_packages', 'status', '1', '1', 'number', '0', '{\"Field\":\"status\",\"Type\":\"int(1)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"1\",\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('122', 'sys_packages', 'json_data', '0', '1', 'textarea', '0', '{\"Field\":\"json_data\",\"Type\":\"text\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('123', 'sys_packages', 'promotionid', '37', '1', 'text', '0', '{\"Field\":\"promotionid\",\"Type\":\"varchar(37)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('124', 'sys_packages', 'showpublic', '1', '1', 'number', '0', '{\"Field\":\"showpublic\",\"Type\":\"int(1)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"1\",\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('125', 'sys_packages', 'level', '2', '1', 'number', '0', '{\"Field\":\"level\",\"Type\":\"int(2) unsigned\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"0\",\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('126', 'sys_packages', 'created_at', '0', '0', 'datetime', '0', '{\"Field\":\"created_at\",\"Type\":\"timestamp\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"current_timestamp()\",\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('127', 'sys_packages', 'updated_at', '0', '0', 'datetime', '0', '{\"Field\":\"updated_at\",\"Type\":\"timestamp\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"current_timestamp()\",\"Extra\":\"on update current_timestamp()\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('128', 'sys_packages', 'created_by', '255', '0', 'text', '0', '{\"Field\":\"created_by\",\"Type\":\"varchar(255)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('129', 'sys_packages', 'updated_by', '255', '0', 'text', '0', '{\"Field\":\"updated_by\",\"Type\":\"varchar(255)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('130', 'sys_permissions', 'id', '11', '1', 'number', '0', '{\"Field\":\"id\",\"Type\":\"int(11) unsigned\",\"Null\":\"NO\",\"Key\":\"PRI\",\"Default\":null,\"Extra\":\"auto_increment\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('131', 'sys_permissions', 'role_id', '1', '1', 'number', '0', '{\"Field\":\"role_id\",\"Type\":\"int(1)\",\"Null\":\"NO\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('132', 'sys_permissions', 'isRead', '1', '1', 'number', '0', '{\"Field\":\"isRead\",\"Type\":\"int(1)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"1\",\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('133', 'sys_permissions', 'isAdd', '1', '1', 'number', '0', '{\"Field\":\"isAdd\",\"Type\":\"int(1)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('134', 'sys_permissions', 'isDelete', '1', '1', 'number', '0', '{\"Field\":\"isDelete\",\"Type\":\"int(1)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('135', 'sys_permissions', 'idEdit', '1', '1', 'number', '0', '{\"Field\":\"idEdit\",\"Type\":\"int(1)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('136', 'sys_permissions', 'isPrint', '1', '1', 'number', '0', '{\"Field\":\"isPrint\",\"Type\":\"int(1)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('137', 'sys_permissions', 'isExport', '1', '1', 'number', '0', '{\"Field\":\"isExport\",\"Type\":\"int(1)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('138', 'sys_permissions', 'isCancel', '1', '1', 'number', '0', '{\"Field\":\"isCancel\",\"Type\":\"int(1)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('139', 'sys_permissions', 'isApprove', '1', '1', 'number', '0', '{\"Field\":\"isApprove\",\"Type\":\"int(1)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('140', 'sys_permissions', 'isMauthor', '1', '1', 'number', '0', '{\"Field\":\"isMauthor\",\"Type\":\"int(1)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"0\",\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('141', 'sys_users', 'id', '11', '1', 'number', '0', '{\"Field\":\"id\",\"Type\":\"int(11) unsigned\",\"Null\":\"NO\",\"Key\":\"PRI\",\"Default\":null,\"Extra\":\"auto_increment\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('142', 'sys_users', 'user', '255', '1', 'text', '0', '{\"Field\":\"user\",\"Type\":\"varchar(255)\",\"Null\":\"NO\",\"Key\":\"MUL\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('143', 'sys_users', 'password', '255', '1', 'text', '0', '{\"Field\":\"password\",\"Type\":\"varchar(255)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('144', 'sys_users', 'role_id', '10', '1', 'number', '0', '{\"Field\":\"role_id\",\"Type\":\"int(10) unsigned\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('145', 'sys_users', 'status', '1', '1', 'number', '0', '{\"Field\":\"status\",\"Type\":\"int(1)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"1\",\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('146', 'sys_users', 'uuid', '37', '1', 'text', '0', '{\"Field\":\"uuid\",\"Type\":\"varchar(37)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('147', 'sys_users', 'default_select_comp', '10', '1', 'number', '0', '{\"Field\":\"default_select_comp\",\"Type\":\"int(10) unsigned\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('148', 'sys_users', 'chkpermiss', '1', '1', 'number', '0', '{\"Field\":\"chkpermiss\",\"Type\":\"int(1)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"1\",\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('149', 'sys_users', 'sysadmin', '1', '1', 'number', '0', '{\"Field\":\"sysadmin\",\"Type\":\"int(1) unsigned\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"0\",\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('150', 'sys_users', 'parent_id', '11', '1', 'number', '0', '{\"Field\":\"parent_id\",\"Type\":\"int(11)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"0\",\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('151', 'sys_users', 'modules', '0', '1', 'textarea', '0', '{\"Field\":\"modules\",\"Type\":\"text\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('152', 'sys_users', 'created_at', '0', '0', 'datetime', '0', '{\"Field\":\"created_at\",\"Type\":\"timestamp\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"current_timestamp()\",\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('153', 'sys_users', 'updated_at', '0', '0', 'datetime', '0', '{\"Field\":\"updated_at\",\"Type\":\"timestamp\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"current_timestamp()\",\"Extra\":\"on update current_timestamp()\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('154', 'sys_users', 'deleted_at', '0', '0', 'datetime', '0', '{\"Field\":\"deleted_at\",\"Type\":\"datetime\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('155', 'sys_users', 'created_by', '255', '0', 'text', '0', '{\"Field\":\"created_by\",\"Type\":\"varchar(255)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"system\",\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('156', 'sys_users', 'updated_by', '255', '0', 'text', '0', '{\"Field\":\"updated_by\",\"Type\":\"varchar(255)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"system\",\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('157', 'users', 'id', '11', '1', 'number', '0', '{\"Field\":\"id\",\"Type\":\"int(11) unsigned\",\"Null\":\"NO\",\"Key\":\"PRI\",\"Default\":null,\"Extra\":\"auto_increment\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('158', 'users', 'user', '255', '1', 'text', '0', '{\"Field\":\"user\",\"Type\":\"varchar(255)\",\"Null\":\"NO\",\"Key\":\"MUL\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('159', 'users', 'password', '255', '1', 'text', '0', '{\"Field\":\"password\",\"Type\":\"varchar(255)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('160', 'users', 'role_id', '10', '1', 'number', '0', '{\"Field\":\"role_id\",\"Type\":\"int(10) unsigned\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('161', 'users', 'status', '1', '1', 'number', '0', '{\"Field\":\"status\",\"Type\":\"int(1)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"1\",\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('162', 'users', 'uuid', '37', '1', 'text', '0', '{\"Field\":\"uuid\",\"Type\":\"varchar(37)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('163', 'users', 'default_select_comp', '10', '1', 'number', '0', '{\"Field\":\"default_select_comp\",\"Type\":\"int(10) unsigned\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('164', 'users', 'chkpermiss', '1', '1', 'number', '0', '{\"Field\":\"chkpermiss\",\"Type\":\"int(1)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"1\",\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('165', 'users', 'sysadmin', '1', '1', 'number', '0', '{\"Field\":\"sysadmin\",\"Type\":\"int(1) unsigned\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"0\",\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('166', 'users', 'parent_id', '11', '1', 'number', '0', '{\"Field\":\"parent_id\",\"Type\":\"int(11)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"0\",\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('167', 'users', 'modules', '0', '1', 'textarea', '0', '{\"Field\":\"modules\",\"Type\":\"text\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('168', 'users', 'created_at', '0', '0', 'datetime', '0', '{\"Field\":\"created_at\",\"Type\":\"timestamp\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"current_timestamp()\",\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('169', 'users', 'updated_at', '0', '0', 'datetime', '0', '{\"Field\":\"updated_at\",\"Type\":\"timestamp\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"current_timestamp()\",\"Extra\":\"on update current_timestamp()\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('170', 'users', 'deleted_at', '0', '0', 'datetime', '0', '{\"Field\":\"deleted_at\",\"Type\":\"datetime\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('171', 'users', 'created_by', '255', '0', 'text', '0', '{\"Field\":\"created_by\",\"Type\":\"varchar(255)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"system\",\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('172', 'users', 'updated_by', '255', '0', 'text', '0', '{\"Field\":\"updated_by\",\"Type\":\"varchar(255)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"system\",\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('173', 'users_copy', 'id', '11', '1', 'number', '0', '{\"Field\":\"id\",\"Type\":\"int(11) unsigned\",\"Null\":\"NO\",\"Key\":\"PRI\",\"Default\":null,\"Extra\":\"auto_increment\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('174', 'users_copy', 'user', '255', '1', 'text', '0', '{\"Field\":\"user\",\"Type\":\"varchar(255)\",\"Null\":\"NO\",\"Key\":\"MUL\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('175', 'users_copy', 'password', '255', '1', 'text', '0', '{\"Field\":\"password\",\"Type\":\"varchar(255)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('176', 'users_copy', 'role_id', '10', '1', 'number', '0', '{\"Field\":\"role_id\",\"Type\":\"int(10) unsigned\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('177', 'users_copy', 'status', '1', '1', 'number', '0', '{\"Field\":\"status\",\"Type\":\"int(1)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"1\",\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('178', 'users_copy', 'uuid', '37', '1', 'text', '0', '{\"Field\":\"uuid\",\"Type\":\"varchar(37)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('179', 'users_copy', 'default_select_comp', '10', '1', 'number', '0', '{\"Field\":\"default_select_comp\",\"Type\":\"int(10) unsigned\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('180', 'users_copy', 'chkpermiss', '1', '1', 'number', '0', '{\"Field\":\"chkpermiss\",\"Type\":\"int(1)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"1\",\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('181', 'users_copy', 'sysadmin', '1', '1', 'number', '0', '{\"Field\":\"sysadmin\",\"Type\":\"int(1) unsigned\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"0\",\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('182', 'users_copy', 'parent_id', '11', '1', 'number', '0', '{\"Field\":\"parent_id\",\"Type\":\"int(11)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"0\",\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('183', 'users_copy', 'modules', '0', '1', 'textarea', '0', '{\"Field\":\"modules\",\"Type\":\"text\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('184', 'users_copy', 'created_at', '0', '0', 'datetime', '0', '{\"Field\":\"created_at\",\"Type\":\"timestamp\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"current_timestamp()\",\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('185', 'users_copy', 'updated_at', '0', '0', 'datetime', '0', '{\"Field\":\"updated_at\",\"Type\":\"timestamp\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"current_timestamp()\",\"Extra\":\"on update current_timestamp()\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('186', 'users_copy', 'deleted_at', '0', '0', 'datetime', '0', '{\"Field\":\"deleted_at\",\"Type\":\"datetime\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('187', 'users_copy', 'created_by', '255', '0', 'text', '0', '{\"Field\":\"created_by\",\"Type\":\"varchar(255)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"system\",\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('188', 'users_copy', 'updated_by', '255', '0', 'text', '0', '{\"Field\":\"updated_by\",\"Type\":\"varchar(255)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"system\",\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('189', 'users_copy1', 'id', '11', '1', 'number', '0', '{\"Field\":\"id\",\"Type\":\"int(11) unsigned\",\"Null\":\"NO\",\"Key\":\"PRI\",\"Default\":null,\"Extra\":\"auto_increment\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('190', 'users_copy1', 'user', '255', '1', 'text', '0', '{\"Field\":\"user\",\"Type\":\"varchar(255)\",\"Null\":\"NO\",\"Key\":\"MUL\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('191', 'users_copy1', 'password', '255', '1', 'text', '0', '{\"Field\":\"password\",\"Type\":\"varchar(255)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('192', 'users_copy1', 'role_id', '10', '1', 'number', '0', '{\"Field\":\"role_id\",\"Type\":\"int(10) unsigned\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('193', 'users_copy1', 'status', '1', '1', 'number', '0', '{\"Field\":\"status\",\"Type\":\"int(1)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"1\",\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('194', 'users_copy1', 'uuid', '37', '1', 'text', '0', '{\"Field\":\"uuid\",\"Type\":\"varchar(37)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('195', 'users_copy1', 'default_select_comp', '10', '1', 'number', '0', '{\"Field\":\"default_select_comp\",\"Type\":\"int(10) unsigned\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('196', 'users_copy1', 'chkpermiss', '1', '1', 'number', '0', '{\"Field\":\"chkpermiss\",\"Type\":\"int(1)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"1\",\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('197', 'users_copy1', 'sysadmin', '1', '1', 'number', '0', '{\"Field\":\"sysadmin\",\"Type\":\"int(1) unsigned\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"0\",\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('198', 'users_copy1', 'parent_id', '11', '1', 'number', '0', '{\"Field\":\"parent_id\",\"Type\":\"int(11)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"0\",\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('199', 'users_copy1', 'modules', '0', '1', 'textarea', '0', '{\"Field\":\"modules\",\"Type\":\"text\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('200', 'users_copy1', 'created_at', '0', '0', 'datetime', '0', '{\"Field\":\"created_at\",\"Type\":\"timestamp\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"current_timestamp()\",\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('201', 'users_copy1', 'updated_at', '0', '0', 'datetime', '0', '{\"Field\":\"updated_at\",\"Type\":\"timestamp\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"current_timestamp()\",\"Extra\":\"on update current_timestamp()\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('202', 'users_copy1', 'deleted_at', '0', '0', 'datetime', '0', '{\"Field\":\"deleted_at\",\"Type\":\"datetime\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":null,\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('203', 'users_copy1', 'created_by', '255', '0', 'text', '0', '{\"Field\":\"created_by\",\"Type\":\"varchar(255)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"system\",\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');
INSERT INTO `dbcolumninfos` VALUES ('204', 'users_copy1', 'updated_by', '255', '0', 'text', '0', '{\"Field\":\"updated_by\",\"Type\":\"varchar(255)\",\"Null\":\"YES\",\"Key\":\"\",\"Default\":\"system\",\"Extra\":\"\"}', '2017-08-31 11:59:46', '2017-08-31 11:59:46');

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
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT current_timestamp(),
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
-- Table structure for sys_users
-- ----------------------------
DROP TABLE IF EXISTS `sys_users`;
CREATE TABLE `sys_users` (
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
-- Records of sys_users
-- ----------------------------
INSERT INTO `sys_users` VALUES ('1', 'xxxx', 'secret', '2', '1', 'DATAA', '1', '1', '0', '2', null, '2017-08-19 17:43:36', '2017-08-20 23:46:02', null, 'system', 'system');
INSERT INTO `sys_users` VALUES ('2', 'admin', 'secret', '1', '1', 'DATAA', '0', '1', '0', '0', null, '2017-08-19 17:43:36', '2017-08-20 23:46:51', null, 'system', 'system');

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
INSERT INTO `users` VALUES ('1', 'xxxx', 'secret', '2', '1', 'DATAA', '1', '1', '0', '2', null, '2017-08-19 17:43:36', '2017-08-22 14:38:15', null, 'system', 'system');
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

-- ----------------------------
-- Table structure for users_copy
-- ----------------------------
DROP TABLE IF EXISTS `users_copy`;
CREATE TABLE `users_copy` (
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
-- Records of users_copy
-- ----------------------------
INSERT INTO `users_copy` VALUES ('1', 'xxxx', 'secret', '2', '1', 'DATAA', '1', '1', '0', '2', null, '2017-08-19 17:43:36', '2017-08-22 14:38:15', null, 'system', 'system');
INSERT INTO `users_copy` VALUES ('2', 'admin', 'secret', '1', '1', 'DATAA', '0', '1', '0', '0', null, '2017-08-19 17:43:36', '2017-08-20 23:46:51', null, 'system', 'system');
INSERT INTO `users_copy` VALUES ('3', 'manager', 'secret', '1', '1', 'DATAZ', '3', '1', '0', '0', null, '2017-08-19 17:43:36', '2017-08-21 12:01:26', null, 'system', 'system');
INSERT INTO `users_copy` VALUES ('4', 'tlen', '4105', '1', '1', '-1', '1', '0', '1', '0', null, '2017-08-19 17:43:36', '2017-08-20 23:46:04', null, 'system', 'system');
INSERT INTO `users_copy` VALUES ('5', 'test', 'secret', '2', '1', 'DATAZ', '3', '1', '0', '3', null, '2017-08-19 17:43:36', '2017-08-21 12:02:48', null, 'system', 'system');
INSERT INTO `users_copy` VALUES ('27', 'teststaff', '$2y$10$eKlpi/8vMoDe13jNedMq9eVyKK1pR0qv2OfHuVCwGtqvAaEYbh1Pa', '2', '1', '0001-00000000-599a74df-b99d-a7182cf6', '24', '1', '0', '29', null, '2017-08-21 14:52:18', '2017-08-21 15:16:32', null, 'system', 'system');
INSERT INTO `users_copy` VALUES ('28', 'testuser', '$2y$10$t0ykXLxnvMc6j5H4T8ZVEuSOIbRI3CFpwmPKOAsCfC7WOPAw7QX12', '3', '1', '0001-00000000-599a74df-b99d-a7182cf6', '24', '1', '0', '29', null, '2017-08-21 14:52:55', '2017-08-21 15:19:22', null, 'system', 'system');
INSERT INTO `users_copy` VALUES ('29', 'tomato', '$2y$10$kvAv36SMj45LBZ.Js.dAvOMDuHO23IQ6GxyQBzRZNT2qrsVz4aQ6.', '1', '1', '0001-00000000-599a74df-b99d-a7182cf6', '25', '1', '0', '0', '[{\"id\":1,\"module\":\"\\u0e02\\u0e49\\u0e2d\\u0e2a\\u0e2d\\u0e1a\",\"route\":\"QuestionController\",\"description\":\"\\u0e02\\u0e49\\u0e2d\\u0e2a\\u0e2d\\u0e1a\",\"parent\":0,\"level\":0,\"doctype\":null,\"status\":1,\"created_by\":\"system\",\"updated_by\":\"system\",\"update_at\":\"2017-08-21 11:23:02\",\"creatd_at\":\"2017-08-21 11:23:02\",\"deleted_at\":null,\"permission\":{\"id\":1,\"comp_code\":\"********\",\"role_id\":1,\"module_id\":1,\"isRead\":1,\"isAdd\":1,\"isDelete\":1,\"idEdit\":1,\"isPrint\":1,\"isExport\":1,\"isCancel\":1,\"isApprove\":1,\"isMauthor\":1}},{\"id\":2,\"module\":\"\\u0e04\\u0e33\\u0e15\\u0e2d\\u0e19\",\"route\":\"AnswerController\",\"description\":\"\\u0e04\\u0e33\\u0e15\\u0e2d\\u0e1a\",\"parent\":0,\"level\":0,\"doctype\":null,\"status\":1,\"created_by\":\"system\",\"updated_by\":\"system\",\"update_at\":\"2017-08-21 11:23:02\",\"creatd_at\":\"2017-08-21 11:23:02\",\"deleted_at\":null,\"permission\":{\"id\":2,\"comp_code\":\"********\",\"role_id\":1,\"module_id\":2,\"isRead\":1,\"isAdd\":1,\"isDelete\":1,\"idEdit\":1,\"isPrint\":1,\"isExport\":1,\"isCancel\":1,\"isApprove\":1,\"isMauthor\":0}},{\"id\":3,\"module\":\"forall\",\"route\":\"Forallcontroller\",\"description\":\"sharemodule\",\"parent\":0,\"level\":0,\"doctype\":null,\"status\":1,\"created_by\":\"system\",\"updated_by\":\"system\",\"update_at\":\"2017-08-21 11:23:02\",\"creatd_at\":\"2017-08-21 11:23:02\",\"deleted_at\":null,\"permission\":{\"id\":3,\"comp_code\":\"********\",\"role_id\":1,\"module_id\":3,\"isRead\":1,\"isAdd\":1,\"isDelete\":0,\"idEdit\":0,\"isPrint\":1,\"isExport\":1,\"isCancel\":0,\"isApprove\":0,\"isMauthor\":0}}]', '2017-08-21 14:56:27', '2017-08-21 18:19:52', null, 'system', 'system');
INSERT INTO `users_copy` VALUES ('30', 'datazuser', '$2y$10$QmnPdmP9.j2Ift9SzlWF7.0CgDSblRx.6rI6mQj5GDCU3c8eW0a7K', '2', '1', 'DATAZ', '3', '1', '0', '3', null, '2017-08-21 15:20:35', '2017-08-21 15:20:35', null, 'system', 'system');
INSERT INTO `users_copy` VALUES ('31', 'tim', '$2y$10$g8/rG3iEV1ToiXirILP0H.iX54F7Fexb/xB5AGCSgVU7.PVdCXroW', '2', '1', '-1', '26', '0', '0', '4', null, '2017-08-21 15:47:30', '2017-08-21 15:47:39', null, 'system', 'system');
INSERT INTO `users_copy` VALUES ('32', 'chaijan', '$2y$10$tU7/N9vOtWSelSj5.grJpO2pL2N.45kIA0DhoAW3h7tPFj8sAcTby', '1', '1', '0001-00000000-599a74df-b99d-a7182cf6', '25', '1', '0', '29', null, '2017-08-21 21:56:03', '2017-08-21 21:56:03', null, 'system', 'system');

-- ----------------------------
-- Table structure for users_copy1
-- ----------------------------
DROP TABLE IF EXISTS `users_copy1`;
CREATE TABLE `users_copy1` (
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
-- Records of users_copy1
-- ----------------------------
INSERT INTO `users_copy1` VALUES ('1', 'xxxx', 'secret', '2', '1', 'DATAA', '1', '1', '0', '2', null, '2017-08-19 17:43:36', '2017-08-20 23:46:02', null, 'system', 'system');
INSERT INTO `users_copy1` VALUES ('2', 'admin', 'secret', '1', '1', 'DATAA', '0', '1', '0', '0', null, '2017-08-19 17:43:36', '2017-08-20 23:46:51', null, 'system', 'system');
INSERT INTO `users_copy1` VALUES ('3', 'manager', 'secret', '1', '1', 'DATAZ', '3', '1', '0', '0', null, '2017-08-19 17:43:36', '2017-08-21 12:01:26', null, 'system', 'system');
INSERT INTO `users_copy1` VALUES ('4', 'tlen', '4105', '1', '1', '-1', '1', '0', '1', '0', null, '2017-08-19 17:43:36', '2017-08-20 23:46:04', null, 'system', 'system');
INSERT INTO `users_copy1` VALUES ('5', 'test', 'secret', '2', '1', 'DATAZ', '3', '1', '0', '3', null, '2017-08-19 17:43:36', '2017-08-21 12:02:48', null, 'system', 'system');
INSERT INTO `users_copy1` VALUES ('27', 'teststaff', '$2y$10$eKlpi/8vMoDe13jNedMq9eVyKK1pR0qv2OfHuVCwGtqvAaEYbh1Pa', '2', '1', '0001-00000000-599a74df-b99d-a7182cf6', '24', '1', '0', '29', null, '2017-08-21 14:52:18', '2017-08-21 15:16:32', null, 'system', 'system');
INSERT INTO `users_copy1` VALUES ('28', 'testuser', '$2y$10$t0ykXLxnvMc6j5H4T8ZVEuSOIbRI3CFpwmPKOAsCfC7WOPAw7QX12', '3', '1', '0001-00000000-599a74df-b99d-a7182cf6', '24', '1', '0', '29', null, '2017-08-21 14:52:55', '2017-08-21 15:19:22', null, 'system', 'system');
INSERT INTO `users_copy1` VALUES ('29', 'tomato', '$2y$10$kvAv36SMj45LBZ.Js.dAvOMDuHO23IQ6GxyQBzRZNT2qrsVz4aQ6.', '1', '1', '0001-00000000-599a74df-b99d-a7182cf6', '25', '1', '0', '0', '[{\"id\":1,\"module\":\"\\u0e02\\u0e49\\u0e2d\\u0e2a\\u0e2d\\u0e1a\",\"route\":\"QuestionController\",\"description\":\"\\u0e02\\u0e49\\u0e2d\\u0e2a\\u0e2d\\u0e1a\",\"parent\":0,\"level\":0,\"doctype\":null,\"status\":1,\"created_by\":\"system\",\"updated_by\":\"system\",\"update_at\":\"2017-08-21 11:23:02\",\"creatd_at\":\"2017-08-21 11:23:02\",\"deleted_at\":null,\"permission\":{\"id\":1,\"comp_code\":\"********\",\"role_id\":1,\"module_id\":1,\"isRead\":1,\"isAdd\":1,\"isDelete\":1,\"idEdit\":1,\"isPrint\":1,\"isExport\":1,\"isCancel\":1,\"isApprove\":1,\"isMauthor\":1}},{\"id\":2,\"module\":\"\\u0e04\\u0e33\\u0e15\\u0e2d\\u0e19\",\"route\":\"AnswerController\",\"description\":\"\\u0e04\\u0e33\\u0e15\\u0e2d\\u0e1a\",\"parent\":0,\"level\":0,\"doctype\":null,\"status\":1,\"created_by\":\"system\",\"updated_by\":\"system\",\"update_at\":\"2017-08-21 11:23:02\",\"creatd_at\":\"2017-08-21 11:23:02\",\"deleted_at\":null,\"permission\":{\"id\":2,\"comp_code\":\"********\",\"role_id\":1,\"module_id\":2,\"isRead\":1,\"isAdd\":1,\"isDelete\":1,\"idEdit\":1,\"isPrint\":1,\"isExport\":1,\"isCancel\":1,\"isApprove\":1,\"isMauthor\":0}},{\"id\":3,\"module\":\"forall\",\"route\":\"Forallcontroller\",\"description\":\"sharemodule\",\"parent\":0,\"level\":0,\"doctype\":null,\"status\":1,\"created_by\":\"system\",\"updated_by\":\"system\",\"update_at\":\"2017-08-21 11:23:02\",\"creatd_at\":\"2017-08-21 11:23:02\",\"deleted_at\":null,\"permission\":{\"id\":3,\"comp_code\":\"********\",\"role_id\":1,\"module_id\":3,\"isRead\":1,\"isAdd\":1,\"isDelete\":0,\"idEdit\":0,\"isPrint\":1,\"isExport\":1,\"isCancel\":0,\"isApprove\":0,\"isMauthor\":0}}]', '2017-08-21 14:56:27', '2017-08-21 18:19:52', null, 'system', 'system');
INSERT INTO `users_copy1` VALUES ('30', 'datazuser', '$2y$10$QmnPdmP9.j2Ift9SzlWF7.0CgDSblRx.6rI6mQj5GDCU3c8eW0a7K', '2', '1', 'DATAZ', '3', '1', '0', '3', null, '2017-08-21 15:20:35', '2017-08-21 15:20:35', null, 'system', 'system');
INSERT INTO `users_copy1` VALUES ('31', 'tim', '$2y$10$g8/rG3iEV1ToiXirILP0H.iX54F7Fexb/xB5AGCSgVU7.PVdCXroW', '2', '1', '-1', '26', '0', '0', '4', null, '2017-08-21 15:47:30', '2017-08-21 15:47:39', null, 'system', 'system');
INSERT INTO `users_copy1` VALUES ('32', 'chaijan', '$2y$10$tU7/N9vOtWSelSj5.grJpO2pL2N.45kIA0DhoAW3h7tPFj8sAcTby', '1', '1', '0001-00000000-599a74df-b99d-a7182cf6', '25', '1', '0', '29', null, '2017-08-21 21:56:03', '2017-08-21 21:56:03', null, 'system', 'system');
SET FOREIGN_KEY_CHECKS=1;
