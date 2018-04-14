/*
Navicat MySQL Data Transfer

Source Server         : Own
Source Server Version : 50720
Source Host           : 127.0.0.1:3306
Source Database       : irs1

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2018-04-14 14:44:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_admin
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin`;
CREATE TABLE `tb_admin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `salt` varchar(5) DEFAULT '',
  `fullname` varchar(50) NOT NULL COMMENT '全名',
  `e_mail` varchar(100) DEFAULT NULL,
  `sex` varchar(1) NOT NULL COMMENT '性别：0女，1男,2保密',
  `birthday` date NOT NULL,
  `address` varchar(100) NOT NULL COMMENT '地址',
  `phone` varchar(20) NOT NULL COMMENT '手机号',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色编号',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `tb_admin_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `tb_roles` (`role_id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_admin
-- ----------------------------
INSERT INTO `tb_admin` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', null, 'arthur', 'isduxd@163.com', '1', '1994-11-08', '北京市通州区科创十四街', '17693109997', '1');
INSERT INTO `tb_admin` VALUES ('18', 'test', 'e10adc3949ba59abbe56e057f20f883e', null, 'test', 'test@test.com', '1', '2018-02-25', '甘肃省兰州市榆中县和平镇', '17601038192', null);
INSERT INTO `tb_admin` VALUES ('20', 'test2', 'e10adc3949ba59abbe56e057f20f883e', null, 'test2', 'test2@qq.com', '1', '2018-03-06', '北京通州科创十四街区', '17693109923', null);

-- ----------------------------
-- Table structure for tb_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_log`;
CREATE TABLE `tb_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `operation` varchar(50) NOT NULL COMMENT '操作',
  `method` varchar(100) NOT NULL COMMENT '执行方法',
  `params` varchar(500) NOT NULL COMMENT '请求参数',
  `ip` varchar(64) NOT NULL COMMENT 'ip',
  `create_time` datetime NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=296 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_log
-- ----------------------------
INSERT INTO `tb_log` VALUES ('20', 'admin', '批量删除日志', 'com.irs.controller.LogController.delLogs', '14,12;', '0:0:0:0:0:0:0:1', '2018-02-20 18:03:13');
INSERT INTO `tb_log` VALUES ('22', 'admin', '添加用户', 'com.irs.controller.UserManagementController.insUser', 'TbUsers [uid=null, eMail=isduxd@gmail.com, nickname=test1, sex=0, birthday=2018-02-14, address=北京通州科创十四街区, phone=17693109923, eCode=null, status=null, createTime=null];', '0:0:0:0:0:0:0:1', '2018-02-20 19:01:39');
INSERT INTO `tb_log` VALUES ('23', 'admin', '更新角色信息', 'com.irs.controller.AdminController.updRole', 'TbRoles [roleId=24, roleName=测试用例, roleRemark=测试用例];1,2,4,5,6,9,10,12,13;', '127.0.0.1', '2018-02-20 19:22:01');
INSERT INTO `tb_log` VALUES ('24', 'test2', '更新评论状态', 'com.irs.controller.CommentController.updComment', 'TbComment [commentId=8, createTime=null, userId=null, newsId=null, status=1, commentText=null];', '127.0.0.1', '2018-02-20 19:23:32');
INSERT INTO `tb_log` VALUES ('25', 'admin', '更新管理员信息', 'com.irs.controller.AdminController.updAdmin', 'TbAdmin [id=17, username=test2, password=null, fullname=test2, eMail=fsdfs@163.com, sex=1, birthday=2018-02-20, address=北京通州科创十四街区, phone=11111111111, roleId=24, roleName=null];', '0:0:0:0:0:0:0:1', '2018-02-20 21:55:45');
INSERT INTO `tb_log` VALUES ('26', 'admin', '添加角色信息', 'com.irs.controller.AdminController.insRole', 'TbRoles [roleId=null, roleName=test, roleRemark=test];1,2,4,5,8,9,11,12,13,14,15;', '0:0:0:0:0:0:0:1', '2018-02-20 21:56:13');
INSERT INTO `tb_log` VALUES ('27', 'admin', '更新管理员信息', 'com.irs.controller.AdminController.updAdmin', 'TbAdmin [id=16, username=test, password=null, fullname=test, eMail=test@163.com, sex=0, birthday=2018-02-14, address=甘肃省兰州市榆中县和平镇, phone=17601038123, roleId=25, roleName=null];', '0:0:0:0:0:0:0:1', '2018-02-20 21:56:24');
INSERT INTO `tb_log` VALUES ('28', 'test', '根据ID删除日志', 'com.irs.controller.LogController.delLogById', '16;', '0:0:0:0:0:0:0:1', '2018-02-20 21:56:55');
INSERT INTO `tb_log` VALUES ('29', 'test', '更新评论状态', 'com.irs.controller.CommentController.updComment', 'TbComment [commentId=8, createTime=null, userId=null, newsId=null, status=0, commentText=null];', '0:0:0:0:0:0:0:1', '2018-02-20 21:57:19');
INSERT INTO `tb_log` VALUES ('30', 'test', '批量删除日志', 'com.irs.controller.LogController.delLogs', '1;', '0:0:0:0:0:0:0:1', '2018-02-20 22:06:27');
INSERT INTO `tb_log` VALUES ('31', 'test', '批量删除日志', 'com.irs.controller.LogController.delLogs', '21;', '0:0:0:0:0:0:0:1', '2018-02-20 22:09:13');
INSERT INTO `tb_log` VALUES ('32', 'test', '更新评论状态', 'com.irs.controller.CommentController.updComment', 'TbComment [commentId=8, createTime=null, userId=null, newsId=null, status=1, commentText=null];', '0:0:0:0:0:0:0:1', '2018-02-20 22:10:22');
INSERT INTO `tb_log` VALUES ('33', 'test', '维护新闻的状态', 'com.irs.controller.InformationController.updNewsStatusById', 'ac30aba360d6446e8710223f21c939fd499;1;', '0:0:0:0:0:0:0:1', '2018-02-20 22:10:37');
INSERT INTO `tb_log` VALUES ('34', 'test', '维护新闻的状态', 'com.irs.controller.InformationController.updNewsStatusById', 'ac30aba360d6446e8710223f21c939fd499;0;', '0:0:0:0:0:0:0:1', '2018-02-20 22:10:39');
INSERT INTO `tb_log` VALUES ('35', 'admin', '添加角色信息', 'com.irs.controller.AdminController.insRole', 'TbRoles [roleId=null, roleName=test2, roleRemark=test2];1;', '0:0:0:0:0:0:0:1', '2018-02-20 22:11:28');
INSERT INTO `tb_log` VALUES ('36', 'admin', '更新管理员信息', 'com.irs.controller.AdminController.updAdmin', 'TbAdmin [id=17, username=test2, password=null, fullname=test2, eMail=fsdfs@163.com, sex=1, birthday=2018-02-20, address=北京通州科创十四街区, phone=11111111111, roleId=26, roleName=null];', '0:0:0:0:0:0:0:1', '2018-02-20 22:12:39');
INSERT INTO `tb_log` VALUES ('38', 'admin', '根据ID删除日志', 'com.irs.controller.LogController.delLogById', '37;', '0:0:0:0:0:0:0:1', '2018-02-20 22:20:03');
INSERT INTO `tb_log` VALUES ('39', 'admin', '更新角色信息', 'com.irs.controller.AdminController.updRole', 'TbRoles [roleId=26, roleName=test2, roleRemark=test2];1;', '0:0:0:0:0:0:0:1', '2018-02-20 22:20:11');
INSERT INTO `tb_log` VALUES ('40', 'admin', '更新角色信息', 'com.irs.controller.AdminController.updRole', 'TbRoles [roleId=26, roleName=test2, roleRemark=test2];1;', '0:0:0:0:0:0:0:1', '2018-02-21 12:40:31');
INSERT INTO `tb_log` VALUES ('41', 'admin', '添加角色信息', 'com.irs.controller.AdminController.insRole', 'TbRoles [roleId=null, roleName=fsdf, roleRemark=sdfsf];1;', '0:0:0:0:0:0:0:1', '2018-02-21 12:41:36');
INSERT INTO `tb_log` VALUES ('42', 'admin', '更新管理员信息', 'com.irs.controller.AdminController.updAdmin', 'TbAdmin [id=17, username=test2, password=null, fullname=test2, eMail=fsdfs@163.com, sex=1, birthday=2018-02-20, address=北京通州科创十四街区, phone=11111111111, roleId=27, roleName=null];', '0:0:0:0:0:0:0:1', '2018-02-21 12:41:52');
INSERT INTO `tb_log` VALUES ('43', 'admin', '更新角色信息', 'com.irs.controller.AdminController.updRole', 'TbRoles [roleId=27, roleName=fsdf, roleRemark=sdfsf];1,2,3,2,4;', '0:0:0:0:0:0:0:1', '2018-02-21 12:43:58');
INSERT INTO `tb_log` VALUES ('44', 'test2', '更新角色信息', 'com.irs.controller.AdminController.updRole', 'TbRoles [roleId=27, roleName=fsdf, roleRemark=sdfsf];1,2,3,2,4;', '0:0:0:0:0:0:0:1', '2018-02-21 12:44:31');
INSERT INTO `tb_log` VALUES ('45', 'test2', '更新管理员信息', 'com.irs.controller.AdminController.updAdmin', 'TbAdmin [id=17, username=test2, password=null, fullname=test2, eMail=fsdfs@163.com, sex=1, birthday=2018-02-20, address=北京通州科创十四街区, phone=11111111111, roleId=27, roleName=null];', '0:0:0:0:0:0:0:1', '2018-02-21 12:44:37');
INSERT INTO `tb_log` VALUES ('46', 'admin', '更新管理员信息', 'com.irs.controller.AdminController.updAdmin', 'TbAdmin [id=1, username=admin, password=null, fullname=arthur, eMail=isduxd@163.com, sex=0, birthday=1994-11-08, address=北京市通州区科创十四街, phone=17693109997, roleId=1, roleName=null];', '0:0:0:0:0:0:0:1', '2018-02-21 12:56:52');
INSERT INTO `tb_log` VALUES ('47', 'admin', '更新管理员信息', 'com.irs.controller.AdminController.updAdmin', 'TbAdmin [id=1, username=admin, password=null, fullname=arthur, eMail=isduxd@163.com, sex=1, birthday=1994-11-08, address=北京市通州区科创十四街, phone=17693109997, roleId=1, roleName=null];', '0:0:0:0:0:0:0:1', '2018-02-21 12:56:59');
INSERT INTO `tb_log` VALUES ('48', 'admin', '更新管理员信息', 'com.irs.controller.AdminController.updAdmin', 'TbAdmin [id=1, username=admin, password=null, fullname=arthur, eMail=isduxd@163.com, sex=1, birthday=1994-11-08, address=北京市通州区科创十四街, phone=17693109997, roleId=1, roleName=null];', '0:0:0:0:0:0:0:1', '2018-02-21 13:01:01');
INSERT INTO `tb_log` VALUES ('49', 'admin', '更新管理员信息', 'com.irs.controller.AdminController.updAdmin', 'TbAdmin [id=1, username=admin, password=null, fullname=arthur, eMail=isduxd@163.com, sex=1, birthday=1994-11-08, address=北京市通州区科创十四街, phone=17693109997, roleId=1, roleName=null];', '0:0:0:0:0:0:0:1', '2018-02-21 13:01:18');
INSERT INTO `tb_log` VALUES ('50', 'admin', '更新管理员信息', 'com.irs.controller.AdminController.updAdmin', 'TbAdmin [id=1, username=admin, password=null, fullname=arthur, eMail=isduxd@163.com, sex=1, birthday=1994-11-08, address=北京市通州区科创十四街, phone=17693109997, roleId=1, roleName=null];', '0:0:0:0:0:0:0:1', '2018-02-21 13:01:22');
INSERT INTO `tb_log` VALUES ('51', 'admin', '更新管理员信息', 'com.irs.controller.AdminController.updAdmin', 'TbAdmin [id=1, username=admin, password=null, fullname=arthur, eMail=isduxd@163.com, sex=1, birthday=1994-11-08, address=北京市通州区科创十四街, phone=17693109997, roleId=1, roleName=null];', '0:0:0:0:0:0:0:1', '2018-02-21 13:01:26');
INSERT INTO `tb_log` VALUES ('52', 'admin', '更新管理员信息', 'com.irs.controller.AdminController.updAdmin', 'TbAdmin [id=1, username=admin, password=null, fullname=arthur, eMail=isduxd@163.com, sex=1, birthday=1994-11-08, address=北京市通州区科创十四街, phone=17693109997, roleId=1, roleName=null];', '0:0:0:0:0:0:0:1', '2018-02-21 13:01:53');
INSERT INTO `tb_log` VALUES ('53', 'admin', '更新管理员信息', 'com.irs.controller.AdminController.updAdmin', 'TbAdmin [id=1, username=admin, password=null, fullname=arthur, eMail=isduxd@163.com, sex=1, birthday=1994-11-08, address=北京市通州区科创十四街, phone=17693109997, roleId=1, roleName=null];', '0:0:0:0:0:0:0:1', '2018-02-21 13:01:55');
INSERT INTO `tb_log` VALUES ('54', 'admin', '更新管理员信息', 'com.irs.controller.AdminController.updAdmin', 'TbAdmin [id=1, username=admin, password=null, fullname=arthur, eMail=isduxd@163.com, sex=1, birthday=1994-11-08, address=北京市通州区科创十四街, phone=17693109997, roleId=1, roleName=null];', '0:0:0:0:0:0:0:1', '2018-02-21 13:01:57');
INSERT INTO `tb_log` VALUES ('55', 'admin', '更新管理员信息', 'com.irs.controller.AdminController.updAdmin', 'TbAdmin [id=1, username=admin, password=null, fullname=arthur, eMail=isduxd@163.com, sex=1, birthday=1994-11-08, address=北京市通州区科创十四街, phone=17693109997, roleId=1, roleName=null];', '0:0:0:0:0:0:0:1', '2018-02-21 13:02:20');
INSERT INTO `tb_log` VALUES ('56', 'admin', '更新管理员信息', 'com.irs.controller.AdminController.updAdmin', 'TbAdmin [id=1, username=admin, password=null, fullname=arthur, eMail=isduxd@163.com, sex=1, birthday=1994-11-08, address=北京市通州区科创十四街, phone=17693109997, roleId=1, roleName=null];', '0:0:0:0:0:0:0:1', '2018-02-21 13:02:21');
INSERT INTO `tb_log` VALUES ('57', 'admin', '更新管理员信息', 'com.irs.controller.AdminController.updAdmin', 'TbAdmin [id=1, username=admin, password=null, fullname=arthur, eMail=isduxd@163.com, sex=1, birthday=1994-11-08, address=北京市通州区科创十四街, phone=17693109997, roleId=1, roleName=null];', '0:0:0:0:0:0:0:1', '2018-02-21 13:02:23');
INSERT INTO `tb_log` VALUES ('58', 'admin', '更新管理员信息', 'com.irs.controller.AdminController.updAdmin', 'TbAdmin [id=1, username=admin, password=null, fullname=arthur, eMail=isduxd@163.com, sex=1, birthday=1994-11-08, address=北京市通州区科创十四街, phone=17693109997, roleId=1, roleName=null];', '0:0:0:0:0:0:0:1', '2018-02-21 13:02:24');
INSERT INTO `tb_log` VALUES ('59', 'admin', '更新管理员信息', 'com.irs.controller.AdminController.updAdmin', 'TbAdmin [id=1, username=admin, password=null, fullname=arthur, eMail=isduxd@163.com, sex=1, birthday=1994-11-08, address=北京市通州区科创十四街, phone=17693109997, roleId=1, roleName=null];', '0:0:0:0:0:0:0:1', '2018-02-21 13:02:37');
INSERT INTO `tb_log` VALUES ('60', 'admin', '更新管理员信息', 'com.irs.controller.AdminController.updAdmin', 'TbAdmin [id=1, username=admin, password=null, fullname=arthur, eMail=isduxd@163.com, sex=1, birthday=1994-11-08, address=北京市通州区科创十四街, phone=17693109997, roleId=1, roleName=null];', '0:0:0:0:0:0:0:1', '2018-02-21 13:02:37');
INSERT INTO `tb_log` VALUES ('71', 'admin', '批量删除日志', 'com.irs.controller.LogController.delLogs', '70,69,68,67,66,65,64,63,62,61;', '0:0:0:0:0:0:0:1', '2018-02-21 13:10:44');
INSERT INTO `tb_log` VALUES ('72', 'admin', '新增新闻', 'com.irs.controller.InformationController.createNews', 'com.irs.pojo.TbNews@c2eba4;org.apache.catalina.connector.RequestFacade@fc5f73;', '0:0:0:0:0:0:0:1', '2018-02-21 13:12:27');
INSERT INTO `tb_log` VALUES ('73', 'admin', '新增新闻', 'com.irs.controller.InformationController.createNews', 'com.irs.pojo.TbNews@104fa3f;org.apache.catalina.connector.RequestFacade@1c969b4;', '0:0:0:0:0:0:0:1', '2018-02-21 13:14:02');
INSERT INTO `tb_log` VALUES ('74', 'admin', '更新新闻', 'com.irs.controller.InformationController.updNews', 'com.irs.pojo.TbNews@13c6923;org.apache.catalina.connector.RequestFacade@1c969b4;', '0:0:0:0:0:0:0:1', '2018-02-21 13:14:36');
INSERT INTO `tb_log` VALUES ('78', 'admin', '维护新闻的状态', 'com.irs.controller.InformationController.updNewsStatusById', 'a1b4417d49524654b906113d5fff5306278;1;', '0:0:0:0:0:0:0:1', '2018-02-21 13:15:28');
INSERT INTO `tb_log` VALUES ('79', 'admin', '批量推荐指定的新闻', 'com.irs.controller.InformationController.recommendNews', 'a1b4417d49524654b906113d5fff5306278,d9471295568e4388a781bb4234cc4980961;', '0:0:0:0:0:0:0:1', '2018-02-21 13:15:39');
INSERT INTO `tb_log` VALUES ('80', 'admin', '批量删除日志', 'com.irs.controller.LogController.delLogs', '77,76,75;', '0:0:0:0:0:0:0:1', '2018-02-21 13:16:02');
INSERT INTO `tb_log` VALUES ('84', 'test2', '更新角色信息', 'com.irs.controller.AdminController.updRole', 'TbRoles [roleId=27, roleName=fsdf, roleRemark=sdfsf];1,2,3,2,4;', '127.0.0.1', '2018-02-21 13:33:24');
INSERT INTO `tb_log` VALUES ('85', 'admin', '批量删除日志', 'com.irs.controller.LogController.delLogs', '83,82,81;', '127.0.0.1', '2018-02-21 13:38:27');
INSERT INTO `tb_log` VALUES ('86', 'admin', '更新管理员信息', 'com.irs.controller.AdminController.updAdmin', 'TbAdmin [id=17, username=test2, password=null, fullname=test2, eMail=fsdfs@163.com, sex=1, birthday=2018-02-20, address=北京通州科创十四街区, phone=11111111111, roleId=27, roleName=null];', '0:0:0:0:0:0:0:1', '2018-02-21 15:07:41');
INSERT INTO `tb_log` VALUES ('87', 'admin', '添加角色信息', 'com.irs.controller.AdminController.insRole', 'TbRoles [roleId=null, roleName=qweqe, roleRemark=qweqweq];1,3,17,2,4,9,10;', '0:0:0:0:0:0:0:1', '2018-02-23 14:39:38');
INSERT INTO `tb_log` VALUES ('88', 'admin', '删除指定角色信息', 'com.irs.controller.AdminController.delRole', '34;', '0:0:0:0:0:0:0:1', '2018-02-23 14:41:03');
INSERT INTO `tb_log` VALUES ('89', 'admin', '删除指定角色信息', 'com.irs.controller.AdminController.delRole', '33;', '0:0:0:0:0:0:0:1', '2018-02-23 14:41:06');
INSERT INTO `tb_log` VALUES ('90', 'admin', '删除指定角色信息', 'com.irs.controller.AdminController.delRole', '32;', '0:0:0:0:0:0:0:1', '2018-02-23 14:41:15');
INSERT INTO `tb_log` VALUES ('91', 'admin', '删除指定角色信息', 'com.irs.controller.AdminController.delRole', '31;', '0:0:0:0:0:0:0:1', '2018-02-23 14:41:17');
INSERT INTO `tb_log` VALUES ('92', 'admin', '删除指定角色信息', 'com.irs.controller.AdminController.delRole', '30;', '0:0:0:0:0:0:0:1', '2018-02-23 14:41:19');
INSERT INTO `tb_log` VALUES ('93', 'admin', '删除指定角色信息', 'com.irs.controller.AdminController.delRole', '29;', '0:0:0:0:0:0:0:1', '2018-02-23 14:41:20');
INSERT INTO `tb_log` VALUES ('94', 'admin', '删除指定角色信息', 'com.irs.controller.AdminController.delRole', '28;', '0:0:0:0:0:0:0:1', '2018-02-23 14:41:22');
INSERT INTO `tb_log` VALUES ('95', 'admin', '添加角色信息', 'com.irs.controller.AdminController.insRole', 'TbRoles [roleId=null, roleName=qwee, roleRemark=qweqwe];1,3,17,6,20;', '0:0:0:0:0:0:0:1', '2018-02-23 14:42:44');
INSERT INTO `tb_log` VALUES ('96', 'admin', '删除指定角色信息', 'com.irs.controller.AdminController.delRole', '24;', '0:0:0:0:0:0:0:1', '2018-02-23 14:46:04');
INSERT INTO `tb_log` VALUES ('97', 'admin', '删除指定角色信息', 'com.irs.controller.AdminController.delRole', '25;', '0:0:0:0:0:0:0:1', '2018-02-23 14:46:07');
INSERT INTO `tb_log` VALUES ('98', 'admin', '删除指定角色信息', 'com.irs.controller.AdminController.delRole', '26;', '0:0:0:0:0:0:0:1', '2018-02-23 14:46:09');
INSERT INTO `tb_log` VALUES ('99', 'admin', '删除指定角色信息', 'com.irs.controller.AdminController.delRole', '27;', '0:0:0:0:0:0:0:1', '2018-02-23 14:46:10');
INSERT INTO `tb_log` VALUES ('100', 'admin', '删除指定角色信息', 'com.irs.controller.AdminController.delRole', '35;', '0:0:0:0:0:0:0:1', '2018-02-23 14:46:12');
INSERT INTO `tb_log` VALUES ('101', 'admin', '添加角色信息', 'com.irs.controller.AdminController.insRole', 'TbRoles [roleId=null, roleName=qweq, roleRemark=eqweqwe];1,3,16,4,20,4,21,4,22;', '0:0:0:0:0:0:0:1', '2018-02-23 14:49:43');
INSERT INTO `tb_log` VALUES ('102', 'admin', '添加角色信息', 'com.irs.controller.AdminController.insRole', 'TbRoles [roleId=null, roleName=test, roleRemark=test];1,3,18,4,21,7,28,8,31,11,37,13,41,15,43;', '0:0:0:0:0:0:0:1', '2018-02-23 15:13:13');
INSERT INTO `tb_log` VALUES ('103', 'admin', '删除指定角色信息', 'com.irs.controller.AdminController.delRole', '37;', '0:0:0:0:0:0:0:1', '2018-02-23 15:13:25');
INSERT INTO `tb_log` VALUES ('104', 'admin', '删除指定角色信息', 'com.irs.controller.AdminController.delRole', '36;', '0:0:0:0:0:0:0:1', '2018-02-23 15:13:27');
INSERT INTO `tb_log` VALUES ('105', 'admin', '更新角色信息', 'com.irs.controller.AdminController.updRole', 'TbRoles [roleId=1, roleName=超级管理员, roleRemark=超级管理员];1,3,16,3,17,3,18,3,19,4,20,4,21,4,22,4,23,6,24,7,25,7,26,7,27,7,28,8,29,8,30,8,31,8,32,10,33,11,34,11,35,11,36,11,37,13,38,13,39,13,40,13,41,15,42,15,43,15,44,15,45;', '0:0:0:0:0:0:0:1', '2018-02-23 15:16:55');
INSERT INTO `tb_log` VALUES ('106', 'admin', '添加角色信息', 'com.irs.controller.AdminController.insRole', 'TbRoles [roleId=null, roleName=超级管理员, roleRemark=超级管理员];1,3,16,3,17,3,18,3,19,4,20,4,21,4,22,4,23,6,24,7,25,7,26,7,27,7,28,8,29,8,30,8,31,8,32,10,33,11,34,11,35,11,36,11,37,13,38,13,39,13,40,13,41,15,42,15,43,15,44,15,45;', '0:0:0:0:0:0:0:1', '2018-02-23 15:17:34');
INSERT INTO `tb_log` VALUES ('107', 'admin', '更新角色信息', 'com.irs.controller.AdminController.updRole', 'TbRoles [roleId=null, roleName=null, roleRemark=null];null;', '0:0:0:0:0:0:0:1', '2018-02-23 15:21:28');
INSERT INTO `tb_log` VALUES ('108', 'admin', '更新角色信息', 'com.irs.controller.AdminController.updRole', 'TbRoles [roleId=1, roleName=超级管理员, roleRemark=超级管理员];1,3,16,3,17,3,18,3,19,4,20,4,21,4,22,4,23,6,24,7,25,7,26,7,27,7,28,8,29,8,30,8,31,8,32,10,33,11,34,11,35,11,36,11,37,13,38,13,39,13,40,13,41,15,42,15,43,15,44,15,45;', '0:0:0:0:0:0:0:1', '2018-02-23 15:34:20');
INSERT INTO `tb_log` VALUES ('109', 'admin', '更新角色信息', 'com.irs.controller.AdminController.updRole', 'TbRoles [roleId=1, roleName=超级管理员, roleRemark=超级管理员];1,3,216,3,217,3,218,3,219,4,220,4,221,4,222,4,223,6,524,7,525,7,526,7,527,7,528,8,529,8,530,8,531,8,532,10,933,11,934,11,935,11,936,11,937,13,1238,13,1239,13,1240,13,1241,15,1442,15,1443,15,1444,15,1445;', '0:0:0:0:0:0:0:1', '2018-02-23 15:39:02');
INSERT INTO `tb_log` VALUES ('110', 'admin', '更新角色信息', 'com.irs.controller.AdminController.updRole', 'TbRoles [roleId=1, roleName=超级管理员, roleRemark=超级管理员];1,3,2,16,3,2,17,3,2,18,3,2,19,4,2,20,4,2,21,4,2,22,4,2,23,6,5,24,7,5,25,7,5,26,7,5,27,7,5,28,8,5,29,8,5,30,8,5,31,8,5,32,10,9,33,11,9,34,11,9,35,11,9,36,11,9,37,13,12,38,13,12,39,13,12,40,13,12,41,15,14,42,15,14,43,15,14,44,15,14,45;', '0:0:0:0:0:0:0:1', '2018-02-23 15:41:23');
INSERT INTO `tb_log` VALUES ('111', 'admin', '更新角色信息', 'com.irs.controller.AdminController.updRole', 'TbRoles [roleId=1, roleName=超级管理员, roleRemark=超级管理员];1,3,2,16,3,2,17,3,2,18,3,2,19,4,2,20,4,2,21,4,2,22,4,2,23,6,5,24,7,5,25,7,5,26,7,5,27,7,5,28,8,5,29,8,5,30,8,5,31,8,5,32,10,9,33,11,9,34,11,9,35,11,9,36,11,9,37,13,12,38,13,12,39,13,12,40,13,12,41,15,14,42,15,14,43,15,14,44,15,14,45;', '0:0:0:0:0:0:0:1', '2018-02-23 15:42:32');
INSERT INTO `tb_log` VALUES ('112', 'admin', '更新角色信息', 'com.irs.controller.AdminController.updRole', 'TbRoles [roleId=1, roleName=超级管理员, roleRemark=超级管理员];1,3,2,16,16,3,2,17,17,3,2,18,18,3,2,19,19,4,2,20,20,4,2,21,21,4,2,22,22,4,2,23,23,6,5,24,24,7,5,25,25,7,5,26,26,7,5,27,27,7,5,28,28,8,5,29,29,8,5,30,30,8,5,31,31,8,5,32,32,10,9,33,33,11,9,34,34,11,9,35,35,11,9,36,36,11,9,37,37,13,12,38,38,13,12,39,39,13,12,40,40,13,12,41,41,15,14,42,42,15,14,43,43,15,14,44,44,15,14,45,45;', '0:0:0:0:0:0:0:1', '2018-02-23 15:43:59');
INSERT INTO `tb_log` VALUES ('113', 'admin', '更新角色信息', 'com.irs.controller.AdminController.updRole', 'TbRoles [roleId=1, roleName=超级管理员, roleRemark=超级管理员];3,2,16,3,2,17,3,2,18,3,2,19,4,2,20,4,2,21,4,2,22,4,2,23,6,5,24,7,5,25,7,5,26,7,5,27,7,5,28,8,5,29,8,5,30,8,5,31,8,5,32,10,9,33,11,9,34,11,9,35,11,9,36,11,9,37,13,12,38,13,12,39,13,12,40,13,12,41,15,14,42,15,14,43,15,14,44,15,14,45;', '0:0:0:0:0:0:0:1', '2018-02-23 15:46:36');
INSERT INTO `tb_log` VALUES ('114', 'admin', '更新角色信息', 'com.irs.controller.AdminController.updRole', 'TbRoles [roleId=1, roleName=超级管理员, roleRemark=超级管理员];1,3,2,16,16,3,2,17,17,3,2,18,18,3,2,19,19,4,2,20,20,4,2,21,21,4,2,22,22,4,2,23,23,6,5,24,24,7,5,25,25,7,5,26,26,7,5,27,27,7,5,28,28,8,5,29,29,8,5,30,30,8,5,31,31,8,5,32,32,10,9,33,33,11,9,34,34,11,9,35,35,11,9,36,36,11,9,37,37,13,12,38,38,13,12,39,39,13,12,40,40,13,12,41,41,15,14,42,42,15,14,43,43,15,14,44,44,15,14,45,45;', '0:0:0:0:0:0:0:1', '2018-02-23 15:47:12');
INSERT INTO `tb_log` VALUES ('115', 'admin', '更新角色信息', 'com.irs.controller.AdminController.updRole', 'TbRoles [roleId=1, roleName=超级管理员, roleRemark=超级管理员];1,3,16,3,17,3,18,3,19,4,20,4,21,4,22,4,23,6,24,7,25,7,26,7,27,7,28,8,29,8,30,8,31,8,32,10,33,11,34,11,35,11,36,11,37,13,38,13,39,13,40,13,41,15,42,15,43,15,44,15,45;', '0:0:0:0:0:0:0:1', '2018-02-23 15:49:37');
INSERT INTO `tb_log` VALUES ('116', 'admin', '更新角色信息', 'com.irs.controller.AdminController.updRole', 'TbRoles [roleId=1, roleName=超级管理员, roleRemark=超级管理员];1,3,16,3,17,3,18,3,19,4,20,4,21,4,22,4,23,6,24,7,25,7,26,7,27,7,28,8,29,8,30,8,31,8,32,10,33,11,34,11,35,11,36,11,37,13,38,13,39,13,40,13,41,15,42,15,43,15,44,15,45;', '0:0:0:0:0:0:0:1', '2018-02-23 15:53:05');
INSERT INTO `tb_log` VALUES ('117', 'admin', '更新角色信息', 'com.irs.controller.AdminController.updRole', 'TbRoles [roleId=1, roleName=超级管理员, roleRemark=超级管理员];1,3,16,3,17,3,18,3,19,4,20,4,21,4,22,4,23,6,24,7,25,7,26,7,27,7,28,8,29,8,30,8,31,8,32,10,33,11,34,11,35,11,36,11,37,13,38,13,39,13,40,13,41,15,42,15,43,15,44,15,45;', '0:0:0:0:0:0:0:1', '2018-02-23 15:54:59');
INSERT INTO `tb_log` VALUES ('118', 'admin', '更新角色信息', 'com.irs.controller.AdminController.updRole', 'TbRoles [roleId=1, roleName=超级管理员, roleRemark=超级管理员];1,3,16,3,17,3,18,3,19,4,20,4,21,4,22,4,23,6,24,7,25,7,26,7,27,7,28,8,29,8,30,8,31,8,32,10,33,11,34,11,35,11,36,11,37,13,38,13,39,13,40,13,41,15,42,15,43,15,44,15,45;', '0:0:0:0:0:0:0:1', '2018-02-23 15:56:31');
INSERT INTO `tb_log` VALUES ('119', 'admin', '更新角色信息', 'com.irs.controller.AdminController.updRole', 'TbRoles [roleId=1, roleName=超级管理员, roleRemark=超级管理员];1,3,16,3,17,3,18,3,19,4,20,4,21,4,22,4,23,6,24,7,25,7,26,7,27,7,28,8,29,8,30,8,31,8,32,10,33,11,34,11,35,11,36,11,37,13,38,13,39,13,40,13,41,15,42,15,43,15,44,15,45;', '0:0:0:0:0:0:0:1', '2018-02-23 16:00:36');
INSERT INTO `tb_log` VALUES ('120', 'admin', '更新角色信息', 'com.irs.controller.AdminController.updRole', 'TbRoles [roleId=1, roleName=超级管理员, roleRemark=超级管理员];1,3,16,3,17,3,18,3,19,4,20,4,21,4,22,4,23,6,24,7,25,7,26,7,27,7,28,8,29,8,30,8,31,8,32,10,33,11,34,11,35,11,36,11,37,13,38,13,39,13,40,13,41,15,42,15,43,15,44,15,45;', '0:0:0:0:0:0:0:1', '2018-02-23 16:01:15');
INSERT INTO `tb_log` VALUES ('121', 'admin', '更新角色信息', 'com.irs.controller.AdminController.updRole', 'TbRoles [roleId=1, roleName=超级管理员, roleRemark=超级管理员];1,3,16,3,17,3,18,3,19,4,20,4,21,4,22,4,23,6,24,7,25,7,26,7,27,7,28,8,29,8,30,8,31,8,32,10,33,11,34,11,35,11,36,11,37,13,38,13,39,13,40,13,41,15,42,15,43,15,44,15,45;', '0:0:0:0:0:0:0:1', '2018-02-23 16:01:40');
INSERT INTO `tb_log` VALUES ('122', 'admin', '更新角色信息', 'com.irs.controller.AdminController.updRole', 'TbRoles [roleId=1, roleName=超级管理员, roleRemark=超级管理员];1,3,16,3,17,3,18,3,19,4,20,4,21,4,22,4,23,6,24,7,25,7,26,7,27,7,28,8,29,8,30,8,31,8,32,10,33,11,34,11,35,11,36,11,37,13,38,13,39,13,40,13,41,15,42,15,43,15,44,15,45;', '0:0:0:0:0:0:0:1', '2018-02-24 16:28:17');
INSERT INTO `tb_log` VALUES ('123', 'admin', '更新角色信息', 'com.irs.controller.AdminController.updRole', 'TbRoles [roleId=1, roleName=超级管理员, roleRemark=超级管理员];1,3,16,3,17,3,18,3,19,4,20,4,21,4,22,4,23,6,24,7,25,7,26,7,27,7,28,8,29,8,30,8,31,8,32,10,33,11,34,11,35,11,36,11,37,13,38,13,39,13,40,13,41,15,42,15,43,15,44,15,45;', '0:0:0:0:0:0:0:1', '2018-02-24 16:30:44');
INSERT INTO `tb_log` VALUES ('124', 'admin', '更新角色信息', 'com.irs.controller.AdminController.updRole', 'TbRoles [roleId=1, roleName=超级管理员, roleRemark=超级管理员];1,3,16,3,17,3,18,3,19,4,20,4,21,4,22,4,23,6,24,7,25,7,26,7,27,7,28,8,29,8,30,8,31,8,32,10,33,11,34,11,35,11,36,11,37,13,38,13,39,13,40,13,41,15,42,15,43,15,44,15,45;', '0:0:0:0:0:0:0:1', '2018-02-24 16:35:51');
INSERT INTO `tb_log` VALUES ('125', 'admin', '更新角色信息', 'com.irs.controller.AdminController.updRole', 'TbRoles [roleId=1, roleName=超级管理员, roleRemark=超级管理员];1,3,16,3,17,3,18,3,19,4,20,4,21,4,22,4,23,6,24,7,25,7,26,7,27,7,28,8,29,8,30,8,31,8,32,10,33,11,34,11,35,11,36,11,37,13,38,13,39,13,40,13,41,15,42,15,43,15,44,15,45;', '0:0:0:0:0:0:0:1', '2018-02-24 16:36:34');
INSERT INTO `tb_log` VALUES ('126', 'admin', '更新角色信息', 'com.irs.controller.AdminController.updRole', 'TbRoles [roleId=1, roleName=超级管理员, roleRemark=超级管理员];1,3,16,3,17,3,18,3,19,4,20,4,21,4,22,4,23,6,24,7,25,7,26,7,27,7,28,8,29,8,30,8,31,8,32,10,33,11,34,11,35,11,36,11,37,13,38,13,39,13,40,13,41,15,42,15,43,15,44,15,45;', '0:0:0:0:0:0:0:1', '2018-02-24 16:38:15');
INSERT INTO `tb_log` VALUES ('127', 'admin', '更新角色信息', 'com.irs.controller.AdminController.updRole', 'TbRoles [roleId=1, roleName=超级管理员, roleRemark=超级管理员];1,3,16,3,17,3,18,3,19,4,20,4,21,4,22,4,23,6,24,7,25,7,26,7,27,7,28,8,29,8,30,8,31,8,32,10,33,11,34,11,35,11,36,11,37,13,38,13,39,13,40,13,41,15,42,15,43,15,44,15,45;', '0:0:0:0:0:0:0:1', '2018-02-24 16:45:22');
INSERT INTO `tb_log` VALUES ('128', 'admin', '更新角色信息', 'com.irs.controller.AdminController.updRole', 'TbRoles [roleId=1, roleName=超级管理员, roleRemark=超级管理员];1,3,16,3,17,3,18,3,19,4,20,4,21,4,22,4,23,6,24,7,25,7,26,7,27,7,28,8,29,8,30,8,31,8,32,10,33,11,34,11,35,11,36,11,37,13,38,13,39,13,40,13,41,15,42,15,43,15,44,15,45;', '0:0:0:0:0:0:0:1', '2018-02-24 16:47:38');
INSERT INTO `tb_log` VALUES ('129', 'admin', '更新角色信息', 'com.irs.controller.AdminController.updRole', 'TbRoles [roleId=1, roleName=超级管理员, roleRemark=超级管理员];1,3,16,3,17,3,18,3,19,4,20,4,21,4,22,4,23,6,24,7,25,7,26,7,27,7,28,8,29,8,30,8,31,8,32,10,33,11,34,11,35,11,36,11,37,13,38,13,39,13,40,13,41,15,42,15,43,15,44,15,45;', '0:0:0:0:0:0:0:1', '2018-02-24 16:54:51');
INSERT INTO `tb_log` VALUES ('130', 'admin', '更新角色信息', 'com.irs.controller.AdminController.updRole', 'TbRoles [roleId=1, roleName=超级管理员, roleRemark=超级管理员];1,3,2,16,3,2,17,3,2,18,3,2,19,4,2,20,4,2,21,4,2,22,4,2,23,6,5,24,7,5,25,7,5,26,7,5,27,7,5,28,8,5,29,8,5,30,8,5,31,8,5,32,10,9,33,11,9,34,11,9,35,11,9,36,11,9,37,13,12,38,13,12,39,13,12,40,13,12,41,15,14,42,15,14,43,15,14,44,15,14,45;', '0:0:0:0:0:0:0:1', '2018-02-24 16:56:46');
INSERT INTO `tb_log` VALUES ('131', 'admin', '更新角色信息', 'com.irs.controller.AdminController.updRole', 'TbRoles [roleId=1, roleName=超级管理员, roleRemark=超级管理员];1,3,2,16,3,2,17,3,2,18,3,2,19,4,2,20,4,2,21,4,2,22,4,2,23,6,5,24,7,5,25,7,5,26,7,5,27,7,5,28,8,5,29,8,5,30,8,5,31,8,5,32,10,9,33,11,9,34,11,9,35,11,9,36,11,9,37,13,12,38,13,12,39,13,12,40,13,12,41,15,14,42,15,14,43,15,14,44,15,14,45;', '0:0:0:0:0:0:0:1', '2018-02-24 16:58:58');
INSERT INTO `tb_log` VALUES ('132', 'admin', '更新角色信息', 'com.irs.controller.AdminController.updRole', 'TbRoles [roleId=1, roleName=超级管理员, roleRemark=超级管理员];1,3,2,16,3,2,17,3,2,18,3,2,19,4,2,20,4,2,21,4,2,22,4,2,23,6,5,24,7,5,25,7,5,26,7,5,27,7,5,28,8,5,29,8,5,30,8,5,31,8,5,32,10,9,33,11,9,34,11,9,35,11,9,36,11,9,37,13,12,38,13,12,39,13,12,40,13,12,41,15,14,42,15,14,43,15,14,44,15,14,45;', '0:0:0:0:0:0:0:1', '2018-02-24 17:01:38');
INSERT INTO `tb_log` VALUES ('133', 'admin', '更新角色信息', 'com.irs.controller.AdminController.updRole', 'TbRoles [roleId=1, roleName=超级管理员, roleRemark=超级管理员];1,3,2,3,2,3,2,3,2,4,2,4,2,4,2,4,2,6,5,7,5,7,5,7,5,7,5,8,5,8,5,8,5,8,5,10,9,11,9,11,9,11,9,11,9,13,12,13,12,13,12,13,12,15,14,15,14,15,14,15,14;', '0:0:0:0:0:0:0:1', '2018-02-24 17:02:55');
INSERT INTO `tb_log` VALUES ('134', 'admin', '添加角色信息', 'com.irs.controller.AdminController.insRole', 'TbRoles [roleId=null, roleName=wqee, roleRemark=qweqwe];1;', '0:0:0:0:0:0:0:1', '2018-02-24 17:04:39');
INSERT INTO `tb_log` VALUES ('135', 'admin', '更新角色信息', 'com.irs.controller.AdminController.updRole', 'TbRoles [roleId=38, roleName=wqee, roleRemark=qweqwe];1,3,2,3,2,3,2;', '0:0:0:0:0:0:0:1', '2018-02-24 17:04:53');
INSERT INTO `tb_log` VALUES ('136', 'admin', '删除指定角色信息', 'com.irs.controller.AdminController.delRole', '38;', '0:0:0:0:0:0:0:1', '2018-02-24 17:07:12');
INSERT INTO `tb_log` VALUES ('137', 'admin', '更新角色信息', 'com.irs.controller.AdminController.updRole', 'TbRoles [roleId=1, roleName=超级管理员, roleRemark=超级管理员];1,3,2,3,2,3,2,3,2,4,2,4,2,4,2,4,2,6,5,7,5,7,5,7,5,7,5,8,5,8,5,8,5,8,5,10,9,11,9,11,9,11,9,11,9,13,12,13,12,13,12,13,12,15,14,15,14,15,14,15,14;', '0:0:0:0:0:0:0:1', '2018-02-24 17:07:29');
INSERT INTO `tb_log` VALUES ('138', 'admin', '更新角色信息', 'com.irs.controller.AdminController.updRole', 'TbRoles [roleId=1, roleName=超级管理员, roleRemark=超级管理员];1,3,2,3,2,3,2,3,2,4,2,4,2,4,2,4,2,6,5,7,5,7,5,7,5,7,5,8,5,8,5,8,5,8,5,10,9,11,9,11,9,11,9,11,9,13,12,13,12,13,12,13,12,15,14,15,14,15,14,15,14;', '0:0:0:0:0:0:0:1', '2018-02-24 17:08:49');
INSERT INTO `tb_log` VALUES ('139', 'admin', '更新角色信息', 'com.irs.controller.AdminController.updRole', 'TbRoles [roleId=1, roleName=超级管理员, roleRemark=超级管理员];1,3,2,16,3,2,17,3,2,18,3,2,19,4,2,20,4,2,21,4,2,22,4,2,23,6,5,24,7,5,25,7,5,26,7,5,27,7,5,28,8,5,29,8,5,30,8,5,31,8,5,32,10,9,33,11,9,34,11,9,35,11,9,36,11,9,37,13,12,38,13,12,39,13,12,40,13,12,41,15,14,42,15,14,43,15,14,44,15,14,45;', '0:0:0:0:0:0:0:1', '2018-02-24 17:09:59');
INSERT INTO `tb_log` VALUES ('140', 'admin', '更新角色信息', 'com.irs.controller.AdminController.updRole', 'TbRoles [roleId=1, roleName=超级管理员, roleRemark=超级管理员];1,3,2,16,3,2,17,3,2,18,3,2,19,4,2,20,4,2,21,4,2,22,4,2,23,6,5,24,7,5,25,7,5,26,7,5,27,7,5,28,8,5,29,8,5,30,8,5,31,8,5,32,10,9,33,11,9,34,11,9,35,11,9,36,11,9,37,13,12,38,13,12,39,13,12,40,13,12,41,15,14,42,15,14,43,15,14,44,15,14,45;', '0:0:0:0:0:0:0:1', '2018-02-24 17:12:50');
INSERT INTO `tb_log` VALUES ('141', 'admin', '添加角色信息', 'com.irs.controller.AdminController.insRole', 'TbRoles [roleId=null, roleName=test, roleRemark=test];1,3,16,4,20,4,21,6,24,7,28,10,33,11,34,13,41,15,42;', '0:0:0:0:0:0:0:1', '2018-02-24 17:17:17');
INSERT INTO `tb_log` VALUES ('142', 'admin', '更新管理员信息', 'com.irs.controller.AdminController.updAdmin', 'TbAdmin [id=17, username=test2, password=null, fullname=test2, eMail=fsdfs@163.com, sex=1, birthday=2018-02-20, address=北京通州科创十四街区, phone=11111111111, roleId=39, roleName=null];', '0:0:0:0:0:0:0:1', '2018-02-24 17:18:55');
INSERT INTO `tb_log` VALUES ('143', 'admin', '更新角色信息', 'com.irs.controller.AdminController.updRole', 'TbRoles [roleId=1, roleName=超级管理员, roleRemark=超级管理员];1,3,16,3,17,3,18,3,19,4,20,4,21,4,22,4,23,6,24,7,25,7,26,7,27,7,28,8,29,8,30,8,31,8,32,10,33,11,34,11,35,11,36,11,37,13,38,13,39,13,40,13,41,15,42,15,43,15,44,15,45;', '0:0:0:0:0:0:0:1', '2018-02-24 17:21:48');
INSERT INTO `tb_log` VALUES ('144', 'admin', '更新角色信息', 'com.irs.controller.AdminController.updRole', 'TbRoles [roleId=1, roleName=超级管理员, roleRemark=超级管理员];1,3,2,3,2,3,2,3,2,4,2,4,2,4,2,4,2,6,5,7,5,7,5,7,5,7,5,8,5,8,5,8,5,8,5,10,9,11,9,11,9,11,9,11,9,13,12,13,12,13,12,13,12,15,14,15,14,15,14,15,14;', '0:0:0:0:0:0:0:1', '2018-02-24 17:23:21');
INSERT INTO `tb_log` VALUES ('145', 'admin', '更新角色信息', 'com.irs.controller.AdminController.updRole', 'TbRoles [roleId=1, roleName=超级管理员, roleRemark=超级管理员];1,3,2,3,2,3,2,3,2,4,2,4,2,4,2,4,2,6,5,7,5,7,5,7,5,7,5,8,5,8,5,8,5,8,5,10,9,11,9,11,9,11,9,11,9,13,12,13,12,13,12,13,12,15,14,15,14,15,14,15,14;', '0:0:0:0:0:0:0:1', '2018-02-24 17:24:57');
INSERT INTO `tb_log` VALUES ('146', 'admin', '更新角色信息', 'com.irs.controller.AdminController.updRole', 'TbRoles [roleId=1, roleName=超级管理员, roleRemark=超级管理员];1,3,16,3,17,3,18,3,19,4,20,4,21,4,22,4,23;', '0:0:0:0:0:0:0:1', '2018-02-24 17:30:59');
INSERT INTO `tb_log` VALUES ('147', 'admin', '更新角色信息', 'com.irs.controller.AdminController.updRole', 'TbRoles [roleId=1, roleName=超级管理员, roleRemark=超级管理员];1,3,16,3,17,3,18,3,19,4,20,4,21,4,22,4,23,6,24,7,25,7,26,7,27,7,28,8,29,8,30,8,31,8,32,10,33,11,34,11,35,11,36,11,37,13,38,13,39,13,40,13,41,15,42,15,43,15,44,15,45;', '0:0:0:0:0:0:0:1', '2018-02-24 17:31:55');
INSERT INTO `tb_log` VALUES ('148', 'admin', '更新角色信息', 'com.irs.controller.AdminController.updRole', 'TbRoles [roleId=1, roleName=超级管理员, roleRemark=超级管理员];1,3,16,3,17,3,18,3,19,4,20,4,21,4,22,4,23,6,24,7,25,7,26,7,27,7,28,8,29,8,30,8,31,8,32,10,33,11,34,11,35,11,36,11,37,13,38,13,39,13,40,13,41,15,42,15,43,15,44,15,45;', '0:0:0:0:0:0:0:1', '2018-02-24 17:32:44');
INSERT INTO `tb_log` VALUES ('149', 'admin', '更新角色信息', 'com.irs.controller.AdminController.updRole', 'TbRoles [roleId=1, roleName=超级管理员, roleRemark=超级管理员];1,3,16,3,17,3,18,3,19,4,20,4,21,4,22,4,23,6,24,7,25,7,26,7,27,7,28,8,29,8,30,8,31,8,32,10,33,11,34,11,35,11,36,11,37,13,38,13,39,13,40,13,41,15,42,15,43,15,44,15,45;', '0:0:0:0:0:0:0:1', '2018-02-24 17:33:08');
INSERT INTO `tb_log` VALUES ('150', 'admin', '删除指定角色信息', 'com.irs.controller.AdminController.delRole', '39;', '0:0:0:0:0:0:0:1', '2018-02-24 17:36:04');
INSERT INTO `tb_log` VALUES ('151', 'admin', '更新角色信息', 'com.irs.controller.AdminController.updRole', 'TbRoles [roleId=1, roleName=超级管理员, roleRemark=超级管理员];1,1,16,3,2,17,3,2,18,3,2,19,3,2,20,4,2,21,4,2,22,4,2,23,4,2,24,6,5,25,7,5,26,7,5,27,7,5,28,7,5,29,8,5,30,8,5,31,8,5,32,8,5,33,10,9,34,11,9,35,11,9,36,11,9,37,11,9,38,13,12,39,13,12,40,13,12,41,13,12,42,15,14,43,15,14,44,15,14,45,15,14;', '0:0:0:0:0:0:0:1', '2018-02-24 17:37:10');
INSERT INTO `tb_log` VALUES ('152', 'admin', '更新角色信息', 'com.irs.controller.AdminController.updRole', 'TbRoles [roleId=1, roleName=超级管理员, roleRemark=超级管理员];1,1,16,3,2,17,3,2,18,3,2,19,3,2,20,4,2,21,4,2,22,4,2,23,4,2,24,6,5,25,7,5,26,7,5,27,7,5,28,7,5,29,8,5,30,8,5,31,8,5,32,8,5,33,10,9,34,11,9,35,11,9,36,11,9,37,11,9,38,13,12,39,13,12,40,13,12,41,13,12,42,15,14,43,15,14,44,15,14,45,15,14;', '0:0:0:0:0:0:0:1', '2018-02-24 17:38:09');
INSERT INTO `tb_log` VALUES ('153', 'admin', '更新角色信息', 'com.irs.controller.AdminController.updRole', 'TbRoles [roleId=1, roleName=超级管理员, roleRemark=超级管理员];1,1,16,3,2,17,3,2,18,3,2,19,3,2,20,4,2,21,4,2,22,4,2,23,4,2,24,6,5,25,7,5,26,7,5,27,7,5,28,7,5,29,8,5,30,8,5,31,8,5,32,8,5,33,10,9,34,11,9,35,11,9,36,11,9,37,11,9,38,13,12,39,13,12,40,13,12,41,13,12,42,15,14,43,15,14,44,15,14,45,15,14;', '0:0:0:0:0:0:0:1', '2018-02-24 17:41:05');
INSERT INTO `tb_log` VALUES ('154', 'admin', '更新角色信息', 'com.irs.controller.AdminController.updRole', 'TbRoles [roleId=1, roleName=超级管理员, roleRemark=超级管理员];1,1,16,3,2,17,3,2,18,3,2,19,3,2,20,4,2,21,4,2,22,4,2,23,4,2,24,6,5,25,7,5,26,7,5,27,7,5,28,7,5,29,8,5,30,8,5,31,8,5,32,8,5,33,10,9,34,11,9,35,11,9,36,11,9,37,11,9,38,13,12,39,13,12,40,13,12,41,13,12,42,15,14,43,15,14,44,15,14,45,15,14;', '0:0:0:0:0:0:0:1', '2018-02-24 17:42:03');
INSERT INTO `tb_log` VALUES ('155', 'admin', '更新角色信息', 'com.irs.controller.AdminController.updRole', 'TbRoles [roleId=1, roleName=超级管理员, roleRemark=超级管理员];1,1,16,3,2,17,3,2,18,3,2,19,3,2,20,4,2,21,4,2,22,4,2,23,4,2,24,6,5,25,7,5,26,7,5,27,7,5,28,7,5,29,8,5,30,8,5,31,8,5,32,8,5,33,10,9,34,11,9,35,11,9,36,11,9,37,11,9,38,13,12,39,13,12,40,13,12,41,13,12,42,15,14,43,15,14,44,15,14,45,15,14;', '0:0:0:0:0:0:0:1', '2018-02-24 18:07:38');
INSERT INTO `tb_log` VALUES ('156', 'admin', '更新角色信息', 'com.irs.controller.AdminController.updRole', 'TbRoles [roleId=1, roleName=超级管理员, roleRemark=超级管理员];1,1,16,3,2,17,3,2,18,3,2,19,3,2,20,4,2,21,4,2,22,4,2,23,4,2,24,6,5,25,7,5,26,7,5,27,7,5,28,7,5,29,8,5,30,8,5,31,8,5,32,8,5,33,10,9,34,11,9,35,11,9,36,11,9,37,11,9,38,13,12,39,13,12,40,13,12,41,13,12,42,15,14,43,15,14,44,15,14,45,15,14;', '0:0:0:0:0:0:0:1', '2018-02-24 18:12:30');
INSERT INTO `tb_log` VALUES ('157', 'admin', '添加角色信息', 'com.irs.controller.AdminController.insRole', 'TbRoles [roleId=null, roleName=test, roleRemark=test];1,3,16,3,17,4,20,6,24;', '0:0:0:0:0:0:0:1', '2018-02-24 18:22:50');
INSERT INTO `tb_log` VALUES ('158', 'admin', '更新管理员信息', 'com.irs.controller.AdminController.updAdmin', 'TbAdmin [id=17, username=test2, password=null, fullname=test2, eMail=fsdfs@163.com, sex=1, birthday=2018-02-20, address=北京通州科创十四街区, phone=11111111111, roleId=40, roleName=null];', '0:0:0:0:0:0:0:1', '2018-02-24 18:23:08');
INSERT INTO `tb_log` VALUES ('159', 'admin', '删除指定角色信息', 'com.irs.controller.AdminController.delRole', '40;', '0:0:0:0:0:0:0:1', '2018-02-24 18:24:31');
INSERT INTO `tb_log` VALUES ('160', 'admin', '添加角色信息', 'com.irs.controller.AdminController.insRole', 'TbRoles [roleId=null, roleName=test, roleRemark=test];1,3,16,3,17,3,18,3,19,4,20,6,24,10,33;', '0:0:0:0:0:0:0:1', '2018-02-24 18:24:45');
INSERT INTO `tb_log` VALUES ('161', 'admin', '更新管理员信息', 'com.irs.controller.AdminController.updAdmin', 'TbAdmin [id=17, username=test2, password=null, fullname=test2, eMail=fsdfs@163.com, sex=1, birthday=2018-02-20, address=北京通州科创十四街区, phone=11111111111, roleId=41, roleName=null];', '0:0:0:0:0:0:0:1', '2018-02-24 18:24:53');
INSERT INTO `tb_log` VALUES ('162', 'admin', '删除指定角色信息', 'com.irs.controller.AdminController.delRole', '41;', '0:0:0:0:0:0:0:1', '2018-02-24 18:26:49');
INSERT INTO `tb_log` VALUES ('163', 'admin', '添加角色信息', 'com.irs.controller.AdminController.insRole', 'TbRoles [roleId=null, roleName=test, roleRemark=test];1,1,16,3,2,17,3,2,18,3,2,19,3,2,23,4,2,24,6,5,31,8,5;', '0:0:0:0:0:0:0:1', '2018-02-24 18:27:04');
INSERT INTO `tb_log` VALUES ('164', 'admin', '更新管理员信息', 'com.irs.controller.AdminController.updAdmin', 'TbAdmin [id=17, username=test2, password=null, fullname=test2, eMail=fsdfs@163.com, sex=1, birthday=2018-02-20, address=北京通州科创十四街区, phone=11111111111, roleId=42, roleName=null];', '0:0:0:0:0:0:0:1', '2018-02-24 18:27:19');
INSERT INTO `tb_log` VALUES ('165', 'test2', '更新角色信息', 'com.irs.controller.AdminController.updRole', 'TbRoles [roleId=42, roleName=test, roleRemark=test];1,1,16,3,2,17,3,2,18,3,2,19,3,2,23,4,2,24,6,5,31,8,5,33,10,9,38,13,12,42,15,14;', '0:0:0:0:0:0:0:1', '2018-02-24 18:28:03');
INSERT INTO `tb_log` VALUES ('166', 'admin', '更新角色信息', 'com.irs.controller.AdminController.updRole', 'TbRoles [roleId=48, roleName=sdfa, roleRemark=fdsaf];1,1,16,3,2,20,4,2,33,10,9;', '0:0:0:0:0:0:0:1', '2018-02-25 19:50:53');
INSERT INTO `tb_log` VALUES ('167', 'admin', '新增新闻', 'com.irs.controller.InformationController.createNews', 'com.irs.pojo.TbNews@dd0338;org.apache.shiro.web.servlet.ShiroHttpServletRequest@1fe8129;', '0:0:0:0:0:0:0:1', '2018-02-25 19:51:57');
INSERT INTO `tb_log` VALUES ('168', 'admin', '新增新闻', 'com.irs.controller.InformationController.createNews', 'com.irs.pojo.TbNews@155c72;org.apache.shiro.web.servlet.ShiroHttpServletRequest@686764;', '0:0:0:0:0:0:0:1', '2018-02-25 19:56:28');
INSERT INTO `tb_log` VALUES ('169', 'admin', '更新新闻', 'com.irs.controller.InformationController.updNews', 'com.irs.pojo.TbNews@170d3b3;org.apache.shiro.web.servlet.ShiroHttpServletRequest@5aca08;', '0:0:0:0:0:0:0:1', '2018-02-25 19:56:51');
INSERT INTO `tb_log` VALUES ('170', 'admin', '删除指定的新闻', 'com.irs.controller.InformationController.delNewsById', '677f8e51e4804cd89be63ce6c4b570b7918;', '0:0:0:0:0:0:0:1', '2018-02-25 20:09:48');
INSERT INTO `tb_log` VALUES ('171', 'admin', '新增新闻', 'com.irs.controller.InformationController.insNews', 'com.irs.pojo.TbNews@d85743;org.apache.shiro.web.servlet.ShiroHttpServletRequest@148ff87;', '0:0:0:0:0:0:0:1', '2018-02-25 20:18:19');
INSERT INTO `tb_log` VALUES ('173', 'admin', '添加用户', 'com.irs.controller.UserManagementController.insUser', 'TbUsers [uid=null, eMail=5931513215@qq.com, nickname=isduxd, sex=1, birthday=2018-02-25, address=甘肃省兰州市榆中县和平镇, phone=17601038192, eCode=null, status=null, createTime=null];', '0:0:0:0:0:0:0:1', '2018-02-25 20:19:11');
INSERT INTO `tb_log` VALUES ('174', 'admin', '根据ID删除用户', 'com.irs.controller.UserManagementController.delUserByUid', '16;', '0:0:0:0:0:0:0:1', '2018-02-25 20:22:40');
INSERT INTO `tb_log` VALUES ('175', 'admin', '添加用户', 'com.irs.controller.UserManagementController.insUser', 'TbUsers [uid=null, eMail=5931513215@qq.com, nickname=isduxd, sex=1, birthday=2018-02-06, address=甘肃省兰州市榆中县和平镇, phone=17693109922, eCode=null, status=null, createTime=null];', '0:0:0:0:0:0:0:1', '2018-02-25 20:22:55');
INSERT INTO `tb_log` VALUES ('176', 'admin', '根据ID删除用户', 'com.irs.controller.UserManagementController.delUserByUid', '17;', '0:0:0:0:0:0:0:1', '2018-02-25 20:23:54');
INSERT INTO `tb_log` VALUES ('177', 'admin', '添加用户', 'com.irs.controller.UserManagementController.insUser', 'TbUsers [uid=null, eMail=593151321@qq.com, nickname=sdfdasf, sex=1, birthday=2018-02-20, address=甘肃省兰州市榆中县和平镇, phone=17601038192, eCode=null, status=null, createTime=null];', '0:0:0:0:0:0:0:1', '2018-02-25 20:24:16');
INSERT INTO `tb_log` VALUES ('178', 'admin', '更新评论状态', 'com.irs.controller.CommentController.updComment', 'TbComment [commentId=8, createTime=null, userId=null, newsId=null, status=1, commentText=null];', '0:0:0:0:0:0:0:1', '2018-02-25 20:25:34');
INSERT INTO `tb_log` VALUES ('183', 'admin', '批量删除日志', 'com.irs.controller.LogController.delLogs', '182,181,180;', '0:0:0:0:0:0:0:1', '2018-02-25 20:26:12');
INSERT INTO `tb_log` VALUES ('184', 'admin', '更新管理员信息', 'com.irs.controller.AdminController.updAdmin', 'TbAdmin [id=1, username=admin, password=null, salt=null, fullname=arthur, eMail=isduxd@163.com, sex=1, birthday=1994-11-08, address=北京市通州区科创十四街, phone=17693109997, roleId=1, roleName=null];', '0:0:0:0:0:0:0:1', '2018-02-25 20:29:45');
INSERT INTO `tb_log` VALUES ('185', 'admin', '删除指定管理员', 'com.irs.controller.AdminController.delAdminById', '17;', '0:0:0:0:0:0:0:1', '2018-02-25 20:32:46');
INSERT INTO `tb_log` VALUES ('186', 'admin', '删除指定角色信息', 'com.irs.controller.AdminController.delRole', '48;', '0:0:0:0:0:0:0:1', '2018-02-25 20:32:53');
INSERT INTO `tb_log` VALUES ('187', 'admin', '删除指定角色信息', 'com.irs.controller.AdminController.delRole', '46;', '0:0:0:0:0:0:0:1', '2018-02-25 20:32:55');
INSERT INTO `tb_log` VALUES ('188', 'admin', '添加角色信息', 'com.irs.controller.AdminController.insRole', 'TbRoles [roleId=null, roleName=test, roleRemark=test];1,1,16,3,2,20,4,2,25,7,5,29,8,5,34,11,9,38,13,12,42,15,14;', '0:0:0:0:0:0:0:1', '2018-02-25 20:33:30');
INSERT INTO `tb_log` VALUES ('189', 'admin', '删除指定管理员', 'com.irs.controller.AdminController.delAdminById', '16;', '0:0:0:0:0:0:0:1', '2018-02-25 20:33:42');
INSERT INTO `tb_log` VALUES ('190', 'admin', '添加管理员', 'com.irs.controller.AdminController.insAdmin', 'TbAdmin [id=null, username=test, password=123456, salt=null, fullname=test, eMail=test@test.com, sex=1, birthday=2018-02-25, address=甘肃省兰州市榆中县和平镇, phone=17601038192, roleId=49, roleName=null];', '0:0:0:0:0:0:0:1', '2018-02-25 20:37:36');
INSERT INTO `tb_log` VALUES ('191', 'admin', '更新新闻', 'com.irs.controller.InformationController.updNews', 'com.irs.pojo.TbNews@1416889;org.apache.shiro.web.servlet.ShiroHttpServletRequest@1361de4;', '0:0:0:0:0:0:0:1', '2018-02-25 21:51:04');
INSERT INTO `tb_log` VALUES ('197', 'admin', '根据ID删除日志', 'com.irs.controller.LogController.delLogById', '196;', '0:0:0:0:0:0:0:1', '2018-02-26 14:05:11');
INSERT INTO `tb_log` VALUES ('198', 'admin', '更新角色信息', 'com.irs.controller.AdminController.updRole', 'TbRoles [roleId=49, roleName=test, roleRemark=test];1,1,16,3,2,20,4,2,22,4,2,25,7,5,29,8,5,34,11,9,38,13,12,42,15,14;', '0:0:0:0:0:0:0:1', '2018-02-26 15:06:35');
INSERT INTO `tb_log` VALUES ('199', 'admin', '维护新闻的状态', 'com.irs.controller.InformationController.updNewsStatusById', 'd947fc84c6374f319f0803e3927fe241084;1;', '0:0:0:0:0:0:0:1', '2018-02-26 15:19:32');
INSERT INTO `tb_log` VALUES ('200', 'admin', '维护新闻的状态', 'com.irs.controller.InformationController.updNewsStatusById', 'd947fc84c6374f319f0803e3927fe241084;0;', '0:0:0:0:0:0:0:1', '2018-02-26 15:19:37');
INSERT INTO `tb_log` VALUES ('201', 'admin', '添加角色信息', 'com.irs.controller.AdminController.insRole', 'TbRoles [roleId=null, roleName=test2, roleRemark=test];1,1,16,3,2,20,4,2,24,6,5;', '0:0:0:0:0:0:0:1', '2018-02-26 15:42:15');
INSERT INTO `tb_log` VALUES ('202', 'admin', '更新角色信息', 'com.irs.controller.AdminController.updRole', 'TbRoles [roleId=50, roleName=test2, roleRemark=test];1,1,16,3,2,20,4,2,24,6,5,29,8,5;', '0:0:0:0:0:0:0:1', '2018-02-26 15:42:26');
INSERT INTO `tb_log` VALUES ('203', 'admin', '删除指定角色信息', 'com.irs.controller.AdminController.delRole', '50;', '0:0:0:0:0:0:0:1', '2018-02-26 15:42:29');
INSERT INTO `tb_log` VALUES ('204', 'admin', '添加管理员', 'com.irs.controller.AdminController.insAdmin', 'TbAdmin [id=null, username=tets3, password=111111, salt=null, fullname=sdfsf, eMail=test@qq.com, sex=0, birthday=2018-02-26, address=甘肃省兰州市榆中县和平镇, phone=17601038192, roleId=null, roleName=null];', '0:0:0:0:0:0:0:1', '2018-02-26 15:43:07');
INSERT INTO `tb_log` VALUES ('205', 'admin', '更新管理员信息', 'com.irs.controller.AdminController.updAdmin', 'TbAdmin [id=19, username=tets3, password=null, salt=null, fullname=sdfsf, eMail=test@qq.com, sex=0, birthday=2018-02-26, address=甘肃省兰州市榆中县和平镇, phone=17601038192, roleId=49, roleName=null];', '0:0:0:0:0:0:0:1', '2018-02-26 15:43:17');
INSERT INTO `tb_log` VALUES ('206', 'admin', '删除指定管理员', 'com.irs.controller.AdminController.delAdminById', '19;', '0:0:0:0:0:0:0:1', '2018-02-26 15:43:23');
INSERT INTO `tb_log` VALUES ('207', 'admin', '新增新闻', 'com.irs.controller.InformationController.insNews', 'com.irs.pojo.TbNews@1e7425e;org.apache.shiro.web.servlet.ShiroHttpServletRequest@1b62c59;', '0:0:0:0:0:0:0:1', '2018-02-26 15:44:30');
INSERT INTO `tb_log` VALUES ('208', 'admin', '更新新闻', 'com.irs.controller.InformationController.updNews', 'com.irs.pojo.TbNews@404f7d;org.apache.shiro.web.servlet.ShiroHttpServletRequest@22b87f;', '0:0:0:0:0:0:0:1', '2018-02-26 15:44:49');
INSERT INTO `tb_log` VALUES ('211', 'admin', '删除指定的新闻', 'com.irs.controller.InformationController.delNewsById', 'a3f01791e2364889bf93f723110bf5ef403;', '0:0:0:0:0:0:0:1', '2018-02-26 15:44:59');
INSERT INTO `tb_log` VALUES ('214', 'admin', '批量删除日志', 'com.irs.controller.LogController.delLogs', '213,209;', '0:0:0:0:0:0:0:1', '2018-02-26 15:45:33');
INSERT INTO `tb_log` VALUES ('215', 'admin', '根据ID删除用户', 'com.irs.controller.UserManagementController.delUserByUid', '18;', '0:0:0:0:0:0:0:1', '2018-02-26 15:45:49');
INSERT INTO `tb_log` VALUES ('216', 'admin', '添加用户', 'com.irs.controller.UserManagementController.insUser', 'TbUsers [uid=null, eMail=593151321@qq.com, nickname=test, sex=2, birthday=2018-02-26, address=甘肃省兰州市榆中县和平镇, phone=17601038192, eCode=null, status=null, createTime=null];', '0:0:0:0:0:0:0:1', '2018-02-26 15:46:12');
INSERT INTO `tb_log` VALUES ('217', 'admin', '根据ID删除用户', 'com.irs.controller.UserManagementController.delUserByUid', '19;', '0:0:0:0:0:0:0:1', '2018-02-26 15:48:43');
INSERT INTO `tb_log` VALUES ('218', 'admin', '更新评论状态', 'com.irs.controller.CommentController.updComment', 'TbComment [commentId=13, createTime=null, userId=null, newsId=null, status=2, commentText=null];', '0:0:0:0:0:0:0:1', '2018-02-26 15:50:07');
INSERT INTO `tb_log` VALUES ('219', 'admin', '批量删除评论', 'com.irs.controller.CommentController.delComments', '12;', '0:0:0:0:0:0:0:1', '2018-02-26 15:50:14');
INSERT INTO `tb_log` VALUES ('220', 'admin', '根据ID删除评论', 'com.irs.controller.CommentController.delCommentById', '13;', '0:0:0:0:0:0:0:1', '2018-02-26 15:50:17');
INSERT INTO `tb_log` VALUES ('221', 'admin', '批量删除日志', 'com.irs.controller.LogController.delLogs', '19,11,10,8,7,6,5,4,3,2;', '0:0:0:0:0:0:0:1', '2018-02-26 15:50:49');
INSERT INTO `tb_log` VALUES ('222', 'admin', '根据ID删除日志', 'com.irs.controller.LogController.delLogById', '210;', '0:0:0:0:0:0:0:1', '2018-02-26 15:50:53');
INSERT INTO `tb_log` VALUES ('223', 'admin', '添加用户', 'com.irs.controller.UserManagementController.insUser', 'TbUsers [uid=null, eMail=593151321@qq.com, nickname=safsad, sex=1, birthday=2018-02-26, address=北京通州科创十四街区, phone=17693109923, eCode=null, status=null, createTime=null];', '0:0:0:0:0:0:0:1', '2018-02-26 16:19:17');
INSERT INTO `tb_log` VALUES ('224', 'admin', '更新管理员信息', 'com.irs.controller.AdminController.updAdmin', 'TbAdmin [id=18, username=test, password=null, salt=null, fullname=test, eMail=test@test.com, sex=1, birthday=2018-02-25, address=甘肃省兰州市榆中县和平镇, phone=17601038192, roleId=null, roleName=null];', '0:0:0:0:0:0:0:1', '2018-02-26 16:29:27');
INSERT INTO `tb_log` VALUES ('225', 'admin', '更新管理员信息', 'com.irs.controller.AdminController.updAdmin', 'TbAdmin [id=18, username=test, password=null, salt=null, fullname=test, eMail=test@test.com, sex=1, birthday=2018-02-25, address=甘肃省兰州市榆中县和平镇, phone=17601038192, roleId=49, roleName=null];', '0:0:0:0:0:0:0:1', '2018-02-26 16:34:29');
INSERT INTO `tb_log` VALUES ('226', 'admin', '添加新闻类别', 'com.irs.controller.InformationController.insCategory', 'TbNewsCategory [categoryId=null, categoryName=其他2];', '0:0:0:0:0:0:0:1', '2018-02-26 16:53:45');
INSERT INTO `tb_log` VALUES ('227', 'admin', '更新类别信息', 'com.irs.controller.InformationController.updCategory', 'TbNewsCategory [categoryId=18, categoryName=娱乐];', '0:0:0:0:0:0:0:1', '2018-02-26 16:54:02');
INSERT INTO `tb_log` VALUES ('228', 'admin', '更新类别信息', 'com.irs.controller.InformationController.updCategory', 'TbNewsCategory [categoryId=18, categoryName=其他2];', '0:0:0:0:0:0:0:1', '2018-02-26 16:54:21');
INSERT INTO `tb_log` VALUES ('229', 'admin', '更新类别信息', 'com.irs.controller.InformationController.updCategory', 'TbNewsCategory [categoryId=2, categoryName=娱乐];', '0:0:0:0:0:0:0:1', '2018-02-26 16:56:08');
INSERT INTO `tb_log` VALUES ('230', 'admin', '更新类别信息', 'com.irs.controller.InformationController.updCategory', 'TbNewsCategory [categoryId=4, categoryName=娱乐];', '0:0:0:0:0:0:0:1', '2018-02-26 16:56:35');
INSERT INTO `tb_log` VALUES ('231', 'admin', '根据ID删除用户', 'com.irs.controller.UserManagementController.delUserByUid', '20;', '0:0:0:0:0:0:0:1', '2018-02-27 16:59:41');
INSERT INTO `tb_log` VALUES ('232', 'admin', '添加用户', 'com.irs.controller.UserManagementController.insUser', 'TbUsers [uid=null, eMail=593151321@qq.com, nickname=admin3, sex=1, birthday=2018-02-27, address=北京通州科创十四街区, phone=17693109222, eCode=null, status=null, createTime=null];', '0:0:0:0:0:0:0:1', '2018-02-27 17:00:08');
INSERT INTO `tb_log` VALUES ('233', 'admin', '根据ID删除用户', 'com.irs.controller.UserManagementController.delUserByUid', '21;', '0:0:0:0:0:0:0:1', '2018-02-27 17:02:09');
INSERT INTO `tb_log` VALUES ('234', 'admin', '添加用户', 'com.irs.controller.UserManagementController.insUser', 'TbUsers [uid=null, eMail=593151321@qq.com, nickname=admin3, sex=1, birthday=2018-02-27, address=11111111111, phone=11111111111, eCode=null, status=null, createTime=null];', '0:0:0:0:0:0:0:1', '2018-02-27 17:02:24');
INSERT INTO `tb_log` VALUES ('235', 'admin', '更新用户信息', 'com.irs.controller.UserManagementController.updUser', 'TbUsers [uid=22, eMail=593151321@qq.com, nickname=admin3, sex=1, birthday=2018-02-27, address=11111111111, phone=11111111111, eCode=null, status=0, createTime=null];', '127.0.0.1', '2018-02-27 17:07:50');
INSERT INTO `tb_log` VALUES ('236', 'admin', '新增新闻', 'com.irs.controller.InformationController.insNews', 'com.irs.pojo.TbNews@13d91f0;org.apache.shiro.web.servlet.ShiroHttpServletRequest@1382d6e;', '0:0:0:0:0:0:0:1', '2018-03-02 17:44:11');
INSERT INTO `tb_log` VALUES ('237', 'admin', '添加角色信息', 'com.irs.controller.AdminController.insRole', 'TbRoles [roleId=null, roleName=评论审核, roleRemark=评论审核];1,1,38,13,12,39,13,12,40,13,12,41,13,12;', '0:0:0:0:0:0:0:1', '2018-03-06 22:23:24');
INSERT INTO `tb_log` VALUES ('238', 'admin', '更新管理员信息', 'com.irs.controller.AdminController.updAdmin', 'TbAdmin [id=18, username=test, password=null, salt=null, fullname=test, eMail=test@test.com, sex=1, birthday=2018-02-25, address=甘肃省兰州市榆中县和平镇, phone=17601038192, roleId=50, roleName=null];', '0:0:0:0:0:0:0:1', '2018-03-06 22:25:11');
INSERT INTO `tb_log` VALUES ('239', 'test', '批量审核评论', 'com.irs.controller.CommentController.auditComments', '15;', '0:0:0:0:0:0:0:1', '2018-03-06 22:25:34');
INSERT INTO `tb_log` VALUES ('240', 'test', '更新评论状态', 'com.irs.controller.CommentController.updComment', 'TbComment [commentId=14, createTime=null, userId=null, newsId=null, status=2, commentText=null];', '0:0:0:0:0:0:0:1', '2018-03-06 22:25:41');
INSERT INTO `tb_log` VALUES ('241', 'test', '更新评论状态', 'com.irs.controller.CommentController.updComment', 'TbComment [commentId=15, createTime=null, userId=null, newsId=null, status=0, commentText=null];', '0:0:0:0:0:0:0:1', '2018-03-06 22:25:52');
INSERT INTO `tb_log` VALUES ('242', 'test', '批量审核评论', 'com.irs.controller.CommentController.auditComments', '15;', '0:0:0:0:0:0:0:1', '2018-03-06 22:25:59');
INSERT INTO `tb_log` VALUES ('247', 'admin', '根据ID删除日志', 'com.irs.controller.LogController.delLogById', '246;', '0:0:0:0:0:0:0:1', '2018-03-06 22:59:23');
INSERT INTO `tb_log` VALUES ('248', 'admin', '更新新闻', 'com.irs.controller.InformationController.updNews', 'com.irs.pojo.TbNews@1b0b501;org.apache.shiro.web.servlet.ShiroHttpServletRequest@3b723e;', '0:0:0:0:0:0:0:1', '2018-03-06 23:02:37');
INSERT INTO `tb_log` VALUES ('249', 'admin', '删除指定的新闻', 'com.irs.controller.InformationController.delNewsById', 'fc41f48ff68649e8be2aeef2ca4b99f5322;', '0:0:0:0:0:0:0:1', '2018-03-06 23:02:47');
INSERT INTO `tb_log` VALUES ('250', 'admin', '添加新闻类别', 'com.irs.controller.InformationController.insCategory', 'TbNewsCategory [categoryId=null, categoryName=test];', '0:0:0:0:0:0:0:1', '2018-03-06 23:03:33');
INSERT INTO `tb_log` VALUES ('251', 'admin', '删除类别信息', 'com.irs.controller.InformationController.delCategory', '20;', '0:0:0:0:0:0:0:1', '2018-03-06 23:03:40');
INSERT INTO `tb_log` VALUES ('252', 'admin', '删除类别信息', 'com.irs.controller.InformationController.delCategory', '19;', '0:0:0:0:0:0:0:1', '2018-03-06 23:03:45');
INSERT INTO `tb_log` VALUES ('253', 'admin', '删除类别信息', 'com.irs.controller.InformationController.delCategory', '18;', '0:0:0:0:0:0:0:1', '2018-03-06 23:03:47');
INSERT INTO `tb_log` VALUES ('254', 'admin', '添加新闻类别', 'com.irs.controller.InformationController.insCategory', 'TbNewsCategory [categoryId=null, categoryName=test];', '0:0:0:0:0:0:0:1', '2018-03-06 23:04:39');
INSERT INTO `tb_log` VALUES ('255', 'admin', '删除类别信息', 'com.irs.controller.InformationController.delCategory', '21;', '0:0:0:0:0:0:0:1', '2018-03-06 23:04:45');
INSERT INTO `tb_log` VALUES ('256', 'admin', '删除类别信息', 'com.irs.controller.InformationController.delCategory', '11;', '0:0:0:0:0:0:0:1', '2018-03-06 23:05:09');
INSERT INTO `tb_log` VALUES ('257', 'admin', '删除类别信息', 'com.irs.controller.InformationController.delCategory', '9;', '0:0:0:0:0:0:0:1', '2018-03-06 23:05:12');
INSERT INTO `tb_log` VALUES ('258', 'admin', '添加新闻类别', 'com.irs.controller.InformationController.insCategory', 'TbNewsCategory [categoryId=null, categoryName=汽车];', '0:0:0:0:0:0:0:1', '2018-03-06 23:05:23');
INSERT INTO `tb_log` VALUES ('259', 'admin', '添加新闻类别', 'com.irs.controller.InformationController.insCategory', 'TbNewsCategory [categoryId=null, categoryName=其他];', '0:0:0:0:0:0:0:1', '2018-03-06 23:05:34');
INSERT INTO `tb_log` VALUES ('260', 'admin', '删除类别信息', 'com.irs.controller.InformationController.delCategory', '23;', '0:0:0:0:0:0:0:1', '2018-03-06 23:05:40');
INSERT INTO `tb_log` VALUES ('261', 'admin', '根据ID删除评论', 'com.irs.controller.CommentController.delCommentById', '14;', '0:0:0:0:0:0:0:1', '2018-03-06 23:06:52');
INSERT INTO `tb_log` VALUES ('262', 'admin', '添加管理员', 'com.irs.controller.AdminController.insAdmin', 'TbAdmin [id=null, username=test1, password=111111, salt=null, fullname=test1, eMail=sdfsf@163.com, sex=1, birthday=2018-03-06, address=甘肃省兰州市榆中县和平镇, phone=17693109997, roleId=50, roleName=null];', '0:0:0:0:0:0:0:1', '2018-03-06 23:09:40');
INSERT INTO `tb_log` VALUES ('263', 'admin', '删除指定管理员', 'com.irs.controller.AdminController.delAdminById', '19;', '0:0:0:0:0:0:0:1', '2018-03-06 23:09:52');
INSERT INTO `tb_log` VALUES ('264', 'admin', '删除指定角色信息', 'com.irs.controller.AdminController.delRole', '50;', '0:0:0:0:0:0:0:1', '2018-03-06 23:10:33');
INSERT INTO `tb_log` VALUES ('265', 'admin', '根据ID删除用户', 'com.irs.controller.UserManagementController.delUserByUid', '22;', '0:0:0:0:0:0:0:1', '2018-03-06 23:11:05');
INSERT INTO `tb_log` VALUES ('266', 'admin', '添加用户', 'com.irs.controller.UserManagementController.insUser', 'TbUsers [uid=null, eMail=593151321@qq.com, nickname=sdfsdf, sex=1, birthday=2018-03-06, address=甘肃省兰州市榆中县和平镇, phone=17601038192, eCode=null, status=null, createTime=null];', '0:0:0:0:0:0:0:1', '2018-03-06 23:12:18');
INSERT INTO `tb_log` VALUES ('267', 'admin', '根据ID删除用户', 'com.irs.controller.UserManagementController.delUserByUid', '23;', '0:0:0:0:0:0:0:1', '2018-03-06 23:18:10');
INSERT INTO `tb_log` VALUES ('268', 'admin', '添加用户', 'com.irs.controller.UserManagementController.insUser', 'TbUsers [uid=null, eMail=59315132151@qq.com, nickname=adfs, sex=0, birthday=2018-03-06, address=北京通州科创十四街区, phone=17693109923, eCode=null, status=null, createTime=null];', '0:0:0:0:0:0:0:1', '2018-03-06 23:18:37');
INSERT INTO `tb_log` VALUES ('269', 'admin', '添加用户', 'com.irs.controller.UserManagementController.insUser', 'TbUsers [uid=null, eMail=59315132151@qq.com, nickname=adfs, sex=0, birthday=2018-03-06, address=北京通州科创十四街区, phone=17693109923, eCode=null, status=null, createTime=null];', '0:0:0:0:0:0:0:1', '2018-03-06 23:18:57');
INSERT INTO `tb_log` VALUES ('270', 'admin', '添加用户', 'com.irs.controller.UserManagementController.insUser', 'TbUsers [uid=null, eMail=593151321@qq.com, nickname=sdfsf, sex=2, birthday=2018-03-06, address=北京通州科创十四街区, phone=17693109923, eCode=null, status=null, createTime=null];', '0:0:0:0:0:0:0:1', '2018-03-06 23:20:33');
INSERT INTO `tb_log` VALUES ('271', 'admin', '更新管理员信息', 'com.irs.controller.AdminController.updAdmin', 'TbAdmin [id=18, username=test, password=null, salt=null, fullname=test, eMail=test@test.com, sex=1, birthday=2018-02-25, address=甘肃省兰州市榆中县和平镇, phone=17601038192, roleId=49, roleName=null];', '0:0:0:0:0:0:0:1', '2018-03-06 23:21:48');
INSERT INTO `tb_log` VALUES ('272', 'admin', '更新角色信息', 'com.irs.controller.AdminController.updRole', 'TbRoles [roleId=49, roleName=test, roleRemark=test];1,1,16,3,2,20,4,2,22,4,2,25,7,5,29,8,5,34,11,9,38,13,12,42,15,14;', '0:0:0:0:0:0:0:1', '2018-03-06 23:22:56');
INSERT INTO `tb_log` VALUES ('273', 'admin', '添加角色信息', 'com.irs.controller.AdminController.insRole', 'TbRoles [roleId=null, roleName=test2, roleRemark=test];1,1,24,6,5,25,7,5,26,7,5,27,7,5,28,7,5,29,8,5,30,8,5,31,8,5,32,8,5,33,10,9,34,11,9,35,11,9,36,11,9,37,11,9,38,13,12,39,13,12,40,13,12,41,13,12;', '0:0:0:0:0:0:0:1', '2018-03-06 23:25:12');
INSERT INTO `tb_log` VALUES ('274', 'admin', '添加管理员', 'com.irs.controller.AdminController.insAdmin', 'TbAdmin [id=null, username=test2, password=111111, salt=null, fullname=test2, eMail=test2@qq.com, sex=1, birthday=2018-03-06, address=北京通州科创十四街区, phone=17693109923, roleId=51, roleName=null];', '0:0:0:0:0:0:0:1', '2018-03-06 23:25:57');
INSERT INTO `tb_log` VALUES ('275', 'test2', '更新用户信息', 'com.irs.controller.UserManagementController.updUser', 'TbUsers [uid=15, eMail=isduxd@gmail.com, nickname=test1, sex=0, birthday=2018-02-14, address=北京通州科创十四街区, phone=17693109923, eCode=null, status=2, createTime=null];', '0:0:0:0:0:0:0:1', '2018-03-06 23:27:31');
INSERT INTO `tb_log` VALUES ('276', 'test2', '更新新闻', 'com.irs.controller.InformationController.updNews', 'com.irs.pojo.TbNews@18f34ad;org.apache.shiro.web.servlet.ShiroHttpServletRequest@cb77ca;', '0:0:0:0:0:0:0:1', '2018-03-06 23:28:13');
INSERT INTO `tb_log` VALUES ('277', 'test2', '更新新闻', 'com.irs.controller.InformationController.updNews', 'com.irs.pojo.TbNews@974b68;org.apache.shiro.web.servlet.ShiroHttpServletRequest@d7d5ab;', '0:0:0:0:0:0:0:1', '2018-03-06 23:28:52');
INSERT INTO `tb_log` VALUES ('278', 'test2', '修改密码', 'com.irs.controller.AdminController.updPwd', 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@16cb11e;1212131;111111;', '0:0:0:0:0:0:0:1', '2018-03-06 23:29:27');
INSERT INTO `tb_log` VALUES ('279', 'test2', '修改密码', 'com.irs.controller.AdminController.updPwd', 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@177ccf2;123456;111111;', '0:0:0:0:0:0:0:1', '2018-03-06 23:29:41');
INSERT INTO `tb_log` VALUES ('280', 'admin', '添加管理员', 'com.irs.controller.AdminController.insAdmin', 'TbAdmin [id=null, username=tttt, password=123456, salt=null, fullname=rersr, eMail=sfasf@qwqe.com, sex=1, birthday=2018-03-06, address=11111111111, phone=11111111111, roleId=null, roleName=null];', '0:0:0:0:0:0:0:1', '2018-03-06 23:31:51');
INSERT INTO `tb_log` VALUES ('281', 'admin', '删除指定管理员', 'com.irs.controller.AdminController.delAdminById', '21;', '0:0:0:0:0:0:0:1', '2018-03-06 23:32:11');
INSERT INTO `tb_log` VALUES ('282', 'admin', '更新类别信息', 'com.irs.controller.InformationController.updCategory', 'TbNewsCategory [categoryId=1, categoryName=军事];', '0:0:0:0:0:0:0:1', '2018-03-06 23:32:43');
INSERT INTO `tb_log` VALUES ('283', 'admin', '更新类别信息', 'com.irs.controller.InformationController.updCategory', 'TbNewsCategory [categoryId=8, categoryName=历史1];', '0:0:0:0:0:0:0:1', '2018-03-06 23:32:50');
INSERT INTO `tb_log` VALUES ('284', 'admin', '更新类别信息', 'com.irs.controller.InformationController.updCategory', 'TbNewsCategory [categoryId=8, categoryName=历史];', '0:0:0:0:0:0:0:1', '2018-03-06 23:32:55');
INSERT INTO `tb_log` VALUES ('285', 'admin', '添加新闻类别', 'com.irs.controller.InformationController.insCategory', 'TbNewsCategory [categoryId=null, categoryName=其他];', '0:0:0:0:0:0:0:1', '2018-03-06 23:33:20');
INSERT INTO `tb_log` VALUES ('286', 'admin', '添加新闻类别', 'com.irs.controller.InformationController.insCategory', 'TbNewsCategory [categoryId=null, categoryName=其他2];', '0:0:0:0:0:0:0:1', '2018-03-06 23:33:34');
INSERT INTO `tb_log` VALUES ('287', 'admin', '新增新闻', 'com.irs.controller.InformationController.insNews', 'com.irs.pojo.TbNews@e2c956;org.apache.shiro.web.servlet.ShiroHttpServletRequest@1102d8e;', '0:0:0:0:0:0:0:1', '2018-03-06 23:34:04');
INSERT INTO `tb_log` VALUES ('288', 'admin', '删除类别信息', 'com.irs.controller.InformationController.delCategory', '25;', '0:0:0:0:0:0:0:1', '2018-03-06 23:34:19');
INSERT INTO `tb_log` VALUES ('289', 'admin', '更新新闻', 'com.irs.controller.InformationController.updNews', 'com.irs.pojo.TbNews@1d2a09a;org.apache.shiro.web.servlet.ShiroHttpServletRequest@12deec8;', '0:0:0:0:0:0:0:1', '2018-03-06 23:34:41');
INSERT INTO `tb_log` VALUES ('290', 'admin', '添加用户', 'com.irs.controller.UserManagementController.insUser', 'TbUsers [uid=null, eMail=593151322@qq.com, nickname=sdfsdf, sex=1, birthday=2018-03-08, address=dfs, phone=11111111111, eCode=null, status=null, createTime=null];', '0:0:0:0:0:0:0:1', '2018-03-08 22:01:04');
INSERT INTO `tb_log` VALUES ('291', 'admin', '删除指定角色信息', 'com.irs.controller.AdminController.delRole', '49;', '0:0:0:0:0:0:0:1', '2018-03-18 01:13:41');
INSERT INTO `tb_log` VALUES ('292', 'admin', '删除指定角色信息', 'com.irs.controller.AdminController.delRole', '51;', '0:0:0:0:0:0:0:1', '2018-03-18 01:14:53');
INSERT INTO `tb_log` VALUES ('293', 'admin', '添加角色信息', 'com.irs.controller.AdminController.insRole', 'TbRoles [roleId=null, roleName=test, roleRemark=test];1,1,34,11,9,35,11,9,37,11,9;', '0:0:0:0:0:0:0:1', '2018-03-18 01:16:49');
INSERT INTO `tb_log` VALUES ('294', 'admin', '删除指定角色信息', 'com.irs.controller.AdminController.delRole', '52;', '0:0:0:0:0:0:0:1', '2018-03-18 01:17:06');
INSERT INTO `tb_log` VALUES ('295', 'admin', '添加角色信息', '/sys/insRole', 'TbRoles [roleId=null, roleName=老师, roleRemark=123];1,1,33,10,9;', '127.0.0.1', '2018-04-13 18:41:23');

-- ----------------------------
-- Table structure for tb_menus
-- ----------------------------
DROP TABLE IF EXISTS `tb_menus`;
CREATE TABLE `tb_menus` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL COMMENT '菜单名',
  `icon` varchar(20) DEFAULT NULL COMMENT '图标',
  `href` varchar(100) DEFAULT NULL COMMENT '资源地址',
  `perms` varchar(500) DEFAULT NULL COMMENT '权限',
  `spread` varchar(10) NOT NULL COMMENT 'true：展开，false：不展开',
  `parent_id` bigint(20) NOT NULL COMMENT '父节点',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_menus
-- ----------------------------
INSERT INTO `tb_menus` VALUES ('1', '后台首页', '&#xe628;', 'page/main.html', null, 'false', '0');
INSERT INTO `tb_menus` VALUES ('2', '管理员管理', '&#xe612;', '', null, 'false', '0');
INSERT INTO `tb_menus` VALUES ('3', '角色管理', '&#xe613;', 'sys/roleList', null, 'false', '2');
INSERT INTO `tb_menus` VALUES ('4', '管理员列表', '&#xe613;', 'sys/adminList', null, 'false', '2');
INSERT INTO `tb_menus` VALUES ('9', '用户管理', '&#xe61d;', null, null, 'false', '0');
INSERT INTO `tb_menus` VALUES ('10', '添加用户', '&#xe608;', 'user/addUser', null, 'false', '9');
INSERT INTO `tb_menus` VALUES ('11', '管理用户', '&#xe60e;', 'user/userList', null, 'false', '9');
INSERT INTO `tb_menus` VALUES ('14', '系统日志', '&#xe61d;', null, null, 'false', '0');
INSERT INTO `tb_menus` VALUES ('15', '日志管理', '&#xe642;', 'log/logList', null, 'false', '14');
INSERT INTO `tb_menus` VALUES ('16', '查看', null, null, 'sys:role:list', 'false', '3');
INSERT INTO `tb_menus` VALUES ('17', '新增', null, null, 'sys:role:save', 'false', '3');
INSERT INTO `tb_menus` VALUES ('18', '修改', null, null, 'sys:role:update', 'false', '3');
INSERT INTO `tb_menus` VALUES ('19', '删除', null, null, 'sys:role:delete', 'false', '3');
INSERT INTO `tb_menus` VALUES ('20', '查看', null, null, 'sys:admin:list', 'false', '4');
INSERT INTO `tb_menus` VALUES ('21', '新增', null, null, 'sys:admin:save', 'false', '4');
INSERT INTO `tb_menus` VALUES ('22', '修改', null, null, 'sys:admin:update', 'false', '4');
INSERT INTO `tb_menus` VALUES ('23', '删除', null, null, 'sys:admin:delete', 'false', '4');
INSERT INTO `tb_menus` VALUES ('33', '新增', null, null, 'user:user:save', 'false', '10');
INSERT INTO `tb_menus` VALUES ('34', '查看', null, null, 'user:user:list', 'false', '11');
INSERT INTO `tb_menus` VALUES ('35', '新增', null, null, 'user:user:save', 'false', '11');
INSERT INTO `tb_menus` VALUES ('36', '修改', null, null, 'user:user:update', 'false', '11');
INSERT INTO `tb_menus` VALUES ('37', '删除', null, null, 'user:user:delete', 'false', '11');
INSERT INTO `tb_menus` VALUES ('42', '查看', null, null, 'log:log:list', 'false', '15');
INSERT INTO `tb_menus` VALUES ('45', '删除', null, null, 'log:log:delete', 'false', '15');

-- ----------------------------
-- Table structure for tb_roles
-- ----------------------------
DROP TABLE IF EXISTS `tb_roles`;
CREATE TABLE `tb_roles` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色编号',
  `role_name` varchar(50) DEFAULT NULL COMMENT '角色名',
  `role_remark` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_roles
-- ----------------------------
INSERT INTO `tb_roles` VALUES ('1', '超级管理员', '超级管理员');
INSERT INTO `tb_roles` VALUES ('2', '老师', '123');

-- ----------------------------
-- Table structure for tb_roles_menus
-- ----------------------------
DROP TABLE IF EXISTS `tb_roles_menus`;
CREATE TABLE `tb_roles_menus` (
  `menu_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`menu_id`,`role_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `tb_roles_menus_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `tb_menus` (`menu_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_roles_menus_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `tb_roles` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_roles_menus
-- ----------------------------
INSERT INTO `tb_roles_menus` VALUES ('1', '1');
INSERT INTO `tb_roles_menus` VALUES ('2', '1');
INSERT INTO `tb_roles_menus` VALUES ('3', '1');
INSERT INTO `tb_roles_menus` VALUES ('4', '1');
INSERT INTO `tb_roles_menus` VALUES ('9', '1');
INSERT INTO `tb_roles_menus` VALUES ('10', '1');
INSERT INTO `tb_roles_menus` VALUES ('11', '1');
INSERT INTO `tb_roles_menus` VALUES ('14', '1');
INSERT INTO `tb_roles_menus` VALUES ('15', '1');
INSERT INTO `tb_roles_menus` VALUES ('16', '1');
INSERT INTO `tb_roles_menus` VALUES ('17', '1');
INSERT INTO `tb_roles_menus` VALUES ('18', '1');
INSERT INTO `tb_roles_menus` VALUES ('19', '1');
INSERT INTO `tb_roles_menus` VALUES ('20', '1');
INSERT INTO `tb_roles_menus` VALUES ('21', '1');
INSERT INTO `tb_roles_menus` VALUES ('22', '1');
INSERT INTO `tb_roles_menus` VALUES ('23', '1');
INSERT INTO `tb_roles_menus` VALUES ('33', '1');
INSERT INTO `tb_roles_menus` VALUES ('34', '1');
INSERT INTO `tb_roles_menus` VALUES ('35', '1');
INSERT INTO `tb_roles_menus` VALUES ('36', '1');
INSERT INTO `tb_roles_menus` VALUES ('37', '1');
INSERT INTO `tb_roles_menus` VALUES ('42', '1');
INSERT INTO `tb_roles_menus` VALUES ('45', '1');
INSERT INTO `tb_roles_menus` VALUES ('1', '2');
INSERT INTO `tb_roles_menus` VALUES ('9', '2');
INSERT INTO `tb_roles_menus` VALUES ('10', '2');
INSERT INTO `tb_roles_menus` VALUES ('33', '2');

-- ----------------------------
-- Table structure for tb_users
-- ----------------------------
DROP TABLE IF EXISTS `tb_users`;
CREATE TABLE `tb_users` (
  `uid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `e_mail` varchar(50) NOT NULL,
  `nickname` varchar(50) NOT NULL COMMENT '昵称：唯一',
  `password` varchar(50) NOT NULL,
  `sex` varchar(1) NOT NULL COMMENT '0:女，1:男，2：保密',
  `birthday` date NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `e_code` varchar(50) NOT NULL,
  `status` varchar(1) DEFAULT NULL COMMENT '0:未激活，1，正常，2，禁用',
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_users
-- ----------------------------
INSERT INTO `tb_users` VALUES ('8', 'isduxd@163.com', 'admin', '96e79218965eb72c92a549dd5a330112', '2', '2018-02-17', '北京市通州区', '17693109997', '7783b2d8600247ee8bdbbf548e6ae553967', '1', '2018-02-19 22:06:24');
INSERT INTO `tb_users` VALUES ('14', '99392429@qq.com', 'test2', '96e79218965eb72c92a549dd5a330112', '1', '2018-02-08', '北京市通州区', '17693109998', '81181e3c53624effa07f9256a0efc154825', '0', '2018-02-18 22:44:43');
INSERT INTO `tb_users` VALUES ('15', 'isduxd@gmail.com', 'test1', '96e79218965eb72c92a549dd5a330112', '0', '2018-02-14', '北京通州科创十四街区', '17693109923', 'aa06647e073f4f26bbe62c1bf8ac3b15806', '2', '2018-02-20 19:01:39');
INSERT INTO `tb_users` VALUES ('24', '593151321@qq.com', 'sdfsf', '96e79218965eb72c92a549dd5a330112', '2', '2018-03-06', '北京通州科创十四街区', '17693109923', '6e09e238dce344aead7324092d7467c7640', '1', '2018-03-06 23:20:33');
INSERT INTO `tb_users` VALUES ('25', '593151322@qq.com', 'sdfsdf', '96e79218965eb72c92a549dd5a330112', '1', '2018-03-08', 'dfs', '11111111111', 'a1591600292f4441887f31c67bd084cb294', '0', '2018-03-08 22:01:04');
