/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : db_crm

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2018-11-06 17:16:32
*/ 
SET FOREIGN_KEY_CHECKS = 0;-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE
IF
	EXISTS `auth_group`;
CREATE TABLE `auth_group` (
	`id` INT ( 11 ) NOT NULL AUTO_INCREMENT,
	`name` VARCHAR ( 80 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	UNIQUE KEY `name` ( `name` ) 
) ENGINE = INNODB DEFAULT CHARSET = utf8mb4;-- ----------------------------
-- Records of auth_group
-- ----------------------------
-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE
IF
	EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
	`id` INT ( 11 ) NOT NULL AUTO_INCREMENT,
	`group_id` INT ( 11 ) NOT NULL,
	`permission_id` INT ( 11 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` ( `group_id`, `permission_id` ),
	KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` ( `permission_id` ),
	CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY ( `permission_id` ) REFERENCES `auth_permission` ( `id` ),
	CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY ( `group_id` ) REFERENCES `auth_group` ( `id` ) 
) ENGINE = INNODB DEFAULT CHARSET = utf8mb4;-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------
-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE
IF
	EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
	`id` INT ( 11 ) NOT NULL AUTO_INCREMENT,
	`name` VARCHAR ( 255 ) NOT NULL,
	`content_type_id` INT ( 11 ) NOT NULL,
	`codename` VARCHAR ( 100 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` ( `content_type_id`, `codename` ),
	CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY ( `content_type_id` ) REFERENCES `django_content_type` ( `id` ) 
) ENGINE = INNODB DEFAULT CHARSET = utf8mb4;-- ----------------------------
-- Records of auth_permission
-- ----------------------------
-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE
IF
	EXISTS `auth_user`;
CREATE TABLE `auth_user` (
	`id` INT ( 11 ) NOT NULL AUTO_INCREMENT,
	`password` VARCHAR ( 128 ) NOT NULL,
	`last_login` datetime ( 6 ) DEFAULT NULL,
	`is_superuser` TINYINT ( 1 ) NOT NULL,
	`username` VARCHAR ( 150 ) NOT NULL,
	`first_name` VARCHAR ( 30 ) NOT NULL,
	`last_name` VARCHAR ( 150 ) NOT NULL,
	`email` VARCHAR ( 254 ) NOT NULL,
	`is_staff` TINYINT ( 1 ) NOT NULL,
	`is_active` TINYINT ( 1 ) NOT NULL,
	`date_joined` datetime ( 6 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	UNIQUE KEY `username` ( `username` ) 
) ENGINE = INNODB DEFAULT CHARSET = utf8mb4;-- ----------------------------
-- Records of auth_user
-- ----------------------------
-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE
IF
	EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
	`id` INT ( 11 ) NOT NULL AUTO_INCREMENT,
	`user_id` INT ( 11 ) NOT NULL,
	`group_id` INT ( 11 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` ( `user_id`, `group_id` ),
	KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` ( `group_id` ),
	CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY ( `group_id` ) REFERENCES `auth_group` ( `id` ),
	CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY ( `user_id` ) REFERENCES `auth_user` ( `id` ) 
) ENGINE = INNODB DEFAULT CHARSET = utf8mb4;-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------
-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE
IF
	EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
	`id` INT ( 11 ) NOT NULL AUTO_INCREMENT,
	`user_id` INT ( 11 ) NOT NULL,
	`permission_id` INT ( 11 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` ( `user_id`, `permission_id` ),
	KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` ( `permission_id` ),
	CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY ( `permission_id` ) REFERENCES `auth_permission` ( `id` ),
	CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY ( `user_id` ) REFERENCES `auth_user` ( `id` ) 
) ENGINE = INNODB DEFAULT CHARSET = utf8mb4;-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------
-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE
IF
	EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
	`id` INT ( 11 ) NOT NULL AUTO_INCREMENT,
	`action_time` datetime ( 6 ) NOT NULL,
	`object_id` LONGTEXT,
	`object_repr` VARCHAR ( 200 ) NOT NULL,
	`action_flag` SMALLINT ( 5 ) UNSIGNED NOT NULL,
	`change_message` LONGTEXT NOT NULL,
	`content_type_id` INT ( 11 ) DEFAULT NULL,
	`user_id` INT ( 11 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` ( `content_type_id` ),
	KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` ( `user_id` ),
	CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY ( `content_type_id` ) REFERENCES `django_content_type` ( `id` ),
	CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY ( `user_id` ) REFERENCES `auth_user` ( `id` ) 
) ENGINE = INNODB DEFAULT CHARSET = utf8mb4;-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE
IF
	EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
	`id` INT ( 11 ) NOT NULL AUTO_INCREMENT,
	`app_label` VARCHAR ( 100 ) NOT NULL,
	`model` VARCHAR ( 100 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` ( `app_label`, `model` ) 
) ENGINE = INNODB DEFAULT CHARSET = utf8mb4;-- ----------------------------
-- Records of django_content_type
-- ----------------------------
-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE
IF
	EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
	`id` INT ( 11 ) NOT NULL AUTO_INCREMENT,
	`app` VARCHAR ( 255 ) NOT NULL,
	`name` VARCHAR ( 255 ) NOT NULL,
	`applied` datetime ( 6 ) NOT NULL,
	PRIMARY KEY ( `id` ) 
) ENGINE = INNODB AUTO_INCREMENT = 16 DEFAULT CHARSET = utf8mb4;-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations`
VALUES
	( '1', 'contenttypes', '0001_initial', '2018-10-23 20:37:09.271308' );
INSERT INTO `django_migrations`
VALUES
	( '2', 'auth', '0001_initial', '2018-10-23 20:37:10.073920' );
INSERT INTO `django_migrations`
VALUES
	( '3', 'admin', '0001_initial', '2018-10-23 20:37:10.258801' );
INSERT INTO `django_migrations`
VALUES
	( '4', 'admin', '0002_logentry_remove_auto_add', '2018-10-23 20:37:10.274810' );
INSERT INTO `django_migrations`
VALUES
	( '5', 'admin', '0003_logentry_add_action_flag_choices', '2018-10-23 20:37:10.288784' );
INSERT INTO `django_migrations`
VALUES
	( '6', 'contenttypes', '0002_remove_content_type_name', '2018-10-23 20:37:10.404719' );
INSERT INTO `django_migrations`
VALUES
	( '7', 'auth', '0002_alter_permission_name_max_length', '2018-10-23 20:37:10.467684' );
INSERT INTO `django_migrations`
VALUES
	( '8', 'auth', '0003_alter_user_email_max_length', '2018-10-23 20:37:10.536676' );
INSERT INTO `django_migrations`
VALUES
	( '9', 'auth', '0004_alter_user_username_opts', '2018-10-23 20:37:10.551667' );
INSERT INTO `django_migrations`
VALUES
	( '10', 'auth', '0005_alter_user_last_login_null', '2018-10-23 20:37:10.612633' );
INSERT INTO `django_migrations`
VALUES
	( '11', 'auth', '0006_require_contenttypes_0002', '2018-10-23 20:37:10.618642' );
INSERT INTO `django_migrations`
VALUES
	( '12', 'auth', '0007_alter_validators_add_error_messages', '2018-10-23 20:37:10.633637' );
INSERT INTO `django_migrations`
VALUES
	( '13', 'auth', '0008_alter_user_username_max_length', '2018-10-23 20:37:10.722568' );
INSERT INTO `django_migrations`
VALUES
	( '14', 'auth', '0009_alter_user_last_name_max_length', '2018-10-23 20:37:10.794549' );
INSERT INTO `django_migrations`
VALUES
	( '15', 'sessions', '0001_initial', '2018-10-23 20:37:10.864494' );-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE
IF
	EXISTS `django_session`;
CREATE TABLE `django_session` (
	`session_key` VARCHAR ( 40 ) NOT NULL,
	`session_data` LONGTEXT NOT NULL,
	`expire_date` datetime ( 6 ) NOT NULL,
	PRIMARY KEY ( `session_key` ),
	KEY `django_session_expire_date_a5c62663` ( `expire_date` ) 
) ENGINE = INNODB DEFAULT CHARSET = utf8mb4;-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session`
VALUES
	( '7p1oqn402sie3xjobczdaua9ac26sbp1', 'MzU2NjI2ZDkxOTg0MTJhMTdhOGYyOWQ4MWMyYzExZTU0OGUwYmFmMDp7InVzZXJuYW1lX3Nlc3Npb24iOiJ6aGFuZ3NhbiIsIl9zZXNzaW9uX2V4cGlyeSI6MCwidXNlcl9wZXJtaXNzaW9uIjpbIjEwIiwiMTAxMCIsIjEwMTAwMiIsIjEwMTAwMyIsIjEwMjAiLCIxMDIwMDEiLCIyMCIsIjIwMTAiLCIyMDEwMDEiLCIyMDEwMDIiLCIyMDIwIiwiNDAiLCI0MDEwIiwiNjAiLCIyMDEwMDMiLCI2MDQwIiwiNjA1MCIsIjQwMzAiXX0=', '2018-11-20 11:23:08.685880' );
INSERT INTO `django_session`
VALUES
	( 'aosf17utmxtzw4snaaivl36yqjym29nj', 'MzU2NjI2ZDkxOTg0MTJhMTdhOGYyOWQ4MWMyYzExZTU0OGUwYmFmMDp7InVzZXJuYW1lX3Nlc3Npb24iOiJ6aGFuZ3NhbiIsIl9zZXNzaW9uX2V4cGlyeSI6MCwidXNlcl9wZXJtaXNzaW9uIjpbIjEwIiwiMTAxMCIsIjEwMTAwMiIsIjEwMTAwMyIsIjEwMjAiLCIxMDIwMDEiLCIyMCIsIjIwMTAiLCIyMDEwMDEiLCIyMDEwMDIiLCIyMDIwIiwiNDAiLCI0MDEwIiwiNjAiLCIyMDEwMDMiLCI2MDQwIiwiNjA1MCIsIjQwMzAiXX0=', '2018-11-20 11:40:01.369143' );
INSERT INTO `django_session`
VALUES
	( 'ntberci5jqiqwf9vwqhjtwi6hgb8i070', 'OGZiYzllNjEyMTQ2MGMxMjQ5NTdjYTY1MjJmZGU5ZmQ0YWNhY2NkNzp7Il9zZXNzaW9uX2V4cGlyeSI6MCwidXNlcm5hbWVfc2Vzc2lvbiI6InNoc3h0IiwidXNlcl9wZXJtaXNzaW9uIjpbIjEwIiwiMTAxMCIsIjEwMTAwMSIsIjEwMTAwMiIsIjEwMTAwMyIsIjEwMjAiLCIxMDIwMDEiLCIyMCIsIjIwMTAiLCIyMDEwMDEiLCIyMDEwMDIiLCIyMDIwIiwiNDAiLCI0MDEwIiwiMzAiLCI1MCIsIjYwIiwiMjAxMDAzIiwiNjA0MCIsIjYwNTAiLCI2MDMwIiwiNjAyMCIsIjYwMTAiLCIzMDEwIl19', '2018-11-20 15:59:09.154495' );
INSERT INTO `django_session`
VALUES
	( 'r0f4tresdmqaskj4226kg57j9137i69y', 'ZGM4Yjk4ZTYwYzc2MmZkZDQxOTUyZmYxZTA4OWMwYTI5ZDIzNWJhYzp7InVzZXJuYW1lX3Nlc3Npb24iOiJzaHN4dCIsIl9zZXNzaW9uX2V4cGlyeSI6MCwidXNlcl9wZXJtaXNzaW9uIjpbIjEwIiwiMTAxMCIsIjEwMTAwMSIsIjEwMTAwMiIsIjEwMTAwMyIsIjEwMjAiLCIxMDIwMDEiLCIyMCIsIjIwMTAiLCIyMDEwMDEiLCIyMDEwMDIiLCIyMDIwIiwiNDAiLCI0MDEwIiwiMzAiLCI1MCIsIjYwIiwiMjAxMDAzIiwiNjA0MCIsIjYwNTAiLCI2MDMwIiwiNjAyMCIsIjYwMTAiXX0=', '2018-11-20 15:11:15.495189' );-- ----------------------------
-- Table structure for t_customer
-- ----------------------------
DROP TABLE
IF
	EXISTS `t_customer`;
CREATE TABLE `t_customer` (
	`id` INT ( 11 ) NOT NULL AUTO_INCREMENT,
	`khno` VARCHAR ( 20 ) DEFAULT NULL,
	`name` VARCHAR ( 20 ) DEFAULT NULL,
	`area` VARCHAR ( 20 ) DEFAULT NULL,
	`cus_manager` VARCHAR ( 20 ) DEFAULT NULL,
	`level` VARCHAR ( 30 ) DEFAULT NULL,
	`myd` VARCHAR ( 30 ) DEFAULT NULL,
	`xyd` VARCHAR ( 30 ) DEFAULT NULL,
	`address` VARCHAR ( 500 ) DEFAULT NULL,
	`post_code` VARCHAR ( 50 ) DEFAULT NULL,
	`phone` VARCHAR ( 20 ) DEFAULT NULL,
	`fax` VARCHAR ( 20 ) DEFAULT NULL,
	`web_site` VARCHAR ( 20 ) DEFAULT NULL,
	`yyzzzch` VARCHAR ( 50 ) DEFAULT NULL,
	`fr` VARCHAR ( 20 ) DEFAULT NULL,
	`zczj` VARCHAR ( 20 ) DEFAULT NULL,
	`nyye` VARCHAR ( 20 ) DEFAULT NULL,
	`khyh` VARCHAR ( 50 ) DEFAULT NULL,
	`khzh` VARCHAR ( 50 ) DEFAULT NULL,
	`dsdjh` VARCHAR ( 50 ) DEFAULT NULL,
	`gsdjh` VARCHAR ( 50 ) DEFAULT NULL,
	`state` INT ( 11 ) DEFAULT NULL,
	`is_valid` INT ( 4 ) DEFAULT '1',
	`create_date` datetime DEFAULT NULL,
	`update_date` datetime DEFAULT NULL,
	PRIMARY KEY ( `id` ) 
) ENGINE = INNODB AUTO_INCREMENT = 137 DEFAULT CHARSET = utf8;-- ----------------------------
-- Records of t_customer
-- ----------------------------
INSERT INTO `t_customer`
VALUES
	(
		'1',
		'KH21321321',
		'北京大牛科技',
		'北京',
		'小张',
		'战略合作伙伴',
		'☆☆☆',
		'☆☆☆',
		'北京海淀区双榆树东里15号',
		'100027',
		'010-62263393',
		'010-62263393',
		'www.daniu.com',
		'420103000057404',
		'张三',
		'1000',
		'1111',
		'中国银行',
		'6225231243641',
		'4422214321321',
		'4104322332',
		'1',
		'1',
		'2016-02-25 11:28:43',
		'2017-03-02 15:06:54' 
	);
INSERT INTO `t_customer`
VALUES
	(
		'16',
		'KH20150526073022',
		'风驰科技',
		'北京',
		'小红',
		'大客户',
		'☆',
		'☆',
		'321',
		'21',
		'321',
		'321',
		'321',
		'321',
		'321',
		'',
		'21',
		'321',
		'321',
		'321',
		'3213',
		'2',
		'1',
		'2016-01-25 12:15:19',
		'2017-08-09 16:45:30' 
	);
INSERT INTO `t_customer`
VALUES
	(
		'17',
		'KH20150526073023',
		'巨人科技',
		NULL,
		'小丽',
		'普通客户',
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		'1',
		'1',
		'2016-11-25 12:15:28',
		'2017-08-19 16:24:05' 
	);
INSERT INTO `t_customer`
VALUES
	(
		'18',
		'KH20150526073024',
		'新人科技',
		NULL,
		NULL,
		'重点开发客户',
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		'0',
		'1',
		'2016-11-25 12:15:25',
		'2016-11-28 11:46:29' 
	);
INSERT INTO `t_customer`
VALUES
	(
		'19',
		'KH20150526073025',
		'好人集团',
		'',
		'',
		'合作伙伴',
		'',
		'',
		'',
		'',
		'',
		'',
		'',
		'',
		'',
		'',
		'11111111',
		'',
		'',
		'',
		'',
		'0',
		'1',
		'2016-11-25 12:15:31',
		'2017-03-02 18:28:19' 
	);
INSERT INTO `t_customer`
VALUES
	(
		'20',
		'KH20150526073026',
		'新浪',
		NULL,
		NULL,
		'大客户',
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		'0',
		'1',
		'2016-11-25 12:15:33',
		'2016-11-28 11:46:34' 
	);
INSERT INTO `t_customer`
VALUES
	(
		'21',
		'KH20150526073027',
		'百度',
		NULL,
		NULL,
		'大客户',
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		'1',
		'1',
		'2016-01-25 12:15:36',
		'2016-11-28 11:46:37' 
	);
INSERT INTO `t_customer`
VALUES
	(
		'29',
		'KH201608241829510',
		'上海聪享科技1',
		'北京',
		'小明',
		'重点开发客户',
		'☆☆☆☆☆',
		'☆',
		'上海市徐汇区虹梅路153',
		'200233',
		'13666666666',
		'134',
		'www.shsxt.com',
		'13344',
		'老王',
		'100',
		'10000',
		'中国银行',
		'123456456',
		'4535213212',
		'中国',
		'0',
		'1',
		'2016-08-24 18:29:50',
		'2016-08-24 18:46:11' 
	);
INSERT INTO `t_customer`
VALUES
	(
		'30',
		'KH201609011709179',
		'天猫11',
		'上海',
		'小红',
		'大客户',
		'☆',
		'☆☆☆',
		'1111fsdf',
		'200233',
		'11111',
		'111',
		'111',
		'11',
		'老宋',
		'1000',
		'1000000',
		'中国银行',
		'6225231243641',
		'4535213212',
		'中国',
		'1',
		'1',
		'2016-01-01 17:09:16',
		'2017-07-04 17:52:27' 
	);
INSERT INTO `t_customer`
VALUES
	(
		'31',
		'KH201611241605785',
		'test001',
		'北京',
		'小明',
		'普通客户',
		'☆☆',
		'☆☆',
		'123213123',
		'123231',
		'1212323123',
		'12323',
		'123213',
		'213213',
		'21321',
		'2132',
		'123',
		'123',
		'123213',
		'213',
		'213',
		'0',
		'0',
		'2016-11-24 16:05:34',
		'2018-11-05 14:26:24' 
	);
INSERT INTO `t_customer`
VALUES
	(
		'32',
		'KH201611241608301',
		'test002002002',
		'南京',
		'小明',
		'重点开发客户',
		'☆☆☆',
		'☆☆',
		'213213',
		'23213',
		'123213',
		'12323',
		'2321',
		'123',
		'213',
		'123',
		'123',
		'123',
		'12312',
		'123',
		'123',
		'0',
		'1',
		'2016-11-24 16:08:37',
		'2016-11-24 16:08:50' 
	);
INSERT INTO `t_customer`
VALUES
	(
		'35',
		'KH20170703145613140',
		'上海尚学堂浦东校区',
		'上海',
		'小明',
		'重点开发客户',
		'☆',
		'☆☆☆☆☆',
		'浦东张江高科1号11',
		'100027',
		'13644443333',
		'021-89898989',
		'www.shsxt.com',
		'420103000057404',
		'廖老师',
		'10000000',
		'1',
		'中国银行',
		'89890100001010103947',
		'3242342423',
		'234234234',
		'0',
		'1',
		'2017-07-03 14:56:14',
		'2017-07-03 15:05:15' 
	);
INSERT INTO `t_customer`
VALUES
	(
		'36',
		'KH20170703150344713',
		'上海尚学堂浦东校区1',
		'北京',
		'admin1',
		'普通客户',
		'☆',
		'☆☆☆☆☆',
		'浦东张江高科1号',
		'100027',
		'13644443333',
		'021-89898989',
		'www.shsxt.com',
		'420103000057404',
		'赵老师',
		'10000000',
		'1',
		'中国银行',
		'89890100001010103947',
		'3242342423',
		'234234234',
		'0',
		'1',
		'2017-07-03 15:03:44',
		'2017-07-03 15:03:44' 
	);
INSERT INTO `t_customer`
VALUES
	(
		'37',
		'KH2017-08-18175',
		'尚学堂',
		'上海',
		'小明',
		'不小的客户',
		'☆☆☆☆☆',
		'☆☆☆☆☆',
		'荣乐中路2369弄42号',
		'200000',
		'13888888888',
		'021-89898989',
		'www.shsxt.com',
		'420103000057404',
		'李林',
		'1000',
		'10000000000',
		'中国银行',
		'12345677898990000',
		'324234',
		'234234',
		'0',
		'1',
		'2017-08-18 16:55:35',
		'2017-08-18 17:04:15' 
	);
INSERT INTO `t_customer`
VALUES
	(
		'38',
		'KH2017-08-18205',
		'尚学堂-李林学院',
		'上海',
		'小明',
		'不小的客户',
		'☆☆☆☆☆',
		'☆☆☆☆☆',
		'荣乐中路2369弄42号',
		'200000',
		'13888888888',
		'021-89898989',
		'www.shsxt.com',
		'420103000057404',
		'李林',
		'1000',
		'10000000000',
		'中国银行',
		'12345677898990000',
		'324234',
		'234234',
		'0',
		'1',
		'2017-08-18 16:57:25',
		'2017-08-18 17:03:38' 
	);
INSERT INTO `t_customer`
VALUES
	(
		'39',
		'KH20170818170004820',
		'尚学堂-郑昊',
		'广州',
		'admin1',
		'不小的客户',
		'☆',
		'☆',
		'浦东张江高科1号',
		'200000',
		'13644443333',
		'021-89898989',
		'www.shsxt.com',
		'420103000057404',
		'郑昊',
		'12000',
		'1',
		'农业银行',
		'257687888',
		'22',
		'22',
		'0',
		'1',
		'2017-08-18 17:00:05',
		'2017-08-18 17:03:38' 
	);
INSERT INTO `t_customer`
VALUES
	(
		'40',
		'KH21321321',
		'北京大牛科技',
		'北京',
		'小张',
		'战略合作伙伴',
		'☆☆☆',
		'☆☆☆',
		'北京海淀区双榆树东里15号',
		'100027',
		'010-62263393',
		'010-62263393',
		'www.daniu.com',
		'420103000057404',
		'张三',
		'1000',
		'1111',
		'中国银行',
		'6225231243641',
		'4422214321321',
		'4104322332',
		'1',
		'1',
		'2016-02-25 11:28:43',
		'2017-03-02 15:06:54' 
	);
INSERT INTO `t_customer`
VALUES
	(
		'42',
		'KH20150526073023',
		'巨人科技',
		NULL,
		'小丽',
		'普通客户',
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		'1',
		'1',
		'2016-11-25 12:15:28',
		'2017-08-19 16:24:05' 
	);
INSERT INTO `t_customer`
VALUES
	(
		'43',
		'KH20150526073024',
		'新人科技',
		NULL,
		NULL,
		'重点开发客户',
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		'0',
		'1',
		'2016-11-25 12:15:25',
		'2016-11-28 11:46:29' 
	);
INSERT INTO `t_customer`
VALUES
	(
		'44',
		'KH20150526073025',
		'好人集团',
		'',
		'',
		'合作伙伴',
		'',
		'',
		'',
		'',
		'',
		'',
		'',
		'',
		'',
		'',
		'11111111',
		'',
		'',
		'',
		'',
		'0',
		'1',
		'2016-11-25 12:15:31',
		'2017-03-02 18:28:19' 
	);
INSERT INTO `t_customer`
VALUES
	(
		'45',
		'KH20150526073026',
		'新浪',
		NULL,
		NULL,
		'大客户',
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		'0',
		'1',
		'2016-11-25 12:15:33',
		'2016-11-28 11:46:34' 
	);
INSERT INTO `t_customer`
VALUES
	(
		'46',
		'KH20150526073027',
		'百度',
		NULL,
		NULL,
		'大客户',
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		'1',
		'1',
		'2016-01-25 12:15:36',
		'2016-11-28 11:46:37' 
	);
INSERT INTO `t_customer`
VALUES
	(
		'48',
		'KH201608241829510',
		'上海聪享科技1',
		'北京',
		'小明',
		'重点开发客户',
		'☆☆☆☆☆',
		'☆',
		'上海市徐汇区虹梅路153',
		'200233',
		'13666666666',
		'134',
		'www.shsxt.com',
		'13344',
		'老王',
		'100',
		'10000',
		'中国银行',
		'123456456',
		'4535213212',
		'中国',
		'0',
		'1',
		'2016-08-24 18:29:50',
		'2016-08-24 18:46:11' 
	);
INSERT INTO `t_customer`
VALUES
	(
		'49',
		'KH201609011709179',
		'天猫11',
		'上海',
		'小红',
		'大客户',
		'☆',
		'☆☆☆',
		'1111fsdf',
		'200233',
		'11111',
		'111',
		'111',
		'11',
		'老宋',
		'1000',
		'1000000',
		'中国银行',
		'6225231243641',
		'4535213212',
		'中国',
		'1',
		'1',
		'2016-01-01 17:09:16',
		'2017-07-04 17:52:27' 
	);
INSERT INTO `t_customer`
VALUES
	(
		'50',
		'KH201611241605785',
		'test001',
		'北京',
		'小明',
		'普通客户',
		'☆☆',
		'☆☆',
		'123213123',
		'123231',
		'1212323123',
		'12323',
		'123213',
		'213213',
		'21321',
		'2132',
		'123',
		'123',
		'123213',
		'213',
		'213',
		'0',
		'1',
		'2016-11-24 16:05:34',
		'2016-11-24 16:06:14' 
	);
INSERT INTO `t_customer`
VALUES
	(
		'51',
		'KH201611241608301',
		'test002002002',
		'南京',
		'小明',
		'重点开发客户',
		'☆☆☆',
		'☆☆',
		'213213',
		'23213',
		'123213',
		'12323',
		'2321',
		'123',
		'213',
		'123',
		'123',
		'123',
		'12312',
		'123',
		'123',
		'0',
		'1',
		'2016-11-24 16:08:37',
		'2016-11-24 16:08:50' 
	);
INSERT INTO `t_customer`
VALUES
	(
		'52',
		NULL,
		'尚学堂科技',
		'上海',
		'zs',
		'战略合作伙伴',
		'☆☆☆☆☆',
		'☆☆☆☆☆',
		'上海绿地伯顿',
		'100100',
		'100111',
		'sxt@sxt.cn',
		'www.shsxt.com',
		'10010000',
		'老裴',
		'100',
		'100',
		'1001111',
		'10011111',
		'1111111',
		'11111',
		'0',
		'1',
		'2016-12-27 16:23:58',
		'2016-12-27 16:23:58' 
	);
INSERT INTO `t_customer`
VALUES
	(
		'54',
		'KH20170703145613140',
		'上海尚学堂浦东校区',
		'上海',
		'小明',
		'重点开发客户',
		'☆',
		'☆☆☆☆☆',
		'浦东张江高科1号11',
		'100027',
		'13644443333',
		'021-89898989',
		'www.shsxt.com',
		'420103000057404',
		'廖老师',
		'10000000',
		'1',
		'中国银行',
		'89890100001010103947',
		'3242342423',
		'234234234',
		'0',
		'1',
		'2017-07-03 14:56:14',
		'2017-07-03 15:05:15' 
	);
INSERT INTO `t_customer`
VALUES
	(
		'56',
		'KH2017-08-18175',
		'尚学堂',
		'上海',
		'小明',
		'不小的客户',
		'☆☆☆☆☆',
		'☆☆☆☆☆',
		'荣乐中路2369弄42号',
		'200000',
		'13888888888',
		'021-89898989',
		'www.shsxt.com',
		'420103000057404',
		'李林',
		'1000',
		'10000000000',
		'中国银行',
		'12345677898990000',
		'324234',
		'234234',
		'0',
		'1',
		'2017-08-18 16:55:35',
		'2017-08-18 17:04:15' 
	);
INSERT INTO `t_customer`
VALUES
	(
		'57',
		'KH2017-08-18205',
		'尚学堂-李林学院',
		'上海',
		'小明',
		'不小的客户',
		'☆☆☆☆☆',
		'☆☆☆☆☆',
		'荣乐中路2369弄42号',
		'200000',
		'13888888888',
		'021-89898989',
		'www.shsxt.com',
		'420103000057404',
		'李林',
		'1000',
		'10000000000',
		'中国银行',
		'12345677898990000',
		'324234',
		'234234',
		'0',
		'1',
		'2017-08-18 16:57:25',
		'2017-08-18 17:03:38' 
	);
INSERT INTO `t_customer`
VALUES
	(
		'58',
		'KH20170818170004820',
		'尚学堂-郑昊',
		'上海',
		'admin1',
		'不小的客户',
		'☆',
		'☆',
		'浦东张江高科1号',
		'200000',
		'13644443333',
		'021-89898989',
		'www.shsxt.com',
		'420103000057404',
		'郑昊',
		'12000',
		'1',
		'农业银行',
		'257687888',
		'22',
		'22',
		'0',
		'1',
		'2017-08-18 17:00:05',
		'2017-08-18 17:03:38' 
	);
INSERT INTO `t_customer`
VALUES
	(
		'66',
		'KH20170703150344713',
		'上海尚学堂浦东校区1',
		'北京',
		'admin1',
		'普通客户',
		'☆',
		'☆☆☆☆☆',
		'浦东张江高科1号',
		'100027',
		'13644443333',
		'021-89898989',
		'www.shsxt.com',
		'420103000057404',
		'赵老师',
		'10000000',
		'1',
		'中国银行',
		'89890100001010103947',
		'3242342423',
		'234234234',
		'0',
		'1',
		'2017-07-03 15:03:44',
		'2017-07-03 15:03:44' 
	);
INSERT INTO `t_customer`
VALUES
	(
		'80',
		'KH201612271628316',
		'浦西尚学堂',
		'上海',
		'zs',
		'战略合作伙伴',
		'☆☆☆☆☆',
		'☆☆☆☆☆',
		'浦东新区',
		'100100',
		'123123123123',
		'sxt@sxt.cn',
		'www.shsxt.com',
		'1001000',
		'老裴',
		'100',
		'22',
		'工商',
		'100100000',
		'1000',
		'10000',
		'0',
		'1',
		'2016-12-27 16:28:21',
		'2017-03-02 13:18:17' 
	);
INSERT INTO `t_customer`
VALUES
	(
		'124',
		'20181027212807',
		'Python3期',
		'上海',
		'李四',
		'潜力客户',
		'☆☆☆☆☆',
		'☆☆☆☆☆',
		'Python3期教室',
		'123123',
		'',
		'021-123123',
		'www.shsxt.com',
		'123',
		'你猜',
		'123',
		'123',
		'中国银行',
		'123',
		'123',
		'123',
		'0',
		'1',
		'2018-10-27 21:28:47',
		'2018-10-27 21:28:47' 
	);
INSERT INTO `t_customer`
VALUES
	(
		'129',
		'KH20181030112305268',
		'新浪博客',
		'上海',
		'新浪博客',
		'大客户',
		'☆☆☆☆☆',
		'☆☆☆☆☆',
		'123123',
		'123123',
		'123123',
		'123123',
		'123123',
		'123123',
		'123123',
		'123123',
		'123123',
		'123123',
		'123123',
		'123123',
		'123123',
		'0',
		'0',
		'2018-10-30 11:23:11',
		'2018-10-30 11:23:11' 
	);
INSERT INTO `t_customer`
VALUES
	(
		'130',
		'KH20181030112649994',
		'百度',
		'北京',
		'百度',
		'大客户',
		'☆☆☆☆☆',
		'☆☆☆☆☆',
		'百度',
		'百度',
		'百度',
		'百度',
		'百度',
		'百度',
		'百度',
		'百度',
		'百度',
		'百度',
		'百度',
		'百度',
		'百度',
		'0',
		'0',
		'2018-10-30 11:26:49',
		'2018-10-30 11:26:49' 
	);
INSERT INTO `t_customer`
VALUES
	(
		'133',
		'KH20181030113942974',
		'腾讯',
		'深圳',
		'腾讯',
		'大客户',
		'☆☆☆☆☆',
		'☆☆☆☆☆',
		'腾讯',
		'腾讯',
		'腾讯',
		'腾讯',
		'腾讯',
		'腾讯',
		'腾讯',
		'腾讯',
		'腾讯',
		'腾讯',
		'腾讯',
		'腾讯',
		'腾讯',
		'0',
		'0',
		'2018-10-30 11:39:42',
		'2018-10-30 11:39:42' 
	);
INSERT INTO `t_customer`
VALUES
	(
		'134',
		'KH20181030115321992',
		'尚学堂',
		'上海',
		'尚学堂',
		'大客户',
		'☆☆☆☆☆',
		'☆☆☆☆☆',
		'尚学堂',
		'尚学堂',
		'尚学堂',
		'尚学堂',
		'尚学堂',
		'尚学堂',
		'尚学堂',
		'尚学堂',
		'尚学堂',
		'尚学堂',
		'尚学堂',
		'尚学堂',
		'尚学堂',
		'0',
		'0',
		'2018-10-30 11:53:21',
		'2018-10-30 11:53:21' 
	);
INSERT INTO `t_customer`
VALUES
	(
		'135',
		'KH20181030140749626',
		'阿里',
		'上海',
		'阿里',
		'大客户',
		'☆☆☆☆☆',
		'☆☆☆☆☆',
		'阿里',
		'阿里',
		'阿里',
		'阿里',
		'阿里',
		'阿里',
		'阿里',
		'阿里',
		'阿里',
		'阿里',
		'阿里',
		'阿里',
		'阿里',
		'0',
		'0',
		'2018-10-30 14:07:49',
		'2018-10-30 14:07:49' 
	);
INSERT INTO `t_customer`
VALUES
	(
		'136',
		'KH20181030144352899',
		'北京',
		'北京',
		'北京',
		'重点开发客户',
		'☆☆☆',
		'☆☆☆',
		'北京',
		'北京',
		'asd',
		'北京',
		'asd',
		'北京',
		'asd',
		'北京',
		'asd',
		'北京',
		'asd',
		'北京',
		'asd',
		'0',
		'0',
		'2018-10-30 14:43:53',
		'2018-10-30 14:51:34' 
	);-- ----------------------------
-- Table structure for t_customer_contact
-- ----------------------------
DROP TABLE
IF
	EXISTS `t_customer_contact`;
CREATE TABLE `t_customer_contact` (
	`id` INT ( 11 ) NOT NULL AUTO_INCREMENT,
	`cus_id` INT ( 11 ) DEFAULT NULL,
	`contact_time` datetime DEFAULT NULL,
	`address` VARCHAR ( 500 ) DEFAULT NULL,
	`overview` VARCHAR ( 100 ) DEFAULT NULL,
	`create_date` datetime DEFAULT NULL,
	`update_date` datetime DEFAULT NULL,
	`is_valid` INT ( 4 ) DEFAULT '1',
	PRIMARY KEY ( `id` ) 
) ENGINE = INNODB AUTO_INCREMENT = 19 DEFAULT CHARSET = utf8;-- ----------------------------
-- Records of t_customer_contact
-- ----------------------------
INSERT INTO `t_customer_contact`
VALUES
	( '1', '1', '2015-05-14 05:00:00', '1', '2', NULL, NULL, '1' );
INSERT INTO `t_customer_contact`
VALUES
	( '2', '1', '2015-05-06 00:00:00', '12', '22', NULL, NULL, '1' );
INSERT INTO `t_customer_contact`
VALUES
	( '3', '1', '2015-08-22 00:00:00', '珠江路2', '吃饭2', NULL, NULL, '1' );
INSERT INTO `t_customer_contact`
VALUES
	( '4', '1', '2016-09-01 00:00:00', '112', '233', '2016-09-01 09:53:39', '2016-09-01 09:53:39', '0' );
INSERT INTO `t_customer_contact`
VALUES
	( '5', '1', '2016-11-22 00:00:00', '师德师风', '阿德的', '2016-11-25 09:38:37', '2016-11-25 09:38:37', '1' );
INSERT INTO `t_customer_contact`
VALUES
	( '6', NULL, '2017-07-03 16:15:44', '兰州拉面大酒店', '吃大盘鸡', '2017-07-03 16:16:02', '2017-07-03 16:16:02', '1' );
INSERT INTO `t_customer_contact`
VALUES
	( '7', NULL, '2017-07-03 16:16:28', '拉面大酒店', '吃大盘鸡', '2017-07-03 16:16:48', '2017-07-03 16:16:48', '1' );
INSERT INTO `t_customer_contact`
VALUES
	( '8', '35', '2017-07-03 16:17:03', '沙县国际大酒店', '鸭腿饭', '2017-07-03 16:17:39', '2017-07-03 16:18:37', '1' );
INSERT INTO `t_customer_contact`
VALUES
	( '9', '35', '2017-07-03 16:18:06', '黄焖鸡米饭11', '黄焖鸡11', '2017-07-03 16:18:24', '2017-07-03 16:18:54', '0' );
INSERT INTO `t_customer_contact`
VALUES
	( '10', '35', '2017-07-06 16:27:08', '食堂小吃11', '油炸鱼', '2017-07-03 16:27:32', '2017-07-03 16:27:50', '1' );
INSERT INTO `t_customer_contact`
VALUES
	( '11', '39', '2017-08-18 19:30:58', '荣乐东路2369弄', '一起写代码', '2017-08-19 10:47:28', '2017-08-19 10:47:28', '1' );
INSERT INTO `t_customer_contact`
VALUES
	( '12', '39', '2017-08-19 10:47:31', '沪松公路111弄', '一起撸串', '2017-08-19 10:48:14', '2017-08-19 10:48:14', '1' );
INSERT INTO `t_customer_contact`
VALUES
	( '13', '39', '2017-08-08 10:48:19', '荣乐东路2369弄天桥', '一起抽烟', '2017-08-19 10:48:51', '2017-08-19 10:48:51', '1' );
INSERT INTO `t_customer_contact`
VALUES
	( '15', '343', '2018-10-28 00:00:00', '尚学堂', '敲代码', '2018-10-28 15:37:59', '2018-10-28 15:39:39', '1' );
INSERT INTO `t_customer_contact`
VALUES
	( '16', '343', '2018-10-29 00:00:00', '饭店', '吃饭', '2018-10-28 15:38:28', '2018-10-28 15:38:36', '0' );
INSERT INTO `t_customer_contact`
VALUES
	( '17', '124', '2018-10-30 00:00:00', '尚学堂', '楼下一起吃饺子饭', '2018-10-30 16:51:15', '2018-10-30 16:51:45', '0' );
INSERT INTO `t_customer_contact`
VALUES
	( '18', '124', '2018-10-30 00:00:00', '尚学堂', '一起敲代码', '2018-10-30 16:52:53', '2018-10-30 16:52:53', '1' );-- ----------------------------
-- Table structure for t_customer_linkman
-- ----------------------------
DROP TABLE
IF
	EXISTS `t_customer_linkman`;
CREATE TABLE `t_customer_linkman` (
	`id` INT ( 11 ) NOT NULL AUTO_INCREMENT,
	`cus_id` INT ( 11 ) DEFAULT NULL,
	`link_name` VARCHAR ( 20 ) DEFAULT NULL,
	`sex` VARCHAR ( 20 ) DEFAULT NULL,
	`zhiwei` VARCHAR ( 50 ) DEFAULT NULL,
	`office_phone` VARCHAR ( 50 ) DEFAULT NULL,
	`phone` VARCHAR ( 20 ) DEFAULT NULL,
	`is_valid` INT ( 4 ) DEFAULT '1',
	`create_date` datetime DEFAULT NULL,
	`update_date` datetime DEFAULT NULL,
	PRIMARY KEY ( `id` ) 
) ENGINE = INNODB AUTO_INCREMENT = 40 DEFAULT CHARSET = utf8;-- ----------------------------
-- Records of t_customer_linkman
-- ----------------------------
INSERT INTO `t_customer_linkman`
VALUES
	( '2', '2', '彭涛', '男', '21', '321', '138138138138', '1', NULL, NULL );
INSERT INTO `t_customer_linkman`
VALUES
	( '4', '3', '孙振铎', '女', '4', '5', '6', '1', NULL, NULL );
INSERT INTO `t_customer_linkman`
VALUES
	( '5', '4', '程浩', '男', '44', '55', '66', '1', NULL, NULL );
INSERT INTO `t_customer_linkman`
VALUES
	( '6', '5', '张三', '男', '经理', '21321', '32132121', '1', NULL, NULL );
INSERT INTO `t_customer_linkman`
VALUES
	( '7', '6', '是', '女', '发送', '2321', '321321', '1', NULL, NULL );
INSERT INTO `t_customer_linkman`
VALUES
	( '10', '7', 'da', '女', 's', 'fd', 'fda', '1', NULL, NULL );
INSERT INTO `t_customer_linkman`
VALUES
	( '11', '8', '老王', '男', '隔壁专业户', '122', '1233', '1', '2016-08-25 09:44:30', '2016-08-25 09:44:30' );
INSERT INTO `t_customer_linkman`
VALUES
	( '12', '9', '哈哈', '男', '胜多负少', '1323', '23423', '0', '2016-08-25 09:46:08', '2016-08-25 09:46:08' );
INSERT INTO `t_customer_linkman`
VALUES
	( '13', '1', '都是', '女', '水电费水电费', '2342', '234234', '0', '2016-08-25 09:46:24', '2016-08-25 09:46:58' );
INSERT INTO `t_customer_linkman`
VALUES
	( '14', '1', '陈浩', '男', '232dsf', '24dsfs', '242sd', '0', '2016-08-25 09:46:34', '2016-08-25 09:46:34' );
INSERT INTO `t_customer_linkman`
VALUES
	( '15', '1', 'er', '女', '234', '234', '24', '1', '2016-08-25 09:56:27', '2016-08-25 09:56:27' );
INSERT INTO `t_customer_linkman`
VALUES
	( '16', '16', '哈哈', '男', 'Java', '23', '43', '1', '2016-08-25 10:01:47', '2016-08-25 10:01:47' );
INSERT INTO `t_customer_linkman`
VALUES
	( '17', '16', 'ss', '女', 'ss', '122', '3333', '1', '2016-08-31 19:31:13', '2016-08-31 19:31:13' );
INSERT INTO `t_customer_linkman`
VALUES
	( '18', '16', '丁家鑫', NULL, NULL, NULL, NULL, '0', '2016-11-25 09:10:43', '2016-11-25 09:10:43' );
INSERT INTO `t_customer_linkman`
VALUES
	( '19', '16', 'test001', '男', '阿斯顿21321321', '', '', '1', '2016-11-25 00:00:00', '2016-12-06 10:49:29' );
INSERT INTO `t_customer_linkman`
VALUES
	( '20', '17', '李艳磊', '男', '121·', '21·2', '1·2', '1', '2016-12-06 10:43:57', '2016-12-06 10:43:57' );
INSERT INTO `t_customer_linkman`
VALUES
	( '21', '35', '廖老师', '女', 'CEO', '021-89898989', '13888888888', '1', '2017-07-04 09:14:56', '2017-07-04 09:14:56' );
INSERT INTO `t_customer_linkman`
VALUES
	( '22', '35', '周老师', '男', '大数据老师', '021-89898989', '13999999999', '1', '2017-07-04 09:18:08', '2017-07-04 09:21:51' );
INSERT INTO `t_customer_linkman`
VALUES
	( '23', '36', 'AA', '男', 'AA', '020-90909090', '1344444444444', '1', '2017-07-04 09:22:44', '2017-07-04 09:22:44' );
INSERT INTO `t_customer_linkman`
VALUES
	( '24', '39', '王伟', '男', '老板', '021-00000000', '135656565656', '1', '2017-08-19 09:55:19', '2017-08-19 09:56:04' );
INSERT INTO `t_customer_linkman`
VALUES
	( '25', '39', '王伟-小', '女', 'CTO', '021-11011001', '134787878787', '0', '2017-08-19 09:55:56', '2017-08-19 09:56:19' );
INSERT INTO `t_customer_linkman`
VALUES
	( '26', '1', '陈杰', '男', '1', '1', '1', '1', '2017-08-19 10:31:08', '2017-08-19 10:31:08' );
INSERT INTO `t_customer_linkman`
VALUES
	( '27', '1', '11', '女', '11', '11', '11', '1', '2017-08-19 10:31:31', '2017-08-19 10:31:31' );
INSERT INTO `t_customer_linkman`
VALUES
	( '28', '1', '22', '女', '11', '11', '11', '1', '2017-08-19 10:31:43', '2017-08-19 10:31:43' );
INSERT INTO `t_customer_linkman`
VALUES
	( '30', '343', '彭涛', '男', '程序员', '123123', '138138138138', '1', '2018-10-26 20:22:05', '2018-10-26 20:22:05' );
INSERT INTO `t_customer_linkman`
VALUES
	( '31', '343', '张三', '男', 'asd', '321321', '345345', '1', '2018-10-28 14:52:03', '2018-10-28 14:52:03' );
INSERT INTO `t_customer_linkman`
VALUES
	( '32', '343', '李四', '女', 'qwe', 'qwe', 'qwe', '0', '2018-10-28 14:53:04', '2018-10-28 14:53:44' );
INSERT INTO `t_customer_linkman`
VALUES
	( '33', '343', '李四', '男', 'qwe', 'qwe', 'qwe', '1', '2018-10-28 14:54:06', '2018-10-28 14:54:39' );
INSERT INTO `t_customer_linkman`
VALUES
	( '34', '16', '程浩', '', '', '', '66', '1', '2018-10-29 11:29:14', '2018-10-29 11:29:14' );
INSERT INTO `t_customer_linkman`
VALUES
	( '35', '17', '孙振铎', '', '', '', '6', '1', '2018-10-29 11:30:19', '2018-10-29 11:30:19' );
INSERT INTO `t_customer_linkman`
VALUES
	( '36', '18', '程浩', '', '', '', '66', '1', '2018-10-29 11:41:49', '2018-10-29 11:41:49' );
INSERT INTO `t_customer_linkman`
VALUES
	( '37', '124', '陈浩', '男', '副总经理', '021-123123', '123123123', '1', '2018-10-30 16:01:00', '2018-10-30 16:34:18' );
INSERT INTO `t_customer_linkman`
VALUES
	( '38', '124', '陈杰', '男', '总经理', '021-321321', '321321321', '0', '2018-10-30 16:01:27', NULL );
INSERT INTO `t_customer_linkman`
VALUES
	( '39', '124', '孙振铎', '男', '总监', '021-456456', '456456', '1', '2018-10-30 16:33:35', '2018-10-30 16:33:35' );-- ----------------------------
-- Table structure for t_customer_loss
-- ----------------------------
DROP TABLE
IF
	EXISTS `t_customer_loss`;
CREATE TABLE `t_customer_loss` (
	`id` INT ( 11 ) NOT NULL AUTO_INCREMENT,
	`cus_no` VARCHAR ( 40 ) DEFAULT NULL,
	`cus_name` VARCHAR ( 20 ) DEFAULT NULL,
	`cus_manager` VARCHAR ( 20 ) DEFAULT NULL,
	`last_order_time` datetime DEFAULT NULL,
	`confirm_loss_time` datetime DEFAULT NULL,
	`state` INT ( 11 ) DEFAULT NULL,
	`loss_reason` VARCHAR ( 1000 ) DEFAULT NULL,
	`is_valid` INT ( 4 ) DEFAULT '1',
	`create_date` datetime DEFAULT NULL,
	`update_date` datetime DEFAULT NULL,
	PRIMARY KEY ( `id` ) 
) ENGINE = INNODB AUTO_INCREMENT = 64 DEFAULT CHARSET = utf8;-- ----------------------------
-- Records of t_customer_loss
-- ----------------------------
INSERT INTO `t_customer_loss`
VALUES
	( '20', 'KH21321321', '北京大牛科技', '小张', NULL, '2017-03-03 00:00:00', '1', '不想合作', '1', '2016-11-28 14:22:07', '2017-07-04 17:49:18' );
INSERT INTO `t_customer_loss`
VALUES
	( '24', 'KH20150526073027', '百度', NULL, '2016-01-29 00:00:00', NULL, '1', '是是是', '1', '2016-12-29 11:42:29', '2017-07-04 17:50:22' );
INSERT INTO `t_customer_loss`
VALUES
	( '25', 'KH201609011709179', '天猫11', '小红', NULL, '2017-07-04 17:52:27', '1', '酒不好喝！', '1', '2016-12-29 11:42:29', '2017-07-04 17:52:27' );
INSERT INTO `t_customer_loss`
VALUES
	( '26', 'KH20150526073023', '巨人科技', '小丽', NULL, '2017-08-19 16:24:05', '1', '不想合作了', '1', '2017-07-04 14:44:16', '2017-08-19 16:24:05' );
INSERT INTO `t_customer_loss`
VALUES
	( '27', 'KH20150526073024', '新人科技', NULL, NULL, NULL, '0', NULL, '1', '2017-07-04 14:44:16', '2017-07-04 14:44:16' );
INSERT INTO `t_customer_loss`
VALUES
	( '28', 'KH20150526073026', '新浪', NULL, NULL, NULL, '0', NULL, '1', '2017-07-04 14:44:16', '2017-07-04 14:44:16' );
INSERT INTO `t_customer_loss`
VALUES
	( '29', 'KH201608241829510', '上海聪享科技1', '小明', NULL, NULL, '0', NULL, '1', '2017-07-04 14:44:16', '2017-07-04 14:44:16' );
INSERT INTO `t_customer_loss`
VALUES
	( '30', 'KH201611241605785', 'test001', '小明', NULL, NULL, '0', NULL, '1', '2017-07-04 14:44:16', '2017-07-04 14:44:16' );
INSERT INTO `t_customer_loss`
VALUES
	( '31', 'KH201611241608301', 'test002002002', '小明', NULL, NULL, '0', NULL, '1', '2017-07-04 14:44:16', '2017-07-04 14:44:16' );
INSERT INTO `t_customer_loss`
VALUES
	( '32', NULL, '尚学堂科技', 'zs', NULL, NULL, '0', NULL, '1', '2017-07-04 14:44:16', '2017-07-04 14:44:16' );
INSERT INTO `t_customer_loss`
VALUES
	( '33', 'KH21321321', '北京大牛科技', '小张', NULL, NULL, '0', NULL, '1', '2017-07-04 14:44:16', '2017-07-04 14:44:16' );
INSERT INTO `t_customer_loss`
VALUES
	( '34', 'KH20150526073022', '风驰科技', '小红', NULL, NULL, '0', NULL, '1', '2017-07-04 14:44:16', '2017-07-04 14:44:16' );
INSERT INTO `t_customer_loss`
VALUES
	( '35', 'KH20150526073023', '巨人科技', '小丽', NULL, NULL, '0', NULL, '1', '2017-08-09 16:45:30', '2017-08-09 16:45:30' );
INSERT INTO `t_customer_loss`
VALUES
	( '36', 'KH20150526073024', '新人科技', NULL, NULL, NULL, '0', NULL, '1', '2017-08-09 16:45:30', '2017-08-09 16:45:30' );
INSERT INTO `t_customer_loss`
VALUES
	( '37', 'KH20150526073026', '新浪', NULL, NULL, NULL, '0', NULL, '1', '2017-08-09 16:45:30', '2017-08-09 16:45:30' );
INSERT INTO `t_customer_loss`
VALUES
	( '38', 'KH201608241829510', '上海聪享科技1', '小明', NULL, NULL, '0', NULL, '1', '2017-08-09 16:45:30', '2017-08-09 16:45:30' );
INSERT INTO `t_customer_loss`
VALUES
	( '39', 'KH201611241605785', 'test001', '小明', NULL, NULL, '0', NULL, '1', '2017-08-09 16:45:30', '2017-08-09 16:45:30' );
INSERT INTO `t_customer_loss`
VALUES
	( '40', 'KH201611241608301', 'test002002002', '小明', NULL, NULL, '0', NULL, '1', '2017-08-09 16:45:30', '2017-08-09 16:45:30' );
INSERT INTO `t_customer_loss`
VALUES
	( '41', NULL, '尚学堂科技', 'zs', NULL, NULL, '0', NULL, '1', '2017-08-09 16:45:30', '2017-08-09 16:45:30' );
INSERT INTO `t_customer_loss`
VALUES
	( '42', 'KH20150526073022', '风驰科技', '小红', '2016-11-06 20:48:05', NULL, '1', '饭不好吃！', '1', '2017-08-09 16:45:30', '2017-08-09 16:45:30' );
INSERT INTO `t_customer_loss`
VALUES
	( '43', 'KH20150526073023', '巨人科技', '小丽', NULL, NULL, '0', NULL, '1', '2017-08-13 16:39:07', '2017-08-13 16:39:07' );
INSERT INTO `t_customer_loss`
VALUES
	( '44', 'KH20150526073024', '新人科技', NULL, NULL, NULL, '0', NULL, '1', '2017-08-13 16:39:07', '2017-08-13 16:39:07' );
INSERT INTO `t_customer_loss`
VALUES
	( '45', 'KH20150526073026', '新浪', NULL, NULL, NULL, '0', NULL, '1', '2017-08-13 16:39:07', '2017-08-13 16:39:07' );
INSERT INTO `t_customer_loss`
VALUES
	( '46', 'KH201608241829510', '上海聪享科技1', '小明', NULL, NULL, '0', NULL, '1', '2017-08-13 16:39:07', '2017-08-13 16:39:07' );
INSERT INTO `t_customer_loss`
VALUES
	( '47', 'KH201611241605785', 'test001', '小明', NULL, NULL, '0', NULL, '1', '2017-08-13 16:39:07', '2017-08-13 16:39:07' );
INSERT INTO `t_customer_loss`
VALUES
	( '48', 'KH201611241608301', 'test002002002', '小明', NULL, NULL, '0', NULL, '1', '2017-08-13 16:39:07', '2017-08-13 16:39:07' );
INSERT INTO `t_customer_loss`
VALUES
	( '49', NULL, '尚学堂科技', 'zs', NULL, NULL, '0', NULL, '1', '2017-08-13 16:39:07', '2017-08-13 16:39:07' );
INSERT INTO `t_customer_loss`
VALUES
	( '50', 'KH20150526073023', '巨人科技', '小丽', NULL, NULL, '0', NULL, '1', '2017-08-17 15:32:16', '2017-08-17 15:32:16' );
INSERT INTO `t_customer_loss`
VALUES
	( '51', 'KH20150526073024', '新人科技', NULL, NULL, NULL, '0', NULL, '1', '2017-08-17 15:32:16', '2017-08-17 15:32:16' );
INSERT INTO `t_customer_loss`
VALUES
	( '52', 'KH20150526073026', '新浪', NULL, NULL, NULL, '0', NULL, '1', '2017-08-17 15:32:16', '2017-08-17 15:32:16' );
INSERT INTO `t_customer_loss`
VALUES
	( '53', 'KH201608241829510', '上海聪享科技1', '小明', NULL, NULL, '0', NULL, '1', '2017-08-17 15:32:16', '2017-08-17 15:32:16' );
INSERT INTO `t_customer_loss`
VALUES
	( '54', 'KH201611241605785', 'test001', '小明', NULL, NULL, '0', NULL, '1', '2017-08-17 15:32:16', '2017-08-17 15:32:16' );
INSERT INTO `t_customer_loss`
VALUES
	( '55', 'KH201611241608301', 'test002002002', '小明', NULL, NULL, '0', NULL, '1', '2017-08-17 15:32:16', '2017-08-17 15:32:16' );
INSERT INTO `t_customer_loss`
VALUES
	( '56', NULL, '尚学堂科技', 'zs', NULL, NULL, '0', NULL, '1', '2017-08-17 15:32:16', '2017-08-17 15:32:16' );
INSERT INTO `t_customer_loss`
VALUES
	( '57', 'KH201608241829510', '上海聪享科技1', '小明', NULL, NULL, '0', NULL, '1', '2017-08-19 15:05:17', '2017-08-19 15:05:17' );
INSERT INTO `t_customer_loss`
VALUES
	( '58', 'KH20150526073024', '新人科技', NULL, NULL, NULL, '0', NULL, '1', '2017-08-21 11:16:36', '2017-08-21 11:16:36' );
INSERT INTO `t_customer_loss`
VALUES
	( '59', 'KH20150526073026', '新浪', NULL, NULL, NULL, '0', NULL, '1', '2017-08-21 11:16:36', '2017-08-21 11:16:36' );
INSERT INTO `t_customer_loss`
VALUES
	( '60', 'KH201608241829510', '上海聪享科技1', '小明', NULL, NULL, '0', NULL, '1', '2017-08-21 11:16:36', '2017-08-21 11:16:36' );
INSERT INTO `t_customer_loss`
VALUES
	( '61', 'KH201611241605785', 'test001', '小明', NULL, NULL, '0', NULL, '1', '2017-08-21 11:16:36', '2017-08-21 11:16:36' );
INSERT INTO `t_customer_loss`
VALUES
	( '62', 'KH201611241608301', 'test002002002', '小明', '2018-11-29 09:55:37', NULL, '1', '酒不好喝！', '1', '2017-08-21 11:16:36', '2018-11-01 10:16:29' );
INSERT INTO `t_customer_loss`
VALUES
	( '63', NULL, '尚学堂科技', 'zs', NULL, NULL, '0', NULL, '1', '2017-08-21 11:16:36', '2017-08-21 11:16:36' );-- ----------------------------
-- Table structure for t_customer_order
-- ----------------------------
DROP TABLE
IF
	EXISTS `t_customer_order`;
CREATE TABLE `t_customer_order` (
	`id` INT ( 11 ) NOT NULL AUTO_INCREMENT,
	`cus_id` INT ( 11 ) DEFAULT NULL,
	`order_no` VARCHAR ( 40 ) DEFAULT NULL,
	`order_date` datetime DEFAULT NULL,
	`address` VARCHAR ( 200 ) DEFAULT NULL,
	`total_price` DOUBLE ( 10, 2 ) DEFAULT NULL,
	`state` INT ( 11 ) DEFAULT NULL,
	`create_date` datetime DEFAULT NULL,
	`update_date` datetime DEFAULT NULL,
	`is_valid` INT ( 4 ) DEFAULT '1',
	PRIMARY KEY ( `id` ) 
) ENGINE = INNODB AUTO_INCREMENT = 14 DEFAULT CHARSET = utf8;-- ----------------------------
-- Records of t_customer_order
-- ----------------------------
INSERT INTO `t_customer_order`
VALUES
	( '5', '1', '123123', '2016-11-29 14:56:10', '2132', '11500.00', '1', '2016-11-29 14:56:15', '2016-11-29 14:56:17', '1' );
INSERT INTO `t_customer_order`
VALUES
	( '6', '1', '123', '2016-11-29 14:56:26', '213', '955.00', '1', '2016-11-29 14:56:30', '2016-11-29 14:56:32', '1' );
INSERT INTO `t_customer_order`
VALUES
	( '7', '16', '12122', '2016-01-06 20:21:08', '123213', NULL, '0', '2016-01-06 20:21:18', '2016-12-06 20:21:30', '1' );
INSERT INTO `t_customer_order`
VALUES
	( '8', '16', '1231', '2016-11-06 20:48:05', '213', NULL, '0', '2016-12-06 20:48:15', '2016-12-06 20:48:18', '1' );
INSERT INTO `t_customer_order`
VALUES
	( '10', '21', 'asdsad', '2016-01-29 10:27:51', 'asdsad', NULL, '1', '2016-12-29 10:28:00', '2016-12-29 10:28:03', '1' );
INSERT INTO `t_customer_order`
VALUES
	( '11', '343', '123456', '2018-10-28 16:01:08', '尚学堂', '50000.00', '0', '2018-10-26 16:01:36', '2018-10-26 16:01:43', '1' );
INSERT INTO `t_customer_order`
VALUES
	( '12', '124', 'DD123123', '2018-10-30 17:05:10', '上海尚学堂', '99999.00', '0', '2018-10-30 17:05:32', NULL, '1' );
INSERT INTO `t_customer_order`
VALUES
	( '13', '124', 'DD33333', '2018-10-30 17:05:10', '北京尚学堂', '88888.00', '0', '2018-10-30 17:05:32', NULL, '1' );-- ----------------------------
-- Table structure for t_customer_reprieve
-- ----------------------------
DROP TABLE
IF
	EXISTS `t_customer_reprieve`;
CREATE TABLE `t_customer_reprieve` (
	`id` INT ( 11 ) NOT NULL AUTO_INCREMENT,
	`loss_id` INT ( 11 ) DEFAULT NULL,
	`measure` VARCHAR ( 500 ) DEFAULT NULL,
	`is_valid` INT ( 4 ) DEFAULT '1',
	`create_date` datetime DEFAULT NULL,
	`update_date` datetime DEFAULT NULL,
	PRIMARY KEY ( `id` ) 
) ENGINE = INNODB AUTO_INCREMENT = 38 DEFAULT CHARSET = utf8;-- ----------------------------
-- Records of t_customer_reprieve
-- ----------------------------
INSERT INTO `t_customer_reprieve`
VALUES
	( '17', '20', '暂时保留213213123', '1', '2016-12-29 00:00:00', '2016-12-29 15:36:22' );
INSERT INTO `t_customer_reprieve`
VALUES
	( '18', '20', 'test001', '0', '2016-12-29 15:35:23', '2016-12-29 15:35:23' );
INSERT INTO `t_customer_reprieve`
VALUES
	( '19', '20', '234234234324', '0', '2016-12-29 15:36:39', '2016-12-29 15:36:39' );
INSERT INTO `t_customer_reprieve`
VALUES
	( '20', '20', '32432432432', '0', '2016-12-29 15:36:47', '2016-12-29 15:36:47' );
INSERT INTO `t_customer_reprieve`
VALUES
	( '21', '24', NULL, '0', '2017-03-03 17:52:01', '2017-03-03 17:52:01' );
INSERT INTO `t_customer_reprieve`
VALUES
	( '24', '20', '保留', '1', '2017-03-03 18:28:25', '2017-03-03 18:28:25' );
INSERT INTO `t_customer_reprieve`
VALUES
	( '25', '20', '杀出了', '1', '2017-03-03 18:32:44', '2017-03-03 18:32:44' );
INSERT INTO `t_customer_reprieve`
VALUES
	( '26', '20', 'wowowo', '0', '2017-03-03 18:34:25', '2017-03-03 18:34:25' );
INSERT INTO `t_customer_reprieve`
VALUES
	( '27', '20', '水电费', '1', '2017-07-04 17:46:32', '2017-07-04 17:46:32' );
INSERT INTO `t_customer_reprieve`
VALUES
	( '28', '31', '对方是否1111', '1', '2017-07-04 17:54:41', '2017-07-04 17:54:41' );
INSERT INTO `t_customer_reprieve`
VALUES
	( '29', '31', '12111', '1', '2017-07-04 17:54:44', '2017-07-04 17:54:44' );
INSERT INTO `t_customer_reprieve`
VALUES
	( '30', '26', '充一百送100', '1', '2017-08-19 16:18:40', '2017-08-19 16:18:40' );
INSERT INTO `t_customer_reprieve`
VALUES
	( '31', '26', '充300送45', '1', '2017-08-19 16:19:04', '2017-08-19 16:19:04' );
INSERT INTO `t_customer_reprieve`
VALUES
	( '32', '42', '请客吃一顿', '1', '2018-10-28 19:21:02', '2018-10-28 19:21:02' );
INSERT INTO `t_customer_reprieve`
VALUES
	( '33', '42', '喝一顿，搓一顿', '0', '2018-10-28 19:31:32', '2018-10-28 19:31:50' );
INSERT INTO `t_customer_reprieve`
VALUES
	( '34', '25', '喝一顿', '1', '2018-10-28 19:36:03', '2018-10-28 19:36:03' );
INSERT INTO `t_customer_reprieve`
VALUES
	( '35', '62', '吃一顿牛肉面', '1', '2018-11-01 09:50:35', '2018-11-01 10:13:15' );
INSERT INTO `t_customer_reprieve`
VALUES
	( '36', '62', '喝一顿', '0', '2018-11-01 09:50:45', '2018-11-01 10:13:28' );
INSERT INTO `t_customer_reprieve`
VALUES
	( '37', '62', '喝一瓶二锅头', '1', '2018-11-01 10:13:50', '2018-11-01 10:13:50' );-- ----------------------------
-- Table structure for t_customer_serve
-- ----------------------------
DROP TABLE
IF
	EXISTS `t_customer_serve`;
CREATE TABLE `t_customer_serve` (
	`id` INT ( 11 ) NOT NULL AUTO_INCREMENT,
	`serve_Type` VARCHAR ( 30 ) DEFAULT NULL,
	`overview` VARCHAR ( 500 ) DEFAULT NULL,
	`customer` VARCHAR ( 30 ) DEFAULT NULL,
	`state` VARCHAR ( 10 ) DEFAULT NULL,
	`service_request` VARCHAR ( 500 ) DEFAULT NULL,
	`create_people` VARCHAR ( 100 ) DEFAULT NULL,
	`assigner` VARCHAR ( 100 ) DEFAULT NULL,
	`assign_time` datetime DEFAULT NULL,
	`service_proce` VARCHAR ( 500 ) DEFAULT NULL,
	`service_proce_people` VARCHAR ( 50 ) DEFAULT NULL,
	`service_proce_time` datetime DEFAULT NULL,
	`service_proce_result` VARCHAR ( 500 ) DEFAULT NULL,
	`myd` VARCHAR ( 50 ) DEFAULT NULL,
	`is_valid` INT ( 4 ) DEFAULT '1',
	`update_date` datetime DEFAULT NULL,
	`create_date` datetime DEFAULT NULL,
	PRIMARY KEY ( `id` ) 
) ENGINE = INNODB AUTO_INCREMENT = 66 DEFAULT CHARSET = utf8;-- ----------------------------
-- Records of t_customer_serve
-- ----------------------------
INSERT INTO `t_customer_serve`
VALUES
	(
		'30',
		'咨询',
		'crm 上线啦',
		'尚学堂',
		'fw005',
		'crm 上线啦',
		'shsxt',
		'zs',
		'2016-12-05 00:00:00',
		'即将闪耀登场',
		'shsxt',
		'2016-12-06 00:00:00',
		'满意',
		'☆☆☆☆',
		'1',
		'2016-12-06 14:03:23',
		'2016-12-04 00:00:00' 
	);
INSERT INTO `t_customer_serve`
VALUES
	(
		'42',
		'咨询',
		'crm  怎么样 ？？？',
		'尚学堂',
		'fw003',
		'crm  怎么样 ？？？  进展到那个地步了，。。。。',
		'tony',
		'admin',
		'2017-03-04 13:35:32',
		'uuuuuu',
		'Tony',
		'2016-12-29 00:00:00',
		'还行。。。。。,还行。。。。。',
		'☆☆☆☆',
		'1',
		'2017-03-04 13:36:31',
		'2016-12-29 00:00:00' 
	);
INSERT INTO `t_customer_serve`
VALUES
	(
		'43',
		'投诉',
		'UUUUUU',
		'shsxt',
		'fw002',
		'crm系统有待改进',
		'Tony',
		'admin',
		'2017-03-04 11:07:12',
		'PPPPP',
		'Tony',
		'2017-03-04 11:26:53',
		NULL,
		NULL,
		'1',
		'2017-03-04 11:07:12',
		'2016-12-29 00:00:00' 
	);
INSERT INTO `t_customer_serve`
VALUES
	(
		'47',
		'建议',
		'yyyyy',
		'tree',
		'fw001',
		'treee',
		'Tony',
		'',
		'2017-03-03 21:28:34',
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		'1',
		'2017-03-03 21:28:34',
		'2017-03-03 00:00:00' 
	);
INSERT INTO `t_customer_serve`
VALUES
	(
		'48',
		'咨询',
		'水电费',
		'都是',
		'已反馈',
		'水电费',
		'shsxt',
		'test01',
		'2017-07-06 09:19:40',
		'sdffsdf',
		'shsxt',
		'2017-08-19 18:28:05',
		'123123',
		'☆☆☆☆☆',
		'1',
		'2018-11-01 17:27:21',
		'2017-06-23 16:05:58' 
	);
INSERT INTO `t_customer_serve`
VALUES
	(
		'49',
		'建议',
		'需要服务器5台',
		'大客户1',
		'已归档',
		'需要服务器5台',
		'shsxt',
		'test01',
		'2017-07-06 09:00:50',
		'赶紧发货',
		'shsxt',
		'2017-07-06 09:01:05',
		'5星好评',
		'☆☆☆☆☆',
		'1',
		'2017-07-06 09:00:33',
		'2017-07-06 09:00:33' 
	);
INSERT INTO `t_customer_serve`
VALUES
	(
		'50',
		'建议',
		'武汉尚学堂需要THINKPAD 100台',
		'武汉尚学堂',
		'已归档',
		'武汉尚学堂需要THINKPAD 100台',
		'shsxt',
		'test01',
		'2017-07-06 09:21:02',
		'已发货',
		'shsxt',
		'2017-07-06 09:26:38',
		'5星好评',
		'☆☆☆',
		'1',
		'2017-07-06 09:12:21',
		'2017-07-06 09:12:21' 
	);
INSERT INTO `t_customer_serve`
VALUES
	(
		'51',
		'咨询',
		'咨询服务器的价格',
		'A客户',
		'已归档',
		'咨询服务器的价格',
		'shsxt',
		'test01',
		'2017-08-19 17:45:42',
		'服务器的价格10000/台',
		'shsxt',
		'2017-08-19 17:46:17',
		'满意 愿意订购',
		'☆☆☆☆☆',
		'1',
		'2017-08-19 17:45:25',
		'2017-08-19 17:45:25' 
	);
INSERT INTO `t_customer_serve`
VALUES
	(
		'52',
		'投诉',
		'投诉服务器非常卡，内核性能很差',
		'B客户',
		'已归档',
		'投诉服务器非常卡，内核性能很差',
		'shsxt',
		'admin1',
		'2017-08-19 18:27:58',
		'dfsfdsdfsdfsdf',
		'shsxt',
		'2017-08-19 18:30:24',
		'5星好评',
		'☆☆☆☆☆',
		'1',
		'2017-08-19 17:52:05',
		'2017-08-19 17:52:05' 
	);
INSERT INTO `t_customer_serve`
VALUES
	(
		'53',
		'建议',
		'建议ABC',
		'C客户',
		'已归档',
		'建议ABC',
		'shsxt',
		'admin1',
		'2017-08-19 17:53:01',
		'建议踩啦',
		'shsxt',
		'2017-08-19 17:53:38',
		'满意',
		'☆☆☆☆',
		'1',
		'2017-08-19 17:52:33',
		'2017-08-19 17:52:33' 
	);
INSERT INTO `t_customer_serve`
VALUES
	(
		'54',
		'咨询',
		'需要服务器5台',
		'ABC',
		'新创建',
		'需要服务器5台',
		'shsxt',
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		'1',
		'2017-08-19 18:05:48',
		'2017-08-19 18:05:48' 
	);
INSERT INTO `t_customer_serve`
VALUES
	(
		'55',
		'咨询',
		'有服务器吗？',
		'风驰科技',
		'新创建',
		'有没有？',
		'zhangsan',
		'',
		NULL,
		'',
		'',
		NULL,
		'',
		'',
		'1',
		'2018-10-29 23:14:50',
		'2018-10-29 23:14:50' 
	);
INSERT INTO `t_customer_serve`
VALUES
	(
		'56',
		'咨询',
		'新浪你好',
		'新浪',
		'已归档',
		'v新浪你好',
		'zhangsan',
		'lilin',
		'2018-10-30 22:25:14',
		'张三处理的服务。',
		'zhangsan',
		'2018-10-30 22:40:12',
		'客户非常满意呀',
		'☆☆☆☆☆',
		'1',
		'2018-10-30 22:48:00',
		'2018-10-30 21:17:32' 
	);
INSERT INTO `t_customer_serve`
VALUES
	(
		'57',
		'建议',
		'免费推广',
		'百度',
		'已归档',
		'免费推广',
		'zhangsan',
		'admin1',
		'2018-10-31 15:42:02',
		'免费推广',
		'zhangsan',
		'2018-10-31 15:42:13',
		'客户非常满意呀',
		'☆☆☆☆☆',
		'1',
		'2018-10-31 15:42:22',
		'2018-10-31 15:38:36' 
	);
INSERT INTO `t_customer_serve`
VALUES
	(
		'61',
		'建议',
		'建议尚学堂可以扩展前端课程',
		'好人集团',
		'已反馈',
		'建议尚学堂可以扩展前端课程',
		'zhangsan',
		'admin1',
		'2018-11-01 15:57:46',
		'已采纳，马上开班！立刻开班！',
		'zhangsan',
		'2018-11-01 16:39:33',
		'321321',
		'☆☆☆☆☆',
		'1',
		'2018-11-01 17:27:32',
		'2018-11-01 15:43:33' 
	);
INSERT INTO `t_customer_serve`
VALUES
	(
		'62',
		'咨询',
		'可以合作吗？',
		'新浪',
		'已反馈',
		'可以合作吗？',
		'zhangsan',
		'test01',
		'2018-11-01 16:47:09',
		'可以啊。过来谈合作。',
		'zhangsan',
		'2018-11-01 16:47:24',
		'客户很开心。',
		'☆☆☆☆☆',
		'1',
		'2018-11-01 17:24:31',
		'2018-11-01 16:46:56' 
	);
INSERT INTO `t_customer_serve`
VALUES
	(
		'63',
		'咨询',
		'可以合作吗？',
		'百度',
		'已反馈',
		'可以合作吗？',
		'zhangsan',
		'test01',
		'2018-11-01 17:08:15',
		'可以。',
		'zhangsan',
		'2018-11-01 17:08:27',
		'客户觉得不错，多联系。',
		'☆☆☆☆☆',
		'1',
		'2018-11-01 17:23:58',
		'2018-11-01 17:08:01' 
	);
INSERT INTO `t_customer_serve`
VALUES
	(
		'64',
		'鼓励',
		'合作鼓励奖金1W',
		'风驰科技',
		'已反馈',
		'合作鼓励奖金1W',
		'zhangsan',
		'test01',
		'2018-11-01 17:32:47',
		'非常感谢！',
		'zhangsan',
		'2018-11-01 17:33:06',
		'感谢！',
		'☆☆☆☆☆',
		'1',
		'2018-11-01 17:33:18',
		'2018-11-01 17:32:39' 
	);
INSERT INTO `t_customer_serve`
VALUES
	(
		'65',
		'建议',
		'123123',
		'北京大牛科技',
		'已反馈',
		'123123',
		'zhangsan',
		'lilin',
		'2018-11-01 17:41:45',
		'123123',
		'zhangsan',
		'2018-11-01 17:41:52',
		'123123123',
		'☆☆☆☆☆',
		'1',
		'2018-11-01 17:42:23',
		'2018-11-01 17:41:38' 
	);-- ----------------------------
-- Table structure for t_cus_dev_plan
-- ----------------------------
DROP TABLE
IF
	EXISTS `t_cus_dev_plan`;
CREATE TABLE `t_cus_dev_plan` (
	`id` INT ( 11 ) NOT NULL AUTO_INCREMENT,
	`sale_chance_id` INT ( 11 ) DEFAULT NULL,
	`plan_item` VARCHAR ( 100 ) DEFAULT NULL,
	`plan_date` datetime DEFAULT NULL,
	`exe_affect` VARCHAR ( 100 ) DEFAULT NULL,
	`create_date` datetime DEFAULT NULL,
	`update_date` datetime DEFAULT NULL,
	`is_valid` INT ( 4 ) DEFAULT '1',
	PRIMARY KEY ( `id` ),
	KEY `FK_t_cus_dev_plan` ( `sale_chance_id` ) 
) ENGINE = INNODB AUTO_INCREMENT = 111 DEFAULT CHARSET = utf8;-- ----------------------------
-- Records of t_cus_dev_plan
-- ----------------------------
INSERT INTO `t_cus_dev_plan`
VALUES
	( '6', '16', '2121', '2015-05-28 00:00:00', '', NULL, NULL, '1' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '7', '16', '21121', '2015-05-19 00:00:00', '', NULL, NULL, '1' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '8', '19', '21', '2015-05-28 00:00:00', '', NULL, NULL, '1' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '9', '2', '1', '2015-05-27 00:00:00', '2', NULL, NULL, '1' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '10', '2', '2', '2015-05-28 00:00:00', '', NULL, NULL, '1' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '11', '21', '好', '2015-06-09 00:00:00', '额', NULL, NULL, '1' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '12', '83', '联系客户，介绍产品', '2018-06-02 00:00:00', '有点效果', NULL, '2018-10-27 16:41:21', '1' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '13', '22', '请客户吃饭，洽谈', '2015-06-07 00:00:00', '成功了', NULL, NULL, '1' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '14', '15', '洽谈1', '2015-06-09 00:00:00', '可以', NULL, '2016-12-27 14:32:54', '1' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '24', '1', '213', '2015-07-14 00:00:00', '321', NULL, NULL, '1' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '25', '15', 'sdsf', '2016-08-24 00:00:00', 'sdfs', '2016-08-24 00:46:07', '2016-08-24 00:46:07', '0' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '26', '15', '交接3454353weewrweewrewrwr', '2016-08-24 00:00:00', 'Ok', '2016-08-24 00:00:00', '2016-12-27 14:32:53', '1' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '27', '24', '洽谈', '2016-08-24 00:00:00', '可以', '2016-08-24 10:47:50', '2016-08-24 10:47:50', '1' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '28', '24', '好的', '2016-08-23 00:00:00', '急啊', '2016-08-24 10:51:56', '2016-08-24 10:51:56', '1' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '29', '23', '洽谈', '2016-08-24 00:00:00', '可以', '2016-08-24 10:57:26', '2016-08-24 10:57:26', '1' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '30', '23', '2', '2016-08-24 00:00:00', '2', '2016-08-24 11:01:54', '2016-08-24 11:10:45', '0' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '31', '23', '2', '2016-08-24 00:00:00', '2', '2016-08-24 11:11:23', '2016-08-24 11:11:23', '1' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '32', '20', '1', '2016-08-24 00:00:00', '1', '2016-08-24 11:28:33', '2016-08-24 11:28:33', '1' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '33', '20', '1', '2016-08-24 00:00:00', '1', '2016-08-24 11:28:53', '2016-08-24 11:28:53', '1' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '34', '20', '2', '2016-08-24 10:00:00', '2', '2016-08-24 11:29:01', '2016-09-01 10:23:40', '1' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '35', '26', '请客吃饭1', '2016-08-31 13:00:00', 'OK1', '2016-08-31 16:54:14', '2016-08-31 19:43:23', '1' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '36', '26', '12', '2016-08-31 20:00:00', '234', '2016-08-31 17:04:17', '2016-08-31 17:04:17', '0' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '37', '26', 'sdfs', '2016-08-31 06:00:00', 'dfd', '2016-08-31 17:19:53', '2016-08-31 17:19:53', '0' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '38', '26', '11', '2016-08-31 00:00:00', '11', '2016-08-31 19:36:38', '2016-08-31 19:36:38', '0' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '39', '26', '1111', '2016-08-31 20:00:00', '111', '2016-08-31 19:40:26', '2016-08-31 19:43:31', '0' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '40', '26', '111', '2016-09-21 00:00:00', '111', '2016-09-01 09:51:43', '2016-09-01 09:51:43', '0' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '41', '26', '11', '2016-09-01 01:00:00', '11', '2016-09-01 09:52:48', '2016-09-01 09:52:48', '1' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '42', '26', 'dsd', '2016-09-01 10:14:36', 'sdfsd', '2016-09-01 10:14:41', '2016-09-01 10:14:41', '0' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '43', '26', 'eeee', '2016-09-01 10:14:45', 'sdfsdf', '2016-09-01 10:14:48', '2016-09-08 10:00:27', '0' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '44', '26', 'sdfsd', '2016-09-01 14:53:41', 'sdfsdf', '2016-09-01 14:53:45', '2016-09-01 14:53:45', '0' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '45', '28', 'haode', '2016-09-08 00:00:00', '1', '2016-09-08 09:57:10', '2016-09-08 09:57:10', '1' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '46', '26', 'adasdasdasd', '2016-11-11 00:00:00', 'sadasdsd', '2016-11-24 11:21:22', '2016-11-24 11:21:22', '0' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '47', '26', 'asdasdsadsadasdasd', '2016-11-22 00:00:00', 'sadasdsad', '2016-11-24 11:23:37', '2016-11-24 11:23:37', '1' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '48', '26', '123213', '2016-11-23 00:00:00', '12323', '2016-11-24 11:26:41', '2016-11-24 11:26:41', '1' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '49', '26', 'aaaaaaaaaa', '2016-11-22 00:00:00', 'aaaaaaaaa', '2016-11-24 11:27:19', '2016-11-24 11:27:19', '1' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '50', '26', '无32', '2016-11-24 00:00:00', '23423', '2016-11-24 11:56:59', '2016-11-24 11:56:59', '1' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '51', '26', '324324', '2016-11-29 00:00:00', '23434', '2016-11-24 11:57:09', '2016-11-24 11:57:09', '1' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '52', '26', '23434', '2016-11-30 00:00:00', '324324', '2016-11-24 11:57:16', '2016-11-24 11:57:16', '1' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '53', '26', '32432', '2016-11-29 00:00:00', '432', '2016-11-24 11:57:22', '2016-11-24 11:57:22', '1' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '54', '26', '234324', '2016-11-25 00:00:00', '32424', '2016-11-24 11:57:29', '2016-11-24 11:57:29', '1' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '55', '26', '2341111', '2016-11-23 00:00:00', '324311111', '2016-11-24 11:57:37', '2017-08-14 16:46:24', '1' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '56', '15', '2132132', '2016-12-06 00:00:00', '123213', '2016-12-06 00:00:00', '2016-12-27 14:32:53', '1' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '57', '15', '青蛙23123213453453', '2016-12-01 00:00:00', 'AS阿三', '2016-12-06 00:00:00', '2016-12-27 14:32:49', '1' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '58', '15', '啊飒飒的wqqwqe', '2016-12-14 00:00:00', '阿斯顿', '2016-12-05 00:00:00', '2016-12-27 14:32:52', '0' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '59', '15', '56757', '2016-12-08 00:00:00', '56767', '2016-12-26 22:42:39', '2016-12-26 22:42:39', '0' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '60', '15', '3423424', '2016-12-09 00:00:00', '324324', '2016-12-26 22:44:29', '2016-12-26 22:44:29', '0' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '61', '30', '3243', '2016-12-16 00:00:00', '32432', '2016-12-26 23:06:48', '2016-12-26 23:06:48', '1' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '62', '30', '234324', '2016-12-29 00:00:00', '3243', '2016-12-26 23:07:19', '2016-12-26 23:07:19', '1' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '63', '30', '3454', '2016-12-22 00:00:00', '5435', '2016-12-26 23:11:19', '2016-12-26 23:11:19', '1' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '66', '15', 'test002', '2016-12-25 00:00:00', 'test002', NULL, '2016-12-27 14:10:03', '0' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '67', '15', '23234232343243', '2016-12-20 00:00:00', '234324', NULL, '2016-12-27 13:20:06', '0' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '68', '32', 'test001', '2016-12-27 00:00:00', 'ok', '2016-12-27 14:34:07', '2016-12-27 14:34:07', '1' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '69', '17', 'eee', '2017-03-01 00:00:00', 'eeee', '2017-03-01 15:46:56', '2017-03-01 15:46:56', '0' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '70', '17', 'hello', '2017-03-08 00:00:00', 'hello', '2017-03-01 15:48:04', '2017-03-01 15:48:04', '0' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '71', '17', 'hello', '2017-03-02 00:00:00', 'hello', '2017-03-01 15:58:31', '2017-03-01 15:58:31', '0' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '72', '17', 'hello', '2017-03-23 00:00:00', 'hello', '2017-03-01 15:59:44', '2017-03-01 15:59:44', '0' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '73', '17', 'jjj', '2017-03-16 00:00:00', 'ddd', '2017-03-01 16:03:19', '2017-03-01 16:03:19', '1' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '74', '17', 'iii', '2017-03-09 00:00:00', 'iiiii', '2017-03-01 16:06:40', '2017-03-01 16:06:40', '1' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '75', '17', 'hjjj', '2017-03-29 00:00:00', 'hjjj', '2017-03-01 16:17:18', '2017-03-01 16:17:18', '0' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '76', '17', 'sssd', '2017-03-22 00:00:00', 'ddd', '2017-03-01 16:21:33', '2017-03-01 16:21:33', '0' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '77', '17', 'ddd', '2017-03-07 00:00:00', 'ddd', '2017-03-01 16:24:38', '2017-03-01 16:24:38', '1' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '78', '57', '打电话', '2017-06-29 00:00:00', '还行', '2017-06-29 08:30:45', '2017-06-29 08:30:45', '1' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '79', NULL, '水电费', '2017-06-29 00:00:00', '水电费', '2017-06-29 17:12:46', '2017-06-29 17:12:46', '1' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '80', NULL, '辅导', '2017-06-29 00:00:00', '水电费', '2017-06-29 17:15:32', '2017-06-29 17:15:32', '1' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '81', NULL, '约饭', '2017-06-29 00:00:00', '达成协议', '2017-06-29 17:17:14', '2017-06-29 17:17:14', '1' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '82', NULL, '地方', '2017-06-22 00:00:00', '水电费', '2017-06-29 17:17:43', '2017-06-29 17:17:43', '1' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '83', NULL, '的', '2017-06-01 00:00:00', '水电费', '2017-06-29 17:18:21', '2017-06-29 17:18:21', '1' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '84', '56', '的', '2017-06-29 00:00:00', '的', '2017-06-29 17:20:41', '2017-06-29 17:20:41', '1' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '85', '56', '签合同', '2017-06-30 00:00:00', '哈哈', '2017-06-29 17:20:55', '2017-06-29 17:20:55', '0' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '86', '55', '呵呵', '2017-06-30 00:00:00', '呵呵', '2017-06-29 17:22:47', '2017-06-29 17:22:47', '1' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '87', '55', '1111', '2017-06-30 00:00:00', '有', '2017-06-29 17:29:44', '2017-06-29 17:38:25', '1' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '88', '49', 'sdfsdfsfsfsdf', '2017-06-30 00:00:00', 'sdf', '2017-06-30 11:04:32', '2017-06-30 11:05:03', '1' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '89', '62', '请客洽谈', '2017-08-14 00:00:00', '良好', '2017-08-14 14:11:38', '2017-08-14 14:11:38', '1' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '90', '62', '签单', '2017-08-15 00:00:00', '非常好', '2017-08-14 14:12:30', '2017-08-14 14:12:30', '1' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '91', '26', '请客吃饭', '2017-08-14 00:00:00', '为211', '2017-08-14 16:37:04', '2017-08-14 16:37:04', '0' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '92', '26', '签单', '2017-08-15 00:00:00', '12', '2017-08-14 16:38:01', '2017-08-14 16:38:01', '0' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '93', '62', '继续请客', '2017-08-17 00:00:00', 'good', '2017-08-14 16:55:38', '2017-08-14 16:55:38', '1' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '94', '62', 'wanshi', '2017-08-23 00:00:00', 'hao', '2017-08-14 16:55:48', '2017-08-14 16:55:48', '0' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '96', '83', '吃饭', '2018-10-02 00:00:00', '宫保鸡丁', '2018-10-27 16:26:22', '2018-10-27 16:43:03', '0' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '97', '83', '唱歌', '2018-10-27 00:00:00', 'Happy', '2018-10-27 16:27:21', '2018-10-27 16:44:00', '1' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '98', '83', '跳舞', '2018-10-04 00:00:00', '高兴就完了', '2018-10-27 16:32:13', '2018-10-27 16:43:42', '0' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '99', '83', '你说呢', '2018-10-27 00:00:00', 'aaa', '2018-10-27 16:52:17', '2018-10-27 16:52:17', '1' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '100', '83', '来一起开心', '2018-10-26 00:00:00', '开心', '2018-10-27 16:53:18', '2018-10-27 16:53:18', '1' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '101', '83', '加盟', '2018-10-25 00:00:00', '加盟费', '2018-10-27 16:58:38', '2018-10-27 16:58:38', '1' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '102', '83', '来啊', '2018-10-26 00:00:00', '快活啊', '2018-10-27 16:59:12', '2018-10-27 16:59:12', '1' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '103', '83', '来了', '2018-10-26 00:00:00', '快活着', '2018-10-27 16:59:43', '2018-10-27 16:59:43', '1' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '104', '83', 'aaa', '2018-10-26 00:00:00', 'bbb', '2018-10-27 17:12:24', '2018-10-28 14:47:42', '0' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '105', '83', '请吃早饭', '2018-10-28 00:00:00', '客户很开心', '2018-10-29 08:43:21', '2018-10-29 08:44:22', '0' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '108', '86', '吃饭', '2018-10-29 00:00:00', '一起吃饭', '2018-10-29 18:00:33', '2018-10-29 18:07:59', '0' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '109', '86', '跳舞', '2018-10-30 00:00:00', '一起跳舞', '2018-10-29 18:01:25', NULL, '1' );
INSERT INTO `t_cus_dev_plan`
VALUES
	( '110', '86', '吃饭', '2018-10-29 00:00:00', '吃饭', '2018-10-29 18:35:06', NULL, '1' );-- ----------------------------
-- Table structure for t_datadic
-- ----------------------------
DROP TABLE
IF
	EXISTS `t_datadic`;
CREATE TABLE `t_datadic` (
	`id` INT ( 11 ) NOT NULL AUTO_INCREMENT,
	`data_dic_name` VARCHAR ( 50 ) DEFAULT NULL,
	`data_dic_value` VARCHAR ( 50 ) DEFAULT NULL,
	`is_valid` TINYINT ( 4 ) DEFAULT '1',
	`create_date` datetime DEFAULT NULL,
	`update_date` datetime DEFAULT NULL,
	PRIMARY KEY ( `id` ),
	KEY `FK_t_datadic` ( `data_dic_value` ) 
) ENGINE = INNODB AUTO_INCREMENT = 21 DEFAULT CHARSET = utf8;-- ----------------------------
-- Records of t_datadic
-- ----------------------------
INSERT INTO `t_datadic`
VALUES
	( '1', '客户等级', '普通客户', '1', NULL, '2018-11-02 16:00:37' );
INSERT INTO `t_datadic`
VALUES
	( '2', '客户等级', '重点开发客户', '1', NULL, NULL );
INSERT INTO `t_datadic`
VALUES
	( '3', '客户等级', '大客户', '1', NULL, NULL );
INSERT INTO `t_datadic`
VALUES
	( '4', '客户等级', '合作伙伴', '1', NULL, NULL );
INSERT INTO `t_datadic`
VALUES
	( '5', '客户等级', '战略合作伙伴', '1', NULL, NULL );
INSERT INTO `t_datadic`
VALUES
	( '6', '服务类型', '咨询', '1', NULL, NULL );
INSERT INTO `t_datadic`
VALUES
	( '7', '服务类型', '建议', '1', NULL, NULL );
INSERT INTO `t_datadic`
VALUES
	( '8', '服务类型', '投诉', '1', NULL, '2016-08-24 15:48:46' );
INSERT INTO `t_datadic`
VALUES
	( '9', '客户等级', '不小的客户', '0', '2016-08-24 15:48:21', '2016-08-24 15:51:10' );
INSERT INTO `t_datadic`
VALUES
	( '16', '订单类型', '已发货', '0', '2018-10-31 20:28:11', '2018-11-02 16:09:45' );
INSERT INTO `t_datadic`
VALUES
	( '17', '服务类型', '鼓励', '0', NULL, '2018-11-02 16:09:45' );
INSERT INTO `t_datadic`
VALUES
	( '18', '教学阶段', '初级', '1', '2018-11-02 15:56:31', '2018-11-02 15:56:31' );
INSERT INTO `t_datadic`
VALUES
	( '19', '教学阶段', '高级', '1', '2018-11-02 15:58:02', '2018-11-02 16:49:48' );
INSERT INTO `t_datadic`
VALUES
	( '20', '客户等级', '123123', '0', '2018-11-02 16:10:45', '2018-11-02 16:11:13' );-- ----------------------------
-- Table structure for t_log
-- ----------------------------
DROP TABLE
IF
	EXISTS `t_log`;
CREATE TABLE `t_log` (
	`id` INT ( 11 ) NOT NULL AUTO_INCREMENT,
	`description` VARCHAR ( 255 ) DEFAULT NULL,
	`method` VARCHAR ( 255 ) DEFAULT NULL,
	`type` VARCHAR ( 255 ) DEFAULT NULL,
	`request_ip` VARCHAR ( 255 ) DEFAULT NULL,
	`exception_code` VARCHAR ( 255 ) DEFAULT NULL,
	`exception_detail` VARCHAR ( 255 ) DEFAULT NULL,
	`params` text,
	`create_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
	`execute_time` INT ( 11 ) DEFAULT NULL,
	`create_man` VARCHAR ( 255 ) DEFAULT NULL,
	`result` LONGTEXT,
	PRIMARY KEY ( `id` ) 
) ENGINE = INNODB AUTO_INCREMENT = 184 DEFAULT CHARSET = utf8;-- ----------------------------
-- Records of t_log
-- ----------------------------
INSERT INTO `t_log`
VALUES
	( '10', '用户登录', 'cn.jyx.controller.UserAction.loginUser()', '0', NULL, NULL, NULL, NULL, '2017-07-03 09:03:23', NULL, NULL, NULL );
INSERT INTO `t_log`
VALUES
	( '11', '用户登录', 'cn.jyx.service.UserService.loginUser()', '1', NULL, 'cn.jyx.exception.ParamException', '记录不存在', NULL, '2017-07-03 09:03:23', NULL, NULL, NULL );
INSERT INTO `t_log`
VALUES
	( '12', '登录页面', 'index', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-03 09:39:22', NULL, NULL, NULL );
INSERT INTO `t_log`
VALUES
	( '13', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-03 09:39:45', NULL, NULL, NULL );
INSERT INTO `t_log`
VALUES
	( '14', '营销机会管理', 'index', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{\"saleChanceId\":[\"57\"],\"show\":[\"1\"]}', '2017-07-03 09:40:37', NULL, NULL, NULL );
INSERT INTO `t_log`
VALUES
	( '15', '营销机会管理-查询', 'list', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{\"saleChanceId\":[\"57\"]}', '2017-07-03 09:40:54', NULL, NULL, NULL );
INSERT INTO `t_log`
VALUES
	( '16', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-03 09:47:45', '13', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '17', '客户开发计划项', 'index', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{\"saleChanceId\":[\"57\"],\"show\":[\"1\"]}', '2017-07-03 09:48:24', '5', 'shsxt', '\"cus_dev_plan\"' );
INSERT INTO `t_log`
VALUES
	( '18', '客户开发计划项-查询', 'list', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{\"saleChanceId\":[\"57\"]}', '2017-07-03 09:48:24', '12', 'shsxt', '{\"rows\":[{\"exeAffect\":\"还行\",\"id\":78,\"planDate\":1498665600000,\"planItem\":\"打电话\",\"saleChanceId\":57}]}' );
INSERT INTO `t_log`
VALUES
	( '19', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-03 10:22:09', '13', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '20', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-03 10:47:19', '4', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '21', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-03 11:44:47', '13', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '22', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-03 11:53:57', '6', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '23', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-03 14:16:40', '14', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '24', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-03 14:17:18', '11', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '25', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-03 14:18:15', '26', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '26', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-03 14:22:44', '13', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '27', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-03 14:23:06', '4', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '28', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-03 14:57:15', '25', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '29', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-03 15:23:00', '11', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '30', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-03 15:28:20', '2', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '31', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-03 16:22:20', '13', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '32', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-03 16:24:02', '2', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '33', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-03 16:26:18', '2', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '34', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-03 16:26:20', '3', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '35', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-03 16:26:20', '3', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '36', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-03 16:26:20', '3', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '37', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-03 16:26:50', '1', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '38', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-03 16:26:51', '2', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '39', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-03 16:26:51', '4', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '40', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-03 16:26:51', '3', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '41', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-03 16:26:51', '3', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '42', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-03 16:26:51', '3', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '43', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-04 09:07:51', '20', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '44', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-04 09:09:05', '2', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '45', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-04 09:11:02', '11', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '46', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-04 09:22:20', '13', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '47', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-04 14:00:17', '10', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '48', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-04 14:02:39', '2', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '49', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-04 14:02:39', '3', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '50', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-04 15:19:53', '12', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '51', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-04 17:13:44', '12', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '52', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-04 17:36:29', '11', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '53', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-04 17:52:20', '19', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '54', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-06 08:41:42', '19', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '55', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-06 08:43:59', '3', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '56', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-06 08:44:00', '3', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '57', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-06 08:44:40', '3', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '58', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-06 08:48:02', '2', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '59', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-06 08:48:03', '3', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '60', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-06 10:06:04', '10', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '61', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-06 10:39:44', '5', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '62', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-06 10:41:45', '12', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '63', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-06 10:47:51', '13', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '64', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-06 10:53:26', '12', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '65', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-06 14:01:19', '16', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '66', '登录页面', 'index', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-06 14:44:03', '0', NULL, '\"index\"' );
INSERT INTO `t_log`
VALUES
	( '67', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-06 14:44:14', '4', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '68', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-06 16:30:28', '11', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '69', '登录页面', 'index', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-06 16:41:19', '2', NULL, '\"index\"' );
INSERT INTO `t_log`
VALUES
	( '70', '登录页面', 'index', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-06 16:45:06', '2', NULL, '\"index\"' );
INSERT INTO `t_log`
VALUES
	( '71', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-06 16:45:11', '4', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '72', '登录页面', 'index', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-06 16:48:03', '0', NULL, '\"index\"' );
INSERT INTO `t_log`
VALUES
	( '73', '登录页面', 'index', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-06 16:48:06', '0', NULL, '\"index\"' );
INSERT INTO `t_log`
VALUES
	( '74', '登录页面', 'index', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-06 16:48:17', '0', NULL, '\"index\"' );
INSERT INTO `t_log`
VALUES
	( '75', '登录页面', 'index', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-06 16:48:23', '0', NULL, '\"index\"' );
INSERT INTO `t_log`
VALUES
	( '76', '登录页面', 'index', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-06 16:48:51', '0', NULL, '\"index\"' );
INSERT INTO `t_log`
VALUES
	( '77', '登录页面', 'index', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-06 16:49:06', '0', NULL, '\"index\"' );
INSERT INTO `t_log`
VALUES
	( '78', '登录页面', 'index', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-06 16:49:12', '0', NULL, '\"index\"' );
INSERT INTO `t_log`
VALUES
	( '79', '登录页面', 'index', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-06 16:49:23', '0', NULL, '\"index\"' );
INSERT INTO `t_log`
VALUES
	( '80', '登录页面', 'index', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-06 16:49:25', '0', NULL, '\"index\"' );
INSERT INTO `t_log`
VALUES
	( '81', '登录页面', 'index', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-06 16:49:48', '0', NULL, '\"index\"' );
INSERT INTO `t_log`
VALUES
	( '82', '登录页面', 'index', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-06 16:49:52', '0', NULL, '\"index\"' );
INSERT INTO `t_log`
VALUES
	( '83', '登录页面', 'index', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-06 16:49:58', '0', NULL, '\"index\"' );
INSERT INTO `t_log`
VALUES
	( '84', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-06 16:50:14', '4', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '85', '登录页面', 'index', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-06 16:50:33', '0', NULL, '\"index\"' );
INSERT INTO `t_log`
VALUES
	( '86', '登录页面', 'index', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-06 16:50:42', '0', NULL, '\"index\"' );
INSERT INTO `t_log`
VALUES
	( '87', '登录页面', 'index', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-06 16:51:16', '0', NULL, '\"index\"' );
INSERT INTO `t_log`
VALUES
	( '88', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-06 16:51:19', '3', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '89', '登录页面', 'index', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-06 16:58:43', '1', NULL, '\"index\"' );
INSERT INTO `t_log`
VALUES
	( '90', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-06 16:58:49', '3', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '91', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-06 17:03:27', '4', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '92', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-06 17:03:52', '3', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '93', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-06 17:04:55', '2', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '94', '登录页面', 'index', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-06 17:05:38', '0', NULL, '\"index\"' );
INSERT INTO `t_log`
VALUES
	( '95', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-06 17:05:44', '3', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '96', '登录页面', 'index', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-06 17:05:50', '0', NULL, '\"index\"' );
INSERT INTO `t_log`
VALUES
	( '97', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-06 17:06:19', '3', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '98', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-07-06 17:09:26', '3', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '99', '登录页面', 'index', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-08-09 09:29:42', '1', NULL, '\"index\"' );
INSERT INTO `t_log`
VALUES
	( '100', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-08-09 09:30:12', '3', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '101', '登录页面', 'index', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-08-10 09:40:15', '0', NULL, '\"index\"' );
INSERT INTO `t_log`
VALUES
	( '102', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-08-10 15:12:29', '3', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '103', '客户开发计划项', 'index', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{\"saleChanceId\":[\"60\"],\"show\":[\"0\"]}', '2017-08-10 16:05:32', '6', 'shsxt', '\"cus_dev_plan\"' );
INSERT INTO `t_log`
VALUES
	( '104', '客户开发计划项-查询', 'list', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{\"saleChanceId\":[\"60\"]}', '2017-08-10 16:05:32', '12', 'shsxt', '{\"rows\":[]}' );
INSERT INTO `t_log`
VALUES
	( '105', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-08-10 17:37:27', '2', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '106', '登录页面', 'index', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-08-13 09:55:53', '2', 'shsxt', '\"index\"' );
INSERT INTO `t_log`
VALUES
	( '107', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-08-13 09:55:56', '3', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '108', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-08-13 09:56:09', '6', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '109', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-08-13 09:56:09', '2', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '110', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-08-13 09:56:18', '2', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '111', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-08-13 11:21:41', '2', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '112', '客户开发计划项', 'index', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{\"saleChanceId\":[\"60\"],\"show\":[\"0\"]}', '2017-08-13 11:23:24', '5', 'shsxt', '\"cus_dev_plan\"' );
INSERT INTO `t_log`
VALUES
	( '113', '客户开发计划项-查询', 'list', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{\"saleChanceId\":[\"60\"]}', '2017-08-13 11:23:24', '9', 'shsxt', '{\"rows\":[]}' );
INSERT INTO `t_log`
VALUES
	( '114', '客户开发计划项', 'index', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{\"saleChanceId\":[\"57\"],\"show\":[\"1\"]}', '2017-08-13 11:23:36', '2', 'shsxt', '\"cus_dev_plan\"' );
INSERT INTO `t_log`
VALUES
	( '115', '客户开发计划项-查询', 'list', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{\"saleChanceId\":[\"57\"]}', '2017-08-13 11:23:36', '3', 'shsxt', '{\"rows\":[{\"exeAffect\":\"还行\",\"id\":78,\"planDate\":1498665600000,\"planItem\":\"打电话\",\"saleChanceId\":57}]}' );
INSERT INTO `t_log`
VALUES
	( '116', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-08-14 08:22:21', '2', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '117', '客户开发计划项', 'index', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{\"saleChanceId\":[\"62\"],\"show\":[\"0\"]}', '2017-08-14 14:11:15', '3', 'shsxt', '\"cus_dev_plan\"' );
INSERT INTO `t_log`
VALUES
	( '118', '客户开发计划项-查询', 'list', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{\"saleChanceId\":[\"62\"]}', '2017-08-14 14:11:16', '2', 'shsxt', '{\"rows\":[]}' );
INSERT INTO `t_log`
VALUES
	( '119', '客户开发计划项-查询', 'list', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{\"saleChanceId\":[\"62\"]}', '2017-08-14 14:11:38', '3', 'shsxt', '{\"rows\":[{\"exeAffect\":\"良好\",\"id\":89,\"planDate\":1502640000000,\"planItem\":\"请客洽谈\",\"saleChanceId\":62}]}' );
INSERT INTO `t_log`
VALUES
	( '120', '客户开发计划项-新增', 'add', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{\"isNewRecord\":[\"true\"],\"saleChanceId\":[\"62\"],\"planDate\":[\"2017-08-14\"],\"planItem\":[\"请客洽谈\"],\"exeAffect\":[\"良好\"]}', '2017-08-14 14:11:38', '66', 'shsxt', '{\"result\":\"添加成功\",\"resultCode\":1,\"resultMessage\":\"操作成功\"}' );
INSERT INTO `t_log`
VALUES
	( '121', '客户开发计划项', 'index', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{\"saleChanceId\":[\"62\"],\"show\":[\"1\"]}', '2017-08-14 14:11:58', '2', 'shsxt', '\"cus_dev_plan\"' );
INSERT INTO `t_log`
VALUES
	( '122', '客户开发计划项-查询', 'list', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{\"saleChanceId\":[\"62\"]}', '2017-08-14 14:11:58', '4', 'shsxt', '{\"rows\":[{\"exeAffect\":\"良好\",\"id\":89,\"planDate\":1502640000000,\"planItem\":\"请客洽谈\",\"saleChanceId\":62}]}' );
INSERT INTO `t_log`
VALUES
	( '123', '客户开发计划项', 'index', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{\"saleChanceId\":[\"62\"],\"show\":[\"1\"]}', '2017-08-14 14:12:04', '3', 'shsxt', '\"cus_dev_plan\"' );
INSERT INTO `t_log`
VALUES
	( '124', '客户开发计划项-查询', 'list', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{\"saleChanceId\":[\"62\"]}', '2017-08-14 14:12:05', '3', 'shsxt', '{\"rows\":[{\"exeAffect\":\"良好\",\"id\":89,\"planDate\":1502640000000,\"planItem\":\"请客洽谈\",\"saleChanceId\":62}]}' );
INSERT INTO `t_log`
VALUES
	( '125', '客户开发计划项-新增', 'add', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{\"isNewRecord\":[\"true\"],\"saleChanceId\":[\"62\"],\"planDate\":[\"2017-08-15\"],\"planItem\":[\"签单\"],\"exeAffect\":[\"非常好\"]}', '2017-08-14 14:12:30', '13', 'shsxt', '{\"result\":\"添加成功\",\"resultCode\":1,\"resultMessage\":\"操作成功\"}' );
INSERT INTO `t_log`
VALUES
	( '126', '客户开发计划项-查询', 'list', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{\"saleChanceId\":[\"62\"]}', '2017-08-14 14:12:30', '2', 'shsxt', '{\"rows\":[{\"exeAffect\":\"良好\",\"id\":89,\"planDate\":1502640000000,\"planItem\":\"请客洽谈\",\"saleChanceId\":62},{\"exeAffect\":\"非常好\",\"id\":90,\"planDate\":1502726400000,\"planItem\":\"签单\",\"saleChanceId\":62}]}' );
INSERT INTO `t_log`
VALUES
	( '127', '客户开发计划项', 'index', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{\"saleChanceId\":[\"57\"],\"show\":[\"1\"]}', '2017-08-14 15:05:05', '2', 'shsxt', '\"cus_dev_plan\"' );
INSERT INTO `t_log`
VALUES
	( '128', '客户开发计划项-查询', 'list', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{\"saleChanceId\":[\"57\"]}', '2017-08-14 15:05:05', '4', 'shsxt', '{\"rows\":[{\"exeAffect\":\"还行\",\"id\":78,\"planDate\":1498665600000,\"planItem\":\"打电话\",\"saleChanceId\":57}]}' );
INSERT INTO `t_log`
VALUES
	( '129', '客户开发计划项', 'index', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{\"saleChanceId\":[\"60\"],\"show\":[\"0\"]}', '2017-08-14 16:16:38', '3', 'shsxt', '\"cus_dev_plan\"' );
INSERT INTO `t_log`
VALUES
	( '130', '客户开发计划项-查询', 'list', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{\"saleChanceId\":[\"60\"]}', '2017-08-14 16:16:38', '4', 'shsxt', '{\"rows\":[]}' );
INSERT INTO `t_log`
VALUES
	( '131', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-08-15 17:34:29', '3', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '132', '营销机会管理', 'index', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{\"permission\":[\"1010\"]}', '2017-08-18 15:20:17', '11610', 'shsxt', '\"sale_chance\"' );
INSERT INTO `t_log`
VALUES
	( '133', '营销机会管理', 'index', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{\"permission\":[\"1010\"]}', '2017-08-18 15:22:16', '0', 'shsxt', '\"sale_chance\"' );
INSERT INTO `t_log`
VALUES
	( '134', '营销机会管理', 'index', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{\"permission\":[\"1010\"]}', '2017-08-18 15:23:37', '0', 'shsxt', '\"sale_chance\"' );
INSERT INTO `t_log`
VALUES
	( '135', '营销机会管理-查询', 'list', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{\"page\":[\"1\"],\"rows\":[\"10\"]}', '2017-08-18 15:23:37', '7', 'shsxt', '{\"total\":34,\"paginator\":{\"endRow\":10,\"firstPage\":true,\"hasNextPage\":true,\"hasPrePage\":false,\"lastPage\":false,\"limit\":10,\"nextPage\":2,\"offset\":0,\"page\":1,\"prePage\":1,\"slider\":[1,2,3,4],\"startRow\":1,\"totalCount\":34,\"totalPages\":4},\"rows\":[{\"assignMan\":\"admin1\",\"assignTime\":1502670384000,\"cgjl\":80,\"chanceSource\":\"廖老师介绍\",\"createDate\":1502608217000,\"createMan\":\"shsxt\",\"customerId\":35,\"customerName\":\"上海尚学堂浦东校区\",\"description\":\"哈哈哈哈哈哈\",\"devResult\":1,\"id\":62,\"linkMan\":\"李壮壮\",\"linkPhone\":\"1366666666\",\"overview\":\"需要服务器5台\",\"state\":1},{\"assignMan\":\"\",\"cgjl\":89,\"chanceSource\":\"老裴推荐\",\"createDate\":1502608084000,\"createMan\":\"shsxt\",\"customerId\":34,\"customerName\":\"浦西尚学堂\",\"description\":\"水电费水电费水电费水电费\",\"devResult\":0,\"id\":61,\"linkMan\":\"老裴\",\"linkPhone\":\"13999999999\",\"overview\":\"需要服务器5台\",\"state\":0},{\"assignMan\":\"小明\",\"assignTime\":1502352310000,\"cgjl\":80,\"chanceSource\":\"友情推荐\",\"createDate\":1502352310000,\"createMan\":\"shsxt\",\"customerId\":16,\"customerName\":\"风驰科技\",\"description\":\"老裴公司需要服务器多少多少台\",\"devResult\":0,\"id\":60,\"linkMan\":\"老裴\",\"linkPhone\":\"1366666666\",\"overview\":\"需要服务若干台\",\"state\":1},{\"assignMan\":\"小明\",\"assignTime\":1498696011000,\"cgjl\":10,\"chanceSource\":\"胜多负少\",\"createDate\":1498204647000,\"createMan\":\"shsxt\",\"customerId\":1,\"customerName\":\"1\",\"description\":\"水电费\",\"devResult\":3,\"id\":57,\"linkMan\":\" 水电费\",\"linkPhone\":\"13888888888\",\"overview\":\"水电费\",\"state\":1},{\"assignMan\":\"admin\",\"assignTime\":1488366620000,\"chanceSource\":\"\",\"createDate\":1488366620000,\"createMan\":\"Tony\",\"customerName\":\"wwwwwwww\",\"description\":\"\",\"devResult\":2,\"id\":56,\"linkMan\":\"\",\"linkPhone\":\"\",\"overview\":\"\",\"state\":1},{\"assignMan\":\"admin\",\"assignTime\":1488366298000,\"chanceSource\":\"\",\"createDate\":1488366298000,\"createMan\":\"\",\"customerName\":\"asad\",\"description\":\"\",\"devResult\":0,\"id\":53,\"linkMan\":\"10\",\"linkPhone\":\"\",\"overview\":\"\",\"state\":1},{\"assignMan\":\"admin\",\"assignTime\":1488366208000,\"chanceSource\":\"\",\"createDate\":1488366208000,\"createMan\":\"\",\"customerName\":\"sada\",\"description\":\"\",\"id\":52,\"linkMan\":\"\",\"linkPhone\":\"\",\"overview\":\"\",\"state\":1},{\"assignMan\":\"\",\"cgjl\":12,\"chanceSource\":\"\",\"createDate\":1488366104000,\"createMan\":\"\",\"customerName\":\"sadsa\",\"description\":\"\",\"id\":51,\"linkMan\":\"\",\"linkPhone\":\"\",\"overview\":\"\"},{\"assignMan\":\"admin\",\"assignTime\":1488366001000,\"chanceSource\":\"\",\"createDate\":1488366001000,\"createMan\":\"\",\"customerName\":\"sadads\",\"description\":\"\",\"devResult\":0,\"id\":50,\"linkMan\":\"\",\"linkPhone\":\"\",\"overview\":\"\",\"state\":1},{\"assignMan\":\"\",\"cgjl\":10,\"chanceSource\":\"\",\"createDate\":1488365783000,\"createMan\":\"\",\"customerName\":\"\",\"description\":\"\",\"id\":47,\"linkMan\":\"sadsad\",\"linkPhone\":\"\",\"overview\":\"\"}]}' );
INSERT INTO `t_log`
VALUES
	( '136', '营销机会管理', 'java.lang.reflect.Method.index', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{\"permission\":[\"1010\"]}', '2017-08-18 15:25:12', '6', 'shsxt', '\"sale_chance\"' );
INSERT INTO `t_log`
VALUES
	( '137', '营销机会管理-查询', 'java.lang.reflect.Method.list', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{\"page\":[\"1\"],\"rows\":[\"10\"]}', '2017-08-18 15:25:28', '21', 'shsxt', '{\"total\":34,\"paginator\":{\"endRow\":10,\"firstPage\":true,\"hasNextPage\":true,\"hasPrePage\":false,\"lastPage\":false,\"limit\":10,\"nextPage\":2,\"offset\":0,\"page\":1,\"prePage\":1,\"slider\":[1,2,3,4],\"startRow\":1,\"totalCount\":34,\"totalPages\":4},\"rows\":[{\"assignMan\":\"admin1\",\"assignTime\":1502670384000,\"cgjl\":80,\"chanceSource\":\"廖老师介绍\",\"createDate\":1502608217000,\"createMan\":\"shsxt\",\"customerId\":35,\"customerName\":\"上海尚学堂浦东校区\",\"description\":\"哈哈哈哈哈哈\",\"devResult\":1,\"id\":62,\"linkMan\":\"李壮壮\",\"linkPhone\":\"1366666666\",\"overview\":\"需要服务器5台\",\"state\":1},{\"assignMan\":\"\",\"cgjl\":89,\"chanceSource\":\"老裴推荐\",\"createDate\":1502608084000,\"createMan\":\"shsxt\",\"customerId\":34,\"customerName\":\"浦西尚学堂\",\"description\":\"水电费水电费水电费水电费\",\"devResult\":0,\"id\":61,\"linkMan\":\"老裴\",\"linkPhone\":\"13999999999\",\"overview\":\"需要服务器5台\",\"state\":0},{\"assignMan\":\"小明\",\"assignTime\":1502352310000,\"cgjl\":80,\"chanceSource\":\"友情推荐\",\"createDate\":1502352310000,\"createMan\":\"shsxt\",\"customerId\":16,\"customerName\":\"风驰科技\",\"description\":\"老裴公司需要服务器多少多少台\",\"devResult\":0,\"id\":60,\"linkMan\":\"老裴\",\"linkPhone\":\"1366666666\",\"overview\":\"需要服务若干台\",\"state\":1},{\"assignMan\":\"小明\",\"assignTime\":1498696011000,\"cgjl\":10,\"chanceSource\":\"胜多负少\",\"createDate\":1498204647000,\"createMan\":\"shsxt\",\"customerId\":1,\"customerName\":\"1\",\"description\":\"水电费\",\"devResult\":3,\"id\":57,\"linkMan\":\" 水电费\",\"linkPhone\":\"13888888888\",\"overview\":\"水电费\",\"state\":1},{\"assignMan\":\"admin\",\"assignTime\":1488366620000,\"chanceSource\":\"\",\"createDate\":1488366620000,\"createMan\":\"Tony\",\"customerName\":\"wwwwwwww\",\"description\":\"\",\"devResult\":2,\"id\":56,\"linkMan\":\"\",\"linkPhone\":\"\",\"overview\":\"\",\"state\":1},{\"assignMan\":\"admin\",\"assignTime\":1488366298000,\"chanceSource\":\"\",\"createDate\":1488366298000,\"createMan\":\"\",\"customerName\":\"asad\",\"description\":\"\",\"devResult\":0,\"id\":53,\"linkMan\":\"10\",\"linkPhone\":\"\",\"overview\":\"\",\"state\":1},{\"assignMan\":\"admin\",\"assignTime\":1488366208000,\"chanceSource\":\"\",\"createDate\":1488366208000,\"createMan\":\"\",\"customerName\":\"sada\",\"description\":\"\",\"id\":52,\"linkMan\":\"\",\"linkPhone\":\"\",\"overview\":\"\",\"state\":1},{\"assignMan\":\"\",\"cgjl\":12,\"chanceSource\":\"\",\"createDate\":1488366104000,\"createMan\":\"\",\"customerName\":\"sadsa\",\"description\":\"\",\"id\":51,\"linkMan\":\"\",\"linkPhone\":\"\",\"overview\":\"\"},{\"assignMan\":\"admin\",\"assignTime\":1488366001000,\"chanceSource\":\"\",\"createDate\":1488366001000,\"createMan\":\"\",\"customerName\":\"sadads\",\"description\":\"\",\"devResult\":0,\"id\":50,\"linkMan\":\"\",\"linkPhone\":\"\",\"overview\":\"\",\"state\":1},{\"assignMan\":\"\",\"cgjl\":10,\"chanceSource\":\"\",\"createDate\":1488365783000,\"createMan\":\"\",\"customerName\":\"\",\"description\":\"\",\"id\":47,\"linkMan\":\"sadsad\",\"linkPhone\":\"\",\"overview\":\"\"}]}' );
INSERT INTO `t_log`
VALUES
	( '138', '营销机会管理', 'public java.lang.String com.shsxt.crm.controller.SaleChanceController.index(java.lang.Integer)', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{\"permission\":[\"1010\"]}', '2017-08-18 15:30:07', '7', 'shsxt', '\"sale_chance\"' );
INSERT INTO `t_log`
VALUES
	( '139', '营销机会管理-查询', 'public java.util.Map com.shsxt.crm.controller.SaleChanceController.list(com.shsxt.crm.dto.SaleChanceQuery)', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{\"page\":[\"1\"],\"rows\":[\"10\"]}', '2017-08-18 15:30:33', '20', 'shsxt', '{\"total\":34,\"paginator\":{\"endRow\":10,\"firstPage\":true,\"hasNextPage\":true,\"hasPrePage\":false,\"lastPage\":false,\"limit\":10,\"nextPage\":2,\"offset\":0,\"page\":1,\"prePage\":1,\"slider\":[1,2,3,4],\"startRow\":1,\"totalCount\":34,\"totalPages\":4},\"rows\":[{\"assignMan\":\"admin1\",\"assignTime\":1502670384000,\"cgjl\":80,\"chanceSource\":\"廖老师介绍\",\"createDate\":1502608217000,\"createMan\":\"shsxt\",\"customerId\":35,\"customerName\":\"上海尚学堂浦东校区\",\"description\":\"哈哈哈哈哈哈\",\"devResult\":1,\"id\":62,\"linkMan\":\"李壮壮\",\"linkPhone\":\"1366666666\",\"overview\":\"需要服务器5台\",\"state\":1},{\"assignMan\":\"\",\"cgjl\":89,\"chanceSource\":\"老裴推荐\",\"createDate\":1502608084000,\"createMan\":\"shsxt\",\"customerId\":34,\"customerName\":\"浦西尚学堂\",\"description\":\"水电费水电费水电费水电费\",\"devResult\":0,\"id\":61,\"linkMan\":\"老裴\",\"linkPhone\":\"13999999999\",\"overview\":\"需要服务器5台\",\"state\":0},{\"assignMan\":\"小明\",\"assignTime\":1502352310000,\"cgjl\":80,\"chanceSource\":\"友情推荐\",\"createDate\":1502352310000,\"createMan\":\"shsxt\",\"customerId\":16,\"customerName\":\"风驰科技\",\"description\":\"老裴公司需要服务器多少多少台\",\"devResult\":0,\"id\":60,\"linkMan\":\"老裴\",\"linkPhone\":\"1366666666\",\"overview\":\"需要服务若干台\",\"state\":1},{\"assignMan\":\"小明\",\"assignTime\":1498696011000,\"cgjl\":10,\"chanceSource\":\"胜多负少\",\"createDate\":1498204647000,\"createMan\":\"shsxt\",\"customerId\":1,\"customerName\":\"1\",\"description\":\"水电费\",\"devResult\":3,\"id\":57,\"linkMan\":\" 水电费\",\"linkPhone\":\"13888888888\",\"overview\":\"水电费\",\"state\":1},{\"assignMan\":\"admin\",\"assignTime\":1488366620000,\"chanceSource\":\"\",\"createDate\":1488366620000,\"createMan\":\"Tony\",\"customerName\":\"wwwwwwww\",\"description\":\"\",\"devResult\":2,\"id\":56,\"linkMan\":\"\",\"linkPhone\":\"\",\"overview\":\"\",\"state\":1},{\"assignMan\":\"admin\",\"assignTime\":1488366298000,\"chanceSource\":\"\",\"createDate\":1488366298000,\"createMan\":\"\",\"customerName\":\"asad\",\"description\":\"\",\"devResult\":0,\"id\":53,\"linkMan\":\"10\",\"linkPhone\":\"\",\"overview\":\"\",\"state\":1},{\"assignMan\":\"admin\",\"assignTime\":1488366208000,\"chanceSource\":\"\",\"createDate\":1488366208000,\"createMan\":\"\",\"customerName\":\"sada\",\"description\":\"\",\"id\":52,\"linkMan\":\"\",\"linkPhone\":\"\",\"overview\":\"\",\"state\":1},{\"assignMan\":\"\",\"cgjl\":12,\"chanceSource\":\"\",\"createDate\":1488366104000,\"createMan\":\"\",\"customerName\":\"sadsa\",\"description\":\"\",\"id\":51,\"linkMan\":\"\",\"linkPhone\":\"\",\"overview\":\"\"},{\"assignMan\":\"admin\",\"assignTime\":1488366001000,\"chanceSource\":\"\",\"createDate\":1488366001000,\"createMan\":\"\",\"customerName\":\"sadads\",\"description\":\"\",\"devResult\":0,\"id\":50,\"linkMan\":\"\",\"linkPhone\":\"\",\"overview\":\"\",\"state\":1},{\"assignMan\":\"\",\"cgjl\":10,\"chanceSource\":\"\",\"createDate\":1488365783000,\"createMan\":\"\",\"customerName\":\"\",\"description\":\"\",\"id\":47,\"linkMan\":\"sadsad\",\"linkPhone\":\"\",\"overview\":\"\"}]}' );
INSERT INTO `t_log`
VALUES
	( '140', '登录页面', 'index', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-08-18 15:52:52', '0', 'shsxt', '\"index\"' );
INSERT INTO `t_log`
VALUES
	( '141', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-08-18 15:52:53', '2', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '142', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-08-18 16:27:46', '2', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '143', '客户信息管理', 'public java.lang.String com.shsxt.crm.controller.CustomerController.index()', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-08-18 16:27:59', '6', 'shsxt', '\"customer\"' );
INSERT INTO `t_log`
VALUES
	( '144', '客户信息管理-分页查询', 'public java.util.Map com.shsxt.crm.controller.CustomerController.selectForPage(com.shsxt.crm.dto.CustomerQuery)', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{\"page\":[\"1\"],\"rows\":[\"10\"]}', '2017-08-18 16:27:59', '42', 'shsxt', '{\"total\":8,\"rows\":[{\"address\":\"浦东张江高科1号\",\"area\":\"北京\",\"createDate\":1499065424000,\"cusManager\":\"admin1\",\"dsdjh\":\"3242342423\",\"fax\":\"021-89898989\",\"fr\":\"赵老师\",\"gsdjh\":\"234234234\",\"id\":36,\"isValid\":1,\"khno\":\"KH20170703150344713\",\"khyh\":\"中国银行\",\"khzh\":\"89890100001010103947\",\"level\":\"普通客户\",\"myd\":\"☆\",\"name\":\"上海尚学堂浦东校区1\",\"nyye\":\"1\",\"phone\":\"13644443333\",\"postCode\":\"100027\",\"state\":0,\"updateDate\":1499065424000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"10000000\"},{\"address\":\"浦东张江高科1号11\",\"area\":\"上海\",\"createDate\":1499064974000,\"cusManager\":\"小明\",\"dsdjh\":\"3242342423\",\"fax\":\"021-89898989\",\"fr\":\"廖老师\",\"gsdjh\":\"234234234\",\"id\":35,\"isValid\":1,\"khno\":\"KH20170703145613140\",\"khyh\":\"中国银行\",\"khzh\":\"89890100001010103947\",\"level\":\"重点开发客户\",\"myd\":\"☆\",\"name\":\"上海尚学堂浦东校区\",\"nyye\":\"1\",\"phone\":\"13644443333\",\"postCode\":\"100027\",\"state\":0,\"updateDate\":1499065515000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"10000000\"},{\"address\":\"浦东新区\",\"area\":\"上海\",\"createDate\":1482827301000,\"cusManager\":\"zs\",\"dsdjh\":\"1000\",\"fax\":\"sxt@sxt.cn\",\"fr\":\"老裴\",\"gsdjh\":\"10000\",\"id\":34,\"isValid\":1,\"khno\":\"KH201612271628316\",\"khyh\":\"工商\",\"khzh\":\"100100000\",\"level\":\"战略合作伙伴\",\"myd\":\"☆☆☆☆☆\",\"name\":\"浦西尚学堂\",\"nyye\":\"22\",\"phone\":\"1001111\",\"postCode\":\"100100\",\"state\":0,\"updateDate\":1488431897000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"1001000\",\"zczj\":\"100\"},{\"address\":\"1111fsdf\",\"area\":\"上海\",\"createDate\":1451639356000,\"cusManager\":\"小红\",\"dsdjh\":\"4535213212\",\"fax\":\"111\",\"fr\":\"老宋\",\"gsdjh\":\"中国\",\"id\":30,\"isValid\":1,\"khno\":\"KH201609011709179\",\"khyh\":\"中国银行\",\"khzh\":\"6225231243641\",\"level\":\"大客户\",\"myd\":\"☆\",\"name\":\"天猫11\",\"nyye\":\"1000000\",\"phone\":\"11111\",\"postCode\":\"200233\",\"state\":1,\"updateDate\":1499161947000,\"webSite\":\"111\",\"xyd\":\"☆☆☆\",\"yyzzzch\":\"11\",\"zczj\":\"1000\"},{\"address\":\"上海市徐汇区虹梅路153\",\"area\":\"北京\",\"createDate\":1472034590000,\"cusManager\":\"小明\",\"dsdjh\":\"4535213212\",\"fax\":\"134\",\"fr\":\"老王\",\"gsdjh\":\"中国\",\"id\":29,\"isValid\":1,\"khno\":\"KH201608241829510\",\"khyh\":\"中国银行\",\"khzh\":\"123456456\",\"level\":\"重点开发客户\",\"myd\":\"☆☆☆☆☆\",\"name\":\"上海聪享科技1\",\"nyye\":\"10000\",\"phone\":\"13666666666\",\"postCode\":\"200233\",\"state\":0,\"updateDate\":1472035571000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆\",\"yyzzzch\":\"13344\",\"zczj\":\"100\"},{\"address\":\"62\",\"area\":\"上海\",\"createDate\":1477368939000,\"cusManager\":\"小张\",\"dsdjh\":\"132\",\"fax\":\"42\",\"fr\":\"7777\",\"gsdjh\":\"142\",\"id\":28,\"isValid\":1,\"khno\":\"KH20150729090910\",\"khyh\":\"102\",\"khzh\":\"1111\",\"level\":\"战略合作伙伴\",\"myd\":\"☆☆☆☆☆\",\"name\":\"sssss\",\"nyye\":\"sss\",\"phone\":\"32\",\"postCode\":\"22\",\"state\":0,\"updateDate\":1488451603000,\"webSite\":\"52\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"112\",\"zczj\":\"122\"},{\"address\":\"321\",\"area\":\"北京\",\"createDate\":1453695319000,\"cusManager\":\"小红\",\"dsdjh\":\"321\",\"fax\":\"321\",\"fr\":\"321\",\"gsdjh\":\"3213\",\"id\":16,\"isValid\":1,\"khno\":\"KH20150526073022\",\"khyh\":\"321\",\"khzh\":\"321\",\"level\":\"大客户\",\"myd\":\"☆\",\"name\":\"风驰科技\",\"nyye\":\"21\",\"phone\":\"321\",\"postCode\":\"21\",\"state\":2,\"updateDate\":1502268330000,\"webSite\":\"321\",\"xyd\":\"☆\",\"yyzzzch\":\"321\",\"zczj\":\"\"},{\"address\":\"北京海淀区双榆树东里15号\",\"area\":\"北京\",\"createDate\":1456370923000,\"cusManager\":\"小张\",\"dsdjh\":\"4422214321321\",\"fax\":\"010-62263393\",\"fr\":\"张三\",\"gsdjh\":\"4104322332\",\"id\":1,\"isValid\":1,\"khno\":\"KH21321321\",\"khyh\":\"中国银行\",\"khzh\":\"6225231243641\",\"level\":\"战略合作伙伴\",\"myd\":\"☆☆☆\",\"name\":\"北京大牛科技\",\"nyye\":\"1111\",\"phone\":\"010-62263393\",\"postCode\":\"100027\",\"state\":1,\"updateDate\":1488438414000,\"webSite\":\"www.daniu.com\",\"xyd\":\"☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"1000\"}]}' );
INSERT INTO `t_log`
VALUES
	( '145', '客户信息管理-分页查询', 'public java.util.Map com.shsxt.crm.controller.CustomerController.selectForPage(com.shsxt.crm.dto.CustomerQuery)', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{\"customerNo\":[\"KH20170\"],\"customerName\":[\"上海尚学\"],\"page\":[\"1\"],\"rows\":[\"10\"]}', '2017-08-18 16:28:56', '7', 'shsxt', '{\"total\":2,\"rows\":[{\"address\":\"浦东张江高科1号\",\"area\":\"北京\",\"createDate\":1499065424000,\"cusManager\":\"admin1\",\"dsdjh\":\"3242342423\",\"fax\":\"021-89898989\",\"fr\":\"赵老师\",\"gsdjh\":\"234234234\",\"id\":36,\"isValid\":1,\"khno\":\"KH20170703150344713\",\"khyh\":\"中国银行\",\"khzh\":\"89890100001010103947\",\"level\":\"普通客户\",\"myd\":\"☆\",\"name\":\"上海尚学堂浦东校区1\",\"nyye\":\"1\",\"phone\":\"13644443333\",\"postCode\":\"100027\",\"state\":0,\"updateDate\":1499065424000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"10000000\"},{\"address\":\"浦东张江高科1号11\",\"area\":\"上海\",\"createDate\":1499064974000,\"cusManager\":\"小明\",\"dsdjh\":\"3242342423\",\"fax\":\"021-89898989\",\"fr\":\"廖老师\",\"gsdjh\":\"234234234\",\"id\":35,\"isValid\":1,\"khno\":\"KH20170703145613140\",\"khyh\":\"中国银行\",\"khzh\":\"89890100001010103947\",\"level\":\"重点开发客户\",\"myd\":\"☆\",\"name\":\"上海尚学堂浦东校区\",\"nyye\":\"1\",\"phone\":\"13644443333\",\"postCode\":\"100027\",\"state\":0,\"updateDate\":1499065515000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"10000000\"}]}' );
INSERT INTO `t_log`
VALUES
	( '146', '客户信息管理', 'public java.lang.String com.shsxt.crm.controller.CustomerController.index()', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-08-18 16:40:19', '6', 'shsxt', '\"customer\"' );
INSERT INTO `t_log`
VALUES
	( '147', '客户信息管理-分页查询', 'public java.util.Map com.shsxt.crm.controller.CustomerController.selectForPage(com.shsxt.crm.dto.CustomerQuery)', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{\"page\":[\"1\"],\"rows\":[\"10\"]}', '2017-08-18 16:40:20', '47', 'shsxt', '{\"total\":8,\"rows\":[{\"address\":\"浦东张江高科1号\",\"area\":\"北京\",\"createDate\":1499065424000,\"cusManager\":\"admin1\",\"dsdjh\":\"3242342423\",\"fax\":\"021-89898989\",\"fr\":\"赵老师\",\"gsdjh\":\"234234234\",\"id\":36,\"isValid\":1,\"khno\":\"KH20170703150344713\",\"khyh\":\"中国银行\",\"khzh\":\"89890100001010103947\",\"level\":\"普通客户\",\"myd\":\"☆\",\"name\":\"上海尚学堂浦东校区1\",\"nyye\":\"1\",\"phone\":\"13644443333\",\"postCode\":\"100027\",\"state\":0,\"updateDate\":1499065424000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"10000000\"},{\"address\":\"浦东张江高科1号11\",\"area\":\"上海\",\"createDate\":1499064974000,\"cusManager\":\"小明\",\"dsdjh\":\"3242342423\",\"fax\":\"021-89898989\",\"fr\":\"廖老师\",\"gsdjh\":\"234234234\",\"id\":35,\"isValid\":1,\"khno\":\"KH20170703145613140\",\"khyh\":\"中国银行\",\"khzh\":\"89890100001010103947\",\"level\":\"重点开发客户\",\"myd\":\"☆\",\"name\":\"上海尚学堂浦东校区\",\"nyye\":\"1\",\"phone\":\"13644443333\",\"postCode\":\"100027\",\"state\":0,\"updateDate\":1499065515000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"10000000\"},{\"address\":\"浦东新区\",\"area\":\"上海\",\"createDate\":1482827301000,\"cusManager\":\"zs\",\"dsdjh\":\"1000\",\"fax\":\"sxt@sxt.cn\",\"fr\":\"老裴\",\"gsdjh\":\"10000\",\"id\":34,\"isValid\":1,\"khno\":\"KH201612271628316\",\"khyh\":\"工商\",\"khzh\":\"100100000\",\"level\":\"战略合作伙伴\",\"myd\":\"☆☆☆☆☆\",\"name\":\"浦西尚学堂\",\"nyye\":\"22\",\"phone\":\"1001111\",\"postCode\":\"100100\",\"state\":0,\"updateDate\":1488431897000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"1001000\",\"zczj\":\"100\"},{\"address\":\"1111fsdf\",\"area\":\"上海\",\"createDate\":1451639356000,\"cusManager\":\"小红\",\"dsdjh\":\"4535213212\",\"fax\":\"111\",\"fr\":\"老宋\",\"gsdjh\":\"中国\",\"id\":30,\"isValid\":1,\"khno\":\"KH201609011709179\",\"khyh\":\"中国银行\",\"khzh\":\"6225231243641\",\"level\":\"大客户\",\"myd\":\"☆\",\"name\":\"天猫11\",\"nyye\":\"1000000\",\"phone\":\"11111\",\"postCode\":\"200233\",\"state\":1,\"updateDate\":1499161947000,\"webSite\":\"111\",\"xyd\":\"☆☆☆\",\"yyzzzch\":\"11\",\"zczj\":\"1000\"},{\"address\":\"上海市徐汇区虹梅路153\",\"area\":\"北京\",\"createDate\":1472034590000,\"cusManager\":\"小明\",\"dsdjh\":\"4535213212\",\"fax\":\"134\",\"fr\":\"老王\",\"gsdjh\":\"中国\",\"id\":29,\"isValid\":1,\"khno\":\"KH201608241829510\",\"khyh\":\"中国银行\",\"khzh\":\"123456456\",\"level\":\"重点开发客户\",\"myd\":\"☆☆☆☆☆\",\"name\":\"上海聪享科技1\",\"nyye\":\"10000\",\"phone\":\"13666666666\",\"postCode\":\"200233\",\"state\":0,\"updateDate\":1472035571000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆\",\"yyzzzch\":\"13344\",\"zczj\":\"100\"},{\"address\":\"62\",\"area\":\"上海\",\"createDate\":1477368939000,\"cusManager\":\"小张\",\"dsdjh\":\"132\",\"fax\":\"42\",\"fr\":\"7777\",\"gsdjh\":\"142\",\"id\":28,\"isValid\":1,\"khno\":\"KH20150729090910\",\"khyh\":\"102\",\"khzh\":\"1111\",\"level\":\"战略合作伙伴\",\"myd\":\"☆☆☆☆☆\",\"name\":\"sssss\",\"nyye\":\"sss\",\"phone\":\"32\",\"postCode\":\"22\",\"state\":0,\"updateDate\":1488451603000,\"webSite\":\"52\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"112\",\"zczj\":\"122\"},{\"address\":\"321\",\"area\":\"北京\",\"createDate\":1453695319000,\"cusManager\":\"小红\",\"dsdjh\":\"321\",\"fax\":\"321\",\"fr\":\"321\",\"gsdjh\":\"3213\",\"id\":16,\"isValid\":1,\"khno\":\"KH20150526073022\",\"khyh\":\"321\",\"khzh\":\"321\",\"level\":\"大客户\",\"myd\":\"☆\",\"name\":\"风驰科技\",\"nyye\":\"21\",\"phone\":\"321\",\"postCode\":\"21\",\"state\":2,\"updateDate\":1502268330000,\"webSite\":\"321\",\"xyd\":\"☆\",\"yyzzzch\":\"321\",\"zczj\":\"\"},{\"address\":\"北京海淀区双榆树东里15号\",\"area\":\"北京\",\"createDate\":1456370923000,\"cusManager\":\"小张\",\"dsdjh\":\"4422214321321\",\"fax\":\"010-62263393\",\"fr\":\"张三\",\"gsdjh\":\"4104322332\",\"id\":1,\"isValid\":1,\"khno\":\"KH21321321\",\"khyh\":\"中国银行\",\"khzh\":\"6225231243641\",\"level\":\"战略合作伙伴\",\"myd\":\"☆☆☆\",\"name\":\"北京大牛科技\",\"nyye\":\"1111\",\"phone\":\"010-62263393\",\"postCode\":\"100027\",\"state\":1,\"updateDate\":1488438414000,\"webSite\":\"www.daniu.com\",\"xyd\":\"☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"1000\"}]}' );
INSERT INTO `t_log`
VALUES
	( '148', '客户信息管理', 'public java.lang.String com.shsxt.crm.controller.CustomerController.index()', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-08-18 16:41:04', '6', 'shsxt', '\"customer\"' );
INSERT INTO `t_log`
VALUES
	( '149', '客户信息管理-分页查询', 'public java.util.Map com.shsxt.crm.controller.CustomerController.selectForPage(com.shsxt.crm.dto.CustomerQuery)', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{\"page\":[\"1\"],\"rows\":[\"10\"]}', '2017-08-18 16:41:05', '45', 'shsxt', '{\"total\":8,\"rows\":[{\"address\":\"浦东张江高科1号\",\"area\":\"北京\",\"createDate\":1499065424000,\"cusManager\":\"admin1\",\"dsdjh\":\"3242342423\",\"fax\":\"021-89898989\",\"fr\":\"赵老师\",\"gsdjh\":\"234234234\",\"id\":36,\"isValid\":1,\"khno\":\"KH20170703150344713\",\"khyh\":\"中国银行\",\"khzh\":\"89890100001010103947\",\"level\":\"普通客户\",\"myd\":\"☆\",\"name\":\"上海尚学堂浦东校区1\",\"nyye\":\"1\",\"phone\":\"13644443333\",\"postCode\":\"100027\",\"state\":0,\"updateDate\":1499065424000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"10000000\"},{\"address\":\"浦东张江高科1号11\",\"area\":\"上海\",\"createDate\":1499064974000,\"cusManager\":\"小明\",\"dsdjh\":\"3242342423\",\"fax\":\"021-89898989\",\"fr\":\"廖老师\",\"gsdjh\":\"234234234\",\"id\":35,\"isValid\":1,\"khno\":\"KH20170703145613140\",\"khyh\":\"中国银行\",\"khzh\":\"89890100001010103947\",\"level\":\"重点开发客户\",\"myd\":\"☆\",\"name\":\"上海尚学堂浦东校区\",\"nyye\":\"1\",\"phone\":\"13644443333\",\"postCode\":\"100027\",\"state\":0,\"updateDate\":1499065515000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"10000000\"},{\"address\":\"浦东新区\",\"area\":\"上海\",\"createDate\":1482827301000,\"cusManager\":\"zs\",\"dsdjh\":\"1000\",\"fax\":\"sxt@sxt.cn\",\"fr\":\"老裴\",\"gsdjh\":\"10000\",\"id\":34,\"isValid\":1,\"khno\":\"KH201612271628316\",\"khyh\":\"工商\",\"khzh\":\"100100000\",\"level\":\"战略合作伙伴\",\"myd\":\"☆☆☆☆☆\",\"name\":\"浦西尚学堂\",\"nyye\":\"22\",\"phone\":\"1001111\",\"postCode\":\"100100\",\"state\":0,\"updateDate\":1488431897000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"1001000\",\"zczj\":\"100\"},{\"address\":\"1111fsdf\",\"area\":\"上海\",\"createDate\":1451639356000,\"cusManager\":\"小红\",\"dsdjh\":\"4535213212\",\"fax\":\"111\",\"fr\":\"老宋\",\"gsdjh\":\"中国\",\"id\":30,\"isValid\":1,\"khno\":\"KH201609011709179\",\"khyh\":\"中国银行\",\"khzh\":\"6225231243641\",\"level\":\"大客户\",\"myd\":\"☆\",\"name\":\"天猫11\",\"nyye\":\"1000000\",\"phone\":\"11111\",\"postCode\":\"200233\",\"state\":1,\"updateDate\":1499161947000,\"webSite\":\"111\",\"xyd\":\"☆☆☆\",\"yyzzzch\":\"11\",\"zczj\":\"1000\"},{\"address\":\"上海市徐汇区虹梅路153\",\"area\":\"北京\",\"createDate\":1472034590000,\"cusManager\":\"小明\",\"dsdjh\":\"4535213212\",\"fax\":\"134\",\"fr\":\"老王\",\"gsdjh\":\"中国\",\"id\":29,\"isValid\":1,\"khno\":\"KH201608241829510\",\"khyh\":\"中国银行\",\"khzh\":\"123456456\",\"level\":\"重点开发客户\",\"myd\":\"☆☆☆☆☆\",\"name\":\"上海聪享科技1\",\"nyye\":\"10000\",\"phone\":\"13666666666\",\"postCode\":\"200233\",\"state\":0,\"updateDate\":1472035571000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆\",\"yyzzzch\":\"13344\",\"zczj\":\"100\"},{\"address\":\"62\",\"area\":\"上海\",\"createDate\":1477368939000,\"cusManager\":\"小张\",\"dsdjh\":\"132\",\"fax\":\"42\",\"fr\":\"7777\",\"gsdjh\":\"142\",\"id\":28,\"isValid\":1,\"khno\":\"KH20150729090910\",\"khyh\":\"102\",\"khzh\":\"1111\",\"level\":\"战略合作伙伴\",\"myd\":\"☆☆☆☆☆\",\"name\":\"sssss\",\"nyye\":\"sss\",\"phone\":\"32\",\"postCode\":\"22\",\"state\":0,\"updateDate\":1488451603000,\"webSite\":\"52\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"112\",\"zczj\":\"122\"},{\"address\":\"321\",\"area\":\"北京\",\"createDate\":1453695319000,\"cusManager\":\"小红\",\"dsdjh\":\"321\",\"fax\":\"321\",\"fr\":\"321\",\"gsdjh\":\"3213\",\"id\":16,\"isValid\":1,\"khno\":\"KH20150526073022\",\"khyh\":\"321\",\"khzh\":\"321\",\"level\":\"大客户\",\"myd\":\"☆\",\"name\":\"风驰科技\",\"nyye\":\"21\",\"phone\":\"321\",\"postCode\":\"21\",\"state\":2,\"updateDate\":1502268330000,\"webSite\":\"321\",\"xyd\":\"☆\",\"yyzzzch\":\"321\",\"zczj\":\"\"},{\"address\":\"北京海淀区双榆树东里15号\",\"area\":\"北京\",\"createDate\":1456370923000,\"cusManager\":\"小张\",\"dsdjh\":\"4422214321321\",\"fax\":\"010-62263393\",\"fr\":\"张三\",\"gsdjh\":\"4104322332\",\"id\":1,\"isValid\":1,\"khno\":\"KH21321321\",\"khyh\":\"中国银行\",\"khzh\":\"6225231243641\",\"level\":\"战略合作伙伴\",\"myd\":\"☆☆☆\",\"name\":\"北京大牛科技\",\"nyye\":\"1111\",\"phone\":\"010-62263393\",\"postCode\":\"100027\",\"state\":1,\"updateDate\":1488438414000,\"webSite\":\"www.daniu.com\",\"xyd\":\"☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"1000\"}]}' );
INSERT INTO `t_log`
VALUES
	( '150', '客户信息管理', 'public java.lang.String com.shsxt.crm.controller.CustomerController.index()', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-08-18 16:52:59', '8', 'shsxt', '\"customer\"' );
INSERT INTO `t_log`
VALUES
	( '151', '客户信息管理-分页查询', 'public java.util.Map com.shsxt.crm.controller.CustomerController.selectForPage(com.shsxt.crm.dto.CustomerQuery)', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{\"page\":[\"1\"],\"rows\":[\"10\"]}', '2017-08-18 16:53:00', '48', 'shsxt', '{\"total\":8,\"rows\":[{\"address\":\"浦东张江高科1号\",\"area\":\"北京\",\"createDate\":1499065424000,\"cusManager\":\"admin1\",\"dsdjh\":\"3242342423\",\"fax\":\"021-89898989\",\"fr\":\"赵老师\",\"gsdjh\":\"234234234\",\"id\":36,\"isValid\":1,\"khno\":\"KH20170703150344713\",\"khyh\":\"中国银行\",\"khzh\":\"89890100001010103947\",\"level\":\"普通客户\",\"myd\":\"☆\",\"name\":\"上海尚学堂浦东校区1\",\"nyye\":\"1\",\"phone\":\"13644443333\",\"postCode\":\"100027\",\"state\":0,\"updateDate\":1499065424000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"10000000\"},{\"address\":\"浦东张江高科1号11\",\"area\":\"上海\",\"createDate\":1499064974000,\"cusManager\":\"小明\",\"dsdjh\":\"3242342423\",\"fax\":\"021-89898989\",\"fr\":\"廖老师\",\"gsdjh\":\"234234234\",\"id\":35,\"isValid\":1,\"khno\":\"KH20170703145613140\",\"khyh\":\"中国银行\",\"khzh\":\"89890100001010103947\",\"level\":\"重点开发客户\",\"myd\":\"☆\",\"name\":\"上海尚学堂浦东校区\",\"nyye\":\"1\",\"phone\":\"13644443333\",\"postCode\":\"100027\",\"state\":0,\"updateDate\":1499065515000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"10000000\"},{\"address\":\"浦东新区\",\"area\":\"上海\",\"createDate\":1482827301000,\"cusManager\":\"zs\",\"dsdjh\":\"1000\",\"fax\":\"sxt@sxt.cn\",\"fr\":\"老裴\",\"gsdjh\":\"10000\",\"id\":34,\"isValid\":1,\"khno\":\"KH201612271628316\",\"khyh\":\"工商\",\"khzh\":\"100100000\",\"level\":\"战略合作伙伴\",\"myd\":\"☆☆☆☆☆\",\"name\":\"浦西尚学堂\",\"nyye\":\"22\",\"phone\":\"1001111\",\"postCode\":\"100100\",\"state\":0,\"updateDate\":1488431897000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"1001000\",\"zczj\":\"100\"},{\"address\":\"1111fsdf\",\"area\":\"上海\",\"createDate\":1451639356000,\"cusManager\":\"小红\",\"dsdjh\":\"4535213212\",\"fax\":\"111\",\"fr\":\"老宋\",\"gsdjh\":\"中国\",\"id\":30,\"isValid\":1,\"khno\":\"KH201609011709179\",\"khyh\":\"中国银行\",\"khzh\":\"6225231243641\",\"level\":\"大客户\",\"myd\":\"☆\",\"name\":\"天猫11\",\"nyye\":\"1000000\",\"phone\":\"11111\",\"postCode\":\"200233\",\"state\":1,\"updateDate\":1499161947000,\"webSite\":\"111\",\"xyd\":\"☆☆☆\",\"yyzzzch\":\"11\",\"zczj\":\"1000\"},{\"address\":\"上海市徐汇区虹梅路153\",\"area\":\"北京\",\"createDate\":1472034590000,\"cusManager\":\"小明\",\"dsdjh\":\"4535213212\",\"fax\":\"134\",\"fr\":\"老王\",\"gsdjh\":\"中国\",\"id\":29,\"isValid\":1,\"khno\":\"KH201608241829510\",\"khyh\":\"中国银行\",\"khzh\":\"123456456\",\"level\":\"重点开发客户\",\"myd\":\"☆☆☆☆☆\",\"name\":\"上海聪享科技1\",\"nyye\":\"10000\",\"phone\":\"13666666666\",\"postCode\":\"200233\",\"state\":0,\"updateDate\":1472035571000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆\",\"yyzzzch\":\"13344\",\"zczj\":\"100\"},{\"address\":\"62\",\"area\":\"上海\",\"createDate\":1477368939000,\"cusManager\":\"小张\",\"dsdjh\":\"132\",\"fax\":\"42\",\"fr\":\"7777\",\"gsdjh\":\"142\",\"id\":28,\"isValid\":1,\"khno\":\"KH20150729090910\",\"khyh\":\"102\",\"khzh\":\"1111\",\"level\":\"战略合作伙伴\",\"myd\":\"☆☆☆☆☆\",\"name\":\"sssss\",\"nyye\":\"sss\",\"phone\":\"32\",\"postCode\":\"22\",\"state\":0,\"updateDate\":1488451603000,\"webSite\":\"52\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"112\",\"zczj\":\"122\"},{\"address\":\"321\",\"area\":\"北京\",\"createDate\":1453695319000,\"cusManager\":\"小红\",\"dsdjh\":\"321\",\"fax\":\"321\",\"fr\":\"321\",\"gsdjh\":\"3213\",\"id\":16,\"isValid\":1,\"khno\":\"KH20150526073022\",\"khyh\":\"321\",\"khzh\":\"321\",\"level\":\"大客户\",\"myd\":\"☆\",\"name\":\"风驰科技\",\"nyye\":\"21\",\"phone\":\"321\",\"postCode\":\"21\",\"state\":2,\"updateDate\":1502268330000,\"webSite\":\"321\",\"xyd\":\"☆\",\"yyzzzch\":\"321\",\"zczj\":\"\"},{\"address\":\"北京海淀区双榆树东里15号\",\"area\":\"北京\",\"createDate\":1456370923000,\"cusManager\":\"小张\",\"dsdjh\":\"4422214321321\",\"fax\":\"010-62263393\",\"fr\":\"张三\",\"gsdjh\":\"4104322332\",\"id\":1,\"isValid\":1,\"khno\":\"KH21321321\",\"khyh\":\"中国银行\",\"khzh\":\"6225231243641\",\"level\":\"战略合作伙伴\",\"myd\":\"☆☆☆\",\"name\":\"北京大牛科技\",\"nyye\":\"1111\",\"phone\":\"010-62263393\",\"postCode\":\"100027\",\"state\":1,\"updateDate\":1488438414000,\"webSite\":\"www.daniu.com\",\"xyd\":\"☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"1000\"}]}' );
INSERT INTO `t_log`
VALUES
	( '152', '客户信息管理-添加', 'public com.shsxt.crm.base.ResultInfo com.shsxt.crm.controller.CustomerController.add(com.shsxt.crm.model.Customer)', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{\"phone\":[\"13888888888\"],\"fax\":[\"021-89898989\"],\"xyd\":[\"☆☆☆☆☆\"],\"gsdjh\":[\"234234\"],\"postCode\":[\"200000\"],\"cusManager\":[\"小明\"],\"dsdjh\":[\"324234\"],\"myd\":[\"☆☆☆☆☆\"],\"id\":[\"\"],\"nyye\":[\"10000000000\"],\"level\":[\"不小的客户1\"],\"area\":[\"上海\"],\"webSite\":[\"www.shsxt.com\"],\"address\":[\"荣乐中路2369弄42号\"],\"name\":[\"尚学堂-李林学院\"],\"khyh\":[\"中国银行\"],\"khzh\":[\"12345677898990000\"],\"fr\":[\"李林\"],\"zczj\":[\"1000\"],\"yyzzzch\":[\"420103000057404\"]}', '2017-08-18 16:57:22', '3054', 'shsxt', '{\"result\":\"添加成功\",\"resultCode\":1,\"resultMessage\":\"操作成功。\"}' );
INSERT INTO `t_log`
VALUES
	( '153', '客户信息管理-分页查询', 'public java.util.Map com.shsxt.crm.controller.CustomerController.selectForPage(com.shsxt.crm.dto.CustomerQuery)', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{\"page\":[\"1\"],\"rows\":[\"10\"]}', '2017-08-18 16:57:25', '11', 'shsxt', '{\"total\":10,\"rows\":[{\"address\":\"荣乐中路2369弄42号\",\"area\":\"上海\",\"createDate\":1503046645000,\"cusManager\":\"小明\",\"dsdjh\":\"324234\",\"fax\":\"021-89898989\",\"fr\":\"李林\",\"gsdjh\":\"234234\",\"id\":38,\"isValid\":1,\"khno\":\"KH2017-08-18205\",\"khyh\":\"中国银行\",\"khzh\":\"12345677898990000\",\"level\":\"不小的客户1\",\"myd\":\"☆☆☆☆☆\",\"name\":\"尚学堂-李林学院\",\"nyye\":\"10000000000\",\"phone\":\"13888888888\",\"postCode\":\"200000\",\"state\":0,\"updateDate\":1503046645000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"1000\"},{\"address\":\"荣乐中路2369弄42号\",\"area\":\"上海\",\"createDate\":1503046535000,\"cusManager\":\"小明\",\"dsdjh\":\"324234\",\"fax\":\"021-89898989\",\"fr\":\"李林\",\"gsdjh\":\"234234\",\"id\":37,\"isValid\":1,\"khno\":\"KH2017-08-18175\",\"khyh\":\"中国银行\",\"khzh\":\"12345677898990000\",\"level\":\"不小的客户1\",\"myd\":\"☆☆☆☆☆\",\"name\":\"尚学堂\",\"nyye\":\"10000000000\",\"phone\":\"13888888888\",\"postCode\":\"200000\",\"state\":0,\"updateDate\":1503046535000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"1000\"},{\"address\":\"浦东张江高科1号\",\"area\":\"北京\",\"createDate\":1499065424000,\"cusManager\":\"admin1\",\"dsdjh\":\"3242342423\",\"fax\":\"021-89898989\",\"fr\":\"赵老师\",\"gsdjh\":\"234234234\",\"id\":36,\"isValid\":1,\"khno\":\"KH20170703150344713\",\"khyh\":\"中国银行\",\"khzh\":\"89890100001010103947\",\"level\":\"普通客户\",\"myd\":\"☆\",\"name\":\"上海尚学堂浦东校区1\",\"nyye\":\"1\",\"phone\":\"13644443333\",\"postCode\":\"100027\",\"state\":0,\"updateDate\":1499065424000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"10000000\"},{\"address\":\"浦东张江高科1号11\",\"area\":\"上海\",\"createDate\":1499064974000,\"cusManager\":\"小明\",\"dsdjh\":\"3242342423\",\"fax\":\"021-89898989\",\"fr\":\"廖老师\",\"gsdjh\":\"234234234\",\"id\":35,\"isValid\":1,\"khno\":\"KH20170703145613140\",\"khyh\":\"中国银行\",\"khzh\":\"89890100001010103947\",\"level\":\"重点开发客户\",\"myd\":\"☆\",\"name\":\"上海尚学堂浦东校区\",\"nyye\":\"1\",\"phone\":\"13644443333\",\"postCode\":\"100027\",\"state\":0,\"updateDate\":1499065515000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"10000000\"},{\"address\":\"浦东新区\",\"area\":\"上海\",\"createDate\":1482827301000,\"cusManager\":\"zs\",\"dsdjh\":\"1000\",\"fax\":\"sxt@sxt.cn\",\"fr\":\"老裴\",\"gsdjh\":\"10000\",\"id\":34,\"isValid\":1,\"khno\":\"KH201612271628316\",\"khyh\":\"工商\",\"khzh\":\"100100000\",\"level\":\"战略合作伙伴\",\"myd\":\"☆☆☆☆☆\",\"name\":\"浦西尚学堂\",\"nyye\":\"22\",\"phone\":\"1001111\",\"postCode\":\"100100\",\"state\":0,\"updateDate\":1488431897000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"1001000\",\"zczj\":\"100\"},{\"address\":\"1111fsdf\",\"area\":\"上海\",\"createDate\":1451639356000,\"cusManager\":\"小红\",\"dsdjh\":\"4535213212\",\"fax\":\"111\",\"fr\":\"老宋\",\"gsdjh\":\"中国\",\"id\":30,\"isValid\":1,\"khno\":\"KH201609011709179\",\"khyh\":\"中国银行\",\"khzh\":\"6225231243641\",\"level\":\"大客户\",\"myd\":\"☆\",\"name\":\"天猫11\",\"nyye\":\"1000000\",\"phone\":\"11111\",\"postCode\":\"200233\",\"state\":1,\"updateDate\":1499161947000,\"webSite\":\"111\",\"xyd\":\"☆☆☆\",\"yyzzzch\":\"11\",\"zczj\":\"1000\"},{\"address\":\"上海市徐汇区虹梅路153\",\"area\":\"北京\",\"createDate\":1472034590000,\"cusManager\":\"小明\",\"dsdjh\":\"4535213212\",\"fax\":\"134\",\"fr\":\"老王\",\"gsdjh\":\"中国\",\"id\":29,\"isValid\":1,\"khno\":\"KH201608241829510\",\"khyh\":\"中国银行\",\"khzh\":\"123456456\",\"level\":\"重点开发客户\",\"myd\":\"☆☆☆☆☆\",\"name\":\"上海聪享科技1\",\"nyye\":\"10000\",\"phone\":\"13666666666\",\"postCode\":\"200233\",\"state\":0,\"updateDate\":1472035571000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆\",\"yyzzzch\":\"13344\",\"zczj\":\"100\"},{\"address\":\"62\",\"area\":\"上海\",\"createDate\":1477368939000,\"cusManager\":\"小张\",\"dsdjh\":\"132\",\"fax\":\"42\",\"fr\":\"7777\",\"gsdjh\":\"142\",\"id\":28,\"isValid\":1,\"khno\":\"KH20150729090910\",\"khyh\":\"102\",\"khzh\":\"1111\",\"level\":\"战略合作伙伴\",\"myd\":\"☆☆☆☆☆\",\"name\":\"sssss\",\"nyye\":\"sss\",\"phone\":\"32\",\"postCode\":\"22\",\"state\":0,\"updateDate\":1488451603000,\"webSite\":\"52\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"112\",\"zczj\":\"122\"},{\"address\":\"321\",\"area\":\"北京\",\"createDate\":1453695319000,\"cusManager\":\"小红\",\"dsdjh\":\"321\",\"fax\":\"321\",\"fr\":\"321\",\"gsdjh\":\"3213\",\"id\":16,\"isValid\":1,\"khno\":\"KH20150526073022\",\"khyh\":\"321\",\"khzh\":\"321\",\"level\":\"大客户\",\"myd\":\"☆\",\"name\":\"风驰科技\",\"nyye\":\"21\",\"phone\":\"321\",\"postCode\":\"21\",\"state\":2,\"updateDate\":1502268330000,\"webSite\":\"321\",\"xyd\":\"☆\",\"yyzzzch\":\"321\",\"zczj\":\"\"},{\"address\":\"北京海淀区双榆树东里15号\",\"area\":\"北京\",\"createDate\":1456370923000,\"cusManager\":\"小张\",\"dsdjh\":\"4422214321321\",\"fax\":\"010-62263393\",\"fr\":\"张三\",\"gsdjh\":\"4104322332\",\"id\":1,\"isValid\":1,\"khno\":\"KH21321321\",\"khyh\":\"中国银行\",\"khzh\":\"6225231243641\",\"level\":\"战略合作伙伴\",\"myd\":\"☆☆☆\",\"name\":\"北京大牛科技\",\"nyye\":\"1111\",\"phone\":\"010-62263393\",\"postCode\":\"100027\",\"state\":1,\"updateDate\":1488438414000,\"webSite\":\"www.daniu.com\",\"xyd\":\"☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"1000\"}]}' );
INSERT INTO `t_log`
VALUES
	( '154', '客户信息管理', 'public java.lang.String com.shsxt.crm.controller.CustomerController.index()', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-08-18 16:59:04', '7', 'shsxt', '\"customer\"' );
INSERT INTO `t_log`
VALUES
	( '155', '客户信息管理-分页查询', 'public java.util.Map com.shsxt.crm.controller.CustomerController.selectForPage(com.shsxt.crm.dto.CustomerQuery)', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{\"page\":[\"1\"],\"rows\":[\"10\"]}', '2017-08-18 16:59:04', '50', 'shsxt', '{\"total\":10,\"rows\":[{\"address\":\"荣乐中路2369弄42号\",\"area\":\"上海\",\"createDate\":1503046645000,\"cusManager\":\"小明\",\"dsdjh\":\"324234\",\"fax\":\"021-89898989\",\"fr\":\"李林\",\"gsdjh\":\"234234\",\"id\":38,\"isValid\":1,\"khno\":\"KH2017-08-18205\",\"khyh\":\"中国银行\",\"khzh\":\"12345677898990000\",\"level\":\"不小的客户1\",\"myd\":\"☆☆☆☆☆\",\"name\":\"尚学堂-李林学院\",\"nyye\":\"10000000000\",\"phone\":\"13888888888\",\"postCode\":\"200000\",\"state\":0,\"updateDate\":1503046645000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"1000\"},{\"address\":\"荣乐中路2369弄42号\",\"area\":\"上海\",\"createDate\":1503046535000,\"cusManager\":\"小明\",\"dsdjh\":\"324234\",\"fax\":\"021-89898989\",\"fr\":\"李林\",\"gsdjh\":\"234234\",\"id\":37,\"isValid\":1,\"khno\":\"KH2017-08-18175\",\"khyh\":\"中国银行\",\"khzh\":\"12345677898990000\",\"level\":\"不小的客户1\",\"myd\":\"☆☆☆☆☆\",\"name\":\"尚学堂\",\"nyye\":\"10000000000\",\"phone\":\"13888888888\",\"postCode\":\"200000\",\"state\":0,\"updateDate\":1503046535000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"1000\"},{\"address\":\"浦东张江高科1号\",\"area\":\"北京\",\"createDate\":1499065424000,\"cusManager\":\"admin1\",\"dsdjh\":\"3242342423\",\"fax\":\"021-89898989\",\"fr\":\"赵老师\",\"gsdjh\":\"234234234\",\"id\":36,\"isValid\":1,\"khno\":\"KH20170703150344713\",\"khyh\":\"中国银行\",\"khzh\":\"89890100001010103947\",\"level\":\"普通客户\",\"myd\":\"☆\",\"name\":\"上海尚学堂浦东校区1\",\"nyye\":\"1\",\"phone\":\"13644443333\",\"postCode\":\"100027\",\"state\":0,\"updateDate\":1499065424000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"10000000\"},{\"address\":\"浦东张江高科1号11\",\"area\":\"上海\",\"createDate\":1499064974000,\"cusManager\":\"小明\",\"dsdjh\":\"3242342423\",\"fax\":\"021-89898989\",\"fr\":\"廖老师\",\"gsdjh\":\"234234234\",\"id\":35,\"isValid\":1,\"khno\":\"KH20170703145613140\",\"khyh\":\"中国银行\",\"khzh\":\"89890100001010103947\",\"level\":\"重点开发客户\",\"myd\":\"☆\",\"name\":\"上海尚学堂浦东校区\",\"nyye\":\"1\",\"phone\":\"13644443333\",\"postCode\":\"100027\",\"state\":0,\"updateDate\":1499065515000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"10000000\"},{\"address\":\"浦东新区\",\"area\":\"上海\",\"createDate\":1482827301000,\"cusManager\":\"zs\",\"dsdjh\":\"1000\",\"fax\":\"sxt@sxt.cn\",\"fr\":\"老裴\",\"gsdjh\":\"10000\",\"id\":34,\"isValid\":1,\"khno\":\"KH201612271628316\",\"khyh\":\"工商\",\"khzh\":\"100100000\",\"level\":\"战略合作伙伴\",\"myd\":\"☆☆☆☆☆\",\"name\":\"浦西尚学堂\",\"nyye\":\"22\",\"phone\":\"1001111\",\"postCode\":\"100100\",\"state\":0,\"updateDate\":1488431897000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"1001000\",\"zczj\":\"100\"},{\"address\":\"1111fsdf\",\"area\":\"上海\",\"createDate\":1451639356000,\"cusManager\":\"小红\",\"dsdjh\":\"4535213212\",\"fax\":\"111\",\"fr\":\"老宋\",\"gsdjh\":\"中国\",\"id\":30,\"isValid\":1,\"khno\":\"KH201609011709179\",\"khyh\":\"中国银行\",\"khzh\":\"6225231243641\",\"level\":\"大客户\",\"myd\":\"☆\",\"name\":\"天猫11\",\"nyye\":\"1000000\",\"phone\":\"11111\",\"postCode\":\"200233\",\"state\":1,\"updateDate\":1499161947000,\"webSite\":\"111\",\"xyd\":\"☆☆☆\",\"yyzzzch\":\"11\",\"zczj\":\"1000\"},{\"address\":\"上海市徐汇区虹梅路153\",\"area\":\"北京\",\"createDate\":1472034590000,\"cusManager\":\"小明\",\"dsdjh\":\"4535213212\",\"fax\":\"134\",\"fr\":\"老王\",\"gsdjh\":\"中国\",\"id\":29,\"isValid\":1,\"khno\":\"KH201608241829510\",\"khyh\":\"中国银行\",\"khzh\":\"123456456\",\"level\":\"重点开发客户\",\"myd\":\"☆☆☆☆☆\",\"name\":\"上海聪享科技1\",\"nyye\":\"10000\",\"phone\":\"13666666666\",\"postCode\":\"200233\",\"state\":0,\"updateDate\":1472035571000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆\",\"yyzzzch\":\"13344\",\"zczj\":\"100\"},{\"address\":\"62\",\"area\":\"上海\",\"createDate\":1477368939000,\"cusManager\":\"小张\",\"dsdjh\":\"132\",\"fax\":\"42\",\"fr\":\"7777\",\"gsdjh\":\"142\",\"id\":28,\"isValid\":1,\"khno\":\"KH20150729090910\",\"khyh\":\"102\",\"khzh\":\"1111\",\"level\":\"战略合作伙伴\",\"myd\":\"☆☆☆☆☆\",\"name\":\"sssss\",\"nyye\":\"sss\",\"phone\":\"32\",\"postCode\":\"22\",\"state\":0,\"updateDate\":1488451603000,\"webSite\":\"52\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"112\",\"zczj\":\"122\"},{\"address\":\"321\",\"area\":\"北京\",\"createDate\":1453695319000,\"cusManager\":\"小红\",\"dsdjh\":\"321\",\"fax\":\"321\",\"fr\":\"321\",\"gsdjh\":\"3213\",\"id\":16,\"isValid\":1,\"khno\":\"KH20150526073022\",\"khyh\":\"321\",\"khzh\":\"321\",\"level\":\"大客户\",\"myd\":\"☆\",\"name\":\"风驰科技\",\"nyye\":\"21\",\"phone\":\"321\",\"postCode\":\"21\",\"state\":2,\"updateDate\":1502268330000,\"webSite\":\"321\",\"xyd\":\"☆\",\"yyzzzch\":\"321\",\"zczj\":\"\"},{\"address\":\"北京海淀区双榆树东里15号\",\"area\":\"北京\",\"createDate\":1456370923000,\"cusManager\":\"小张\",\"dsdjh\":\"4422214321321\",\"fax\":\"010-62263393\",\"fr\":\"张三\",\"gsdjh\":\"4104322332\",\"id\":1,\"isValid\":1,\"khno\":\"KH21321321\",\"khyh\":\"中国银行\",\"khzh\":\"6225231243641\",\"level\":\"战略合作伙伴\",\"myd\":\"☆☆☆\",\"name\":\"北京大牛科技\",\"nyye\":\"1111\",\"phone\":\"010-62263393\",\"postCode\":\"100027\",\"state\":1,\"updateDate\":1488438414000,\"webSite\":\"www.daniu.com\",\"xyd\":\"☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"1000\"}]}' );
INSERT INTO `t_log`
VALUES
	( '156', '客户信息管理-添加', 'public com.shsxt.crm.base.ResultInfo com.shsxt.crm.controller.CustomerController.add(com.shsxt.crm.model.Customer)', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{\"phone\":[\"13644443333\"],\"fax\":[\"021-89898989\"],\"xyd\":[\"☆☆☆☆☆\"],\"gsdjh\":[\"22\"],\"postCode\":[\"200000\"],\"cusManager\":[\"小明\"],\"dsdjh\":[\"22\"],\"myd\":[\"☆☆☆☆☆\"],\"id\":[\"\"],\"nyye\":[\"100000000000\"],\"level\":[\"不小的客户1\"],\"area\":[\"上海\"],\"webSite\":[\"www.shsxt.com\"],\"address\":[\"浦东张江高科1号\"],\"name\":[\"尚学堂-郑昊\"],\"khyh\":[\"中国银行\"],\"khzh\":[\"257687888\"],\"fr\":[\"郑昊\"],\"zczj\":[\"12000\"],\"yyzzzch\":[\"420103000057404\"]}', '2017-08-18 17:00:05', '51', 'shsxt', '{\"result\":\"添加成功\",\"resultCode\":1,\"resultMessage\":\"操作成功。\"}' );
INSERT INTO `t_log`
VALUES
	( '157', '客户信息管理-分页查询', 'public java.util.Map com.shsxt.crm.controller.CustomerController.selectForPage(com.shsxt.crm.dto.CustomerQuery)', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{\"page\":[\"1\"],\"rows\":[\"10\"]}', '2017-08-18 17:00:05', '14', 'shsxt', '{\"total\":11,\"rows\":[{\"address\":\"浦东张江高科1号\",\"area\":\"上海\",\"createDate\":1503046805000,\"cusManager\":\"小明\",\"dsdjh\":\"22\",\"fax\":\"021-89898989\",\"fr\":\"郑昊\",\"gsdjh\":\"22\",\"id\":39,\"isValid\":1,\"khno\":\"KH20170818170004820\",\"khyh\":\"中国银行\",\"khzh\":\"257687888\",\"level\":\"不小的客户1\",\"myd\":\"☆☆☆☆☆\",\"name\":\"尚学堂-郑昊\",\"nyye\":\"100000000000\",\"phone\":\"13644443333\",\"postCode\":\"200000\",\"state\":0,\"updateDate\":1503046805000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"12000\"},{\"address\":\"荣乐中路2369弄42号\",\"area\":\"上海\",\"createDate\":1503046645000,\"cusManager\":\"小明\",\"dsdjh\":\"324234\",\"fax\":\"021-89898989\",\"fr\":\"李林\",\"gsdjh\":\"234234\",\"id\":38,\"isValid\":1,\"khno\":\"KH2017-08-18205\",\"khyh\":\"中国银行\",\"khzh\":\"12345677898990000\",\"level\":\"不小的客户1\",\"myd\":\"☆☆☆☆☆\",\"name\":\"尚学堂-李林学院\",\"nyye\":\"10000000000\",\"phone\":\"13888888888\",\"postCode\":\"200000\",\"state\":0,\"updateDate\":1503046645000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"1000\"},{\"address\":\"荣乐中路2369弄42号\",\"area\":\"上海\",\"createDate\":1503046535000,\"cusManager\":\"小明\",\"dsdjh\":\"324234\",\"fax\":\"021-89898989\",\"fr\":\"李林\",\"gsdjh\":\"234234\",\"id\":37,\"isValid\":1,\"khno\":\"KH2017-08-18175\",\"khyh\":\"中国银行\",\"khzh\":\"12345677898990000\",\"level\":\"不小的客户1\",\"myd\":\"☆☆☆☆☆\",\"name\":\"尚学堂\",\"nyye\":\"10000000000\",\"phone\":\"13888888888\",\"postCode\":\"200000\",\"state\":0,\"updateDate\":1503046535000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"1000\"},{\"address\":\"浦东张江高科1号\",\"area\":\"北京\",\"createDate\":1499065424000,\"cusManager\":\"admin1\",\"dsdjh\":\"3242342423\",\"fax\":\"021-89898989\",\"fr\":\"赵老师\",\"gsdjh\":\"234234234\",\"id\":36,\"isValid\":1,\"khno\":\"KH20170703150344713\",\"khyh\":\"中国银行\",\"khzh\":\"89890100001010103947\",\"level\":\"普通客户\",\"myd\":\"☆\",\"name\":\"上海尚学堂浦东校区1\",\"nyye\":\"1\",\"phone\":\"13644443333\",\"postCode\":\"100027\",\"state\":0,\"updateDate\":1499065424000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"10000000\"},{\"address\":\"浦东张江高科1号11\",\"area\":\"上海\",\"createDate\":1499064974000,\"cusManager\":\"小明\",\"dsdjh\":\"3242342423\",\"fax\":\"021-89898989\",\"fr\":\"廖老师\",\"gsdjh\":\"234234234\",\"id\":35,\"isValid\":1,\"khno\":\"KH20170703145613140\",\"khyh\":\"中国银行\",\"khzh\":\"89890100001010103947\",\"level\":\"重点开发客户\",\"myd\":\"☆\",\"name\":\"上海尚学堂浦东校区\",\"nyye\":\"1\",\"phone\":\"13644443333\",\"postCode\":\"100027\",\"state\":0,\"updateDate\":1499065515000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"10000000\"},{\"address\":\"浦东新区\",\"area\":\"上海\",\"createDate\":1482827301000,\"cusManager\":\"zs\",\"dsdjh\":\"1000\",\"fax\":\"sxt@sxt.cn\",\"fr\":\"老裴\",\"gsdjh\":\"10000\",\"id\":34,\"isValid\":1,\"khno\":\"KH201612271628316\",\"khyh\":\"工商\",\"khzh\":\"100100000\",\"level\":\"战略合作伙伴\",\"myd\":\"☆☆☆☆☆\",\"name\":\"浦西尚学堂\",\"nyye\":\"22\",\"phone\":\"1001111\",\"postCode\":\"100100\",\"state\":0,\"updateDate\":1488431897000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"1001000\",\"zczj\":\"100\"},{\"address\":\"1111fsdf\",\"area\":\"上海\",\"createDate\":1451639356000,\"cusManager\":\"小红\",\"dsdjh\":\"4535213212\",\"fax\":\"111\",\"fr\":\"老宋\",\"gsdjh\":\"中国\",\"id\":30,\"isValid\":1,\"khno\":\"KH201609011709179\",\"khyh\":\"中国银行\",\"khzh\":\"6225231243641\",\"level\":\"大客户\",\"myd\":\"☆\",\"name\":\"天猫11\",\"nyye\":\"1000000\",\"phone\":\"11111\",\"postCode\":\"200233\",\"state\":1,\"updateDate\":1499161947000,\"webSite\":\"111\",\"xyd\":\"☆☆☆\",\"yyzzzch\":\"11\",\"zczj\":\"1000\"},{\"address\":\"上海市徐汇区虹梅路153\",\"area\":\"北京\",\"createDate\":1472034590000,\"cusManager\":\"小明\",\"dsdjh\":\"4535213212\",\"fax\":\"134\",\"fr\":\"老王\",\"gsdjh\":\"中国\",\"id\":29,\"isValid\":1,\"khno\":\"KH201608241829510\",\"khyh\":\"中国银行\",\"khzh\":\"123456456\",\"level\":\"重点开发客户\",\"myd\":\"☆☆☆☆☆\",\"name\":\"上海聪享科技1\",\"nyye\":\"10000\",\"phone\":\"13666666666\",\"postCode\":\"200233\",\"state\":0,\"updateDate\":1472035571000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆\",\"yyzzzch\":\"13344\",\"zczj\":\"100\"},{\"address\":\"62\",\"area\":\"上海\",\"createDate\":1477368939000,\"cusManager\":\"小张\",\"dsdjh\":\"132\",\"fax\":\"42\",\"fr\":\"7777\",\"gsdjh\":\"142\",\"id\":28,\"isValid\":1,\"khno\":\"KH20150729090910\",\"khyh\":\"102\",\"khzh\":\"1111\",\"level\":\"战略合作伙伴\",\"myd\":\"☆☆☆☆☆\",\"name\":\"sssss\",\"nyye\":\"sss\",\"phone\":\"32\",\"postCode\":\"22\",\"state\":0,\"updateDate\":1488451603000,\"webSite\":\"52\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"112\",\"zczj\":\"122\"},{\"address\":\"321\",\"area\":\"北京\",\"createDate\":1453695319000,\"cusManager\":\"小红\",\"dsdjh\":\"321\",\"fax\":\"321\",\"fr\":\"321\",\"gsdjh\":\"3213\",\"id\":16,\"isValid\":1,\"khno\":\"KH20150526073022\",\"khyh\":\"321\",\"khzh\":\"321\",\"level\":\"大客户\",\"myd\":\"☆\",\"name\":\"风驰科技\",\"nyye\":\"21\",\"phone\":\"321\",\"postCode\":\"21\",\"state\":2,\"updateDate\":1502268330000,\"webSite\":\"321\",\"xyd\":\"☆\",\"yyzzzch\":\"321\",\"zczj\":\"\"}]}' );
INSERT INTO `t_log`
VALUES
	( '158', '客户信息管理-修改', 'public com.shsxt.crm.base.ResultInfo com.shsxt.crm.controller.CustomerController.update(com.shsxt.crm.model.Customer)', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{\"phone\":[\"13644443333\"],\"fax\":[\"021-89898989\"],\"xyd\":[\"☆\"],\"gsdjh\":[\"22\"],\"postCode\":[\"200000\"],\"cusManager\":[\"admin1\"],\"dsdjh\":[\"22\"],\"myd\":[\"☆\"],\"id\":[\"39\"],\"nyye\":[\"1\"],\"level\":[\"不小的客户1\"],\"area\":[\"上海\"],\"webSite\":[\"www.shsxt.com\"],\"address\":[\"浦东张江高科1号\"],\"name\":[\"尚学堂-郑昊\"],\"khyh\":[\"农业银行\"],\"khzh\":[\"257687888\"],\"fr\":[\"郑昊\"],\"zczj\":[\"12000\"],\"yyzzzch\":[\"420103000057404\"]}', '2017-08-18 17:00:55', '5', 'shsxt', '{\"result\":\"修改成功\",\"resultCode\":1,\"resultMessage\":\"操作成功。\"}' );
INSERT INTO `t_log`
VALUES
	( '159', '客户信息管理-分页查询', 'public java.util.Map com.shsxt.crm.controller.CustomerController.selectForPage(com.shsxt.crm.dto.CustomerQuery)', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{\"page\":[\"1\"],\"rows\":[\"10\"]}', '2017-08-18 17:00:55', '7', 'shsxt', '{\"total\":11,\"rows\":[{\"address\":\"浦东张江高科1号\",\"area\":\"上海\",\"createDate\":1503046805000,\"cusManager\":\"admin1\",\"dsdjh\":\"22\",\"fax\":\"021-89898989\",\"fr\":\"郑昊\",\"gsdjh\":\"22\",\"id\":39,\"isValid\":1,\"khno\":\"KH20170818170004820\",\"khyh\":\"农业银行\",\"khzh\":\"257687888\",\"level\":\"不小的客户1\",\"myd\":\"☆\",\"name\":\"尚学堂-郑昊\",\"nyye\":\"1\",\"phone\":\"13644443333\",\"postCode\":\"200000\",\"state\":0,\"updateDate\":1503046855000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"12000\"},{\"address\":\"荣乐中路2369弄42号\",\"area\":\"上海\",\"createDate\":1503046645000,\"cusManager\":\"小明\",\"dsdjh\":\"324234\",\"fax\":\"021-89898989\",\"fr\":\"李林\",\"gsdjh\":\"234234\",\"id\":38,\"isValid\":1,\"khno\":\"KH2017-08-18205\",\"khyh\":\"中国银行\",\"khzh\":\"12345677898990000\",\"level\":\"不小的客户1\",\"myd\":\"☆☆☆☆☆\",\"name\":\"尚学堂-李林学院\",\"nyye\":\"10000000000\",\"phone\":\"13888888888\",\"postCode\":\"200000\",\"state\":0,\"updateDate\":1503046645000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"1000\"},{\"address\":\"荣乐中路2369弄42号\",\"area\":\"上海\",\"createDate\":1503046535000,\"cusManager\":\"小明\",\"dsdjh\":\"324234\",\"fax\":\"021-89898989\",\"fr\":\"李林\",\"gsdjh\":\"234234\",\"id\":37,\"isValid\":1,\"khno\":\"KH2017-08-18175\",\"khyh\":\"中国银行\",\"khzh\":\"12345677898990000\",\"level\":\"不小的客户1\",\"myd\":\"☆☆☆☆☆\",\"name\":\"尚学堂\",\"nyye\":\"10000000000\",\"phone\":\"13888888888\",\"postCode\":\"200000\",\"state\":0,\"updateDate\":1503046535000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"1000\"},{\"address\":\"浦东张江高科1号\",\"area\":\"北京\",\"createDate\":1499065424000,\"cusManager\":\"admin1\",\"dsdjh\":\"3242342423\",\"fax\":\"021-89898989\",\"fr\":\"赵老师\",\"gsdjh\":\"234234234\",\"id\":36,\"isValid\":1,\"khno\":\"KH20170703150344713\",\"khyh\":\"中国银行\",\"khzh\":\"89890100001010103947\",\"level\":\"普通客户\",\"myd\":\"☆\",\"name\":\"上海尚学堂浦东校区1\",\"nyye\":\"1\",\"phone\":\"13644443333\",\"postCode\":\"100027\",\"state\":0,\"updateDate\":1499065424000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"10000000\"},{\"address\":\"浦东张江高科1号11\",\"area\":\"上海\",\"createDate\":1499064974000,\"cusManager\":\"小明\",\"dsdjh\":\"3242342423\",\"fax\":\"021-89898989\",\"fr\":\"廖老师\",\"gsdjh\":\"234234234\",\"id\":35,\"isValid\":1,\"khno\":\"KH20170703145613140\",\"khyh\":\"中国银行\",\"khzh\":\"89890100001010103947\",\"level\":\"重点开发客户\",\"myd\":\"☆\",\"name\":\"上海尚学堂浦东校区\",\"nyye\":\"1\",\"phone\":\"13644443333\",\"postCode\":\"100027\",\"state\":0,\"updateDate\":1499065515000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"10000000\"},{\"address\":\"浦东新区\",\"area\":\"上海\",\"createDate\":1482827301000,\"cusManager\":\"zs\",\"dsdjh\":\"1000\",\"fax\":\"sxt@sxt.cn\",\"fr\":\"老裴\",\"gsdjh\":\"10000\",\"id\":34,\"isValid\":1,\"khno\":\"KH201612271628316\",\"khyh\":\"工商\",\"khzh\":\"100100000\",\"level\":\"战略合作伙伴\",\"myd\":\"☆☆☆☆☆\",\"name\":\"浦西尚学堂\",\"nyye\":\"22\",\"phone\":\"1001111\",\"postCode\":\"100100\",\"state\":0,\"updateDate\":1488431897000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"1001000\",\"zczj\":\"100\"},{\"address\":\"1111fsdf\",\"area\":\"上海\",\"createDate\":1451639356000,\"cusManager\":\"小红\",\"dsdjh\":\"4535213212\",\"fax\":\"111\",\"fr\":\"老宋\",\"gsdjh\":\"中国\",\"id\":30,\"isValid\":1,\"khno\":\"KH201609011709179\",\"khyh\":\"中国银行\",\"khzh\":\"6225231243641\",\"level\":\"大客户\",\"myd\":\"☆\",\"name\":\"天猫11\",\"nyye\":\"1000000\",\"phone\":\"11111\",\"postCode\":\"200233\",\"state\":1,\"updateDate\":1499161947000,\"webSite\":\"111\",\"xyd\":\"☆☆☆\",\"yyzzzch\":\"11\",\"zczj\":\"1000\"},{\"address\":\"上海市徐汇区虹梅路153\",\"area\":\"北京\",\"createDate\":1472034590000,\"cusManager\":\"小明\",\"dsdjh\":\"4535213212\",\"fax\":\"134\",\"fr\":\"老王\",\"gsdjh\":\"中国\",\"id\":29,\"isValid\":1,\"khno\":\"KH201608241829510\",\"khyh\":\"中国银行\",\"khzh\":\"123456456\",\"level\":\"重点开发客户\",\"myd\":\"☆☆☆☆☆\",\"name\":\"上海聪享科技1\",\"nyye\":\"10000\",\"phone\":\"13666666666\",\"postCode\":\"200233\",\"state\":0,\"updateDate\":1472035571000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆\",\"yyzzzch\":\"13344\",\"zczj\":\"100\"},{\"address\":\"62\",\"area\":\"上海\",\"createDate\":1477368939000,\"cusManager\":\"小张\",\"dsdjh\":\"132\",\"fax\":\"42\",\"fr\":\"7777\",\"gsdjh\":\"142\",\"id\":28,\"isValid\":1,\"khno\":\"KH20150729090910\",\"khyh\":\"102\",\"khzh\":\"1111\",\"level\":\"战略合作伙伴\",\"myd\":\"☆☆☆☆☆\",\"name\":\"sssss\",\"nyye\":\"sss\",\"phone\":\"32\",\"postCode\":\"22\",\"state\":0,\"updateDate\":1488451603000,\"webSite\":\"52\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"112\",\"zczj\":\"122\"},{\"address\":\"321\",\"area\":\"北京\",\"createDate\":1453695319000,\"cusManager\":\"小红\",\"dsdjh\":\"321\",\"fax\":\"321\",\"fr\":\"321\",\"gsdjh\":\"3213\",\"id\":16,\"isValid\":1,\"khno\":\"KH20150526073022\",\"khyh\":\"321\",\"khzh\":\"321\",\"level\":\"大客户\",\"myd\":\"☆\",\"name\":\"风驰科技\",\"nyye\":\"21\",\"phone\":\"321\",\"postCode\":\"21\",\"state\":2,\"updateDate\":1502268330000,\"webSite\":\"321\",\"xyd\":\"☆\",\"yyzzzch\":\"321\",\"zczj\":\"\"}]}' );
INSERT INTO `t_log`
VALUES
	( '160', '客户信息管理', 'public java.lang.String com.shsxt.crm.controller.CustomerController.index()', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-08-18 17:03:35', '0', 'shsxt', '\"customer\"' );
INSERT INTO `t_log`
VALUES
	( '161', '客户信息管理-分页查询', 'public java.util.Map com.shsxt.crm.controller.CustomerController.selectForPage(com.shsxt.crm.dto.CustomerQuery)', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{\"page\":[\"1\"],\"rows\":[\"10\"]}', '2017-08-18 17:03:35', '3', 'shsxt', '{\"total\":11,\"rows\":[{\"address\":\"浦东张江高科1号\",\"area\":\"上海\",\"createDate\":1503046805000,\"cusManager\":\"admin1\",\"dsdjh\":\"22\",\"fax\":\"021-89898989\",\"fr\":\"郑昊\",\"gsdjh\":\"22\",\"id\":39,\"isValid\":1,\"khno\":\"KH20170818170004820\",\"khyh\":\"农业银行\",\"khzh\":\"257687888\",\"level\":\"不小的客户1\",\"myd\":\"☆\",\"name\":\"尚学堂-郑昊\",\"nyye\":\"1\",\"phone\":\"13644443333\",\"postCode\":\"200000\",\"state\":0,\"updateDate\":1503046855000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"12000\"},{\"address\":\"荣乐中路2369弄42号\",\"area\":\"上海\",\"createDate\":1503046645000,\"cusManager\":\"小明\",\"dsdjh\":\"324234\",\"fax\":\"021-89898989\",\"fr\":\"李林\",\"gsdjh\":\"234234\",\"id\":38,\"isValid\":1,\"khno\":\"KH2017-08-18205\",\"khyh\":\"中国银行\",\"khzh\":\"12345677898990000\",\"level\":\"不小的客户1\",\"myd\":\"☆☆☆☆☆\",\"name\":\"尚学堂-李林学院\",\"nyye\":\"10000000000\",\"phone\":\"13888888888\",\"postCode\":\"200000\",\"state\":0,\"updateDate\":1503046645000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"1000\"},{\"address\":\"荣乐中路2369弄42号\",\"area\":\"上海\",\"createDate\":1503046535000,\"cusManager\":\"小明\",\"dsdjh\":\"324234\",\"fax\":\"021-89898989\",\"fr\":\"李林\",\"gsdjh\":\"234234\",\"id\":37,\"isValid\":1,\"khno\":\"KH2017-08-18175\",\"khyh\":\"中国银行\",\"khzh\":\"12345677898990000\",\"level\":\"不小的客户1\",\"myd\":\"☆☆☆☆☆\",\"name\":\"尚学堂\",\"nyye\":\"10000000000\",\"phone\":\"13888888888\",\"postCode\":\"200000\",\"state\":0,\"updateDate\":1503046535000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"1000\"},{\"address\":\"浦东张江高科1号\",\"area\":\"北京\",\"createDate\":1499065424000,\"cusManager\":\"admin1\",\"dsdjh\":\"3242342423\",\"fax\":\"021-89898989\",\"fr\":\"赵老师\",\"gsdjh\":\"234234234\",\"id\":36,\"isValid\":1,\"khno\":\"KH20170703150344713\",\"khyh\":\"中国银行\",\"khzh\":\"89890100001010103947\",\"level\":\"普通客户\",\"myd\":\"☆\",\"name\":\"上海尚学堂浦东校区1\",\"nyye\":\"1\",\"phone\":\"13644443333\",\"postCode\":\"100027\",\"state\":0,\"updateDate\":1499065424000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"10000000\"},{\"address\":\"浦东张江高科1号11\",\"area\":\"上海\",\"createDate\":1499064974000,\"cusManager\":\"小明\",\"dsdjh\":\"3242342423\",\"fax\":\"021-89898989\",\"fr\":\"廖老师\",\"gsdjh\":\"234234234\",\"id\":35,\"isValid\":1,\"khno\":\"KH20170703145613140\",\"khyh\":\"中国银行\",\"khzh\":\"89890100001010103947\",\"level\":\"重点开发客户\",\"myd\":\"☆\",\"name\":\"上海尚学堂浦东校区\",\"nyye\":\"1\",\"phone\":\"13644443333\",\"postCode\":\"100027\",\"state\":0,\"updateDate\":1499065515000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"10000000\"},{\"address\":\"浦东新区\",\"area\":\"上海\",\"createDate\":1482827301000,\"cusManager\":\"zs\",\"dsdjh\":\"1000\",\"fax\":\"sxt@sxt.cn\",\"fr\":\"老裴\",\"gsdjh\":\"10000\",\"id\":34,\"isValid\":1,\"khno\":\"KH201612271628316\",\"khyh\":\"工商\",\"khzh\":\"100100000\",\"level\":\"战略合作伙伴\",\"myd\":\"☆☆☆☆☆\",\"name\":\"浦西尚学堂\",\"nyye\":\"22\",\"phone\":\"1001111\",\"postCode\":\"100100\",\"state\":0,\"updateDate\":1488431897000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"1001000\",\"zczj\":\"100\"},{\"address\":\"1111fsdf\",\"area\":\"上海\",\"createDate\":1451639356000,\"cusManager\":\"小红\",\"dsdjh\":\"4535213212\",\"fax\":\"111\",\"fr\":\"老宋\",\"gsdjh\":\"中国\",\"id\":30,\"isValid\":1,\"khno\":\"KH201609011709179\",\"khyh\":\"中国银行\",\"khzh\":\"6225231243641\",\"level\":\"大客户\",\"myd\":\"☆\",\"name\":\"天猫11\",\"nyye\":\"1000000\",\"phone\":\"11111\",\"postCode\":\"200233\",\"state\":1,\"updateDate\":1499161947000,\"webSite\":\"111\",\"xyd\":\"☆☆☆\",\"yyzzzch\":\"11\",\"zczj\":\"1000\"},{\"address\":\"上海市徐汇区虹梅路153\",\"area\":\"北京\",\"createDate\":1472034590000,\"cusManager\":\"小明\",\"dsdjh\":\"4535213212\",\"fax\":\"134\",\"fr\":\"老王\",\"gsdjh\":\"中国\",\"id\":29,\"isValid\":1,\"khno\":\"KH201608241829510\",\"khyh\":\"中国银行\",\"khzh\":\"123456456\",\"level\":\"重点开发客户\",\"myd\":\"☆☆☆☆☆\",\"name\":\"上海聪享科技1\",\"nyye\":\"10000\",\"phone\":\"13666666666\",\"postCode\":\"200233\",\"state\":0,\"updateDate\":1472035571000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆\",\"yyzzzch\":\"13344\",\"zczj\":\"100\"},{\"address\":\"62\",\"area\":\"上海\",\"createDate\":1477368939000,\"cusManager\":\"小张\",\"dsdjh\":\"132\",\"fax\":\"42\",\"fr\":\"7777\",\"gsdjh\":\"142\",\"id\":28,\"isValid\":1,\"khno\":\"KH20150729090910\",\"khyh\":\"102\",\"khzh\":\"1111\",\"level\":\"战略合作伙伴\",\"myd\":\"☆☆☆☆☆\",\"name\":\"sssss\",\"nyye\":\"sss\",\"phone\":\"32\",\"postCode\":\"22\",\"state\":0,\"updateDate\":1488451603000,\"webSite\":\"52\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"112\",\"zczj\":\"122\"},{\"address\":\"321\",\"area\":\"北京\",\"createDate\":1453695319000,\"cusManager\":\"小红\",\"dsdjh\":\"321\",\"fax\":\"321\",\"fr\":\"321\",\"gsdjh\":\"3213\",\"id\":16,\"isValid\":1,\"khno\":\"KH20150526073022\",\"khyh\":\"321\",\"khzh\":\"321\",\"level\":\"大客户\",\"myd\":\"☆\",\"name\":\"风驰科技\",\"nyye\":\"21\",\"phone\":\"321\",\"postCode\":\"21\",\"state\":2,\"updateDate\":1502268330000,\"webSite\":\"321\",\"xyd\":\"☆\",\"yyzzzch\":\"321\",\"zczj\":\"\"}]}' );
INSERT INTO `t_log`
VALUES
	( '162', '客户信息管理-删除', 'public com.shsxt.crm.base.ResultInfo com.shsxt.crm.controller.CustomerController.delete(java.lang.String)', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{\"ids\":[\"39,38\"]}', '2017-08-18 17:03:39', '7', 'shsxt', '{\"result\":\"删除成功\",\"resultCode\":1,\"resultMessage\":\"操作成功。\"}' );
INSERT INTO `t_log`
VALUES
	( '163', '客户信息管理-分页查询', 'public java.util.Map com.shsxt.crm.controller.CustomerController.selectForPage(com.shsxt.crm.dto.CustomerQuery)', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{\"page\":[\"1\"],\"rows\":[\"10\"]}', '2017-08-18 17:03:40', '6', 'shsxt', '{\"total\":9,\"rows\":[{\"address\":\"荣乐中路2369弄42号\",\"area\":\"上海\",\"createDate\":1503046535000,\"cusManager\":\"小明\",\"dsdjh\":\"324234\",\"fax\":\"021-89898989\",\"fr\":\"李林\",\"gsdjh\":\"234234\",\"id\":37,\"isValid\":1,\"khno\":\"KH2017-08-18175\",\"khyh\":\"中国银行\",\"khzh\":\"12345677898990000\",\"level\":\"不小的客户1\",\"myd\":\"☆☆☆☆☆\",\"name\":\"尚学堂\",\"nyye\":\"10000000000\",\"phone\":\"13888888888\",\"postCode\":\"200000\",\"state\":0,\"updateDate\":1503046535000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"1000\"},{\"address\":\"浦东张江高科1号\",\"area\":\"北京\",\"createDate\":1499065424000,\"cusManager\":\"admin1\",\"dsdjh\":\"3242342423\",\"fax\":\"021-89898989\",\"fr\":\"赵老师\",\"gsdjh\":\"234234234\",\"id\":36,\"isValid\":1,\"khno\":\"KH20170703150344713\",\"khyh\":\"中国银行\",\"khzh\":\"89890100001010103947\",\"level\":\"普通客户\",\"myd\":\"☆\",\"name\":\"上海尚学堂浦东校区1\",\"nyye\":\"1\",\"phone\":\"13644443333\",\"postCode\":\"100027\",\"state\":0,\"updateDate\":1499065424000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"10000000\"},{\"address\":\"浦东张江高科1号11\",\"area\":\"上海\",\"createDate\":1499064974000,\"cusManager\":\"小明\",\"dsdjh\":\"3242342423\",\"fax\":\"021-89898989\",\"fr\":\"廖老师\",\"gsdjh\":\"234234234\",\"id\":35,\"isValid\":1,\"khno\":\"KH20170703145613140\",\"khyh\":\"中国银行\",\"khzh\":\"89890100001010103947\",\"level\":\"重点开发客户\",\"myd\":\"☆\",\"name\":\"上海尚学堂浦东校区\",\"nyye\":\"1\",\"phone\":\"13644443333\",\"postCode\":\"100027\",\"state\":0,\"updateDate\":1499065515000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"10000000\"},{\"address\":\"浦东新区\",\"area\":\"上海\",\"createDate\":1482827301000,\"cusManager\":\"zs\",\"dsdjh\":\"1000\",\"fax\":\"sxt@sxt.cn\",\"fr\":\"老裴\",\"gsdjh\":\"10000\",\"id\":34,\"isValid\":1,\"khno\":\"KH201612271628316\",\"khyh\":\"工商\",\"khzh\":\"100100000\",\"level\":\"战略合作伙伴\",\"myd\":\"☆☆☆☆☆\",\"name\":\"浦西尚学堂\",\"nyye\":\"22\",\"phone\":\"1001111\",\"postCode\":\"100100\",\"state\":0,\"updateDate\":1488431897000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"1001000\",\"zczj\":\"100\"},{\"address\":\"1111fsdf\",\"area\":\"上海\",\"createDate\":1451639356000,\"cusManager\":\"小红\",\"dsdjh\":\"4535213212\",\"fax\":\"111\",\"fr\":\"老宋\",\"gsdjh\":\"中国\",\"id\":30,\"isValid\":1,\"khno\":\"KH201609011709179\",\"khyh\":\"中国银行\",\"khzh\":\"6225231243641\",\"level\":\"大客户\",\"myd\":\"☆\",\"name\":\"天猫11\",\"nyye\":\"1000000\",\"phone\":\"11111\",\"postCode\":\"200233\",\"state\":1,\"updateDate\":1499161947000,\"webSite\":\"111\",\"xyd\":\"☆☆☆\",\"yyzzzch\":\"11\",\"zczj\":\"1000\"},{\"address\":\"上海市徐汇区虹梅路153\",\"area\":\"北京\",\"createDate\":1472034590000,\"cusManager\":\"小明\",\"dsdjh\":\"4535213212\",\"fax\":\"134\",\"fr\":\"老王\",\"gsdjh\":\"中国\",\"id\":29,\"isValid\":1,\"khno\":\"KH201608241829510\",\"khyh\":\"中国银行\",\"khzh\":\"123456456\",\"level\":\"重点开发客户\",\"myd\":\"☆☆☆☆☆\",\"name\":\"上海聪享科技1\",\"nyye\":\"10000\",\"phone\":\"13666666666\",\"postCode\":\"200233\",\"state\":0,\"updateDate\":1472035571000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆\",\"yyzzzch\":\"13344\",\"zczj\":\"100\"},{\"address\":\"62\",\"area\":\"上海\",\"createDate\":1477368939000,\"cusManager\":\"小张\",\"dsdjh\":\"132\",\"fax\":\"42\",\"fr\":\"7777\",\"gsdjh\":\"142\",\"id\":28,\"isValid\":1,\"khno\":\"KH20150729090910\",\"khyh\":\"102\",\"khzh\":\"1111\",\"level\":\"战略合作伙伴\",\"myd\":\"☆☆☆☆☆\",\"name\":\"sssss\",\"nyye\":\"sss\",\"phone\":\"32\",\"postCode\":\"22\",\"state\":0,\"updateDate\":1488451603000,\"webSite\":\"52\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"112\",\"zczj\":\"122\"},{\"address\":\"321\",\"area\":\"北京\",\"createDate\":1453695319000,\"cusManager\":\"小红\",\"dsdjh\":\"321\",\"fax\":\"321\",\"fr\":\"321\",\"gsdjh\":\"3213\",\"id\":16,\"isValid\":1,\"khno\":\"KH20150526073022\",\"khyh\":\"321\",\"khzh\":\"321\",\"level\":\"大客户\",\"myd\":\"☆\",\"name\":\"风驰科技\",\"nyye\":\"21\",\"phone\":\"321\",\"postCode\":\"21\",\"state\":2,\"updateDate\":1502268330000,\"webSite\":\"321\",\"xyd\":\"☆\",\"yyzzzch\":\"321\",\"zczj\":\"\"},{\"address\":\"北京海淀区双榆树东里15号\",\"area\":\"北京\",\"createDate\":1456370923000,\"cusManager\":\"小张\",\"dsdjh\":\"4422214321321\",\"fax\":\"010-62263393\",\"fr\":\"张三\",\"gsdjh\":\"4104322332\",\"id\":1,\"isValid\":1,\"khno\":\"KH21321321\",\"khyh\":\"中国银行\",\"khzh\":\"6225231243641\",\"level\":\"战略合作伙伴\",\"myd\":\"☆☆☆\",\"name\":\"北京大牛科技\",\"nyye\":\"1111\",\"phone\":\"010-62263393\",\"postCode\":\"100027\",\"state\":1,\"updateDate\":1488438414000,\"webSite\":\"www.daniu.com\",\"xyd\":\"☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"1000\"}]}' );
INSERT INTO `t_log`
VALUES
	( '164', '客户信息管理', 'public java.lang.String com.shsxt.crm.controller.CustomerController.index()', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-08-18 17:04:11', '0', 'shsxt', '\"customer\"' );
INSERT INTO `t_log`
VALUES
	( '165', '客户信息管理-分页查询', 'public java.util.Map com.shsxt.crm.controller.CustomerController.selectForPage(com.shsxt.crm.dto.CustomerQuery)', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{\"page\":[\"1\"],\"rows\":[\"10\"]}', '2017-08-18 17:04:12', '4', 'shsxt', '{\"total\":11,\"rows\":[{\"address\":\"浦东张江高科1号\",\"area\":\"上海\",\"createDate\":1503046805000,\"cusManager\":\"admin1\",\"dsdjh\":\"22\",\"fax\":\"021-89898989\",\"fr\":\"郑昊\",\"gsdjh\":\"22\",\"id\":39,\"isValid\":1,\"khno\":\"KH20170818170004820\",\"khyh\":\"农业银行\",\"khzh\":\"257687888\",\"level\":\"不小的客户1\",\"myd\":\"☆\",\"name\":\"尚学堂-郑昊\",\"nyye\":\"1\",\"phone\":\"13644443333\",\"postCode\":\"200000\",\"state\":0,\"updateDate\":1503047018000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"12000\"},{\"address\":\"荣乐中路2369弄42号\",\"area\":\"上海\",\"createDate\":1503046645000,\"cusManager\":\"小明\",\"dsdjh\":\"324234\",\"fax\":\"021-89898989\",\"fr\":\"李林\",\"gsdjh\":\"234234\",\"id\":38,\"isValid\":1,\"khno\":\"KH2017-08-18205\",\"khyh\":\"中国银行\",\"khzh\":\"12345677898990000\",\"level\":\"不小的客户1\",\"myd\":\"☆☆☆☆☆\",\"name\":\"尚学堂-李林学院\",\"nyye\":\"10000000000\",\"phone\":\"13888888888\",\"postCode\":\"200000\",\"state\":0,\"updateDate\":1503047018000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"1000\"},{\"address\":\"荣乐中路2369弄42号\",\"area\":\"上海\",\"createDate\":1503046535000,\"cusManager\":\"小明\",\"dsdjh\":\"324234\",\"fax\":\"021-89898989\",\"fr\":\"李林\",\"gsdjh\":\"234234\",\"id\":37,\"isValid\":1,\"khno\":\"KH2017-08-18175\",\"khyh\":\"中国银行\",\"khzh\":\"12345677898990000\",\"level\":\"不小的客户1\",\"myd\":\"☆☆☆☆☆\",\"name\":\"尚学堂\",\"nyye\":\"10000000000\",\"phone\":\"13888888888\",\"postCode\":\"200000\",\"state\":0,\"updateDate\":1503046535000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"1000\"},{\"address\":\"浦东张江高科1号\",\"area\":\"北京\",\"createDate\":1499065424000,\"cusManager\":\"admin1\",\"dsdjh\":\"3242342423\",\"fax\":\"021-89898989\",\"fr\":\"赵老师\",\"gsdjh\":\"234234234\",\"id\":36,\"isValid\":1,\"khno\":\"KH20170703150344713\",\"khyh\":\"中国银行\",\"khzh\":\"89890100001010103947\",\"level\":\"普通客户\",\"myd\":\"☆\",\"name\":\"上海尚学堂浦东校区1\",\"nyye\":\"1\",\"phone\":\"13644443333\",\"postCode\":\"100027\",\"state\":0,\"updateDate\":1499065424000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"10000000\"},{\"address\":\"浦东张江高科1号11\",\"area\":\"上海\",\"createDate\":1499064974000,\"cusManager\":\"小明\",\"dsdjh\":\"3242342423\",\"fax\":\"021-89898989\",\"fr\":\"廖老师\",\"gsdjh\":\"234234234\",\"id\":35,\"isValid\":1,\"khno\":\"KH20170703145613140\",\"khyh\":\"中国银行\",\"khzh\":\"89890100001010103947\",\"level\":\"重点开发客户\",\"myd\":\"☆\",\"name\":\"上海尚学堂浦东校区\",\"nyye\":\"1\",\"phone\":\"13644443333\",\"postCode\":\"100027\",\"state\":0,\"updateDate\":1499065515000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"10000000\"},{\"address\":\"浦东新区\",\"area\":\"上海\",\"createDate\":1482827301000,\"cusManager\":\"zs\",\"dsdjh\":\"1000\",\"fax\":\"sxt@sxt.cn\",\"fr\":\"老裴\",\"gsdjh\":\"10000\",\"id\":34,\"isValid\":1,\"khno\":\"KH201612271628316\",\"khyh\":\"工商\",\"khzh\":\"100100000\",\"level\":\"战略合作伙伴\",\"myd\":\"☆☆☆☆☆\",\"name\":\"浦西尚学堂\",\"nyye\":\"22\",\"phone\":\"1001111\",\"postCode\":\"100100\",\"state\":0,\"updateDate\":1488431897000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"1001000\",\"zczj\":\"100\"},{\"address\":\"1111fsdf\",\"area\":\"上海\",\"createDate\":1451639356000,\"cusManager\":\"小红\",\"dsdjh\":\"4535213212\",\"fax\":\"111\",\"fr\":\"老宋\",\"gsdjh\":\"中国\",\"id\":30,\"isValid\":1,\"khno\":\"KH201609011709179\",\"khyh\":\"中国银行\",\"khzh\":\"6225231243641\",\"level\":\"大客户\",\"myd\":\"☆\",\"name\":\"天猫11\",\"nyye\":\"1000000\",\"phone\":\"11111\",\"postCode\":\"200233\",\"state\":1,\"updateDate\":1499161947000,\"webSite\":\"111\",\"xyd\":\"☆☆☆\",\"yyzzzch\":\"11\",\"zczj\":\"1000\"},{\"address\":\"上海市徐汇区虹梅路153\",\"area\":\"北京\",\"createDate\":1472034590000,\"cusManager\":\"小明\",\"dsdjh\":\"4535213212\",\"fax\":\"134\",\"fr\":\"老王\",\"gsdjh\":\"中国\",\"id\":29,\"isValid\":1,\"khno\":\"KH201608241829510\",\"khyh\":\"中国银行\",\"khzh\":\"123456456\",\"level\":\"重点开发客户\",\"myd\":\"☆☆☆☆☆\",\"name\":\"上海聪享科技1\",\"nyye\":\"10000\",\"phone\":\"13666666666\",\"postCode\":\"200233\",\"state\":0,\"updateDate\":1472035571000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆\",\"yyzzzch\":\"13344\",\"zczj\":\"100\"},{\"address\":\"62\",\"area\":\"上海\",\"createDate\":1477368939000,\"cusManager\":\"小张\",\"dsdjh\":\"132\",\"fax\":\"42\",\"fr\":\"7777\",\"gsdjh\":\"142\",\"id\":28,\"isValid\":1,\"khno\":\"KH20150729090910\",\"khyh\":\"102\",\"khzh\":\"1111\",\"level\":\"战略合作伙伴\",\"myd\":\"☆☆☆☆☆\",\"name\":\"sssss\",\"nyye\":\"sss\",\"phone\":\"32\",\"postCode\":\"22\",\"state\":0,\"updateDate\":1488451603000,\"webSite\":\"52\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"112\",\"zczj\":\"122\"},{\"address\":\"321\",\"area\":\"北京\",\"createDate\":1453695319000,\"cusManager\":\"小红\",\"dsdjh\":\"321\",\"fax\":\"321\",\"fr\":\"321\",\"gsdjh\":\"3213\",\"id\":16,\"isValid\":1,\"khno\":\"KH20150526073022\",\"khyh\":\"321\",\"khzh\":\"321\",\"level\":\"大客户\",\"myd\":\"☆\",\"name\":\"风驰科技\",\"nyye\":\"21\",\"phone\":\"321\",\"postCode\":\"21\",\"state\":2,\"updateDate\":1502268330000,\"webSite\":\"321\",\"xyd\":\"☆\",\"yyzzzch\":\"321\",\"zczj\":\"\"}]}' );
INSERT INTO `t_log`
VALUES
	( '166', '客户信息管理-删除', 'public com.shsxt.crm.base.ResultInfo com.shsxt.crm.controller.CustomerController.delete(java.lang.String)', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{\"ids\":[\"37\"]}', '2017-08-18 17:04:15', '4', 'shsxt', '{\"result\":\"删除成功\",\"resultCode\":1,\"resultMessage\":\"操作成功。\"}' );
INSERT INTO `t_log`
VALUES
	( '167', '客户信息管理-分页查询', 'public java.util.Map com.shsxt.crm.controller.CustomerController.selectForPage(com.shsxt.crm.dto.CustomerQuery)', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{\"page\":[\"1\"],\"rows\":[\"10\"]}', '2017-08-18 17:04:17', '4', 'shsxt', '{\"total\":10,\"rows\":[{\"address\":\"浦东张江高科1号\",\"area\":\"上海\",\"createDate\":1503046805000,\"cusManager\":\"admin1\",\"dsdjh\":\"22\",\"fax\":\"021-89898989\",\"fr\":\"郑昊\",\"gsdjh\":\"22\",\"id\":39,\"isValid\":1,\"khno\":\"KH20170818170004820\",\"khyh\":\"农业银行\",\"khzh\":\"257687888\",\"level\":\"不小的客户1\",\"myd\":\"☆\",\"name\":\"尚学堂-郑昊\",\"nyye\":\"1\",\"phone\":\"13644443333\",\"postCode\":\"200000\",\"state\":0,\"updateDate\":1503047018000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"12000\"},{\"address\":\"荣乐中路2369弄42号\",\"area\":\"上海\",\"createDate\":1503046645000,\"cusManager\":\"小明\",\"dsdjh\":\"324234\",\"fax\":\"021-89898989\",\"fr\":\"李林\",\"gsdjh\":\"234234\",\"id\":38,\"isValid\":1,\"khno\":\"KH2017-08-18205\",\"khyh\":\"中国银行\",\"khzh\":\"12345677898990000\",\"level\":\"不小的客户1\",\"myd\":\"☆☆☆☆☆\",\"name\":\"尚学堂-李林学院\",\"nyye\":\"10000000000\",\"phone\":\"13888888888\",\"postCode\":\"200000\",\"state\":0,\"updateDate\":1503047018000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"1000\"},{\"address\":\"浦东张江高科1号\",\"area\":\"北京\",\"createDate\":1499065424000,\"cusManager\":\"admin1\",\"dsdjh\":\"3242342423\",\"fax\":\"021-89898989\",\"fr\":\"赵老师\",\"gsdjh\":\"234234234\",\"id\":36,\"isValid\":1,\"khno\":\"KH20170703150344713\",\"khyh\":\"中国银行\",\"khzh\":\"89890100001010103947\",\"level\":\"普通客户\",\"myd\":\"☆\",\"name\":\"上海尚学堂浦东校区1\",\"nyye\":\"1\",\"phone\":\"13644443333\",\"postCode\":\"100027\",\"state\":0,\"updateDate\":1499065424000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"10000000\"},{\"address\":\"浦东张江高科1号11\",\"area\":\"上海\",\"createDate\":1499064974000,\"cusManager\":\"小明\",\"dsdjh\":\"3242342423\",\"fax\":\"021-89898989\",\"fr\":\"廖老师\",\"gsdjh\":\"234234234\",\"id\":35,\"isValid\":1,\"khno\":\"KH20170703145613140\",\"khyh\":\"中国银行\",\"khzh\":\"89890100001010103947\",\"level\":\"重点开发客户\",\"myd\":\"☆\",\"name\":\"上海尚学堂浦东校区\",\"nyye\":\"1\",\"phone\":\"13644443333\",\"postCode\":\"100027\",\"state\":0,\"updateDate\":1499065515000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"10000000\"},{\"address\":\"浦东新区\",\"area\":\"上海\",\"createDate\":1482827301000,\"cusManager\":\"zs\",\"dsdjh\":\"1000\",\"fax\":\"sxt@sxt.cn\",\"fr\":\"老裴\",\"gsdjh\":\"10000\",\"id\":34,\"isValid\":1,\"khno\":\"KH201612271628316\",\"khyh\":\"工商\",\"khzh\":\"100100000\",\"level\":\"战略合作伙伴\",\"myd\":\"☆☆☆☆☆\",\"name\":\"浦西尚学堂\",\"nyye\":\"22\",\"phone\":\"1001111\",\"postCode\":\"100100\",\"state\":0,\"updateDate\":1488431897000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"1001000\",\"zczj\":\"100\"},{\"address\":\"1111fsdf\",\"area\":\"上海\",\"createDate\":1451639356000,\"cusManager\":\"小红\",\"dsdjh\":\"4535213212\",\"fax\":\"111\",\"fr\":\"老宋\",\"gsdjh\":\"中国\",\"id\":30,\"isValid\":1,\"khno\":\"KH201609011709179\",\"khyh\":\"中国银行\",\"khzh\":\"6225231243641\",\"level\":\"大客户\",\"myd\":\"☆\",\"name\":\"天猫11\",\"nyye\":\"1000000\",\"phone\":\"11111\",\"postCode\":\"200233\",\"state\":1,\"updateDate\":1499161947000,\"webSite\":\"111\",\"xyd\":\"☆☆☆\",\"yyzzzch\":\"11\",\"zczj\":\"1000\"},{\"address\":\"上海市徐汇区虹梅路153\",\"area\":\"北京\",\"createDate\":1472034590000,\"cusManager\":\"小明\",\"dsdjh\":\"4535213212\",\"fax\":\"134\",\"fr\":\"老王\",\"gsdjh\":\"中国\",\"id\":29,\"isValid\":1,\"khno\":\"KH201608241829510\",\"khyh\":\"中国银行\",\"khzh\":\"123456456\",\"level\":\"重点开发客户\",\"myd\":\"☆☆☆☆☆\",\"name\":\"上海聪享科技1\",\"nyye\":\"10000\",\"phone\":\"13666666666\",\"postCode\":\"200233\",\"state\":0,\"updateDate\":1472035571000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆\",\"yyzzzch\":\"13344\",\"zczj\":\"100\"},{\"address\":\"62\",\"area\":\"上海\",\"createDate\":1477368939000,\"cusManager\":\"小张\",\"dsdjh\":\"132\",\"fax\":\"42\",\"fr\":\"7777\",\"gsdjh\":\"142\",\"id\":28,\"isValid\":1,\"khno\":\"KH20150729090910\",\"khyh\":\"102\",\"khzh\":\"1111\",\"level\":\"战略合作伙伴\",\"myd\":\"☆☆☆☆☆\",\"name\":\"sssss\",\"nyye\":\"sss\",\"phone\":\"32\",\"postCode\":\"22\",\"state\":0,\"updateDate\":1488451603000,\"webSite\":\"52\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"112\",\"zczj\":\"122\"},{\"address\":\"321\",\"area\":\"北京\",\"createDate\":1453695319000,\"cusManager\":\"小红\",\"dsdjh\":\"321\",\"fax\":\"321\",\"fr\":\"321\",\"gsdjh\":\"3213\",\"id\":16,\"isValid\":1,\"khno\":\"KH20150526073022\",\"khyh\":\"321\",\"khzh\":\"321\",\"level\":\"大客户\",\"myd\":\"☆\",\"name\":\"风驰科技\",\"nyye\":\"21\",\"phone\":\"321\",\"postCode\":\"21\",\"state\":2,\"updateDate\":1502268330000,\"webSite\":\"321\",\"xyd\":\"☆\",\"yyzzzch\":\"321\",\"zczj\":\"\"},{\"address\":\"北京海淀区双榆树东里15号\",\"area\":\"北京\",\"createDate\":1456370923000,\"cusManager\":\"小张\",\"dsdjh\":\"4422214321321\",\"fax\":\"010-62263393\",\"fr\":\"张三\",\"gsdjh\":\"4104322332\",\"id\":1,\"isValid\":1,\"khno\":\"KH21321321\",\"khyh\":\"中国银行\",\"khzh\":\"6225231243641\",\"level\":\"战略合作伙伴\",\"myd\":\"☆☆☆\",\"name\":\"北京大牛科技\",\"nyye\":\"1111\",\"phone\":\"010-62263393\",\"postCode\":\"100027\",\"state\":1,\"updateDate\":1488438414000,\"webSite\":\"www.daniu.com\",\"xyd\":\"☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"1000\"}]}' );
INSERT INTO `t_log`
VALUES
	( '168', '客户信息管理', 'public java.lang.String com.shsxt.crm.controller.CustomerController.index()', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-08-19 09:54:07', '6', 'shsxt', '\"customer\"' );
INSERT INTO `t_log`
VALUES
	( '169', '客户信息管理-分页查询', 'public java.util.Map com.shsxt.crm.controller.CustomerController.selectForPage(com.shsxt.crm.dto.CustomerQuery)', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{\"page\":[\"1\"],\"rows\":[\"10\"]}', '2017-08-19 09:54:08', '41', 'shsxt', '{\"total\":10,\"rows\":[{\"address\":\"浦东张江高科1号\",\"area\":\"上海\",\"createDate\":1503046805000,\"cusManager\":\"admin1\",\"dsdjh\":\"22\",\"fax\":\"021-89898989\",\"fr\":\"郑昊\",\"gsdjh\":\"22\",\"id\":39,\"isValid\":1,\"khno\":\"KH20170818170004820\",\"khyh\":\"农业银行\",\"khzh\":\"257687888\",\"level\":\"不小的客户1\",\"myd\":\"☆\",\"name\":\"尚学堂-郑昊\",\"nyye\":\"1\",\"phone\":\"13644443333\",\"postCode\":\"200000\",\"state\":0,\"updateDate\":1503047018000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"12000\"},{\"address\":\"荣乐中路2369弄42号\",\"area\":\"上海\",\"createDate\":1503046645000,\"cusManager\":\"小明\",\"dsdjh\":\"324234\",\"fax\":\"021-89898989\",\"fr\":\"李林\",\"gsdjh\":\"234234\",\"id\":38,\"isValid\":1,\"khno\":\"KH2017-08-18205\",\"khyh\":\"中国银行\",\"khzh\":\"12345677898990000\",\"level\":\"不小的客户1\",\"myd\":\"☆☆☆☆☆\",\"name\":\"尚学堂-李林学院\",\"nyye\":\"10000000000\",\"phone\":\"13888888888\",\"postCode\":\"200000\",\"state\":0,\"updateDate\":1503047018000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"1000\"},{\"address\":\"浦东张江高科1号\",\"area\":\"北京\",\"createDate\":1499065424000,\"cusManager\":\"admin1\",\"dsdjh\":\"3242342423\",\"fax\":\"021-89898989\",\"fr\":\"赵老师\",\"gsdjh\":\"234234234\",\"id\":36,\"isValid\":1,\"khno\":\"KH20170703150344713\",\"khyh\":\"中国银行\",\"khzh\":\"89890100001010103947\",\"level\":\"普通客户\",\"myd\":\"☆\",\"name\":\"上海尚学堂浦东校区1\",\"nyye\":\"1\",\"phone\":\"13644443333\",\"postCode\":\"100027\",\"state\":0,\"updateDate\":1499065424000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"10000000\"},{\"address\":\"浦东张江高科1号11\",\"area\":\"上海\",\"createDate\":1499064974000,\"cusManager\":\"小明\",\"dsdjh\":\"3242342423\",\"fax\":\"021-89898989\",\"fr\":\"廖老师\",\"gsdjh\":\"234234234\",\"id\":35,\"isValid\":1,\"khno\":\"KH20170703145613140\",\"khyh\":\"中国银行\",\"khzh\":\"89890100001010103947\",\"level\":\"重点开发客户\",\"myd\":\"☆\",\"name\":\"上海尚学堂浦东校区\",\"nyye\":\"1\",\"phone\":\"13644443333\",\"postCode\":\"100027\",\"state\":0,\"updateDate\":1499065515000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"10000000\"},{\"address\":\"浦东新区\",\"area\":\"上海\",\"createDate\":1482827301000,\"cusManager\":\"zs\",\"dsdjh\":\"1000\",\"fax\":\"sxt@sxt.cn\",\"fr\":\"老裴\",\"gsdjh\":\"10000\",\"id\":34,\"isValid\":1,\"khno\":\"KH201612271628316\",\"khyh\":\"工商\",\"khzh\":\"100100000\",\"level\":\"战略合作伙伴\",\"myd\":\"☆☆☆☆☆\",\"name\":\"浦西尚学堂\",\"nyye\":\"22\",\"phone\":\"1001111\",\"postCode\":\"100100\",\"state\":0,\"updateDate\":1488431897000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"1001000\",\"zczj\":\"100\"},{\"address\":\"1111fsdf\",\"area\":\"上海\",\"createDate\":1451639356000,\"cusManager\":\"小红\",\"dsdjh\":\"4535213212\",\"fax\":\"111\",\"fr\":\"老宋\",\"gsdjh\":\"中国\",\"id\":30,\"isValid\":1,\"khno\":\"KH201609011709179\",\"khyh\":\"中国银行\",\"khzh\":\"6225231243641\",\"level\":\"大客户\",\"myd\":\"☆\",\"name\":\"天猫11\",\"nyye\":\"1000000\",\"phone\":\"11111\",\"postCode\":\"200233\",\"state\":1,\"updateDate\":1499161947000,\"webSite\":\"111\",\"xyd\":\"☆☆☆\",\"yyzzzch\":\"11\",\"zczj\":\"1000\"},{\"address\":\"上海市徐汇区虹梅路153\",\"area\":\"北京\",\"createDate\":1472034590000,\"cusManager\":\"小明\",\"dsdjh\":\"4535213212\",\"fax\":\"134\",\"fr\":\"老王\",\"gsdjh\":\"中国\",\"id\":29,\"isValid\":1,\"khno\":\"KH201608241829510\",\"khyh\":\"中国银行\",\"khzh\":\"123456456\",\"level\":\"重点开发客户\",\"myd\":\"☆☆☆☆☆\",\"name\":\"上海聪享科技1\",\"nyye\":\"10000\",\"phone\":\"13666666666\",\"postCode\":\"200233\",\"state\":0,\"updateDate\":1472035571000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆\",\"yyzzzch\":\"13344\",\"zczj\":\"100\"},{\"address\":\"62\",\"area\":\"上海\",\"createDate\":1477368939000,\"cusManager\":\"小张\",\"dsdjh\":\"132\",\"fax\":\"42\",\"fr\":\"7777\",\"gsdjh\":\"142\",\"id\":28,\"isValid\":1,\"khno\":\"KH20150729090910\",\"khyh\":\"102\",\"khzh\":\"1111\",\"level\":\"战略合作伙伴\",\"myd\":\"☆☆☆☆☆\",\"name\":\"sssss\",\"nyye\":\"sss\",\"phone\":\"32\",\"postCode\":\"22\",\"state\":0,\"updateDate\":1488451603000,\"webSite\":\"52\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"112\",\"zczj\":\"122\"},{\"address\":\"321\",\"area\":\"北京\",\"createDate\":1453695319000,\"cusManager\":\"小红\",\"dsdjh\":\"321\",\"fax\":\"321\",\"fr\":\"321\",\"gsdjh\":\"3213\",\"id\":16,\"isValid\":1,\"khno\":\"KH20150526073022\",\"khyh\":\"321\",\"khzh\":\"321\",\"level\":\"大客户\",\"myd\":\"☆\",\"name\":\"风驰科技\",\"nyye\":\"21\",\"phone\":\"321\",\"postCode\":\"21\",\"state\":2,\"updateDate\":1502268330000,\"webSite\":\"321\",\"xyd\":\"☆\",\"yyzzzch\":\"321\",\"zczj\":\"\"},{\"address\":\"北京海淀区双榆树东里15号\",\"area\":\"北京\",\"createDate\":1456370923000,\"cusManager\":\"小张\",\"dsdjh\":\"4422214321321\",\"fax\":\"010-62263393\",\"fr\":\"张三\",\"gsdjh\":\"4104322332\",\"id\":1,\"isValid\":1,\"khno\":\"KH21321321\",\"khyh\":\"中国银行\",\"khzh\":\"6225231243641\",\"level\":\"战略合作伙伴\",\"myd\":\"☆☆☆\",\"name\":\"北京大牛科技\",\"nyye\":\"1111\",\"phone\":\"010-62263393\",\"postCode\":\"100027\",\"state\":1,\"updateDate\":1488438414000,\"webSite\":\"www.daniu.com\",\"xyd\":\"☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"1000\"}]}' );
INSERT INTO `t_log`
VALUES
	( '170', '客户信息管理-分页查询', 'public java.util.Map com.shsxt.crm.controller.CustomerController.selectForPage(com.shsxt.crm.dto.CustomerQuery)', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{\"page\":[\"1\"],\"rows\":[\"10\"]}', '2017-08-19 10:26:43', '9', 'shsxt', '{\"total\":10,\"rows\":[{\"address\":\"浦东张江高科1号\",\"area\":\"上海\",\"createDate\":1503046805000,\"cusManager\":\"admin1\",\"dsdjh\":\"22\",\"fax\":\"021-89898989\",\"fr\":\"郑昊\",\"gsdjh\":\"22\",\"id\":39,\"isValid\":1,\"khno\":\"KH20170818170004820\",\"khyh\":\"农业银行\",\"khzh\":\"257687888\",\"level\":\"不小的客户1\",\"myd\":\"☆\",\"name\":\"尚学堂-郑昊\",\"nyye\":\"1\",\"phone\":\"13644443333\",\"postCode\":\"200000\",\"state\":0,\"updateDate\":1503047018000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"12000\"},{\"address\":\"荣乐中路2369弄42号\",\"area\":\"上海\",\"createDate\":1503046645000,\"cusManager\":\"小明\",\"dsdjh\":\"324234\",\"fax\":\"021-89898989\",\"fr\":\"李林\",\"gsdjh\":\"234234\",\"id\":38,\"isValid\":1,\"khno\":\"KH2017-08-18205\",\"khyh\":\"中国银行\",\"khzh\":\"12345677898990000\",\"level\":\"不小的客户1\",\"myd\":\"☆☆☆☆☆\",\"name\":\"尚学堂-李林学院\",\"nyye\":\"10000000000\",\"phone\":\"13888888888\",\"postCode\":\"200000\",\"state\":0,\"updateDate\":1503047018000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"1000\"},{\"address\":\"浦东张江高科1号\",\"area\":\"北京\",\"createDate\":1499065424000,\"cusManager\":\"admin1\",\"dsdjh\":\"3242342423\",\"fax\":\"021-89898989\",\"fr\":\"赵老师\",\"gsdjh\":\"234234234\",\"id\":36,\"isValid\":1,\"khno\":\"KH20170703150344713\",\"khyh\":\"中国银行\",\"khzh\":\"89890100001010103947\",\"level\":\"普通客户\",\"myd\":\"☆\",\"name\":\"上海尚学堂浦东校区1\",\"nyye\":\"1\",\"phone\":\"13644443333\",\"postCode\":\"100027\",\"state\":0,\"updateDate\":1499065424000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"10000000\"},{\"address\":\"浦东张江高科1号11\",\"area\":\"上海\",\"createDate\":1499064974000,\"cusManager\":\"小明\",\"dsdjh\":\"3242342423\",\"fax\":\"021-89898989\",\"fr\":\"廖老师\",\"gsdjh\":\"234234234\",\"id\":35,\"isValid\":1,\"khno\":\"KH20170703145613140\",\"khyh\":\"中国银行\",\"khzh\":\"89890100001010103947\",\"level\":\"重点开发客户\",\"myd\":\"☆\",\"name\":\"上海尚学堂浦东校区\",\"nyye\":\"1\",\"phone\":\"13644443333\",\"postCode\":\"100027\",\"state\":0,\"updateDate\":1499065515000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"10000000\"},{\"address\":\"浦东新区\",\"area\":\"上海\",\"createDate\":1482827301000,\"cusManager\":\"zs\",\"dsdjh\":\"1000\",\"fax\":\"sxt@sxt.cn\",\"fr\":\"老裴\",\"gsdjh\":\"10000\",\"id\":34,\"isValid\":1,\"khno\":\"KH201612271628316\",\"khyh\":\"工商\",\"khzh\":\"100100000\",\"level\":\"战略合作伙伴\",\"myd\":\"☆☆☆☆☆\",\"name\":\"浦西尚学堂\",\"nyye\":\"22\",\"phone\":\"1001111\",\"postCode\":\"100100\",\"state\":0,\"updateDate\":1488431897000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"1001000\",\"zczj\":\"100\"},{\"address\":\"1111fsdf\",\"area\":\"上海\",\"createDate\":1451639356000,\"cusManager\":\"小红\",\"dsdjh\":\"4535213212\",\"fax\":\"111\",\"fr\":\"老宋\",\"gsdjh\":\"中国\",\"id\":30,\"isValid\":1,\"khno\":\"KH201609011709179\",\"khyh\":\"中国银行\",\"khzh\":\"6225231243641\",\"level\":\"大客户\",\"myd\":\"☆\",\"name\":\"天猫11\",\"nyye\":\"1000000\",\"phone\":\"11111\",\"postCode\":\"200233\",\"state\":1,\"updateDate\":1499161947000,\"webSite\":\"111\",\"xyd\":\"☆☆☆\",\"yyzzzch\":\"11\",\"zczj\":\"1000\"},{\"address\":\"上海市徐汇区虹梅路153\",\"area\":\"北京\",\"createDate\":1472034590000,\"cusManager\":\"小明\",\"dsdjh\":\"4535213212\",\"fax\":\"134\",\"fr\":\"老王\",\"gsdjh\":\"中国\",\"id\":29,\"isValid\":1,\"khno\":\"KH201608241829510\",\"khyh\":\"中国银行\",\"khzh\":\"123456456\",\"level\":\"重点开发客户\",\"myd\":\"☆☆☆☆☆\",\"name\":\"上海聪享科技1\",\"nyye\":\"10000\",\"phone\":\"13666666666\",\"postCode\":\"200233\",\"state\":0,\"updateDate\":1472035571000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆\",\"yyzzzch\":\"13344\",\"zczj\":\"100\"},{\"address\":\"62\",\"area\":\"上海\",\"createDate\":1477368939000,\"cusManager\":\"小张\",\"dsdjh\":\"132\",\"fax\":\"42\",\"fr\":\"7777\",\"gsdjh\":\"142\",\"id\":28,\"isValid\":1,\"khno\":\"KH20150729090910\",\"khyh\":\"102\",\"khzh\":\"1111\",\"level\":\"战略合作伙伴\",\"myd\":\"☆☆☆☆☆\",\"name\":\"sssss\",\"nyye\":\"sss\",\"phone\":\"32\",\"postCode\":\"22\",\"state\":0,\"updateDate\":1488451603000,\"webSite\":\"52\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"112\",\"zczj\":\"122\"},{\"address\":\"321\",\"area\":\"北京\",\"createDate\":1453695319000,\"cusManager\":\"小红\",\"dsdjh\":\"321\",\"fax\":\"321\",\"fr\":\"321\",\"gsdjh\":\"3213\",\"id\":16,\"isValid\":1,\"khno\":\"KH20150526073022\",\"khyh\":\"321\",\"khzh\":\"321\",\"level\":\"大客户\",\"myd\":\"☆\",\"name\":\"风驰科技\",\"nyye\":\"21\",\"phone\":\"321\",\"postCode\":\"21\",\"state\":2,\"updateDate\":1502268330000,\"webSite\":\"321\",\"xyd\":\"☆\",\"yyzzzch\":\"321\",\"zczj\":\"\"},{\"address\":\"北京海淀区双榆树东里15号\",\"area\":\"北京\",\"createDate\":1456370923000,\"cusManager\":\"小张\",\"dsdjh\":\"4422214321321\",\"fax\":\"010-62263393\",\"fr\":\"张三\",\"gsdjh\":\"4104322332\",\"id\":1,\"isValid\":1,\"khno\":\"KH21321321\",\"khyh\":\"中国银行\",\"khzh\":\"6225231243641\",\"level\":\"战略合作伙伴\",\"myd\":\"☆☆☆\",\"name\":\"北京大牛科技\",\"nyye\":\"1111\",\"phone\":\"010-62263393\",\"postCode\":\"100027\",\"state\":1,\"updateDate\":1488438414000,\"webSite\":\"www.daniu.com\",\"xyd\":\"☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"1000\"}]}' );
INSERT INTO `t_log`
VALUES
	( '171', '客户信息管理-分页查询', 'public java.util.Map com.shsxt.crm.controller.CustomerController.selectForPage(com.shsxt.crm.dto.CustomerQuery)', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{\"page\":[\"1\"],\"rows\":[\"10\"]}', '2017-08-19 10:26:44', '6', 'shsxt', '{\"total\":10,\"rows\":[{\"address\":\"浦东张江高科1号\",\"area\":\"上海\",\"createDate\":1503046805000,\"cusManager\":\"admin1\",\"dsdjh\":\"22\",\"fax\":\"021-89898989\",\"fr\":\"郑昊\",\"gsdjh\":\"22\",\"id\":39,\"isValid\":1,\"khno\":\"KH20170818170004820\",\"khyh\":\"农业银行\",\"khzh\":\"257687888\",\"level\":\"不小的客户1\",\"myd\":\"☆\",\"name\":\"尚学堂-郑昊\",\"nyye\":\"1\",\"phone\":\"13644443333\",\"postCode\":\"200000\",\"state\":0,\"updateDate\":1503047018000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"12000\"},{\"address\":\"荣乐中路2369弄42号\",\"area\":\"上海\",\"createDate\":1503046645000,\"cusManager\":\"小明\",\"dsdjh\":\"324234\",\"fax\":\"021-89898989\",\"fr\":\"李林\",\"gsdjh\":\"234234\",\"id\":38,\"isValid\":1,\"khno\":\"KH2017-08-18205\",\"khyh\":\"中国银行\",\"khzh\":\"12345677898990000\",\"level\":\"不小的客户1\",\"myd\":\"☆☆☆☆☆\",\"name\":\"尚学堂-李林学院\",\"nyye\":\"10000000000\",\"phone\":\"13888888888\",\"postCode\":\"200000\",\"state\":0,\"updateDate\":1503047018000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"1000\"},{\"address\":\"浦东张江高科1号\",\"area\":\"北京\",\"createDate\":1499065424000,\"cusManager\":\"admin1\",\"dsdjh\":\"3242342423\",\"fax\":\"021-89898989\",\"fr\":\"赵老师\",\"gsdjh\":\"234234234\",\"id\":36,\"isValid\":1,\"khno\":\"KH20170703150344713\",\"khyh\":\"中国银行\",\"khzh\":\"89890100001010103947\",\"level\":\"普通客户\",\"myd\":\"☆\",\"name\":\"上海尚学堂浦东校区1\",\"nyye\":\"1\",\"phone\":\"13644443333\",\"postCode\":\"100027\",\"state\":0,\"updateDate\":1499065424000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"10000000\"},{\"address\":\"浦东张江高科1号11\",\"area\":\"上海\",\"createDate\":1499064974000,\"cusManager\":\"小明\",\"dsdjh\":\"3242342423\",\"fax\":\"021-89898989\",\"fr\":\"廖老师\",\"gsdjh\":\"234234234\",\"id\":35,\"isValid\":1,\"khno\":\"KH20170703145613140\",\"khyh\":\"中国银行\",\"khzh\":\"89890100001010103947\",\"level\":\"重点开发客户\",\"myd\":\"☆\",\"name\":\"上海尚学堂浦东校区\",\"nyye\":\"1\",\"phone\":\"13644443333\",\"postCode\":\"100027\",\"state\":0,\"updateDate\":1499065515000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"10000000\"},{\"address\":\"浦东新区\",\"area\":\"上海\",\"createDate\":1482827301000,\"cusManager\":\"zs\",\"dsdjh\":\"1000\",\"fax\":\"sxt@sxt.cn\",\"fr\":\"老裴\",\"gsdjh\":\"10000\",\"id\":34,\"isValid\":1,\"khno\":\"KH201612271628316\",\"khyh\":\"工商\",\"khzh\":\"100100000\",\"level\":\"战略合作伙伴\",\"myd\":\"☆☆☆☆☆\",\"name\":\"浦西尚学堂\",\"nyye\":\"22\",\"phone\":\"1001111\",\"postCode\":\"100100\",\"state\":0,\"updateDate\":1488431897000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"1001000\",\"zczj\":\"100\"},{\"address\":\"1111fsdf\",\"area\":\"上海\",\"createDate\":1451639356000,\"cusManager\":\"小红\",\"dsdjh\":\"4535213212\",\"fax\":\"111\",\"fr\":\"老宋\",\"gsdjh\":\"中国\",\"id\":30,\"isValid\":1,\"khno\":\"KH201609011709179\",\"khyh\":\"中国银行\",\"khzh\":\"6225231243641\",\"level\":\"大客户\",\"myd\":\"☆\",\"name\":\"天猫11\",\"nyye\":\"1000000\",\"phone\":\"11111\",\"postCode\":\"200233\",\"state\":1,\"updateDate\":1499161947000,\"webSite\":\"111\",\"xyd\":\"☆☆☆\",\"yyzzzch\":\"11\",\"zczj\":\"1000\"},{\"address\":\"上海市徐汇区虹梅路153\",\"area\":\"北京\",\"createDate\":1472034590000,\"cusManager\":\"小明\",\"dsdjh\":\"4535213212\",\"fax\":\"134\",\"fr\":\"老王\",\"gsdjh\":\"中国\",\"id\":29,\"isValid\":1,\"khno\":\"KH201608241829510\",\"khyh\":\"中国银行\",\"khzh\":\"123456456\",\"level\":\"重点开发客户\",\"myd\":\"☆☆☆☆☆\",\"name\":\"上海聪享科技1\",\"nyye\":\"10000\",\"phone\":\"13666666666\",\"postCode\":\"200233\",\"state\":0,\"updateDate\":1472035571000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆\",\"yyzzzch\":\"13344\",\"zczj\":\"100\"},{\"address\":\"62\",\"area\":\"上海\",\"createDate\":1477368939000,\"cusManager\":\"小张\",\"dsdjh\":\"132\",\"fax\":\"42\",\"fr\":\"7777\",\"gsdjh\":\"142\",\"id\":28,\"isValid\":1,\"khno\":\"KH20150729090910\",\"khyh\":\"102\",\"khzh\":\"1111\",\"level\":\"战略合作伙伴\",\"myd\":\"☆☆☆☆☆\",\"name\":\"sssss\",\"nyye\":\"sss\",\"phone\":\"32\",\"postCode\":\"22\",\"state\":0,\"updateDate\":1488451603000,\"webSite\":\"52\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"112\",\"zczj\":\"122\"},{\"address\":\"321\",\"area\":\"北京\",\"createDate\":1453695319000,\"cusManager\":\"小红\",\"dsdjh\":\"321\",\"fax\":\"321\",\"fr\":\"321\",\"gsdjh\":\"3213\",\"id\":16,\"isValid\":1,\"khno\":\"KH20150526073022\",\"khyh\":\"321\",\"khzh\":\"321\",\"level\":\"大客户\",\"myd\":\"☆\",\"name\":\"风驰科技\",\"nyye\":\"21\",\"phone\":\"321\",\"postCode\":\"21\",\"state\":2,\"updateDate\":1502268330000,\"webSite\":\"321\",\"xyd\":\"☆\",\"yyzzzch\":\"321\",\"zczj\":\"\"},{\"address\":\"北京海淀区双榆树东里15号\",\"area\":\"北京\",\"createDate\":1456370923000,\"cusManager\":\"小张\",\"dsdjh\":\"4422214321321\",\"fax\":\"010-62263393\",\"fr\":\"张三\",\"gsdjh\":\"4104322332\",\"id\":1,\"isValid\":1,\"khno\":\"KH21321321\",\"khyh\":\"中国银行\",\"khzh\":\"6225231243641\",\"level\":\"战略合作伙伴\",\"myd\":\"☆☆☆\",\"name\":\"北京大牛科技\",\"nyye\":\"1111\",\"phone\":\"010-62263393\",\"postCode\":\"100027\",\"state\":1,\"updateDate\":1488438414000,\"webSite\":\"www.daniu.com\",\"xyd\":\"☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"1000\"}]}' );
INSERT INTO `t_log`
VALUES
	( '172', '客户信息管理-分页查询', 'public java.util.Map com.shsxt.crm.controller.CustomerController.selectForPage(com.shsxt.crm.dto.CustomerQuery)', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{\"page\":[\"1\"],\"rows\":[\"10\"]}', '2017-08-19 10:26:44', '4', 'shsxt', '{\"total\":10,\"rows\":[{\"address\":\"浦东张江高科1号\",\"area\":\"上海\",\"createDate\":1503046805000,\"cusManager\":\"admin1\",\"dsdjh\":\"22\",\"fax\":\"021-89898989\",\"fr\":\"郑昊\",\"gsdjh\":\"22\",\"id\":39,\"isValid\":1,\"khno\":\"KH20170818170004820\",\"khyh\":\"农业银行\",\"khzh\":\"257687888\",\"level\":\"不小的客户1\",\"myd\":\"☆\",\"name\":\"尚学堂-郑昊\",\"nyye\":\"1\",\"phone\":\"13644443333\",\"postCode\":\"200000\",\"state\":0,\"updateDate\":1503047018000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"12000\"},{\"address\":\"荣乐中路2369弄42号\",\"area\":\"上海\",\"createDate\":1503046645000,\"cusManager\":\"小明\",\"dsdjh\":\"324234\",\"fax\":\"021-89898989\",\"fr\":\"李林\",\"gsdjh\":\"234234\",\"id\":38,\"isValid\":1,\"khno\":\"KH2017-08-18205\",\"khyh\":\"中国银行\",\"khzh\":\"12345677898990000\",\"level\":\"不小的客户1\",\"myd\":\"☆☆☆☆☆\",\"name\":\"尚学堂-李林学院\",\"nyye\":\"10000000000\",\"phone\":\"13888888888\",\"postCode\":\"200000\",\"state\":0,\"updateDate\":1503047018000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"1000\"},{\"address\":\"浦东张江高科1号\",\"area\":\"北京\",\"createDate\":1499065424000,\"cusManager\":\"admin1\",\"dsdjh\":\"3242342423\",\"fax\":\"021-89898989\",\"fr\":\"赵老师\",\"gsdjh\":\"234234234\",\"id\":36,\"isValid\":1,\"khno\":\"KH20170703150344713\",\"khyh\":\"中国银行\",\"khzh\":\"89890100001010103947\",\"level\":\"普通客户\",\"myd\":\"☆\",\"name\":\"上海尚学堂浦东校区1\",\"nyye\":\"1\",\"phone\":\"13644443333\",\"postCode\":\"100027\",\"state\":0,\"updateDate\":1499065424000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"10000000\"},{\"address\":\"浦东张江高科1号11\",\"area\":\"上海\",\"createDate\":1499064974000,\"cusManager\":\"小明\",\"dsdjh\":\"3242342423\",\"fax\":\"021-89898989\",\"fr\":\"廖老师\",\"gsdjh\":\"234234234\",\"id\":35,\"isValid\":1,\"khno\":\"KH20170703145613140\",\"khyh\":\"中国银行\",\"khzh\":\"89890100001010103947\",\"level\":\"重点开发客户\",\"myd\":\"☆\",\"name\":\"上海尚学堂浦东校区\",\"nyye\":\"1\",\"phone\":\"13644443333\",\"postCode\":\"100027\",\"state\":0,\"updateDate\":1499065515000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"10000000\"},{\"address\":\"浦东新区\",\"area\":\"上海\",\"createDate\":1482827301000,\"cusManager\":\"zs\",\"dsdjh\":\"1000\",\"fax\":\"sxt@sxt.cn\",\"fr\":\"老裴\",\"gsdjh\":\"10000\",\"id\":34,\"isValid\":1,\"khno\":\"KH201612271628316\",\"khyh\":\"工商\",\"khzh\":\"100100000\",\"level\":\"战略合作伙伴\",\"myd\":\"☆☆☆☆☆\",\"name\":\"浦西尚学堂\",\"nyye\":\"22\",\"phone\":\"1001111\",\"postCode\":\"100100\",\"state\":0,\"updateDate\":1488431897000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"1001000\",\"zczj\":\"100\"},{\"address\":\"1111fsdf\",\"area\":\"上海\",\"createDate\":1451639356000,\"cusManager\":\"小红\",\"dsdjh\":\"4535213212\",\"fax\":\"111\",\"fr\":\"老宋\",\"gsdjh\":\"中国\",\"id\":30,\"isValid\":1,\"khno\":\"KH201609011709179\",\"khyh\":\"中国银行\",\"khzh\":\"6225231243641\",\"level\":\"大客户\",\"myd\":\"☆\",\"name\":\"天猫11\",\"nyye\":\"1000000\",\"phone\":\"11111\",\"postCode\":\"200233\",\"state\":1,\"updateDate\":1499161947000,\"webSite\":\"111\",\"xyd\":\"☆☆☆\",\"yyzzzch\":\"11\",\"zczj\":\"1000\"},{\"address\":\"上海市徐汇区虹梅路153\",\"area\":\"北京\",\"createDate\":1472034590000,\"cusManager\":\"小明\",\"dsdjh\":\"4535213212\",\"fax\":\"134\",\"fr\":\"老王\",\"gsdjh\":\"中国\",\"id\":29,\"isValid\":1,\"khno\":\"KH201608241829510\",\"khyh\":\"中国银行\",\"khzh\":\"123456456\",\"level\":\"重点开发客户\",\"myd\":\"☆☆☆☆☆\",\"name\":\"上海聪享科技1\",\"nyye\":\"10000\",\"phone\":\"13666666666\",\"postCode\":\"200233\",\"state\":0,\"updateDate\":1472035571000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆\",\"yyzzzch\":\"13344\",\"zczj\":\"100\"},{\"address\":\"62\",\"area\":\"上海\",\"createDate\":1477368939000,\"cusManager\":\"小张\",\"dsdjh\":\"132\",\"fax\":\"42\",\"fr\":\"7777\",\"gsdjh\":\"142\",\"id\":28,\"isValid\":1,\"khno\":\"KH20150729090910\",\"khyh\":\"102\",\"khzh\":\"1111\",\"level\":\"战略合作伙伴\",\"myd\":\"☆☆☆☆☆\",\"name\":\"sssss\",\"nyye\":\"sss\",\"phone\":\"32\",\"postCode\":\"22\",\"state\":0,\"updateDate\":1488451603000,\"webSite\":\"52\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"112\",\"zczj\":\"122\"},{\"address\":\"321\",\"area\":\"北京\",\"createDate\":1453695319000,\"cusManager\":\"小红\",\"dsdjh\":\"321\",\"fax\":\"321\",\"fr\":\"321\",\"gsdjh\":\"3213\",\"id\":16,\"isValid\":1,\"khno\":\"KH20150526073022\",\"khyh\":\"321\",\"khzh\":\"321\",\"level\":\"大客户\",\"myd\":\"☆\",\"name\":\"风驰科技\",\"nyye\":\"21\",\"phone\":\"321\",\"postCode\":\"21\",\"state\":2,\"updateDate\":1502268330000,\"webSite\":\"321\",\"xyd\":\"☆\",\"yyzzzch\":\"321\",\"zczj\":\"\"},{\"address\":\"北京海淀区双榆树东里15号\",\"area\":\"北京\",\"createDate\":1456370923000,\"cusManager\":\"小张\",\"dsdjh\":\"4422214321321\",\"fax\":\"010-62263393\",\"fr\":\"张三\",\"gsdjh\":\"4104322332\",\"id\":1,\"isValid\":1,\"khno\":\"KH21321321\",\"khyh\":\"中国银行\",\"khzh\":\"6225231243641\",\"level\":\"战略合作伙伴\",\"myd\":\"☆☆☆\",\"name\":\"北京大牛科技\",\"nyye\":\"1111\",\"phone\":\"010-62263393\",\"postCode\":\"100027\",\"state\":1,\"updateDate\":1488438414000,\"webSite\":\"www.daniu.com\",\"xyd\":\"☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"1000\"}]}' );
INSERT INTO `t_log`
VALUES
	( '173', '客户信息管理-分页查询', 'public java.util.Map com.shsxt.crm.controller.CustomerController.selectForPage(com.shsxt.crm.dto.CustomerQuery)', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{\"page\":[\"1\"],\"rows\":[\"10\"]}', '2017-08-19 10:26:45', '4', 'shsxt', '{\"total\":10,\"rows\":[{\"address\":\"浦东张江高科1号\",\"area\":\"上海\",\"createDate\":1503046805000,\"cusManager\":\"admin1\",\"dsdjh\":\"22\",\"fax\":\"021-89898989\",\"fr\":\"郑昊\",\"gsdjh\":\"22\",\"id\":39,\"isValid\":1,\"khno\":\"KH20170818170004820\",\"khyh\":\"农业银行\",\"khzh\":\"257687888\",\"level\":\"不小的客户1\",\"myd\":\"☆\",\"name\":\"尚学堂-郑昊\",\"nyye\":\"1\",\"phone\":\"13644443333\",\"postCode\":\"200000\",\"state\":0,\"updateDate\":1503047018000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"12000\"},{\"address\":\"荣乐中路2369弄42号\",\"area\":\"上海\",\"createDate\":1503046645000,\"cusManager\":\"小明\",\"dsdjh\":\"324234\",\"fax\":\"021-89898989\",\"fr\":\"李林\",\"gsdjh\":\"234234\",\"id\":38,\"isValid\":1,\"khno\":\"KH2017-08-18205\",\"khyh\":\"中国银行\",\"khzh\":\"12345677898990000\",\"level\":\"不小的客户1\",\"myd\":\"☆☆☆☆☆\",\"name\":\"尚学堂-李林学院\",\"nyye\":\"10000000000\",\"phone\":\"13888888888\",\"postCode\":\"200000\",\"state\":0,\"updateDate\":1503047018000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"1000\"},{\"address\":\"浦东张江高科1号\",\"area\":\"北京\",\"createDate\":1499065424000,\"cusManager\":\"admin1\",\"dsdjh\":\"3242342423\",\"fax\":\"021-89898989\",\"fr\":\"赵老师\",\"gsdjh\":\"234234234\",\"id\":36,\"isValid\":1,\"khno\":\"KH20170703150344713\",\"khyh\":\"中国银行\",\"khzh\":\"89890100001010103947\",\"level\":\"普通客户\",\"myd\":\"☆\",\"name\":\"上海尚学堂浦东校区1\",\"nyye\":\"1\",\"phone\":\"13644443333\",\"postCode\":\"100027\",\"state\":0,\"updateDate\":1499065424000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"10000000\"},{\"address\":\"浦东张江高科1号11\",\"area\":\"上海\",\"createDate\":1499064974000,\"cusManager\":\"小明\",\"dsdjh\":\"3242342423\",\"fax\":\"021-89898989\",\"fr\":\"廖老师\",\"gsdjh\":\"234234234\",\"id\":35,\"isValid\":1,\"khno\":\"KH20170703145613140\",\"khyh\":\"中国银行\",\"khzh\":\"89890100001010103947\",\"level\":\"重点开发客户\",\"myd\":\"☆\",\"name\":\"上海尚学堂浦东校区\",\"nyye\":\"1\",\"phone\":\"13644443333\",\"postCode\":\"100027\",\"state\":0,\"updateDate\":1499065515000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"10000000\"},{\"address\":\"浦东新区\",\"area\":\"上海\",\"createDate\":1482827301000,\"cusManager\":\"zs\",\"dsdjh\":\"1000\",\"fax\":\"sxt@sxt.cn\",\"fr\":\"老裴\",\"gsdjh\":\"10000\",\"id\":34,\"isValid\":1,\"khno\":\"KH201612271628316\",\"khyh\":\"工商\",\"khzh\":\"100100000\",\"level\":\"战略合作伙伴\",\"myd\":\"☆☆☆☆☆\",\"name\":\"浦西尚学堂\",\"nyye\":\"22\",\"phone\":\"1001111\",\"postCode\":\"100100\",\"state\":0,\"updateDate\":1488431897000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"1001000\",\"zczj\":\"100\"},{\"address\":\"1111fsdf\",\"area\":\"上海\",\"createDate\":1451639356000,\"cusManager\":\"小红\",\"dsdjh\":\"4535213212\",\"fax\":\"111\",\"fr\":\"老宋\",\"gsdjh\":\"中国\",\"id\":30,\"isValid\":1,\"khno\":\"KH201609011709179\",\"khyh\":\"中国银行\",\"khzh\":\"6225231243641\",\"level\":\"大客户\",\"myd\":\"☆\",\"name\":\"天猫11\",\"nyye\":\"1000000\",\"phone\":\"11111\",\"postCode\":\"200233\",\"state\":1,\"updateDate\":1499161947000,\"webSite\":\"111\",\"xyd\":\"☆☆☆\",\"yyzzzch\":\"11\",\"zczj\":\"1000\"},{\"address\":\"上海市徐汇区虹梅路153\",\"area\":\"北京\",\"createDate\":1472034590000,\"cusManager\":\"小明\",\"dsdjh\":\"4535213212\",\"fax\":\"134\",\"fr\":\"老王\",\"gsdjh\":\"中国\",\"id\":29,\"isValid\":1,\"khno\":\"KH201608241829510\",\"khyh\":\"中国银行\",\"khzh\":\"123456456\",\"level\":\"重点开发客户\",\"myd\":\"☆☆☆☆☆\",\"name\":\"上海聪享科技1\",\"nyye\":\"10000\",\"phone\":\"13666666666\",\"postCode\":\"200233\",\"state\":0,\"updateDate\":1472035571000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆\",\"yyzzzch\":\"13344\",\"zczj\":\"100\"},{\"address\":\"62\",\"area\":\"上海\",\"createDate\":1477368939000,\"cusManager\":\"小张\",\"dsdjh\":\"132\",\"fax\":\"42\",\"fr\":\"7777\",\"gsdjh\":\"142\",\"id\":28,\"isValid\":1,\"khno\":\"KH20150729090910\",\"khyh\":\"102\",\"khzh\":\"1111\",\"level\":\"战略合作伙伴\",\"myd\":\"☆☆☆☆☆\",\"name\":\"sssss\",\"nyye\":\"sss\",\"phone\":\"32\",\"postCode\":\"22\",\"state\":0,\"updateDate\":1488451603000,\"webSite\":\"52\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"112\",\"zczj\":\"122\"},{\"address\":\"321\",\"area\":\"北京\",\"createDate\":1453695319000,\"cusManager\":\"小红\",\"dsdjh\":\"321\",\"fax\":\"321\",\"fr\":\"321\",\"gsdjh\":\"3213\",\"id\":16,\"isValid\":1,\"khno\":\"KH20150526073022\",\"khyh\":\"321\",\"khzh\":\"321\",\"level\":\"大客户\",\"myd\":\"☆\",\"name\":\"风驰科技\",\"nyye\":\"21\",\"phone\":\"321\",\"postCode\":\"21\",\"state\":2,\"updateDate\":1502268330000,\"webSite\":\"321\",\"xyd\":\"☆\",\"yyzzzch\":\"321\",\"zczj\":\"\"},{\"address\":\"北京海淀区双榆树东里15号\",\"area\":\"北京\",\"createDate\":1456370923000,\"cusManager\":\"小张\",\"dsdjh\":\"4422214321321\",\"fax\":\"010-62263393\",\"fr\":\"张三\",\"gsdjh\":\"4104322332\",\"id\":1,\"isValid\":1,\"khno\":\"KH21321321\",\"khyh\":\"中国银行\",\"khzh\":\"6225231243641\",\"level\":\"战略合作伙伴\",\"myd\":\"☆☆☆\",\"name\":\"北京大牛科技\",\"nyye\":\"1111\",\"phone\":\"010-62263393\",\"postCode\":\"100027\",\"state\":1,\"updateDate\":1488438414000,\"webSite\":\"www.daniu.com\",\"xyd\":\"☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"1000\"}]}' );
INSERT INTO `t_log`
VALUES
	( '174', '营销机会管理', 'public java.lang.String com.shsxt.crm.controller.SaleChanceController.index(java.lang.Integer)', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{\"permission\":[\"1010\"]}', '2017-08-19 10:28:51', '8', 'shsxt', '\"sale_chance\"' );
INSERT INTO `t_log`
VALUES
	( '175', '营销机会管理-查询', 'public java.util.Map com.shsxt.crm.controller.SaleChanceController.list(com.shsxt.crm.dto.SaleChanceQuery)', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{\"page\":[\"1\"],\"rows\":[\"10\"]}', '2017-08-19 10:28:51', '12', 'shsxt', '{\"total\":34,\"paginator\":{\"endRow\":10,\"firstPage\":true,\"hasNextPage\":true,\"hasPrePage\":false,\"lastPage\":false,\"limit\":10,\"nextPage\":2,\"offset\":0,\"page\":1,\"prePage\":1,\"slider\":[1,2,3,4],\"startRow\":1,\"totalCount\":34,\"totalPages\":4},\"rows\":[{\"assignMan\":\"admin1\",\"assignTime\":1502670384000,\"cgjl\":80,\"chanceSource\":\"廖老师介绍\",\"createDate\":1502608217000,\"createMan\":\"shsxt\",\"customerId\":35,\"customerName\":\"上海尚学堂浦东校区\",\"description\":\"哈哈哈哈哈哈\",\"devResult\":1,\"id\":62,\"linkMan\":\"李壮壮\",\"linkPhone\":\"1366666666\",\"overview\":\"需要服务器5台\",\"state\":1},{\"assignMan\":\"\",\"cgjl\":89,\"chanceSource\":\"老裴推荐\",\"createDate\":1502608084000,\"createMan\":\"shsxt\",\"customerId\":34,\"customerName\":\"浦西尚学堂\",\"description\":\"水电费水电费水电费水电费\",\"devResult\":0,\"id\":61,\"linkMan\":\"老裴\",\"linkPhone\":\"13999999999\",\"overview\":\"需要服务器5台\",\"state\":0},{\"assignMan\":\"小明\",\"assignTime\":1502352310000,\"cgjl\":80,\"chanceSource\":\"友情推荐\",\"createDate\":1502352310000,\"createMan\":\"shsxt\",\"customerId\":16,\"customerName\":\"风驰科技\",\"description\":\"老裴公司需要服务器多少多少台\",\"devResult\":0,\"id\":60,\"linkMan\":\"老裴\",\"linkPhone\":\"1366666666\",\"overview\":\"需要服务若干台\",\"state\":1},{\"assignMan\":\"小明\",\"assignTime\":1498696011000,\"cgjl\":10,\"chanceSource\":\"胜多负少\",\"createDate\":1498204647000,\"createMan\":\"shsxt\",\"customerId\":1,\"customerName\":\"1\",\"description\":\"水电费\",\"devResult\":3,\"id\":57,\"linkMan\":\" 水电费\",\"linkPhone\":\"13888888888\",\"overview\":\"水电费\",\"state\":1},{\"assignMan\":\"admin\",\"assignTime\":1488366620000,\"chanceSource\":\"\",\"createDate\":1488366620000,\"createMan\":\"Tony\",\"customerName\":\"wwwwwwww\",\"description\":\"\",\"devResult\":2,\"id\":56,\"linkMan\":\"\",\"linkPhone\":\"\",\"overview\":\"\",\"state\":1},{\"assignMan\":\"admin\",\"assignTime\":1488366298000,\"chanceSource\":\"\",\"createDate\":1488366298000,\"createMan\":\"\",\"customerName\":\"asad\",\"description\":\"\",\"devResult\":0,\"id\":53,\"linkMan\":\"10\",\"linkPhone\":\"\",\"overview\":\"\",\"state\":1},{\"assignMan\":\"admin\",\"assignTime\":1488366208000,\"chanceSource\":\"\",\"createDate\":1488366208000,\"createMan\":\"\",\"customerName\":\"sada\",\"description\":\"\",\"id\":52,\"linkMan\":\"\",\"linkPhone\":\"\",\"overview\":\"\",\"state\":1},{\"assignMan\":\"\",\"cgjl\":12,\"chanceSource\":\"\",\"createDate\":1488366104000,\"createMan\":\"\",\"customerName\":\"sadsa\",\"description\":\"\",\"id\":51,\"linkMan\":\"\",\"linkPhone\":\"\",\"overview\":\"\"},{\"assignMan\":\"admin\",\"assignTime\":1488366001000,\"chanceSource\":\"\",\"createDate\":1488366001000,\"createMan\":\"\",\"customerName\":\"sadads\",\"description\":\"\",\"devResult\":0,\"id\":50,\"linkMan\":\"\",\"linkPhone\":\"\",\"overview\":\"\",\"state\":1},{\"assignMan\":\"\",\"cgjl\":10,\"chanceSource\":\"\",\"createDate\":1488365783000,\"createMan\":\"\",\"customerName\":\"\",\"description\":\"\",\"id\":47,\"linkMan\":\"sadsad\",\"linkPhone\":\"\",\"overview\":\"\"}]}' );
INSERT INTO `t_log`
VALUES
	( '176', '营销机会管理', 'public java.lang.String com.shsxt.crm.controller.SaleChanceController.index(java.lang.Integer)', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{\"state\":[\"1\"]}', '2017-08-19 10:28:52', '0', 'shsxt', '\"sale_chance_assignment\"' );
INSERT INTO `t_log`
VALUES
	( '177', '营销机会管理-查询', 'public java.util.Map com.shsxt.crm.controller.SaleChanceController.list(com.shsxt.crm.dto.SaleChanceQuery)', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{\"state\":[\"1\"],\"page\":[\"1\"],\"rows\":[\"10\"]}', '2017-08-19 10:28:52', '7', 'shsxt', '{\"total\":23,\"paginator\":{\"endRow\":10,\"firstPage\":true,\"hasNextPage\":true,\"hasPrePage\":false,\"lastPage\":false,\"limit\":10,\"nextPage\":2,\"offset\":0,\"page\":1,\"prePage\":1,\"slider\":[1,2,3],\"startRow\":1,\"totalCount\":23,\"totalPages\":3},\"rows\":[{\"assignMan\":\"admin1\",\"assignTime\":1502670384000,\"cgjl\":80,\"chanceSource\":\"廖老师介绍\",\"createDate\":1502608217000,\"createMan\":\"shsxt\",\"customerId\":35,\"customerName\":\"上海尚学堂浦东校区\",\"description\":\"哈哈哈哈哈哈\",\"devResult\":1,\"id\":62,\"linkMan\":\"李壮壮\",\"linkPhone\":\"1366666666\",\"overview\":\"需要服务器5台\",\"state\":1},{\"assignMan\":\"小明\",\"assignTime\":1502352310000,\"cgjl\":80,\"chanceSource\":\"友情推荐\",\"createDate\":1502352310000,\"createMan\":\"shsxt\",\"customerId\":16,\"customerName\":\"风驰科技\",\"description\":\"老裴公司需要服务器多少多少台\",\"devResult\":0,\"id\":60,\"linkMan\":\"老裴\",\"linkPhone\":\"1366666666\",\"overview\":\"需要服务若干台\",\"state\":1},{\"assignMan\":\"小明\",\"assignTime\":1498696011000,\"cgjl\":10,\"chanceSource\":\"胜多负少\",\"createDate\":1498204647000,\"createMan\":\"shsxt\",\"customerId\":1,\"customerName\":\"1\",\"description\":\"水电费\",\"devResult\":3,\"id\":57,\"linkMan\":\" 水电费\",\"linkPhone\":\"13888888888\",\"overview\":\"水电费\",\"state\":1},{\"assignMan\":\"admin\",\"assignTime\":1488366620000,\"chanceSource\":\"\",\"createDate\":1488366620000,\"createMan\":\"Tony\",\"customerName\":\"wwwwwwww\",\"description\":\"\",\"devResult\":2,\"id\":56,\"linkMan\":\"\",\"linkPhone\":\"\",\"overview\":\"\",\"state\":1},{\"assignMan\":\"admin\",\"assignTime\":1488366298000,\"chanceSource\":\"\",\"createDate\":1488366298000,\"createMan\":\"\",\"customerName\":\"asad\",\"description\":\"\",\"devResult\":0,\"id\":53,\"linkMan\":\"10\",\"linkPhone\":\"\",\"overview\":\"\",\"state\":1},{\"assignMan\":\"admin\",\"assignTime\":1488366208000,\"chanceSource\":\"\",\"createDate\":1488366208000,\"createMan\":\"\",\"customerName\":\"sada\",\"description\":\"\",\"id\":52,\"linkMan\":\"\",\"linkPhone\":\"\",\"overview\":\"\",\"state\":1},{\"assignMan\":\"admin\",\"assignTime\":1488366001000,\"chanceSource\":\"\",\"createDate\":1488366001000,\"createMan\":\"\",\"customerName\":\"sadads\",\"description\":\"\",\"devResult\":0,\"id\":50,\"linkMan\":\"\",\"linkPhone\":\"\",\"overview\":\"\",\"state\":1},{\"assignMan\":\"admin\",\"assignTime\":1488365575000,\"chanceSource\":\"\",\"createDate\":1488365575000,\"createMan\":\"\",\"customerName\":\"saassa\",\"description\":\"\",\"devResult\":0,\"id\":46,\"linkMan\":\"\",\"linkPhone\":\"\",\"overview\":\"\",\"state\":1},{\"assignMan\":\"admin\",\"assignTime\":1488363320000,\"cgjl\":100,\"chanceSource\":\"Tree\",\"createDate\":1488363320000,\"createMan\":\"\",\"customerName\":\"tree\",\"description\":\"Tree\",\"devResult\":0,\"id\":40,\"linkMan\":\"Tree\",\"linkPhone\":\"123456\",\"overview\":\"Tree\",\"state\":1},{\"assignMan\":\"admin\",\"assignTime\":1488342155000,\"cgjl\":22,\"chanceSource\":\"sawork\",\"createDate\":1488342155000,\"createMan\":\"\",\"customerName\":\"sawork\",\"description\":\"sakl\",\"devResult\":0,\"id\":39,\"linkMan\":\"sawo\",\"linkPhone\":\"12345\",\"overview\":\"sakl\",\"state\":1}]}' );
INSERT INTO `t_log`
VALUES
	( '178', '客户信息管理', 'public java.lang.String com.shsxt.crm.controller.CustomerController.index()', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-08-19 11:07:16', '6', 'shsxt', '\"customer\"' );
INSERT INTO `t_log`
VALUES
	( '179', '客户信息管理-分页查询', 'public java.util.Map com.shsxt.crm.controller.CustomerController.selectForPage(com.shsxt.crm.dto.CustomerQuery)', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{\"page\":[\"1\"],\"rows\":[\"10\"]}', '2017-08-19 11:07:17', '52', 'shsxt', '{\"total\":10,\"rows\":[{\"address\":\"浦东张江高科1号\",\"area\":\"上海\",\"createDate\":1503046805000,\"cusManager\":\"admin1\",\"dsdjh\":\"22\",\"fax\":\"021-89898989\",\"fr\":\"郑昊\",\"gsdjh\":\"22\",\"id\":39,\"isValid\":1,\"khno\":\"KH20170818170004820\",\"khyh\":\"农业银行\",\"khzh\":\"257687888\",\"level\":\"不小的客户1\",\"myd\":\"☆\",\"name\":\"尚学堂-郑昊\",\"nyye\":\"1\",\"phone\":\"13644443333\",\"postCode\":\"200000\",\"state\":0,\"updateDate\":1503047018000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"12000\"},{\"address\":\"荣乐中路2369弄42号\",\"area\":\"上海\",\"createDate\":1503046645000,\"cusManager\":\"小明\",\"dsdjh\":\"324234\",\"fax\":\"021-89898989\",\"fr\":\"李林\",\"gsdjh\":\"234234\",\"id\":38,\"isValid\":1,\"khno\":\"KH2017-08-18205\",\"khyh\":\"中国银行\",\"khzh\":\"12345677898990000\",\"level\":\"不小的客户1\",\"myd\":\"☆☆☆☆☆\",\"name\":\"尚学堂-李林学院\",\"nyye\":\"10000000000\",\"phone\":\"13888888888\",\"postCode\":\"200000\",\"state\":0,\"updateDate\":1503047018000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"1000\"},{\"address\":\"浦东张江高科1号\",\"area\":\"北京\",\"createDate\":1499065424000,\"cusManager\":\"admin1\",\"dsdjh\":\"3242342423\",\"fax\":\"021-89898989\",\"fr\":\"赵老师\",\"gsdjh\":\"234234234\",\"id\":36,\"isValid\":1,\"khno\":\"KH20170703150344713\",\"khyh\":\"中国银行\",\"khzh\":\"89890100001010103947\",\"level\":\"普通客户\",\"myd\":\"☆\",\"name\":\"上海尚学堂浦东校区1\",\"nyye\":\"1\",\"phone\":\"13644443333\",\"postCode\":\"100027\",\"state\":0,\"updateDate\":1499065424000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"10000000\"},{\"address\":\"浦东张江高科1号11\",\"area\":\"上海\",\"createDate\":1499064974000,\"cusManager\":\"小明\",\"dsdjh\":\"3242342423\",\"fax\":\"021-89898989\",\"fr\":\"廖老师\",\"gsdjh\":\"234234234\",\"id\":35,\"isValid\":1,\"khno\":\"KH20170703145613140\",\"khyh\":\"中国银行\",\"khzh\":\"89890100001010103947\",\"level\":\"重点开发客户\",\"myd\":\"☆\",\"name\":\"上海尚学堂浦东校区\",\"nyye\":\"1\",\"phone\":\"13644443333\",\"postCode\":\"100027\",\"state\":0,\"updateDate\":1499065515000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"10000000\"},{\"address\":\"浦东新区\",\"area\":\"上海\",\"createDate\":1482827301000,\"cusManager\":\"zs\",\"dsdjh\":\"1000\",\"fax\":\"sxt@sxt.cn\",\"fr\":\"老裴\",\"gsdjh\":\"10000\",\"id\":34,\"isValid\":1,\"khno\":\"KH201612271628316\",\"khyh\":\"工商\",\"khzh\":\"100100000\",\"level\":\"战略合作伙伴\",\"myd\":\"☆☆☆☆☆\",\"name\":\"浦西尚学堂\",\"nyye\":\"22\",\"phone\":\"1001111\",\"postCode\":\"100100\",\"state\":0,\"updateDate\":1488431897000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"1001000\",\"zczj\":\"100\"},{\"address\":\"1111fsdf\",\"area\":\"上海\",\"createDate\":1451639356000,\"cusManager\":\"小红\",\"dsdjh\":\"4535213212\",\"fax\":\"111\",\"fr\":\"老宋\",\"gsdjh\":\"中国\",\"id\":30,\"isValid\":1,\"khno\":\"KH201609011709179\",\"khyh\":\"中国银行\",\"khzh\":\"6225231243641\",\"level\":\"大客户\",\"myd\":\"☆\",\"name\":\"天猫11\",\"nyye\":\"1000000\",\"phone\":\"11111\",\"postCode\":\"200233\",\"state\":1,\"updateDate\":1499161947000,\"webSite\":\"111\",\"xyd\":\"☆☆☆\",\"yyzzzch\":\"11\",\"zczj\":\"1000\"},{\"address\":\"上海市徐汇区虹梅路153\",\"area\":\"北京\",\"createDate\":1472034590000,\"cusManager\":\"小明\",\"dsdjh\":\"4535213212\",\"fax\":\"134\",\"fr\":\"老王\",\"gsdjh\":\"中国\",\"id\":29,\"isValid\":1,\"khno\":\"KH201608241829510\",\"khyh\":\"中国银行\",\"khzh\":\"123456456\",\"level\":\"重点开发客户\",\"myd\":\"☆☆☆☆☆\",\"name\":\"上海聪享科技1\",\"nyye\":\"10000\",\"phone\":\"13666666666\",\"postCode\":\"200233\",\"state\":0,\"updateDate\":1472035571000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆\",\"yyzzzch\":\"13344\",\"zczj\":\"100\"},{\"address\":\"62\",\"area\":\"上海\",\"createDate\":1477368939000,\"cusManager\":\"小张\",\"dsdjh\":\"132\",\"fax\":\"42\",\"fr\":\"7777\",\"gsdjh\":\"142\",\"id\":28,\"isValid\":1,\"khno\":\"KH20150729090910\",\"khyh\":\"102\",\"khzh\":\"1111\",\"level\":\"战略合作伙伴\",\"myd\":\"☆☆☆☆☆\",\"name\":\"sssss\",\"nyye\":\"sss\",\"phone\":\"32\",\"postCode\":\"22\",\"state\":0,\"updateDate\":1488451603000,\"webSite\":\"52\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"112\",\"zczj\":\"122\"},{\"address\":\"321\",\"area\":\"北京\",\"createDate\":1453695319000,\"cusManager\":\"小红\",\"dsdjh\":\"321\",\"fax\":\"321\",\"fr\":\"321\",\"gsdjh\":\"3213\",\"id\":16,\"isValid\":1,\"khno\":\"KH20150526073022\",\"khyh\":\"321\",\"khzh\":\"321\",\"level\":\"大客户\",\"myd\":\"☆\",\"name\":\"风驰科技\",\"nyye\":\"21\",\"phone\":\"321\",\"postCode\":\"21\",\"state\":2,\"updateDate\":1502268330000,\"webSite\":\"321\",\"xyd\":\"☆\",\"yyzzzch\":\"321\",\"zczj\":\"\"},{\"address\":\"北京海淀区双榆树东里15号\",\"area\":\"北京\",\"createDate\":1456370923000,\"cusManager\":\"小张\",\"dsdjh\":\"4422214321321\",\"fax\":\"010-62263393\",\"fr\":\"张三\",\"gsdjh\":\"4104322332\",\"id\":1,\"isValid\":1,\"khno\":\"KH21321321\",\"khyh\":\"中国银行\",\"khzh\":\"6225231243641\",\"level\":\"战略合作伙伴\",\"myd\":\"☆☆☆\",\"name\":\"北京大牛科技\",\"nyye\":\"1111\",\"phone\":\"010-62263393\",\"postCode\":\"100027\",\"state\":1,\"updateDate\":1488438414000,\"webSite\":\"www.daniu.com\",\"xyd\":\"☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"1000\"}]}' );
INSERT INTO `t_log`
VALUES
	( '180', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-08-21 09:06:11', '2', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '181', '首页', 'main', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-08-21 10:57:36', '3', 'shsxt', '\"main\"' );
INSERT INTO `t_log`
VALUES
	( '182', '客户信息管理', 'public java.lang.String com.shsxt.crm.controller.CustomerController.index()', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{}', '2017-08-21 11:36:34', '6', 'shsxt', '\"customer\"' );
INSERT INTO `t_log`
VALUES
	( '183', '客户信息管理-分页查询', 'public java.util.Map com.shsxt.crm.controller.CustomerController.selectForPage(com.shsxt.crm.dto.CustomerQuery)', '0', '0:0:0:0:0:0:0:1', NULL, NULL, '{\"page\":[\"1\"],\"rows\":[\"10\"]}', '2017-08-21 11:36:35', '8', 'shsxt', '{\"total\":10,\"rows\":[{\"address\":\"浦东张江高科1号\",\"area\":\"上海\",\"createDate\":1503046805000,\"cusManager\":\"admin1\",\"dsdjh\":\"22\",\"fax\":\"021-89898989\",\"fr\":\"郑昊\",\"gsdjh\":\"22\",\"id\":39,\"isValid\":1,\"khno\":\"KH20170818170004820\",\"khyh\":\"农业银行\",\"khzh\":\"257687888\",\"level\":\"不小的客户1\",\"myd\":\"☆\",\"name\":\"尚学堂-郑昊\",\"nyye\":\"1\",\"phone\":\"13644443333\",\"postCode\":\"200000\",\"state\":0,\"updateDate\":1503047018000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"12000\"},{\"address\":\"荣乐中路2369弄42号\",\"area\":\"上海\",\"createDate\":1503046645000,\"cusManager\":\"小明\",\"dsdjh\":\"324234\",\"fax\":\"021-89898989\",\"fr\":\"李林\",\"gsdjh\":\"234234\",\"id\":38,\"isValid\":1,\"khno\":\"KH2017-08-18205\",\"khyh\":\"中国银行\",\"khzh\":\"12345677898990000\",\"level\":\"不小的客户1\",\"myd\":\"☆☆☆☆☆\",\"name\":\"尚学堂-李林学院\",\"nyye\":\"10000000000\",\"phone\":\"13888888888\",\"postCode\":\"200000\",\"state\":0,\"updateDate\":1503047018000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"1000\"},{\"address\":\"浦东张江高科1号\",\"area\":\"北京\",\"createDate\":1499065424000,\"cusManager\":\"admin1\",\"dsdjh\":\"3242342423\",\"fax\":\"021-89898989\",\"fr\":\"赵老师\",\"gsdjh\":\"234234234\",\"id\":36,\"isValid\":1,\"khno\":\"KH20170703150344713\",\"khyh\":\"中国银行\",\"khzh\":\"89890100001010103947\",\"level\":\"普通客户\",\"myd\":\"☆\",\"name\":\"上海尚学堂浦东校区1\",\"nyye\":\"1\",\"phone\":\"13644443333\",\"postCode\":\"100027\",\"state\":0,\"updateDate\":1499065424000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"10000000\"},{\"address\":\"浦东张江高科1号11\",\"area\":\"上海\",\"createDate\":1499064974000,\"cusManager\":\"小明\",\"dsdjh\":\"3242342423\",\"fax\":\"021-89898989\",\"fr\":\"廖老师\",\"gsdjh\":\"234234234\",\"id\":35,\"isValid\":1,\"khno\":\"KH20170703145613140\",\"khyh\":\"中国银行\",\"khzh\":\"89890100001010103947\",\"level\":\"重点开发客户\",\"myd\":\"☆\",\"name\":\"上海尚学堂浦东校区\",\"nyye\":\"1\",\"phone\":\"13644443333\",\"postCode\":\"100027\",\"state\":0,\"updateDate\":1499065515000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"10000000\"},{\"address\":\"浦东新区\",\"area\":\"上海\",\"createDate\":1482827301000,\"cusManager\":\"zs\",\"dsdjh\":\"1000\",\"fax\":\"sxt@sxt.cn\",\"fr\":\"老裴\",\"gsdjh\":\"10000\",\"id\":34,\"isValid\":1,\"khno\":\"KH201612271628316\",\"khyh\":\"工商\",\"khzh\":\"100100000\",\"level\":\"战略合作伙伴\",\"myd\":\"☆☆☆☆☆\",\"name\":\"浦西尚学堂\",\"nyye\":\"22\",\"phone\":\"1001111\",\"postCode\":\"100100\",\"state\":0,\"updateDate\":1488431897000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"1001000\",\"zczj\":\"100\"},{\"address\":\"1111fsdf\",\"area\":\"上海\",\"createDate\":1451639356000,\"cusManager\":\"小红\",\"dsdjh\":\"4535213212\",\"fax\":\"111\",\"fr\":\"老宋\",\"gsdjh\":\"中国\",\"id\":30,\"isValid\":1,\"khno\":\"KH201609011709179\",\"khyh\":\"中国银行\",\"khzh\":\"6225231243641\",\"level\":\"大客户\",\"myd\":\"☆\",\"name\":\"天猫11\",\"nyye\":\"1000000\",\"phone\":\"11111\",\"postCode\":\"200233\",\"state\":1,\"updateDate\":1499161947000,\"webSite\":\"111\",\"xyd\":\"☆☆☆\",\"yyzzzch\":\"11\",\"zczj\":\"1000\"},{\"address\":\"上海市徐汇区虹梅路153\",\"area\":\"北京\",\"createDate\":1472034590000,\"cusManager\":\"小明\",\"dsdjh\":\"4535213212\",\"fax\":\"134\",\"fr\":\"老王\",\"gsdjh\":\"中国\",\"id\":29,\"isValid\":1,\"khno\":\"KH201608241829510\",\"khyh\":\"中国银行\",\"khzh\":\"123456456\",\"level\":\"重点开发客户\",\"myd\":\"☆☆☆☆☆\",\"name\":\"上海聪享科技1\",\"nyye\":\"10000\",\"phone\":\"13666666666\",\"postCode\":\"200233\",\"state\":0,\"updateDate\":1472035571000,\"webSite\":\"www.shsxt.com\",\"xyd\":\"☆\",\"yyzzzch\":\"13344\",\"zczj\":\"100\"},{\"address\":\"62\",\"area\":\"上海\",\"createDate\":1477368939000,\"cusManager\":\"小张\",\"dsdjh\":\"132\",\"fax\":\"42\",\"fr\":\"7777\",\"gsdjh\":\"142\",\"id\":28,\"isValid\":1,\"khno\":\"KH20150729090910\",\"khyh\":\"102\",\"khzh\":\"1111\",\"level\":\"战略合作伙伴\",\"myd\":\"☆☆☆☆☆\",\"name\":\"sssss\",\"nyye\":\"sss\",\"phone\":\"32\",\"postCode\":\"22\",\"state\":0,\"updateDate\":1488451603000,\"webSite\":\"52\",\"xyd\":\"☆☆☆☆☆\",\"yyzzzch\":\"112\",\"zczj\":\"122\"},{\"address\":\"321\",\"area\":\"北京\",\"createDate\":1453695319000,\"cusManager\":\"小红\",\"dsdjh\":\"321\",\"fax\":\"321\",\"fr\":\"321\",\"gsdjh\":\"3213\",\"id\":16,\"isValid\":1,\"khno\":\"KH20150526073022\",\"khyh\":\"321\",\"khzh\":\"321\",\"level\":\"大客户\",\"myd\":\"☆\",\"name\":\"风驰科技\",\"nyye\":\"21\",\"phone\":\"321\",\"postCode\":\"21\",\"state\":2,\"updateDate\":1502268330000,\"webSite\":\"321\",\"xyd\":\"☆\",\"yyzzzch\":\"321\",\"zczj\":\"\"},{\"address\":\"北京海淀区双榆树东里15号\",\"area\":\"北京\",\"createDate\":1456370923000,\"cusManager\":\"小张\",\"dsdjh\":\"4422214321321\",\"fax\":\"010-62263393\",\"fr\":\"张三\",\"gsdjh\":\"4104322332\",\"id\":1,\"isValid\":1,\"khno\":\"KH21321321\",\"khyh\":\"中国银行\",\"khzh\":\"6225231243641\",\"level\":\"战略合作伙伴\",\"myd\":\"☆☆☆\",\"name\":\"北京大牛科技\",\"nyye\":\"1111\",\"phone\":\"010-62263393\",\"postCode\":\"100027\",\"state\":1,\"updateDate\":1488438414000,\"webSite\":\"www.daniu.com\",\"xyd\":\"☆☆☆\",\"yyzzzch\":\"420103000057404\",\"zczj\":\"1000\"}]}' );-- ----------------------------
-- Table structure for t_module
-- ----------------------------
DROP TABLE
IF
	EXISTS `t_module`;
CREATE TABLE `t_module` (
	`id` INT ( 11 ) NOT NULL AUTO_INCREMENT,
	`module_name` VARCHAR ( 255 ) DEFAULT NULL COMMENT '资源名称',
	`module_style` VARCHAR ( 255 ) DEFAULT NULL COMMENT '模块样式',
	`url` VARCHAR ( 255 ) DEFAULT NULL COMMENT '地址',
	`parent_id` INT ( 11 ) DEFAULT NULL,
	`parent_opt_value` VARCHAR ( 255 ) DEFAULT NULL,
	`grade` INT ( 255 ) DEFAULT NULL COMMENT '等级',
	`opt_value` VARCHAR ( 255 ) DEFAULT NULL COMMENT '权限值',
	`orders` INT ( 11 ) DEFAULT NULL,
	`is_valid` TINYINT ( 4 ) DEFAULT NULL,
	`create_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
	`update_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY ( `id` ) 
) ENGINE = INNODB AUTO_INCREMENT = 36 DEFAULT CHARSET = utf8mb4;-- ----------------------------
-- Records of t_module
-- ----------------------------
INSERT INTO `t_module`
VALUES
	( '1', '营销管理', 'yxgl', '#', NULL, NULL, '0', '10', '1', '1', '2017-07-01 10:23:14', '2017-07-01 10:23:14' );
INSERT INTO `t_module`
VALUES
	( '2', '营销机会管理', 'icon-yxjhgl', 'sale_chance/index', '1', NULL, '1', '1010', '1', '1', '2017-07-01 10:26:46', '2017-07-01 10:26:46' );
INSERT INTO `t_module`
VALUES
	( '3', '添加', '1111', '#', '2', NULL, '2', '101001', '1', '1', '2017-08-15 16:45:58', '2017-08-15 16:45:58' );
INSERT INTO `t_module`
VALUES
	( '4', '修改', '', '#', '2', NULL, '2', '101002', '2', '1', '2017-07-01 10:27:38', '2017-07-01 10:27:38' );
INSERT INTO `t_module`
VALUES
	( '5', '删除', '', '#', '2', NULL, '2', '101003', '3', '1', '2017-07-01 10:27:59', '2017-07-01 10:27:59' );
INSERT INTO `t_module`
VALUES
	( '6', '客户开发计划', 'icon-khkfjh', 'sale_chance/index?sate=1', '1', NULL, '1', '1020', '2', '1', '2017-07-01 10:28:32', '2017-07-01 10:28:32' );
INSERT INTO `t_module`
VALUES
	( '7', '查看详情', '', '#', '6', NULL, '2', '102001', '1', '1', '2017-07-01 10:29:02', '2017-07-01 10:29:02' );
INSERT INTO `t_module`
VALUES
	( '8', '客户管理', 'icon-khgl', 'customer_serve/index', NULL, NULL, '0', '20', '2', '1', '2018-11-03 21:37:05', '2018-11-03 21:37:05' );
INSERT INTO `t_module`
VALUES
	( '9', '客户信息管理', 'icon-khxxgl', 'customer/index', '8', NULL, '1', '2010', '1', '1', '2017-07-01 10:30:14', '2017-07-01 10:30:14' );
INSERT INTO `t_module`
VALUES
	( '10', '创建', '', '#', '9', NULL, '2', '201001', '1', '1', '2017-07-01 10:58:29', '2017-07-01 10:58:29' );
INSERT INTO `t_module`
VALUES
	( '11', '修改', '', '#', '9', NULL, '2', '201002', '2', '1', '2017-07-01 10:58:56', '2017-07-01 10:58:56' );
INSERT INTO `t_module`
VALUES
	( '12', '客户流失管理', 'icon-fhlsgl', 'customerloss/index', '8', NULL, '1', '2020', '2', '1', '2017-08-17 14:55:06', '2017-08-17 14:55:06' );
INSERT INTO `t_module`
VALUES
	( '14', '统计报表', 'icon-tjbb', '#', NULL, NULL, '0', '40', '4', '1', '2017-08-15 16:24:24', '2017-08-15 16:24:24' );
INSERT INTO `t_module`
VALUES
	( '15', '客户贡献分析', 'icon-khgxfx', 'report/1', '14', NULL, '1', '4010', '1', '1', '2017-08-15 16:25:12', '2017-08-15 16:25:12' );
INSERT INTO `t_module`
VALUES
	( '16', '服务管理', '', '#', NULL, NULL, '0', '30', '3', '1', '2017-08-18 11:49:02', '2017-08-18 11:49:02' );
INSERT INTO `t_module`
VALUES
	( '17', '基础数据管理', '', '#', NULL, NULL, '0', '50', '5', '1', '2017-08-18 11:49:45', '2017-08-18 11:49:45' );
INSERT INTO `t_module`
VALUES
	( '18', '系统管理', '', '#', NULL, NULL, '0', '60', '6', '1', '2018-11-04 15:25:02', '2018-11-04 15:25:03' );
INSERT INTO `t_module`
VALUES
	( '19', '删除', '', '#', '9', NULL, '2', '201003', '3', '1', '2017-08-18 17:03:03', '2017-08-18 17:03:03' );
INSERT INTO `t_module`
VALUES
	( '25', '修改密码', '', '1', '18', '', '1', '6040', '1', '1', '2018-11-04 15:08:21', '2018-11-04 15:08:21' );
INSERT INTO `t_module`
VALUES
	( '26', '安全退出', '1', '1', '18', '', '1', '6050', '1', '1', '2018-11-04 15:08:37', '2018-11-04 15:08:37' );
INSERT INTO `t_module`
VALUES
	( '27', '模块管理', '1', '1', '18', '', '1', '6030', '1', '1', '2018-11-04 15:15:40', '2018-11-04 15:15:40' );
INSERT INTO `t_module`
VALUES
	( '28', '角色管理', '11', '1', '18', '', '1', '6020', '1', '1', '2018-11-04 15:16:00', '2018-11-04 15:16:00' );
INSERT INTO `t_module`
VALUES
	( '29', '用户管理', '1', '1', '18', '', '1', '6010', '1', '1', '2018-11-04 15:16:25', '2018-11-04 15:16:25' );
INSERT INTO `t_module`
VALUES
	( '30', '客户服务分析', '321', '321', '8', '', '1', '4030', '4', '1', '2018-11-05 14:19:35', '2018-11-05 14:19:35' );
INSERT INTO `t_module`
VALUES
	( '35', '服务创建', '123', '123', '16', '', '1', '3010', '3', '1', '2018-11-06 15:50:59', '2018-11-06 15:50:59' );-- ----------------------------
-- Table structure for t_order_details
-- ----------------------------
DROP TABLE
IF
	EXISTS `t_order_details`;
CREATE TABLE `t_order_details` (
	`id` INT ( 11 ) NOT NULL AUTO_INCREMENT,
	`order_id` INT ( 11 ) DEFAULT NULL,
	`goods_name` VARCHAR ( 100 ) DEFAULT NULL,
	`goods_num` INT ( 11 ) DEFAULT NULL,
	`unit` VARCHAR ( 20 ) DEFAULT NULL,
	`price` FLOAT DEFAULT NULL,
	`sum` FLOAT DEFAULT NULL,
	`is_valid` INT ( 4 ) DEFAULT '1',
	`create_date` datetime DEFAULT NULL,
	`update_date` datetime DEFAULT NULL,
	PRIMARY KEY ( `id` ) 
) ENGINE = INNODB AUTO_INCREMENT = 11 DEFAULT CHARSET = utf8;-- ----------------------------
-- Records of t_order_details
-- ----------------------------
INSERT INTO `t_order_details`
VALUES
	( '1', '5', '联想笔记本', '2', '台', '4900', '9800', '1', '2016-11-29 14:59:32', '2016-11-29 14:59:34' );
INSERT INTO `t_order_details`
VALUES
	( '2', '5', '惠普音响', '4', '台', '200', '800', '1', NULL, NULL );
INSERT INTO `t_order_details`
VALUES
	( '3', '5', '罗技键盘', '10', '个', '90', '900', '1', NULL, NULL );
INSERT INTO `t_order_details`
VALUES
	( '4', '6', '艾利鼠标', '20', '个', '20', '400', '1', NULL, NULL );
INSERT INTO `t_order_details`
VALUES
	( '5', '6', '东芝U盘', '5', '个', '105', '525', '1', NULL, NULL );
INSERT INTO `t_order_details`
VALUES
	( '6', '6', '充电器', '1', '个', '30', '30', '1', NULL, NULL );
INSERT INTO `t_order_details`
VALUES
	( '7', '7', '笔记本', '10', '台', '3999', '39990', '1', '2018-10-28 16:22:46', '2018-10-28 16:22:49' );
INSERT INTO `t_order_details`
VALUES
	( '8', '7', '桌椅', '50', '套', '100', '5000', '1', '2018-10-28 16:22:46', '2018-10-28 16:22:49' );
INSERT INTO `t_order_details`
VALUES
	( '9', '8', '台式电脑', '10', '台', '5999', '59990', '1', '2018-10-30 17:41:41', NULL );
INSERT INTO `t_order_details`
VALUES
	( '10', '8', '笔记本', '10', '台', '3999', '39990', '1', '2018-10-30 17:41:41', NULL );-- ----------------------------
-- Table structure for t_permission
-- ----------------------------
DROP TABLE
IF
	EXISTS `t_permission`;
CREATE TABLE `t_permission` (
	`id` INT ( 11 ) NOT NULL AUTO_INCREMENT,
	`role_id` INT ( 11 ) DEFAULT NULL COMMENT '角色ID',
	`module_id` INT ( 11 ) DEFAULT NULL COMMENT '模块ID',
	`acl_value` VARCHAR ( 255 ) DEFAULT NULL COMMENT '权限值',
	`create_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
	`update_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
	`is_valid` TINYINT ( 4 ) DEFAULT NULL,
	PRIMARY KEY ( `id` ) 
) ENGINE = INNODB AUTO_INCREMENT = 598 DEFAULT CHARSET = utf8mb4;-- ----------------------------
-- Records of t_permission
-- ----------------------------
INSERT INTO `t_permission`
VALUES
	( '34', '14', '1', '10', '2017-08-18 09:11:36', '2017-08-18 09:11:36', '1' );
INSERT INTO `t_permission`
VALUES
	( '35', '14', '2', '1010', '2017-08-18 09:11:36', '2017-08-18 09:11:36', '1' );
INSERT INTO `t_permission`
VALUES
	( '36', '14', '3', '101001', '2017-08-18 09:11:36', '2017-08-18 09:11:36', '1' );
INSERT INTO `t_permission`
VALUES
	( '38', '14', '5', '101003', '2017-08-18 09:11:36', '2017-08-18 09:11:36', '1' );
INSERT INTO `t_permission`
VALUES
	( '39', '14', '6', '1020', '2017-08-18 09:11:36', '2017-08-18 09:11:36', '1' );
INSERT INTO `t_permission`
VALUES
	( '40', '14', '7', '102001', '2017-08-18 09:11:36', '2017-08-18 09:11:36', '1' );
INSERT INTO `t_permission`
VALUES
	( '41', '14', '8', '20', '2017-08-18 09:11:37', '2017-08-18 09:11:37', '1' );
INSERT INTO `t_permission`
VALUES
	( '42', '14', '9', '2010', '2017-08-18 09:11:37', '2017-08-18 09:11:37', '1' );
INSERT INTO `t_permission`
VALUES
	( '43', '14', '10', '201001', '2017-08-18 09:11:37', '2017-08-18 09:11:37', '1' );
INSERT INTO `t_permission`
VALUES
	( '44', '14', '11', '201002', '2017-08-18 09:11:37', '2017-08-18 09:11:37', '1' );
INSERT INTO `t_permission`
VALUES
	( '46', '14', '14', '40', '2017-08-18 09:11:38', '2017-08-18 09:11:38', '1' );
INSERT INTO `t_permission`
VALUES
	( '47', '14', '15', '4010', '2017-08-18 09:11:38', '2017-08-18 09:11:38', '1' );
INSERT INTO `t_permission`
VALUES
	( '488', '17', '1', '', '2018-11-06 11:23:00', '2018-11-06 11:23:00', '1' );
INSERT INTO `t_permission`
VALUES
	( '489', '17', '2', '', '2018-11-06 11:23:00', '2018-11-06 11:23:00', '1' );
INSERT INTO `t_permission`
VALUES
	( '490', '17', '4', '', '2018-11-06 11:23:01', '2018-11-06 11:23:01', '1' );
INSERT INTO `t_permission`
VALUES
	( '491', '17', '5', '', '2018-11-06 11:23:01', '2018-11-06 11:23:01', '1' );
INSERT INTO `t_permission`
VALUES
	( '492', '17', '6', '', '2018-11-06 11:23:01', '2018-11-06 11:23:01', '1' );
INSERT INTO `t_permission`
VALUES
	( '493', '17', '7', '', '2018-11-06 11:23:01', '2018-11-06 11:23:01', '1' );
INSERT INTO `t_permission`
VALUES
	( '494', '17', '8', '', '2018-11-06 11:23:01', '2018-11-06 11:23:01', '1' );
INSERT INTO `t_permission`
VALUES
	( '495', '17', '9', '', '2018-11-06 11:23:01', '2018-11-06 11:23:01', '1' );
INSERT INTO `t_permission`
VALUES
	( '496', '17', '10', '', '2018-11-06 11:23:01', '2018-11-06 11:23:01', '1' );
INSERT INTO `t_permission`
VALUES
	( '497', '17', '11', '', '2018-11-06 11:23:01', '2018-11-06 11:23:01', '1' );
INSERT INTO `t_permission`
VALUES
	( '498', '17', '12', '', '2018-11-06 11:23:01', '2018-11-06 11:23:01', '1' );
INSERT INTO `t_permission`
VALUES
	( '499', '17', '14', '', '2018-11-06 11:23:01', '2018-11-06 11:23:01', '1' );
INSERT INTO `t_permission`
VALUES
	( '500', '17', '15', '', '2018-11-06 11:23:01', '2018-11-06 11:23:01', '1' );
INSERT INTO `t_permission`
VALUES
	( '501', '17', '18', '', '2018-11-06 11:23:01', '2018-11-06 11:23:01', '1' );
INSERT INTO `t_permission`
VALUES
	( '502', '17', '19', '', '2018-11-06 11:23:01', '2018-11-06 11:23:01', '1' );
INSERT INTO `t_permission`
VALUES
	( '503', '17', '25', '', '2018-11-06 11:23:01', '2018-11-06 11:23:01', '1' );
INSERT INTO `t_permission`
VALUES
	( '504', '17', '26', '', '2018-11-06 11:23:01', '2018-11-06 11:23:01', '1' );
INSERT INTO `t_permission`
VALUES
	( '505', '17', '30', '', '2018-11-06 11:23:01', '2018-11-06 11:23:01', '1' );
INSERT INTO `t_permission`
VALUES
	( '574', '1', '1', '', '2018-11-06 15:51:05', '2018-11-06 15:51:05', '1' );
INSERT INTO `t_permission`
VALUES
	( '575', '1', '2', '', '2018-11-06 15:51:05', '2018-11-06 15:51:05', '1' );
INSERT INTO `t_permission`
VALUES
	( '576', '1', '3', '', '2018-11-06 15:51:05', '2018-11-06 15:51:05', '1' );
INSERT INTO `t_permission`
VALUES
	( '577', '1', '4', '', '2018-11-06 15:51:05', '2018-11-06 15:51:05', '1' );
INSERT INTO `t_permission`
VALUES
	( '578', '1', '5', '', '2018-11-06 15:51:05', '2018-11-06 15:51:05', '1' );
INSERT INTO `t_permission`
VALUES
	( '579', '1', '6', '', '2018-11-06 15:51:05', '2018-11-06 15:51:05', '1' );
INSERT INTO `t_permission`
VALUES
	( '580', '1', '7', '', '2018-11-06 15:51:05', '2018-11-06 15:51:05', '1' );
INSERT INTO `t_permission`
VALUES
	( '581', '1', '8', '', '2018-11-06 15:51:05', '2018-11-06 15:51:05', '1' );
INSERT INTO `t_permission`
VALUES
	( '582', '1', '9', '', '2018-11-06 15:51:05', '2018-11-06 15:51:05', '1' );
INSERT INTO `t_permission`
VALUES
	( '583', '1', '10', '', '2018-11-06 15:51:05', '2018-11-06 15:51:05', '1' );
INSERT INTO `t_permission`
VALUES
	( '584', '1', '11', '', '2018-11-06 15:51:05', '2018-11-06 15:51:05', '1' );
INSERT INTO `t_permission`
VALUES
	( '585', '1', '12', '', '2018-11-06 15:51:05', '2018-11-06 15:51:05', '1' );
INSERT INTO `t_permission`
VALUES
	( '586', '1', '14', '', '2018-11-06 15:51:05', '2018-11-06 15:51:05', '1' );
INSERT INTO `t_permission`
VALUES
	( '587', '1', '15', '', '2018-11-06 15:51:05', '2018-11-06 15:51:05', '1' );
INSERT INTO `t_permission`
VALUES
	( '588', '1', '16', '', '2018-11-06 15:51:05', '2018-11-06 15:51:05', '1' );
INSERT INTO `t_permission`
VALUES
	( '589', '1', '17', '', '2018-11-06 15:51:05', '2018-11-06 15:51:05', '1' );
INSERT INTO `t_permission`
VALUES
	( '590', '1', '18', '', '2018-11-06 15:51:05', '2018-11-06 15:51:05', '1' );
INSERT INTO `t_permission`
VALUES
	( '591', '1', '19', '', '2018-11-06 15:51:05', '2018-11-06 15:51:05', '1' );
INSERT INTO `t_permission`
VALUES
	( '592', '1', '25', '', '2018-11-06 15:51:05', '2018-11-06 15:51:05', '1' );
INSERT INTO `t_permission`
VALUES
	( '593', '1', '26', '', '2018-11-06 15:51:05', '2018-11-06 15:51:05', '1' );
INSERT INTO `t_permission`
VALUES
	( '594', '1', '27', '', '2018-11-06 15:51:05', '2018-11-06 15:51:05', '1' );
INSERT INTO `t_permission`
VALUES
	( '595', '1', '28', '', '2018-11-06 15:51:05', '2018-11-06 15:51:05', '1' );
INSERT INTO `t_permission`
VALUES
	( '596', '1', '29', '', '2018-11-06 15:51:05', '2018-11-06 15:51:05', '1' );
INSERT INTO `t_permission`
VALUES
	( '597', '1', '35', '', '2018-11-06 15:51:06', '2018-11-06 15:51:06', '1' );-- ----------------------------
-- Table structure for t_product
-- ----------------------------
DROP TABLE
IF
	EXISTS `t_product`;
CREATE TABLE `t_product` (
	`id` INT ( 11 ) NOT NULL AUTO_INCREMENT,
	`product_name` VARCHAR ( 300 ) DEFAULT NULL,
	`model` VARCHAR ( 150 ) DEFAULT NULL,
	`unit` VARCHAR ( 60 ) DEFAULT NULL,
	`price` FLOAT DEFAULT NULL,
	`store` DOUBLE DEFAULT NULL,
	`remark` VARCHAR ( 3000 ) DEFAULT NULL,
	`is_valid` TINYINT ( 4 ) DEFAULT '1',
	`create_date` datetime DEFAULT NULL,
	`update_date` datetime DEFAULT NULL,
	PRIMARY KEY ( `id` ) 
) ENGINE = INNODB AUTO_INCREMENT = 5 DEFAULT CHARSET = utf8;-- ----------------------------
-- Records of t_product
-- ----------------------------
INSERT INTO `t_product`
VALUES
	( '1', '联想笔记本', 'Y450', '台', '4500', '120', '好', '1', NULL, '2018-10-31 20:56:39' );
INSERT INTO `t_product`
VALUES
	( '2', '台式电脑', '联想', '联想', '3999', '50', '无', '1', '2018-10-31 20:53:23', '2018-10-31 20:56:39' );
INSERT INTO `t_product`
VALUES
	( '3', '键盘', '双飞燕', '双飞燕', '29', '100', '无', '1', '2018-10-31 20:55:43', '2018-11-02 16:55:47' );
INSERT INTO `t_product`
VALUES
	( '4', '鼠标', '罗技', '个', '50', '100', '无限鼠标', '0', '2018-11-02 16:47:38', '2018-11-02 16:52:25' );-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE
IF
	EXISTS `t_role`;
CREATE TABLE `t_role` (
	`id` INT ( 11 ) NOT NULL AUTO_INCREMENT,
	`role_name` VARCHAR ( 255 ) DEFAULT NULL,
	`role_remark` VARCHAR ( 255 ) DEFAULT NULL COMMENT '备注',
	`create_date` datetime DEFAULT NULL,
	`update_date` datetime DEFAULT NULL,
	`is_valid` INT ( 11 ) DEFAULT NULL,
	PRIMARY KEY ( `id` ) 
) ENGINE = INNODB AUTO_INCREMENT = 19 DEFAULT CHARSET = utf8;-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role`
VALUES
	( '1', '系统管理员', '系统管理员\r\n系统管理员111', '2016-12-01 00:00:00', '2018-11-03 21:33:19', '1' );
INSERT INTO `t_role`
VALUES
	( '2', '销售主管', '销售主管', '2016-12-01 00:00:00', '2018-11-03 21:33:19', '1' );
INSERT INTO `t_role`
VALUES
	( '3', '客户经理', '客户经理', '2016-12-01 00:00:00', '2018-11-03 21:33:19', '1' );
INSERT INTO `t_role`
VALUES
	( '14', '技术经理', '负责研发', '2017-06-30 14:50:24', '2018-11-03 21:33:44', '1' );
INSERT INTO `t_role`
VALUES
	( '17', '普通员工', '普通员工', '2018-11-04 15:06:58', '2018-11-04 15:06:58', '1' );
INSERT INTO `t_role`
VALUES
	( '18', '仓库管理员', '掌管仓库的一切进销存', '2018-11-05 14:55:49', '2018-11-05 14:56:08', '1' );-- ----------------------------
-- Table structure for t_sale_chance
-- ----------------------------
DROP TABLE
IF
	EXISTS `t_sale_chance`;
CREATE TABLE `t_sale_chance` (
	`id` INT ( 11 ) NOT NULL AUTO_INCREMENT,
	`chance_source` VARCHAR ( 300 ) DEFAULT NULL COMMENT '机会来源',
	`customer_id` INT ( 11 ) DEFAULT NULL,
	`customer_name` VARCHAR ( 100 ) DEFAULT NULL,
	`cgjl` INT ( 11 ) DEFAULT NULL,
	`overview` VARCHAR ( 300 ) DEFAULT NULL,
	`link_man` VARCHAR ( 100 ) DEFAULT NULL,
	`link_phone` VARCHAR ( 100 ) DEFAULT NULL,
	`description` VARCHAR ( 1000 ) DEFAULT NULL,
	`create_man` VARCHAR ( 100 ) DEFAULT NULL,
	`assign_man` VARCHAR ( 100 ) DEFAULT NULL,
	`assign_time` datetime DEFAULT NULL,
	`state` INT ( 11 ) DEFAULT NULL,
	`dev_result` INT ( 11 ) DEFAULT NULL,
	`is_valid` INT ( 4 ) DEFAULT NULL,
	`create_date` datetime DEFAULT NULL,
	`update_date` datetime DEFAULT NULL,
	PRIMARY KEY ( `id` ) 
) ENGINE = INNODB AUTO_INCREMENT = 87 DEFAULT CHARSET = utf8;-- ----------------------------
-- Records of t_sale_chance
-- ----------------------------
INSERT INTO `t_sale_chance`
VALUES
	(
		'1',
		'主动来找的',
		'123',
		'风软科技',
		'100',
		'采购笔记本意向',
		'1',
		'137234576543',
		'。。。',
		'Jack',
		'3',
		'2015-05-24 16:15:00',
		'1',
		'3',
		'0',
		'2016-08-23 20:56:26',
	NULL 
	);
INSERT INTO `t_sale_chance`
VALUES
	(
		'2',
		'朋友介绍',
		'16',
		'123',
		'12',
		'呵呵呵',
		'2',
		'15999999999',
		'',
		'shsxt',
		'小明',
		'2016-08-23 18:01:03',
		'0',
		'1',
		'0',
		'2016-08-23 20:56:26',
		'2016-08-23 18:05:21' 
	);
INSERT INTO `t_sale_chance`
VALUES
	(
		'9',
		'test',
		'18',
		'1111',
		'19',
		'test',
		'5',
		'123',
		'test',
		'',
		'admin',
		'2017-02-28 20:04:43',
		'1',
		'0',
		'0',
		'2016-08-23 20:56:26',
		'2017-02-28 20:04:43' 
	);
INSERT INTO `t_sale_chance`
VALUES
	(
		'11',
		'',
		'20',
		'qqqq',
		'1',
		'',
		'7',
		'',
		'',
		'Tony',
		'',
		NULL,
		'0',
		'0',
		'0',
		'2016-08-23 20:56:26',
		'2017-02-28 21:07:42' 
	);
INSERT INTO `t_sale_chance`
VALUES
	(
		'12',
		NULL,
		'21',
		'11',
		NULL,
		NULL,
		'10',
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		'0',
		'0',
		'0',
		'2016-08-23 20:56:26',
	NULL 
	);
INSERT INTO `t_sale_chance`
VALUES
	(
		'13',
		'',
		'28',
		'21',
		'1',
		'',
		'11',
		'',
		'',
		'21',
		'3',
		NULL,
		'0',
		'0',
		'1',
		'2016-08-23 20:56:26',
	NULL 
	);
INSERT INTO `t_sale_chance`
VALUES
	(
		'14',
		'2',
		'29',
		'1',
		'5',
		'6',
		'12',
		'4',
		'7',
		'8',
		'3',
		NULL,
		'0',
		'0',
		'1',
		'2016-08-23 20:56:26',
	NULL 
	);
INSERT INTO `t_sale_chance`
VALUES
	(
		'15',
		'213',
		'30',
		'11',
		'0',
		'',
		'13',
		'',
		'',
		'221',
		'李四',
		'2017-02-28 20:05:13',
		'1',
		NULL,
		'0',
		'2016-08-23 20:56:26',
		'2017-02-28 20:05:13' 
	);
INSERT INTO `t_sale_chance`
VALUES
	(
		'16',
		'22',
		'31',
		'我我我我',
		'55',
		'66',
		'14',
		'44',
		'77',
		'88',
		'4',
		'2017-02-28 20:58:22',
		'1',
		'0',
		'0',
		'2016-08-23 20:56:26',
		'2017-02-28 20:58:22' 
	);
INSERT INTO `t_sale_chance`
VALUES
	(
		'17',
		'321',
		'32',
		'3333',
		'1',
		'321',
		'15',
		'213',
		'321',
		'Tony',
		'3',
		'2017-02-28 21:00:53',
		'1',
		NULL,
		'0',
		'2016-08-23 20:56:26',
		'2017-02-28 21:00:53' 
	);
INSERT INTO `t_sale_chance`
VALUES
	(
		'18',
		'321',
		'33',
		'321',
		'11',
		'321',
		'16',
		'213',
		'321',
		'Jack',
		'',
		NULL,
		'0',
		'0',
		'1',
		'2016-08-23 20:56:26',
		'2016-08-23 21:08:06' 
	);
INSERT INTO `t_sale_chance`
VALUES
	(
		'19',
		'321',
		'34',
		'213',
		'21',
		'21',
		'17',
		'321',
		'321',
		'Jack',
		'3',
		'2015-05-24 11:34:00',
		'1',
		'3',
		'1',
		'2016-08-23 20:56:26',
		'2016-08-23 21:08:00' 
	);
INSERT INTO `t_sale_chance`
VALUES
	(
		'20',
		'321',
		'35',
		'213',
		'100',
		'321',
		'18',
		'321',
		'321',
		'Jack',
		'小红',
		'2016-08-24 11:21:26',
		'1',
		'2',
		'1',
		'2016-08-23 20:56:26',
		'2016-09-08 09:54:07' 
	);
INSERT INTO `t_sale_chance`
VALUES
	(
		'21',
		'行业介绍',
		'36',
		'大鸟爱科技',
		'80',
		'阿凡达深刻理解',
		'19',
		'0231-321321',
		'发达放大空间发大水发大水了发',
		'Jack',
		'4',
		'2015-06-10 16:33:00',
		'1',
		'3',
		'1',
		'2016-08-23 20:56:26',
		'2016-08-23 21:06:27' 
	);
INSERT INTO `t_sale_chance`
VALUES
	(
		'22',
		'同行介绍',
		'37',
		'鸟人科技',
		'90',
		'采购IBM服务器意向',
		'20',
		'2321321321',
		',...',
		'Jack',
		'5',
		'2015-06-11 08:36:00',
		'1',
		'2',
		'1',
		'2016-08-23 20:56:26',
		'2016-08-23 21:04:17' 
	);
INSERT INTO `t_sale_chance`
VALUES
	(
		'23',
		'朋友介绍',
		'38',
		'BonApp信息科技有限公司',
		'19',
		'需要Java开发',
		'21',
		'12555555555',
		NULL,
		'shsxt',
		'小张',
		'2016-09-01 10:14:19',
		'1',
		'2',
		'1',
		'2016-08-23 20:56:26',
		'2016-09-01 10:14:18' 
	);
INSERT INTO `t_sale_chance`
VALUES
	(
		'24',
		'同事推荐',
		'39',
		'阿里巴巴',
		'10',
		'采购服务器',
		'22',
		'1388888888',
		'qqqq',
		'shsxt',
		'小明',
		'2016-09-01 10:14:08',
		'1',
		'3',
		'1',
		'2016-08-23 20:56:26',
		'2016-09-01 10:14:07' 
	);
INSERT INTO `t_sale_chance`
VALUES
	(
		'25',
		'4321',
		'40',
		'1234',
		'12',
		'',
		'23',
		'1',
		'',
		'shsxt',
		'',
		'2016-12-27 14:08:21',
		'0',
		'0',
		'0',
		'2016-08-24 12:01:52',
		'2016-08-24 15:31:48' 
	);
INSERT INTO `t_sale_chance`
VALUES
	(
		'26',
		'老宋推荐',
		'41',
		'王宝强2',
		'10',
		'咨询服务器的价格',
		'24',
		'12555555555',
		'咨询服务器的价格',
		'shsxt',
		'xiaoming',
		'2016-08-23 20:56:27',
		'1',
		'1',
		'1',
		'2016-08-30 16:53:01',
		'2016-11-24 10:43:22' 
	);
INSERT INTO `t_sale_chance`
VALUES
	(
		'27',
		'网易',
		'42',
		'lp',
		'50',
		'123123',
		'25',
		'23123123',
		'123123',
		'shsxt',
		'小明',
		'2016-12-05 22:32:38',
		'1',
		'2',
		'1',
		'2016-09-08 09:53:09',
		'2016-12-05 22:32:38' 
	);
INSERT INTO `t_sale_chance`
VALUES
	(
		'28',
		'shsxt',
		'43',
		'sxt007',
		'10',
		'123123',
		'26',
		'123123',
		'123123',
		'shsxt',
		'小明',
		'2016-09-08 09:56:12',
		'1',
		'3',
		'0',
		'2016-09-08 09:56:11',
		'2016-09-08 09:57:46' 
	);
INSERT INTO `t_sale_chance`
VALUES
	(
		'29',
		'test',
		'44',
		'test001',
		'100',
		NULL,
		'27',
		'asd',
		'123',
		'shsxt',
		'小明',
		'2016-11-23 11:39:58',
		'1',
		'0',
		'0',
		'2016-11-23 11:39:49',
		'2016-11-23 11:39:58' 
	);
INSERT INTO `t_sale_chance`
VALUES
	(
		'30',
		'尚学堂推荐',
		'45',
		'test001',
		'90',
		NULL,
		'28',
		'100100',
		'企业值得信任',
		'shsxt',
		'zs',
		'2016-12-26 23:04:07',
		'1',
		'3',
		'1',
		'2016-12-26 17:34:32',
		'2016-12-26 17:34:32' 
	);
INSERT INTO `t_sale_chance`
VALUES
	(
		'31',
		'上海尚学堂',
		'46',
		'test002',
		'90',
		'老马推荐的  不用过多描述',
		NULL,
		'100111',
		'老马推荐的  不用过多描述',
		'shsxt',
		'zs',
		'2016-12-26 20:21:30',
		'1',
		'2',
		'1',
		'2016-12-26 17:37:34',
		'2016-12-26 17:46:50' 
	);
INSERT INTO `t_sale_chance`
VALUES
	(
		'32',
		'sxt',
		'47',
		'test003',
		'90',
		'尚学堂推荐',
		NULL,
		'100111',
		'尚学堂推荐',
		'shsxt',
		'李四',
		'2016-12-27 14:33:44',
		'1',
		'2',
		'1',
		'2016-12-27 14:33:44',
		'2016-12-27 14:33:44' 
	);
INSERT INTO `t_sale_chance`
VALUES
	(
		'33',
		'qqq',
		'48',
		'ssss',
		'11',
		NULL,
		NULL,
		'111',
		'11',
		'',
		'',
		NULL,
		NULL,
		NULL,
		'1',
		'2017-02-28 18:32:16',
		'2017-02-28 18:32:16' 
	);
INSERT INTO `t_sale_chance`
VALUES
	(
		'34',
		'admin',
		'489',
		'admin',
		'22',
		NULL,
		NULL,
		'123',
		'222',
		'',
		'',
		NULL,
		NULL,
		NULL,
		'1',
		'2017-02-28 18:33:17',
		'2017-02-28 18:33:17' 
	);
INSERT INTO `t_sale_chance`
VALUES
	(
		'35',
		'hello',
		'49',
		'hello',
		'100',
		NULL,
		NULL,
		'12345',
		'hell0',
		'',
		'',
		NULL,
		NULL,
		NULL,
		'1',
		'2017-02-28 18:47:22',
		'2017-02-28 18:47:22' 
	);
INSERT INTO `t_sale_chance`
VALUES
	(
		'36',
		'hujichao',
		'50',
		'hujichao',
		'100',
		NULL,
		NULL,
		'12345',
		'hujichao',
		'',
		'test',
		'2017-02-28 19:07:37',
		'1',
		'0',
		'1',
		'2017-02-28 19:07:37',
		'2017-02-28 19:07:37' 
	);
INSERT INTO `t_sale_chance`
VALUES
	(
		'37',
		'ooooo',
		'51',
		'ooooo',
		'0',
		'000',
		NULL,
		'0000000',
		'0000',
		'',
		'test',
		'2017-02-28 19:09:23',
		'1',
		'0',
		'1',
		'2017-02-28 19:09:23',
		'2017-02-28 19:09:23' 
	);
INSERT INTO `t_sale_chance`
VALUES
	(
		'38',
		'sssssssssssssss',
		'52',
		'333333',
		'100',
		'222',
		NULL,
		'222222222',
		'22',
		'Tony',
		'test',
		'2017-02-28 21:01:38',
		'1',
		'0',
		'0',
		'2017-02-28 21:01:17',
		'2017-02-28 21:01:38' 
	);
INSERT INTO `t_sale_chance`
VALUES
	(
		'39',
		'sawork',
		'53',
		'sawork',
		'22',
		'sakl',
		NULL,
		'12345',
		'sakl',
		'',
		'admin',
		'2017-03-01 12:22:35',
		'1',
		'0',
		'1',
		'2017-03-01 12:22:35',
		'2017-03-01 12:22:35' 
	);
INSERT INTO `t_sale_chance`
VALUES
	(
		'40',
		'Tree',
		'54',
		'tree',
		'100',
		'Tree',
		NULL,
		'123456',
		'Tree',
		'',
		'admin',
		'2017-03-01 18:15:20',
		'1',
		'0',
		'1',
		'2017-03-01 18:15:20',
		'2017-03-01 18:15:20' 
	);
INSERT INTO `t_sale_chance`
VALUES
	(
		'41',
		'',
		'55',
		'',
		NULL,
		'',
		NULL,
		'',
		'',
		'',
		'',
		NULL,
		NULL,
		NULL,
		'0',
		'2017-03-01 18:17:15',
		'2017-03-01 18:17:15' 
	);
INSERT INTO `t_sale_chance`
VALUES
	(
		'42',
		'',
		'56',
		'aaaa',
		NULL,
		'',
		NULL,
		'',
		'',
		'',
		'',
		NULL,
		NULL,
		NULL,
		'0',
		'2017-03-01 18:20:19',
		'2017-03-01 18:20:19' 
	);
INSERT INTO `t_sale_chance`
VALUES
	(
		'43',
		'',
		'57',
		'ddd',
		NULL,
		'',
		NULL,
		'',
		'',
		'',
		'',
		NULL,
		NULL,
		NULL,
		'0',
		'2017-03-01 18:22:53',
		'2017-03-01 18:22:53' 
	);
INSERT INTO `t_sale_chance`
VALUES
	(
		'44',
		'',
		'58',
		'ssss',
		NULL,
		'',
		NULL,
		'',
		'',
		'',
		'',
		NULL,
		NULL,
		NULL,
		'1',
		'2017-03-01 18:23:30',
		'2017-03-01 18:23:30' 
	);
INSERT INTO `t_sale_chance`
VALUES
	(
		'45',
		'',
		'59',
		'ssss',
		NULL,
		'',
		NULL,
		'',
		'',
		'',
		'',
		NULL,
		NULL,
		NULL,
		'1',
		'2017-03-01 18:50:25',
		'2017-03-01 18:50:25' 
	);
INSERT INTO `t_sale_chance`
VALUES
	(
		'46',
		'',
		'60',
		'saassa',
		NULL,
		'',
		NULL,
		'',
		'',
		'',
		'admin',
		'2017-03-01 18:52:55',
		'1',
		'0',
		'1',
		'2017-03-01 18:52:55',
		'2017-03-01 18:52:55' 
	);
INSERT INTO `t_sale_chance`
VALUES
	(
		'47',
		'',
		'61',
		'',
		'10',
		'',
		NULL,
		'',
		'',
		'',
		'',
		NULL,
		NULL,
		NULL,
		'1',
		'2017-03-01 18:56:23',
		'2017-03-01 18:56:23' 
	);
INSERT INTO `t_sale_chance`
VALUES
	(
		'48',
		'',
		'62',
		'',
		'21',
		'',
		NULL,
		'21313213',
		'',
		'',
		'admin',
		'2017-03-01 18:56:57',
		'1',
		'0',
		'0',
		'2017-03-01 18:56:57',
		'2017-03-01 18:56:57' 
	);
INSERT INTO `t_sale_chance`
VALUES
	(
		'49',
		'',
		'63',
		'aaaaaaaaaaaa',
		NULL,
		'',
		NULL,
		'',
		'',
		'',
		'admin',
		'2017-03-01 18:58:35',
		'1',
		'1',
		'0',
		'2017-03-01 18:58:35',
		'2017-06-30 11:04:31' 
	);
INSERT INTO `t_sale_chance`
VALUES
	(
		'51',
		'',
		'65',
		'sadsa',
		'12',
		'',
		NULL,
		'',
		'',
		'',
		'',
		NULL,
		NULL,
		NULL,
		'1',
		'2017-03-01 19:01:44',
		'2017-03-01 19:01:44' 
	);
INSERT INTO `t_sale_chance`
VALUES
	(
		'54',
		'',
		'68',
		'ASasa',
		NULL,
		'',
		NULL,
		'',
		'',
		'',
		'admin',
		'2017-03-01 19:05:46',
		'1',
		'0',
		'0',
		'2017-03-01 19:05:46',
		'2017-03-01 19:05:46' 
	);
INSERT INTO `t_sale_chance`
VALUES
	(
		'55',
		'',
		'69',
		'213213',
		'0',
		'',
		NULL,
		'',
		'',
		'',
		'admin',
		'2017-03-01 19:09:04',
		'1',
		'1',
		'0',
		'2017-03-01 19:09:04',
		'2017-06-29 17:29:44' 
	);
INSERT INTO `t_sale_chance`
VALUES
	(
		'56',
		'',
		'70',
		'wwwwwwww',
		NULL,
		'',
		NULL,
		'',
		'',
		'Tony',
		'admin',
		'2017-03-01 19:10:20',
		'1',
		'2',
		'1',
		'2017-03-01 19:10:20',
		'2017-06-29 17:22:23' 
	);
INSERT INTO `t_sale_chance`
VALUES
	(
		'70',
		'csrfmiddlewaretoken',
		'302',
		'天猫11',
		'50',
		'csrfmiddlewaretoken',
		NULL,
		'138138138138',
		'csrfmiddlewaretoken',
		'',
		'22',
		'2018-10-25 21:21:25',
		'1',
		'0',
		NULL,
		NULL,
	NULL 
	);
INSERT INTO `t_sale_chance`
VALUES
	(
		'83',
		'老高介绍',
		'46',
		'百度',
		'99',
		'百度合作开发',
		'4',
		'6',
		'机会很大，很好',
		'zhangsan',
		'27',
		'2018-10-26 20:22:05',
		'1',
		'0',
		'0',
		'2018-10-26 20:22:05',
		'2018-10-29 08:44:52' 
	);
INSERT INTO `t_sale_chance`
VALUES
	(
		'84',
		'班长介绍',
		'16',
		'风驰科技',
		'66',
		'聊就完了',
		'5',
		'66',
		'聊就完了',
		'zhangsan',
		'18',
		'2018-10-29 11:29:14',
		'1',
		'0',
		'0',
		'2018-10-29 11:29:14',
	NULL 
	);
INSERT INTO `t_sale_chance`
VALUES
	(
		'85',
		'孙振铎介绍',
		'17',
		'巨人科技',
		'77',
		'77',
		'4',
		'6',
		'77',
		'zhangsan',
		'10',
		'2018-10-29 11:30:19',
		'1',
		'0',
		'0',
		'2018-10-29 11:30:19',
	NULL 
	);
INSERT INTO `t_sale_chance`
VALUES
	(
		'86',
		'班长介绍',
		'18',
		'新人科技',
		'66',
		'66',
		'5',
		'66',
		'66',
		'zhangsan',
		'18',
		'2018-10-29 11:41:49',
		'1',
		'2',
		'1',
		'2018-10-29 11:41:49',
	NULL 
	);-- ----------------------------
-- Table structure for t_test
-- ----------------------------
DROP TABLE
IF
	EXISTS `t_test`;
CREATE TABLE `t_test` (
	`id` INT ( 11 ) NOT NULL,
	`name` VARCHAR ( 255 ) DEFAULT NULL,
	`is_valid` INT ( 11 ) DEFAULT NULL,
	PRIMARY KEY ( `id` ) 
) ENGINE = INNODB DEFAULT CHARSET = utf8mb4;-- ----------------------------
-- Records of t_test
-- ----------------------------
INSERT INTO `t_test`
VALUES
	( '1', 'a', '1' );
INSERT INTO `t_test`
VALUES
	( '2', 'a', '1' );
INSERT INTO `t_test`
VALUES
	( '3', 'a', '1' );
INSERT INTO `t_test`
VALUES
	( '4', 'a', '1' );
INSERT INTO `t_test`
VALUES
	( '5', 'a', '1' );
INSERT INTO `t_test`
VALUES
	( '6', 'a', '1' );-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE
IF
	EXISTS `t_user`;
CREATE TABLE `t_user` (
	`id` INT ( 11 ) NOT NULL AUTO_INCREMENT,
	`user_name` VARCHAR ( 20 ) DEFAULT NULL,
	`password` VARCHAR ( 100 ) DEFAULT NULL,
	`true_name` VARCHAR ( 20 ) DEFAULT NULL,
	`email` VARCHAR ( 30 ) DEFAULT NULL,
	`phone` VARCHAR ( 20 ) DEFAULT NULL,
	`is_valid` INT ( 4 ) DEFAULT '1',
	`create_date` datetime DEFAULT NULL,
	`update_date` datetime DEFAULT NULL,
	`code` VARCHAR ( 255 ) DEFAULT NULL COMMENT '激活码',
	`status` TINYINT ( 1 ) DEFAULT '0' COMMENT '状态，0无效，1有效',
	`timestamp` VARCHAR ( 255 ) DEFAULT NULL COMMENT '时间戳',
	PRIMARY KEY ( `id` ) 
) ENGINE = INNODB AUTO_INCREMENT = 47 DEFAULT CHARSET = utf8;-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user`
VALUES
	( '10', 'shsxt', '38b1383cadbbebb60a73f783648bc104', 'Tony', 'java@123.com', '123', '1', '2016-12-01 12:05:49', '2017-08-18 09:59:41', NULL, '0', NULL );
INSERT INTO `t_user`
VALUES
	( '18', 'test', '96e79218965eb72c92a549dd5a330112', 'test', '123@126.com', '1232323', '1', '2017-02-22 18:50:35', '2017-02-22 18:50:35', NULL, '0', NULL );
INSERT INTO `t_user`
VALUES
	( '20', 'admin', '38b1383cadbbebb60a73f783648bc104', 'admin', '144@122.com', '111', '1', '2017-02-28 19:47:53', '2017-02-28 19:47:56', NULL, '0', NULL );
INSERT INTO `t_user`
VALUES
	( '21', 'test01', '96e79218965eb72c92a549dd5a330112', '小明', 'test@test', '1111', '0', '2017-02-28 19:47:53', '2018-11-04 14:13:48', NULL, '0', NULL );
INSERT INTO `t_user`
VALUES
	( '22', 'admin1', '96e79218965eb72c92a549dd5a330112', 'admin1', 'kk@gg.com', '13888888888', '0', '2017-06-29 21:10:05', '2018-11-06 09:51:02', NULL, '0', NULL );
INSERT INTO `t_user`
VALUES
	( '24', 'lilin', '38b1383cadbbebb60a73f783648bc104', '最帅的男人没有之一', 'lilin@qq.com', '13666666677', '1', '2017-08-17 16:32:32', '2018-11-04 15:09:00', NULL, '0', NULL );
INSERT INTO `t_user`
VALUES
	( '43', 'zhangsan', '38b1383cadbbebb60a73f783648bc104', '张三', '3293243124@qq.com', '123123123123', '1', '2018-10-25 09:08:31', '2018-11-06 11:04:42', '', '1', '1540430338' );
INSERT INTO `t_user`
VALUES
	( '44', 'zhangsan123', '4297f44b13955235245b2497399d7a93', 'zhangsan123', '3293243124@qq.com1', '123123', '0', '2018-11-05 18:45:33', '2018-11-06 09:51:02', NULL, '0', NULL );
INSERT INTO `t_user`
VALUES
	( '45', 'asdasd123123', '1a1233cfb69d7f27211e36aff9ec373a', 'asdasd123123', 'asdasd123123', 'asdasd123123', '0', '2018-11-06 08:45:12', '2018-11-06 09:51:02', NULL, '0', NULL );
INSERT INTO `t_user`
VALUES
	( '46', 'trrty', '29d6be62cbadee421c35c6ff9373b9ea', 'rtyrty', 'rtyrtyrty', 'rtyrtyr', '0', '2018-11-06 09:24:08', '2018-11-06 09:50:57', NULL, '0', NULL );-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE
IF
	EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
	`id` INT ( 11 ) NOT NULL AUTO_INCREMENT,
	`user_id` INT ( 11 ) DEFAULT NULL,
	`role_id` INT ( 11 ) DEFAULT NULL,
	`is_valid` TINYINT ( 4 ) DEFAULT NULL,
	`create_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
	`update_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY ( `id` ) 
) ENGINE = INNODB AUTO_INCREMENT = 76 DEFAULT CHARSET = utf8;-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role`
VALUES
	( '40', '10', '1', '1', '2017-08-18 09:59:41', '2017-08-18 09:59:41' );
INSERT INTO `t_user_role`
VALUES
	( '59', '24', '17', '1', '2018-11-04 15:09:00', '2018-11-04 15:09:00' );
INSERT INTO `t_user_role`
VALUES
	( '60', '44', '1', '1', '2018-11-05 18:45:46', '2018-11-05 18:45:46' );
INSERT INTO `t_user_role`
VALUES
	( '61', '44', '2', '1', '2018-11-05 18:45:47', '2018-11-05 18:45:47' );
INSERT INTO `t_user_role`
VALUES
	( '62', '44', '3', '1', '2018-11-05 18:45:48', '2018-11-05 18:45:48' );
INSERT INTO `t_user_role`
VALUES
	( '67', '45', '17', '1', '2018-11-06 09:13:04', '2018-11-06 09:13:04' );
INSERT INTO `t_user_role`
VALUES
	( '68', '45', '18', '1', '2018-11-06 09:13:05', '2018-11-06 09:13:05' );
INSERT INTO `t_user_role`
VALUES
	( '73', '46', '17', '1', '2018-11-06 09:31:16', '2018-11-06 09:31:16' );
INSERT INTO `t_user_role`
VALUES
	( '74', '46', '18', '1', '2018-11-06 09:31:16', '2018-11-06 09:31:16' );
INSERT INTO `t_user_role`
VALUES
	( '75', '43', '17', '1', '2018-11-06 11:04:42', '2018-11-06 11:04:42' );