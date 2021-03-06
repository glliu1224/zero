/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : 127.0.0.1:3306
 Source Schema         : test

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 10/04/2019 17:21:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_1
-- ----------------------------
DROP TABLE IF EXISTS `t_1`;
CREATE TABLE `t_1`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '名称',
  `length` int(11) NULL DEFAULT NULL COMMENT '长度',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '临时表， 暂时无用' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_blog_ad
-- ----------------------------
DROP TABLE IF EXISTS `t_blog_ad`;
CREATE TABLE `t_blog_ad`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '该条广告记录的广告名称',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '广告内容，文字广告就是文字，图片和flash就是它们的地址',
  `position_id` int(11) NOT NULL COMMENT '0,站外广告;从1开始代表的是该广告所处的广告位,同表ad_postition中的字段position_id的值',
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '广告链接地址',
  `media_type` int(1) NOT NULL DEFAULT 0 COMMENT '广告类型,0图片;1flash;2代码3文字',
  `start_time` int(13) NOT NULL DEFAULT 0 COMMENT '广告开始时间',
  `end_time` int(13) NOT NULL DEFAULT 0 COMMENT '广告结束时间',
  `link_man` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '广告联系人',
  `link_email` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '广告联系人的邮箱',
  `link_phone` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '广告联系人的电话',
  `click_count` int(11) NOT NULL DEFAULT 0 COMMENT '广告点击次数',
  `enabled` int(1) NOT NULL DEFAULT 1 COMMENT '该广告是否关闭;1开启; 0关闭; 关闭后广告将不再有效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '广告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_blog_article
-- ----------------------------
DROP TABLE IF EXISTS `t_blog_article`;
CREATE TABLE `t_blog_article`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志自增ID号',
  `author_id` bigint(20) NOT NULL COMMENT '作者，所属用户ID[多作者请在描述中填充第二作者信息]',
  `tag_id` bigint(20) NOT NULL DEFAULT 1 COMMENT '栏目ID',
  `sort_id` bigint(20) NOT NULL COMMENT '所属分类',
  `status` int(4) NOT NULL DEFAULT 1 COMMENT '文章的模式:0为私有，1为公开，2为仅好友查看',
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章名称-64',
  `description` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章描述-128',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '文章内容[text]',
  `publish_date` timestamp(0) NOT NULL COMMENT '发布时间',
  `create_date` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间(创建未发表)',
  `update_date` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文章表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_blog_article
-- ----------------------------
INSERT INTO `t_blog_article` VALUES (1, 1, 1, 1, 1, '测试标题', '描述', '正文，正文111', '2019-01-30 16:40:58', '2019-01-30 16:41:03', '2019-01-30 16:41:07');
INSERT INTO `t_blog_article` VALUES (2, 2, 1, 1, 1, '2测试标题', '2描述', '222正文，正文111', '2019-01-30 16:40:58', '2019-01-30 16:41:03', '2019-01-30 16:41:07');
INSERT INTO `t_blog_article` VALUES (3, 3, 1, 1, 1, '333测试标题', '333描述', '3333正文，正文111', '2019-01-30 16:40:58', '2019-01-30 16:41:03', '2019-01-30 16:41:07');
INSERT INTO `t_blog_article` VALUES (4, 4, 1, 1, 1, '冬', '朱自清', '不会啊，文，正文111', '2019-01-30 16:40:58', '2019-01-30 16:41:03', '2019-01-30 16:41:07');

-- ----------------------------
-- Table structure for t_blog_article_tag
-- ----------------------------
DROP TABLE IF EXISTS `t_blog_article_tag`;
CREATE TABLE `t_blog_article_tag`  (
  `article_id` bigint(20) NOT NULL COMMENT '文章表ID',
  `tag_id` bigint(20) NOT NULL COMMENT '标签表ID',
  PRIMARY KEY (`article_id`, `tag_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_blog_article_tag
-- ----------------------------
INSERT INTO `t_blog_article_tag` VALUES (1, 1);
INSERT INTO `t_blog_article_tag` VALUES (1, 2);

-- ----------------------------
-- Table structure for t_blog_description
-- ----------------------------
DROP TABLE IF EXISTS `t_blog_description`;
CREATE TABLE `t_blog_description`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `article_id` bigint(20) NOT NULL COMMENT '博客文章ID',
  `title` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '博客标题',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '博客描述，如果缺省则去文章前200字',
  `word` int(11) NULL DEFAULT 0 COMMENT '文章字数',
  `keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '博客关键字',
  `prefer` int(11) NULL DEFAULT 0 COMMENT '喜欢数',
  `click_count` int(11) NULL DEFAULT 0 COMMENT '点击次数/查看人数',
  `author_id` bigint(20) NULL DEFAULT NULL COMMENT '作者ID',
  `status` int(4) NULL DEFAULT NULL COMMENT '状态哦，是否置顶:0为否，1为是',
  `update_date` timestamp(0) NULL DEFAULT NULL COMMENT '创建、更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '博客说明表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_blog_friendly_link
-- ----------------------------
DROP TABLE IF EXISTS `t_blog_friendly_link`;
CREATE TABLE `t_blog_friendly_link`  (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '友情链接自增ID',
  `name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '友情链接名称',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '链接地址',
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'LOGO图片',
  `sort` int(1) NOT NULL COMMENT '在页面显示的顺序',
  PRIMARY KEY (`_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '友情链接' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_blog_sort
-- ----------------------------
DROP TABLE IF EXISTS `t_blog_sort`;
CREATE TABLE `t_blog_sort`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '文章自增ID',
  `name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称',
  `weight` int(11) NOT NULL COMMENT '该分类排序的权重',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文章分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_blog_tag
-- ----------------------------
DROP TABLE IF EXISTS `t_blog_tag`;
CREATE TABLE `t_blog_tag`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '文章自增ID',
  `tag_name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标签名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文章标签表，多对多' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_blog_user_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_blog_user_detail`;
CREATE TABLE `t_blog_user_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户ID',
  `gender` int(1) NULL DEFAULT NULL COMMENT '用户性别,0/1/2 保密/男/女',
  `quotes` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户语录，类似qq签名',
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简介描述',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '个人网站',
  `quick_response_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图片链接，二维码又称二维条码，常见的二维码为QR Code',
  `balance` int(8) NULL DEFAULT NULL COMMENT '账户余额，整数标识扩大缩小100倍去保证一定精度',
  `rank_id` tinyint(3) NULL DEFAULT NULL COMMENT '用户等级',
  `integral` int(9) NULL DEFAULT NULL COMMENT '用户积分',
  `fans` int(11) NULL DEFAULT NULL COMMENT '粉丝',
  `record_of_formal_schooling` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '学历',
  `industry` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '行业',
  `position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '职位',
  `graduate_school` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '毕业学校',
  `blood_type` char(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户血型',
  `constellation` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户星座',
  `birthday` int(13) NULL DEFAULT NULL COMMENT '用户生日',
  `latest_login_ip` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户上一次登录IP地址',
  `register_ip` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户注册时IP地址',
  `register_time` int(13) NULL DEFAULT NULL COMMENT '用户注册时间',
  `latest_update_time` int(13) NULL DEFAULT NULL COMMENT '用户上次更新博客时间',
  `lock` tinyint(4) NULL DEFAULT NULL COMMENT '是否锁定，0为不锁定，1为锁定',
  `freeze` tinyint(4) NOT NULL COMMENT '是否冻结，0为不冻结，1为冻结',
  `remind` int(1) NULL DEFAULT 0 COMMENT '是否定时提醒',
  `create_date` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户详细信息扩展表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_blog_visitor_log
-- ----------------------------
DROP TABLE IF EXISTS `t_blog_visitor_log`;
CREATE TABLE `t_blog_visitor_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访客记录主键ID',
  `target_id` bigint(8) NOT NULL COMMENT '访问博主的userId',
  `visitor_id` mediumint(8) NOT NULL COMMENT '访客用户ID',
  `visitor_ip` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '访客IP地址',
  `visitor_device` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备',
  `article_id` int(3) NOT NULL COMMENT '访问文章ID',
  `where_id` bigint(20) NOT NULL COMMENT '查看某板块的某个子项目，如查看相册板块的第3个相册，该ID对应该相册的ID号',
  `visitor_time` timestamp(0) NOT NULL COMMENT '来访时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '最近访客表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_cpu_mark
-- ----------------------------
DROP TABLE IF EXISTS `t_cpu_mark`;
CREATE TABLE `t_cpu_mark`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `overall_rank` int(11) NULL DEFAULT NULL COMMENT '总体排名',
  `average_cpu_mark` int(11) NULL DEFAULT NULL COMMENT '平均分数',
  `single_thread_rating` int(11) NULL DEFAULT NULL COMMENT '单线程性能',
  `samples` bigint(20) NULL DEFAULT NULL COMMENT '多线程性能',
  `first_seen` int(6) NULL DEFAULT NULL COMMENT '上市时间，格式：年份季度，如2018Q2，填入20182',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '名称',
  `other_names` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '其他名称',
  `socket` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '插座',
  `integrated_graphics` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '集成显卡',
  `clock_speed` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '时钟频率',
  `turbo_speed` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '最大睿频时钟频率',
  `tdp_typical` int(11) NULL DEFAULT NULL COMMENT '典型的TDP（单位：W）',
  `tdp_down` int(11) NULL DEFAULT NULL COMMENT '小型的TDP（单位：W）',
  `tdp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `physical_core` int(11) NULL DEFAULT NULL COMMENT '物理核心数（单位：个）',
  `logical_core_per_physical` int(11) NULL DEFAULT NULL COMMENT '每个物理2个逻辑核心（单位：个）',
  `cpu_mark_price` int(11) NULL DEFAULT NULL COMMENT 'CPU标称价格',
  `last_price_change` int(11) NULL DEFAULT NULL COMMENT '最近的调价（例子：$168.79 USD (2019-01-01)）',
  `error_margin` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '误差幅度',
  `cpu_first_seen_on_chart` datetime(0) NULL DEFAULT NULL COMMENT '首次上市时间（例子：Q2 2017）',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '测试日期',
  `update_date` timestamp(0) NULL DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'cpu分数信息记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_cpu_mark
-- ----------------------------
INSERT INTO `t_cpu_mark` VALUES (1, 705, 5616, 1520, 2130, 20154, 'Intel Core i5-6400T @ 2.20GHz  ', 'Intel(R) Core(TM) i5-6400T CPU @ 2.20GHz', 'LGA 1151', NULL, '2.2 GHz', '2.8 GHz', 35, NULL, NULL, 4, NULL, 2550, 15823, NULL, '2015-09-01 10:19:50', NULL, NULL);
INSERT INTO `t_cpu_mark` VALUES (2, 632, 6285, 1713, 2360, 20154, 'Intel Core i5-6500T @ 2.50GHz', 'Intel(R) Core(TM) i5-6500T CPU @ 2.50GHz', 'LGA 1151', NULL, '2.5 GHz', '3.1 GHz', 35, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_cpu_mark` VALUES (3, 198, 12471, 2360, 2820, 20182, 'Intel Core i7-8750H @ 2.20GHz', 'Intel(R) Core(TM) i7-8750H CPU @ 2.20GHz', 'FCBGA1440', NULL, '2.2 GHz', '4.1 GHz', 35, NULL, NULL, 6, 12, NULL, NULL, NULL, '2018-05-13 10:34:26', NULL, NULL);
INSERT INTO `t_cpu_mark` VALUES (4, 500, 7674, 1936, 2405, 20172, 'Intel Core i5-8250U @ 1.60GHz', 'Intel(R) Core(TM) i5-8250U CPU @ 1.60GHz', NULL, NULL, '1.6 GHz', '3.4 GHz', 25, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_cpu_mark` VALUES (5, 127, 15146, 2629, 2130, 20174, 'Intel Core i7-8700 @ 3.20GHz', 'Intel(R) Core(TM) i7-8700 CPU @ 3.20GHz', 'FCLGA1151', NULL, '3.2 GHz', '4.6 GHz', 65, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for t_sys_area
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_area`;
CREATE TABLE `t_sys_area`  (
  `area_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '地区码',
  `area_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '地区名',
  `area_level` int(3) NULL DEFAULT NULL COMMENT '级别',
  `parent_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父节点地区码',
  `parent_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父节点地区名',
  `short_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简码',
  `district_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`area_code`) USING BTREE,
  UNIQUE INDEX `idx_sys_area_code`(`area_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sys_area
-- ----------------------------
INSERT INTO `t_sys_area` VALUES ('000000', '中华人民共和国', 0, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_area` VALUES ('110000', '北京市', 1, '000000', '中华人民共和国', '010', NULL);
INSERT INTO `t_sys_area` VALUES ('110100', '北京城区', 2, '110000', '北京市', '010', NULL);
INSERT INTO `t_sys_area` VALUES ('110101', '东城区', 3, '110100', '北京城区', '010', '0100399');
INSERT INTO `t_sys_area` VALUES ('110102', '西城区', 3, '110100', '北京城区', '010', '0100499');
INSERT INTO `t_sys_area` VALUES ('110105', '朝阳区', 3, '110100', '北京城区', '010', '0100599');
INSERT INTO `t_sys_area` VALUES ('110106', '丰台区', 3, '110100', '北京城区', '010', '0100699');
INSERT INTO `t_sys_area` VALUES ('110107', '石景山区', 3, '110100', '北京城区', '010', '0100799');
INSERT INTO `t_sys_area` VALUES ('110108', '海淀区', 3, '110100', '北京城区', '010', '0100899');
INSERT INTO `t_sys_area` VALUES ('110109', '门头沟区', 3, '110100', '北京城区', '010', '0100999');
INSERT INTO `t_sys_area` VALUES ('110111', '房山区', 3, '110100', '北京城区', '010', '0101099');
INSERT INTO `t_sys_area` VALUES ('110112', '通州区', 3, '110100', '北京城区', '010', '0101199');
INSERT INTO `t_sys_area` VALUES ('110113', '顺义区', 3, '110100', '北京城区', '010', '0101299');
INSERT INTO `t_sys_area` VALUES ('110114', '昌平区', 3, '110100', '北京城区', '010', '0101399');
INSERT INTO `t_sys_area` VALUES ('110115', '大兴区', 3, '110100', '北京城区', '010', '0101499');
INSERT INTO `t_sys_area` VALUES ('110116', '怀柔区', 3, '110100', '北京城区', '010', '0101599');
INSERT INTO `t_sys_area` VALUES ('110117', '平谷区', 3, '110100', '北京城区', '010', '0101699');
INSERT INTO `t_sys_area` VALUES ('110118', '密云区', 3, '110100', '北京城区', '010', NULL);
INSERT INTO `t_sys_area` VALUES ('110119', '延庆区', 3, '110100', '北京城区', '010', NULL);
INSERT INTO `t_sys_area` VALUES ('120000', '天津市', 1, '000000', '中华人民共和国', '022', NULL);
INSERT INTO `t_sys_area` VALUES ('120100', '天津城区', 2, '120000', '天津市', '022', NULL);
INSERT INTO `t_sys_area` VALUES ('120101', '和平区', 3, '120100', '天津城区', '022', '0220199');
INSERT INTO `t_sys_area` VALUES ('120102', '河东区', 3, '120100', '天津城区', '022', '0220299');
INSERT INTO `t_sys_area` VALUES ('120103', '河西区', 3, '120100', '天津城区', '022', '0220399');
INSERT INTO `t_sys_area` VALUES ('120104', '南开区', 3, '120100', '天津城区', '022', '0220499');
INSERT INTO `t_sys_area` VALUES ('120105', '河北区', 3, '120100', '天津城区', '022', '0220599');
INSERT INTO `t_sys_area` VALUES ('120106', '红桥区', 3, '120100', '天津城区', '022', '0220699');
INSERT INTO `t_sys_area` VALUES ('120110', '东丽区', 3, '120100', '天津城区', '022', '0221099');
INSERT INTO `t_sys_area` VALUES ('120111', '西青区', 3, '120100', '天津城区', '022', '0221199');
INSERT INTO `t_sys_area` VALUES ('120112', '津南区', 3, '120100', '天津城区', '022', '0221299');
INSERT INTO `t_sys_area` VALUES ('120113', '北辰区', 3, '120100', '天津城区', '022', '0221399');
INSERT INTO `t_sys_area` VALUES ('120114', '武清区', 3, '120100', '天津城区', '022', '0221499');
INSERT INTO `t_sys_area` VALUES ('120115', '宝坻区', 3, '120100', '天津城区', '022', '0221599');
INSERT INTO `t_sys_area` VALUES ('120116', '滨海新区', 3, '120100', '天津城区', '022', '0220999');
INSERT INTO `t_sys_area` VALUES ('120117', '宁河区', 3, '120100', '天津城区', '022', '0221699');
INSERT INTO `t_sys_area` VALUES ('120118', '静海区', 3, '120100', '天津城区', '022', '0221799');
INSERT INTO `t_sys_area` VALUES ('120119', '蓟州区', 3, '120100', '天津城区', '022', NULL);
INSERT INTO `t_sys_area` VALUES ('130000', '河北省', 1, '000000', '中华人民共和国', NULL, NULL);
INSERT INTO `t_sys_area` VALUES ('130100', '石家庄市', 2, '130000', '河北省', '0311', NULL);
INSERT INTO `t_sys_area` VALUES ('130102', '长安区', 3, '130100', '石家庄市', '0311', '3110199');
INSERT INTO `t_sys_area` VALUES ('130104', '桥西区', 3, '130100', '石家庄市', '0311', '3110399');
INSERT INTO `t_sys_area` VALUES ('130105', '新华区', 3, '130100', '石家庄市', '0311', '3110499');
INSERT INTO `t_sys_area` VALUES ('130107', '井陉矿区', 3, '130100', '石家庄市', '0311', '3110599');
INSERT INTO `t_sys_area` VALUES ('130108', '裕华区', 3, '130100', '石家庄市', '0311', '3110699');
INSERT INTO `t_sys_area` VALUES ('130109', '藁城区', 3, '130100', '石家庄市', '0311', '3112099');
INSERT INTO `t_sys_area` VALUES ('130110', '鹿泉区', 3, '130100', '石家庄市', '0311', '3112399');
INSERT INTO `t_sys_area` VALUES ('130111', '栾城区', 3, '130100', '石家庄市', '0311', '3110999');
INSERT INTO `t_sys_area` VALUES ('130121', '井陉县', 3, '130100', '石家庄市', '0311', '3110799');
INSERT INTO `t_sys_area` VALUES ('130123', '正定县', 3, '130100', '石家庄市', '0311', '3110899');
INSERT INTO `t_sys_area` VALUES ('130125', '行唐县', 3, '130100', '石家庄市', '0311', '3111099');
INSERT INTO `t_sys_area` VALUES ('130126', '灵寿县', 3, '130100', '石家庄市', '0311', '3111199');
INSERT INTO `t_sys_area` VALUES ('130127', '高邑县', 3, '130100', '石家庄市', '0311', '3111299');
INSERT INTO `t_sys_area` VALUES ('130128', '深泽县', 3, '130100', '石家庄市', '0311', '3111399');
INSERT INTO `t_sys_area` VALUES ('130129', '赞皇县', 3, '130100', '石家庄市', '0311', '3111499');
INSERT INTO `t_sys_area` VALUES ('130130', '无极县', 3, '130100', '石家庄市', '0311', '3111599');
INSERT INTO `t_sys_area` VALUES ('130131', '平山县', 3, '130100', '石家庄市', '0311', '3111699');
INSERT INTO `t_sys_area` VALUES ('130132', '元氏县', 3, '130100', '石家庄市', '0311', '3111799');
INSERT INTO `t_sys_area` VALUES ('130133', '赵县', 3, '130100', '石家庄市', '0311', '3111899');
INSERT INTO `t_sys_area` VALUES ('130181', '辛集市', 3, '130100', '石家庄市', '0311', '3111999');
INSERT INTO `t_sys_area` VALUES ('130183', '晋州市', 3, '130100', '石家庄市', '0311', '3112199');
INSERT INTO `t_sys_area` VALUES ('130184', '新乐市', 3, '130100', '石家庄市', '0311', '3112299');
INSERT INTO `t_sys_area` VALUES ('130200', '唐山市', 2, '130000', '河北省', '0315', NULL);
INSERT INTO `t_sys_area` VALUES ('130202', '路南区', 3, '130200', '唐山市', '0315', '3150199');
INSERT INTO `t_sys_area` VALUES ('130203', '路北区', 3, '130200', '唐山市', '0315', '3150399');
INSERT INTO `t_sys_area` VALUES ('130204', '古冶区', 3, '130200', '唐山市', '0315', '3150499');
INSERT INTO `t_sys_area` VALUES ('130205', '开平区', 3, '130200', '唐山市', '0315', '3151399');
INSERT INTO `t_sys_area` VALUES ('130207', '丰南区', 3, '130200', '唐山市', '0315', '3150699');
INSERT INTO `t_sys_area` VALUES ('130208', '丰润区', 3, '130200', '唐山市', '0315', '3150799');
INSERT INTO `t_sys_area` VALUES ('130209', '曹妃甸区', 3, '130200', '唐山市', '0315', NULL);
INSERT INTO `t_sys_area` VALUES ('130223', '滦县', 3, '130200', '唐山市', '0315', '3150899');
INSERT INTO `t_sys_area` VALUES ('130224', '滦南县', 3, '130200', '唐山市', '0315', '3150999');
INSERT INTO `t_sys_area` VALUES ('130225', '乐亭县', 3, '130200', '唐山市', '0315', '3151099');
INSERT INTO `t_sys_area` VALUES ('130227', '迁西县', 3, '130200', '唐山市', '0315', '3151199');
INSERT INTO `t_sys_area` VALUES ('130229', '玉田县', 3, '130200', '唐山市', '0315', '3151299');
INSERT INTO `t_sys_area` VALUES ('130281', '遵化市', 3, '130200', '唐山市', '0315', '3151499');
INSERT INTO `t_sys_area` VALUES ('130283', '迁安市', 3, '130200', '唐山市', '0315', '3151599');
INSERT INTO `t_sys_area` VALUES ('130300', '秦皇岛市', 2, '130000', '河北省', '0335', NULL);
INSERT INTO `t_sys_area` VALUES ('130302', '海港区', 3, '130300', '秦皇岛市', '0335', '3350299');
INSERT INTO `t_sys_area` VALUES ('130303', '山海关区', 3, '130300', '秦皇岛市', '0335', '3350399');
INSERT INTO `t_sys_area` VALUES ('130304', '北戴河区', 3, '130300', '秦皇岛市', '0335', '3350499');
INSERT INTO `t_sys_area` VALUES ('130306', '抚宁区', 3, '130300', '秦皇岛市', '0335', '3350599');
INSERT INTO `t_sys_area` VALUES ('130321', '青龙满族自治县', 3, '130300', '秦皇岛市', '0335', '3350799');
INSERT INTO `t_sys_area` VALUES ('130322', '昌黎县', 3, '130300', '秦皇岛市', '0335', '3350899');
INSERT INTO `t_sys_area` VALUES ('130324', '卢龙县', 3, '130300', '秦皇岛市', '0335', '3350699');
INSERT INTO `t_sys_area` VALUES ('130400', '邯郸市', 2, '130000', '河北省', '0310', NULL);
INSERT INTO `t_sys_area` VALUES ('130402', '邯山区', 3, '130400', '邯郸市', '0310', '3100199');
INSERT INTO `t_sys_area` VALUES ('130403', '丛台区', 3, '130400', '邯郸市', '0310', '3100299');
INSERT INTO `t_sys_area` VALUES ('130404', '复兴区', 3, '130400', '邯郸市', '0310', '3100399');
INSERT INTO `t_sys_area` VALUES ('130406', '峰峰矿区', 3, '130400', '邯郸市', '0310', '3100499');
INSERT INTO `t_sys_area` VALUES ('130407', '肥乡区', 3, '130400', '邯郸市', '0310', NULL);
INSERT INTO `t_sys_area` VALUES ('130408', '永年区', 3, '130400', '邯郸市', '0310', NULL);
INSERT INTO `t_sys_area` VALUES ('130423', '临漳县', 3, '130400', '邯郸市', '0310', '3100699');
INSERT INTO `t_sys_area` VALUES ('130424', '成安县', 3, '130400', '邯郸市', '0310', '3100799');
INSERT INTO `t_sys_area` VALUES ('130425', '大名县', 3, '130400', '邯郸市', '0310', '3100899');
INSERT INTO `t_sys_area` VALUES ('130426', '涉县', 3, '130400', '邯郸市', '0310', '3100999');
INSERT INTO `t_sys_area` VALUES ('130427', '磁县', 3, '130400', '邯郸市', '0310', '3101099');
INSERT INTO `t_sys_area` VALUES ('130430', '邱县', 3, '130400', '邯郸市', '0310', '3101399');
INSERT INTO `t_sys_area` VALUES ('130431', '鸡泽县', 3, '130400', '邯郸市', '0310', '3101499');
INSERT INTO `t_sys_area` VALUES ('130432', '广平县', 3, '130400', '邯郸市', '0310', '3101599');
INSERT INTO `t_sys_area` VALUES ('130433', '馆陶县', 3, '130400', '邯郸市', '0310', '3101699');
INSERT INTO `t_sys_area` VALUES ('130434', '魏县', 3, '130400', '邯郸市', '0310', '3101799');
INSERT INTO `t_sys_area` VALUES ('130435', '曲周县', 3, '130400', '邯郸市', '0310', '3101899');
INSERT INTO `t_sys_area` VALUES ('130481', '武安市', 3, '130400', '邯郸市', '0310', '3101999');
INSERT INTO `t_sys_area` VALUES ('130500', '邢台市', 2, '130000', '河北省', '0319', NULL);
INSERT INTO `t_sys_area` VALUES ('130502', '桥东区', 3, '130500', '邢台市', '0319', '3190199');
INSERT INTO `t_sys_area` VALUES ('130503', '桥西区', 3, '130500', '邢台市', '0319', '3190299');
INSERT INTO `t_sys_area` VALUES ('130521', '邢台县', 3, '130500', '邢台市', '0319', '3190399');
INSERT INTO `t_sys_area` VALUES ('130522', '临城县', 3, '130500', '邢台市', '0319', '3190499');
INSERT INTO `t_sys_area` VALUES ('130523', '内丘县', 3, '130500', '邢台市', '0319', '3190599');
INSERT INTO `t_sys_area` VALUES ('130524', '柏乡县', 3, '130500', '邢台市', '0319', '3190699');
INSERT INTO `t_sys_area` VALUES ('130525', '隆尧县', 3, '130500', '邢台市', '0319', '3190799');
INSERT INTO `t_sys_area` VALUES ('130526', '任县', 3, '130500', '邢台市', '0319', '3190899');
INSERT INTO `t_sys_area` VALUES ('130527', '南和县', 3, '130500', '邢台市', '0319', '3190999');
INSERT INTO `t_sys_area` VALUES ('130528', '宁晋县', 3, '130500', '邢台市', '0319', '3191099');
INSERT INTO `t_sys_area` VALUES ('130529', '巨鹿县', 3, '130500', '邢台市', '0319', '3191199');
INSERT INTO `t_sys_area` VALUES ('130530', '新河县', 3, '130500', '邢台市', '0319', '3191299');
INSERT INTO `t_sys_area` VALUES ('130531', '广宗县', 3, '130500', '邢台市', '0319', '3191399');
INSERT INTO `t_sys_area` VALUES ('130532', '平乡县', 3, '130500', '邢台市', '0319', '3191499');
INSERT INTO `t_sys_area` VALUES ('130533', '威县', 3, '130500', '邢台市', '0319', '3191599');
INSERT INTO `t_sys_area` VALUES ('130534', '清河县', 3, '130500', '邢台市', '0319', '3191699');
INSERT INTO `t_sys_area` VALUES ('130535', '临西县', 3, '130500', '邢台市', '0319', '3191799');
INSERT INTO `t_sys_area` VALUES ('130581', '南宫市', 3, '130500', '邢台市', '0319', '3191899');
INSERT INTO `t_sys_area` VALUES ('130582', '沙河市', 3, '130500', '邢台市', '0319', '3191999');
INSERT INTO `t_sys_area` VALUES ('130600', '保定市', 2, '130000', '河北省', '0312', NULL);
INSERT INTO `t_sys_area` VALUES ('130602', '竞秀区', 3, '130600', '保定市', '0312', '3120199');
INSERT INTO `t_sys_area` VALUES ('130606', '莲池区', 3, '130600', '保定市', '0312', '3120399');
INSERT INTO `t_sys_area` VALUES ('130607', '满城区', 3, '130600', '保定市', '0312', NULL);
INSERT INTO `t_sys_area` VALUES ('130608', '清苑区', 3, '130600', '保定市', '0312', NULL);
INSERT INTO `t_sys_area` VALUES ('130609', '徐水区', 3, '130600', '保定市', '0312', NULL);
INSERT INTO `t_sys_area` VALUES ('130623', '涞水县', 3, '130600', '保定市', '0312', '3120699');
INSERT INTO `t_sys_area` VALUES ('130624', '阜平县', 3, '130600', '保定市', '0312', '3120799');
INSERT INTO `t_sys_area` VALUES ('130626', '定兴县', 3, '130600', '保定市', '0312', '3120999');
INSERT INTO `t_sys_area` VALUES ('130627', '唐县', 3, '130600', '保定市', '0312', '3121099');
INSERT INTO `t_sys_area` VALUES ('130628', '高阳县', 3, '130600', '保定市', '0312', '3121199');
INSERT INTO `t_sys_area` VALUES ('130629', '容城县', 3, '130600', '保定市', '0312', '3121299');
INSERT INTO `t_sys_area` VALUES ('130630', '涞源县', 3, '130600', '保定市', '0312', '3121399');
INSERT INTO `t_sys_area` VALUES ('130631', '望都县', 3, '130600', '保定市', '0312', '3121499');
INSERT INTO `t_sys_area` VALUES ('130632', '安新县', 3, '130600', '保定市', '0312', '3121599');
INSERT INTO `t_sys_area` VALUES ('130633', '易县', 3, '130600', '保定市', '0312', '3121699');
INSERT INTO `t_sys_area` VALUES ('130634', '曲阳县', 3, '130600', '保定市', '0312', '3121799');
INSERT INTO `t_sys_area` VALUES ('130635', '蠡县', 3, '130600', '保定市', '0312', '3121899');
INSERT INTO `t_sys_area` VALUES ('130636', '顺平县', 3, '130600', '保定市', '0312', '3121999');
INSERT INTO `t_sys_area` VALUES ('130637', '博野县', 3, '130600', '保定市', '0312', '3122099');
INSERT INTO `t_sys_area` VALUES ('130638', '雄县', 3, '130600', '保定市', '0312', '3122199');
INSERT INTO `t_sys_area` VALUES ('130681', '涿州市', 3, '130600', '保定市', '0312', '3122299');
INSERT INTO `t_sys_area` VALUES ('130682', '定州市', 3, '130600', '保定市', '0312', '3122399');
INSERT INTO `t_sys_area` VALUES ('130683', '安国市', 3, '130600', '保定市', '0312', '3122499');
INSERT INTO `t_sys_area` VALUES ('130684', '高碑店市', 3, '130600', '保定市', '0312', '3122599');
INSERT INTO `t_sys_area` VALUES ('130700', '张家口市', 2, '130000', '河北省', '0313', NULL);
INSERT INTO `t_sys_area` VALUES ('130702', '桥东区', 3, '130700', '张家口市', '0313', '3130199');
INSERT INTO `t_sys_area` VALUES ('130703', '桥西区', 3, '130700', '张家口市', '0313', '3130299');
INSERT INTO `t_sys_area` VALUES ('130705', '宣化区', 3, '130700', '张家口市', '0313', '3130399');
INSERT INTO `t_sys_area` VALUES ('130706', '下花园区', 3, '130700', '张家口市', '0313', '3130499');
INSERT INTO `t_sys_area` VALUES ('130708', '万全区', 3, '130700', '张家口市', '0313', NULL);
INSERT INTO `t_sys_area` VALUES ('130709', '崇礼区', 3, '130700', '张家口市', '0313', NULL);
INSERT INTO `t_sys_area` VALUES ('130722', '张北县', 3, '130700', '张家口市', '0313', '3130699');
INSERT INTO `t_sys_area` VALUES ('130723', '康保县', 3, '130700', '张家口市', '0313', '3130799');
INSERT INTO `t_sys_area` VALUES ('130724', '沽源县', 3, '130700', '张家口市', '0313', '3130899');
INSERT INTO `t_sys_area` VALUES ('130725', '尚义县', 3, '130700', '张家口市', '0313', '3130999');
INSERT INTO `t_sys_area` VALUES ('130726', '蔚县', 3, '130700', '张家口市', '0313', '3131099');
INSERT INTO `t_sys_area` VALUES ('130727', '阳原县', 3, '130700', '张家口市', '0313', '3131199');
INSERT INTO `t_sys_area` VALUES ('130728', '怀安县', 3, '130700', '张家口市', '0313', '3131299');
INSERT INTO `t_sys_area` VALUES ('130730', '怀来县', 3, '130700', '张家口市', '0313', '3131499');
INSERT INTO `t_sys_area` VALUES ('130731', '涿鹿县', 3, '130700', '张家口市', '0313', '3131599');
INSERT INTO `t_sys_area` VALUES ('130732', '赤城县', 3, '130700', '张家口市', '0313', '3131699');
INSERT INTO `t_sys_area` VALUES ('130800', '承德市', 2, '130000', '河北省', '0314', NULL);
INSERT INTO `t_sys_area` VALUES ('130802', '双桥区', 3, '130800', '承德市', '0314', '3140199');
INSERT INTO `t_sys_area` VALUES ('130803', '双滦区', 3, '130800', '承德市', '0314', '3140299');
INSERT INTO `t_sys_area` VALUES ('130804', '鹰手营子矿区', 3, '130800', '承德市', '0314', '3140399');
INSERT INTO `t_sys_area` VALUES ('130821', '承德县', 3, '130800', '承德市', '0314', '3140499');
INSERT INTO `t_sys_area` VALUES ('130822', '兴隆县', 3, '130800', '承德市', '0314', '3140599');
INSERT INTO `t_sys_area` VALUES ('130824', '滦平县', 3, '130800', '承德市', '0314', '3140799');
INSERT INTO `t_sys_area` VALUES ('130825', '隆化县', 3, '130800', '承德市', '0314', '3140899');
INSERT INTO `t_sys_area` VALUES ('130826', '丰宁满族自治县', 3, '130800', '承德市', '0314', '3140999');
INSERT INTO `t_sys_area` VALUES ('130827', '宽城满族自治县', 3, '130800', '承德市', '0314', '3141099');
INSERT INTO `t_sys_area` VALUES ('130828', '围场满族蒙古族自治县', 3, '130800', '承德市', '0314', '3141199');
INSERT INTO `t_sys_area` VALUES ('130881', '平泉市', 3, '130800', '承德市', '0314', NULL);
INSERT INTO `t_sys_area` VALUES ('130900', '沧州市', 2, '130000', '河北省', '0317', NULL);
INSERT INTO `t_sys_area` VALUES ('130902', '新华区', 3, '130900', '沧州市', '0317', '3170199');
INSERT INTO `t_sys_area` VALUES ('130903', '运河区', 3, '130900', '沧州市', '0317', '3170299');
INSERT INTO `t_sys_area` VALUES ('130921', '沧县', 3, '130900', '沧州市', '0317', '3170399');
INSERT INTO `t_sys_area` VALUES ('130922', '青县', 3, '130900', '沧州市', '0317', '3170499');
INSERT INTO `t_sys_area` VALUES ('130923', '东光县', 3, '130900', '沧州市', '0317', '3170599');
INSERT INTO `t_sys_area` VALUES ('130924', '海兴县', 3, '130900', '沧州市', '0317', '3170699');
INSERT INTO `t_sys_area` VALUES ('130925', '盐山县', 3, '130900', '沧州市', '0317', '3170799');
INSERT INTO `t_sys_area` VALUES ('130926', '肃宁县', 3, '130900', '沧州市', '0317', '3170899');
INSERT INTO `t_sys_area` VALUES ('130927', '南皮县', 3, '130900', '沧州市', '0317', '3170999');
INSERT INTO `t_sys_area` VALUES ('130928', '吴桥县', 3, '130900', '沧州市', '0317', '3171099');
INSERT INTO `t_sys_area` VALUES ('130929', '献县', 3, '130900', '沧州市', '0317', '3171199');
INSERT INTO `t_sys_area` VALUES ('130930', '孟村回族自治县', 3, '130900', '沧州市', '0317', '3171299');
INSERT INTO `t_sys_area` VALUES ('130981', '泊头市', 3, '130900', '沧州市', '0317', '3171399');
INSERT INTO `t_sys_area` VALUES ('130982', '任丘市', 3, '130900', '沧州市', '0317', '3171499');
INSERT INTO `t_sys_area` VALUES ('130983', '黄骅市', 3, '130900', '沧州市', '0317', '3171599');
INSERT INTO `t_sys_area` VALUES ('130984', '河间市', 3, '130900', '沧州市', '0317', '3171699');
INSERT INTO `t_sys_area` VALUES ('131000', '廊坊市', 2, '130000', '河北省', '0316', NULL);
INSERT INTO `t_sys_area` VALUES ('131002', '安次区', 3, '131000', '廊坊市', '0316', '3160199');
INSERT INTO `t_sys_area` VALUES ('131003', '广阳区', 3, '131000', '廊坊市', '0316', '3160299');
INSERT INTO `t_sys_area` VALUES ('131022', '固安县', 3, '131000', '廊坊市', '0316', '3160399');
INSERT INTO `t_sys_area` VALUES ('131023', '永清县', 3, '131000', '廊坊市', '0316', '3160499');
INSERT INTO `t_sys_area` VALUES ('131024', '香河县', 3, '131000', '廊坊市', '0316', '3160599');
INSERT INTO `t_sys_area` VALUES ('131025', '大城县', 3, '131000', '廊坊市', '0316', '3160699');
INSERT INTO `t_sys_area` VALUES ('131026', '文安县', 3, '131000', '廊坊市', '0316', '3160799');
INSERT INTO `t_sys_area` VALUES ('131028', '大厂回族自治县', 3, '131000', '廊坊市', '0316', '3160899');
INSERT INTO `t_sys_area` VALUES ('131081', '霸州市', 3, '131000', '廊坊市', '0316', '3160999');
INSERT INTO `t_sys_area` VALUES ('131082', '三河市', 3, '131000', '廊坊市', '0316', '3161099');
INSERT INTO `t_sys_area` VALUES ('131100', '衡水市', 2, '130000', '河北省', '0318', NULL);
INSERT INTO `t_sys_area` VALUES ('131102', '桃城区', 3, '131100', '衡水市', '0318', '3180199');
INSERT INTO `t_sys_area` VALUES ('131103', '冀州区', 3, '131100', '衡水市', '0318', NULL);
INSERT INTO `t_sys_area` VALUES ('131121', '枣强县', 3, '131100', '衡水市', '0318', '3180299');
INSERT INTO `t_sys_area` VALUES ('131122', '武邑县', 3, '131100', '衡水市', '0318', '3180399');
INSERT INTO `t_sys_area` VALUES ('131123', '武强县', 3, '131100', '衡水市', '0318', '3180499');
INSERT INTO `t_sys_area` VALUES ('131124', '饶阳县', 3, '131100', '衡水市', '0318', '3180599');
INSERT INTO `t_sys_area` VALUES ('131125', '安平县', 3, '131100', '衡水市', '0318', '3180699');
INSERT INTO `t_sys_area` VALUES ('131126', '故城县', 3, '131100', '衡水市', '0318', '3180799');
INSERT INTO `t_sys_area` VALUES ('131127', '景县', 3, '131100', '衡水市', '0318', '3180899');
INSERT INTO `t_sys_area` VALUES ('131128', '阜城县', 3, '131100', '衡水市', '0318', '3180999');
INSERT INTO `t_sys_area` VALUES ('131182', '深州市', 3, '131100', '衡水市', '0318', '3181199');
INSERT INTO `t_sys_area` VALUES ('140000', '山西省', 1, '000000', '中华人民共和国', NULL, NULL);
INSERT INTO `t_sys_area` VALUES ('140100', '太原市', 2, '140000', '山西省', '0351', NULL);
INSERT INTO `t_sys_area` VALUES ('140105', '小店区', 3, '140100', '太原市', '0351', '3510199');
INSERT INTO `t_sys_area` VALUES ('140106', '迎泽区', 3, '140100', '太原市', '0351', '3510299');
INSERT INTO `t_sys_area` VALUES ('140107', '杏花岭区', 3, '140100', '太原市', '0351', '3510399');
INSERT INTO `t_sys_area` VALUES ('140108', '尖草坪区', 3, '140100', '太原市', '0351', '3510499');
INSERT INTO `t_sys_area` VALUES ('140109', '万柏林区', 3, '140100', '太原市', '0351', '3510599');
INSERT INTO `t_sys_area` VALUES ('140110', '晋源区', 3, '140100', '太原市', '0351', '3510699');
INSERT INTO `t_sys_area` VALUES ('140121', '清徐县', 3, '140100', '太原市', '0351', '3510799');
INSERT INTO `t_sys_area` VALUES ('140122', '阳曲县', 3, '140100', '太原市', '0351', '3510899');
INSERT INTO `t_sys_area` VALUES ('140123', '娄烦县', 3, '140100', '太原市', '0351', '3510999');
INSERT INTO `t_sys_area` VALUES ('140181', '古交市', 3, '140100', '太原市', '0351', '3511099');
INSERT INTO `t_sys_area` VALUES ('140200', '大同市', 2, '140000', '山西省', '0352', NULL);
INSERT INTO `t_sys_area` VALUES ('140202', '城区', 3, '140200', '大同市', '0352', '3520199');
INSERT INTO `t_sys_area` VALUES ('140203', '矿区', 3, '140200', '大同市', '0352', '3520299');
INSERT INTO `t_sys_area` VALUES ('140211', '南郊区', 3, '140200', '大同市', '0352', '3520399');
INSERT INTO `t_sys_area` VALUES ('140212', '新荣区', 3, '140200', '大同市', '0352', '3520499');
INSERT INTO `t_sys_area` VALUES ('140221', '阳高县', 3, '140200', '大同市', '0352', '3520599');
INSERT INTO `t_sys_area` VALUES ('140222', '天镇县', 3, '140200', '大同市', '0352', '3520699');
INSERT INTO `t_sys_area` VALUES ('140223', '广灵县', 3, '140200', '大同市', '0352', '3520799');
INSERT INTO `t_sys_area` VALUES ('140224', '灵丘县', 3, '140200', '大同市', '0352', '3520899');
INSERT INTO `t_sys_area` VALUES ('140225', '浑源县', 3, '140200', '大同市', '0352', '3520999');
INSERT INTO `t_sys_area` VALUES ('140226', '左云县', 3, '140200', '大同市', '0352', '3521099');
INSERT INTO `t_sys_area` VALUES ('140227', '大同县', 3, '140200', '大同市', '0352', '3521199');
INSERT INTO `t_sys_area` VALUES ('140300', '阳泉市', 2, '140000', '山西省', '0353', NULL);
INSERT INTO `t_sys_area` VALUES ('140302', '城区', 3, '140300', '阳泉市', '0353', '3530199');
INSERT INTO `t_sys_area` VALUES ('140303', '矿区', 3, '140300', '阳泉市', '0353', '3530299');
INSERT INTO `t_sys_area` VALUES ('140311', '郊区', 3, '140300', '阳泉市', '0353', '3530399');
INSERT INTO `t_sys_area` VALUES ('140321', '平定县', 3, '140300', '阳泉市', '0353', '3530499');
INSERT INTO `t_sys_area` VALUES ('140322', '盂县', 3, '140300', '阳泉市', '0353', '3530599');
INSERT INTO `t_sys_area` VALUES ('140400', '长治市', 2, '140000', '山西省', '0355', NULL);
INSERT INTO `t_sys_area` VALUES ('140402', '城区', 3, '140400', '长治市', '0355', '3550199');
INSERT INTO `t_sys_area` VALUES ('140411', '郊区', 3, '140400', '长治市', '0355', '3550299');
INSERT INTO `t_sys_area` VALUES ('140421', '长治县', 3, '140400', '长治市', '0355', '3550399');
INSERT INTO `t_sys_area` VALUES ('140423', '襄垣县', 3, '140400', '长治市', '0355', '3550499');
INSERT INTO `t_sys_area` VALUES ('140424', '屯留县', 3, '140400', '长治市', '0355', '3550599');
INSERT INTO `t_sys_area` VALUES ('140425', '平顺县', 3, '140400', '长治市', '0355', '3550699');
INSERT INTO `t_sys_area` VALUES ('140426', '黎城县', 3, '140400', '长治市', '0355', '3550799');
INSERT INTO `t_sys_area` VALUES ('140427', '壶关县', 3, '140400', '长治市', '0355', '3550899');
INSERT INTO `t_sys_area` VALUES ('140428', '长子县', 3, '140400', '长治市', '0355', '3550999');
INSERT INTO `t_sys_area` VALUES ('140429', '武乡县', 3, '140400', '长治市', '0355', '3551099');
INSERT INTO `t_sys_area` VALUES ('140430', '沁县', 3, '140400', '长治市', '0355', '3551199');
INSERT INTO `t_sys_area` VALUES ('140431', '沁源县', 3, '140400', '长治市', '0355', '3551299');
INSERT INTO `t_sys_area` VALUES ('140481', '潞城市', 3, '140400', '长治市', '0355', '3551399');
INSERT INTO `t_sys_area` VALUES ('140500', '晋城市', 2, '140000', '山西省', '0356', NULL);
INSERT INTO `t_sys_area` VALUES ('140502', '城区', 3, '140500', '晋城市', '0356', '3560199');
INSERT INTO `t_sys_area` VALUES ('140521', '沁水县', 3, '140500', '晋城市', '0356', '3560299');
INSERT INTO `t_sys_area` VALUES ('140522', '阳城县', 3, '140500', '晋城市', '0356', '3560399');
INSERT INTO `t_sys_area` VALUES ('140524', '陵川县', 3, '140500', '晋城市', '0356', '3560499');
INSERT INTO `t_sys_area` VALUES ('140525', '泽州县', 3, '140500', '晋城市', '0356', '3560599');
INSERT INTO `t_sys_area` VALUES ('140581', '高平市', 3, '140500', '晋城市', '0356', '3560699');
INSERT INTO `t_sys_area` VALUES ('140600', '朔州市', 2, '140000', '山西省', '0349', NULL);
INSERT INTO `t_sys_area` VALUES ('140602', '朔城区', 3, '140600', '朔州市', '0349', '3490199');
INSERT INTO `t_sys_area` VALUES ('140603', '平鲁区', 3, '140600', '朔州市', '0349', '3490299');
INSERT INTO `t_sys_area` VALUES ('140621', '山阴县', 3, '140600', '朔州市', '0349', '3490399');
INSERT INTO `t_sys_area` VALUES ('140622', '应县', 3, '140600', '朔州市', '0349', '3490499');
INSERT INTO `t_sys_area` VALUES ('140623', '右玉县', 3, '140600', '朔州市', '0349', '3490599');
INSERT INTO `t_sys_area` VALUES ('140624', '怀仁县', 3, '140600', '朔州市', '0349', '3490699');
INSERT INTO `t_sys_area` VALUES ('140700', '晋中市', 2, '140000', '山西省', '0354', NULL);
INSERT INTO `t_sys_area` VALUES ('140702', '榆次区', 3, '140700', '晋中市', '0354', '3540199');
INSERT INTO `t_sys_area` VALUES ('140721', '榆社县', 3, '140700', '晋中市', '0354', '3540299');
INSERT INTO `t_sys_area` VALUES ('140722', '左权县', 3, '140700', '晋中市', '0354', '3540399');
INSERT INTO `t_sys_area` VALUES ('140723', '和顺县', 3, '140700', '晋中市', '0354', '3540499');
INSERT INTO `t_sys_area` VALUES ('140724', '昔阳县', 3, '140700', '晋中市', '0354', '3540599');
INSERT INTO `t_sys_area` VALUES ('140725', '寿阳县', 3, '140700', '晋中市', '0354', '3540699');
INSERT INTO `t_sys_area` VALUES ('140726', '太谷县', 3, '140700', '晋中市', '0354', '3540799');
INSERT INTO `t_sys_area` VALUES ('140727', '祁县', 3, '140700', '晋中市', '0354', '3540899');
INSERT INTO `t_sys_area` VALUES ('140728', '平遥县', 3, '140700', '晋中市', '0354', '3540999');
INSERT INTO `t_sys_area` VALUES ('140729', '灵石县', 3, '140700', '晋中市', '0354', '3541099');
INSERT INTO `t_sys_area` VALUES ('140781', '介休市', 3, '140700', '晋中市', '0354', '3541199');
INSERT INTO `t_sys_area` VALUES ('140800', '运城市', 2, '140000', '山西省', '0359', NULL);
INSERT INTO `t_sys_area` VALUES ('140802', '盐湖区', 3, '140800', '运城市', '0359', '3590199');
INSERT INTO `t_sys_area` VALUES ('140821', '临猗县', 3, '140800', '运城市', '0359', '3590299');
INSERT INTO `t_sys_area` VALUES ('140822', '万荣县', 3, '140800', '运城市', '0359', '3590399');
INSERT INTO `t_sys_area` VALUES ('140823', '闻喜县', 3, '140800', '运城市', '0359', '3590499');
INSERT INTO `t_sys_area` VALUES ('140824', '稷山县', 3, '140800', '运城市', '0359', '3590599');
INSERT INTO `t_sys_area` VALUES ('140825', '新绛县', 3, '140800', '运城市', '0359', '3590699');
INSERT INTO `t_sys_area` VALUES ('140826', '绛县', 3, '140800', '运城市', '0359', '3590799');
INSERT INTO `t_sys_area` VALUES ('140827', '垣曲县', 3, '140800', '运城市', '0359', '3590899');
INSERT INTO `t_sys_area` VALUES ('140828', '夏县', 3, '140800', '运城市', '0359', '3590999');
INSERT INTO `t_sys_area` VALUES ('140829', '平陆县', 3, '140800', '运城市', '0359', '3591099');
INSERT INTO `t_sys_area` VALUES ('140830', '芮城县', 3, '140800', '运城市', '0359', '3591199');
INSERT INTO `t_sys_area` VALUES ('140881', '永济市', 3, '140800', '运城市', '0359', '3591299');
INSERT INTO `t_sys_area` VALUES ('140882', '河津市', 3, '140800', '运城市', '0359', '3591399');
INSERT INTO `t_sys_area` VALUES ('140900', '忻州市', 2, '140000', '山西省', '0350', NULL);
INSERT INTO `t_sys_area` VALUES ('140902', '忻府区', 3, '140900', '忻州市', '0350', '3500199');
INSERT INTO `t_sys_area` VALUES ('140921', '定襄县', 3, '140900', '忻州市', '0350', '3500299');
INSERT INTO `t_sys_area` VALUES ('140922', '五台县', 3, '140900', '忻州市', '0350', '3500399');
INSERT INTO `t_sys_area` VALUES ('140923', '代县', 3, '140900', '忻州市', '0350', '3500499');
INSERT INTO `t_sys_area` VALUES ('140924', '繁峙县', 3, '140900', '忻州市', '0350', '3500599');
INSERT INTO `t_sys_area` VALUES ('140925', '宁武县', 3, '140900', '忻州市', '0350', '3500699');
INSERT INTO `t_sys_area` VALUES ('140926', '静乐县', 3, '140900', '忻州市', '0350', '3500799');
INSERT INTO `t_sys_area` VALUES ('140927', '神池县', 3, '140900', '忻州市', '0350', '3500899');
INSERT INTO `t_sys_area` VALUES ('140928', '五寨县', 3, '140900', '忻州市', '0350', '3500999');
INSERT INTO `t_sys_area` VALUES ('140929', '岢岚县', 3, '140900', '忻州市', '0350', '3501099');
INSERT INTO `t_sys_area` VALUES ('140930', '河曲县', 3, '140900', '忻州市', '0350', '3501199');
INSERT INTO `t_sys_area` VALUES ('140931', '保德县', 3, '140900', '忻州市', '0350', '3501299');
INSERT INTO `t_sys_area` VALUES ('140932', '偏关县', 3, '140900', '忻州市', '0350', '3501399');
INSERT INTO `t_sys_area` VALUES ('140981', '原平市', 3, '140900', '忻州市', '0350', '3501499');
INSERT INTO `t_sys_area` VALUES ('141000', '临汾市', 2, '140000', '山西省', '0357', NULL);
INSERT INTO `t_sys_area` VALUES ('141002', '尧都区', 3, '141000', '临汾市', '0357', '3570199');
INSERT INTO `t_sys_area` VALUES ('141021', '曲沃县', 3, '141000', '临汾市', '0357', '3570299');
INSERT INTO `t_sys_area` VALUES ('141022', '翼城县', 3, '141000', '临汾市', '0357', '3570399');
INSERT INTO `t_sys_area` VALUES ('141023', '襄汾县', 3, '141000', '临汾市', '0357', '3570499');
INSERT INTO `t_sys_area` VALUES ('141024', '洪洞县', 3, '141000', '临汾市', '0357', '3570599');
INSERT INTO `t_sys_area` VALUES ('141025', '古县', 3, '141000', '临汾市', '0357', '3570699');
INSERT INTO `t_sys_area` VALUES ('141026', '安泽县', 3, '141000', '临汾市', '0357', '3570799');
INSERT INTO `t_sys_area` VALUES ('141027', '浮山县', 3, '141000', '临汾市', '0357', '3570899');
INSERT INTO `t_sys_area` VALUES ('141028', '吉县', 3, '141000', '临汾市', '0357', '3570999');
INSERT INTO `t_sys_area` VALUES ('141029', '乡宁县', 3, '141000', '临汾市', '0357', '3571099');
INSERT INTO `t_sys_area` VALUES ('141030', '大宁县', 3, '141000', '临汾市', '0357', '3571199');
INSERT INTO `t_sys_area` VALUES ('141031', '隰县', 3, '141000', '临汾市', '0357', '3571299');
INSERT INTO `t_sys_area` VALUES ('141032', '永和县', 3, '141000', '临汾市', '0357', '3571399');
INSERT INTO `t_sys_area` VALUES ('141033', '蒲县', 3, '141000', '临汾市', '0357', '3571499');
INSERT INTO `t_sys_area` VALUES ('141034', '汾西县', 3, '141000', '临汾市', '0357', '3571599');
INSERT INTO `t_sys_area` VALUES ('141081', '侯马市', 3, '141000', '临汾市', '0357', '3571699');
INSERT INTO `t_sys_area` VALUES ('141082', '霍州市', 3, '141000', '临汾市', '0357', '3571799');
INSERT INTO `t_sys_area` VALUES ('141100', '吕梁市', 2, '140000', '山西省', '0358', NULL);
INSERT INTO `t_sys_area` VALUES ('141102', '离石区', 3, '141100', '吕梁市', '0358', '3580199');
INSERT INTO `t_sys_area` VALUES ('141121', '文水县', 3, '141100', '吕梁市', '0358', '3580299');
INSERT INTO `t_sys_area` VALUES ('141122', '交城县', 3, '141100', '吕梁市', '0358', '3580399');
INSERT INTO `t_sys_area` VALUES ('141123', '兴县', 3, '141100', '吕梁市', '0358', '3580499');
INSERT INTO `t_sys_area` VALUES ('141124', '临县', 3, '141100', '吕梁市', '0358', '3580599');
INSERT INTO `t_sys_area` VALUES ('141125', '柳林县', 3, '141100', '吕梁市', '0358', '3580699');
INSERT INTO `t_sys_area` VALUES ('141126', '石楼县', 3, '141100', '吕梁市', '0358', '3580799');
INSERT INTO `t_sys_area` VALUES ('141127', '岚县', 3, '141100', '吕梁市', '0358', '3580899');
INSERT INTO `t_sys_area` VALUES ('141128', '方山县', 3, '141100', '吕梁市', '0358', '3580999');
INSERT INTO `t_sys_area` VALUES ('141129', '中阳县', 3, '141100', '吕梁市', '0358', '3581099');
INSERT INTO `t_sys_area` VALUES ('141130', '交口县', 3, '141100', '吕梁市', '0358', '3581199');
INSERT INTO `t_sys_area` VALUES ('141181', '孝义市', 3, '141100', '吕梁市', '0358', '3581299');
INSERT INTO `t_sys_area` VALUES ('141182', '汾阳市', 3, '141100', '吕梁市', '0358', '3581399');
INSERT INTO `t_sys_area` VALUES ('150000', '内蒙古自治区', 1, '000000', '中华人民共和国', NULL, NULL);
INSERT INTO `t_sys_area` VALUES ('150100', '呼和浩特市', 2, '150000', '内蒙古自治区', '0471', NULL);
INSERT INTO `t_sys_area` VALUES ('150102', '新城区', 3, '150100', '呼和浩特市', '0471', '4710199');
INSERT INTO `t_sys_area` VALUES ('150103', '回民区', 3, '150100', '呼和浩特市', '0471', '4710299');
INSERT INTO `t_sys_area` VALUES ('150104', '玉泉区', 3, '150100', '呼和浩特市', '0471', '4710399');
INSERT INTO `t_sys_area` VALUES ('150105', '赛罕区', 3, '150100', '呼和浩特市', '0471', '4710499');
INSERT INTO `t_sys_area` VALUES ('150121', '土默特左旗', 3, '150100', '呼和浩特市', '0471', '4710599');
INSERT INTO `t_sys_area` VALUES ('150122', '托克托县', 3, '150100', '呼和浩特市', '0471', '4710699');
INSERT INTO `t_sys_area` VALUES ('150123', '和林格尔县', 3, '150100', '呼和浩特市', '0471', '4710799');
INSERT INTO `t_sys_area` VALUES ('150124', '清水河县', 3, '150100', '呼和浩特市', '0471', '4710899');
INSERT INTO `t_sys_area` VALUES ('150125', '武川县', 3, '150100', '呼和浩特市', '0471', '4710999');
INSERT INTO `t_sys_area` VALUES ('150200', '包头市', 2, '150000', '内蒙古自治区', '0472', NULL);
INSERT INTO `t_sys_area` VALUES ('150202', '东河区', 3, '150200', '包头市', '0472', '4720199');
INSERT INTO `t_sys_area` VALUES ('150203', '昆都仑区', 3, '150200', '包头市', '0472', '4720299');
INSERT INTO `t_sys_area` VALUES ('150204', '青山区', 3, '150200', '包头市', '0472', '4720399');
INSERT INTO `t_sys_area` VALUES ('150205', '石拐区', 3, '150200', '包头市', '0472', '4720499');
INSERT INTO `t_sys_area` VALUES ('150206', '白云鄂博矿区', 3, '150200', '包头市', '0472', '4720599');
INSERT INTO `t_sys_area` VALUES ('150207', '九原区', 3, '150200', '包头市', '0472', '4720699');
INSERT INTO `t_sys_area` VALUES ('150221', '土默特右旗', 3, '150200', '包头市', '0472', '4720799');
INSERT INTO `t_sys_area` VALUES ('150222', '固阳县', 3, '150200', '包头市', '0472', '4720899');
INSERT INTO `t_sys_area` VALUES ('150223', '达尔罕茂明安联合旗', 3, '150200', '包头市', '0472', '4720999');
INSERT INTO `t_sys_area` VALUES ('150300', '乌海市', 2, '150000', '内蒙古自治区', '0473', NULL);
INSERT INTO `t_sys_area` VALUES ('150302', '海勃湾区', 3, '150300', '乌海市', '0473', '4730199');
INSERT INTO `t_sys_area` VALUES ('150303', '海南区', 3, '150300', '乌海市', '0473', '4730299');
INSERT INTO `t_sys_area` VALUES ('150304', '乌达区', 3, '150300', '乌海市', '0473', '4730399');
INSERT INTO `t_sys_area` VALUES ('150400', '赤峰市', 2, '150000', '内蒙古自治区', '0476', NULL);
INSERT INTO `t_sys_area` VALUES ('150402', '红山区', 3, '150400', '赤峰市', '0476', '4760199');
INSERT INTO `t_sys_area` VALUES ('150403', '元宝山区', 3, '150400', '赤峰市', '0476', '4760399');
INSERT INTO `t_sys_area` VALUES ('150404', '松山区', 3, '150400', '赤峰市', '0476', '4760299');
INSERT INTO `t_sys_area` VALUES ('150421', '阿鲁科尔沁旗', 3, '150400', '赤峰市', '0476', '4760699');
INSERT INTO `t_sys_area` VALUES ('150422', '巴林左旗', 3, '150400', '赤峰市', '0476', '4760799');
INSERT INTO `t_sys_area` VALUES ('150423', '巴林右旗', 3, '150400', '赤峰市', '0476', '4760899');
INSERT INTO `t_sys_area` VALUES ('150424', '林西县', 3, '150400', '赤峰市', '0476', '4760599');
INSERT INTO `t_sys_area` VALUES ('150425', '克什克腾旗', 3, '150400', '赤峰市', '0476', '4760999');
INSERT INTO `t_sys_area` VALUES ('150426', '翁牛特旗', 3, '150400', '赤峰市', '0476', '4761099');
INSERT INTO `t_sys_area` VALUES ('150428', '喀喇沁旗', 3, '150400', '赤峰市', '0476', '4761199');
INSERT INTO `t_sys_area` VALUES ('150429', '宁城县', 3, '150400', '赤峰市', '0476', '4760499');
INSERT INTO `t_sys_area` VALUES ('150430', '敖汉旗', 3, '150400', '赤峰市', '0476', '4761299');
INSERT INTO `t_sys_area` VALUES ('150500', '通辽市', 2, '150000', '内蒙古自治区', '0475', NULL);
INSERT INTO `t_sys_area` VALUES ('150502', '科尔沁区', 3, '150500', '通辽市', '0475', '4750199');
INSERT INTO `t_sys_area` VALUES ('150521', '科尔沁左翼中旗', 3, '150500', '通辽市', '0475', '4750299');
INSERT INTO `t_sys_area` VALUES ('150522', '科尔沁左翼后旗', 3, '150500', '通辽市', '0475', '4750399');
INSERT INTO `t_sys_area` VALUES ('150523', '开鲁县', 3, '150500', '通辽市', '0475', '4750499');
INSERT INTO `t_sys_area` VALUES ('150524', '库伦旗', 3, '150500', '通辽市', '0475', '4750599');
INSERT INTO `t_sys_area` VALUES ('150525', '奈曼旗', 3, '150500', '通辽市', '0475', '4750699');
INSERT INTO `t_sys_area` VALUES ('150526', '扎鲁特旗', 3, '150500', '通辽市', '0475', '4750799');
INSERT INTO `t_sys_area` VALUES ('150581', '霍林郭勒市', 3, '150500', '通辽市', '0475', '4750899');
INSERT INTO `t_sys_area` VALUES ('150600', '鄂尔多斯市', 2, '150000', '内蒙古自治区', '0477', NULL);
INSERT INTO `t_sys_area` VALUES ('150602', '东胜区', 3, '150600', '鄂尔多斯市', '0477', '4770399');
INSERT INTO `t_sys_area` VALUES ('150603', '康巴什区', 3, '150600', '鄂尔多斯市', '0477', NULL);
INSERT INTO `t_sys_area` VALUES ('150621', '达拉特旗', 3, '150600', '鄂尔多斯市', '0477', '4771099');
INSERT INTO `t_sys_area` VALUES ('150622', '准格尔旗', 3, '150600', '鄂尔多斯市', '0477', '4770599');
INSERT INTO `t_sys_area` VALUES ('150623', '鄂托克前旗', 3, '150600', '鄂尔多斯市', '0477', '4770999');
INSERT INTO `t_sys_area` VALUES ('150624', '鄂托克旗', 3, '150600', '鄂尔多斯市', '0477', '4770899');
INSERT INTO `t_sys_area` VALUES ('150625', '杭锦旗', 3, '150600', '鄂尔多斯市', '0477', '4770799');
INSERT INTO `t_sys_area` VALUES ('150626', '乌审旗', 3, '150600', '鄂尔多斯市', '0477', '4770699');
INSERT INTO `t_sys_area` VALUES ('150627', '伊金霍洛旗', 3, '150600', '鄂尔多斯市', '0477', '4770499');
INSERT INTO `t_sys_area` VALUES ('150700', '呼伦贝尔市', 2, '150000', '内蒙古自治区', '0470', NULL);
INSERT INTO `t_sys_area` VALUES ('150702', '海拉尔区', 3, '150700', '呼伦贝尔市', '0470', '4700199');
INSERT INTO `t_sys_area` VALUES ('150703', '扎赉诺尔区', 3, '150700', '呼伦贝尔市', '0470', NULL);
INSERT INTO `t_sys_area` VALUES ('150721', '阿荣旗', 3, '150700', '呼伦贝尔市', '0470', NULL);
INSERT INTO `t_sys_area` VALUES ('150722', '莫力达瓦达斡尔族自治旗', 3, '150700', '呼伦贝尔市', '0470', NULL);
INSERT INTO `t_sys_area` VALUES ('150723', '鄂伦春自治旗', 3, '150700', '呼伦贝尔市', '0470', NULL);
INSERT INTO `t_sys_area` VALUES ('150724', '鄂温克族自治旗', 3, '150700', '呼伦贝尔市', '0470', NULL);
INSERT INTO `t_sys_area` VALUES ('150725', '陈巴尔虎旗', 3, '150700', '呼伦贝尔市', '0470', NULL);
INSERT INTO `t_sys_area` VALUES ('150726', '新巴尔虎左旗', 3, '150700', '呼伦贝尔市', '0470', NULL);
INSERT INTO `t_sys_area` VALUES ('150727', '新巴尔虎右旗', 3, '150700', '呼伦贝尔市', '0470', NULL);
INSERT INTO `t_sys_area` VALUES ('150781', '满洲里市', 3, '150700', '呼伦贝尔市', '0470', NULL);
INSERT INTO `t_sys_area` VALUES ('150782', '牙克石市', 3, '150700', '呼伦贝尔市', '0470', NULL);
INSERT INTO `t_sys_area` VALUES ('150783', '扎兰屯市', 3, '150700', '呼伦贝尔市', '0470', '4700599');
INSERT INTO `t_sys_area` VALUES ('150784', '额尔古纳市', 3, '150700', '呼伦贝尔市', '0470', NULL);
INSERT INTO `t_sys_area` VALUES ('150785', '根河市', 3, '150700', '呼伦贝尔市', '0470', NULL);
INSERT INTO `t_sys_area` VALUES ('150800', '巴彦淖尔市', 2, '150000', '内蒙古自治区', '0478', NULL);
INSERT INTO `t_sys_area` VALUES ('150802', '临河区', 3, '150800', '巴彦淖尔市', '0478', '4780199');
INSERT INTO `t_sys_area` VALUES ('150821', '五原县', 3, '150800', '巴彦淖尔市', '0478', '4780299');
INSERT INTO `t_sys_area` VALUES ('150822', '磴口县', 3, '150800', '巴彦淖尔市', '0478', '4780399');
INSERT INTO `t_sys_area` VALUES ('150823', '乌拉特前旗', 3, '150800', '巴彦淖尔市', '0478', '4780499');
INSERT INTO `t_sys_area` VALUES ('150824', '乌拉特中旗', 3, '150800', '巴彦淖尔市', '0478', '4780599');
INSERT INTO `t_sys_area` VALUES ('150825', '乌拉特后旗', 3, '150800', '巴彦淖尔市', '0478', '4780699');
INSERT INTO `t_sys_area` VALUES ('150826', '杭锦后旗', 3, '150800', '巴彦淖尔市', '0478', '4780799');
INSERT INTO `t_sys_area` VALUES ('150900', '乌兰察布市', 2, '150000', '内蒙古自治区', '0474', NULL);
INSERT INTO `t_sys_area` VALUES ('150902', '集宁区', 3, '150900', '乌兰察布市', '0474', '4740199');
INSERT INTO `t_sys_area` VALUES ('150921', '卓资县', 3, '150900', '乌兰察布市', '0474', '4740299');
INSERT INTO `t_sys_area` VALUES ('150922', '化德县', 3, '150900', '乌兰察布市', '0474', NULL);
INSERT INTO `t_sys_area` VALUES ('150923', '商都县', 3, '150900', '乌兰察布市', '0474', NULL);
INSERT INTO `t_sys_area` VALUES ('150924', '兴和县', 3, '150900', '乌兰察布市', '0474', NULL);
INSERT INTO `t_sys_area` VALUES ('150925', '凉城县', 3, '150900', '乌兰察布市', '0474', '4740699');
INSERT INTO `t_sys_area` VALUES ('150926', '察哈尔右翼前旗', 3, '150900', '乌兰察布市', '0474', NULL);
INSERT INTO `t_sys_area` VALUES ('150927', '察哈尔右翼中旗', 3, '150900', '乌兰察布市', '0474', NULL);
INSERT INTO `t_sys_area` VALUES ('150928', '察哈尔右翼后旗', 3, '150900', '乌兰察布市', '0474', NULL);
INSERT INTO `t_sys_area` VALUES ('150929', '四子王旗', 3, '150900', '乌兰察布市', '0474', '4741099');
INSERT INTO `t_sys_area` VALUES ('150981', '丰镇市', 3, '150900', '乌兰察布市', '0474', '4741199');
INSERT INTO `t_sys_area` VALUES ('152200', '兴安盟', 2, '150000', '内蒙古自治区', '0482', NULL);
INSERT INTO `t_sys_area` VALUES ('152201', '乌兰浩特市', 3, '152200', '兴安盟', '0482', '4820199');
INSERT INTO `t_sys_area` VALUES ('152202', '阿尔山市', 3, '152200', '兴安盟', '0482', '4820299');
INSERT INTO `t_sys_area` VALUES ('152221', '科尔沁右翼前旗', 3, '152200', '兴安盟', '0482', '4820399');
INSERT INTO `t_sys_area` VALUES ('152222', '科尔沁右翼中旗', 3, '152200', '兴安盟', '0482', '4820499');
INSERT INTO `t_sys_area` VALUES ('152223', '扎赉特旗', 3, '152200', '兴安盟', '0482', '4820599');
INSERT INTO `t_sys_area` VALUES ('152224', '突泉县', 3, '152200', '兴安盟', '0482', '4820699');
INSERT INTO `t_sys_area` VALUES ('152500', '锡林郭勒盟', 2, '150000', '内蒙古自治区', '0479', NULL);
INSERT INTO `t_sys_area` VALUES ('152501', '二连浩特市', 3, '152500', '锡林郭勒盟', '0479', NULL);
INSERT INTO `t_sys_area` VALUES ('152502', '锡林浩特市', 3, '152500', '锡林郭勒盟', '0479', '4790199');
INSERT INTO `t_sys_area` VALUES ('152522', '阿巴嘎旗', 3, '152500', '锡林郭勒盟', '0479', '4790299');
INSERT INTO `t_sys_area` VALUES ('152523', '苏尼特左旗', 3, '152500', '锡林郭勒盟', '0479', NULL);
INSERT INTO `t_sys_area` VALUES ('152524', '苏尼特右旗', 3, '152500', '锡林郭勒盟', '0479', NULL);
INSERT INTO `t_sys_area` VALUES ('152525', '东乌珠穆沁旗', 3, '152500', '锡林郭勒盟', '0479', NULL);
INSERT INTO `t_sys_area` VALUES ('152526', '西乌珠穆沁旗', 3, '152500', '锡林郭勒盟', '0479', '4790399');
INSERT INTO `t_sys_area` VALUES ('152527', '太仆寺旗', 3, '152500', '锡林郭勒盟', '0479', NULL);
INSERT INTO `t_sys_area` VALUES ('152528', '镶黄旗', 3, '152500', '锡林郭勒盟', '0479', NULL);
INSERT INTO `t_sys_area` VALUES ('152529', '正镶白旗', 3, '152500', '锡林郭勒盟', '0479', NULL);
INSERT INTO `t_sys_area` VALUES ('152530', '正蓝旗', 3, '152500', '锡林郭勒盟', '0479', NULL);
INSERT INTO `t_sys_area` VALUES ('152531', '多伦县', 3, '152500', '锡林郭勒盟', '0479', NULL);
INSERT INTO `t_sys_area` VALUES ('152900', '阿拉善盟', 2, '150000', '内蒙古自治区', '0483', NULL);
INSERT INTO `t_sys_area` VALUES ('152921', '阿拉善左旗', 3, '152900', '阿拉善盟', '0483', '4830199');
INSERT INTO `t_sys_area` VALUES ('152922', '阿拉善右旗', 3, '152900', '阿拉善盟', '0483', '4830299');
INSERT INTO `t_sys_area` VALUES ('152923', '额济纳旗', 3, '152900', '阿拉善盟', '0483', '4830399');
INSERT INTO `t_sys_area` VALUES ('210000', '辽宁省', 1, '000000', '中华人民共和国', NULL, NULL);
INSERT INTO `t_sys_area` VALUES ('210100', '沈阳市', 2, '210000', '辽宁省', '024', NULL);
INSERT INTO `t_sys_area` VALUES ('210102', '和平区', 3, '210100', '沈阳市', '024', '0241499');
INSERT INTO `t_sys_area` VALUES ('210103', '沈河区', 3, '210100', '沈阳市', '024', '0241599');
INSERT INTO `t_sys_area` VALUES ('210104', '大东区', 3, '210100', '沈阳市', '024', '0241699');
INSERT INTO `t_sys_area` VALUES ('210105', '皇姑区', 3, '210100', '沈阳市', '024', '0241799');
INSERT INTO `t_sys_area` VALUES ('210106', '铁西区', 3, '210100', '沈阳市', '024', '0241899');
INSERT INTO `t_sys_area` VALUES ('210111', '苏家屯区', 3, '210100', '沈阳市', '024', '0241999');
INSERT INTO `t_sys_area` VALUES ('210112', '浑南区', 3, '210100', '沈阳市', '024', '0242399');
INSERT INTO `t_sys_area` VALUES ('210113', '沈北新区', 3, '210100', '沈阳市', '024', '0242199');
INSERT INTO `t_sys_area` VALUES ('210114', '于洪区', 3, '210100', '沈阳市', '024', '0242299');
INSERT INTO `t_sys_area` VALUES ('210115', '辽中区', 3, '210100', '沈阳市', '024', NULL);
INSERT INTO `t_sys_area` VALUES ('210123', '康平县', 3, '210100', '沈阳市', '024', '0242599');
INSERT INTO `t_sys_area` VALUES ('210124', '法库县', 3, '210100', '沈阳市', '024', '0242699');
INSERT INTO `t_sys_area` VALUES ('210181', '新民市', 3, '210100', '沈阳市', '024', '0242799');
INSERT INTO `t_sys_area` VALUES ('210200', '大连市', 2, '210000', '辽宁省', '0411', NULL);
INSERT INTO `t_sys_area` VALUES ('210202', '中山区', 3, '210200', '大连市', '0411', '4110199');
INSERT INTO `t_sys_area` VALUES ('210203', '西岗区', 3, '210200', '大连市', '0411', '4110299');
INSERT INTO `t_sys_area` VALUES ('210204', '沙河口区', 3, '210200', '大连市', '0411', '4110399');
INSERT INTO `t_sys_area` VALUES ('210211', '甘井子区', 3, '210200', '大连市', '0411', '4110499');
INSERT INTO `t_sys_area` VALUES ('210212', '旅顺口区', 3, '210200', '大连市', '0411', '4110599');
INSERT INTO `t_sys_area` VALUES ('210213', '金州区', 3, '210200', '大连市', '0411', '4110799');
INSERT INTO `t_sys_area` VALUES ('210214', '普兰店区', 3, '210200', '大连市', '0411', '4110899');
INSERT INTO `t_sys_area` VALUES ('210224', '长海县', 3, '210200', '大连市', '0411', '4111199');
INSERT INTO `t_sys_area` VALUES ('210281', '瓦房店市', 3, '210200', '大连市', '0411', '4110999');
INSERT INTO `t_sys_area` VALUES ('210283', '庄河市', 3, '210200', '大连市', '0411', '4111099');
INSERT INTO `t_sys_area` VALUES ('210300', '鞍山市', 2, '210000', '辽宁省', '0412', NULL);
INSERT INTO `t_sys_area` VALUES ('210302', '铁东区', 3, '210300', '鞍山市', '0412', '4120199');
INSERT INTO `t_sys_area` VALUES ('210303', '铁西区', 3, '210300', '鞍山市', '0412', '4120299');
INSERT INTO `t_sys_area` VALUES ('210304', '立山区', 3, '210300', '鞍山市', '0412', '4120399');
INSERT INTO `t_sys_area` VALUES ('210311', '千山区', 3, '210300', '鞍山市', '0412', '4120499');
INSERT INTO `t_sys_area` VALUES ('210321', '台安县', 3, '210300', '鞍山市', '0412', '4120599');
INSERT INTO `t_sys_area` VALUES ('210323', '岫岩满族自治县', 3, '210300', '鞍山市', '0412', '4120699');
INSERT INTO `t_sys_area` VALUES ('210381', '海城市', 3, '210300', '鞍山市', '0412', '4120799');
INSERT INTO `t_sys_area` VALUES ('210400', '抚顺市', 2, '210000', '辽宁省', '0413', NULL);
INSERT INTO `t_sys_area` VALUES ('210402', '新抚区', 3, '210400', '抚顺市', '0413', '4130199');
INSERT INTO `t_sys_area` VALUES ('210403', '东洲区', 3, '210400', '抚顺市', '0413', '4130299');
INSERT INTO `t_sys_area` VALUES ('210404', '望花区', 3, '210400', '抚顺市', '0413', '4130399');
INSERT INTO `t_sys_area` VALUES ('210411', '顺城区', 3, '210400', '抚顺市', '0413', '4130499');
INSERT INTO `t_sys_area` VALUES ('210421', '抚顺县', 3, '210400', '抚顺市', '0413', '4130599');
INSERT INTO `t_sys_area` VALUES ('210422', '新宾满族自治县', 3, '210400', '抚顺市', '0413', '4130699');
INSERT INTO `t_sys_area` VALUES ('210423', '清原满族自治县', 3, '210400', '抚顺市', '0413', '4130799');
INSERT INTO `t_sys_area` VALUES ('210500', '本溪市', 2, '210000', '辽宁省', '0414', NULL);
INSERT INTO `t_sys_area` VALUES ('210502', '平山区', 3, '210500', '本溪市', '0414', '4140199');
INSERT INTO `t_sys_area` VALUES ('210503', '溪湖区', 3, '210500', '本溪市', '0414', '4140299');
INSERT INTO `t_sys_area` VALUES ('210504', '明山区', 3, '210500', '本溪市', '0414', '4140399');
INSERT INTO `t_sys_area` VALUES ('210505', '南芬区', 3, '210500', '本溪市', '0414', '4140499');
INSERT INTO `t_sys_area` VALUES ('210521', '本溪满族自治县', 3, '210500', '本溪市', '0414', '4140599');
INSERT INTO `t_sys_area` VALUES ('210522', '桓仁满族自治县', 3, '210500', '本溪市', '0414', '4140699');
INSERT INTO `t_sys_area` VALUES ('210600', '丹东市', 2, '210000', '辽宁省', '0415', NULL);
INSERT INTO `t_sys_area` VALUES ('210602', '元宝区', 3, '210600', '丹东市', '0415', '4150199');
INSERT INTO `t_sys_area` VALUES ('210603', '振兴区', 3, '210600', '丹东市', '0415', '4150299');
INSERT INTO `t_sys_area` VALUES ('210604', '振安区', 3, '210600', '丹东市', '0415', '4150399');
INSERT INTO `t_sys_area` VALUES ('210624', '宽甸满族自治县', 3, '210600', '丹东市', '0415', '4150499');
INSERT INTO `t_sys_area` VALUES ('210681', '东港市', 3, '210600', '丹东市', '0415', '4150599');
INSERT INTO `t_sys_area` VALUES ('210682', '凤城市', 3, '210600', '丹东市', '0415', '4150699');
INSERT INTO `t_sys_area` VALUES ('210700', '锦州市', 2, '210000', '辽宁省', '0416', NULL);
INSERT INTO `t_sys_area` VALUES ('210702', '古塔区', 3, '210700', '锦州市', '0416', '4160199');
INSERT INTO `t_sys_area` VALUES ('210703', '凌河区', 3, '210700', '锦州市', '0416', '4160299');
INSERT INTO `t_sys_area` VALUES ('210711', '太和区', 3, '210700', '锦州市', '0416', '4160399');
INSERT INTO `t_sys_area` VALUES ('210726', '黑山县', 3, '210700', '锦州市', '0416', '4160499');
INSERT INTO `t_sys_area` VALUES ('210727', '义县', 3, '210700', '锦州市', '0416', '4160599');
INSERT INTO `t_sys_area` VALUES ('210781', '凌海市', 3, '210700', '锦州市', '0416', '4160699');
INSERT INTO `t_sys_area` VALUES ('210782', '北镇市', 3, '210700', '锦州市', '0416', '4160799');
INSERT INTO `t_sys_area` VALUES ('210800', '营口市', 2, '210000', '辽宁省', '0417', NULL);
INSERT INTO `t_sys_area` VALUES ('210802', '站前区', 3, '210800', '营口市', '0417', '4170199');
INSERT INTO `t_sys_area` VALUES ('210803', '西市区', 3, '210800', '营口市', '0417', '4170299');
INSERT INTO `t_sys_area` VALUES ('210804', '鲅鱼圈区', 3, '210800', '营口市', '0417', '4170399');
INSERT INTO `t_sys_area` VALUES ('210811', '老边区', 3, '210800', '营口市', '0417', '4170499');
INSERT INTO `t_sys_area` VALUES ('210881', '盖州市', 3, '210800', '营口市', '0417', '4170599');
INSERT INTO `t_sys_area` VALUES ('210882', '大石桥市', 3, '210800', '营口市', '0417', '4170699');
INSERT INTO `t_sys_area` VALUES ('210900', '阜新市', 2, '210000', '辽宁省', '0418', NULL);
INSERT INTO `t_sys_area` VALUES ('210902', '海州区', 3, '210900', '阜新市', '0418', '4180199');
INSERT INTO `t_sys_area` VALUES ('210903', '新邱区', 3, '210900', '阜新市', '0418', '4180299');
INSERT INTO `t_sys_area` VALUES ('210904', '太平区', 3, '210900', '阜新市', '0418', '4180399');
INSERT INTO `t_sys_area` VALUES ('210905', '清河门区', 3, '210900', '阜新市', '0418', '4180499');
INSERT INTO `t_sys_area` VALUES ('210911', '细河区', 3, '210900', '阜新市', '0418', '4180599');
INSERT INTO `t_sys_area` VALUES ('210921', '阜新蒙古族自治县', 3, '210900', '阜新市', '0418', '4180699');
INSERT INTO `t_sys_area` VALUES ('210922', '彰武县', 3, '210900', '阜新市', '0418', '4180799');
INSERT INTO `t_sys_area` VALUES ('211000', '辽阳市', 2, '210000', '辽宁省', '0419', NULL);
INSERT INTO `t_sys_area` VALUES ('211002', '白塔区', 3, '211000', '辽阳市', '0419', '4190199');
INSERT INTO `t_sys_area` VALUES ('211003', '文圣区', 3, '211000', '辽阳市', '0419', '4190299');
INSERT INTO `t_sys_area` VALUES ('211004', '宏伟区', 3, '211000', '辽阳市', '0419', '4190399');
INSERT INTO `t_sys_area` VALUES ('211005', '弓长岭区', 3, '211000', '辽阳市', '0419', '4190499');
INSERT INTO `t_sys_area` VALUES ('211011', '太子河区', 3, '211000', '辽阳市', '0419', '4190599');
INSERT INTO `t_sys_area` VALUES ('211021', '辽阳县', 3, '211000', '辽阳市', '0419', '4190699');
INSERT INTO `t_sys_area` VALUES ('211081', '灯塔市', 3, '211000', '辽阳市', '0419', '4190799');
INSERT INTO `t_sys_area` VALUES ('211100', '盘锦市', 2, '210000', '辽宁省', '0427', NULL);
INSERT INTO `t_sys_area` VALUES ('211102', '双台子区', 3, '211100', '盘锦市', '0427', '4270199');
INSERT INTO `t_sys_area` VALUES ('211103', '兴隆台区', 3, '211100', '盘锦市', '0427', '4270299');
INSERT INTO `t_sys_area` VALUES ('211104', '大洼区', 3, '211100', '盘锦市', '0427', NULL);
INSERT INTO `t_sys_area` VALUES ('211122', '盘山县', 3, '211100', '盘锦市', '0427', '4270499');
INSERT INTO `t_sys_area` VALUES ('211200', '铁岭市', 2, '210000', '辽宁省', '0410', NULL);
INSERT INTO `t_sys_area` VALUES ('211202', '银州区', 3, '211200', '铁岭市', '0410', '4100199');
INSERT INTO `t_sys_area` VALUES ('211204', '清河区', 3, '211200', '铁岭市', '0410', '4100299');
INSERT INTO `t_sys_area` VALUES ('211221', '铁岭县', 3, '211200', '铁岭市', '0410', '4100399');
INSERT INTO `t_sys_area` VALUES ('211223', '西丰县', 3, '211200', '铁岭市', '0410', '4100499');
INSERT INTO `t_sys_area` VALUES ('211224', '昌图县', 3, '211200', '铁岭市', '0410', '4100599');
INSERT INTO `t_sys_area` VALUES ('211281', '调兵山市', 3, '211200', '铁岭市', '0410', '4100699');
INSERT INTO `t_sys_area` VALUES ('211282', '开原市', 3, '211200', '铁岭市', '0410', '4100799');
INSERT INTO `t_sys_area` VALUES ('211300', '朝阳市', 2, '210000', '辽宁省', '0421', NULL);
INSERT INTO `t_sys_area` VALUES ('211302', '双塔区', 3, '211300', '朝阳市', '0421', '4210199');
INSERT INTO `t_sys_area` VALUES ('211303', '龙城区', 3, '211300', '朝阳市', '0421', '4210299');
INSERT INTO `t_sys_area` VALUES ('211321', '朝阳县', 3, '211300', '朝阳市', '0421', '4210399');
INSERT INTO `t_sys_area` VALUES ('211322', '建平县', 3, '211300', '朝阳市', '0421', '4210499');
INSERT INTO `t_sys_area` VALUES ('211324', '喀喇沁左翼蒙古族自治县', 3, '211300', '朝阳市', '0421', '4210599');
INSERT INTO `t_sys_area` VALUES ('211381', '北票市', 3, '211300', '朝阳市', '0421', '4210699');
INSERT INTO `t_sys_area` VALUES ('211382', '凌源市', 3, '211300', '朝阳市', '0421', '4210799');
INSERT INTO `t_sys_area` VALUES ('211400', '葫芦岛市', 2, '210000', '辽宁省', '0429', NULL);
INSERT INTO `t_sys_area` VALUES ('211402', '连山区', 3, '211400', '葫芦岛市', '0429', '4290199');
INSERT INTO `t_sys_area` VALUES ('211403', '龙港区', 3, '211400', '葫芦岛市', '0429', '4290299');
INSERT INTO `t_sys_area` VALUES ('211404', '南票区', 3, '211400', '葫芦岛市', '0429', '4290399');
INSERT INTO `t_sys_area` VALUES ('211421', '绥中县', 3, '211400', '葫芦岛市', '0429', '4290499');
INSERT INTO `t_sys_area` VALUES ('211422', '建昌县', 3, '211400', '葫芦岛市', '0429', '4290599');
INSERT INTO `t_sys_area` VALUES ('211481', '兴城市', 3, '211400', '葫芦岛市', '0429', '4290699');
INSERT INTO `t_sys_area` VALUES ('220000', '吉林省', 1, '000000', '中华人民共和国', NULL, NULL);
INSERT INTO `t_sys_area` VALUES ('220100', '长春市', 2, '220000', '吉林省', '0431', NULL);
INSERT INTO `t_sys_area` VALUES ('220102', '南关区', 3, '220100', '长春市', '0431', '4310199');
INSERT INTO `t_sys_area` VALUES ('220103', '宽城区', 3, '220100', '长春市', '0431', '4310299');
INSERT INTO `t_sys_area` VALUES ('220104', '朝阳区', 3, '220100', '长春市', '0431', '4310399');
INSERT INTO `t_sys_area` VALUES ('220105', '二道区', 3, '220100', '长春市', '0431', '4310499');
INSERT INTO `t_sys_area` VALUES ('220106', '绿园区', 3, '220100', '长春市', '0431', '4310599');
INSERT INTO `t_sys_area` VALUES ('220112', '双阳区', 3, '220100', '长春市', '0431', '4310699');
INSERT INTO `t_sys_area` VALUES ('220113', '九台区', 3, '220100', '长春市', '0431', '4310899');
INSERT INTO `t_sys_area` VALUES ('220122', '农安县', 3, '220100', '长春市', '0431', '4310799');
INSERT INTO `t_sys_area` VALUES ('220182', '榆树市', 3, '220100', '长春市', '0431', '4310999');
INSERT INTO `t_sys_area` VALUES ('220183', '德惠市', 3, '220100', '长春市', '0431', '4311099');
INSERT INTO `t_sys_area` VALUES ('220200', '吉林市', 2, '220000', '吉林省', '0432', NULL);
INSERT INTO `t_sys_area` VALUES ('220202', '昌邑区', 3, '220200', '吉林市', '0432', '4320199');
INSERT INTO `t_sys_area` VALUES ('220203', '龙潭区', 3, '220200', '吉林市', '0432', '4320299');
INSERT INTO `t_sys_area` VALUES ('220204', '船营区', 3, '220200', '吉林市', '0432', '4320399');
INSERT INTO `t_sys_area` VALUES ('220211', '丰满区', 3, '220200', '吉林市', '0432', '4320499');
INSERT INTO `t_sys_area` VALUES ('220221', '永吉县', 3, '220200', '吉林市', '0432', '4320599');
INSERT INTO `t_sys_area` VALUES ('220281', '蛟河市', 3, '220200', '吉林市', '0432', '4320699');
INSERT INTO `t_sys_area` VALUES ('220282', '桦甸市', 3, '220200', '吉林市', '0432', '4320799');
INSERT INTO `t_sys_area` VALUES ('220283', '舒兰市', 3, '220200', '吉林市', '0432', '4320899');
INSERT INTO `t_sys_area` VALUES ('220284', '磐石市', 3, '220200', '吉林市', '0432', '4320999');
INSERT INTO `t_sys_area` VALUES ('220300', '四平市', 2, '220000', '吉林省', '0434', NULL);
INSERT INTO `t_sys_area` VALUES ('220302', '铁西区', 3, '220300', '四平市', '0434', '4340199');
INSERT INTO `t_sys_area` VALUES ('220303', '铁东区', 3, '220300', '四平市', '0434', '4340299');
INSERT INTO `t_sys_area` VALUES ('220322', '梨树县', 3, '220300', '四平市', '0434', '4340399');
INSERT INTO `t_sys_area` VALUES ('220323', '伊通满族自治县', 3, '220300', '四平市', '0434', '4340499');
INSERT INTO `t_sys_area` VALUES ('220381', '公主岭市', 3, '220300', '四平市', '0434', '4340599');
INSERT INTO `t_sys_area` VALUES ('220382', '双辽市', 3, '220300', '四平市', '0434', '4340699');
INSERT INTO `t_sys_area` VALUES ('220400', '辽源市', 2, '220000', '吉林省', '0437', NULL);
INSERT INTO `t_sys_area` VALUES ('220402', '龙山区', 3, '220400', '辽源市', '0437', '4370199');
INSERT INTO `t_sys_area` VALUES ('220403', '西安区', 3, '220400', '辽源市', '0437', '4370299');
INSERT INTO `t_sys_area` VALUES ('220421', '东丰县', 3, '220400', '辽源市', '0437', '4370399');
INSERT INTO `t_sys_area` VALUES ('220422', '东辽县', 3, '220400', '辽源市', '0437', '4370499');
INSERT INTO `t_sys_area` VALUES ('220500', '通化市', 2, '220000', '吉林省', '0435', NULL);
INSERT INTO `t_sys_area` VALUES ('220502', '东昌区', 3, '220500', '通化市', '0435', '4350199');
INSERT INTO `t_sys_area` VALUES ('220503', '二道江区', 3, '220500', '通化市', '0435', '4350299');
INSERT INTO `t_sys_area` VALUES ('220521', '通化县', 3, '220500', '通化市', '0435', '4350399');
INSERT INTO `t_sys_area` VALUES ('220523', '辉南县', 3, '220500', '通化市', '0435', '4350499');
INSERT INTO `t_sys_area` VALUES ('220524', '柳河县', 3, '220500', '通化市', '0435', '4350599');
INSERT INTO `t_sys_area` VALUES ('220581', '梅河口市', 3, '220500', '通化市', '0435', '4350699');
INSERT INTO `t_sys_area` VALUES ('220582', '集安市', 3, '220500', '通化市', '0435', '4350799');
INSERT INTO `t_sys_area` VALUES ('220600', '白山市', 2, '220000', '吉林省', '0439', NULL);
INSERT INTO `t_sys_area` VALUES ('220602', '浑江区', 3, '220600', '白山市', '0439', '4390199');
INSERT INTO `t_sys_area` VALUES ('220605', '江源区', 3, '220600', '白山市', '0439', '4390299');
INSERT INTO `t_sys_area` VALUES ('220621', '抚松县', 3, '220600', '白山市', '0439', '4390399');
INSERT INTO `t_sys_area` VALUES ('220622', '靖宇县', 3, '220600', '白山市', '0439', '4390499');
INSERT INTO `t_sys_area` VALUES ('220623', '长白朝鲜族自治县', 3, '220600', '白山市', '0439', '4390599');
INSERT INTO `t_sys_area` VALUES ('220681', '临江市', 3, '220600', '白山市', '0439', '4390699');
INSERT INTO `t_sys_area` VALUES ('220700', '松原市', 2, '220000', '吉林省', '0438', NULL);
INSERT INTO `t_sys_area` VALUES ('220702', '宁江区', 3, '220700', '松原市', '0438', '4380199');
INSERT INTO `t_sys_area` VALUES ('220721', '前郭尔罗斯蒙古族自治县', 3, '220700', '松原市', '0438', '4380299');
INSERT INTO `t_sys_area` VALUES ('220722', '长岭县', 3, '220700', '松原市', '0438', '4380399');
INSERT INTO `t_sys_area` VALUES ('220723', '乾安县', 3, '220700', '松原市', '0438', '4380499');
INSERT INTO `t_sys_area` VALUES ('220781', '扶余市', 3, '220700', '松原市', '0438', '4380599');
INSERT INTO `t_sys_area` VALUES ('220800', '白城市', 2, '220000', '吉林省', '0436', NULL);
INSERT INTO `t_sys_area` VALUES ('220802', '洮北区', 3, '220800', '白城市', '0436', '4360199');
INSERT INTO `t_sys_area` VALUES ('220821', '镇赉县', 3, '220800', '白城市', '0436', '4360299');
INSERT INTO `t_sys_area` VALUES ('220822', '通榆县', 3, '220800', '白城市', '0436', '4360399');
INSERT INTO `t_sys_area` VALUES ('220881', '洮南市', 3, '220800', '白城市', '0436', '4360499');
INSERT INTO `t_sys_area` VALUES ('220882', '大安市', 3, '220800', '白城市', '0436', '4360599');
INSERT INTO `t_sys_area` VALUES ('222400', '延边朝鲜族自治州', 2, '220000', '吉林省', '1433', NULL);
INSERT INTO `t_sys_area` VALUES ('222401', '延吉市', 3, '222400', '延边朝鲜族自治州', '1433', '4330199');
INSERT INTO `t_sys_area` VALUES ('222402', '图们市', 3, '222400', '延边朝鲜族自治州', '1433', '4330299');
INSERT INTO `t_sys_area` VALUES ('222403', '敦化市', 3, '222400', '延边朝鲜族自治州', '1433', '4330399');
INSERT INTO `t_sys_area` VALUES ('222404', '珲春市', 3, '222400', '延边朝鲜族自治州', '1433', '4330499');
INSERT INTO `t_sys_area` VALUES ('222405', '龙井市', 3, '222400', '延边朝鲜族自治州', '1433', '4330599');
INSERT INTO `t_sys_area` VALUES ('222406', '和龙市', 3, '222400', '延边朝鲜族自治州', '1433', '4330699');
INSERT INTO `t_sys_area` VALUES ('222424', '汪清县', 3, '222400', '延边朝鲜族自治州', '1433', '4330799');
INSERT INTO `t_sys_area` VALUES ('222426', '安图县', 3, '222400', '延边朝鲜族自治州', '1433', '4330899');
INSERT INTO `t_sys_area` VALUES ('230000', '黑龙江省', 1, '000000', '中华人民共和国', NULL, NULL);
INSERT INTO `t_sys_area` VALUES ('230100', '哈尔滨市', 2, '230000', '黑龙江省', '0451', NULL);
INSERT INTO `t_sys_area` VALUES ('230102', '道里区', 3, '230100', '哈尔滨市', '0451', '4510199');
INSERT INTO `t_sys_area` VALUES ('230103', '南岗区', 3, '230100', '哈尔滨市', '0451', '4510299');
INSERT INTO `t_sys_area` VALUES ('230104', '道外区', 3, '230100', '哈尔滨市', '0451', '4510399');
INSERT INTO `t_sys_area` VALUES ('230108', '平房区', 3, '230100', '哈尔滨市', '0451', '4510499');
INSERT INTO `t_sys_area` VALUES ('230109', '松北区', 3, '230100', '哈尔滨市', '0451', '4510599');
INSERT INTO `t_sys_area` VALUES ('230110', '香坊区', 3, '230100', '哈尔滨市', '0451', '4510699');
INSERT INTO `t_sys_area` VALUES ('230111', '呼兰区', 3, '230100', '哈尔滨市', '0451', '4510799');
INSERT INTO `t_sys_area` VALUES ('230112', '阿城区', 3, '230100', '哈尔滨市', '0451', '4510899');
INSERT INTO `t_sys_area` VALUES ('230113', '双城区', 3, '230100', '哈尔滨市', '0451', '4511699');
INSERT INTO `t_sys_area` VALUES ('230123', '依兰县', 3, '230100', '哈尔滨市', '0451', '4510999');
INSERT INTO `t_sys_area` VALUES ('230124', '方正县', 3, '230100', '哈尔滨市', '0451', '4511099');
INSERT INTO `t_sys_area` VALUES ('230125', '宾县', 3, '230100', '哈尔滨市', '0451', '4511199');
INSERT INTO `t_sys_area` VALUES ('230126', '巴彦县', 3, '230100', '哈尔滨市', '0451', '4511299');
INSERT INTO `t_sys_area` VALUES ('230127', '木兰县', 3, '230100', '哈尔滨市', '0451', '4511399');
INSERT INTO `t_sys_area` VALUES ('230128', '通河县', 3, '230100', '哈尔滨市', '0451', '4511499');
INSERT INTO `t_sys_area` VALUES ('230129', '延寿县', 3, '230100', '哈尔滨市', '0451', '4511599');
INSERT INTO `t_sys_area` VALUES ('230183', '尚志市', 3, '230100', '哈尔滨市', '0451', '4511799');
INSERT INTO `t_sys_area` VALUES ('230184', '五常市', 3, '230100', '哈尔滨市', '0451', '4511899');
INSERT INTO `t_sys_area` VALUES ('230200', '齐齐哈尔市', 2, '230000', '黑龙江省', '0452', NULL);
INSERT INTO `t_sys_area` VALUES ('230202', '龙沙区', 3, '230200', '齐齐哈尔市', '0452', '4520199');
INSERT INTO `t_sys_area` VALUES ('230203', '建华区', 3, '230200', '齐齐哈尔市', '0452', '4520299');
INSERT INTO `t_sys_area` VALUES ('230204', '铁锋区', 3, '230200', '齐齐哈尔市', '0452', '4520399');
INSERT INTO `t_sys_area` VALUES ('230205', '昂昂溪区', 3, '230200', '齐齐哈尔市', '0452', '4520499');
INSERT INTO `t_sys_area` VALUES ('230206', '富拉尔基区', 3, '230200', '齐齐哈尔市', '0452', '4520599');
INSERT INTO `t_sys_area` VALUES ('230207', '碾子山区', 3, '230200', '齐齐哈尔市', '0452', '4520699');
INSERT INTO `t_sys_area` VALUES ('230208', '梅里斯达斡尔族区', 3, '230200', '齐齐哈尔市', '0452', '4520799');
INSERT INTO `t_sys_area` VALUES ('230221', '龙江县', 3, '230200', '齐齐哈尔市', '0452', '4520899');
INSERT INTO `t_sys_area` VALUES ('230223', '依安县', 3, '230200', '齐齐哈尔市', '0452', '4520999');
INSERT INTO `t_sys_area` VALUES ('230224', '泰来县', 3, '230200', '齐齐哈尔市', '0452', '4521099');
INSERT INTO `t_sys_area` VALUES ('230225', '甘南县', 3, '230200', '齐齐哈尔市', '0452', '4521199');
INSERT INTO `t_sys_area` VALUES ('230227', '富裕县', 3, '230200', '齐齐哈尔市', '0452', '4521299');
INSERT INTO `t_sys_area` VALUES ('230229', '克山县', 3, '230200', '齐齐哈尔市', '0452', '4521399');
INSERT INTO `t_sys_area` VALUES ('230230', '克东县', 3, '230200', '齐齐哈尔市', '0452', '4521499');
INSERT INTO `t_sys_area` VALUES ('230231', '拜泉县', 3, '230200', '齐齐哈尔市', '0452', '4521599');
INSERT INTO `t_sys_area` VALUES ('230281', '讷河市', 3, '230200', '齐齐哈尔市', '0452', '4521699');
INSERT INTO `t_sys_area` VALUES ('230300', '鸡西市', 2, '230000', '黑龙江省', '0467', NULL);
INSERT INTO `t_sys_area` VALUES ('230302', '鸡冠区', 3, '230300', '鸡西市', '0467', '4670199');
INSERT INTO `t_sys_area` VALUES ('230303', '恒山区', 3, '230300', '鸡西市', '0467', '4670299');
INSERT INTO `t_sys_area` VALUES ('230304', '滴道区', 3, '230300', '鸡西市', '0467', '4670399');
INSERT INTO `t_sys_area` VALUES ('230305', '梨树区', 3, '230300', '鸡西市', '0467', '4670499');
INSERT INTO `t_sys_area` VALUES ('230306', '城子河区', 3, '230300', '鸡西市', '0467', '4670599');
INSERT INTO `t_sys_area` VALUES ('230307', '麻山区', 3, '230300', '鸡西市', '0467', '4670699');
INSERT INTO `t_sys_area` VALUES ('230321', '鸡东县', 3, '230300', '鸡西市', '0467', '4670799');
INSERT INTO `t_sys_area` VALUES ('230381', '虎林市', 3, '230300', '鸡西市', '0467', '4670899');
INSERT INTO `t_sys_area` VALUES ('230382', '密山市', 3, '230300', '鸡西市', '0467', '4670999');
INSERT INTO `t_sys_area` VALUES ('230400', '鹤岗市', 2, '230000', '黑龙江省', '0468', NULL);
INSERT INTO `t_sys_area` VALUES ('230402', '向阳区', 3, '230400', '鹤岗市', '0468', '4680199');
INSERT INTO `t_sys_area` VALUES ('230403', '工农区', 3, '230400', '鹤岗市', '0468', '4680299');
INSERT INTO `t_sys_area` VALUES ('230404', '南山区', 3, '230400', '鹤岗市', '0468', '4680399');
INSERT INTO `t_sys_area` VALUES ('230405', '兴安区', 3, '230400', '鹤岗市', '0468', '4680499');
INSERT INTO `t_sys_area` VALUES ('230406', '东山区', 3, '230400', '鹤岗市', '0468', '4680599');
INSERT INTO `t_sys_area` VALUES ('230407', '兴山区', 3, '230400', '鹤岗市', '0468', '4680699');
INSERT INTO `t_sys_area` VALUES ('230421', '萝北县', 3, '230400', '鹤岗市', '0468', '4680799');
INSERT INTO `t_sys_area` VALUES ('230422', '绥滨县', 3, '230400', '鹤岗市', '0468', '4680899');
INSERT INTO `t_sys_area` VALUES ('230500', '双鸭山市', 2, '230000', '黑龙江省', '0469', NULL);
INSERT INTO `t_sys_area` VALUES ('230502', '尖山区', 3, '230500', '双鸭山市', '0469', '4690199');
INSERT INTO `t_sys_area` VALUES ('230503', '岭东区', 3, '230500', '双鸭山市', '0469', '4690299');
INSERT INTO `t_sys_area` VALUES ('230505', '四方台区', 3, '230500', '双鸭山市', '0469', '4690399');
INSERT INTO `t_sys_area` VALUES ('230506', '宝山区', 3, '230500', '双鸭山市', '0469', '4690499');
INSERT INTO `t_sys_area` VALUES ('230521', '集贤县', 3, '230500', '双鸭山市', '0469', '4690599');
INSERT INTO `t_sys_area` VALUES ('230522', '友谊县', 3, '230500', '双鸭山市', '0469', '4690699');
INSERT INTO `t_sys_area` VALUES ('230523', '宝清县', 3, '230500', '双鸭山市', '0469', '4690799');
INSERT INTO `t_sys_area` VALUES ('230524', '饶河县', 3, '230500', '双鸭山市', '0469', '4690899');
INSERT INTO `t_sys_area` VALUES ('230600', '大庆市', 2, '230000', '黑龙江省', '0459', NULL);
INSERT INTO `t_sys_area` VALUES ('230602', '萨尔图区', 3, '230600', '大庆市', '0459', '4590199');
INSERT INTO `t_sys_area` VALUES ('230603', '龙凤区', 3, '230600', '大庆市', '0459', '4590299');
INSERT INTO `t_sys_area` VALUES ('230604', '让胡路区', 3, '230600', '大庆市', '0459', '4590399');
INSERT INTO `t_sys_area` VALUES ('230605', '红岗区', 3, '230600', '大庆市', '0459', '4590499');
INSERT INTO `t_sys_area` VALUES ('230606', '大同区', 3, '230600', '大庆市', '0459', '4590599');
INSERT INTO `t_sys_area` VALUES ('230621', '肇州县', 3, '230600', '大庆市', '0459', '4590699');
INSERT INTO `t_sys_area` VALUES ('230622', '肇源县', 3, '230600', '大庆市', '0459', '4590799');
INSERT INTO `t_sys_area` VALUES ('230623', '林甸县', 3, '230600', '大庆市', '0459', '4590899');
INSERT INTO `t_sys_area` VALUES ('230624', '杜尔伯特蒙古族自治县', 3, '230600', '大庆市', '0459', '4590999');
INSERT INTO `t_sys_area` VALUES ('230700', '伊春市', 2, '230000', '黑龙江省', '0458', NULL);
INSERT INTO `t_sys_area` VALUES ('230702', '伊春区', 3, '230700', '伊春市', '0458', '4580199');
INSERT INTO `t_sys_area` VALUES ('230703', '南岔区', 3, '230700', '伊春市', '0458', '4580299');
INSERT INTO `t_sys_area` VALUES ('230704', '友好区', 3, '230700', '伊春市', '0458', '4580399');
INSERT INTO `t_sys_area` VALUES ('230705', '西林区', 3, '230700', '伊春市', '0458', '4580499');
INSERT INTO `t_sys_area` VALUES ('230706', '翠峦区', 3, '230700', '伊春市', '0458', '4580599');
INSERT INTO `t_sys_area` VALUES ('230707', '新青区', 3, '230700', '伊春市', '0458', '4580699');
INSERT INTO `t_sys_area` VALUES ('230708', '美溪区', 3, '230700', '伊春市', '0458', '4580799');
INSERT INTO `t_sys_area` VALUES ('230709', '金山屯区', 3, '230700', '伊春市', '0458', '4580899');
INSERT INTO `t_sys_area` VALUES ('230710', '五营区', 3, '230700', '伊春市', '0458', '4580999');
INSERT INTO `t_sys_area` VALUES ('230711', '乌马河区', 3, '230700', '伊春市', '0458', '4581099');
INSERT INTO `t_sys_area` VALUES ('230712', '汤旺河区', 3, '230700', '伊春市', '0458', '4581199');
INSERT INTO `t_sys_area` VALUES ('230713', '带岭区', 3, '230700', '伊春市', '0458', '4581299');
INSERT INTO `t_sys_area` VALUES ('230714', '乌伊岭区', 3, '230700', '伊春市', '0458', '4581399');
INSERT INTO `t_sys_area` VALUES ('230715', '红星区', 3, '230700', '伊春市', '0458', '4581499');
INSERT INTO `t_sys_area` VALUES ('230716', '上甘岭区', 3, '230700', '伊春市', '0458', '4581599');
INSERT INTO `t_sys_area` VALUES ('230722', '嘉荫县', 3, '230700', '伊春市', '0458', '4581699');
INSERT INTO `t_sys_area` VALUES ('230781', '铁力市', 3, '230700', '伊春市', '0458', '4581799');
INSERT INTO `t_sys_area` VALUES ('230800', '佳木斯市', 2, '230000', '黑龙江省', '0454', NULL);
INSERT INTO `t_sys_area` VALUES ('230803', '向阳区', 3, '230800', '佳木斯市', '0454', '4540199');
INSERT INTO `t_sys_area` VALUES ('230804', '前进区', 3, '230800', '佳木斯市', '0454', '4540299');
INSERT INTO `t_sys_area` VALUES ('230805', '东风区', 3, '230800', '佳木斯市', '0454', '4540399');
INSERT INTO `t_sys_area` VALUES ('230811', '郊区', 3, '230800', '佳木斯市', '0454', '4540499');
INSERT INTO `t_sys_area` VALUES ('230822', '桦南县', 3, '230800', '佳木斯市', '0454', '4540599');
INSERT INTO `t_sys_area` VALUES ('230826', '桦川县', 3, '230800', '佳木斯市', '0454', '4540699');
INSERT INTO `t_sys_area` VALUES ('230828', '汤原县', 3, '230800', '佳木斯市', '0454', '4540799');
INSERT INTO `t_sys_area` VALUES ('230881', '同江市', 3, '230800', '佳木斯市', '0454', '4540999');
INSERT INTO `t_sys_area` VALUES ('230882', '富锦市', 3, '230800', '佳木斯市', '0454', '4541099');
INSERT INTO `t_sys_area` VALUES ('230883', '抚远市', 3, '230800', '佳木斯市', '0454', NULL);
INSERT INTO `t_sys_area` VALUES ('230900', '七台河市', 2, '230000', '黑龙江省', '0464', NULL);
INSERT INTO `t_sys_area` VALUES ('230902', '新兴区', 3, '230900', '七台河市', '0464', '4640199');
INSERT INTO `t_sys_area` VALUES ('230903', '桃山区', 3, '230900', '七台河市', '0464', '4640299');
INSERT INTO `t_sys_area` VALUES ('230904', '茄子河区', 3, '230900', '七台河市', '0464', '4640399');
INSERT INTO `t_sys_area` VALUES ('230921', '勃利县', 3, '230900', '七台河市', '0464', '4640499');
INSERT INTO `t_sys_area` VALUES ('231000', '牡丹江市', 2, '230000', '黑龙江省', '0453', NULL);
INSERT INTO `t_sys_area` VALUES ('231002', '东安区', 3, '231000', '牡丹江市', '0453', '4530199');
INSERT INTO `t_sys_area` VALUES ('231003', '阳明区', 3, '231000', '牡丹江市', '0453', '4530299');
INSERT INTO `t_sys_area` VALUES ('231004', '爱民区', 3, '231000', '牡丹江市', '0453', '4530399');
INSERT INTO `t_sys_area` VALUES ('231005', '西安区', 3, '231000', '牡丹江市', '0453', '4530499');
INSERT INTO `t_sys_area` VALUES ('231025', '林口县', 3, '231000', '牡丹江市', '0453', '4530699');
INSERT INTO `t_sys_area` VALUES ('231081', '绥芬河市', 3, '231000', '牡丹江市', '0453', '4530799');
INSERT INTO `t_sys_area` VALUES ('231083', '海林市', 3, '231000', '牡丹江市', '0453', '4530899');
INSERT INTO `t_sys_area` VALUES ('231084', '宁安市', 3, '231000', '牡丹江市', '0453', '4530999');
INSERT INTO `t_sys_area` VALUES ('231085', '穆棱市', 3, '231000', '牡丹江市', '0453', '4531099');
INSERT INTO `t_sys_area` VALUES ('231086', '东宁市', 3, '231000', '牡丹江市', '0453', NULL);
INSERT INTO `t_sys_area` VALUES ('231100', '黑河市', 2, '230000', '黑龙江省', '0456', NULL);
INSERT INTO `t_sys_area` VALUES ('231102', '爱辉区', 3, '231100', '黑河市', '0456', '4560199');
INSERT INTO `t_sys_area` VALUES ('231121', '嫩江县', 3, '231100', '黑河市', '0456', '4560299');
INSERT INTO `t_sys_area` VALUES ('231123', '逊克县', 3, '231100', '黑河市', '0456', '4560399');
INSERT INTO `t_sys_area` VALUES ('231124', '孙吴县', 3, '231100', '黑河市', '0456', '4560499');
INSERT INTO `t_sys_area` VALUES ('231181', '北安市', 3, '231100', '黑河市', '0456', '4560599');
INSERT INTO `t_sys_area` VALUES ('231182', '五大连池市', 3, '231100', '黑河市', '0456', '4560699');
INSERT INTO `t_sys_area` VALUES ('231200', '绥化市', 2, '230000', '黑龙江省', '0455', NULL);
INSERT INTO `t_sys_area` VALUES ('231202', '北林区', 3, '231200', '绥化市', '0455', '4550199');
INSERT INTO `t_sys_area` VALUES ('231221', '望奎县', 3, '231200', '绥化市', '0455', '4550299');
INSERT INTO `t_sys_area` VALUES ('231222', '兰西县', 3, '231200', '绥化市', '0455', '4550399');
INSERT INTO `t_sys_area` VALUES ('231223', '青冈县', 3, '231200', '绥化市', '0455', '4550499');
INSERT INTO `t_sys_area` VALUES ('231224', '庆安县', 3, '231200', '绥化市', '0455', '4550599');
INSERT INTO `t_sys_area` VALUES ('231225', '明水县', 3, '231200', '绥化市', '0455', '4550699');
INSERT INTO `t_sys_area` VALUES ('231226', '绥棱县', 3, '231200', '绥化市', '0455', '4550799');
INSERT INTO `t_sys_area` VALUES ('231281', '安达市', 3, '231200', '绥化市', '0455', '4550899');
INSERT INTO `t_sys_area` VALUES ('231282', '肇东市', 3, '231200', '绥化市', '0455', '4550999');
INSERT INTO `t_sys_area` VALUES ('231283', '海伦市', 3, '231200', '绥化市', '0455', '4551099');
INSERT INTO `t_sys_area` VALUES ('232700', '大兴安岭地区', 2, '230000', '黑龙江省', '0457', NULL);
INSERT INTO `t_sys_area` VALUES ('232701', '加格达奇区', 3, '232700', '大兴安岭地区', '0457', '4570199');
INSERT INTO `t_sys_area` VALUES ('232721', '呼玛县', 3, '232700', '大兴安岭地区', '0457', '4570599');
INSERT INTO `t_sys_area` VALUES ('232722', '塔河县', 3, '232700', '大兴安岭地区', '0457', '4570699');
INSERT INTO `t_sys_area` VALUES ('232723', '漠河县', 3, '232700', '大兴安岭地区', '0457', '4570799');
INSERT INTO `t_sys_area` VALUES ('310000', '上海市', 1, '000000', '中华人民共和国', '021', NULL);
INSERT INTO `t_sys_area` VALUES ('310100', '上海城区', 2, '310000', '上海市', '021', NULL);
INSERT INTO `t_sys_area` VALUES ('310101', '黄浦区', 3, '310100', '上海城区', '021', '0210299');
INSERT INTO `t_sys_area` VALUES ('310104', '徐汇区', 3, '310100', '上海城区', '021', '0210399');
INSERT INTO `t_sys_area` VALUES ('310105', '长宁区', 3, '310100', '上海城区', '021', '0210499');
INSERT INTO `t_sys_area` VALUES ('310106', '静安区', 3, '310100', '上海城区', '021', '0210799');
INSERT INTO `t_sys_area` VALUES ('310107', '普陀区', 3, '310100', '上海城区', '021', '0210699');
INSERT INTO `t_sys_area` VALUES ('310109', '虹口区', 3, '310100', '上海城区', '021', '0210899');
INSERT INTO `t_sys_area` VALUES ('310110', '杨浦区', 3, '310100', '上海城区', '021', '0210999');
INSERT INTO `t_sys_area` VALUES ('310112', '闵行区', 3, '310100', '上海城区', '021', '0211099');
INSERT INTO `t_sys_area` VALUES ('310113', '宝山区', 3, '310100', '上海城区', '021', '0211199');
INSERT INTO `t_sys_area` VALUES ('310114', '嘉定区', 3, '310100', '上海城区', '021', '0211299');
INSERT INTO `t_sys_area` VALUES ('310115', '浦东新区', 3, '310100', '上海城区', '021', '0211799');
INSERT INTO `t_sys_area` VALUES ('310116', '金山区', 3, '310100', '上海城区', '021', '0211499');
INSERT INTO `t_sys_area` VALUES ('310117', '松江区', 3, '310100', '上海城区', '021', '0211599');
INSERT INTO `t_sys_area` VALUES ('310118', '青浦区', 3, '310100', '上海城区', '021', '0211699');
INSERT INTO `t_sys_area` VALUES ('310120', '奉贤区', 3, '310100', '上海城区', '021', '0211899');
INSERT INTO `t_sys_area` VALUES ('310151', '崇明区', 3, '310100', '上海城区', '021', NULL);
INSERT INTO `t_sys_area` VALUES ('320000', '江苏省', 1, '000000', '中华人民共和国', NULL, NULL);
INSERT INTO `t_sys_area` VALUES ('320100', '南京市', 2, '320000', '江苏省', '025', NULL);
INSERT INTO `t_sys_area` VALUES ('320102', '玄武区', 3, '320100', '南京市', '025', '0250199');
INSERT INTO `t_sys_area` VALUES ('320104', '秦淮区', 3, '320100', '南京市', '025', '0250699');
INSERT INTO `t_sys_area` VALUES ('320105', '建邺区', 3, '320100', '南京市', '025', '0250499');
INSERT INTO `t_sys_area` VALUES ('320106', '鼓楼区', 3, '320100', '南京市', '025', '0250599');
INSERT INTO `t_sys_area` VALUES ('320111', '浦口区', 3, '320100', '南京市', '025', '0250999');
INSERT INTO `t_sys_area` VALUES ('320113', '栖霞区', 3, '320100', '南京市', '025', '0250799');
INSERT INTO `t_sys_area` VALUES ('320114', '雨花台区', 3, '320100', '南京市', '025', '0250899');
INSERT INTO `t_sys_area` VALUES ('320115', '江宁区', 3, '320100', '南京市', '025', '0251199');
INSERT INTO `t_sys_area` VALUES ('320116', '六合区', 3, '320100', '南京市', '025', '0251099');
INSERT INTO `t_sys_area` VALUES ('320117', '溧水区', 3, '320100', '南京市', '025', '0251299');
INSERT INTO `t_sys_area` VALUES ('320118', '高淳区', 3, '320100', '南京市', '025', '0251399');
INSERT INTO `t_sys_area` VALUES ('320200', '无锡市', 2, '320000', '江苏省', '0510', NULL);
INSERT INTO `t_sys_area` VALUES ('320205', '锡山区', 3, '320200', '无锡市', '0510', '5100499');
INSERT INTO `t_sys_area` VALUES ('320206', '惠山区', 3, '320200', '无锡市', '0510', '5100599');
INSERT INTO `t_sys_area` VALUES ('320211', '滨湖区', 3, '320200', '无锡市', '0510', '5100799');
INSERT INTO `t_sys_area` VALUES ('320213', '梁溪区', 3, '320200', '无锡市', '0510', NULL);
INSERT INTO `t_sys_area` VALUES ('320214', '新吴区', 3, '320200', '无锡市', '0510', NULL);
INSERT INTO `t_sys_area` VALUES ('320281', '江阴市', 3, '320200', '无锡市', '0510', '5100899');
INSERT INTO `t_sys_area` VALUES ('320282', '宜兴市', 3, '320200', '无锡市', '0510', '5100999');
INSERT INTO `t_sys_area` VALUES ('320300', '徐州市', 2, '320000', '江苏省', '0516', NULL);
INSERT INTO `t_sys_area` VALUES ('320302', '鼓楼区', 3, '320300', '徐州市', '0516', '5160199');
INSERT INTO `t_sys_area` VALUES ('320303', '云龙区', 3, '320300', '徐州市', '0516', '5160299');
INSERT INTO `t_sys_area` VALUES ('320305', '贾汪区', 3, '320300', '徐州市', '0516', '5160499');
INSERT INTO `t_sys_area` VALUES ('320311', '泉山区', 3, '320300', '徐州市', '0516', '5160599');
INSERT INTO `t_sys_area` VALUES ('320312', '铜山区', 3, '320300', '徐州市', '0516', '5160899');
INSERT INTO `t_sys_area` VALUES ('320321', '丰县', 3, '320300', '徐州市', '0516', '5160699');
INSERT INTO `t_sys_area` VALUES ('320322', '沛县', 3, '320300', '徐州市', '0516', '5160799');
INSERT INTO `t_sys_area` VALUES ('320324', '睢宁县', 3, '320300', '徐州市', '0516', '5160999');
INSERT INTO `t_sys_area` VALUES ('320381', '新沂市', 3, '320300', '徐州市', '0516', '5161099');
INSERT INTO `t_sys_area` VALUES ('320382', '邳州市', 3, '320300', '徐州市', '0516', '5161199');
INSERT INTO `t_sys_area` VALUES ('320400', '常州市', 2, '320000', '江苏省', '0519', NULL);
INSERT INTO `t_sys_area` VALUES ('320402', '天宁区', 3, '320400', '常州市', '0519', '5190199');
INSERT INTO `t_sys_area` VALUES ('320404', '钟楼区', 3, '320400', '常州市', '0519', '5190299');
INSERT INTO `t_sys_area` VALUES ('320411', '新北区', 3, '320400', '常州市', '0519', '5190399');
INSERT INTO `t_sys_area` VALUES ('320412', '武进区', 3, '320400', '常州市', '0519', '5190599');
INSERT INTO `t_sys_area` VALUES ('320413', '金坛区', 3, '320400', '常州市', '0519', '5190699');
INSERT INTO `t_sys_area` VALUES ('320481', '溧阳市', 3, '320400', '常州市', '0519', '5190799');
INSERT INTO `t_sys_area` VALUES ('320500', '苏州市', 2, '320000', '江苏省', '0512', NULL);
INSERT INTO `t_sys_area` VALUES ('320505', '虎丘区', 3, '320500', '苏州市', '0512', '5121099');
INSERT INTO `t_sys_area` VALUES ('320506', '吴中区', 3, '320500', '苏州市', '0512', '5121299');
INSERT INTO `t_sys_area` VALUES ('320507', '相城区', 3, '320500', '苏州市', '0512', '5120699');
INSERT INTO `t_sys_area` VALUES ('320508', '姑苏区', 3, '320500', '苏州市', '0512', NULL);
INSERT INTO `t_sys_area` VALUES ('320509', '吴江区', 3, '320500', '苏州市', '0512', NULL);
INSERT INTO `t_sys_area` VALUES ('320581', '常熟市', 3, '320500', '苏州市', '0512', '5120799');
INSERT INTO `t_sys_area` VALUES ('320582', '张家港市', 3, '320500', '苏州市', '0512', '5120899');
INSERT INTO `t_sys_area` VALUES ('320583', '昆山市', 3, '320500', '苏州市', '0512', '5120999');
INSERT INTO `t_sys_area` VALUES ('320585', '太仓市', 3, '320500', '苏州市', '0512', '5121199');
INSERT INTO `t_sys_area` VALUES ('320600', '南通市', 2, '320000', '江苏省', '0513', NULL);
INSERT INTO `t_sys_area` VALUES ('320602', '崇川区', 3, '320600', '南通市', '0513', '5130399');
INSERT INTO `t_sys_area` VALUES ('320611', '港闸区', 3, '320600', '南通市', '0513', '5130199');
INSERT INTO `t_sys_area` VALUES ('320612', '通州区', 3, '320600', '南通市', '0513', '5130799');
INSERT INTO `t_sys_area` VALUES ('320621', '海安县', 3, '320600', '南通市', '0513', '5130499');
INSERT INTO `t_sys_area` VALUES ('320623', '如东县', 3, '320600', '南通市', '0513', '5130699');
INSERT INTO `t_sys_area` VALUES ('320681', '启东市', 3, '320600', '南通市', '0513', '5130999');
INSERT INTO `t_sys_area` VALUES ('320682', '如皋市', 3, '320600', '南通市', '0513', '5130599');
INSERT INTO `t_sys_area` VALUES ('320684', '海门市', 3, '320600', '南通市', '0513', '5130899');
INSERT INTO `t_sys_area` VALUES ('320700', '连云港市', 2, '320000', '江苏省', '0518', NULL);
INSERT INTO `t_sys_area` VALUES ('320703', '连云区', 3, '320700', '连云港市', '0518', '5180399');
INSERT INTO `t_sys_area` VALUES ('320706', '海州区', 3, '320700', '连云港市', '0518', '5180299');
INSERT INTO `t_sys_area` VALUES ('320707', '赣榆区', 3, '320700', '连云港市', '0518', '5180499');
INSERT INTO `t_sys_area` VALUES ('320722', '东海县', 3, '320700', '连云港市', '0518', '5180599');
INSERT INTO `t_sys_area` VALUES ('320723', '灌云县', 3, '320700', '连云港市', '0518', '5180699');
INSERT INTO `t_sys_area` VALUES ('320724', '灌南县', 3, '320700', '连云港市', '0518', '5180799');
INSERT INTO `t_sys_area` VALUES ('320800', '淮安市', 2, '320000', '江苏省', '0517', NULL);
INSERT INTO `t_sys_area` VALUES ('320803', '淮安区', 3, '320800', '淮安市', '0517', '5170299');
INSERT INTO `t_sys_area` VALUES ('320804', '淮阴区', 3, '320800', '淮安市', '0517', '5170399');
INSERT INTO `t_sys_area` VALUES ('320812', '清江浦区', 3, '320800', '淮安市', '0517', NULL);
INSERT INTO `t_sys_area` VALUES ('320813', '洪泽区', 3, '320800', '淮安市', '0517', NULL);
INSERT INTO `t_sys_area` VALUES ('320826', '涟水县', 3, '320800', '淮安市', '0517', '5170599');
INSERT INTO `t_sys_area` VALUES ('320830', '盱眙县', 3, '320800', '淮安市', '0517', '5170799');
INSERT INTO `t_sys_area` VALUES ('320831', '金湖县', 3, '320800', '淮安市', '0517', '5170899');
INSERT INTO `t_sys_area` VALUES ('320900', '盐城市', 2, '320000', '江苏省', '0515', NULL);
INSERT INTO `t_sys_area` VALUES ('320902', '亭湖区', 3, '320900', '盐城市', '0515', '5150199');
INSERT INTO `t_sys_area` VALUES ('320903', '盐都区', 3, '320900', '盐城市', '0515', '5150299');
INSERT INTO `t_sys_area` VALUES ('320904', '大丰区', 3, '320900', '盐城市', '0515', '5150899');
INSERT INTO `t_sys_area` VALUES ('320921', '响水县', 3, '320900', '盐城市', '0515', '5150399');
INSERT INTO `t_sys_area` VALUES ('320922', '滨海县', 3, '320900', '盐城市', '0515', '5150499');
INSERT INTO `t_sys_area` VALUES ('320923', '阜宁县', 3, '320900', '盐城市', '0515', '5150599');
INSERT INTO `t_sys_area` VALUES ('320924', '射阳县', 3, '320900', '盐城市', '0515', '5150699');
INSERT INTO `t_sys_area` VALUES ('320925', '建湖县', 3, '320900', '盐城市', '0515', '5150799');
INSERT INTO `t_sys_area` VALUES ('320981', '东台市', 3, '320900', '盐城市', '0515', '5150999');
INSERT INTO `t_sys_area` VALUES ('321000', '扬州市', 2, '320000', '江苏省', '0514', NULL);
INSERT INTO `t_sys_area` VALUES ('321002', '广陵区', 3, '321000', '扬州市', '0514', '5140199');
INSERT INTO `t_sys_area` VALUES ('321003', '邗江区', 3, '321000', '扬州市', '0514', '5140899');
INSERT INTO `t_sys_area` VALUES ('321012', '江都区', 3, '321000', '扬州市', '0514', '5140799');
INSERT INTO `t_sys_area` VALUES ('321023', '宝应县', 3, '321000', '扬州市', '0514', '5140499');
INSERT INTO `t_sys_area` VALUES ('321081', '仪征市', 3, '321000', '扬州市', '0514', '5140599');
INSERT INTO `t_sys_area` VALUES ('321084', '高邮市', 3, '321000', '扬州市', '0514', '5140699');
INSERT INTO `t_sys_area` VALUES ('321100', '镇江市', 2, '320000', '江苏省', '0511', NULL);
INSERT INTO `t_sys_area` VALUES ('321102', '京口区', 3, '321100', '镇江市', '0511', '5110199');
INSERT INTO `t_sys_area` VALUES ('321111', '润州区', 3, '321100', '镇江市', '0511', '5110299');
INSERT INTO `t_sys_area` VALUES ('321112', '丹徒区', 3, '321100', '镇江市', '0511', '5110399');
INSERT INTO `t_sys_area` VALUES ('321181', '丹阳市', 3, '321100', '镇江市', '0511', '5110499');
INSERT INTO `t_sys_area` VALUES ('321182', '扬中市', 3, '321100', '镇江市', '0511', '5110599');
INSERT INTO `t_sys_area` VALUES ('321183', '句容市', 3, '321100', '镇江市', '0511', '5110699');
INSERT INTO `t_sys_area` VALUES ('321200', '泰州市', 2, '320000', '江苏省', '0523', NULL);
INSERT INTO `t_sys_area` VALUES ('321202', '海陵区', 3, '321200', '泰州市', '0523', '5230199');
INSERT INTO `t_sys_area` VALUES ('321203', '高港区', 3, '321200', '泰州市', '0523', '5230299');
INSERT INTO `t_sys_area` VALUES ('321204', '姜堰区', 3, '321200', '泰州市', '0523', '5230699');
INSERT INTO `t_sys_area` VALUES ('321281', '兴化市', 3, '321200', '泰州市', '0523', '5230399');
INSERT INTO `t_sys_area` VALUES ('321282', '靖江市', 3, '321200', '泰州市', '0523', '5230499');
INSERT INTO `t_sys_area` VALUES ('321283', '泰兴市', 3, '321200', '泰州市', '0523', '5230599');
INSERT INTO `t_sys_area` VALUES ('321300', '宿迁市', 2, '320000', '江苏省', '0527', NULL);
INSERT INTO `t_sys_area` VALUES ('321302', '宿城区', 3, '321300', '宿迁市', '0527', '5270199');
INSERT INTO `t_sys_area` VALUES ('321311', '宿豫区', 3, '321300', '宿迁市', '0527', '5270299');
INSERT INTO `t_sys_area` VALUES ('321322', '沭阳县', 3, '321300', '宿迁市', '0527', '5270399');
INSERT INTO `t_sys_area` VALUES ('321323', '泗阳县', 3, '321300', '宿迁市', '0527', '5270499');
INSERT INTO `t_sys_area` VALUES ('321324', '泗洪县', 3, '321300', '宿迁市', '0527', '5270599');
INSERT INTO `t_sys_area` VALUES ('330000', '浙江省', 1, '000000', '中华人民共和国', NULL, NULL);
INSERT INTO `t_sys_area` VALUES ('330100', '杭州市', 2, '330000', '浙江省', '0571', NULL);
INSERT INTO `t_sys_area` VALUES ('330102', '上城区', 3, '330100', '杭州市', '0571', '5710199');
INSERT INTO `t_sys_area` VALUES ('330103', '下城区', 3, '330100', '杭州市', '0571', '5710299');
INSERT INTO `t_sys_area` VALUES ('330104', '江干区', 3, '330100', '杭州市', '0571', '5710399');
INSERT INTO `t_sys_area` VALUES ('330105', '拱墅区', 3, '330100', '杭州市', '0571', '5710499');
INSERT INTO `t_sys_area` VALUES ('330106', '西湖区', 3, '330100', '杭州市', '0571', '5710599');
INSERT INTO `t_sys_area` VALUES ('330108', '滨江区', 3, '330100', '杭州市', '0571', '5710699');
INSERT INTO `t_sys_area` VALUES ('330109', '萧山区', 3, '330100', '杭州市', '0571', '5710799');
INSERT INTO `t_sys_area` VALUES ('330110', '余杭区', 3, '330100', '杭州市', '0571', '5710899');
INSERT INTO `t_sys_area` VALUES ('330111', '富阳区', 3, '330100', '杭州市', '0571', '5711299');
INSERT INTO `t_sys_area` VALUES ('330122', '桐庐县', 3, '330100', '杭州市', '0571', '5710999');
INSERT INTO `t_sys_area` VALUES ('330127', '淳安县', 3, '330100', '杭州市', '0571', '5711099');
INSERT INTO `t_sys_area` VALUES ('330182', '建德市', 3, '330100', '杭州市', '0571', '5711199');
INSERT INTO `t_sys_area` VALUES ('330185', '临安区', 3, '330100', '杭州市', '0571', '5711399');
INSERT INTO `t_sys_area` VALUES ('330200', '宁波市', 2, '330000', '浙江省', '0574', NULL);
INSERT INTO `t_sys_area` VALUES ('330203', '海曙区', 3, '330200', '宁波市', '0574', '5740199');
INSERT INTO `t_sys_area` VALUES ('330205', '江北区', 3, '330200', '宁波市', '0574', '5740399');
INSERT INTO `t_sys_area` VALUES ('330206', '北仑区', 3, '330200', '宁波市', '0574', '5740499');
INSERT INTO `t_sys_area` VALUES ('330211', '镇海区', 3, '330200', '宁波市', '0574', '5740599');
INSERT INTO `t_sys_area` VALUES ('330212', '鄞州区', 3, '330200', '宁波市', '0574', '5740699');
INSERT INTO `t_sys_area` VALUES ('330213', '奉化区', 3, '330200', '宁波市', '0574', NULL);
INSERT INTO `t_sys_area` VALUES ('330225', '象山县', 3, '330200', '宁波市', '0574', '5740799');
INSERT INTO `t_sys_area` VALUES ('330226', '宁海县', 3, '330200', '宁波市', '0574', '5740899');
INSERT INTO `t_sys_area` VALUES ('330281', '余姚市', 3, '330200', '宁波市', '0574', '5740999');
INSERT INTO `t_sys_area` VALUES ('330282', '慈溪市', 3, '330200', '宁波市', '0574', '5741099');
INSERT INTO `t_sys_area` VALUES ('330300', '温州市', 2, '330000', '浙江省', '0577', NULL);
INSERT INTO `t_sys_area` VALUES ('330302', '鹿城区', 3, '330300', '温州市', '0577', '5770199');
INSERT INTO `t_sys_area` VALUES ('330303', '龙湾区', 3, '330300', '温州市', '0577', '5770299');
INSERT INTO `t_sys_area` VALUES ('330304', '瓯海区', 3, '330300', '温州市', '0577', '5770399');
INSERT INTO `t_sys_area` VALUES ('330305', '洞头区', 3, '330300', '温州市', '0577', '5770499');
INSERT INTO `t_sys_area` VALUES ('330324', '永嘉县', 3, '330300', '温州市', '0577', '5770599');
INSERT INTO `t_sys_area` VALUES ('330326', '平阳县', 3, '330300', '温州市', '0577', '5770699');
INSERT INTO `t_sys_area` VALUES ('330327', '苍南县', 3, '330300', '温州市', '0577', '5770799');
INSERT INTO `t_sys_area` VALUES ('330328', '文成县', 3, '330300', '温州市', '0577', '5770899');
INSERT INTO `t_sys_area` VALUES ('330329', '泰顺县', 3, '330300', '温州市', '0577', '5770999');
INSERT INTO `t_sys_area` VALUES ('330381', '瑞安市', 3, '330300', '温州市', '0577', '5771099');
INSERT INTO `t_sys_area` VALUES ('330382', '乐清市', 3, '330300', '温州市', '0577', '5771199');
INSERT INTO `t_sys_area` VALUES ('330400', '嘉兴市', 2, '330000', '浙江省', '0573', NULL);
INSERT INTO `t_sys_area` VALUES ('330402', '南湖区', 3, '330400', '嘉兴市', '0573', '5730199');
INSERT INTO `t_sys_area` VALUES ('330411', '秀洲区', 3, '330400', '嘉兴市', '0573', '5730299');
INSERT INTO `t_sys_area` VALUES ('330421', '嘉善县', 3, '330400', '嘉兴市', '0573', '5730399');
INSERT INTO `t_sys_area` VALUES ('330424', '海盐县', 3, '330400', '嘉兴市', '0573', '5730499');
INSERT INTO `t_sys_area` VALUES ('330481', '海宁市', 3, '330400', '嘉兴市', '0573', '5730599');
INSERT INTO `t_sys_area` VALUES ('330482', '平湖市', 3, '330400', '嘉兴市', '0573', '5730699');
INSERT INTO `t_sys_area` VALUES ('330483', '桐乡市', 3, '330400', '嘉兴市', '0573', '5730799');
INSERT INTO `t_sys_area` VALUES ('330500', '湖州市', 2, '330000', '浙江省', '0572', NULL);
INSERT INTO `t_sys_area` VALUES ('330502', '吴兴区', 3, '330500', '湖州市', '0572', '5720199');
INSERT INTO `t_sys_area` VALUES ('330503', '南浔区', 3, '330500', '湖州市', '0572', '5720299');
INSERT INTO `t_sys_area` VALUES ('330521', '德清县', 3, '330500', '湖州市', '0572', '5720399');
INSERT INTO `t_sys_area` VALUES ('330522', '长兴县', 3, '330500', '湖州市', '0572', '5720499');
INSERT INTO `t_sys_area` VALUES ('330523', '安吉县', 3, '330500', '湖州市', '0572', '5720599');
INSERT INTO `t_sys_area` VALUES ('330600', '绍兴市', 2, '330000', '浙江省', '0575', NULL);
INSERT INTO `t_sys_area` VALUES ('330602', '越城区', 3, '330600', '绍兴市', '0575', '5750199');
INSERT INTO `t_sys_area` VALUES ('330603', '柯桥区', 3, '330600', '绍兴市', '0575', '5750299');
INSERT INTO `t_sys_area` VALUES ('330604', '上虞区', 3, '330600', '绍兴市', '0575', '5750599');
INSERT INTO `t_sys_area` VALUES ('330624', '新昌县', 3, '330600', '绍兴市', '0575', '5750399');
INSERT INTO `t_sys_area` VALUES ('330681', '诸暨市', 3, '330600', '绍兴市', '0575', '5750499');
INSERT INTO `t_sys_area` VALUES ('330683', '嵊州市', 3, '330600', '绍兴市', '0575', '5750699');
INSERT INTO `t_sys_area` VALUES ('330700', '金华市', 2, '330000', '浙江省', '0579', NULL);
INSERT INTO `t_sys_area` VALUES ('330702', '婺城区', 3, '330700', '金华市', '0579', '5790199');
INSERT INTO `t_sys_area` VALUES ('330703', '金东区', 3, '330700', '金华市', '0579', '5790299');
INSERT INTO `t_sys_area` VALUES ('330723', '武义县', 3, '330700', '金华市', '0579', '5790399');
INSERT INTO `t_sys_area` VALUES ('330726', '浦江县', 3, '330700', '金华市', '0579', '5790499');
INSERT INTO `t_sys_area` VALUES ('330727', '磐安县', 3, '330700', '金华市', '0579', '5790599');
INSERT INTO `t_sys_area` VALUES ('330781', '兰溪市', 3, '330700', '金华市', '0579', '5790699');
INSERT INTO `t_sys_area` VALUES ('330782', '义乌市', 3, '330700', '金华市', '0579', '5790799');
INSERT INTO `t_sys_area` VALUES ('330783', '东阳市', 3, '330700', '金华市', '0579', '5790899');
INSERT INTO `t_sys_area` VALUES ('330784', '永康市', 3, '330700', '金华市', '0579', '5790999');
INSERT INTO `t_sys_area` VALUES ('330800', '衢州市', 2, '330000', '浙江省', '0570', NULL);
INSERT INTO `t_sys_area` VALUES ('330802', '柯城区', 3, '330800', '衢州市', '0570', '5700199');
INSERT INTO `t_sys_area` VALUES ('330803', '衢江区', 3, '330800', '衢州市', '0570', '5700299');
INSERT INTO `t_sys_area` VALUES ('330822', '常山县', 3, '330800', '衢州市', '0570', '5700399');
INSERT INTO `t_sys_area` VALUES ('330824', '开化县', 3, '330800', '衢州市', '0570', '5700499');
INSERT INTO `t_sys_area` VALUES ('330825', '龙游县', 3, '330800', '衢州市', '0570', '5700599');
INSERT INTO `t_sys_area` VALUES ('330881', '江山市', 3, '330800', '衢州市', '0570', '5700699');
INSERT INTO `t_sys_area` VALUES ('330900', '舟山市', 2, '330000', '浙江省', '0580', NULL);
INSERT INTO `t_sys_area` VALUES ('330902', '定海区', 3, '330900', '舟山市', '0580', '5800199');
INSERT INTO `t_sys_area` VALUES ('330903', '普陀区', 3, '330900', '舟山市', '0580', '5800299');
INSERT INTO `t_sys_area` VALUES ('330921', '岱山县', 3, '330900', '舟山市', '0580', '5800399');
INSERT INTO `t_sys_area` VALUES ('330922', '嵊泗县', 3, '330900', '舟山市', '0580', '5800499');
INSERT INTO `t_sys_area` VALUES ('331000', '台州市', 2, '330000', '浙江省', '0576', NULL);
INSERT INTO `t_sys_area` VALUES ('331002', '椒江区', 3, '331000', '台州市', '0576', '5760199');
INSERT INTO `t_sys_area` VALUES ('331003', '黄岩区', 3, '331000', '台州市', '0576', '5760299');
INSERT INTO `t_sys_area` VALUES ('331004', '路桥区', 3, '331000', '台州市', '0576', '5760399');
INSERT INTO `t_sys_area` VALUES ('331022', '三门县', 3, '331000', '台州市', '0576', '5760599');
INSERT INTO `t_sys_area` VALUES ('331023', '天台县', 3, '331000', '台州市', '0576', '5760699');
INSERT INTO `t_sys_area` VALUES ('331024', '仙居县', 3, '331000', '台州市', '0576', '5760799');
INSERT INTO `t_sys_area` VALUES ('331081', '温岭市', 3, '331000', '台州市', '0576', '5760899');
INSERT INTO `t_sys_area` VALUES ('331082', '临海市', 3, '331000', '台州市', '0576', '5760999');
INSERT INTO `t_sys_area` VALUES ('331083', '玉环市', 3, '331000', '台州市', '0576', NULL);
INSERT INTO `t_sys_area` VALUES ('331100', '丽水市', 2, '330000', '浙江省', '0578', NULL);
INSERT INTO `t_sys_area` VALUES ('331102', '莲都区', 3, '331100', '丽水市', '0578', '5780199');
INSERT INTO `t_sys_area` VALUES ('331121', '青田县', 3, '331100', '丽水市', '0578', '5780299');
INSERT INTO `t_sys_area` VALUES ('331122', '缙云县', 3, '331100', '丽水市', '0578', '5780399');
INSERT INTO `t_sys_area` VALUES ('331123', '遂昌县', 3, '331100', '丽水市', '0578', '5780499');
INSERT INTO `t_sys_area` VALUES ('331124', '松阳县', 3, '331100', '丽水市', '0578', '5780599');
INSERT INTO `t_sys_area` VALUES ('331125', '云和县', 3, '331100', '丽水市', '0578', '5780699');
INSERT INTO `t_sys_area` VALUES ('331126', '庆元县', 3, '331100', '丽水市', '0578', '5780799');
INSERT INTO `t_sys_area` VALUES ('331127', '景宁畲族自治县', 3, '331100', '丽水市', '0578', '5780899');
INSERT INTO `t_sys_area` VALUES ('331181', '龙泉市', 3, '331100', '丽水市', '0578', '5780999');
INSERT INTO `t_sys_area` VALUES ('340000', '安徽省', 1, '000000', '中华人民共和国', NULL, NULL);
INSERT INTO `t_sys_area` VALUES ('340100', '合肥市', 2, '340000', '安徽省', '0551', NULL);
INSERT INTO `t_sys_area` VALUES ('340102', '瑶海区', 3, '340100', '合肥市', '0551', '5510199');
INSERT INTO `t_sys_area` VALUES ('340103', '庐阳区', 3, '340100', '合肥市', '0551', '5510299');
INSERT INTO `t_sys_area` VALUES ('340104', '蜀山区', 3, '340100', '合肥市', '0551', '5510399');
INSERT INTO `t_sys_area` VALUES ('340111', '包河区', 3, '340100', '合肥市', '0551', '5510499');
INSERT INTO `t_sys_area` VALUES ('340121', '长丰县', 3, '340100', '合肥市', '0551', '5510599');
INSERT INTO `t_sys_area` VALUES ('340122', '肥东县', 3, '340100', '合肥市', '0551', '5510699');
INSERT INTO `t_sys_area` VALUES ('340123', '肥西县', 3, '340100', '合肥市', '0551', '5510799');
INSERT INTO `t_sys_area` VALUES ('340124', '庐江县', 3, '340100', '合肥市', '0551', '5650299');
INSERT INTO `t_sys_area` VALUES ('340181', '巢湖市', 3, '340100', '合肥市', '0551', '5650199');
INSERT INTO `t_sys_area` VALUES ('340200', '芜湖市', 2, '340000', '安徽省', '0553', NULL);
INSERT INTO `t_sys_area` VALUES ('340202', '镜湖区', 3, '340200', '芜湖市', '0553', '5530199');
INSERT INTO `t_sys_area` VALUES ('340203', '弋江区', 3, '340200', '芜湖市', '0553', '5530299');
INSERT INTO `t_sys_area` VALUES ('340207', '鸠江区', 3, '340200', '芜湖市', '0553', '5530399');
INSERT INTO `t_sys_area` VALUES ('340208', '三山区', 3, '340200', '芜湖市', '0553', '5530499');
INSERT INTO `t_sys_area` VALUES ('340221', '芜湖县', 3, '340200', '芜湖市', '0553', '5530599');
INSERT INTO `t_sys_area` VALUES ('340222', '繁昌县', 3, '340200', '芜湖市', '0553', '5530699');
INSERT INTO `t_sys_area` VALUES ('340223', '南陵县', 3, '340200', '芜湖市', '0553', '5530799');
INSERT INTO `t_sys_area` VALUES ('340225', '无为县', 3, '340200', '芜湖市', '0553', '5650399');
INSERT INTO `t_sys_area` VALUES ('340300', '蚌埠市', 2, '340000', '安徽省', '0552', NULL);
INSERT INTO `t_sys_area` VALUES ('340302', '龙子湖区', 3, '340300', '蚌埠市', '0552', '5520199');
INSERT INTO `t_sys_area` VALUES ('340303', '蚌山区', 3, '340300', '蚌埠市', '0552', '5520299');
INSERT INTO `t_sys_area` VALUES ('340304', '禹会区', 3, '340300', '蚌埠市', '0552', '5520399');
INSERT INTO `t_sys_area` VALUES ('340311', '淮上区', 3, '340300', '蚌埠市', '0552', '5520499');
INSERT INTO `t_sys_area` VALUES ('340321', '怀远县', 3, '340300', '蚌埠市', '0552', '5520599');
INSERT INTO `t_sys_area` VALUES ('340322', '五河县', 3, '340300', '蚌埠市', '0552', '5520699');
INSERT INTO `t_sys_area` VALUES ('340323', '固镇县', 3, '340300', '蚌埠市', '0552', '5520799');
INSERT INTO `t_sys_area` VALUES ('340400', '淮南市', 2, '340000', '安徽省', '0554', NULL);
INSERT INTO `t_sys_area` VALUES ('340402', '大通区', 3, '340400', '淮南市', '0554', '5540199');
INSERT INTO `t_sys_area` VALUES ('340403', '田家庵区', 3, '340400', '淮南市', '0554', '5540299');
INSERT INTO `t_sys_area` VALUES ('340404', '谢家集区', 3, '340400', '淮南市', '0554', '5540399');
INSERT INTO `t_sys_area` VALUES ('340405', '八公山区', 3, '340400', '淮南市', '0554', '5540499');
INSERT INTO `t_sys_area` VALUES ('340406', '潘集区', 3, '340400', '淮南市', '0554', '5540599');
INSERT INTO `t_sys_area` VALUES ('340421', '凤台县', 3, '340400', '淮南市', '0554', '5540699');
INSERT INTO `t_sys_area` VALUES ('340422', '寿县', 3, '340400', '淮南市', '0554', NULL);
INSERT INTO `t_sys_area` VALUES ('340500', '马鞍山市', 2, '340000', '安徽省', '0555', NULL);
INSERT INTO `t_sys_area` VALUES ('340503', '花山区', 3, '340500', '马鞍山市', '0555', '5550299');
INSERT INTO `t_sys_area` VALUES ('340504', '雨山区', 3, '340500', '马鞍山市', '0555', '5550399');
INSERT INTO `t_sys_area` VALUES ('340506', '博望区', 3, '340500', '马鞍山市', '0555', NULL);
INSERT INTO `t_sys_area` VALUES ('340521', '当涂县', 3, '340500', '马鞍山市', '0555', '5550499');
INSERT INTO `t_sys_area` VALUES ('340522', '含山县', 3, '340500', '马鞍山市', '0555', '5550599');
INSERT INTO `t_sys_area` VALUES ('340523', '和县', 3, '340500', '马鞍山市', '0555', '5550699');
INSERT INTO `t_sys_area` VALUES ('340600', '淮北市', 2, '340000', '安徽省', '0561', NULL);
INSERT INTO `t_sys_area` VALUES ('340602', '杜集区', 3, '340600', '淮北市', '0561', '5610199');
INSERT INTO `t_sys_area` VALUES ('340603', '相山区', 3, '340600', '淮北市', '0561', '5610299');
INSERT INTO `t_sys_area` VALUES ('340604', '烈山区', 3, '340600', '淮北市', '0561', '5610399');
INSERT INTO `t_sys_area` VALUES ('340621', '濉溪县', 3, '340600', '淮北市', '0561', '5610499');
INSERT INTO `t_sys_area` VALUES ('340700', '铜陵市', 2, '340000', '安徽省', '0562', NULL);
INSERT INTO `t_sys_area` VALUES ('340705', '铜官区', 3, '340700', '铜陵市', '0562', '5620499');
INSERT INTO `t_sys_area` VALUES ('340706', '义安区', 3, '340700', '铜陵市', '0562', NULL);
INSERT INTO `t_sys_area` VALUES ('340711', '郊区', 3, '340700', '铜陵市', '0562', '5620399');
INSERT INTO `t_sys_area` VALUES ('340722', '枞阳县', 3, '340700', '铜陵市', '0562', NULL);
INSERT INTO `t_sys_area` VALUES ('340800', '安庆市', 2, '340000', '安徽省', '0556', NULL);
INSERT INTO `t_sys_area` VALUES ('340802', '迎江区', 3, '340800', '安庆市', '0556', '5560199');
INSERT INTO `t_sys_area` VALUES ('340803', '大观区', 3, '340800', '安庆市', '0556', '5560299');
INSERT INTO `t_sys_area` VALUES ('340811', '宜秀区', 3, '340800', '安庆市', '0556', '5560399');
INSERT INTO `t_sys_area` VALUES ('340822', '怀宁县', 3, '340800', '安庆市', '0556', '5560499');
INSERT INTO `t_sys_area` VALUES ('340824', '潜山县', 3, '340800', '安庆市', '0556', '5560699');
INSERT INTO `t_sys_area` VALUES ('340825', '太湖县', 3, '340800', '安庆市', '0556', '5560799');
INSERT INTO `t_sys_area` VALUES ('340826', '宿松县', 3, '340800', '安庆市', '0556', '5560899');
INSERT INTO `t_sys_area` VALUES ('340827', '望江县', 3, '340800', '安庆市', '0556', '5560999');
INSERT INTO `t_sys_area` VALUES ('340828', '岳西县', 3, '340800', '安庆市', '0556', '5561099');
INSERT INTO `t_sys_area` VALUES ('340881', '桐城市', 3, '340800', '安庆市', '0556', '5561199');
INSERT INTO `t_sys_area` VALUES ('341000', '黄山市', 2, '340000', '安徽省', '0559', NULL);
INSERT INTO `t_sys_area` VALUES ('341002', '屯溪区', 3, '341000', '黄山市', '0559', '5590199');
INSERT INTO `t_sys_area` VALUES ('341003', '黄山区', 3, '341000', '黄山市', '0559', '5590399');
INSERT INTO `t_sys_area` VALUES ('341004', '徽州区', 3, '341000', '黄山市', '0559', '5590499');
INSERT INTO `t_sys_area` VALUES ('341021', '歙县', 3, '341000', '黄山市', '0559', '5590599');
INSERT INTO `t_sys_area` VALUES ('341022', '休宁县', 3, '341000', '黄山市', '0559', '5590699');
INSERT INTO `t_sys_area` VALUES ('341023', '黟县', 3, '341000', '黄山市', '0559', '5590799');
INSERT INTO `t_sys_area` VALUES ('341024', '祁门县', 3, '341000', '黄山市', '0559', '5590899');
INSERT INTO `t_sys_area` VALUES ('341100', '滁州市', 2, '340000', '安徽省', '0550', NULL);
INSERT INTO `t_sys_area` VALUES ('341102', '琅琊区', 3, '341100', '滁州市', '0550', '5500199');
INSERT INTO `t_sys_area` VALUES ('341103', '南谯区', 3, '341100', '滁州市', '0550', '5500299');
INSERT INTO `t_sys_area` VALUES ('341122', '来安县', 3, '341100', '滁州市', '0550', '5500399');
INSERT INTO `t_sys_area` VALUES ('341124', '全椒县', 3, '341100', '滁州市', '0550', '5500499');
INSERT INTO `t_sys_area` VALUES ('341125', '定远县', 3, '341100', '滁州市', '0550', '5500599');
INSERT INTO `t_sys_area` VALUES ('341126', '凤阳县', 3, '341100', '滁州市', '0550', '5500699');
INSERT INTO `t_sys_area` VALUES ('341181', '天长市', 3, '341100', '滁州市', '0550', '5500799');
INSERT INTO `t_sys_area` VALUES ('341182', '明光市', 3, '341100', '滁州市', '0550', '5500899');
INSERT INTO `t_sys_area` VALUES ('341200', '阜阳市', 2, '340000', '安徽省', '1558', NULL);
INSERT INTO `t_sys_area` VALUES ('341202', '颍州区', 3, '341200', '阜阳市', '1558', '5580199');
INSERT INTO `t_sys_area` VALUES ('341203', '颍东区', 3, '341200', '阜阳市', '1558', '5580299');
INSERT INTO `t_sys_area` VALUES ('341204', '颍泉区', 3, '341200', '阜阳市', '1558', '5580399');
INSERT INTO `t_sys_area` VALUES ('341221', '临泉县', 3, '341200', '阜阳市', '1558', '5580499');
INSERT INTO `t_sys_area` VALUES ('341222', '太和县', 3, '341200', '阜阳市', '1558', '5580599');
INSERT INTO `t_sys_area` VALUES ('341225', '阜南县', 3, '341200', '阜阳市', '1558', '5580699');
INSERT INTO `t_sys_area` VALUES ('341226', '颍上县', 3, '341200', '阜阳市', '1558', '5580799');
INSERT INTO `t_sys_area` VALUES ('341282', '界首市', 3, '341200', '阜阳市', '1558', '5580899');
INSERT INTO `t_sys_area` VALUES ('341300', '宿州市', 2, '340000', '安徽省', '0557', NULL);
INSERT INTO `t_sys_area` VALUES ('341302', '埇桥区', 3, '341300', '宿州市', '0557', '5570199');
INSERT INTO `t_sys_area` VALUES ('341321', '砀山县', 3, '341300', '宿州市', '0557', '5570299');
INSERT INTO `t_sys_area` VALUES ('341322', '萧县', 3, '341300', '宿州市', '0557', '5570399');
INSERT INTO `t_sys_area` VALUES ('341323', '灵璧县', 3, '341300', '宿州市', '0557', '5570499');
INSERT INTO `t_sys_area` VALUES ('341324', '泗县', 3, '341300', '宿州市', '0557', '5570599');
INSERT INTO `t_sys_area` VALUES ('341500', '六安市', 2, '340000', '安徽省', '0564', NULL);
INSERT INTO `t_sys_area` VALUES ('341502', '金安区', 3, '341500', '六安市', '0564', '5640199');
INSERT INTO `t_sys_area` VALUES ('341503', '裕安区', 3, '341500', '六安市', '0564', '5640299');
INSERT INTO `t_sys_area` VALUES ('341504', '叶集区', 3, '341500', '六安市', '0564', NULL);
INSERT INTO `t_sys_area` VALUES ('341522', '霍邱县', 3, '341500', '六安市', '0564', '5640499');
INSERT INTO `t_sys_area` VALUES ('341523', '舒城县', 3, '341500', '六安市', '0564', '5640599');
INSERT INTO `t_sys_area` VALUES ('341524', '金寨县', 3, '341500', '六安市', '0564', '5640699');
INSERT INTO `t_sys_area` VALUES ('341525', '霍山县', 3, '341500', '六安市', '0564', '5640799');
INSERT INTO `t_sys_area` VALUES ('341600', '亳州市', 2, '340000', '安徽省', '0558', NULL);
INSERT INTO `t_sys_area` VALUES ('341602', '谯城区', 3, '341600', '亳州市', '0558', '5600199');
INSERT INTO `t_sys_area` VALUES ('341621', '涡阳县', 3, '341600', '亳州市', '0558', '5600299');
INSERT INTO `t_sys_area` VALUES ('341622', '蒙城县', 3, '341600', '亳州市', '0558', '5600399');
INSERT INTO `t_sys_area` VALUES ('341623', '利辛县', 3, '341600', '亳州市', '0558', '5600499');
INSERT INTO `t_sys_area` VALUES ('341700', '池州市', 2, '340000', '安徽省', '0566', NULL);
INSERT INTO `t_sys_area` VALUES ('341702', '贵池区', 3, '341700', '池州市', '0566', '5660199');
INSERT INTO `t_sys_area` VALUES ('341721', '东至县', 3, '341700', '池州市', '0566', '5660299');
INSERT INTO `t_sys_area` VALUES ('341722', '石台县', 3, '341700', '池州市', '0566', '5660399');
INSERT INTO `t_sys_area` VALUES ('341723', '青阳县', 3, '341700', '池州市', '0566', '5660499');
INSERT INTO `t_sys_area` VALUES ('341800', '宣城市', 2, '340000', '安徽省', '0563', NULL);
INSERT INTO `t_sys_area` VALUES ('341802', '宣州区', 3, '341800', '宣城市', '0563', '5630199');
INSERT INTO `t_sys_area` VALUES ('341821', '郎溪县', 3, '341800', '宣城市', '0563', '5630299');
INSERT INTO `t_sys_area` VALUES ('341822', '广德县', 3, '341800', '宣城市', '0563', '5630399');
INSERT INTO `t_sys_area` VALUES ('341823', '泾县', 3, '341800', '宣城市', '0563', '5630499');
INSERT INTO `t_sys_area` VALUES ('341824', '绩溪县', 3, '341800', '宣城市', '0563', '5630599');
INSERT INTO `t_sys_area` VALUES ('341825', '旌德县', 3, '341800', '宣城市', '0563', '5630699');
INSERT INTO `t_sys_area` VALUES ('341881', '宁国市', 3, '341800', '宣城市', '0563', '5630799');
INSERT INTO `t_sys_area` VALUES ('350000', '福建省', 1, '000000', '中华人民共和国', NULL, NULL);
INSERT INTO `t_sys_area` VALUES ('350100', '福州市', 2, '350000', '福建省', '0591', NULL);
INSERT INTO `t_sys_area` VALUES ('350102', '鼓楼区', 3, '350100', '福州市', '0591', '5910199');
INSERT INTO `t_sys_area` VALUES ('350103', '台江区', 3, '350100', '福州市', '0591', '5910299');
INSERT INTO `t_sys_area` VALUES ('350104', '仓山区', 3, '350100', '福州市', '0591', '5910399');
INSERT INTO `t_sys_area` VALUES ('350105', '马尾区', 3, '350100', '福州市', '0591', '5910499');
INSERT INTO `t_sys_area` VALUES ('350111', '晋安区', 3, '350100', '福州市', '0591', '5910599');
INSERT INTO `t_sys_area` VALUES ('350121', '闽侯县', 3, '350100', '福州市', '0591', '5910699');
INSERT INTO `t_sys_area` VALUES ('350122', '连江县', 3, '350100', '福州市', '0591', '5910799');
INSERT INTO `t_sys_area` VALUES ('350123', '罗源县', 3, '350100', '福州市', '0591', '5910899');
INSERT INTO `t_sys_area` VALUES ('350124', '闽清县', 3, '350100', '福州市', '0591', '5910999');
INSERT INTO `t_sys_area` VALUES ('350125', '永泰县', 3, '350100', '福州市', '0591', '5911099');
INSERT INTO `t_sys_area` VALUES ('350128', '平潭县', 3, '350100', '福州市', '0591', '5911199');
INSERT INTO `t_sys_area` VALUES ('350181', '福清市', 3, '350100', '福州市', '0591', '5911299');
INSERT INTO `t_sys_area` VALUES ('350182', '长乐区', 3, '350100', '福州市', '0591', '5911399');
INSERT INTO `t_sys_area` VALUES ('350200', '厦门市', 2, '350000', '福建省', '0592', NULL);
INSERT INTO `t_sys_area` VALUES ('350203', '思明区', 3, '350200', '厦门市', '0592', '5920199');
INSERT INTO `t_sys_area` VALUES ('350205', '海沧区', 3, '350200', '厦门市', '0592', '5920299');
INSERT INTO `t_sys_area` VALUES ('350206', '湖里区', 3, '350200', '厦门市', '0592', '5920399');
INSERT INTO `t_sys_area` VALUES ('350211', '集美区', 3, '350200', '厦门市', '0592', '5920499');
INSERT INTO `t_sys_area` VALUES ('350212', '同安区', 3, '350200', '厦门市', '0592', '5920599');
INSERT INTO `t_sys_area` VALUES ('350213', '翔安区', 3, '350200', '厦门市', '0592', '5920699');
INSERT INTO `t_sys_area` VALUES ('350300', '莆田市', 2, '350000', '福建省', '0594', NULL);
INSERT INTO `t_sys_area` VALUES ('350302', '城厢区', 3, '350300', '莆田市', '0594', '5940199');
INSERT INTO `t_sys_area` VALUES ('350303', '涵江区', 3, '350300', '莆田市', '0594', '5940299');
INSERT INTO `t_sys_area` VALUES ('350304', '荔城区', 3, '350300', '莆田市', '0594', '5940399');
INSERT INTO `t_sys_area` VALUES ('350305', '秀屿区', 3, '350300', '莆田市', '0594', '5940499');
INSERT INTO `t_sys_area` VALUES ('350322', '仙游县', 3, '350300', '莆田市', '0594', '5940599');
INSERT INTO `t_sys_area` VALUES ('350400', '三明市', 2, '350000', '福建省', '0598', NULL);
INSERT INTO `t_sys_area` VALUES ('350402', '梅列区', 3, '350400', '三明市', '0598', '5980199');
INSERT INTO `t_sys_area` VALUES ('350403', '三元区', 3, '350400', '三明市', '0598', '5980299');
INSERT INTO `t_sys_area` VALUES ('350421', '明溪县', 3, '350400', '三明市', '0598', '5980399');
INSERT INTO `t_sys_area` VALUES ('350423', '清流县', 3, '350400', '三明市', '0598', '5980499');
INSERT INTO `t_sys_area` VALUES ('350424', '宁化县', 3, '350400', '三明市', '0598', '5980599');
INSERT INTO `t_sys_area` VALUES ('350425', '大田县', 3, '350400', '三明市', '0598', '5980699');
INSERT INTO `t_sys_area` VALUES ('350426', '尤溪县', 3, '350400', '三明市', '0598', '5980799');
INSERT INTO `t_sys_area` VALUES ('350427', '沙县', 3, '350400', '三明市', '0598', '5980899');
INSERT INTO `t_sys_area` VALUES ('350428', '将乐县', 3, '350400', '三明市', '0598', '5980999');
INSERT INTO `t_sys_area` VALUES ('350429', '泰宁县', 3, '350400', '三明市', '0598', '5981099');
INSERT INTO `t_sys_area` VALUES ('350430', '建宁县', 3, '350400', '三明市', '0598', '5981199');
INSERT INTO `t_sys_area` VALUES ('350481', '永安市', 3, '350400', '三明市', '0598', '5981299');
INSERT INTO `t_sys_area` VALUES ('350500', '泉州市', 2, '350000', '福建省', '0595', NULL);
INSERT INTO `t_sys_area` VALUES ('350502', '鲤城区', 3, '350500', '泉州市', '0595', '5950199');
INSERT INTO `t_sys_area` VALUES ('350503', '丰泽区', 3, '350500', '泉州市', '0595', '5950299');
INSERT INTO `t_sys_area` VALUES ('350504', '洛江区', 3, '350500', '泉州市', '0595', '5950399');
INSERT INTO `t_sys_area` VALUES ('350505', '泉港区', 3, '350500', '泉州市', '0595', '5950499');
INSERT INTO `t_sys_area` VALUES ('350521', '惠安县', 3, '350500', '泉州市', '0595', '5950599');
INSERT INTO `t_sys_area` VALUES ('350524', '安溪县', 3, '350500', '泉州市', '0595', '5950699');
INSERT INTO `t_sys_area` VALUES ('350525', '永春县', 3, '350500', '泉州市', '0595', '5950799');
INSERT INTO `t_sys_area` VALUES ('350526', '德化县', 3, '350500', '泉州市', '0595', '5950899');
INSERT INTO `t_sys_area` VALUES ('350527', '金门县', 3, '350500', '泉州市', '0595', NULL);
INSERT INTO `t_sys_area` VALUES ('350581', '石狮市', 3, '350500', '泉州市', '0595', '5951099');
INSERT INTO `t_sys_area` VALUES ('350582', '晋江市', 3, '350500', '泉州市', '0595', '5951199');
INSERT INTO `t_sys_area` VALUES ('350583', '南安市', 3, '350500', '泉州市', '0595', '5951299');
INSERT INTO `t_sys_area` VALUES ('350600', '漳州市', 2, '350000', '福建省', '0596', NULL);
INSERT INTO `t_sys_area` VALUES ('350602', '芗城区', 3, '350600', '漳州市', '0596', '5960199');
INSERT INTO `t_sys_area` VALUES ('350603', '龙文区', 3, '350600', '漳州市', '0596', '5960299');
INSERT INTO `t_sys_area` VALUES ('350622', '云霄县', 3, '350600', '漳州市', '0596', '5960399');
INSERT INTO `t_sys_area` VALUES ('350623', '漳浦县', 3, '350600', '漳州市', '0596', '5960499');
INSERT INTO `t_sys_area` VALUES ('350624', '诏安县', 3, '350600', '漳州市', '0596', '5960599');
INSERT INTO `t_sys_area` VALUES ('350625', '长泰县', 3, '350600', '漳州市', '0596', '5960699');
INSERT INTO `t_sys_area` VALUES ('350626', '东山县', 3, '350600', '漳州市', '0596', '5960799');
INSERT INTO `t_sys_area` VALUES ('350627', '南靖县', 3, '350600', '漳州市', '0596', '5960899');
INSERT INTO `t_sys_area` VALUES ('350628', '平和县', 3, '350600', '漳州市', '0596', '5960999');
INSERT INTO `t_sys_area` VALUES ('350629', '华安县', 3, '350600', '漳州市', '0596', '5961099');
INSERT INTO `t_sys_area` VALUES ('350681', '龙海市', 3, '350600', '漳州市', '0596', '5961199');
INSERT INTO `t_sys_area` VALUES ('350700', '南平市', 2, '350000', '福建省', '0599', NULL);
INSERT INTO `t_sys_area` VALUES ('350702', '延平区', 3, '350700', '南平市', '0599', '5990199');
INSERT INTO `t_sys_area` VALUES ('350703', '建阳区', 3, '350700', '南平市', '0599', '5991099');
INSERT INTO `t_sys_area` VALUES ('350721', '顺昌县', 3, '350700', '南平市', '0599', '5990299');
INSERT INTO `t_sys_area` VALUES ('350722', '浦城县', 3, '350700', '南平市', '0599', '5990399');
INSERT INTO `t_sys_area` VALUES ('350723', '光泽县', 3, '350700', '南平市', '0599', '5990499');
INSERT INTO `t_sys_area` VALUES ('350724', '松溪县', 3, '350700', '南平市', '0599', '5990599');
INSERT INTO `t_sys_area` VALUES ('350725', '政和县', 3, '350700', '南平市', '0599', '5990699');
INSERT INTO `t_sys_area` VALUES ('350781', '邵武市', 3, '350700', '南平市', '0599', '5990799');
INSERT INTO `t_sys_area` VALUES ('350782', '武夷山市', 3, '350700', '南平市', '0599', '5990899');
INSERT INTO `t_sys_area` VALUES ('350783', '建瓯市', 3, '350700', '南平市', '0599', '5990999');
INSERT INTO `t_sys_area` VALUES ('350800', '龙岩市', 2, '350000', '福建省', '0597', NULL);
INSERT INTO `t_sys_area` VALUES ('350802', '新罗区', 3, '350800', '龙岩市', '0597', '5970199');
INSERT INTO `t_sys_area` VALUES ('350803', '永定区', 3, '350800', '龙岩市', '0597', '5970399');
INSERT INTO `t_sys_area` VALUES ('350821', '长汀县', 3, '350800', '龙岩市', '0597', '5970299');
INSERT INTO `t_sys_area` VALUES ('350823', '上杭县', 3, '350800', '龙岩市', '0597', '5970499');
INSERT INTO `t_sys_area` VALUES ('350824', '武平县', 3, '350800', '龙岩市', '0597', '5970599');
INSERT INTO `t_sys_area` VALUES ('350825', '连城县', 3, '350800', '龙岩市', '0597', '5970699');
INSERT INTO `t_sys_area` VALUES ('350881', '漳平市', 3, '350800', '龙岩市', '0597', '5970799');
INSERT INTO `t_sys_area` VALUES ('350900', '宁德市', 2, '350000', '福建省', '0593', NULL);
INSERT INTO `t_sys_area` VALUES ('350902', '蕉城区', 3, '350900', '宁德市', '0593', '5930199');
INSERT INTO `t_sys_area` VALUES ('350921', '霞浦县', 3, '350900', '宁德市', '0593', '5930299');
INSERT INTO `t_sys_area` VALUES ('350922', '古田县', 3, '350900', '宁德市', '0593', '5930399');
INSERT INTO `t_sys_area` VALUES ('350923', '屏南县', 3, '350900', '宁德市', '0593', '5930499');
INSERT INTO `t_sys_area` VALUES ('350924', '寿宁县', 3, '350900', '宁德市', '0593', '5930599');
INSERT INTO `t_sys_area` VALUES ('350925', '周宁县', 3, '350900', '宁德市', '0593', '5930699');
INSERT INTO `t_sys_area` VALUES ('350926', '柘荣县', 3, '350900', '宁德市', '0593', '5930799');
INSERT INTO `t_sys_area` VALUES ('350981', '福安市', 3, '350900', '宁德市', '0593', '5930899');
INSERT INTO `t_sys_area` VALUES ('350982', '福鼎市', 3, '350900', '宁德市', '0593', '5930999');
INSERT INTO `t_sys_area` VALUES ('360000', '江西省', 1, '000000', '中华人民共和国', NULL, NULL);
INSERT INTO `t_sys_area` VALUES ('360100', '南昌市', 2, '360000', '江西省', '0791', NULL);
INSERT INTO `t_sys_area` VALUES ('360102', '东湖区', 3, '360100', '南昌市', '0791', '7910199');
INSERT INTO `t_sys_area` VALUES ('360103', '西湖区', 3, '360100', '南昌市', '0791', '7910299');
INSERT INTO `t_sys_area` VALUES ('360104', '青云谱区', 3, '360100', '南昌市', '0791', '7910399');
INSERT INTO `t_sys_area` VALUES ('360105', '湾里区', 3, '360100', '南昌市', '0791', '7910499');
INSERT INTO `t_sys_area` VALUES ('360111', '青山湖区', 3, '360100', '南昌市', '0791', '7911099');
INSERT INTO `t_sys_area` VALUES ('360112', '新建区', 3, '360100', '南昌市', '0791', '7910799');
INSERT INTO `t_sys_area` VALUES ('360121', '南昌县', 3, '360100', '南昌市', '0791', '7910699');
INSERT INTO `t_sys_area` VALUES ('360123', '安义县', 3, '360100', '南昌市', '0791', '7910899');
INSERT INTO `t_sys_area` VALUES ('360124', '进贤县', 3, '360100', '南昌市', '0791', '7910999');
INSERT INTO `t_sys_area` VALUES ('360200', '景德镇市', 2, '360000', '江西省', '0798', NULL);
INSERT INTO `t_sys_area` VALUES ('360202', '昌江区', 3, '360200', '景德镇市', '0798', '7980199');
INSERT INTO `t_sys_area` VALUES ('360203', '珠山区', 3, '360200', '景德镇市', '0798', '7980299');
INSERT INTO `t_sys_area` VALUES ('360222', '浮梁县', 3, '360200', '景德镇市', '0798', '7980399');
INSERT INTO `t_sys_area` VALUES ('360281', '乐平市', 3, '360200', '景德镇市', '0798', '7980499');
INSERT INTO `t_sys_area` VALUES ('360300', '萍乡市', 2, '360000', '江西省', '0799', NULL);
INSERT INTO `t_sys_area` VALUES ('360302', '安源区', 3, '360300', '萍乡市', '0799', '7990199');
INSERT INTO `t_sys_area` VALUES ('360313', '湘东区', 3, '360300', '萍乡市', '0799', '7990299');
INSERT INTO `t_sys_area` VALUES ('360321', '莲花县', 3, '360300', '萍乡市', '0799', '7990399');
INSERT INTO `t_sys_area` VALUES ('360322', '上栗县', 3, '360300', '萍乡市', '0799', '7990499');
INSERT INTO `t_sys_area` VALUES ('360323', '芦溪县', 3, '360300', '萍乡市', '0799', '7990599');
INSERT INTO `t_sys_area` VALUES ('360400', '九江市', 2, '360000', '江西省', '0792', NULL);
INSERT INTO `t_sys_area` VALUES ('360402', '濂溪区', 3, '360400', '九江市', '0792', '7920199');
INSERT INTO `t_sys_area` VALUES ('360403', '浔阳区', 3, '360400', '九江市', '0792', '7920299');
INSERT INTO `t_sys_area` VALUES ('360421', '柴桑区', 3, '360400', '九江市', '0792', '7920399');
INSERT INTO `t_sys_area` VALUES ('360423', '武宁县', 3, '360400', '九江市', '0792', '7920499');
INSERT INTO `t_sys_area` VALUES ('360424', '修水县', 3, '360400', '九江市', '0792', '7920599');
INSERT INTO `t_sys_area` VALUES ('360425', '永修县', 3, '360400', '九江市', '0792', '7920699');
INSERT INTO `t_sys_area` VALUES ('360426', '德安县', 3, '360400', '九江市', '0792', '7920799');
INSERT INTO `t_sys_area` VALUES ('360428', '都昌县', 3, '360400', '九江市', '0792', '7920999');
INSERT INTO `t_sys_area` VALUES ('360429', '湖口县', 3, '360400', '九江市', '0792', '7921099');
INSERT INTO `t_sys_area` VALUES ('360430', '彭泽县', 3, '360400', '九江市', '0792', '7921199');
INSERT INTO `t_sys_area` VALUES ('360481', '瑞昌市', 3, '360400', '九江市', '0792', '7921299');
INSERT INTO `t_sys_area` VALUES ('360482', '共青城市', 3, '360400', '九江市', '0792', NULL);
INSERT INTO `t_sys_area` VALUES ('360483', '庐山市', 3, '360400', '九江市', '0792', NULL);
INSERT INTO `t_sys_area` VALUES ('360500', '新余市', 2, '360000', '江西省', '0790', NULL);
INSERT INTO `t_sys_area` VALUES ('360502', '渝水区', 3, '360500', '新余市', '0790', '7900199');
INSERT INTO `t_sys_area` VALUES ('360521', '分宜县', 3, '360500', '新余市', '0790', '7900299');
INSERT INTO `t_sys_area` VALUES ('360600', '鹰潭市', 2, '360000', '江西省', '0701', NULL);
INSERT INTO `t_sys_area` VALUES ('360602', '月湖区', 3, '360600', '鹰潭市', '0701', '7010199');
INSERT INTO `t_sys_area` VALUES ('360622', '余江县', 3, '360600', '鹰潭市', '0701', '7010299');
INSERT INTO `t_sys_area` VALUES ('360681', '贵溪市', 3, '360600', '鹰潭市', '0701', '7010399');
INSERT INTO `t_sys_area` VALUES ('360700', '赣州市', 2, '360000', '江西省', '0797', NULL);
INSERT INTO `t_sys_area` VALUES ('360702', '章贡区', 3, '360700', '赣州市', '0797', '7970199');
INSERT INTO `t_sys_area` VALUES ('360703', '南康区', 3, '360700', '赣州市', '0797', NULL);
INSERT INTO `t_sys_area` VALUES ('360704', '赣县区', 3, '360700', '赣州市', '0797', NULL);
INSERT INTO `t_sys_area` VALUES ('360722', '信丰县', 3, '360700', '赣州市', '0797', '7970399');
INSERT INTO `t_sys_area` VALUES ('360723', '大余县', 3, '360700', '赣州市', '0797', '7970499');
INSERT INTO `t_sys_area` VALUES ('360724', '上犹县', 3, '360700', '赣州市', '0797', '7970599');
INSERT INTO `t_sys_area` VALUES ('360725', '崇义县', 3, '360700', '赣州市', '0797', '7970699');
INSERT INTO `t_sys_area` VALUES ('360726', '安远县', 3, '360700', '赣州市', '0797', '7970799');
INSERT INTO `t_sys_area` VALUES ('360727', '龙南县', 3, '360700', '赣州市', '0797', '7970899');
INSERT INTO `t_sys_area` VALUES ('360728', '定南县', 3, '360700', '赣州市', '0797', '7970999');
INSERT INTO `t_sys_area` VALUES ('360729', '全南县', 3, '360700', '赣州市', '0797', '7971099');
INSERT INTO `t_sys_area` VALUES ('360730', '宁都县', 3, '360700', '赣州市', '0797', '7971199');
INSERT INTO `t_sys_area` VALUES ('360731', '于都县', 3, '360700', '赣州市', '0797', '7971299');
INSERT INTO `t_sys_area` VALUES ('360732', '兴国县', 3, '360700', '赣州市', '0797', '7971399');
INSERT INTO `t_sys_area` VALUES ('360733', '会昌县', 3, '360700', '赣州市', '0797', '7971499');
INSERT INTO `t_sys_area` VALUES ('360734', '寻乌县', 3, '360700', '赣州市', '0797', '7971599');
INSERT INTO `t_sys_area` VALUES ('360735', '石城县', 3, '360700', '赣州市', '0797', '7971699');
INSERT INTO `t_sys_area` VALUES ('360781', '瑞金市', 3, '360700', '赣州市', '0797', '7971799');
INSERT INTO `t_sys_area` VALUES ('360800', '吉安市', 2, '360000', '江西省', '0796', NULL);
INSERT INTO `t_sys_area` VALUES ('360802', '吉州区', 3, '360800', '吉安市', '0796', '7960199');
INSERT INTO `t_sys_area` VALUES ('360803', '青原区', 3, '360800', '吉安市', '0796', '7960299');
INSERT INTO `t_sys_area` VALUES ('360821', '吉安县', 3, '360800', '吉安市', '0796', '7960399');
INSERT INTO `t_sys_area` VALUES ('360822', '吉水县', 3, '360800', '吉安市', '0796', '7960499');
INSERT INTO `t_sys_area` VALUES ('360823', '峡江县', 3, '360800', '吉安市', '0796', '7960599');
INSERT INTO `t_sys_area` VALUES ('360824', '新干县', 3, '360800', '吉安市', '0796', '7960699');
INSERT INTO `t_sys_area` VALUES ('360825', '永丰县', 3, '360800', '吉安市', '0796', '7960799');
INSERT INTO `t_sys_area` VALUES ('360826', '泰和县', 3, '360800', '吉安市', '0796', '7960899');
INSERT INTO `t_sys_area` VALUES ('360827', '遂川县', 3, '360800', '吉安市', '0796', '7960999');
INSERT INTO `t_sys_area` VALUES ('360828', '万安县', 3, '360800', '吉安市', '0796', '7961099');
INSERT INTO `t_sys_area` VALUES ('360829', '安福县', 3, '360800', '吉安市', '0796', '7961199');
INSERT INTO `t_sys_area` VALUES ('360830', '永新县', 3, '360800', '吉安市', '0796', '7961299');
INSERT INTO `t_sys_area` VALUES ('360881', '井冈山市', 3, '360800', '吉安市', '0796', '7961399');
INSERT INTO `t_sys_area` VALUES ('360900', '宜春市', 2, '360000', '江西省', '0795', NULL);
INSERT INTO `t_sys_area` VALUES ('360902', '袁州区', 3, '360900', '宜春市', '0795', '7950199');
INSERT INTO `t_sys_area` VALUES ('360921', '奉新县', 3, '360900', '宜春市', '0795', '7950299');
INSERT INTO `t_sys_area` VALUES ('360922', '万载县', 3, '360900', '宜春市', '0795', '7950399');
INSERT INTO `t_sys_area` VALUES ('360923', '上高县', 3, '360900', '宜春市', '0795', '7950499');
INSERT INTO `t_sys_area` VALUES ('360924', '宜丰县', 3, '360900', '宜春市', '0795', '7950599');
INSERT INTO `t_sys_area` VALUES ('360925', '靖安县', 3, '360900', '宜春市', '0795', '7950699');
INSERT INTO `t_sys_area` VALUES ('360926', '铜鼓县', 3, '360900', '宜春市', '0795', '7950799');
INSERT INTO `t_sys_area` VALUES ('360981', '丰城市', 3, '360900', '宜春市', '0795', '7950899');
INSERT INTO `t_sys_area` VALUES ('360982', '樟树市', 3, '360900', '宜春市', '0795', '7950999');
INSERT INTO `t_sys_area` VALUES ('360983', '高安市', 3, '360900', '宜春市', '0795', '7951099');
INSERT INTO `t_sys_area` VALUES ('361000', '抚州市', 2, '360000', '江西省', '0794', NULL);
INSERT INTO `t_sys_area` VALUES ('361002', '临川区', 3, '361000', '抚州市', '0794', '7940199');
INSERT INTO `t_sys_area` VALUES ('361003', '东乡区', 3, '361000', '抚州市', '0794', NULL);
INSERT INTO `t_sys_area` VALUES ('361021', '南城县', 3, '361000', '抚州市', '0794', '7940299');
INSERT INTO `t_sys_area` VALUES ('361022', '黎川县', 3, '361000', '抚州市', '0794', '7940399');
INSERT INTO `t_sys_area` VALUES ('361023', '南丰县', 3, '361000', '抚州市', '0794', '7940499');
INSERT INTO `t_sys_area` VALUES ('361024', '崇仁县', 3, '361000', '抚州市', '0794', '7940599');
INSERT INTO `t_sys_area` VALUES ('361025', '乐安县', 3, '361000', '抚州市', '0794', '7940699');
INSERT INTO `t_sys_area` VALUES ('361026', '宜黄县', 3, '361000', '抚州市', '0794', '7940799');
INSERT INTO `t_sys_area` VALUES ('361027', '金溪县', 3, '361000', '抚州市', '0794', '7940899');
INSERT INTO `t_sys_area` VALUES ('361028', '资溪县', 3, '361000', '抚州市', '0794', '7940999');
INSERT INTO `t_sys_area` VALUES ('361030', '广昌县', 3, '361000', '抚州市', '0794', '7941199');
INSERT INTO `t_sys_area` VALUES ('361100', '上饶市', 2, '360000', '江西省', '0793', NULL);
INSERT INTO `t_sys_area` VALUES ('361102', '信州区', 3, '361100', '上饶市', '0793', '7930199');
INSERT INTO `t_sys_area` VALUES ('361103', '广丰区', 3, '361100', '上饶市', '0793', '7930399');
INSERT INTO `t_sys_area` VALUES ('361121', '广信区', 3, '361100', '上饶市', '0793', '7930299');
INSERT INTO `t_sys_area` VALUES ('361123', '玉山县', 3, '361100', '上饶市', '0793', '7930499');
INSERT INTO `t_sys_area` VALUES ('361124', '铅山县', 3, '361100', '上饶市', '0793', '7930599');
INSERT INTO `t_sys_area` VALUES ('361125', '横峰县', 3, '361100', '上饶市', '0793', '7930699');
INSERT INTO `t_sys_area` VALUES ('361126', '弋阳县', 3, '361100', '上饶市', '0793', '7930799');
INSERT INTO `t_sys_area` VALUES ('361127', '余干县', 3, '361100', '上饶市', '0793', '7930899');
INSERT INTO `t_sys_area` VALUES ('361128', '鄱阳县', 3, '361100', '上饶市', '0793', '7930999');
INSERT INTO `t_sys_area` VALUES ('361129', '万年县', 3, '361100', '上饶市', '0793', '7931099');
INSERT INTO `t_sys_area` VALUES ('361130', '婺源县', 3, '361100', '上饶市', '0793', '7931199');
INSERT INTO `t_sys_area` VALUES ('361181', '德兴市', 3, '361100', '上饶市', '0793', '7931299');
INSERT INTO `t_sys_area` VALUES ('370000', '山东省', 1, '000000', '中华人民共和国', NULL, NULL);
INSERT INTO `t_sys_area` VALUES ('370100', '济南市', 2, '370000', '山东省', '0531', NULL);
INSERT INTO `t_sys_area` VALUES ('370102', '历下区', 3, '370100', '济南市', '0531', '5310199');
INSERT INTO `t_sys_area` VALUES ('370103', '市中区', 3, '370100', '济南市', '0531', '5310299');
INSERT INTO `t_sys_area` VALUES ('370104', '槐荫区', 3, '370100', '济南市', '0531', '5310399');
INSERT INTO `t_sys_area` VALUES ('370105', '天桥区', 3, '370100', '济南市', '0531', '5310499');
INSERT INTO `t_sys_area` VALUES ('370112', '历城区', 3, '370100', '济南市', '0531', '5310599');
INSERT INTO `t_sys_area` VALUES ('370113', '长清区', 3, '370100', '济南市', '0531', '5310699');
INSERT INTO `t_sys_area` VALUES ('370114', '章丘区', 3, '370100', '济南市', '0531', NULL);
INSERT INTO `t_sys_area` VALUES ('370124', '平阴县', 3, '370100', '济南市', '0531', '5310799');
INSERT INTO `t_sys_area` VALUES ('370125', '济阳县', 3, '370100', '济南市', '0531', '5310899');
INSERT INTO `t_sys_area` VALUES ('370126', '商河县', 3, '370100', '济南市', '0531', '5310999');
INSERT INTO `t_sys_area` VALUES ('370200', '青岛市', 2, '370000', '山东省', '0532', NULL);
INSERT INTO `t_sys_area` VALUES ('370202', '市南区', 3, '370200', '青岛市', '0532', '5320199');
INSERT INTO `t_sys_area` VALUES ('370203', '市北区', 3, '370200', '青岛市', '0532', '5320399');
INSERT INTO `t_sys_area` VALUES ('370211', '黄岛区', 3, '370200', '青岛市', '0532', '5321199');
INSERT INTO `t_sys_area` VALUES ('370212', '崂山区', 3, '370200', '青岛市', '0532', '5320599');
INSERT INTO `t_sys_area` VALUES ('370213', '李沧区', 3, '370200', '青岛市', '0532', '5320699');
INSERT INTO `t_sys_area` VALUES ('370214', '城阳区', 3, '370200', '青岛市', '0532', '5320799');
INSERT INTO `t_sys_area` VALUES ('370281', '胶州市', 3, '370200', '青岛市', '0532', '5320899');
INSERT INTO `t_sys_area` VALUES ('370282', '即墨区', 3, '370200', '青岛市', '0532', '5320999');
INSERT INTO `t_sys_area` VALUES ('370283', '平度市', 3, '370200', '青岛市', '0532', '5321099');
INSERT INTO `t_sys_area` VALUES ('370285', '莱西市', 3, '370200', '青岛市', '0532', '5321299');
INSERT INTO `t_sys_area` VALUES ('370300', '淄博市', 2, '370000', '山东省', '0533', NULL);
INSERT INTO `t_sys_area` VALUES ('370302', '淄川区', 3, '370300', '淄博市', '0533', '5330199');
INSERT INTO `t_sys_area` VALUES ('370303', '张店区', 3, '370300', '淄博市', '0533', '5330299');
INSERT INTO `t_sys_area` VALUES ('370304', '博山区', 3, '370300', '淄博市', '0533', '5330399');
INSERT INTO `t_sys_area` VALUES ('370305', '临淄区', 3, '370300', '淄博市', '0533', '5330499');
INSERT INTO `t_sys_area` VALUES ('370306', '周村区', 3, '370300', '淄博市', '0533', '5330599');
INSERT INTO `t_sys_area` VALUES ('370321', '桓台县', 3, '370300', '淄博市', '0533', '5330699');
INSERT INTO `t_sys_area` VALUES ('370322', '高青县', 3, '370300', '淄博市', '0533', '5330799');
INSERT INTO `t_sys_area` VALUES ('370323', '沂源县', 3, '370300', '淄博市', '0533', '5330899');
INSERT INTO `t_sys_area` VALUES ('370400', '枣庄市', 2, '370000', '山东省', '0632', NULL);
INSERT INTO `t_sys_area` VALUES ('370402', '市中区', 3, '370400', '枣庄市', '0632', '6320199');
INSERT INTO `t_sys_area` VALUES ('370403', '薛城区', 3, '370400', '枣庄市', '0632', '6320299');
INSERT INTO `t_sys_area` VALUES ('370404', '峄城区', 3, '370400', '枣庄市', '0632', '6320399');
INSERT INTO `t_sys_area` VALUES ('370405', '台儿庄区', 3, '370400', '枣庄市', '0632', '6320499');
INSERT INTO `t_sys_area` VALUES ('370406', '山亭区', 3, '370400', '枣庄市', '0632', '6320599');
INSERT INTO `t_sys_area` VALUES ('370481', '滕州市', 3, '370400', '枣庄市', '0632', '6320699');
INSERT INTO `t_sys_area` VALUES ('370500', '东营市', 2, '370000', '山东省', '0546', NULL);
INSERT INTO `t_sys_area` VALUES ('370502', '东营区', 3, '370500', '东营市', '0546', '5460199');
INSERT INTO `t_sys_area` VALUES ('370503', '河口区', 3, '370500', '东营市', '0546', '5460299');
INSERT INTO `t_sys_area` VALUES ('370505', '垦利区', 3, '370500', '东营市', '0546', NULL);
INSERT INTO `t_sys_area` VALUES ('370522', '利津县', 3, '370500', '东营市', '0546', '5460499');
INSERT INTO `t_sys_area` VALUES ('370523', '广饶县', 3, '370500', '东营市', '0546', '5460599');
INSERT INTO `t_sys_area` VALUES ('370600', '烟台市', 2, '370000', '山东省', '0535', NULL);
INSERT INTO `t_sys_area` VALUES ('370602', '芝罘区', 3, '370600', '烟台市', '0535', '5350199');
INSERT INTO `t_sys_area` VALUES ('370611', '福山区', 3, '370600', '烟台市', '0535', '5351399');
INSERT INTO `t_sys_area` VALUES ('370612', '牟平区', 3, '370600', '烟台市', '0535', '5350499');
INSERT INTO `t_sys_area` VALUES ('370613', '莱山区', 3, '370600', '烟台市', '0535', '5350399');
INSERT INTO `t_sys_area` VALUES ('370634', '长岛县', 3, '370600', '烟台市', '0535', '5350599');
INSERT INTO `t_sys_area` VALUES ('370681', '龙口市', 3, '370600', '烟台市', '0535', '5350699');
INSERT INTO `t_sys_area` VALUES ('370682', '莱阳市', 3, '370600', '烟台市', '0535', '5350799');
INSERT INTO `t_sys_area` VALUES ('370683', '莱州市', 3, '370600', '烟台市', '0535', '5350899');
INSERT INTO `t_sys_area` VALUES ('370684', '蓬莱市', 3, '370600', '烟台市', '0535', '5350999');
INSERT INTO `t_sys_area` VALUES ('370685', '招远市', 3, '370600', '烟台市', '0535', '5351099');
INSERT INTO `t_sys_area` VALUES ('370686', '栖霞市', 3, '370600', '烟台市', '0535', '5351199');
INSERT INTO `t_sys_area` VALUES ('370687', '海阳市', 3, '370600', '烟台市', '0535', '5351299');
INSERT INTO `t_sys_area` VALUES ('370700', '潍坊市', 2, '370000', '山东省', '0536', NULL);
INSERT INTO `t_sys_area` VALUES ('370702', '潍城区', 3, '370700', '潍坊市', '0536', '5360199');
INSERT INTO `t_sys_area` VALUES ('370703', '寒亭区', 3, '370700', '潍坊市', '0536', '5360299');
INSERT INTO `t_sys_area` VALUES ('370704', '坊子区', 3, '370700', '潍坊市', '0536', '5360399');
INSERT INTO `t_sys_area` VALUES ('370705', '奎文区', 3, '370700', '潍坊市', '0536', '5360499');
INSERT INTO `t_sys_area` VALUES ('370724', '临朐县', 3, '370700', '潍坊市', '0536', '5360599');
INSERT INTO `t_sys_area` VALUES ('370725', '昌乐县', 3, '370700', '潍坊市', '0536', '5360699');
INSERT INTO `t_sys_area` VALUES ('370781', '青州市', 3, '370700', '潍坊市', '0536', '5360799');
INSERT INTO `t_sys_area` VALUES ('370782', '诸城市', 3, '370700', '潍坊市', '0536', '5360899');
INSERT INTO `t_sys_area` VALUES ('370783', '寿光市', 3, '370700', '潍坊市', '0536', '5360999');
INSERT INTO `t_sys_area` VALUES ('370784', '安丘市', 3, '370700', '潍坊市', '0536', '5361099');
INSERT INTO `t_sys_area` VALUES ('370785', '高密市', 3, '370700', '潍坊市', '0536', '5361199');
INSERT INTO `t_sys_area` VALUES ('370786', '昌邑市', 3, '370700', '潍坊市', '0536', '5361299');
INSERT INTO `t_sys_area` VALUES ('370800', '济宁市', 2, '370000', '山东省', '0537', NULL);
INSERT INTO `t_sys_area` VALUES ('370811', '任城区', 3, '370800', '济宁市', '0537', '5370299');
INSERT INTO `t_sys_area` VALUES ('370812', '兖州区', 3, '370800', '济宁市', '0537', '5371199');
INSERT INTO `t_sys_area` VALUES ('370826', '微山县', 3, '370800', '济宁市', '0537', '5370399');
INSERT INTO `t_sys_area` VALUES ('370827', '鱼台县', 3, '370800', '济宁市', '0537', '5370499');
INSERT INTO `t_sys_area` VALUES ('370828', '金乡县', 3, '370800', '济宁市', '0537', '5370599');
INSERT INTO `t_sys_area` VALUES ('370829', '嘉祥县', 3, '370800', '济宁市', '0537', '5370699');
INSERT INTO `t_sys_area` VALUES ('370830', '汶上县', 3, '370800', '济宁市', '0537', '5370799');
INSERT INTO `t_sys_area` VALUES ('370831', '泗水县', 3, '370800', '济宁市', '0537', '5370899');
INSERT INTO `t_sys_area` VALUES ('370832', '梁山县', 3, '370800', '济宁市', '0537', '5370999');
INSERT INTO `t_sys_area` VALUES ('370881', '曲阜市', 3, '370800', '济宁市', '0537', '5371099');
INSERT INTO `t_sys_area` VALUES ('370883', '邹城市', 3, '370800', '济宁市', '0537', '5371299');
INSERT INTO `t_sys_area` VALUES ('370900', '泰安市', 2, '370000', '山东省', '0538', NULL);
INSERT INTO `t_sys_area` VALUES ('370902', '泰山区', 3, '370900', '泰安市', '0538', '5380199');
INSERT INTO `t_sys_area` VALUES ('370911', '岱岳区', 3, '370900', '泰安市', '0538', '5380299');
INSERT INTO `t_sys_area` VALUES ('370921', '宁阳县', 3, '370900', '泰安市', '0538', '5380399');
INSERT INTO `t_sys_area` VALUES ('370923', '东平县', 3, '370900', '泰安市', '0538', '5380499');
INSERT INTO `t_sys_area` VALUES ('370982', '新泰市', 3, '370900', '泰安市', '0538', '5380599');
INSERT INTO `t_sys_area` VALUES ('370983', '肥城市', 3, '370900', '泰安市', '0538', '5380699');
INSERT INTO `t_sys_area` VALUES ('371000', '威海市', 2, '370000', '山东省', '0631', NULL);
INSERT INTO `t_sys_area` VALUES ('371002', '环翠区', 3, '371000', '威海市', '0631', '6310199');
INSERT INTO `t_sys_area` VALUES ('371003', '文登区', 3, '371000', '威海市', '0631', '6310299');
INSERT INTO `t_sys_area` VALUES ('371082', '荣成市', 3, '371000', '威海市', '0631', '6310399');
INSERT INTO `t_sys_area` VALUES ('371083', '乳山市', 3, '371000', '威海市', '0631', '6310499');
INSERT INTO `t_sys_area` VALUES ('371100', '日照市', 2, '370000', '山东省', '0633', NULL);
INSERT INTO `t_sys_area` VALUES ('371102', '东港区', 3, '371100', '日照市', '0633', '6330199');
INSERT INTO `t_sys_area` VALUES ('371103', '岚山区', 3, '371100', '日照市', '0633', '6330299');
INSERT INTO `t_sys_area` VALUES ('371121', '五莲县', 3, '371100', '日照市', '0633', '6330399');
INSERT INTO `t_sys_area` VALUES ('371122', '莒县', 3, '371100', '日照市', '0633', '6330499');
INSERT INTO `t_sys_area` VALUES ('371200', '莱芜市', 2, '370000', '山东省', '0634', NULL);
INSERT INTO `t_sys_area` VALUES ('371202', '莱城区', 3, '371200', '莱芜市', '0634', '6340199');
INSERT INTO `t_sys_area` VALUES ('371203', '钢城区', 3, '371200', '莱芜市', '0634', '6340299');
INSERT INTO `t_sys_area` VALUES ('371300', '临沂市', 2, '370000', '山东省', '0539', NULL);
INSERT INTO `t_sys_area` VALUES ('371302', '兰山区', 3, '371300', '临沂市', '0539', '5390199');
INSERT INTO `t_sys_area` VALUES ('371311', '罗庄区', 3, '371300', '临沂市', '0539', '5390299');
INSERT INTO `t_sys_area` VALUES ('371312', '河东区', 3, '371300', '临沂市', '0539', '5390399');
INSERT INTO `t_sys_area` VALUES ('371321', '沂南县', 3, '371300', '临沂市', '0539', '5390499');
INSERT INTO `t_sys_area` VALUES ('371322', '郯城县', 3, '371300', '临沂市', '0539', '5390599');
INSERT INTO `t_sys_area` VALUES ('371323', '沂水县', 3, '371300', '临沂市', '0539', '5390699');
INSERT INTO `t_sys_area` VALUES ('371324', '兰陵县', 3, '371300', '临沂市', '0539', '5390799');
INSERT INTO `t_sys_area` VALUES ('371325', '费县', 3, '371300', '临沂市', '0539', '5390899');
INSERT INTO `t_sys_area` VALUES ('371326', '平邑县', 3, '371300', '临沂市', '0539', '5390999');
INSERT INTO `t_sys_area` VALUES ('371327', '莒南县', 3, '371300', '临沂市', '0539', '5391099');
INSERT INTO `t_sys_area` VALUES ('371328', '蒙阴县', 3, '371300', '临沂市', '0539', '5391199');
INSERT INTO `t_sys_area` VALUES ('371329', '临沭县', 3, '371300', '临沂市', '0539', '5391299');
INSERT INTO `t_sys_area` VALUES ('371400', '德州市', 2, '370000', '山东省', '0534', NULL);
INSERT INTO `t_sys_area` VALUES ('371402', '德城区', 3, '371400', '德州市', '0534', '5340199');
INSERT INTO `t_sys_area` VALUES ('371403', '陵城区', 3, '371400', '德州市', '0534', '5340299');
INSERT INTO `t_sys_area` VALUES ('371422', '宁津县', 3, '371400', '德州市', '0534', '5340399');
INSERT INTO `t_sys_area` VALUES ('371423', '庆云县', 3, '371400', '德州市', '0534', '5340499');
INSERT INTO `t_sys_area` VALUES ('371424', '临邑县', 3, '371400', '德州市', '0534', '5340599');
INSERT INTO `t_sys_area` VALUES ('371425', '齐河县', 3, '371400', '德州市', '0534', '5340699');
INSERT INTO `t_sys_area` VALUES ('371426', '平原县', 3, '371400', '德州市', '0534', '5340799');
INSERT INTO `t_sys_area` VALUES ('371427', '夏津县', 3, '371400', '德州市', '0534', '5340899');
INSERT INTO `t_sys_area` VALUES ('371428', '武城县', 3, '371400', '德州市', '0534', '5340999');
INSERT INTO `t_sys_area` VALUES ('371481', '乐陵市', 3, '371400', '德州市', '0534', '5341099');
INSERT INTO `t_sys_area` VALUES ('371482', '禹城市', 3, '371400', '德州市', '0534', '5341199');
INSERT INTO `t_sys_area` VALUES ('371500', '聊城市', 2, '370000', '山东省', '0635', NULL);
INSERT INTO `t_sys_area` VALUES ('371502', '东昌府区', 3, '371500', '聊城市', '0635', '6350199');
INSERT INTO `t_sys_area` VALUES ('371521', '阳谷县', 3, '371500', '聊城市', '0635', '6350299');
INSERT INTO `t_sys_area` VALUES ('371522', '莘县', 3, '371500', '聊城市', '0635', '6350399');
INSERT INTO `t_sys_area` VALUES ('371523', '茌平县', 3, '371500', '聊城市', '0635', '6350499');
INSERT INTO `t_sys_area` VALUES ('371524', '东阿县', 3, '371500', '聊城市', '0635', '6350599');
INSERT INTO `t_sys_area` VALUES ('371525', '冠县', 3, '371500', '聊城市', '0635', '6350699');
INSERT INTO `t_sys_area` VALUES ('371526', '高唐县', 3, '371500', '聊城市', '0635', '6350799');
INSERT INTO `t_sys_area` VALUES ('371581', '临清市', 3, '371500', '聊城市', '0635', '6350899');
INSERT INTO `t_sys_area` VALUES ('371600', '滨州市', 2, '370000', '山东省', '0543', NULL);
INSERT INTO `t_sys_area` VALUES ('371602', '滨城区', 3, '371600', '滨州市', '0543', '5430199');
INSERT INTO `t_sys_area` VALUES ('371603', '沾化区', 3, '371600', '滨州市', '0543', '5430599');
INSERT INTO `t_sys_area` VALUES ('371621', '惠民县', 3, '371600', '滨州市', '0543', '5430299');
INSERT INTO `t_sys_area` VALUES ('371622', '阳信县', 3, '371600', '滨州市', '0543', '5430399');
INSERT INTO `t_sys_area` VALUES ('371623', '无棣县', 3, '371600', '滨州市', '0543', '5430499');
INSERT INTO `t_sys_area` VALUES ('371625', '博兴县', 3, '371600', '滨州市', '0543', '5430699');
INSERT INTO `t_sys_area` VALUES ('371626', '邹平县', 3, '371600', '滨州市', '0543', '5430799');
INSERT INTO `t_sys_area` VALUES ('371700', '菏泽市', 2, '370000', '山东省', '0530', NULL);
INSERT INTO `t_sys_area` VALUES ('371702', '牡丹区', 3, '371700', '菏泽市', '0530', '5300199');
INSERT INTO `t_sys_area` VALUES ('371703', '定陶区', 3, '371700', '菏泽市', '0530', NULL);
INSERT INTO `t_sys_area` VALUES ('371721', '曹县', 3, '371700', '菏泽市', '0530', '5300299');
INSERT INTO `t_sys_area` VALUES ('371722', '单县', 3, '371700', '菏泽市', '0530', '5300399');
INSERT INTO `t_sys_area` VALUES ('371723', '成武县', 3, '371700', '菏泽市', '0530', '5300499');
INSERT INTO `t_sys_area` VALUES ('371724', '巨野县', 3, '371700', '菏泽市', '0530', '5300599');
INSERT INTO `t_sys_area` VALUES ('371725', '郓城县', 3, '371700', '菏泽市', '0530', '5300699');
INSERT INTO `t_sys_area` VALUES ('371726', '鄄城县', 3, '371700', '菏泽市', '0530', '5300799');
INSERT INTO `t_sys_area` VALUES ('371728', '东明县', 3, '371700', '菏泽市', '0530', '5300999');
INSERT INTO `t_sys_area` VALUES ('410000', '河南省', 1, '000000', '中华人民共和国', NULL, NULL);
INSERT INTO `t_sys_area` VALUES ('410100', '郑州市', 2, '410000', '河南省', '0371', NULL);
INSERT INTO `t_sys_area` VALUES ('410102', '中原区', 3, '410100', '郑州市', '0371', '3710199');
INSERT INTO `t_sys_area` VALUES ('410103', '二七区', 3, '410100', '郑州市', '0371', '3710299');
INSERT INTO `t_sys_area` VALUES ('410104', '管城回族区', 3, '410100', '郑州市', '0371', '3710399');
INSERT INTO `t_sys_area` VALUES ('410105', '金水区', 3, '410100', '郑州市', '0371', '3710499');
INSERT INTO `t_sys_area` VALUES ('410106', '上街区', 3, '410100', '郑州市', '0371', '3711299');
INSERT INTO `t_sys_area` VALUES ('410108', '惠济区', 3, '410100', '郑州市', '0371', '3710599');
INSERT INTO `t_sys_area` VALUES ('410122', '中牟县', 3, '410100', '郑州市', '0371', '3711199');
INSERT INTO `t_sys_area` VALUES ('410181', '巩义市', 3, '410100', '郑州市', '0371', '3710799');
INSERT INTO `t_sys_area` VALUES ('410182', '荥阳市', 3, '410100', '郑州市', '0371', '3710699');
INSERT INTO `t_sys_area` VALUES ('410183', '新密市', 3, '410100', '郑州市', '0371', '3710999');
INSERT INTO `t_sys_area` VALUES ('410184', '新郑市', 3, '410100', '郑州市', '0371', '3711099');
INSERT INTO `t_sys_area` VALUES ('410185', '登封市', 3, '410100', '郑州市', '0371', '3710899');
INSERT INTO `t_sys_area` VALUES ('410200', '开封市', 2, '410000', '河南省', '0378', NULL);
INSERT INTO `t_sys_area` VALUES ('410202', '龙亭区', 3, '410200', '开封市', '0378', '3780199');
INSERT INTO `t_sys_area` VALUES ('410203', '顺河回族区', 3, '410200', '开封市', '0378', '3780299');
INSERT INTO `t_sys_area` VALUES ('410204', '鼓楼区', 3, '410200', '开封市', '0378', '3780399');
INSERT INTO `t_sys_area` VALUES ('410205', '禹王台区', 3, '410200', '开封市', '0378', '3780499');
INSERT INTO `t_sys_area` VALUES ('410212', '祥符区', 3, '410200', '开封市', '0378', '3780999');
INSERT INTO `t_sys_area` VALUES ('410221', '杞县', 3, '410200', '开封市', '0378', '3780699');
INSERT INTO `t_sys_area` VALUES ('410222', '通许县', 3, '410200', '开封市', '0378', '3780799');
INSERT INTO `t_sys_area` VALUES ('410223', '尉氏县', 3, '410200', '开封市', '0378', '3780899');
INSERT INTO `t_sys_area` VALUES ('410225', '兰考县', 3, '410200', '开封市', '0378', '3781099');
INSERT INTO `t_sys_area` VALUES ('410300', '洛阳市', 2, '410000', '河南省', '0379', NULL);
INSERT INTO `t_sys_area` VALUES ('410302', '老城区', 3, '410300', '洛阳市', '0379', '3790199');
INSERT INTO `t_sys_area` VALUES ('410303', '西工区', 3, '410300', '洛阳市', '0379', '3790299');
INSERT INTO `t_sys_area` VALUES ('410304', '瀍河回族区', 3, '410300', '洛阳市', '0379', '3790399');
INSERT INTO `t_sys_area` VALUES ('410305', '涧西区', 3, '410300', '洛阳市', '0379', '3790499');
INSERT INTO `t_sys_area` VALUES ('410306', '吉利区', 3, '410300', '洛阳市', '0379', '3790599');
INSERT INTO `t_sys_area` VALUES ('410311', '洛龙区', 3, '410300', '洛阳市', '0379', '3790699');
INSERT INTO `t_sys_area` VALUES ('410322', '孟津县', 3, '410300', '洛阳市', '0379', '3790799');
INSERT INTO `t_sys_area` VALUES ('410323', '新安县', 3, '410300', '洛阳市', '0379', '3790899');
INSERT INTO `t_sys_area` VALUES ('410324', '栾川县', 3, '410300', '洛阳市', '0379', '3790999');
INSERT INTO `t_sys_area` VALUES ('410325', '嵩县', 3, '410300', '洛阳市', '0379', '3791099');
INSERT INTO `t_sys_area` VALUES ('410326', '汝阳县', 3, '410300', '洛阳市', '0379', '3791199');
INSERT INTO `t_sys_area` VALUES ('410327', '宜阳县', 3, '410300', '洛阳市', '0379', '3791299');
INSERT INTO `t_sys_area` VALUES ('410328', '洛宁县', 3, '410300', '洛阳市', '0379', '3791399');
INSERT INTO `t_sys_area` VALUES ('410329', '伊川县', 3, '410300', '洛阳市', '0379', '3791499');
INSERT INTO `t_sys_area` VALUES ('410381', '偃师市', 3, '410300', '洛阳市', '0379', '3791599');
INSERT INTO `t_sys_area` VALUES ('410400', '平顶山市', 2, '410000', '河南省', '0375', NULL);
INSERT INTO `t_sys_area` VALUES ('410402', '新华区', 3, '410400', '平顶山市', '0375', '3751199');
INSERT INTO `t_sys_area` VALUES ('410403', '卫东区', 3, '410400', '平顶山市', '0375', '3750299');
INSERT INTO `t_sys_area` VALUES ('410404', '石龙区', 3, '410400', '平顶山市', '0375', '3750399');
INSERT INTO `t_sys_area` VALUES ('410411', '湛河区', 3, '410400', '平顶山市', '0375', '3750499');
INSERT INTO `t_sys_area` VALUES ('410421', '宝丰县', 3, '410400', '平顶山市', '0375', '3750599');
INSERT INTO `t_sys_area` VALUES ('410422', '叶县', 3, '410400', '平顶山市', '0375', '3750699');
INSERT INTO `t_sys_area` VALUES ('410423', '鲁山县', 3, '410400', '平顶山市', '0375', '3750799');
INSERT INTO `t_sys_area` VALUES ('410425', '郏县', 3, '410400', '平顶山市', '0375', '3750899');
INSERT INTO `t_sys_area` VALUES ('410481', '舞钢市', 3, '410400', '平顶山市', '0375', '3750999');
INSERT INTO `t_sys_area` VALUES ('410482', '汝州市', 3, '410400', '平顶山市', '0375', '3751099');
INSERT INTO `t_sys_area` VALUES ('410500', '安阳市', 2, '410000', '河南省', '0372', NULL);
INSERT INTO `t_sys_area` VALUES ('410502', '文峰区', 3, '410500', '安阳市', '0372', '3720199');
INSERT INTO `t_sys_area` VALUES ('410503', '北关区', 3, '410500', '安阳市', '0372', '3720299');
INSERT INTO `t_sys_area` VALUES ('410505', '殷都区', 3, '410500', '安阳市', '0372', '3720399');
INSERT INTO `t_sys_area` VALUES ('410506', '龙安区', 3, '410500', '安阳市', '0372', '3720499');
INSERT INTO `t_sys_area` VALUES ('410522', '安阳县', 3, '410500', '安阳市', '0372', '3720599');
INSERT INTO `t_sys_area` VALUES ('410523', '汤阴县', 3, '410500', '安阳市', '0372', '3720699');
INSERT INTO `t_sys_area` VALUES ('410526', '滑县', 3, '410500', '安阳市', '0372', '3720799');
INSERT INTO `t_sys_area` VALUES ('410527', '内黄县', 3, '410500', '安阳市', '0372', '3720899');
INSERT INTO `t_sys_area` VALUES ('410581', '林州市', 3, '410500', '安阳市', '0372', '3720999');
INSERT INTO `t_sys_area` VALUES ('410600', '鹤壁市', 2, '410000', '河南省', '0392', NULL);
INSERT INTO `t_sys_area` VALUES ('410602', '鹤山区', 3, '410600', '鹤壁市', '0392', '3920199');
INSERT INTO `t_sys_area` VALUES ('410603', '山城区', 3, '410600', '鹤壁市', '0392', '3920299');
INSERT INTO `t_sys_area` VALUES ('410611', '淇滨区', 3, '410600', '鹤壁市', '0392', '3920399');
INSERT INTO `t_sys_area` VALUES ('410621', '浚县', 3, '410600', '鹤壁市', '0392', '3920499');
INSERT INTO `t_sys_area` VALUES ('410622', '淇县', 3, '410600', '鹤壁市', '0392', '3920599');
INSERT INTO `t_sys_area` VALUES ('410700', '新乡市', 2, '410000', '河南省', '0373', NULL);
INSERT INTO `t_sys_area` VALUES ('410702', '红旗区', 3, '410700', '新乡市', '0373', '3730199');
INSERT INTO `t_sys_area` VALUES ('410703', '卫滨区', 3, '410700', '新乡市', '0373', '3730299');
INSERT INTO `t_sys_area` VALUES ('410704', '凤泉区', 3, '410700', '新乡市', '0373', '3730399');
INSERT INTO `t_sys_area` VALUES ('410711', '牧野区', 3, '410700', '新乡市', '0373', '3730499');
INSERT INTO `t_sys_area` VALUES ('410721', '新乡县', 3, '410700', '新乡市', '0373', '3730599');
INSERT INTO `t_sys_area` VALUES ('410724', '获嘉县', 3, '410700', '新乡市', '0373', '3730699');
INSERT INTO `t_sys_area` VALUES ('410725', '原阳县', 3, '410700', '新乡市', '0373', '3730799');
INSERT INTO `t_sys_area` VALUES ('410726', '延津县', 3, '410700', '新乡市', '0373', '3730899');
INSERT INTO `t_sys_area` VALUES ('410727', '封丘县', 3, '410700', '新乡市', '0373', '3730999');
INSERT INTO `t_sys_area` VALUES ('410728', '长垣县', 3, '410700', '新乡市', '0373', '3731099');
INSERT INTO `t_sys_area` VALUES ('410781', '卫辉市', 3, '410700', '新乡市', '0373', '3731199');
INSERT INTO `t_sys_area` VALUES ('410782', '辉县市', 3, '410700', '新乡市', '0373', '3731299');
INSERT INTO `t_sys_area` VALUES ('410800', '焦作市', 2, '410000', '河南省', '0391', NULL);
INSERT INTO `t_sys_area` VALUES ('410802', '解放区', 3, '410800', '焦作市', '0391', '3910199');
INSERT INTO `t_sys_area` VALUES ('410803', '中站区', 3, '410800', '焦作市', '0391', '3910299');
INSERT INTO `t_sys_area` VALUES ('410804', '马村区', 3, '410800', '焦作市', '0391', '3910399');
INSERT INTO `t_sys_area` VALUES ('410811', '山阳区', 3, '410800', '焦作市', '0391', '3910499');
INSERT INTO `t_sys_area` VALUES ('410821', '修武县', 3, '410800', '焦作市', '0391', '3910599');
INSERT INTO `t_sys_area` VALUES ('410822', '博爱县', 3, '410800', '焦作市', '0391', '3910699');
INSERT INTO `t_sys_area` VALUES ('410823', '武陟县', 3, '410800', '焦作市', '0391', '3911199');
INSERT INTO `t_sys_area` VALUES ('410825', '温县', 3, '410800', '焦作市', '0391', '3910899');
INSERT INTO `t_sys_area` VALUES ('410882', '沁阳市', 3, '410800', '焦作市', '0391', '3910999');
INSERT INTO `t_sys_area` VALUES ('410883', '孟州市', 3, '410800', '焦作市', '0391', '3911099');
INSERT INTO `t_sys_area` VALUES ('410900', '濮阳市', 2, '410000', '河南省', '0393', NULL);
INSERT INTO `t_sys_area` VALUES ('410902', '华龙区', 3, '410900', '濮阳市', '0393', '3930199');
INSERT INTO `t_sys_area` VALUES ('410922', '清丰县', 3, '410900', '濮阳市', '0393', '3930299');
INSERT INTO `t_sys_area` VALUES ('410923', '南乐县', 3, '410900', '濮阳市', '0393', '3930399');
INSERT INTO `t_sys_area` VALUES ('410926', '范县', 3, '410900', '濮阳市', '0393', '3930499');
INSERT INTO `t_sys_area` VALUES ('410927', '台前县', 3, '410900', '濮阳市', '0393', '3930599');
INSERT INTO `t_sys_area` VALUES ('410928', '濮阳县', 3, '410900', '濮阳市', '0393', '3930699');
INSERT INTO `t_sys_area` VALUES ('411000', '许昌市', 2, '410000', '河南省', '0374', NULL);
INSERT INTO `t_sys_area` VALUES ('411002', '魏都区', 3, '411000', '许昌市', '0374', '3740199');
INSERT INTO `t_sys_area` VALUES ('411003', '建安区', 3, '411000', '许昌市', '0374', NULL);
INSERT INTO `t_sys_area` VALUES ('411024', '鄢陵县', 3, '411000', '许昌市', '0374', '3740399');
INSERT INTO `t_sys_area` VALUES ('411025', '襄城县', 3, '411000', '许昌市', '0374', '3740499');
INSERT INTO `t_sys_area` VALUES ('411081', '禹州市', 3, '411000', '许昌市', '0374', '3740599');
INSERT INTO `t_sys_area` VALUES ('411082', '长葛市', 3, '411000', '许昌市', '0374', '3740699');
INSERT INTO `t_sys_area` VALUES ('411100', '漯河市', 2, '410000', '河南省', '0395', NULL);
INSERT INTO `t_sys_area` VALUES ('411102', '源汇区', 3, '411100', '漯河市', '0395', '3950199');
INSERT INTO `t_sys_area` VALUES ('411103', '郾城区', 3, '411100', '漯河市', '0395', '3950299');
INSERT INTO `t_sys_area` VALUES ('411104', '召陵区', 3, '411100', '漯河市', '0395', '3950399');
INSERT INTO `t_sys_area` VALUES ('411121', '舞阳县', 3, '411100', '漯河市', '0395', '3950499');
INSERT INTO `t_sys_area` VALUES ('411122', '临颍县', 3, '411100', '漯河市', '0395', '3950599');
INSERT INTO `t_sys_area` VALUES ('411200', '三门峡市', 2, '410000', '河南省', '0398', NULL);
INSERT INTO `t_sys_area` VALUES ('411202', '湖滨区', 3, '411200', '三门峡市', '0398', '3980199');
INSERT INTO `t_sys_area` VALUES ('411203', '陕州区', 3, '411200', '三门峡市', '0398', '3980399');
INSERT INTO `t_sys_area` VALUES ('411221', '渑池县', 3, '411200', '三门峡市', '0398', '3980299');
INSERT INTO `t_sys_area` VALUES ('411224', '卢氏县', 3, '411200', '三门峡市', '0398', '3980499');
INSERT INTO `t_sys_area` VALUES ('411281', '义马市', 3, '411200', '三门峡市', '0398', '3980599');
INSERT INTO `t_sys_area` VALUES ('411282', '灵宝市', 3, '411200', '三门峡市', '0398', '3980699');
INSERT INTO `t_sys_area` VALUES ('411300', '南阳市', 2, '410000', '河南省', '0377', NULL);
INSERT INTO `t_sys_area` VALUES ('411302', '宛城区', 3, '411300', '南阳市', '0377', '3770199');
INSERT INTO `t_sys_area` VALUES ('411303', '卧龙区', 3, '411300', '南阳市', '0377', '3770299');
INSERT INTO `t_sys_area` VALUES ('411321', '南召县', 3, '411300', '南阳市', '0377', '3770399');
INSERT INTO `t_sys_area` VALUES ('411322', '方城县', 3, '411300', '南阳市', '0377', '3770499');
INSERT INTO `t_sys_area` VALUES ('411323', '西峡县', 3, '411300', '南阳市', '0377', '3770599');
INSERT INTO `t_sys_area` VALUES ('411324', '镇平县', 3, '411300', '南阳市', '0377', '3770699');
INSERT INTO `t_sys_area` VALUES ('411325', '内乡县', 3, '411300', '南阳市', '0377', '3770799');
INSERT INTO `t_sys_area` VALUES ('411326', '淅川县', 3, '411300', '南阳市', '0377', '3770899');
INSERT INTO `t_sys_area` VALUES ('411327', '社旗县', 3, '411300', '南阳市', '0377', '3770999');
INSERT INTO `t_sys_area` VALUES ('411328', '唐河县', 3, '411300', '南阳市', '0377', '3771099');
INSERT INTO `t_sys_area` VALUES ('411329', '新野县', 3, '411300', '南阳市', '0377', '3771199');
INSERT INTO `t_sys_area` VALUES ('411330', '桐柏县', 3, '411300', '南阳市', '0377', NULL);
INSERT INTO `t_sys_area` VALUES ('411381', '邓州市', 3, '411300', '南阳市', '0377', '3771299');
INSERT INTO `t_sys_area` VALUES ('411400', '商丘市', 2, '410000', '河南省', '0370', NULL);
INSERT INTO `t_sys_area` VALUES ('411402', '梁园区', 3, '411400', '商丘市', '0370', '3700199');
INSERT INTO `t_sys_area` VALUES ('411403', '睢阳区', 3, '411400', '商丘市', '0370', '3700299');
INSERT INTO `t_sys_area` VALUES ('411421', '民权县', 3, '411400', '商丘市', '0370', '3700399');
INSERT INTO `t_sys_area` VALUES ('411422', '睢县', 3, '411400', '商丘市', '0370', '3700499');
INSERT INTO `t_sys_area` VALUES ('411423', '宁陵县', 3, '411400', '商丘市', '0370', '3700599');
INSERT INTO `t_sys_area` VALUES ('411424', '柘城县', 3, '411400', '商丘市', '0370', '3700699');
INSERT INTO `t_sys_area` VALUES ('411425', '虞城县', 3, '411400', '商丘市', '0370', '3700799');
INSERT INTO `t_sys_area` VALUES ('411426', '夏邑县', 3, '411400', '商丘市', '0370', '3700899');
INSERT INTO `t_sys_area` VALUES ('411481', '永城市', 3, '411400', '商丘市', '0370', '3700999');
INSERT INTO `t_sys_area` VALUES ('411500', '信阳市', 2, '410000', '河南省', '0376', NULL);
INSERT INTO `t_sys_area` VALUES ('411502', '浉河区', 3, '411500', '信阳市', '0376', '3760199');
INSERT INTO `t_sys_area` VALUES ('411503', '平桥区', 3, '411500', '信阳市', '0376', '3760299');
INSERT INTO `t_sys_area` VALUES ('411521', '罗山县', 3, '411500', '信阳市', '0376', '3760399');
INSERT INTO `t_sys_area` VALUES ('411522', '光山县', 3, '411500', '信阳市', '0376', '3760499');
INSERT INTO `t_sys_area` VALUES ('411523', '新县', 3, '411500', '信阳市', '0376', '3760599');
INSERT INTO `t_sys_area` VALUES ('411524', '商城县', 3, '411500', '信阳市', '0376', '3760699');
INSERT INTO `t_sys_area` VALUES ('411525', '固始县', 3, '411500', '信阳市', '0376', '3760799');
INSERT INTO `t_sys_area` VALUES ('411526', '潢川县', 3, '411500', '信阳市', '0376', '3760899');
INSERT INTO `t_sys_area` VALUES ('411527', '淮滨县', 3, '411500', '信阳市', '0376', '3760999');
INSERT INTO `t_sys_area` VALUES ('411528', '息县', 3, '411500', '信阳市', '0376', '3761099');
INSERT INTO `t_sys_area` VALUES ('411600', '周口市', 2, '410000', '河南省', '0394', NULL);
INSERT INTO `t_sys_area` VALUES ('411602', '川汇区', 3, '411600', '周口市', '0394', '3940199');
INSERT INTO `t_sys_area` VALUES ('411621', '扶沟县', 3, '411600', '周口市', '0394', '3940299');
INSERT INTO `t_sys_area` VALUES ('411622', '西华县', 3, '411600', '周口市', '0394', '3940399');
INSERT INTO `t_sys_area` VALUES ('411623', '商水县', 3, '411600', '周口市', '0394', '3940499');
INSERT INTO `t_sys_area` VALUES ('411624', '沈丘县', 3, '411600', '周口市', '0394', '3940599');
INSERT INTO `t_sys_area` VALUES ('411625', '郸城县', 3, '411600', '周口市', '0394', '3940699');
INSERT INTO `t_sys_area` VALUES ('411626', '淮阳县', 3, '411600', '周口市', '0394', '3940799');
INSERT INTO `t_sys_area` VALUES ('411627', '太康县', 3, '411600', '周口市', '0394', '3940899');
INSERT INTO `t_sys_area` VALUES ('411628', '鹿邑县', 3, '411600', '周口市', '0394', '3940999');
INSERT INTO `t_sys_area` VALUES ('411681', '项城市', 3, '411600', '周口市', '0394', '3941099');
INSERT INTO `t_sys_area` VALUES ('411700', '驻马店市', 2, '410000', '河南省', '0396', NULL);
INSERT INTO `t_sys_area` VALUES ('411702', '驿城区', 3, '411700', '驻马店市', '0396', '3960199');
INSERT INTO `t_sys_area` VALUES ('411721', '西平县', 3, '411700', '驻马店市', '0396', '3960299');
INSERT INTO `t_sys_area` VALUES ('411722', '上蔡县', 3, '411700', '驻马店市', '0396', '3960399');
INSERT INTO `t_sys_area` VALUES ('411723', '平舆县', 3, '411700', '驻马店市', '0396', '3960499');
INSERT INTO `t_sys_area` VALUES ('411724', '正阳县', 3, '411700', '驻马店市', '0396', '3960599');
INSERT INTO `t_sys_area` VALUES ('411725', '确山县', 3, '411700', '驻马店市', '0396', '3960699');
INSERT INTO `t_sys_area` VALUES ('411726', '泌阳县', 3, '411700', '驻马店市', '0396', '3960799');
INSERT INTO `t_sys_area` VALUES ('411727', '汝南县', 3, '411700', '驻马店市', '0396', '3960899');
INSERT INTO `t_sys_area` VALUES ('411728', '遂平县', 3, '411700', '驻马店市', '0396', '3960999');
INSERT INTO `t_sys_area` VALUES ('411729', '新蔡县', 3, '411700', '驻马店市', '0396', '3961099');
INSERT INTO `t_sys_area` VALUES ('419001', '济源市', 2, '410000', '河南省', '1391', '3990199');
INSERT INTO `t_sys_area` VALUES ('420000', '湖北省', 1, '000000', '中华人民共和国', NULL, NULL);
INSERT INTO `t_sys_area` VALUES ('420100', '武汉市', 2, '420000', '湖北省', '027', NULL);
INSERT INTO `t_sys_area` VALUES ('420102', '江岸区', 3, '420100', '武汉市', '027', '0270199');
INSERT INTO `t_sys_area` VALUES ('420103', '江汉区', 3, '420100', '武汉市', '027', '0270299');
INSERT INTO `t_sys_area` VALUES ('420104', '硚口区', 3, '420100', '武汉市', '027', '0270399');
INSERT INTO `t_sys_area` VALUES ('420105', '汉阳区', 3, '420100', '武汉市', '027', '0270499');
INSERT INTO `t_sys_area` VALUES ('420106', '武昌区', 3, '420100', '武汉市', '027', '0270599');
INSERT INTO `t_sys_area` VALUES ('420107', '青山区', 3, '420100', '武汉市', '027', '0270699');
INSERT INTO `t_sys_area` VALUES ('420111', '洪山区', 3, '420100', '武汉市', '027', '0270799');
INSERT INTO `t_sys_area` VALUES ('420112', '东西湖区', 3, '420100', '武汉市', '027', '0270899');
INSERT INTO `t_sys_area` VALUES ('420113', '汉南区', 3, '420100', '武汉市', '027', '0270999');
INSERT INTO `t_sys_area` VALUES ('420114', '蔡甸区', 3, '420100', '武汉市', '027', '0271099');
INSERT INTO `t_sys_area` VALUES ('420115', '江夏区', 3, '420100', '武汉市', '027', '0271199');
INSERT INTO `t_sys_area` VALUES ('420116', '黄陂区', 3, '420100', '武汉市', '027', '0271299');
INSERT INTO `t_sys_area` VALUES ('420117', '新洲区', 3, '420100', '武汉市', '027', '0271399');
INSERT INTO `t_sys_area` VALUES ('420200', '黄石市', 2, '420000', '湖北省', '0714', NULL);
INSERT INTO `t_sys_area` VALUES ('420202', '黄石港区', 3, '420200', '黄石市', '0714', '7140199');
INSERT INTO `t_sys_area` VALUES ('420203', '西塞山区', 3, '420200', '黄石市', '0714', '7140299');
INSERT INTO `t_sys_area` VALUES ('420204', '下陆区', 3, '420200', '黄石市', '0714', '7140399');
INSERT INTO `t_sys_area` VALUES ('420205', '铁山区', 3, '420200', '黄石市', '0714', '7140499');
INSERT INTO `t_sys_area` VALUES ('420222', '阳新县', 3, '420200', '黄石市', '0714', '7140599');
INSERT INTO `t_sys_area` VALUES ('420281', '大冶市', 3, '420200', '黄石市', '0714', '7140699');
INSERT INTO `t_sys_area` VALUES ('420300', '十堰市', 2, '420000', '湖北省', '0719', NULL);
INSERT INTO `t_sys_area` VALUES ('420302', '茅箭区', 3, '420300', '十堰市', '0719', '7190199');
INSERT INTO `t_sys_area` VALUES ('420303', '张湾区', 3, '420300', '十堰市', '0719', '7190299');
INSERT INTO `t_sys_area` VALUES ('420304', '郧阳区', 3, '420300', '十堰市', '0719', '7190399');
INSERT INTO `t_sys_area` VALUES ('420322', '郧西县', 3, '420300', '十堰市', '0719', '7190499');
INSERT INTO `t_sys_area` VALUES ('420323', '竹山县', 3, '420300', '十堰市', '0719', '7190599');
INSERT INTO `t_sys_area` VALUES ('420324', '竹溪县', 3, '420300', '十堰市', '0719', '7190699');
INSERT INTO `t_sys_area` VALUES ('420325', '房县', 3, '420300', '十堰市', '0719', '7190799');
INSERT INTO `t_sys_area` VALUES ('420381', '丹江口市', 3, '420300', '十堰市', '0719', '7190899');
INSERT INTO `t_sys_area` VALUES ('420500', '宜昌市', 2, '420000', '湖北省', '0717', NULL);
INSERT INTO `t_sys_area` VALUES ('420502', '西陵区', 3, '420500', '宜昌市', '0717', '7170199');
INSERT INTO `t_sys_area` VALUES ('420503', '伍家岗区', 3, '420500', '宜昌市', '0717', '7170299');
INSERT INTO `t_sys_area` VALUES ('420504', '点军区', 3, '420500', '宜昌市', '0717', '7170399');
INSERT INTO `t_sys_area` VALUES ('420505', '猇亭区', 3, '420500', '宜昌市', '0717', '7170499');
INSERT INTO `t_sys_area` VALUES ('420506', '夷陵区', 3, '420500', '宜昌市', '0717', '7170599');
INSERT INTO `t_sys_area` VALUES ('420525', '远安县', 3, '420500', '宜昌市', '0717', '7170699');
INSERT INTO `t_sys_area` VALUES ('420526', '兴山县', 3, '420500', '宜昌市', '0717', '7170799');
INSERT INTO `t_sys_area` VALUES ('420527', '秭归县', 3, '420500', '宜昌市', '0717', '7170899');
INSERT INTO `t_sys_area` VALUES ('420528', '长阳土家族自治县', 3, '420500', '宜昌市', '0717', '7170999');
INSERT INTO `t_sys_area` VALUES ('420529', '五峰土家族自治县', 3, '420500', '宜昌市', '0717', '7171099');
INSERT INTO `t_sys_area` VALUES ('420581', '宜都市', 3, '420500', '宜昌市', '0717', '7171199');
INSERT INTO `t_sys_area` VALUES ('420582', '当阳市', 3, '420500', '宜昌市', '0717', '7171299');
INSERT INTO `t_sys_area` VALUES ('420583', '枝江市', 3, '420500', '宜昌市', '0717', '7171399');
INSERT INTO `t_sys_area` VALUES ('420600', '襄阳市', 2, '420000', '湖北省', '0710', NULL);
INSERT INTO `t_sys_area` VALUES ('420602', '襄城区', 3, '420600', '襄阳市', '0710', '7100399');
INSERT INTO `t_sys_area` VALUES ('420606', '樊城区', 3, '420600', '襄阳市', '0710', '7100299');
INSERT INTO `t_sys_area` VALUES ('420607', '襄州区', 3, '420600', '襄阳市', '0710', NULL);
INSERT INTO `t_sys_area` VALUES ('420624', '南漳县', 3, '420600', '襄阳市', '0710', '7100499');
INSERT INTO `t_sys_area` VALUES ('420625', '谷城县', 3, '420600', '襄阳市', '0710', '7100599');
INSERT INTO `t_sys_area` VALUES ('420626', '保康县', 3, '420600', '襄阳市', '0710', '7100699');
INSERT INTO `t_sys_area` VALUES ('420682', '老河口市', 3, '420600', '襄阳市', '0710', '7100799');
INSERT INTO `t_sys_area` VALUES ('420683', '枣阳市', 3, '420600', '襄阳市', '0710', '7100899');
INSERT INTO `t_sys_area` VALUES ('420684', '宜城市', 3, '420600', '襄阳市', '0710', '7100999');
INSERT INTO `t_sys_area` VALUES ('420700', '鄂州市', 2, '420000', '湖北省', '0711', NULL);
INSERT INTO `t_sys_area` VALUES ('420702', '梁子湖区', 3, '420700', '鄂州市', '0711', '7110199');
INSERT INTO `t_sys_area` VALUES ('420703', '华容区', 3, '420700', '鄂州市', '0711', '7110299');
INSERT INTO `t_sys_area` VALUES ('420704', '鄂城区', 3, '420700', '鄂州市', '0711', '7110399');
INSERT INTO `t_sys_area` VALUES ('420800', '荆门市', 2, '420000', '湖北省', '0724', NULL);
INSERT INTO `t_sys_area` VALUES ('420802', '东宝区', 3, '420800', '荆门市', '0724', '7240199');
INSERT INTO `t_sys_area` VALUES ('420804', '掇刀区', 3, '420800', '荆门市', '0724', '7240299');
INSERT INTO `t_sys_area` VALUES ('420821', '京山县', 3, '420800', '荆门市', '0724', '7240399');
INSERT INTO `t_sys_area` VALUES ('420822', '沙洋县', 3, '420800', '荆门市', '0724', '7240499');
INSERT INTO `t_sys_area` VALUES ('420881', '钟祥市', 3, '420800', '荆门市', '0724', '7240599');
INSERT INTO `t_sys_area` VALUES ('420900', '孝感市', 2, '420000', '湖北省', '0712', NULL);
INSERT INTO `t_sys_area` VALUES ('420902', '孝南区', 3, '420900', '孝感市', '0712', '7120199');
INSERT INTO `t_sys_area` VALUES ('420921', '孝昌县', 3, '420900', '孝感市', '0712', '7120299');
INSERT INTO `t_sys_area` VALUES ('420922', '大悟县', 3, '420900', '孝感市', '0712', '7120399');
INSERT INTO `t_sys_area` VALUES ('420923', '云梦县', 3, '420900', '孝感市', '0712', '7120499');
INSERT INTO `t_sys_area` VALUES ('420981', '应城市', 3, '420900', '孝感市', '0712', '7120599');
INSERT INTO `t_sys_area` VALUES ('420982', '安陆市', 3, '420900', '孝感市', '0712', '7120699');
INSERT INTO `t_sys_area` VALUES ('420984', '汉川市', 3, '420900', '孝感市', '0712', '7120799');
INSERT INTO `t_sys_area` VALUES ('421000', '荆州市', 2, '420000', '湖北省', '0716', NULL);
INSERT INTO `t_sys_area` VALUES ('421002', '沙市区', 3, '421000', '荆州市', '0716', '7160199');
INSERT INTO `t_sys_area` VALUES ('421003', '荆州区', 3, '421000', '荆州市', '0716', '7160299');
INSERT INTO `t_sys_area` VALUES ('421022', '公安县', 3, '421000', '荆州市', '0716', '7160399');
INSERT INTO `t_sys_area` VALUES ('421023', '监利县', 3, '421000', '荆州市', '0716', '7160499');
INSERT INTO `t_sys_area` VALUES ('421024', '江陵县', 3, '421000', '荆州市', '0716', '7160599');
INSERT INTO `t_sys_area` VALUES ('421081', '石首市', 3, '421000', '荆州市', '0716', '7160699');
INSERT INTO `t_sys_area` VALUES ('421083', '洪湖市', 3, '421000', '荆州市', '0716', '7160799');
INSERT INTO `t_sys_area` VALUES ('421087', '松滋市', 3, '421000', '荆州市', '0716', '7160899');
INSERT INTO `t_sys_area` VALUES ('421100', '黄冈市', 2, '420000', '湖北省', '0713', NULL);
INSERT INTO `t_sys_area` VALUES ('421102', '黄州区', 3, '421100', '黄冈市', '0713', '7130199');
INSERT INTO `t_sys_area` VALUES ('421121', '团风县', 3, '421100', '黄冈市', '0713', '7130299');
INSERT INTO `t_sys_area` VALUES ('421122', '红安县', 3, '421100', '黄冈市', '0713', '7130399');
INSERT INTO `t_sys_area` VALUES ('421123', '罗田县', 3, '421100', '黄冈市', '0713', '7130499');
INSERT INTO `t_sys_area` VALUES ('421124', '英山县', 3, '421100', '黄冈市', '0713', '7130599');
INSERT INTO `t_sys_area` VALUES ('421125', '浠水县', 3, '421100', '黄冈市', '0713', '7130699');
INSERT INTO `t_sys_area` VALUES ('421126', '蕲春县', 3, '421100', '黄冈市', '0713', '7130799');
INSERT INTO `t_sys_area` VALUES ('421127', '黄梅县', 3, '421100', '黄冈市', '0713', '7130899');
INSERT INTO `t_sys_area` VALUES ('421181', '麻城市', 3, '421100', '黄冈市', '0713', '7130999');
INSERT INTO `t_sys_area` VALUES ('421182', '武穴市', 3, '421100', '黄冈市', '0713', '7131099');
INSERT INTO `t_sys_area` VALUES ('421200', '咸宁市', 2, '420000', '湖北省', '0715', NULL);
INSERT INTO `t_sys_area` VALUES ('421202', '咸安区', 3, '421200', '咸宁市', '0715', '7150199');
INSERT INTO `t_sys_area` VALUES ('421221', '嘉鱼县', 3, '421200', '咸宁市', '0715', '7150299');
INSERT INTO `t_sys_area` VALUES ('421222', '通城县', 3, '421200', '咸宁市', '0715', '7150399');
INSERT INTO `t_sys_area` VALUES ('421223', '崇阳县', 3, '421200', '咸宁市', '0715', '7150499');
INSERT INTO `t_sys_area` VALUES ('421224', '通山县', 3, '421200', '咸宁市', '0715', '7150599');
INSERT INTO `t_sys_area` VALUES ('421281', '赤壁市', 3, '421200', '咸宁市', '0715', '7150699');
INSERT INTO `t_sys_area` VALUES ('421300', '随州市', 2, '420000', '湖北省', '0722', NULL);
INSERT INTO `t_sys_area` VALUES ('421303', '曾都区', 3, '421300', '随州市', '0722', '7220199');
INSERT INTO `t_sys_area` VALUES ('421321', '随县', 3, '421300', '随州市', '0722', NULL);
INSERT INTO `t_sys_area` VALUES ('421381', '广水市', 3, '421300', '随州市', '0722', '7220299');
INSERT INTO `t_sys_area` VALUES ('422800', '恩施土家族苗族自治州', 2, '420000', '湖北省', '0718', NULL);
INSERT INTO `t_sys_area` VALUES ('422801', '恩施市', 3, '422800', '恩施土家族苗族自治州', '0718', '7180199');
INSERT INTO `t_sys_area` VALUES ('422802', '利川市', 3, '422800', '恩施土家族苗族自治州', '0718', '7180299');
INSERT INTO `t_sys_area` VALUES ('422822', '建始县', 3, '422800', '恩施土家族苗族自治州', '0718', '7180399');
INSERT INTO `t_sys_area` VALUES ('422823', '巴东县', 3, '422800', '恩施土家族苗族自治州', '0718', '7180499');
INSERT INTO `t_sys_area` VALUES ('422825', '宣恩县', 3, '422800', '恩施土家族苗族自治州', '0718', '7180599');
INSERT INTO `t_sys_area` VALUES ('422826', '咸丰县', 3, '422800', '恩施土家族苗族自治州', '0718', '7180699');
INSERT INTO `t_sys_area` VALUES ('422827', '来凤县', 3, '422800', '恩施土家族苗族自治州', '0718', '7180799');
INSERT INTO `t_sys_area` VALUES ('422828', '鹤峰县', 3, '422800', '恩施土家族苗族自治州', '0718', '7180899');
INSERT INTO `t_sys_area` VALUES ('429004', '仙桃市', 2, '420000', '湖北省', '0728', '7280199');
INSERT INTO `t_sys_area` VALUES ('429005', '潜江市', 2, '420000', '湖北省', '2728', '7280299');
INSERT INTO `t_sys_area` VALUES ('429006', '天门市', 2, '420000', '湖北省', '1728', '7280399');
INSERT INTO `t_sys_area` VALUES ('429021', '神农架林区', 2, '420000', '湖北省', '1719', '7200199');
INSERT INTO `t_sys_area` VALUES ('430000', '湖南省', 1, '000000', '中华人民共和国', NULL, NULL);
INSERT INTO `t_sys_area` VALUES ('430100', '长沙市', 2, '430000', '湖南省', '0731', NULL);
INSERT INTO `t_sys_area` VALUES ('430102', '芙蓉区', 3, '430100', '长沙市', '0731', '7310199');
INSERT INTO `t_sys_area` VALUES ('430103', '天心区', 3, '430100', '长沙市', '0731', '7310299');
INSERT INTO `t_sys_area` VALUES ('430104', '岳麓区', 3, '430100', '长沙市', '0731', '7310399');
INSERT INTO `t_sys_area` VALUES ('430105', '开福区', 3, '430100', '长沙市', '0731', '7310499');
INSERT INTO `t_sys_area` VALUES ('430111', '雨花区', 3, '430100', '长沙市', '0731', '7310599');
INSERT INTO `t_sys_area` VALUES ('430112', '望城区', 3, '430100', '长沙市', '0731', '7310799');
INSERT INTO `t_sys_area` VALUES ('430121', '长沙县', 3, '430100', '长沙市', '0731', '7310699');
INSERT INTO `t_sys_area` VALUES ('430124', '宁乡市', 3, '430100', '长沙市', '0731', '7310899');
INSERT INTO `t_sys_area` VALUES ('430181', '浏阳市', 3, '430100', '长沙市', '0731', '7310999');
INSERT INTO `t_sys_area` VALUES ('430200', '株洲市', 2, '430000', '湖南省', '0733', NULL);
INSERT INTO `t_sys_area` VALUES ('430202', '荷塘区', 3, '430200', '株洲市', '0733', '7330199');
INSERT INTO `t_sys_area` VALUES ('430203', '芦淞区', 3, '430200', '株洲市', '0733', '7330299');
INSERT INTO `t_sys_area` VALUES ('430204', '石峰区', 3, '430200', '株洲市', '0733', '7330399');
INSERT INTO `t_sys_area` VALUES ('430211', '天元区', 3, '430200', '株洲市', '0733', '7330499');
INSERT INTO `t_sys_area` VALUES ('430221', '株洲县', 3, '430200', '株洲市', '0733', '7330599');
INSERT INTO `t_sys_area` VALUES ('430223', '攸县', 3, '430200', '株洲市', '0733', '7330699');
INSERT INTO `t_sys_area` VALUES ('430224', '茶陵县', 3, '430200', '株洲市', '0733', '7330799');
INSERT INTO `t_sys_area` VALUES ('430225', '炎陵县', 3, '430200', '株洲市', '0733', '7330899');
INSERT INTO `t_sys_area` VALUES ('430281', '醴陵市', 3, '430200', '株洲市', '0733', '7330999');
INSERT INTO `t_sys_area` VALUES ('430300', '湘潭市', 2, '430000', '湖南省', '0732', NULL);
INSERT INTO `t_sys_area` VALUES ('430302', '雨湖区', 3, '430300', '湘潭市', '0732', '7320199');
INSERT INTO `t_sys_area` VALUES ('430304', '岳塘区', 3, '430300', '湘潭市', '0732', '7320299');
INSERT INTO `t_sys_area` VALUES ('430321', '湘潭县', 3, '430300', '湘潭市', '0732', '7320399');
INSERT INTO `t_sys_area` VALUES ('430381', '湘乡市', 3, '430300', '湘潭市', '0732', '7320499');
INSERT INTO `t_sys_area` VALUES ('430382', '韶山市', 3, '430300', '湘潭市', '0732', '7320599');
INSERT INTO `t_sys_area` VALUES ('430400', '衡阳市', 2, '430000', '湖南省', '0734', NULL);
INSERT INTO `t_sys_area` VALUES ('430405', '珠晖区', 3, '430400', '衡阳市', '0734', '7340199');
INSERT INTO `t_sys_area` VALUES ('430406', '雁峰区', 3, '430400', '衡阳市', '0734', '7340299');
INSERT INTO `t_sys_area` VALUES ('430407', '石鼓区', 3, '430400', '衡阳市', '0734', '7340399');
INSERT INTO `t_sys_area` VALUES ('430408', '蒸湘区', 3, '430400', '衡阳市', '0734', '7340499');
INSERT INTO `t_sys_area` VALUES ('430412', '南岳区', 3, '430400', '衡阳市', '0734', '7340599');
INSERT INTO `t_sys_area` VALUES ('430421', '衡阳县', 3, '430400', '衡阳市', '0734', '7340699');
INSERT INTO `t_sys_area` VALUES ('430422', '衡南县', 3, '430400', '衡阳市', '0734', '7340799');
INSERT INTO `t_sys_area` VALUES ('430423', '衡山县', 3, '430400', '衡阳市', '0734', '7340899');
INSERT INTO `t_sys_area` VALUES ('430424', '衡东县', 3, '430400', '衡阳市', '0734', '7340999');
INSERT INTO `t_sys_area` VALUES ('430426', '祁东县', 3, '430400', '衡阳市', '0734', '7341099');
INSERT INTO `t_sys_area` VALUES ('430481', '耒阳市', 3, '430400', '衡阳市', '0734', '7341199');
INSERT INTO `t_sys_area` VALUES ('430482', '常宁市', 3, '430400', '衡阳市', '0734', '7341299');
INSERT INTO `t_sys_area` VALUES ('430500', '邵阳市', 2, '430000', '湖南省', '0739', NULL);
INSERT INTO `t_sys_area` VALUES ('430502', '双清区', 3, '430500', '邵阳市', '0739', '7390199');
INSERT INTO `t_sys_area` VALUES ('430503', '大祥区', 3, '430500', '邵阳市', '0739', '7390299');
INSERT INTO `t_sys_area` VALUES ('430511', '北塔区', 3, '430500', '邵阳市', '0739', '7390399');
INSERT INTO `t_sys_area` VALUES ('430521', '邵东县', 3, '430500', '邵阳市', '0739', '7390499');
INSERT INTO `t_sys_area` VALUES ('430522', '新邵县', 3, '430500', '邵阳市', '0739', '7390599');
INSERT INTO `t_sys_area` VALUES ('430523', '邵阳县', 3, '430500', '邵阳市', '0739', '7390699');
INSERT INTO `t_sys_area` VALUES ('430524', '隆回县', 3, '430500', '邵阳市', '0739', '7390799');
INSERT INTO `t_sys_area` VALUES ('430525', '洞口县', 3, '430500', '邵阳市', '0739', '7390899');
INSERT INTO `t_sys_area` VALUES ('430527', '绥宁县', 3, '430500', '邵阳市', '0739', '7390999');
INSERT INTO `t_sys_area` VALUES ('430528', '新宁县', 3, '430500', '邵阳市', '0739', '7391099');
INSERT INTO `t_sys_area` VALUES ('430529', '城步苗族自治县', 3, '430500', '邵阳市', '0739', '7391199');
INSERT INTO `t_sys_area` VALUES ('430581', '武冈市', 3, '430500', '邵阳市', '0739', '7391299');
INSERT INTO `t_sys_area` VALUES ('430600', '岳阳市', 2, '430000', '湖南省', '0730', NULL);
INSERT INTO `t_sys_area` VALUES ('430602', '岳阳楼区', 3, '430600', '岳阳市', '0730', '7300199');
INSERT INTO `t_sys_area` VALUES ('430603', '云溪区', 3, '430600', '岳阳市', '0730', '7300299');
INSERT INTO `t_sys_area` VALUES ('430611', '君山区', 3, '430600', '岳阳市', '0730', '7300399');
INSERT INTO `t_sys_area` VALUES ('430621', '岳阳县', 3, '430600', '岳阳市', '0730', '7300499');
INSERT INTO `t_sys_area` VALUES ('430623', '华容县', 3, '430600', '岳阳市', '0730', '7300599');
INSERT INTO `t_sys_area` VALUES ('430624', '湘阴县', 3, '430600', '岳阳市', '0730', '7300699');
INSERT INTO `t_sys_area` VALUES ('430626', '平江县', 3, '430600', '岳阳市', '0730', '7300799');
INSERT INTO `t_sys_area` VALUES ('430681', '汨罗市', 3, '430600', '岳阳市', '0730', '7300899');
INSERT INTO `t_sys_area` VALUES ('430682', '临湘市', 3, '430600', '岳阳市', '0730', '7300999');
INSERT INTO `t_sys_area` VALUES ('430700', '常德市', 2, '430000', '湖南省', '0736', NULL);
INSERT INTO `t_sys_area` VALUES ('430702', '武陵区', 3, '430700', '常德市', '0736', '7360199');
INSERT INTO `t_sys_area` VALUES ('430703', '鼎城区', 3, '430700', '常德市', '0736', '7360299');
INSERT INTO `t_sys_area` VALUES ('430721', '安乡县', 3, '430700', '常德市', '0736', '7360399');
INSERT INTO `t_sys_area` VALUES ('430722', '汉寿县', 3, '430700', '常德市', '0736', '7360499');
INSERT INTO `t_sys_area` VALUES ('430723', '澧县', 3, '430700', '常德市', '0736', '7360599');
INSERT INTO `t_sys_area` VALUES ('430724', '临澧县', 3, '430700', '常德市', '0736', '7360699');
INSERT INTO `t_sys_area` VALUES ('430725', '桃源县', 3, '430700', '常德市', '0736', '7360799');
INSERT INTO `t_sys_area` VALUES ('430726', '石门县', 3, '430700', '常德市', '0736', '7360899');
INSERT INTO `t_sys_area` VALUES ('430781', '津市市', 3, '430700', '常德市', '0736', '7360999');
INSERT INTO `t_sys_area` VALUES ('430800', '张家界市', 2, '430000', '湖南省', '0744', NULL);
INSERT INTO `t_sys_area` VALUES ('430802', '永定区', 3, '430800', '张家界市', '0744', '7440199');
INSERT INTO `t_sys_area` VALUES ('430811', '武陵源区', 3, '430800', '张家界市', '0744', '7440299');
INSERT INTO `t_sys_area` VALUES ('430821', '慈利县', 3, '430800', '张家界市', '0744', '7440399');
INSERT INTO `t_sys_area` VALUES ('430822', '桑植县', 3, '430800', '张家界市', '0744', '7440499');
INSERT INTO `t_sys_area` VALUES ('430900', '益阳市', 2, '430000', '湖南省', '0737', NULL);
INSERT INTO `t_sys_area` VALUES ('430902', '资阳区', 3, '430900', '益阳市', '0737', '7370199');
INSERT INTO `t_sys_area` VALUES ('430903', '赫山区', 3, '430900', '益阳市', '0737', '7370299');
INSERT INTO `t_sys_area` VALUES ('430921', '南县', 3, '430900', '益阳市', '0737', '7370399');
INSERT INTO `t_sys_area` VALUES ('430922', '桃江县', 3, '430900', '益阳市', '0737', '7370499');
INSERT INTO `t_sys_area` VALUES ('430923', '安化县', 3, '430900', '益阳市', '0737', '7370599');
INSERT INTO `t_sys_area` VALUES ('430981', '沅江市', 3, '430900', '益阳市', '0737', '7370699');
INSERT INTO `t_sys_area` VALUES ('431000', '郴州市', 2, '430000', '湖南省', '0735', NULL);
INSERT INTO `t_sys_area` VALUES ('431002', '北湖区', 3, '431000', '郴州市', '0735', '7350199');
INSERT INTO `t_sys_area` VALUES ('431003', '苏仙区', 3, '431000', '郴州市', '0735', '7350299');
INSERT INTO `t_sys_area` VALUES ('431021', '桂阳县', 3, '431000', '郴州市', '0735', '7350399');
INSERT INTO `t_sys_area` VALUES ('431022', '宜章县', 3, '431000', '郴州市', '0735', '7350499');
INSERT INTO `t_sys_area` VALUES ('431023', '永兴县', 3, '431000', '郴州市', '0735', '7350599');
INSERT INTO `t_sys_area` VALUES ('431024', '嘉禾县', 3, '431000', '郴州市', '0735', '7350699');
INSERT INTO `t_sys_area` VALUES ('431025', '临武县', 3, '431000', '郴州市', '0735', '7350799');
INSERT INTO `t_sys_area` VALUES ('431026', '汝城县', 3, '431000', '郴州市', '0735', '7350899');
INSERT INTO `t_sys_area` VALUES ('431027', '桂东县', 3, '431000', '郴州市', '0735', '7350999');
INSERT INTO `t_sys_area` VALUES ('431028', '安仁县', 3, '431000', '郴州市', '0735', '7351099');
INSERT INTO `t_sys_area` VALUES ('431081', '资兴市', 3, '431000', '郴州市', '0735', '7351199');
INSERT INTO `t_sys_area` VALUES ('431100', '永州市', 2, '430000', '湖南省', '0746', NULL);
INSERT INTO `t_sys_area` VALUES ('431102', '零陵区', 3, '431100', '永州市', '0746', '7460199');
INSERT INTO `t_sys_area` VALUES ('431103', '冷水滩区', 3, '431100', '永州市', '0746', '7460299');
INSERT INTO `t_sys_area` VALUES ('431121', '祁阳县', 3, '431100', '永州市', '0746', '7460399');
INSERT INTO `t_sys_area` VALUES ('431122', '东安县', 3, '431100', '永州市', '0746', '7460499');
INSERT INTO `t_sys_area` VALUES ('431123', '双牌县', 3, '431100', '永州市', '0746', '7460599');
INSERT INTO `t_sys_area` VALUES ('431124', '道县', 3, '431100', '永州市', '0746', '7460699');
INSERT INTO `t_sys_area` VALUES ('431125', '江永县', 3, '431100', '永州市', '0746', '7460799');
INSERT INTO `t_sys_area` VALUES ('431126', '宁远县', 3, '431100', '永州市', '0746', '7460899');
INSERT INTO `t_sys_area` VALUES ('431127', '蓝山县', 3, '431100', '永州市', '0746', '7460999');
INSERT INTO `t_sys_area` VALUES ('431128', '新田县', 3, '431100', '永州市', '0746', '7461099');
INSERT INTO `t_sys_area` VALUES ('431129', '江华瑶族自治县', 3, '431100', '永州市', '0746', '7461199');
INSERT INTO `t_sys_area` VALUES ('431200', '怀化市', 2, '430000', '湖南省', '0745', NULL);
INSERT INTO `t_sys_area` VALUES ('431202', '鹤城区', 3, '431200', '怀化市', '0745', '7450199');
INSERT INTO `t_sys_area` VALUES ('431221', '中方县', 3, '431200', '怀化市', '0745', '7450299');
INSERT INTO `t_sys_area` VALUES ('431222', '沅陵县', 3, '431200', '怀化市', '0745', '7450399');
INSERT INTO `t_sys_area` VALUES ('431223', '辰溪县', 3, '431200', '怀化市', '0745', '7450499');
INSERT INTO `t_sys_area` VALUES ('431224', '溆浦县', 3, '431200', '怀化市', '0745', '7450599');
INSERT INTO `t_sys_area` VALUES ('431225', '会同县', 3, '431200', '怀化市', '0745', '7450699');
INSERT INTO `t_sys_area` VALUES ('431226', '麻阳苗族自治县', 3, '431200', '怀化市', '0745', '7450799');
INSERT INTO `t_sys_area` VALUES ('431227', '新晃侗族自治县', 3, '431200', '怀化市', '0745', '7450899');
INSERT INTO `t_sys_area` VALUES ('431228', '芷江侗族自治县', 3, '431200', '怀化市', '0745', '7450999');
INSERT INTO `t_sys_area` VALUES ('431229', '靖州苗族侗族自治县', 3, '431200', '怀化市', '0745', '7451099');
INSERT INTO `t_sys_area` VALUES ('431230', '通道侗族自治县', 3, '431200', '怀化市', '0745', '7451199');
INSERT INTO `t_sys_area` VALUES ('431281', '洪江市', 3, '431200', '怀化市', '0745', '7451299');
INSERT INTO `t_sys_area` VALUES ('431300', '娄底市', 2, '430000', '湖南省', '0738', NULL);
INSERT INTO `t_sys_area` VALUES ('431302', '娄星区', 3, '431300', '娄底市', '0738', '7380199');
INSERT INTO `t_sys_area` VALUES ('431321', '双峰县', 3, '431300', '娄底市', '0738', '7380299');
INSERT INTO `t_sys_area` VALUES ('431322', '新化县', 3, '431300', '娄底市', '0738', '7380399');
INSERT INTO `t_sys_area` VALUES ('431381', '冷水江市', 3, '431300', '娄底市', '0738', '7380499');
INSERT INTO `t_sys_area` VALUES ('431382', '涟源市', 3, '431300', '娄底市', '0738', '7380599');
INSERT INTO `t_sys_area` VALUES ('433100', '湘西土家族苗族自治州', 2, '430000', '湖南省', '0743', NULL);
INSERT INTO `t_sys_area` VALUES ('433101', '吉首市', 3, '433100', '湘西土家族苗族自治州', '0743', '7430199');
INSERT INTO `t_sys_area` VALUES ('433122', '泸溪县', 3, '433100', '湘西土家族苗族自治州', '0743', '7430499');
INSERT INTO `t_sys_area` VALUES ('433123', '凤凰县', 3, '433100', '湘西土家族苗族自治州', '0743', '7430399');
INSERT INTO `t_sys_area` VALUES ('433124', '花垣县', 3, '433100', '湘西土家族苗族自治州', '0743', '7430299');
INSERT INTO `t_sys_area` VALUES ('433125', '保靖县', 3, '433100', '湘西土家族苗族自治州', '0743', '7430599');
INSERT INTO `t_sys_area` VALUES ('433126', '古丈县', 3, '433100', '湘西土家族苗族自治州', '0743', '7430699');
INSERT INTO `t_sys_area` VALUES ('433127', '永顺县', 3, '433100', '湘西土家族苗族自治州', '0743', '7430799');
INSERT INTO `t_sys_area` VALUES ('433130', '龙山县', 3, '433100', '湘西土家族苗族自治州', '0743', '7430899');
INSERT INTO `t_sys_area` VALUES ('440000', '广东省', 1, '000000', '中华人民共和国', NULL, NULL);
INSERT INTO `t_sys_area` VALUES ('440100', '广州市', 2, '440000', '广东省', '020', NULL);
INSERT INTO `t_sys_area` VALUES ('440103', '荔湾区', 3, '440100', '广州市', '020', '0200199');
INSERT INTO `t_sys_area` VALUES ('440104', '越秀区', 3, '440100', '广州市', '020', '0200299');
INSERT INTO `t_sys_area` VALUES ('440105', '海珠区', 3, '440100', '广州市', '020', '0200399');
INSERT INTO `t_sys_area` VALUES ('440106', '天河区', 3, '440100', '广州市', '020', '0200499');
INSERT INTO `t_sys_area` VALUES ('440111', '白云区', 3, '440100', '广州市', '020', '0200599');
INSERT INTO `t_sys_area` VALUES ('440112', '黄埔区', 3, '440100', '广州市', '020', '0200699');
INSERT INTO `t_sys_area` VALUES ('440113', '番禺区', 3, '440100', '广州市', '020', '0200799');
INSERT INTO `t_sys_area` VALUES ('440114', '花都区', 3, '440100', '广州市', '020', '0200899');
INSERT INTO `t_sys_area` VALUES ('440115', '南沙区', 3, '440100', '广州市', '020', '0200999');
INSERT INTO `t_sys_area` VALUES ('440117', '从化区', 3, '440100', '广州市', '020', '0201299');
INSERT INTO `t_sys_area` VALUES ('440118', '增城区', 3, '440100', '广州市', '020', '0201199');
INSERT INTO `t_sys_area` VALUES ('440200', '韶关市', 2, '440000', '广东省', '0751', NULL);
INSERT INTO `t_sys_area` VALUES ('440203', '武江区', 3, '440200', '韶关市', '0751', '7510199');
INSERT INTO `t_sys_area` VALUES ('440204', '浈江区', 3, '440200', '韶关市', '0751', '7510299');
INSERT INTO `t_sys_area` VALUES ('440205', '曲江区', 3, '440200', '韶关市', '0751', '7510399');
INSERT INTO `t_sys_area` VALUES ('440222', '始兴县', 3, '440200', '韶关市', '0751', '7510499');
INSERT INTO `t_sys_area` VALUES ('440224', '仁化县', 3, '440200', '韶关市', '0751', '7510599');
INSERT INTO `t_sys_area` VALUES ('440229', '翁源县', 3, '440200', '韶关市', '0751', '7510699');
INSERT INTO `t_sys_area` VALUES ('440232', '乳源瑶族自治县', 3, '440200', '韶关市', '0751', '7510799');
INSERT INTO `t_sys_area` VALUES ('440233', '新丰县', 3, '440200', '韶关市', '0751', '7510899');
INSERT INTO `t_sys_area` VALUES ('440281', '乐昌市', 3, '440200', '韶关市', '0751', '7510999');
INSERT INTO `t_sys_area` VALUES ('440282', '南雄市', 3, '440200', '韶关市', '0751', '7511099');
INSERT INTO `t_sys_area` VALUES ('440300', '深圳市', 2, '440000', '广东省', '0755', NULL);
INSERT INTO `t_sys_area` VALUES ('440303', '罗湖区', 3, '440300', '深圳市', '0755', '7550199');
INSERT INTO `t_sys_area` VALUES ('440304', '福田区', 3, '440300', '深圳市', '0755', '7550299');
INSERT INTO `t_sys_area` VALUES ('440305', '南山区', 3, '440300', '深圳市', '0755', '7550399');
INSERT INTO `t_sys_area` VALUES ('440306', '宝安区', 3, '440300', '深圳市', '0755', '7550899');
INSERT INTO `t_sys_area` VALUES ('440307', '龙岗区', 3, '440300', '深圳市', '0755', '7551099');
INSERT INTO `t_sys_area` VALUES ('440308', '盐田区', 3, '440300', '深圳市', '0755', '7550699');
INSERT INTO `t_sys_area` VALUES ('440309', '龙华区', 3, '440300', '深圳市', '0755', NULL);
INSERT INTO `t_sys_area` VALUES ('440310', '坪山区', 3, '440300', '深圳市', '0755', NULL);
INSERT INTO `t_sys_area` VALUES ('440400', '珠海市', 2, '440000', '广东省', '0756', NULL);
INSERT INTO `t_sys_area` VALUES ('440402', '香洲区', 3, '440400', '珠海市', '0756', '7560199');
INSERT INTO `t_sys_area` VALUES ('440403', '斗门区', 3, '440400', '珠海市', '0756', '7560299');
INSERT INTO `t_sys_area` VALUES ('440404', '金湾区', 3, '440400', '珠海市', '0756', '7560399');
INSERT INTO `t_sys_area` VALUES ('440500', '汕头市', 2, '440000', '广东省', '0754', NULL);
INSERT INTO `t_sys_area` VALUES ('440507', '龙湖区', 3, '440500', '汕头市', '0754', '7540199');
INSERT INTO `t_sys_area` VALUES ('440511', '金平区', 3, '440500', '汕头市', '0754', '7540299');
INSERT INTO `t_sys_area` VALUES ('440512', '濠江区', 3, '440500', '汕头市', '0754', '7540399');
INSERT INTO `t_sys_area` VALUES ('440513', '潮阳区', 3, '440500', '汕头市', '0754', '7540499');
INSERT INTO `t_sys_area` VALUES ('440514', '潮南区', 3, '440500', '汕头市', '0754', '7540599');
INSERT INTO `t_sys_area` VALUES ('440515', '澄海区', 3, '440500', '汕头市', '0754', '7540699');
INSERT INTO `t_sys_area` VALUES ('440523', '南澳县', 3, '440500', '汕头市', '0754', '7540799');
INSERT INTO `t_sys_area` VALUES ('440600', '佛山市', 2, '440000', '广东省', '0757', NULL);
INSERT INTO `t_sys_area` VALUES ('440604', '禅城区', 3, '440600', '佛山市', '0757', '7570199');
INSERT INTO `t_sys_area` VALUES ('440605', '南海区', 3, '440600', '佛山市', '0757', '7570299');
INSERT INTO `t_sys_area` VALUES ('440606', '顺德区', 3, '440600', '佛山市', '0757', '7570399');
INSERT INTO `t_sys_area` VALUES ('440607', '三水区', 3, '440600', '佛山市', '0757', '7570499');
INSERT INTO `t_sys_area` VALUES ('440608', '高明区', 3, '440600', '佛山市', '0757', '7570599');
INSERT INTO `t_sys_area` VALUES ('440700', '江门市', 2, '440000', '广东省', '0750', NULL);
INSERT INTO `t_sys_area` VALUES ('440703', '蓬江区', 3, '440700', '江门市', '0750', '7500199');
INSERT INTO `t_sys_area` VALUES ('440704', '江海区', 3, '440700', '江门市', '0750', '7500299');
INSERT INTO `t_sys_area` VALUES ('440705', '新会区', 3, '440700', '江门市', '0750', '7500399');
INSERT INTO `t_sys_area` VALUES ('440781', '台山市', 3, '440700', '江门市', '0750', '7500499');
INSERT INTO `t_sys_area` VALUES ('440783', '开平市', 3, '440700', '江门市', '0750', '7500599');
INSERT INTO `t_sys_area` VALUES ('440784', '鹤山市', 3, '440700', '江门市', '0750', '7500699');
INSERT INTO `t_sys_area` VALUES ('440785', '恩平市', 3, '440700', '江门市', '0750', '7500799');
INSERT INTO `t_sys_area` VALUES ('440800', '湛江市', 2, '440000', '广东省', '0759', NULL);
INSERT INTO `t_sys_area` VALUES ('440802', '赤坎区', 3, '440800', '湛江市', '0759', '7590199');
INSERT INTO `t_sys_area` VALUES ('440803', '霞山区', 3, '440800', '湛江市', '0759', '7590299');
INSERT INTO `t_sys_area` VALUES ('440804', '坡头区', 3, '440800', '湛江市', '0759', '7590399');
INSERT INTO `t_sys_area` VALUES ('440811', '麻章区', 3, '440800', '湛江市', '0759', '7590499');
INSERT INTO `t_sys_area` VALUES ('440823', '遂溪县', 3, '440800', '湛江市', '0759', '7590599');
INSERT INTO `t_sys_area` VALUES ('440825', '徐闻县', 3, '440800', '湛江市', '0759', '7590699');
INSERT INTO `t_sys_area` VALUES ('440881', '廉江市', 3, '440800', '湛江市', '0759', '7590799');
INSERT INTO `t_sys_area` VALUES ('440882', '雷州市', 3, '440800', '湛江市', '0759', '7590899');
INSERT INTO `t_sys_area` VALUES ('440883', '吴川市', 3, '440800', '湛江市', '0759', '7590999');
INSERT INTO `t_sys_area` VALUES ('440900', '茂名市', 2, '440000', '广东省', '0668', NULL);
INSERT INTO `t_sys_area` VALUES ('440902', '茂南区', 3, '440900', '茂名市', '0668', '6680199');
INSERT INTO `t_sys_area` VALUES ('440904', '电白区', 3, '440900', '茂名市', '0668', NULL);
INSERT INTO `t_sys_area` VALUES ('440981', '高州市', 3, '440900', '茂名市', '0668', '6680499');
INSERT INTO `t_sys_area` VALUES ('440982', '化州市', 3, '440900', '茂名市', '0668', '6680599');
INSERT INTO `t_sys_area` VALUES ('440983', '信宜市', 3, '440900', '茂名市', '0668', '6680699');
INSERT INTO `t_sys_area` VALUES ('441200', '肇庆市', 2, '440000', '广东省', '0758', NULL);
INSERT INTO `t_sys_area` VALUES ('441202', '端州区', 3, '441200', '肇庆市', '0758', '7580199');
INSERT INTO `t_sys_area` VALUES ('441203', '鼎湖区', 3, '441200', '肇庆市', '0758', '7580299');
INSERT INTO `t_sys_area` VALUES ('441204', '高要区', 3, '441200', '肇庆市', '0758', NULL);
INSERT INTO `t_sys_area` VALUES ('441223', '广宁县', 3, '441200', '肇庆市', '0758', '7580399');
INSERT INTO `t_sys_area` VALUES ('441224', '怀集县', 3, '441200', '肇庆市', '0758', '7580499');
INSERT INTO `t_sys_area` VALUES ('441225', '封开县', 3, '441200', '肇庆市', '0758', '7580599');
INSERT INTO `t_sys_area` VALUES ('441226', '德庆县', 3, '441200', '肇庆市', '0758', '7580699');
INSERT INTO `t_sys_area` VALUES ('441284', '四会市', 3, '441200', '肇庆市', '0758', '7580899');
INSERT INTO `t_sys_area` VALUES ('441300', '惠州市', 2, '440000', '广东省', '0752', NULL);
INSERT INTO `t_sys_area` VALUES ('441302', '惠城区', 3, '441300', '惠州市', '0752', '7520199');
INSERT INTO `t_sys_area` VALUES ('441303', '惠阳区', 3, '441300', '惠州市', '0752', '7520299');
INSERT INTO `t_sys_area` VALUES ('441322', '博罗县', 3, '441300', '惠州市', '0752', '7520399');
INSERT INTO `t_sys_area` VALUES ('441323', '惠东县', 3, '441300', '惠州市', '0752', '7520499');
INSERT INTO `t_sys_area` VALUES ('441324', '龙门县', 3, '441300', '惠州市', '0752', '7520599');
INSERT INTO `t_sys_area` VALUES ('441400', '梅州市', 2, '440000', '广东省', '0753', NULL);
INSERT INTO `t_sys_area` VALUES ('441402', '梅江区', 3, '441400', '梅州市', '0753', '7530199');
INSERT INTO `t_sys_area` VALUES ('441403', '梅县区', 3, '441400', '梅州市', '0753', '7530299');
INSERT INTO `t_sys_area` VALUES ('441422', '大埔县', 3, '441400', '梅州市', '0753', '7530399');
INSERT INTO `t_sys_area` VALUES ('441423', '丰顺县', 3, '441400', '梅州市', '0753', '7530499');
INSERT INTO `t_sys_area` VALUES ('441424', '五华县', 3, '441400', '梅州市', '0753', '7530599');
INSERT INTO `t_sys_area` VALUES ('441426', '平远县', 3, '441400', '梅州市', '0753', '7530699');
INSERT INTO `t_sys_area` VALUES ('441427', '蕉岭县', 3, '441400', '梅州市', '0753', '7530799');
INSERT INTO `t_sys_area` VALUES ('441481', '兴宁市', 3, '441400', '梅州市', '0753', '7530899');
INSERT INTO `t_sys_area` VALUES ('441500', '汕尾市', 2, '440000', '广东省', '0660', NULL);
INSERT INTO `t_sys_area` VALUES ('441502', '城区', 3, '441500', '汕尾市', '0660', '6600199');
INSERT INTO `t_sys_area` VALUES ('441521', '海丰县', 3, '441500', '汕尾市', '0660', '6600299');
INSERT INTO `t_sys_area` VALUES ('441523', '陆河县', 3, '441500', '汕尾市', '0660', '6600399');
INSERT INTO `t_sys_area` VALUES ('441581', '陆丰市', 3, '441500', '汕尾市', '0660', '6600499');
INSERT INTO `t_sys_area` VALUES ('441600', '河源市', 2, '440000', '广东省', '0762', NULL);
INSERT INTO `t_sys_area` VALUES ('441602', '源城区', 3, '441600', '河源市', '0762', '7620199');
INSERT INTO `t_sys_area` VALUES ('441621', '紫金县', 3, '441600', '河源市', '0762', '7620299');
INSERT INTO `t_sys_area` VALUES ('441622', '龙川县', 3, '441600', '河源市', '0762', '7620399');
INSERT INTO `t_sys_area` VALUES ('441623', '连平县', 3, '441600', '河源市', '0762', '7620499');
INSERT INTO `t_sys_area` VALUES ('441624', '和平县', 3, '441600', '河源市', '0762', '7620599');
INSERT INTO `t_sys_area` VALUES ('441625', '东源县', 3, '441600', '河源市', '0762', '7620699');
INSERT INTO `t_sys_area` VALUES ('441700', '阳江市', 2, '440000', '广东省', '0662', NULL);
INSERT INTO `t_sys_area` VALUES ('441702', '江城区', 3, '441700', '阳江市', '0662', '6620499');
INSERT INTO `t_sys_area` VALUES ('441704', '阳东区', 3, '441700', '阳江市', '0662', NULL);
INSERT INTO `t_sys_area` VALUES ('441721', '阳西县', 3, '441700', '阳江市', '0662', '6620599');
INSERT INTO `t_sys_area` VALUES ('441781', '阳春市', 3, '441700', '阳江市', '0662', '6620799');
INSERT INTO `t_sys_area` VALUES ('441800', '清远市', 2, '440000', '广东省', '0763', NULL);
INSERT INTO `t_sys_area` VALUES ('441802', '清城区', 3, '441800', '清远市', '0763', '7630199');
INSERT INTO `t_sys_area` VALUES ('441803', '清新区', 3, '441800', '清远市', '0763', NULL);
INSERT INTO `t_sys_area` VALUES ('441821', '佛冈县', 3, '441800', '清远市', '0763', '7630299');
INSERT INTO `t_sys_area` VALUES ('441823', '阳山县', 3, '441800', '清远市', '0763', '7630399');
INSERT INTO `t_sys_area` VALUES ('441825', '连山壮族瑶族自治县', 3, '441800', '清远市', '0763', '7630499');
INSERT INTO `t_sys_area` VALUES ('441826', '连南瑶族自治县', 3, '441800', '清远市', '0763', '7630599');
INSERT INTO `t_sys_area` VALUES ('441881', '英德市', 3, '441800', '清远市', '0763', '7630799');
INSERT INTO `t_sys_area` VALUES ('441882', '连州市', 3, '441800', '清远市', '0763', '7630899');
INSERT INTO `t_sys_area` VALUES ('441900', '东莞市', 2, '440000', '广东省', '0769', '7690099');
INSERT INTO `t_sys_area` VALUES ('442000', '中山市', 2, '440000', '广东省', '0760', '7600099');
INSERT INTO `t_sys_area` VALUES ('442100', '东沙群岛', 2, '440000', '广东省', NULL, NULL);
INSERT INTO `t_sys_area` VALUES ('445100', '潮州市', 2, '440000', '广东省', '0768', NULL);
INSERT INTO `t_sys_area` VALUES ('445102', '湘桥区', 3, '445100', '潮州市', '0768', '7680199');
INSERT INTO `t_sys_area` VALUES ('445103', '潮安区', 3, '445100', '潮州市', '0768', '7680299');
INSERT INTO `t_sys_area` VALUES ('445122', '饶平县', 3, '445100', '潮州市', '0768', '7680399');
INSERT INTO `t_sys_area` VALUES ('445200', '揭阳市', 2, '440000', '广东省', '0663', NULL);
INSERT INTO `t_sys_area` VALUES ('445202', '榕城区', 3, '445200', '揭阳市', '0663', '6630199');
INSERT INTO `t_sys_area` VALUES ('445203', '揭东区', 3, '445200', '揭阳市', '0663', '6630299');
INSERT INTO `t_sys_area` VALUES ('445222', '揭西县', 3, '445200', '揭阳市', '0663', '6630399');
INSERT INTO `t_sys_area` VALUES ('445224', '惠来县', 3, '445200', '揭阳市', '0663', '6630499');
INSERT INTO `t_sys_area` VALUES ('445281', '普宁市', 3, '445200', '揭阳市', '0663', '6630599');
INSERT INTO `t_sys_area` VALUES ('445300', '云浮市', 2, '440000', '广东省', '0766', NULL);
INSERT INTO `t_sys_area` VALUES ('445302', '云城区', 3, '445300', '云浮市', '0766', '7660199');
INSERT INTO `t_sys_area` VALUES ('445303', '云安区', 3, '445300', '云浮市', '0766', NULL);
INSERT INTO `t_sys_area` VALUES ('445321', '新兴县', 3, '445300', '云浮市', '0766', '7660299');
INSERT INTO `t_sys_area` VALUES ('445322', '郁南县', 3, '445300', '云浮市', '0766', '7660399');
INSERT INTO `t_sys_area` VALUES ('445381', '罗定市', 3, '445300', '云浮市', '0766', '7660599');
INSERT INTO `t_sys_area` VALUES ('450000', '广西壮族自治区', 1, '000000', '中华人民共和国', NULL, NULL);
INSERT INTO `t_sys_area` VALUES ('450100', '南宁市', 2, '450000', '广西壮族自治区', '0771', NULL);
INSERT INTO `t_sys_area` VALUES ('450102', '兴宁区', 3, '450100', '南宁市', '0771', '7710199');
INSERT INTO `t_sys_area` VALUES ('450103', '青秀区', 3, '450100', '南宁市', '0771', '7710299');
INSERT INTO `t_sys_area` VALUES ('450105', '江南区', 3, '450100', '南宁市', '0771', '7710399');
INSERT INTO `t_sys_area` VALUES ('450107', '西乡塘区', 3, '450100', '南宁市', '0771', '7710499');
INSERT INTO `t_sys_area` VALUES ('450108', '良庆区', 3, '450100', '南宁市', '0771', '7710599');
INSERT INTO `t_sys_area` VALUES ('450109', '邕宁区', 3, '450100', '南宁市', '0771', '7710699');
INSERT INTO `t_sys_area` VALUES ('450110', '武鸣区', 3, '450100', '南宁市', '0771', '7710799');
INSERT INTO `t_sys_area` VALUES ('450123', '隆安县', 3, '450100', '南宁市', '0771', '7710899');
INSERT INTO `t_sys_area` VALUES ('450124', '马山县', 3, '450100', '南宁市', '0771', '7710999');
INSERT INTO `t_sys_area` VALUES ('450125', '上林县', 3, '450100', '南宁市', '0771', '7711099');
INSERT INTO `t_sys_area` VALUES ('450126', '宾阳县', 3, '450100', '南宁市', '0771', '7711199');
INSERT INTO `t_sys_area` VALUES ('450127', '横县', 3, '450100', '南宁市', '0771', '7711299');
INSERT INTO `t_sys_area` VALUES ('450200', '柳州市', 2, '450000', '广西壮族自治区', '0772', NULL);
INSERT INTO `t_sys_area` VALUES ('450202', '城中区', 3, '450200', '柳州市', '0772', '7720199');
INSERT INTO `t_sys_area` VALUES ('450203', '鱼峰区', 3, '450200', '柳州市', '0772', '7720299');
INSERT INTO `t_sys_area` VALUES ('450204', '柳南区', 3, '450200', '柳州市', '0772', '7720399');
INSERT INTO `t_sys_area` VALUES ('450205', '柳北区', 3, '450200', '柳州市', '0772', '7720499');
INSERT INTO `t_sys_area` VALUES ('450206', '柳江区', 3, '450200', '柳州市', '0772', NULL);
INSERT INTO `t_sys_area` VALUES ('450222', '柳城县', 3, '450200', '柳州市', '0772', '7720699');
INSERT INTO `t_sys_area` VALUES ('450223', '鹿寨县', 3, '450200', '柳州市', '0772', '7720799');
INSERT INTO `t_sys_area` VALUES ('450224', '融安县', 3, '450200', '柳州市', '0772', '7720899');
INSERT INTO `t_sys_area` VALUES ('450225', '融水苗族自治县', 3, '450200', '柳州市', '0772', '7720999');
INSERT INTO `t_sys_area` VALUES ('450226', '三江侗族自治县', 3, '450200', '柳州市', '0772', '7721099');
INSERT INTO `t_sys_area` VALUES ('450300', '桂林市', 2, '450000', '广西壮族自治区', '0773', NULL);
INSERT INTO `t_sys_area` VALUES ('450302', '秀峰区', 3, '450300', '桂林市', '0773', '7730199');
INSERT INTO `t_sys_area` VALUES ('450303', '叠彩区', 3, '450300', '桂林市', '0773', '7730299');
INSERT INTO `t_sys_area` VALUES ('450304', '象山区', 3, '450300', '桂林市', '0773', '7730399');
INSERT INTO `t_sys_area` VALUES ('450305', '七星区', 3, '450300', '桂林市', '0773', '7730499');
INSERT INTO `t_sys_area` VALUES ('450311', '雁山区', 3, '450300', '桂林市', '0773', '7730599');
INSERT INTO `t_sys_area` VALUES ('450312', '临桂区', 3, '450300', '桂林市', '0773', NULL);
INSERT INTO `t_sys_area` VALUES ('450321', '阳朔县', 3, '450300', '桂林市', '0773', '7730699');
INSERT INTO `t_sys_area` VALUES ('450323', '灵川县', 3, '450300', '桂林市', '0773', '7730899');
INSERT INTO `t_sys_area` VALUES ('450324', '全州县', 3, '450300', '桂林市', '0773', '7730999');
INSERT INTO `t_sys_area` VALUES ('450325', '兴安县', 3, '450300', '桂林市', '0773', '7731099');
INSERT INTO `t_sys_area` VALUES ('450326', '永福县', 3, '450300', '桂林市', '0773', '7731199');
INSERT INTO `t_sys_area` VALUES ('450327', '灌阳县', 3, '450300', '桂林市', '0773', '7731299');
INSERT INTO `t_sys_area` VALUES ('450328', '龙胜各族自治县', 3, '450300', '桂林市', '0773', '7731399');
INSERT INTO `t_sys_area` VALUES ('450329', '资源县', 3, '450300', '桂林市', '0773', '7731499');
INSERT INTO `t_sys_area` VALUES ('450330', '平乐县', 3, '450300', '桂林市', '0773', '7731599');
INSERT INTO `t_sys_area` VALUES ('450331', '荔浦县', 3, '450300', '桂林市', '0773', '7731699');
INSERT INTO `t_sys_area` VALUES ('450332', '恭城瑶族自治县', 3, '450300', '桂林市', '0773', '7731799');
INSERT INTO `t_sys_area` VALUES ('450400', '梧州市', 2, '450000', '广西壮族自治区', '0774', NULL);
INSERT INTO `t_sys_area` VALUES ('450403', '万秀区', 3, '450400', '梧州市', '0774', '7740199');
INSERT INTO `t_sys_area` VALUES ('450405', '长洲区', 3, '450400', '梧州市', '0774', '7740399');
INSERT INTO `t_sys_area` VALUES ('450406', '龙圩区', 3, '450400', '梧州市', '0774', NULL);
INSERT INTO `t_sys_area` VALUES ('450421', '苍梧县', 3, '450400', '梧州市', '0774', '7740499');
INSERT INTO `t_sys_area` VALUES ('450422', '藤县', 3, '450400', '梧州市', '0774', '7740599');
INSERT INTO `t_sys_area` VALUES ('450423', '蒙山县', 3, '450400', '梧州市', '0774', '7740699');
INSERT INTO `t_sys_area` VALUES ('450481', '岑溪市', 3, '450400', '梧州市', '0774', '7740799');
INSERT INTO `t_sys_area` VALUES ('450500', '北海市', 2, '450000', '广西壮族自治区', '0779', NULL);
INSERT INTO `t_sys_area` VALUES ('450502', '海城区', 3, '450500', '北海市', '0779', '7790199');
INSERT INTO `t_sys_area` VALUES ('450503', '银海区', 3, '450500', '北海市', '0779', '7790299');
INSERT INTO `t_sys_area` VALUES ('450512', '铁山港区', 3, '450500', '北海市', '0779', '7790399');
INSERT INTO `t_sys_area` VALUES ('450521', '合浦县', 3, '450500', '北海市', '0779', '7790499');
INSERT INTO `t_sys_area` VALUES ('450600', '防城港市', 2, '450000', '广西壮族自治区', '0770', NULL);
INSERT INTO `t_sys_area` VALUES ('450602', '港口区', 3, '450600', '防城港市', '0770', '7700199');
INSERT INTO `t_sys_area` VALUES ('450603', '防城区', 3, '450600', '防城港市', '0770', '7700299');
INSERT INTO `t_sys_area` VALUES ('450621', '上思县', 3, '450600', '防城港市', '0770', '7700399');
INSERT INTO `t_sys_area` VALUES ('450681', '东兴市', 3, '450600', '防城港市', '0770', '7700499');
INSERT INTO `t_sys_area` VALUES ('450700', '钦州市', 2, '450000', '广西壮族自治区', '0777', NULL);
INSERT INTO `t_sys_area` VALUES ('450702', '钦南区', 3, '450700', '钦州市', '0777', '7770199');
INSERT INTO `t_sys_area` VALUES ('450703', '钦北区', 3, '450700', '钦州市', '0777', '7770299');
INSERT INTO `t_sys_area` VALUES ('450721', '灵山县', 3, '450700', '钦州市', '0777', '7770399');
INSERT INTO `t_sys_area` VALUES ('450722', '浦北县', 3, '450700', '钦州市', '0777', '7770499');
INSERT INTO `t_sys_area` VALUES ('450800', '贵港市', 2, '450000', '广西壮族自治区', '1755', NULL);
INSERT INTO `t_sys_area` VALUES ('450802', '港北区', 3, '450800', '贵港市', '1755', '7750199');
INSERT INTO `t_sys_area` VALUES ('450803', '港南区', 3, '450800', '贵港市', '1755', '7750299');
INSERT INTO `t_sys_area` VALUES ('450804', '覃塘区', 3, '450800', '贵港市', '1755', '7750399');
INSERT INTO `t_sys_area` VALUES ('450821', '平南县', 3, '450800', '贵港市', '1755', '7750499');
INSERT INTO `t_sys_area` VALUES ('450881', '桂平市', 3, '450800', '贵港市', '1755', '7750599');
INSERT INTO `t_sys_area` VALUES ('450900', '玉林市', 2, '450000', '广西壮族自治区', '0775', NULL);
INSERT INTO `t_sys_area` VALUES ('450902', '玉州区', 3, '450900', '玉林市', '0775', '7830199');
INSERT INTO `t_sys_area` VALUES ('450903', '福绵区', 3, '450900', '玉林市', '0775', NULL);
INSERT INTO `t_sys_area` VALUES ('450921', '容县', 3, '450900', '玉林市', '0775', '7830299');
INSERT INTO `t_sys_area` VALUES ('450922', '陆川县', 3, '450900', '玉林市', '0775', '7830399');
INSERT INTO `t_sys_area` VALUES ('450923', '博白县', 3, '450900', '玉林市', '0775', '7830499');
INSERT INTO `t_sys_area` VALUES ('450924', '兴业县', 3, '450900', '玉林市', '0775', '7830599');
INSERT INTO `t_sys_area` VALUES ('450981', '北流市', 3, '450900', '玉林市', '0775', '7830699');
INSERT INTO `t_sys_area` VALUES ('451000', '百色市', 2, '450000', '广西壮族自治区', '0776', NULL);
INSERT INTO `t_sys_area` VALUES ('451002', '右江区', 3, '451000', '百色市', '0776', '7760199');
INSERT INTO `t_sys_area` VALUES ('451021', '田阳县', 3, '451000', '百色市', '0776', '7760299');
INSERT INTO `t_sys_area` VALUES ('451022', '田东县', 3, '451000', '百色市', '0776', '7760399');
INSERT INTO `t_sys_area` VALUES ('451023', '平果县', 3, '451000', '百色市', '0776', '7760499');
INSERT INTO `t_sys_area` VALUES ('451024', '德保县', 3, '451000', '百色市', '0776', '7760599');
INSERT INTO `t_sys_area` VALUES ('451026', '那坡县', 3, '451000', '百色市', '0776', '7760799');
INSERT INTO `t_sys_area` VALUES ('451027', '凌云县', 3, '451000', '百色市', '0776', '7760899');
INSERT INTO `t_sys_area` VALUES ('451028', '乐业县', 3, '451000', '百色市', '0776', '7760999');
INSERT INTO `t_sys_area` VALUES ('451029', '田林县', 3, '451000', '百色市', '0776', '7761099');
INSERT INTO `t_sys_area` VALUES ('451030', '西林县', 3, '451000', '百色市', '0776', '7761199');
INSERT INTO `t_sys_area` VALUES ('451031', '隆林各族自治县', 3, '451000', '百色市', '0776', '7761299');
INSERT INTO `t_sys_area` VALUES ('451081', '靖西市', 3, '451000', '百色市', '0776', NULL);
INSERT INTO `t_sys_area` VALUES ('451100', '贺州市', 2, '450000', '广西壮族自治区', '1774', NULL);
INSERT INTO `t_sys_area` VALUES ('451102', '八步区', 3, '451100', '贺州市', '1774', '7820199');
INSERT INTO `t_sys_area` VALUES ('451103', '平桂区', 3, '451100', '贺州市', '1774', NULL);
INSERT INTO `t_sys_area` VALUES ('451121', '昭平县', 3, '451100', '贺州市', '1774', '7820299');
INSERT INTO `t_sys_area` VALUES ('451122', '钟山县', 3, '451100', '贺州市', '1774', '7820399');
INSERT INTO `t_sys_area` VALUES ('451123', '富川瑶族自治县', 3, '451100', '贺州市', '1774', '7820499');
INSERT INTO `t_sys_area` VALUES ('451200', '河池市', 2, '450000', '广西壮族自治区', '0778', NULL);
INSERT INTO `t_sys_area` VALUES ('451202', '金城江区', 3, '451200', '河池市', '0778', '7780199');
INSERT INTO `t_sys_area` VALUES ('451203', '宜州区', 3, '451200', '河池市', '0778', NULL);
INSERT INTO `t_sys_area` VALUES ('451221', '南丹县', 3, '451200', '河池市', '0778', '7780299');
INSERT INTO `t_sys_area` VALUES ('451222', '天峨县', 3, '451200', '河池市', '0778', '7780399');
INSERT INTO `t_sys_area` VALUES ('451223', '凤山县', 3, '451200', '河池市', '0778', '7780499');
INSERT INTO `t_sys_area` VALUES ('451224', '东兰县', 3, '451200', '河池市', '0778', '7780599');
INSERT INTO `t_sys_area` VALUES ('451225', '罗城仫佬族自治县', 3, '451200', '河池市', '0778', '7780699');
INSERT INTO `t_sys_area` VALUES ('451226', '环江毛南族自治县', 3, '451200', '河池市', '0778', '7780799');
INSERT INTO `t_sys_area` VALUES ('451227', '巴马瑶族自治县', 3, '451200', '河池市', '0778', '7780899');
INSERT INTO `t_sys_area` VALUES ('451228', '都安瑶族自治县', 3, '451200', '河池市', '0778', '7780999');
INSERT INTO `t_sys_area` VALUES ('451229', '大化瑶族自治县', 3, '451200', '河池市', '0778', '7781099');
INSERT INTO `t_sys_area` VALUES ('451300', '来宾市', 2, '450000', '广西壮族自治区', '1772', NULL);
INSERT INTO `t_sys_area` VALUES ('451302', '兴宾区', 3, '451300', '来宾市', '1772', '7810199');
INSERT INTO `t_sys_area` VALUES ('451321', '忻城县', 3, '451300', '来宾市', '1772', '7810299');
INSERT INTO `t_sys_area` VALUES ('451322', '象州县', 3, '451300', '来宾市', '1772', '7810399');
INSERT INTO `t_sys_area` VALUES ('451323', '武宣县', 3, '451300', '来宾市', '1772', '7810499');
INSERT INTO `t_sys_area` VALUES ('451324', '金秀瑶族自治县', 3, '451300', '来宾市', '1772', '7810599');
INSERT INTO `t_sys_area` VALUES ('451381', '合山市', 3, '451300', '来宾市', '1772', '7810699');
INSERT INTO `t_sys_area` VALUES ('451400', '崇左市', 2, '450000', '广西壮族自治区', '1771', NULL);
INSERT INTO `t_sys_area` VALUES ('451402', '江州区', 3, '451400', '崇左市', '1771', '7800199');
INSERT INTO `t_sys_area` VALUES ('451421', '扶绥县', 3, '451400', '崇左市', '1771', '7800299');
INSERT INTO `t_sys_area` VALUES ('451422', '宁明县', 3, '451400', '崇左市', '1771', '7800399');
INSERT INTO `t_sys_area` VALUES ('451423', '龙州县', 3, '451400', '崇左市', '1771', '7800499');
INSERT INTO `t_sys_area` VALUES ('451424', '大新县', 3, '451400', '崇左市', '1771', '7800599');
INSERT INTO `t_sys_area` VALUES ('451425', '天等县', 3, '451400', '崇左市', '1771', '7800699');
INSERT INTO `t_sys_area` VALUES ('451481', '凭祥市', 3, '451400', '崇左市', '1771', '7800799');
INSERT INTO `t_sys_area` VALUES ('460000', '海南省', 1, '000000', '中华人民共和国', NULL, NULL);
INSERT INTO `t_sys_area` VALUES ('460100', '海口市', 2, '460000', '海南省', '0898', NULL);
INSERT INTO `t_sys_area` VALUES ('460105', '秀英区', 3, '460100', '海口市', '0898', '8980199');
INSERT INTO `t_sys_area` VALUES ('460106', '龙华区', 3, '460100', '海口市', '0898', '8980399');
INSERT INTO `t_sys_area` VALUES ('460107', '琼山区', 3, '460100', '海口市', '0898', '8980499');
INSERT INTO `t_sys_area` VALUES ('460108', '美兰区', 3, '460100', '海口市', '0898', '8980299');
INSERT INTO `t_sys_area` VALUES ('460200', '三亚市', 2, '460000', '海南省', '0899', NULL);
INSERT INTO `t_sys_area` VALUES ('460202', '海棠区', 3, '460200', '三亚市', '0899', '8970199');
INSERT INTO `t_sys_area` VALUES ('460203', '吉阳区', 3, '460200', '三亚市', '0899', NULL);
INSERT INTO `t_sys_area` VALUES ('460204', '天涯区', 3, '460200', '三亚市', '0899', NULL);
INSERT INTO `t_sys_area` VALUES ('460205', '崖州区', 3, '460200', '三亚市', '0899', NULL);
INSERT INTO `t_sys_area` VALUES ('460300', '三沙市', 2, '460000', '海南省', '2898', NULL);
INSERT INTO `t_sys_area` VALUES ('460321', '西沙群岛', 3, '460300', '三沙市', '1895', NULL);
INSERT INTO `t_sys_area` VALUES ('460322', '南沙群岛', 3, '460300', '三沙市', '1891', NULL);
INSERT INTO `t_sys_area` VALUES ('460323', '中沙群岛的岛礁及其海域', 3, '460300', '三沙市', '2801', NULL);
INSERT INTO `t_sys_area` VALUES ('460400', '儋州市', 2, '460000', '海南省', '0805', '8920199');
INSERT INTO `t_sys_area` VALUES ('469001', '五指山市', 2, '460000', '海南省', '1897', '8930199');
INSERT INTO `t_sys_area` VALUES ('469002', '琼海市', 2, '460000', '海南省', '1894', '8960199');
INSERT INTO `t_sys_area` VALUES ('469005', '文昌市', 2, '460000', '海南省', '1893', '8950199');
INSERT INTO `t_sys_area` VALUES ('469006', '万宁市', 2, '460000', '海南省', '1898', '8940199');
INSERT INTO `t_sys_area` VALUES ('469007', '东方市', 2, '460000', '海南省', '0807', '8910199');
INSERT INTO `t_sys_area` VALUES ('469021', '定安县', 2, '460000', '海南省', '0806', '8990599');
INSERT INTO `t_sys_area` VALUES ('469022', '屯昌县', 2, '460000', '海南省', '1892', '8990699');
INSERT INTO `t_sys_area` VALUES ('469023', '澄迈县', 2, '460000', '海南省', '0804', '8990799');
INSERT INTO `t_sys_area` VALUES ('469024', '临高县', 2, '460000', '海南省', '1896', '8990899');
INSERT INTO `t_sys_area` VALUES ('469025', '白沙黎族自治县', 2, '460000', '海南省', '0802', '8990999');
INSERT INTO `t_sys_area` VALUES ('469026', '昌江黎族自治县', 2, '460000', '海南省', '0803', '8991099');
INSERT INTO `t_sys_area` VALUES ('469027', '乐东黎族自治县', 2, '460000', '海南省', '2802', '8990199');
INSERT INTO `t_sys_area` VALUES ('469028', '陵水黎族自治县', 2, '460000', '海南省', '0809', '8990299');
INSERT INTO `t_sys_area` VALUES ('469029', '保亭黎族苗族自治县', 2, '460000', '海南省', '0801', '8990399');
INSERT INTO `t_sys_area` VALUES ('469030', '琼中黎族苗族自治县', 2, '460000', '海南省', '1899', '8990499');
INSERT INTO `t_sys_area` VALUES ('500000', '重庆市', 1, '000000', '中华人民共和国', '023', NULL);
INSERT INTO `t_sys_area` VALUES ('500100', '重庆城区', 2, '500000', '重庆市', '023', NULL);
INSERT INTO `t_sys_area` VALUES ('500101', '万州区', 3, '500100', '重庆城区', '023', '0230199');
INSERT INTO `t_sys_area` VALUES ('500102', '涪陵区', 3, '500100', '重庆城区', '023', '0230299');
INSERT INTO `t_sys_area` VALUES ('500103', '渝中区', 3, '500100', '重庆城区', '023', '0230399');
INSERT INTO `t_sys_area` VALUES ('500104', '大渡口区', 3, '500100', '重庆城区', '023', '0230499');
INSERT INTO `t_sys_area` VALUES ('500105', '江北区', 3, '500100', '重庆城区', '023', '0230599');
INSERT INTO `t_sys_area` VALUES ('500106', '沙坪坝区', 3, '500100', '重庆城区', '023', '0230699');
INSERT INTO `t_sys_area` VALUES ('500107', '九龙坡区', 3, '500100', '重庆城区', '023', '0230799');
INSERT INTO `t_sys_area` VALUES ('500108', '南岸区', 3, '500100', '重庆城区', '023', '0230899');
INSERT INTO `t_sys_area` VALUES ('500109', '北碚区', 3, '500100', '重庆城区', '023', '0230999');
INSERT INTO `t_sys_area` VALUES ('500110', '綦江区', 3, '500100', '重庆城区', '023', '0232099');
INSERT INTO `t_sys_area` VALUES ('500111', '大足区', 3, '500100', '重庆城区', '023', '0232399');
INSERT INTO `t_sys_area` VALUES ('500112', '渝北区', 3, '500100', '重庆城区', '023', '0231299');
INSERT INTO `t_sys_area` VALUES ('500113', '巴南区', 3, '500100', '重庆城区', '023', '0231399');
INSERT INTO `t_sys_area` VALUES ('500114', '黔江区', 3, '500100', '重庆城区', '023', '0231499');
INSERT INTO `t_sys_area` VALUES ('500115', '长寿区', 3, '500100', '重庆城区', '023', '0231599');
INSERT INTO `t_sys_area` VALUES ('500116', '江津区', 3, '500100', '重庆城区', '023', '0231699');
INSERT INTO `t_sys_area` VALUES ('500117', '合川区', 3, '500100', '重庆城区', '023', '0231799');
INSERT INTO `t_sys_area` VALUES ('500118', '永川区', 3, '500100', '重庆城区', '023', '0231899');
INSERT INTO `t_sys_area` VALUES ('500119', '南川区', 3, '500100', '重庆城区', '023', '0231999');
INSERT INTO `t_sys_area` VALUES ('500120', '璧山区', 3, '500100', '重庆城区', '023', '0232599');
INSERT INTO `t_sys_area` VALUES ('500151', '铜梁区', 3, '500100', '重庆城区', '023', '0232299');
INSERT INTO `t_sys_area` VALUES ('500152', '潼南区', 3, '500100', '重庆城区', '023', '0232199');
INSERT INTO `t_sys_area` VALUES ('500153', '荣昌区', 3, '500100', '重庆城区', '023', '0232499');
INSERT INTO `t_sys_area` VALUES ('500154', '开州区', 3, '500100', '重庆城区', '023', NULL);
INSERT INTO `t_sys_area` VALUES ('500155', '梁平区', 3, '500200', '重庆郊县', '023', NULL);
INSERT INTO `t_sys_area` VALUES ('500156', '武隆区', 3, '500200', '重庆郊县', '023', NULL);
INSERT INTO `t_sys_area` VALUES ('500200', '重庆郊县', 2, '500000', '重庆市', '023', NULL);
INSERT INTO `t_sys_area` VALUES ('500229', '城口县', 3, '500200', '重庆郊县', '023', '0232799');
INSERT INTO `t_sys_area` VALUES ('500230', '丰都县', 3, '500200', '重庆郊县', '023', '0232899');
INSERT INTO `t_sys_area` VALUES ('500231', '垫江县', 3, '500200', '重庆郊县', '023', '0232999');
INSERT INTO `t_sys_area` VALUES ('500233', '忠县', 3, '500200', '重庆郊县', '023', '0233199');
INSERT INTO `t_sys_area` VALUES ('500235', '云阳县', 3, '500200', '重庆郊县', '023', '0233399');
INSERT INTO `t_sys_area` VALUES ('500236', '奉节县', 3, '500200', '重庆郊县', '023', '0233499');
INSERT INTO `t_sys_area` VALUES ('500237', '巫山县', 3, '500200', '重庆郊县', '023', '0233599');
INSERT INTO `t_sys_area` VALUES ('500238', '巫溪县', 3, '500200', '重庆郊县', '023', '0233699');
INSERT INTO `t_sys_area` VALUES ('500240', '石柱土家族自治县', 3, '500200', '重庆郊县', '023', '0233799');
INSERT INTO `t_sys_area` VALUES ('500241', '秀山土家族苗族自治县', 3, '500200', '重庆郊县', '023', '0233899');
INSERT INTO `t_sys_area` VALUES ('500242', '酉阳土家族苗族自治县', 3, '500200', '重庆郊县', '023', '0233999');
INSERT INTO `t_sys_area` VALUES ('500243', '彭水苗族土家族自治县', 3, '500200', '重庆郊县', '023', '0234099');
INSERT INTO `t_sys_area` VALUES ('510000', '四川省', 1, '000000', '中华人民共和国', NULL, NULL);
INSERT INTO `t_sys_area` VALUES ('510100', '成都市', 2, '510000', '四川省', '028', NULL);
INSERT INTO `t_sys_area` VALUES ('510104', '锦江区', 3, '510100', '成都市', '028', '0280199');
INSERT INTO `t_sys_area` VALUES ('510105', '青羊区', 3, '510100', '成都市', '028', '0280299');
INSERT INTO `t_sys_area` VALUES ('510106', '金牛区', 3, '510100', '成都市', '028', '0280399');
INSERT INTO `t_sys_area` VALUES ('510107', '武侯区', 3, '510100', '成都市', '028', '0280499');
INSERT INTO `t_sys_area` VALUES ('510108', '成华区', 3, '510100', '成都市', '028', '0280599');
INSERT INTO `t_sys_area` VALUES ('510112', '龙泉驿区', 3, '510100', '成都市', '028', '0280699');
INSERT INTO `t_sys_area` VALUES ('510113', '青白江区', 3, '510100', '成都市', '028', '0280799');
INSERT INTO `t_sys_area` VALUES ('510114', '新都区', 3, '510100', '成都市', '028', '0280899');
INSERT INTO `t_sys_area` VALUES ('510115', '温江区', 3, '510100', '成都市', '028', '0280999');
INSERT INTO `t_sys_area` VALUES ('510116', '双流区', 3, '510100', '成都市', '028', '0281199');
INSERT INTO `t_sys_area` VALUES ('510117', '郫都区', 3, '510100', '成都市', '028', NULL);
INSERT INTO `t_sys_area` VALUES ('510121', '金堂县', 3, '510100', '成都市', '028', '0281099');
INSERT INTO `t_sys_area` VALUES ('510129', '大邑县', 3, '510100', '成都市', '028', '0281399');
INSERT INTO `t_sys_area` VALUES ('510131', '蒲江县', 3, '510100', '成都市', '028', '0281499');
INSERT INTO `t_sys_area` VALUES ('510132', '新津县', 3, '510100', '成都市', '028', '0281599');
INSERT INTO `t_sys_area` VALUES ('510181', '都江堰市', 3, '510100', '成都市', '028', '0281699');
INSERT INTO `t_sys_area` VALUES ('510182', '彭州市', 3, '510100', '成都市', '028', '0281799');
INSERT INTO `t_sys_area` VALUES ('510183', '邛崃市', 3, '510100', '成都市', '028', '0281899');
INSERT INTO `t_sys_area` VALUES ('510184', '崇州市', 3, '510100', '成都市', '028', '0281999');
INSERT INTO `t_sys_area` VALUES ('510185', '简阳市', 3, '510100', '成都市', '028', NULL);
INSERT INTO `t_sys_area` VALUES ('510300', '自贡市', 2, '510000', '四川省', '0813', NULL);
INSERT INTO `t_sys_area` VALUES ('510302', '自流井区', 3, '510300', '自贡市', '0813', '8130199');
INSERT INTO `t_sys_area` VALUES ('510303', '贡井区', 3, '510300', '自贡市', '0813', '8130299');
INSERT INTO `t_sys_area` VALUES ('510304', '大安区', 3, '510300', '自贡市', '0813', '8130399');
INSERT INTO `t_sys_area` VALUES ('510311', '沿滩区', 3, '510300', '自贡市', '0813', '8130499');
INSERT INTO `t_sys_area` VALUES ('510321', '荣县', 3, '510300', '自贡市', '0813', '8130599');
INSERT INTO `t_sys_area` VALUES ('510322', '富顺县', 3, '510300', '自贡市', '0813', '8130699');
INSERT INTO `t_sys_area` VALUES ('510400', '攀枝花市', 2, '510000', '四川省', '0812', NULL);
INSERT INTO `t_sys_area` VALUES ('510402', '东区', 3, '510400', '攀枝花市', '0812', '8120199');
INSERT INTO `t_sys_area` VALUES ('510403', '西区', 3, '510400', '攀枝花市', '0812', '8120299');
INSERT INTO `t_sys_area` VALUES ('510411', '仁和区', 3, '510400', '攀枝花市', '0812', '8120399');
INSERT INTO `t_sys_area` VALUES ('510421', '米易县', 3, '510400', '攀枝花市', '0812', '8120499');
INSERT INTO `t_sys_area` VALUES ('510422', '盐边县', 3, '510400', '攀枝花市', '0812', '8120599');
INSERT INTO `t_sys_area` VALUES ('510500', '泸州市', 2, '510000', '四川省', '0830', NULL);
INSERT INTO `t_sys_area` VALUES ('510502', '江阳区', 3, '510500', '泸州市', '0830', '8300199');
INSERT INTO `t_sys_area` VALUES ('510503', '纳溪区', 3, '510500', '泸州市', '0830', '8300299');
INSERT INTO `t_sys_area` VALUES ('510504', '龙马潭区', 3, '510500', '泸州市', '0830', '8300399');
INSERT INTO `t_sys_area` VALUES ('510521', '泸县', 3, '510500', '泸州市', '0830', '8300499');
INSERT INTO `t_sys_area` VALUES ('510522', '合江县', 3, '510500', '泸州市', '0830', '8300599');
INSERT INTO `t_sys_area` VALUES ('510524', '叙永县', 3, '510500', '泸州市', '0830', '8300699');
INSERT INTO `t_sys_area` VALUES ('510525', '古蔺县', 3, '510500', '泸州市', '0830', '8300799');
INSERT INTO `t_sys_area` VALUES ('510600', '德阳市', 2, '510000', '四川省', '0838', NULL);
INSERT INTO `t_sys_area` VALUES ('510603', '旌阳区', 3, '510600', '德阳市', '0838', '8380199');
INSERT INTO `t_sys_area` VALUES ('510623', '中江县', 3, '510600', '德阳市', '0838', '8380299');
INSERT INTO `t_sys_area` VALUES ('510626', '罗江区', 3, '510600', '德阳市', '0838', '8380399');
INSERT INTO `t_sys_area` VALUES ('510681', '广汉市', 3, '510600', '德阳市', '0838', '8380499');
INSERT INTO `t_sys_area` VALUES ('510682', '什邡市', 3, '510600', '德阳市', '0838', '8380599');
INSERT INTO `t_sys_area` VALUES ('510683', '绵竹市', 3, '510600', '德阳市', '0838', '8380699');
INSERT INTO `t_sys_area` VALUES ('510700', '绵阳市', 2, '510000', '四川省', '0816', NULL);
INSERT INTO `t_sys_area` VALUES ('510703', '涪城区', 3, '510700', '绵阳市', '0816', '8160199');
INSERT INTO `t_sys_area` VALUES ('510704', '游仙区', 3, '510700', '绵阳市', '0816', '8160299');
INSERT INTO `t_sys_area` VALUES ('510705', '安州区', 3, '510700', '绵阳市', '0816', NULL);
INSERT INTO `t_sys_area` VALUES ('510722', '三台县', 3, '510700', '绵阳市', '0816', '8160399');
INSERT INTO `t_sys_area` VALUES ('510723', '盐亭县', 3, '510700', '绵阳市', '0816', '8160499');
INSERT INTO `t_sys_area` VALUES ('510725', '梓潼县', 3, '510700', '绵阳市', '0816', '8160699');
INSERT INTO `t_sys_area` VALUES ('510726', '北川羌族自治县', 3, '510700', '绵阳市', '0816', '8160799');
INSERT INTO `t_sys_area` VALUES ('510727', '平武县', 3, '510700', '绵阳市', '0816', '8160899');
INSERT INTO `t_sys_area` VALUES ('510781', '江油市', 3, '510700', '绵阳市', '0816', '8160999');
INSERT INTO `t_sys_area` VALUES ('510800', '广元市', 2, '510000', '四川省', '0839', NULL);
INSERT INTO `t_sys_area` VALUES ('510802', '利州区', 3, '510800', '广元市', '0839', '8390199');
INSERT INTO `t_sys_area` VALUES ('510811', '昭化区', 3, '510800', '广元市', '0839', '8390299');
INSERT INTO `t_sys_area` VALUES ('510812', '朝天区', 3, '510800', '广元市', '0839', '8390399');
INSERT INTO `t_sys_area` VALUES ('510821', '旺苍县', 3, '510800', '广元市', '0839', '8390499');
INSERT INTO `t_sys_area` VALUES ('510822', '青川县', 3, '510800', '广元市', '0839', '8390599');
INSERT INTO `t_sys_area` VALUES ('510823', '剑阁县', 3, '510800', '广元市', '0839', '8390699');
INSERT INTO `t_sys_area` VALUES ('510824', '苍溪县', 3, '510800', '广元市', '0839', '8390799');
INSERT INTO `t_sys_area` VALUES ('510900', '遂宁市', 2, '510000', '四川省', '0825', NULL);
INSERT INTO `t_sys_area` VALUES ('510903', '船山区', 3, '510900', '遂宁市', '0825', '8250199');
INSERT INTO `t_sys_area` VALUES ('510904', '安居区', 3, '510900', '遂宁市', '0825', '8250299');
INSERT INTO `t_sys_area` VALUES ('510921', '蓬溪县', 3, '510900', '遂宁市', '0825', '8250399');
INSERT INTO `t_sys_area` VALUES ('510922', '射洪县', 3, '510900', '遂宁市', '0825', '8250499');
INSERT INTO `t_sys_area` VALUES ('510923', '大英县', 3, '510900', '遂宁市', '0825', '8250599');
INSERT INTO `t_sys_area` VALUES ('511000', '内江市', 2, '510000', '四川省', '1832', NULL);
INSERT INTO `t_sys_area` VALUES ('511002', '市中区', 3, '511000', '内江市', '1832', '8320199');
INSERT INTO `t_sys_area` VALUES ('511011', '东兴区', 3, '511000', '内江市', '1832', '8320299');
INSERT INTO `t_sys_area` VALUES ('511024', '威远县', 3, '511000', '内江市', '1832', '8320399');
INSERT INTO `t_sys_area` VALUES ('511025', '资中县', 3, '511000', '内江市', '1832', '8320499');
INSERT INTO `t_sys_area` VALUES ('511083', '隆昌市', 3, '511000', '内江市', '1832', NULL);
INSERT INTO `t_sys_area` VALUES ('511100', '乐山市', 2, '510000', '四川省', '0833', NULL);
INSERT INTO `t_sys_area` VALUES ('511102', '市中区', 3, '511100', '乐山市', '0833', '8410199');
INSERT INTO `t_sys_area` VALUES ('511111', '沙湾区', 3, '511100', '乐山市', '0833', '8410299');
INSERT INTO `t_sys_area` VALUES ('511112', '五通桥区', 3, '511100', '乐山市', '0833', '8410399');
INSERT INTO `t_sys_area` VALUES ('511113', '金口河区', 3, '511100', '乐山市', '0833', '8410499');
INSERT INTO `t_sys_area` VALUES ('511123', '犍为县', 3, '511100', '乐山市', '0833', '8410599');
INSERT INTO `t_sys_area` VALUES ('511124', '井研县', 3, '511100', '乐山市', '0833', '8410699');
INSERT INTO `t_sys_area` VALUES ('511126', '夹江县', 3, '511100', '乐山市', '0833', '8410799');
INSERT INTO `t_sys_area` VALUES ('511129', '沐川县', 3, '511100', '乐山市', '0833', '8410899');
INSERT INTO `t_sys_area` VALUES ('511132', '峨边彝族自治县', 3, '511100', '乐山市', '0833', '8410999');
INSERT INTO `t_sys_area` VALUES ('511133', '马边彝族自治县', 3, '511100', '乐山市', '0833', '8411099');
INSERT INTO `t_sys_area` VALUES ('511181', '峨眉山市', 3, '511100', '乐山市', '0833', '8411199');
INSERT INTO `t_sys_area` VALUES ('511300', '南充市', 2, '510000', '四川省', '0817', NULL);
INSERT INTO `t_sys_area` VALUES ('511302', '顺庆区', 3, '511300', '南充市', '0817', '8170199');
INSERT INTO `t_sys_area` VALUES ('511303', '高坪区', 3, '511300', '南充市', '0817', '8170299');
INSERT INTO `t_sys_area` VALUES ('511304', '嘉陵区', 3, '511300', '南充市', '0817', '8170399');
INSERT INTO `t_sys_area` VALUES ('511321', '南部县', 3, '511300', '南充市', '0817', '8170499');
INSERT INTO `t_sys_area` VALUES ('511322', '营山县', 3, '511300', '南充市', '0817', '8170599');
INSERT INTO `t_sys_area` VALUES ('511323', '蓬安县', 3, '511300', '南充市', '0817', '8170699');
INSERT INTO `t_sys_area` VALUES ('511324', '仪陇县', 3, '511300', '南充市', '0817', '8170799');
INSERT INTO `t_sys_area` VALUES ('511325', '西充县', 3, '511300', '南充市', '0817', '8170899');
INSERT INTO `t_sys_area` VALUES ('511381', '阆中市', 3, '511300', '南充市', '0817', '8170999');
INSERT INTO `t_sys_area` VALUES ('511400', '眉山市', 2, '510000', '四川省', '1833', NULL);
INSERT INTO `t_sys_area` VALUES ('511402', '东坡区', 3, '511400', '眉山市', '1833', '8331299');
INSERT INTO `t_sys_area` VALUES ('511403', '彭山区', 3, '511400', '眉山市', '1833', '8331499');
INSERT INTO `t_sys_area` VALUES ('511421', '仁寿县', 3, '511400', '眉山市', '1833', '8331399');
INSERT INTO `t_sys_area` VALUES ('511423', '洪雅县', 3, '511400', '眉山市', '1833', '8331599');
INSERT INTO `t_sys_area` VALUES ('511424', '丹棱县', 3, '511400', '眉山市', '1833', '8331699');
INSERT INTO `t_sys_area` VALUES ('511425', '青神县', 3, '511400', '眉山市', '1833', '8331799');
INSERT INTO `t_sys_area` VALUES ('511500', '宜宾市', 2, '510000', '四川省', '0831', NULL);
INSERT INTO `t_sys_area` VALUES ('511502', '翠屏区', 3, '511500', '宜宾市', '0831', '8310199');
INSERT INTO `t_sys_area` VALUES ('511503', '南溪区', 3, '511500', '宜宾市', '0831', '8310399');
INSERT INTO `t_sys_area` VALUES ('511521', '宜宾县', 3, '511500', '宜宾市', '0831', '8310299');
INSERT INTO `t_sys_area` VALUES ('511523', '江安县', 3, '511500', '宜宾市', '0831', '8310499');
INSERT INTO `t_sys_area` VALUES ('511524', '长宁县', 3, '511500', '宜宾市', '0831', '8310599');
INSERT INTO `t_sys_area` VALUES ('511525', '高县', 3, '511500', '宜宾市', '0831', '8310699');
INSERT INTO `t_sys_area` VALUES ('511526', '珙县', 3, '511500', '宜宾市', '0831', '8310799');
INSERT INTO `t_sys_area` VALUES ('511527', '筠连县', 3, '511500', '宜宾市', '0831', '8310899');
INSERT INTO `t_sys_area` VALUES ('511528', '兴文县', 3, '511500', '宜宾市', '0831', '8310999');
INSERT INTO `t_sys_area` VALUES ('511529', '屏山县', 3, '511500', '宜宾市', '0831', '8311099');
INSERT INTO `t_sys_area` VALUES ('511600', '广安市', 2, '510000', '四川省', '0826', NULL);
INSERT INTO `t_sys_area` VALUES ('511602', '广安区', 3, '511600', '广安市', '0826', '8260199');
INSERT INTO `t_sys_area` VALUES ('511603', '前锋区', 3, '511600', '广安市', '0826', NULL);
INSERT INTO `t_sys_area` VALUES ('511621', '岳池县', 3, '511600', '广安市', '0826', '8260299');
INSERT INTO `t_sys_area` VALUES ('511622', '武胜县', 3, '511600', '广安市', '0826', '8260399');
INSERT INTO `t_sys_area` VALUES ('511623', '邻水县', 3, '511600', '广安市', '0826', '8260499');
INSERT INTO `t_sys_area` VALUES ('511681', '华蓥市', 3, '511600', '广安市', '0826', '8260599');
INSERT INTO `t_sys_area` VALUES ('511700', '达州市', 2, '510000', '四川省', '0818', NULL);
INSERT INTO `t_sys_area` VALUES ('511702', '通川区', 3, '511700', '达州市', '0818', '8180299');
INSERT INTO `t_sys_area` VALUES ('511703', '达川区', 3, '511700', '达州市', '0818', NULL);
INSERT INTO `t_sys_area` VALUES ('511722', '宣汉县', 3, '511700', '达州市', '0818', '8180399');
INSERT INTO `t_sys_area` VALUES ('511723', '开江县', 3, '511700', '达州市', '0818', '8180499');
INSERT INTO `t_sys_area` VALUES ('511724', '大竹县', 3, '511700', '达州市', '0818', '8180599');
INSERT INTO `t_sys_area` VALUES ('511725', '渠县', 3, '511700', '达州市', '0818', '8180699');
INSERT INTO `t_sys_area` VALUES ('511781', '万源市', 3, '511700', '达州市', '0818', '8180799');
INSERT INTO `t_sys_area` VALUES ('511800', '雅安市', 2, '510000', '四川省', '0835', NULL);
INSERT INTO `t_sys_area` VALUES ('511802', '雨城区', 3, '511800', '雅安市', '0835', '8350299');
INSERT INTO `t_sys_area` VALUES ('511803', '名山区', 3, '511800', '雅安市', '0835', NULL);
INSERT INTO `t_sys_area` VALUES ('511822', '荥经县', 3, '511800', '雅安市', '0835', '8350399');
INSERT INTO `t_sys_area` VALUES ('511823', '汉源县', 3, '511800', '雅安市', '0835', '8350499');
INSERT INTO `t_sys_area` VALUES ('511824', '石棉县', 3, '511800', '雅安市', '0835', '8350599');
INSERT INTO `t_sys_area` VALUES ('511825', '天全县', 3, '511800', '雅安市', '0835', '8350699');
INSERT INTO `t_sys_area` VALUES ('511826', '芦山县', 3, '511800', '雅安市', '0835', '8350799');
INSERT INTO `t_sys_area` VALUES ('511827', '宝兴县', 3, '511800', '雅安市', '0835', '8350899');
INSERT INTO `t_sys_area` VALUES ('511900', '巴中市', 2, '510000', '四川省', '0827', NULL);
INSERT INTO `t_sys_area` VALUES ('511902', '巴州区', 3, '511900', '巴中市', '0827', '8270199');
INSERT INTO `t_sys_area` VALUES ('511903', '恩阳区', 3, '511900', '巴中市', '0827', NULL);
INSERT INTO `t_sys_area` VALUES ('511921', '通江县', 3, '511900', '巴中市', '0827', '8270299');
INSERT INTO `t_sys_area` VALUES ('511922', '南江县', 3, '511900', '巴中市', '0827', '8270399');
INSERT INTO `t_sys_area` VALUES ('511923', '平昌县', 3, '511900', '巴中市', '0827', '8270499');
INSERT INTO `t_sys_area` VALUES ('512000', '资阳市', 2, '510000', '四川省', '0832', NULL);
INSERT INTO `t_sys_area` VALUES ('512002', '雁江区', 3, '512000', '资阳市', '0832', '8400199');
INSERT INTO `t_sys_area` VALUES ('512021', '安岳县', 3, '512000', '资阳市', '0832', '8400299');
INSERT INTO `t_sys_area` VALUES ('512022', '乐至县', 3, '512000', '资阳市', '0832', '8400399');
INSERT INTO `t_sys_area` VALUES ('513200', '阿坝藏族羌族自治州', 2, '510000', '四川省', '0837', NULL);
INSERT INTO `t_sys_area` VALUES ('513201', '马尔康市', 3, '513200', '阿坝藏族羌族自治州', '0837', '8370999');
INSERT INTO `t_sys_area` VALUES ('513221', '汶川县', 3, '513200', '阿坝藏族羌族自治州', '0837', '8370199');
INSERT INTO `t_sys_area` VALUES ('513222', '理县', 3, '513200', '阿坝藏族羌族自治州', '0837', '8370299');
INSERT INTO `t_sys_area` VALUES ('513223', '茂县', 3, '513200', '阿坝藏族羌族自治州', '0837', '8370399');
INSERT INTO `t_sys_area` VALUES ('513224', '松潘县', 3, '513200', '阿坝藏族羌族自治州', '0837', '8370499');
INSERT INTO `t_sys_area` VALUES ('513225', '九寨沟县', 3, '513200', '阿坝藏族羌族自治州', '0837', '8370599');
INSERT INTO `t_sys_area` VALUES ('513226', '金川县', 3, '513200', '阿坝藏族羌族自治州', '0837', '8370699');
INSERT INTO `t_sys_area` VALUES ('513227', '小金县', 3, '513200', '阿坝藏族羌族自治州', '0837', '8370799');
INSERT INTO `t_sys_area` VALUES ('513228', '黑水县', 3, '513200', '阿坝藏族羌族自治州', '0837', '8370899');
INSERT INTO `t_sys_area` VALUES ('513230', '壤塘县', 3, '513200', '阿坝藏族羌族自治州', '0837', '8371099');
INSERT INTO `t_sys_area` VALUES ('513231', '阿坝县', 3, '513200', '阿坝藏族羌族自治州', '0837', '8371199');
INSERT INTO `t_sys_area` VALUES ('513232', '若尔盖县', 3, '513200', '阿坝藏族羌族自治州', '0837', '8371299');
INSERT INTO `t_sys_area` VALUES ('513233', '红原县', 3, '513200', '阿坝藏族羌族自治州', '0837', '8371399');
INSERT INTO `t_sys_area` VALUES ('513300', '甘孜藏族自治州', 2, '510000', '四川省', '0836', NULL);
INSERT INTO `t_sys_area` VALUES ('513301', '康定市', 3, '513300', '甘孜藏族自治州', '0836', '8360199');
INSERT INTO `t_sys_area` VALUES ('513322', '泸定县', 3, '513300', '甘孜藏族自治州', '0836', '8360299');
INSERT INTO `t_sys_area` VALUES ('513323', '丹巴县', 3, '513300', '甘孜藏族自治州', '0836', '8360399');
INSERT INTO `t_sys_area` VALUES ('513324', '九龙县', 3, '513300', '甘孜藏族自治州', '0836', '8360499');
INSERT INTO `t_sys_area` VALUES ('513325', '雅江县', 3, '513300', '甘孜藏族自治州', '0836', '8360599');
INSERT INTO `t_sys_area` VALUES ('513326', '道孚县', 3, '513300', '甘孜藏族自治州', '0836', '8360699');
INSERT INTO `t_sys_area` VALUES ('513327', '炉霍县', 3, '513300', '甘孜藏族自治州', '0836', '8360799');
INSERT INTO `t_sys_area` VALUES ('513328', '甘孜县', 3, '513300', '甘孜藏族自治州', '0836', '8360899');
INSERT INTO `t_sys_area` VALUES ('513329', '新龙县', 3, '513300', '甘孜藏族自治州', '0836', '8360999');
INSERT INTO `t_sys_area` VALUES ('513330', '德格县', 3, '513300', '甘孜藏族自治州', '0836', '8361099');
INSERT INTO `t_sys_area` VALUES ('513331', '白玉县', 3, '513300', '甘孜藏族自治州', '0836', '8361199');
INSERT INTO `t_sys_area` VALUES ('513332', '石渠县', 3, '513300', '甘孜藏族自治州', '0836', '8361299');
INSERT INTO `t_sys_area` VALUES ('513333', '色达县', 3, '513300', '甘孜藏族自治州', '0836', '8361399');
INSERT INTO `t_sys_area` VALUES ('513334', '理塘县', 3, '513300', '甘孜藏族自治州', '0836', '8361499');
INSERT INTO `t_sys_area` VALUES ('513335', '巴塘县', 3, '513300', '甘孜藏族自治州', '0836', '8361599');
INSERT INTO `t_sys_area` VALUES ('513336', '乡城县', 3, '513300', '甘孜藏族自治州', '0836', '8361699');
INSERT INTO `t_sys_area` VALUES ('513337', '稻城县', 3, '513300', '甘孜藏族自治州', '0836', '8361799');
INSERT INTO `t_sys_area` VALUES ('513338', '得荣县', 3, '513300', '甘孜藏族自治州', '0836', '8361899');
INSERT INTO `t_sys_area` VALUES ('513400', '凉山彝族自治州', 2, '510000', '四川省', '0834', NULL);
INSERT INTO `t_sys_area` VALUES ('513401', '西昌市', 3, '513400', '凉山彝族自治州', '0834', '8340199');
INSERT INTO `t_sys_area` VALUES ('513422', '木里藏族自治县', 3, '513400', '凉山彝族自治州', '0834', '8340299');
INSERT INTO `t_sys_area` VALUES ('513423', '盐源县', 3, '513400', '凉山彝族自治州', '0834', '8340399');
INSERT INTO `t_sys_area` VALUES ('513424', '德昌县', 3, '513400', '凉山彝族自治州', '0834', '8340499');
INSERT INTO `t_sys_area` VALUES ('513425', '会理县', 3, '513400', '凉山彝族自治州', '0834', '8340599');
INSERT INTO `t_sys_area` VALUES ('513426', '会东县', 3, '513400', '凉山彝族自治州', '0834', '8340699');
INSERT INTO `t_sys_area` VALUES ('513427', '宁南县', 3, '513400', '凉山彝族自治州', '0834', '8340799');
INSERT INTO `t_sys_area` VALUES ('513428', '普格县', 3, '513400', '凉山彝族自治州', '0834', '8340899');
INSERT INTO `t_sys_area` VALUES ('513429', '布拖县', 3, '513400', '凉山彝族自治州', '0834', '8340999');
INSERT INTO `t_sys_area` VALUES ('513430', '金阳县', 3, '513400', '凉山彝族自治州', '0834', '8341099');
INSERT INTO `t_sys_area` VALUES ('513431', '昭觉县', 3, '513400', '凉山彝族自治州', '0834', '8341199');
INSERT INTO `t_sys_area` VALUES ('513432', '喜德县', 3, '513400', '凉山彝族自治州', '0834', '8341299');
INSERT INTO `t_sys_area` VALUES ('513433', '冕宁县', 3, '513400', '凉山彝族自治州', '0834', '8341399');
INSERT INTO `t_sys_area` VALUES ('513434', '越西县', 3, '513400', '凉山彝族自治州', '0834', '8341499');
INSERT INTO `t_sys_area` VALUES ('513435', '甘洛县', 3, '513400', '凉山彝族自治州', '0834', '8341599');
INSERT INTO `t_sys_area` VALUES ('513436', '美姑县', 3, '513400', '凉山彝族自治州', '0834', '8341699');
INSERT INTO `t_sys_area` VALUES ('513437', '雷波县', 3, '513400', '凉山彝族自治州', '0834', '8341799');
INSERT INTO `t_sys_area` VALUES ('520000', '贵州省', 1, '000000', '中华人民共和国', NULL, NULL);
INSERT INTO `t_sys_area` VALUES ('520100', '贵阳市', 2, '520000', '贵州省', '0851', NULL);
INSERT INTO `t_sys_area` VALUES ('520102', '南明区', 3, '520100', '贵阳市', '0851', '8510199');
INSERT INTO `t_sys_area` VALUES ('520103', '云岩区', 3, '520100', '贵阳市', '0851', '8510299');
INSERT INTO `t_sys_area` VALUES ('520111', '花溪区', 3, '520100', '贵阳市', '0851', '8510399');
INSERT INTO `t_sys_area` VALUES ('520112', '乌当区', 3, '520100', '贵阳市', '0851', '8510499');
INSERT INTO `t_sys_area` VALUES ('520113', '白云区', 3, '520100', '贵阳市', '0851', '8510699');
INSERT INTO `t_sys_area` VALUES ('520115', '观山湖区', 3, '520100', '贵阳市', '0851', NULL);
INSERT INTO `t_sys_area` VALUES ('520121', '开阳县', 3, '520100', '贵阳市', '0851', '8510799');
INSERT INTO `t_sys_area` VALUES ('520122', '息烽县', 3, '520100', '贵阳市', '0851', '8510899');
INSERT INTO `t_sys_area` VALUES ('520123', '修文县', 3, '520100', '贵阳市', '0851', '8510999');
INSERT INTO `t_sys_area` VALUES ('520181', '清镇市', 3, '520100', '贵阳市', '0851', '8511099');
INSERT INTO `t_sys_area` VALUES ('520200', '六盘水市', 2, '520000', '贵州省', '0858', NULL);
INSERT INTO `t_sys_area` VALUES ('520201', '钟山区', 3, '520200', '六盘水市', '0858', '8580199');
INSERT INTO `t_sys_area` VALUES ('520203', '六枝特区', 3, '520200', '六盘水市', '0858', '8580299');
INSERT INTO `t_sys_area` VALUES ('520221', '水城县', 3, '520200', '六盘水市', '0858', '8580399');
INSERT INTO `t_sys_area` VALUES ('520281', '盘州市', 3, '520200', '六盘水市', '0858', NULL);
INSERT INTO `t_sys_area` VALUES ('520300', '遵义市', 2, '520000', '贵州省', '0852', NULL);
INSERT INTO `t_sys_area` VALUES ('520302', '红花岗区', 3, '520300', '遵义市', '0852', '8520199');
INSERT INTO `t_sys_area` VALUES ('520303', '汇川区', 3, '520300', '遵义市', '0852', '8520299');
INSERT INTO `t_sys_area` VALUES ('520304', '播州区', 3, '520300', '遵义市', '0852', NULL);
INSERT INTO `t_sys_area` VALUES ('520322', '桐梓县', 3, '520300', '遵义市', '0852', '8520499');
INSERT INTO `t_sys_area` VALUES ('520323', '绥阳县', 3, '520300', '遵义市', '0852', '8520599');
INSERT INTO `t_sys_area` VALUES ('520324', '正安县', 3, '520300', '遵义市', '0852', '8520699');
INSERT INTO `t_sys_area` VALUES ('520325', '道真仡佬族苗族自治县', 3, '520300', '遵义市', '0852', '8520799');
INSERT INTO `t_sys_area` VALUES ('520326', '务川仡佬族苗族自治县', 3, '520300', '遵义市', '0852', '8520899');
INSERT INTO `t_sys_area` VALUES ('520327', '凤冈县', 3, '520300', '遵义市', '0852', '8520999');
INSERT INTO `t_sys_area` VALUES ('520328', '湄潭县', 3, '520300', '遵义市', '0852', '8521099');
INSERT INTO `t_sys_area` VALUES ('520329', '余庆县', 3, '520300', '遵义市', '0852', '8521199');
INSERT INTO `t_sys_area` VALUES ('520330', '习水县', 3, '520300', '遵义市', '0852', '8521299');
INSERT INTO `t_sys_area` VALUES ('520381', '赤水市', 3, '520300', '遵义市', '0852', '8521399');
INSERT INTO `t_sys_area` VALUES ('520382', '仁怀市', 3, '520300', '遵义市', '0852', '8521499');
INSERT INTO `t_sys_area` VALUES ('520400', '安顺市', 2, '520000', '贵州省', '0853', NULL);
INSERT INTO `t_sys_area` VALUES ('520402', '西秀区', 3, '520400', '安顺市', '0853', '8530199');
INSERT INTO `t_sys_area` VALUES ('520403', '平坝区', 3, '520400', '安顺市', '0853', '8530299');
INSERT INTO `t_sys_area` VALUES ('520422', '普定县', 3, '520400', '安顺市', '0853', '8530399');
INSERT INTO `t_sys_area` VALUES ('520423', '镇宁布依族苗族自治县', 3, '520400', '安顺市', '0853', '8530499');
INSERT INTO `t_sys_area` VALUES ('520424', '关岭布依族苗族自治县', 3, '520400', '安顺市', '0853', '8530599');
INSERT INTO `t_sys_area` VALUES ('520425', '紫云苗族布依族自治县', 3, '520400', '安顺市', '0853', '8530699');
INSERT INTO `t_sys_area` VALUES ('520500', '毕节市', 2, '520000', '贵州省', '0857', NULL);
INSERT INTO `t_sys_area` VALUES ('520502', '七星关区', 3, '520500', '毕节市', '0857', '8570199');
INSERT INTO `t_sys_area` VALUES ('520521', '大方县', 3, '520500', '毕节市', '0857', '8570299');
INSERT INTO `t_sys_area` VALUES ('520522', '黔西县', 3, '520500', '毕节市', '0857', '8570399');
INSERT INTO `t_sys_area` VALUES ('520523', '金沙县', 3, '520500', '毕节市', '0857', '8570499');
INSERT INTO `t_sys_area` VALUES ('520524', '织金县', 3, '520500', '毕节市', '0857', '8570599');
INSERT INTO `t_sys_area` VALUES ('520525', '纳雍县', 3, '520500', '毕节市', '0857', '8570699');
INSERT INTO `t_sys_area` VALUES ('520526', '威宁彝族回族苗族自治县', 3, '520500', '毕节市', '0857', '8570799');
INSERT INTO `t_sys_area` VALUES ('520527', '赫章县', 3, '520500', '毕节市', '0857', '8570899');
INSERT INTO `t_sys_area` VALUES ('520600', '铜仁市', 2, '520000', '贵州省', '0856', NULL);
INSERT INTO `t_sys_area` VALUES ('520602', '碧江区', 3, '520600', '铜仁市', '0856', '8560199');
INSERT INTO `t_sys_area` VALUES ('520603', '万山区', 3, '520600', '铜仁市', '0856', '8561099');
INSERT INTO `t_sys_area` VALUES ('520621', '江口县', 3, '520600', '铜仁市', '0856', '8560299');
INSERT INTO `t_sys_area` VALUES ('520622', '玉屏侗族自治县', 3, '520600', '铜仁市', '0856', '8560399');
INSERT INTO `t_sys_area` VALUES ('520623', '石阡县', 3, '520600', '铜仁市', '0856', '8560499');
INSERT INTO `t_sys_area` VALUES ('520624', '思南县', 3, '520600', '铜仁市', '0856', '8560599');
INSERT INTO `t_sys_area` VALUES ('520625', '印江土家族苗族自治县', 3, '520600', '铜仁市', '0856', '8560699');
INSERT INTO `t_sys_area` VALUES ('520626', '德江县', 3, '520600', '铜仁市', '0856', '8560799');
INSERT INTO `t_sys_area` VALUES ('520627', '沿河土家族自治县', 3, '520600', '铜仁市', '0856', '8560899');
INSERT INTO `t_sys_area` VALUES ('520628', '松桃苗族自治县', 3, '520600', '铜仁市', '0856', '8560999');
INSERT INTO `t_sys_area` VALUES ('522300', '黔西南布依族苗族自治州', 2, '520000', '贵州省', '0859', NULL);
INSERT INTO `t_sys_area` VALUES ('522301', '兴义市', 3, '522300', '黔西南布依族苗族自治州', '0859', '8590199');
INSERT INTO `t_sys_area` VALUES ('522322', '兴仁县', 3, '522300', '黔西南布依族苗族自治州', '0859', '8590299');
INSERT INTO `t_sys_area` VALUES ('522323', '普安县', 3, '522300', '黔西南布依族苗族自治州', '0859', '8590399');
INSERT INTO `t_sys_area` VALUES ('522324', '晴隆县', 3, '522300', '黔西南布依族苗族自治州', '0859', '8590499');
INSERT INTO `t_sys_area` VALUES ('522325', '贞丰县', 3, '522300', '黔西南布依族苗族自治州', '0859', '8590599');
INSERT INTO `t_sys_area` VALUES ('522326', '望谟县', 3, '522300', '黔西南布依族苗族自治州', '0859', '8590699');
INSERT INTO `t_sys_area` VALUES ('522327', '册亨县', 3, '522300', '黔西南布依族苗族自治州', '0859', '8590799');
INSERT INTO `t_sys_area` VALUES ('522328', '安龙县', 3, '522300', '黔西南布依族苗族自治州', '0859', '8590899');
INSERT INTO `t_sys_area` VALUES ('522600', '黔东南苗族侗族自治州', 2, '520000', '贵州省', '0855', NULL);
INSERT INTO `t_sys_area` VALUES ('522601', '凯里市', 3, '522600', '黔东南苗族侗族自治州', '0855', '8550199');
INSERT INTO `t_sys_area` VALUES ('522622', '黄平县', 3, '522600', '黔东南苗族侗族自治州', '0855', '8550299');
INSERT INTO `t_sys_area` VALUES ('522623', '施秉县', 3, '522600', '黔东南苗族侗族自治州', '0855', '8550399');
INSERT INTO `t_sys_area` VALUES ('522624', '三穗县', 3, '522600', '黔东南苗族侗族自治州', '0855', '8550499');
INSERT INTO `t_sys_area` VALUES ('522625', '镇远县', 3, '522600', '黔东南苗族侗族自治州', '0855', '8550599');
INSERT INTO `t_sys_area` VALUES ('522626', '岑巩县', 3, '522600', '黔东南苗族侗族自治州', '0855', '8550699');
INSERT INTO `t_sys_area` VALUES ('522627', '天柱县', 3, '522600', '黔东南苗族侗族自治州', '0855', '8550799');
INSERT INTO `t_sys_area` VALUES ('522628', '锦屏县', 3, '522600', '黔东南苗族侗族自治州', '0855', '8550899');
INSERT INTO `t_sys_area` VALUES ('522629', '剑河县', 3, '522600', '黔东南苗族侗族自治州', '0855', '8550999');
INSERT INTO `t_sys_area` VALUES ('522630', '台江县', 3, '522600', '黔东南苗族侗族自治州', '0855', '8551099');
INSERT INTO `t_sys_area` VALUES ('522631', '黎平县', 3, '522600', '黔东南苗族侗族自治州', '0855', '8551199');
INSERT INTO `t_sys_area` VALUES ('522632', '榕江县', 3, '522600', '黔东南苗族侗族自治州', '0855', '8551299');
INSERT INTO `t_sys_area` VALUES ('522633', '从江县', 3, '522600', '黔东南苗族侗族自治州', '0855', '8551399');
INSERT INTO `t_sys_area` VALUES ('522634', '雷山县', 3, '522600', '黔东南苗族侗族自治州', '0855', '8551499');
INSERT INTO `t_sys_area` VALUES ('522635', '麻江县', 3, '522600', '黔东南苗族侗族自治州', '0855', '8551599');
INSERT INTO `t_sys_area` VALUES ('522636', '丹寨县', 3, '522600', '黔东南苗族侗族自治州', '0855', '8551699');
INSERT INTO `t_sys_area` VALUES ('522700', '黔南布依族苗族自治州', 2, '520000', '贵州省', '0854', NULL);
INSERT INTO `t_sys_area` VALUES ('522701', '都匀市', 3, '522700', '黔南布依族苗族自治州', '0854', '8540199');
INSERT INTO `t_sys_area` VALUES ('522702', '福泉市', 3, '522700', '黔南布依族苗族自治州', '0854', '8540299');
INSERT INTO `t_sys_area` VALUES ('522722', '荔波县', 3, '522700', '黔南布依族苗族自治州', '0854', '8540399');
INSERT INTO `t_sys_area` VALUES ('522723', '贵定县', 3, '522700', '黔南布依族苗族自治州', '0854', '8540499');
INSERT INTO `t_sys_area` VALUES ('522725', '瓮安县', 3, '522700', '黔南布依族苗族自治州', '0854', '8540599');
INSERT INTO `t_sys_area` VALUES ('522726', '独山县', 3, '522700', '黔南布依族苗族自治州', '0854', '8540699');
INSERT INTO `t_sys_area` VALUES ('522727', '平塘县', 3, '522700', '黔南布依族苗族自治州', '0854', '8540799');
INSERT INTO `t_sys_area` VALUES ('522728', '罗甸县', 3, '522700', '黔南布依族苗族自治州', '0854', '8540899');
INSERT INTO `t_sys_area` VALUES ('522729', '长顺县', 3, '522700', '黔南布依族苗族自治州', '0854', '8540999');
INSERT INTO `t_sys_area` VALUES ('522730', '龙里县', 3, '522700', '黔南布依族苗族自治州', '0854', '8541099');
INSERT INTO `t_sys_area` VALUES ('522731', '惠水县', 3, '522700', '黔南布依族苗族自治州', '0854', '8541199');
INSERT INTO `t_sys_area` VALUES ('522732', '三都水族自治县', 3, '522700', '黔南布依族苗族自治州', '0854', '8541299');
INSERT INTO `t_sys_area` VALUES ('530000', '云南省', 1, '000000', '中华人民共和国', NULL, NULL);
INSERT INTO `t_sys_area` VALUES ('530100', '昆明市', 2, '530000', '云南省', '0871', NULL);
INSERT INTO `t_sys_area` VALUES ('530102', '五华区', 3, '530100', '昆明市', '0871', '8710199');
INSERT INTO `t_sys_area` VALUES ('530103', '盘龙区', 3, '530100', '昆明市', '0871', '8710299');
INSERT INTO `t_sys_area` VALUES ('530111', '官渡区', 3, '530100', '昆明市', '0871', '8710399');
INSERT INTO `t_sys_area` VALUES ('530112', '西山区', 3, '530100', '昆明市', '0871', '8710499');
INSERT INTO `t_sys_area` VALUES ('530113', '东川区', 3, '530100', '昆明市', '0871', '8710599');
INSERT INTO `t_sys_area` VALUES ('530114', '呈贡区', 3, '530100', '昆明市', '0871', '8710699');
INSERT INTO `t_sys_area` VALUES ('530115', '晋宁区', 3, '530100', '昆明市', '0871', NULL);
INSERT INTO `t_sys_area` VALUES ('530124', '富民县', 3, '530100', '昆明市', '0871', '8710899');
INSERT INTO `t_sys_area` VALUES ('530125', '宜良县', 3, '530100', '昆明市', '0871', '8710999');
INSERT INTO `t_sys_area` VALUES ('530126', '石林彝族自治县', 3, '530100', '昆明市', '0871', '8711099');
INSERT INTO `t_sys_area` VALUES ('530127', '嵩明县', 3, '530100', '昆明市', '0871', '8711199');
INSERT INTO `t_sys_area` VALUES ('530128', '禄劝彝族苗族自治县', 3, '530100', '昆明市', '0871', '8711299');
INSERT INTO `t_sys_area` VALUES ('530129', '寻甸回族彝族自治县', 3, '530100', '昆明市', '0871', '8711399');
INSERT INTO `t_sys_area` VALUES ('530181', '安宁市', 3, '530100', '昆明市', '0871', '8711499');
INSERT INTO `t_sys_area` VALUES ('530300', '曲靖市', 2, '530000', '云南省', '0874', NULL);
INSERT INTO `t_sys_area` VALUES ('530302', '麒麟区', 3, '530300', '曲靖市', '0874', '8740199');
INSERT INTO `t_sys_area` VALUES ('530303', '沾益区', 3, '530300', '曲靖市', '0874', NULL);
INSERT INTO `t_sys_area` VALUES ('530321', '马龙县', 3, '530300', '曲靖市', '0874', '8740299');
INSERT INTO `t_sys_area` VALUES ('530322', '陆良县', 3, '530300', '曲靖市', '0874', '8740399');
INSERT INTO `t_sys_area` VALUES ('530323', '师宗县', 3, '530300', '曲靖市', '0874', '8740499');
INSERT INTO `t_sys_area` VALUES ('530324', '罗平县', 3, '530300', '曲靖市', '0874', '8740599');
INSERT INTO `t_sys_area` VALUES ('530325', '富源县', 3, '530300', '曲靖市', '0874', '8740699');
INSERT INTO `t_sys_area` VALUES ('530326', '会泽县', 3, '530300', '曲靖市', '0874', '8740799');
INSERT INTO `t_sys_area` VALUES ('530381', '宣威市', 3, '530300', '曲靖市', '0874', '8740999');
INSERT INTO `t_sys_area` VALUES ('530400', '玉溪市', 2, '530000', '云南省', '0877', NULL);
INSERT INTO `t_sys_area` VALUES ('530402', '红塔区', 3, '530400', '玉溪市', '0877', '8770199');
INSERT INTO `t_sys_area` VALUES ('530403', '江川区', 3, '530400', '玉溪市', '0877', NULL);
INSERT INTO `t_sys_area` VALUES ('530422', '澄江县', 3, '530400', '玉溪市', '0877', '8770399');
INSERT INTO `t_sys_area` VALUES ('530423', '通海县', 3, '530400', '玉溪市', '0877', '8770499');
INSERT INTO `t_sys_area` VALUES ('530424', '华宁县', 3, '530400', '玉溪市', '0877', '8770599');
INSERT INTO `t_sys_area` VALUES ('530425', '易门县', 3, '530400', '玉溪市', '0877', '8770699');
INSERT INTO `t_sys_area` VALUES ('530426', '峨山彝族自治县', 3, '530400', '玉溪市', '0877', '8770799');
INSERT INTO `t_sys_area` VALUES ('530427', '新平彝族傣族自治县', 3, '530400', '玉溪市', '0877', '8770899');
INSERT INTO `t_sys_area` VALUES ('530428', '元江哈尼族彝族傣族自治县', 3, '530400', '玉溪市', '0877', '8770999');
INSERT INTO `t_sys_area` VALUES ('530500', '保山市', 2, '530000', '云南省', '0875', NULL);
INSERT INTO `t_sys_area` VALUES ('530502', '隆阳区', 3, '530500', '保山市', '0875', '8750199');
INSERT INTO `t_sys_area` VALUES ('530521', '施甸县', 3, '530500', '保山市', '0875', '8750299');
INSERT INTO `t_sys_area` VALUES ('530523', '龙陵县', 3, '530500', '保山市', '0875', '8750499');
INSERT INTO `t_sys_area` VALUES ('530524', '昌宁县', 3, '530500', '保山市', '0875', '8750599');
INSERT INTO `t_sys_area` VALUES ('530581', '腾冲市', 3, '530500', '保山市', '0875', '8750399');
INSERT INTO `t_sys_area` VALUES ('530600', '昭通市', 2, '530000', '云南省', '0870', NULL);
INSERT INTO `t_sys_area` VALUES ('530602', '昭阳区', 3, '530600', '昭通市', '0870', '8700199');
INSERT INTO `t_sys_area` VALUES ('530621', '鲁甸县', 3, '530600', '昭通市', '0870', '8700299');
INSERT INTO `t_sys_area` VALUES ('530622', '巧家县', 3, '530600', '昭通市', '0870', '8700399');
INSERT INTO `t_sys_area` VALUES ('530623', '盐津县', 3, '530600', '昭通市', '0870', '8700499');
INSERT INTO `t_sys_area` VALUES ('530624', '大关县', 3, '530600', '昭通市', '0870', '8700599');
INSERT INTO `t_sys_area` VALUES ('530625', '永善县', 3, '530600', '昭通市', '0870', '8700699');
INSERT INTO `t_sys_area` VALUES ('530626', '绥江县', 3, '530600', '昭通市', '0870', '8700799');
INSERT INTO `t_sys_area` VALUES ('530627', '镇雄县', 3, '530600', '昭通市', '0870', '8700899');
INSERT INTO `t_sys_area` VALUES ('530628', '彝良县', 3, '530600', '昭通市', '0870', '8700999');
INSERT INTO `t_sys_area` VALUES ('530629', '威信县', 3, '530600', '昭通市', '0870', '8701099');
INSERT INTO `t_sys_area` VALUES ('530630', '水富县', 3, '530600', '昭通市', '0870', '8701199');
INSERT INTO `t_sys_area` VALUES ('530700', '丽江市', 2, '530000', '云南省', '0888', NULL);
INSERT INTO `t_sys_area` VALUES ('530702', '古城区', 3, '530700', '丽江市', '0888', '8880199');
INSERT INTO `t_sys_area` VALUES ('530721', '玉龙纳西族自治县', 3, '530700', '丽江市', '0888', '8880299');
INSERT INTO `t_sys_area` VALUES ('530722', '永胜县', 3, '530700', '丽江市', '0888', '8880399');
INSERT INTO `t_sys_area` VALUES ('530723', '华坪县', 3, '530700', '丽江市', '0888', '8880499');
INSERT INTO `t_sys_area` VALUES ('530724', '宁蒗彝族自治县', 3, '530700', '丽江市', '0888', '8880599');
INSERT INTO `t_sys_area` VALUES ('530800', '普洱市', 2, '530000', '云南省', '0879', NULL);
INSERT INTO `t_sys_area` VALUES ('530802', '思茅区', 3, '530800', '普洱市', '0879', '8790199');
INSERT INTO `t_sys_area` VALUES ('530821', '宁洱哈尼族彝族自治县', 3, '530800', '普洱市', '0879', '8790299');
INSERT INTO `t_sys_area` VALUES ('530822', '墨江哈尼族自治县', 3, '530800', '普洱市', '0879', '8790399');
INSERT INTO `t_sys_area` VALUES ('530823', '景东彝族自治县', 3, '530800', '普洱市', '0879', '8790499');
INSERT INTO `t_sys_area` VALUES ('530824', '景谷傣族彝族自治县', 3, '530800', '普洱市', '0879', '8790599');
INSERT INTO `t_sys_area` VALUES ('530825', '镇沅彝族哈尼族拉祜族自治县', 3, '530800', '普洱市', '0879', '8790699');
INSERT INTO `t_sys_area` VALUES ('530826', '江城哈尼族彝族自治县', 3, '530800', '普洱市', '0879', '8790799');
INSERT INTO `t_sys_area` VALUES ('530827', '孟连傣族拉祜族佤族自治县', 3, '530800', '普洱市', '0879', '8790899');
INSERT INTO `t_sys_area` VALUES ('530828', '澜沧拉祜族自治县', 3, '530800', '普洱市', '0879', '8790999');
INSERT INTO `t_sys_area` VALUES ('530829', '西盟佤族自治县', 3, '530800', '普洱市', '0879', '8791099');
INSERT INTO `t_sys_area` VALUES ('530900', '临沧市', 2, '530000', '云南省', '0883', NULL);
INSERT INTO `t_sys_area` VALUES ('530902', '临翔区', 3, '530900', '临沧市', '0883', NULL);
INSERT INTO `t_sys_area` VALUES ('530921', '凤庆县', 3, '530900', '临沧市', '0883', '8830299');
INSERT INTO `t_sys_area` VALUES ('530922', '云县', 3, '530900', '临沧市', '0883', '8830399');
INSERT INTO `t_sys_area` VALUES ('530923', '永德县', 3, '530900', '临沧市', '0883', '8830499');
INSERT INTO `t_sys_area` VALUES ('530924', '镇康县', 3, '530900', '临沧市', '0883', '8830599');
INSERT INTO `t_sys_area` VALUES ('530925', '双江拉祜族佤族布朗族傣族自治县', 3, '530900', '临沧市', '0883', '8830699');
INSERT INTO `t_sys_area` VALUES ('530926', '耿马傣族佤族自治县', 3, '530900', '临沧市', '0883', '8830799');
INSERT INTO `t_sys_area` VALUES ('530927', '沧源佤族自治县', 3, '530900', '临沧市', '0883', '8830899');
INSERT INTO `t_sys_area` VALUES ('532300', '楚雄彝族自治州', 2, '530000', '云南省', '0878', NULL);
INSERT INTO `t_sys_area` VALUES ('532301', '楚雄市', 3, '532300', '楚雄彝族自治州', '0878', '8780199');
INSERT INTO `t_sys_area` VALUES ('532322', '双柏县', 3, '532300', '楚雄彝族自治州', '0878', '8780299');
INSERT INTO `t_sys_area` VALUES ('532323', '牟定县', 3, '532300', '楚雄彝族自治州', '0878', '8780399');
INSERT INTO `t_sys_area` VALUES ('532324', '南华县', 3, '532300', '楚雄彝族自治州', '0878', '8780499');
INSERT INTO `t_sys_area` VALUES ('532325', '姚安县', 3, '532300', '楚雄彝族自治州', '0878', '8780599');
INSERT INTO `t_sys_area` VALUES ('532326', '大姚县', 3, '532300', '楚雄彝族自治州', '0878', '8780699');
INSERT INTO `t_sys_area` VALUES ('532327', '永仁县', 3, '532300', '楚雄彝族自治州', '0878', '8780799');
INSERT INTO `t_sys_area` VALUES ('532328', '元谋县', 3, '532300', '楚雄彝族自治州', '0878', '8780899');
INSERT INTO `t_sys_area` VALUES ('532329', '武定县', 3, '532300', '楚雄彝族自治州', '0878', '8780999');
INSERT INTO `t_sys_area` VALUES ('532331', '禄丰县', 3, '532300', '楚雄彝族自治州', '0878', '8781099');
INSERT INTO `t_sys_area` VALUES ('532500', '红河哈尼族彝族自治州', 2, '530000', '云南省', '0873', NULL);
INSERT INTO `t_sys_area` VALUES ('532501', '个旧市', 3, '532500', '红河哈尼族彝族自治州', '0873', '8730199');
INSERT INTO `t_sys_area` VALUES ('532502', '开远市', 3, '532500', '红河哈尼族彝族自治州', '0873', '8730299');
INSERT INTO `t_sys_area` VALUES ('532503', '蒙自市', 3, '532500', '红河哈尼族彝族自治州', '0873', '8730399');
INSERT INTO `t_sys_area` VALUES ('532504', '弥勒市', 3, '532500', '红河哈尼族彝族自治州', '0873', '8730799');
INSERT INTO `t_sys_area` VALUES ('532523', '屏边苗族自治县', 3, '532500', '红河哈尼族彝族自治州', '0873', '8730499');
INSERT INTO `t_sys_area` VALUES ('532524', '建水县', 3, '532500', '红河哈尼族彝族自治州', '0873', '8730599');
INSERT INTO `t_sys_area` VALUES ('532525', '石屏县', 3, '532500', '红河哈尼族彝族自治州', '0873', '8730699');
INSERT INTO `t_sys_area` VALUES ('532527', '泸西县', 3, '532500', '红河哈尼族彝族自治州', '0873', '8730899');
INSERT INTO `t_sys_area` VALUES ('532528', '元阳县', 3, '532500', '红河哈尼族彝族自治州', '0873', '8730999');
INSERT INTO `t_sys_area` VALUES ('532529', '红河县', 3, '532500', '红河哈尼族彝族自治州', '0873', '8731099');
INSERT INTO `t_sys_area` VALUES ('532530', '金平苗族瑶族傣族自治县', 3, '532500', '红河哈尼族彝族自治州', '0873', '8731199');
INSERT INTO `t_sys_area` VALUES ('532531', '绿春县', 3, '532500', '红河哈尼族彝族自治州', '0873', '8731299');
INSERT INTO `t_sys_area` VALUES ('532532', '河口瑶族自治县', 3, '532500', '红河哈尼族彝族自治州', '0873', '8731399');
INSERT INTO `t_sys_area` VALUES ('532600', '文山壮族苗族自治州', 2, '530000', '云南省', '0876', NULL);
INSERT INTO `t_sys_area` VALUES ('532601', '文山市', 3, '532600', '文山壮族苗族自治州', '0876', '8760199');
INSERT INTO `t_sys_area` VALUES ('532622', '砚山县', 3, '532600', '文山壮族苗族自治州', '0876', '8760299');
INSERT INTO `t_sys_area` VALUES ('532623', '西畴县', 3, '532600', '文山壮族苗族自治州', '0876', '8760399');
INSERT INTO `t_sys_area` VALUES ('532624', '麻栗坡县', 3, '532600', '文山壮族苗族自治州', '0876', '8760499');
INSERT INTO `t_sys_area` VALUES ('532625', '马关县', 3, '532600', '文山壮族苗族自治州', '0876', '8760599');
INSERT INTO `t_sys_area` VALUES ('532626', '丘北县', 3, '532600', '文山壮族苗族自治州', '0876', '8760699');
INSERT INTO `t_sys_area` VALUES ('532627', '广南县', 3, '532600', '文山壮族苗族自治州', '0876', '8760799');
INSERT INTO `t_sys_area` VALUES ('532628', '富宁县', 3, '532600', '文山壮族苗族自治州', '0876', '8760899');
INSERT INTO `t_sys_area` VALUES ('532800', '西双版纳傣族自治州', 2, '530000', '云南省', '0691', NULL);
INSERT INTO `t_sys_area` VALUES ('532801', '景洪市', 3, '532800', '西双版纳傣族自治州', '0691', '6910199');
INSERT INTO `t_sys_area` VALUES ('532822', '勐海县', 3, '532800', '西双版纳傣族自治州', '0691', '6910299');
INSERT INTO `t_sys_area` VALUES ('532823', '勐腊县', 3, '532800', '西双版纳傣族自治州', '0691', '6910399');
INSERT INTO `t_sys_area` VALUES ('532900', '大理白族自治州', 2, '530000', '云南省', '0872', NULL);
INSERT INTO `t_sys_area` VALUES ('532901', '大理市', 3, '532900', '大理白族自治州', '0872', '8720199');
INSERT INTO `t_sys_area` VALUES ('532922', '漾濞彝族自治县', 3, '532900', '大理白族自治州', '0872', '8720299');
INSERT INTO `t_sys_area` VALUES ('532923', '祥云县', 3, '532900', '大理白族自治州', '0872', '8720399');
INSERT INTO `t_sys_area` VALUES ('532924', '宾川县', 3, '532900', '大理白族自治州', '0872', '8720499');
INSERT INTO `t_sys_area` VALUES ('532925', '弥渡县', 3, '532900', '大理白族自治州', '0872', '8720599');
INSERT INTO `t_sys_area` VALUES ('532926', '南涧彝族自治县', 3, '532900', '大理白族自治州', '0872', '8720699');
INSERT INTO `t_sys_area` VALUES ('532927', '巍山彝族回族自治县', 3, '532900', '大理白族自治州', '0872', '8720799');
INSERT INTO `t_sys_area` VALUES ('532928', '永平县', 3, '532900', '大理白族自治州', '0872', '8720899');
INSERT INTO `t_sys_area` VALUES ('532929', '云龙县', 3, '532900', '大理白族自治州', '0872', '8720999');
INSERT INTO `t_sys_area` VALUES ('532930', '洱源县', 3, '532900', '大理白族自治州', '0872', '8721099');
INSERT INTO `t_sys_area` VALUES ('532931', '剑川县', 3, '532900', '大理白族自治州', '0872', '8721199');
INSERT INTO `t_sys_area` VALUES ('532932', '鹤庆县', 3, '532900', '大理白族自治州', '0872', '8721299');
INSERT INTO `t_sys_area` VALUES ('533100', '德宏傣族景颇族自治州', 2, '530000', '云南省', '0692', NULL);
INSERT INTO `t_sys_area` VALUES ('533102', '瑞丽市', 3, '533100', '德宏傣族景颇族自治州', '0692', '6920199');
INSERT INTO `t_sys_area` VALUES ('533103', '芒市', 3, '533100', '德宏傣族景颇族自治州', '0692', '6920299');
INSERT INTO `t_sys_area` VALUES ('533122', '梁河县', 3, '533100', '德宏傣族景颇族自治州', '0692', '6920399');
INSERT INTO `t_sys_area` VALUES ('533123', '盈江县', 3, '533100', '德宏傣族景颇族自治州', '0692', '6920499');
INSERT INTO `t_sys_area` VALUES ('533124', '陇川县', 3, '533100', '德宏傣族景颇族自治州', '0692', '6920599');
INSERT INTO `t_sys_area` VALUES ('533300', '怒江傈僳族自治州', 2, '530000', '云南省', '0886', NULL);
INSERT INTO `t_sys_area` VALUES ('533301', '泸水市', 3, '533300', '怒江傈僳族自治州', '0886', NULL);
INSERT INTO `t_sys_area` VALUES ('533323', '福贡县', 3, '533300', '怒江傈僳族自治州', '0886', '8860299');
INSERT INTO `t_sys_area` VALUES ('533324', '贡山独龙族怒族自治县', 3, '533300', '怒江傈僳族自治州', '0886', '8860399');
INSERT INTO `t_sys_area` VALUES ('533325', '兰坪白族普米族自治县', 3, '533300', '怒江傈僳族自治州', '0886', '8860499');
INSERT INTO `t_sys_area` VALUES ('533400', '迪庆藏族自治州', 2, '530000', '云南省', '0887', NULL);
INSERT INTO `t_sys_area` VALUES ('533401', '香格里拉市', 3, '533400', '迪庆藏族自治州', '0887', '8870199');
INSERT INTO `t_sys_area` VALUES ('533422', '德钦县', 3, '533400', '迪庆藏族自治州', '0887', '8870299');
INSERT INTO `t_sys_area` VALUES ('533423', '维西傈僳族自治县', 3, '533400', '迪庆藏族自治州', '0887', '8870399');
INSERT INTO `t_sys_area` VALUES ('540000', '西藏自治区', 1, '000000', '中华人民共和国', NULL, NULL);
INSERT INTO `t_sys_area` VALUES ('540100', '拉萨市', 2, '540000', '西藏自治区', '0891', NULL);
INSERT INTO `t_sys_area` VALUES ('540102', '城关区', 3, '540100', '拉萨市', '0891', '0890199');
INSERT INTO `t_sys_area` VALUES ('540103', '堆龙德庆区', 3, '540100', '拉萨市', '0891', NULL);
INSERT INTO `t_sys_area` VALUES ('540121', '林周县', 3, '540100', '拉萨市', '0891', '0890499');
INSERT INTO `t_sys_area` VALUES ('540122', '当雄县', 3, '540100', '拉萨市', '0891', '0890799');
INSERT INTO `t_sys_area` VALUES ('540123', '尼木县', 3, '540100', '拉萨市', '0891', '0890899');
INSERT INTO `t_sys_area` VALUES ('540124', '曲水县', 3, '540100', '拉萨市', '0891', '0890699');
INSERT INTO `t_sys_area` VALUES ('540126', '达孜县', 3, '540100', '拉萨市', '0891', '0890399');
INSERT INTO `t_sys_area` VALUES ('540127', '墨竹工卡县', 3, '540100', '拉萨市', '0891', '0890599');
INSERT INTO `t_sys_area` VALUES ('540200', '日喀则市', 2, '540000', '西藏自治区', '0892', NULL);
INSERT INTO `t_sys_area` VALUES ('540202', '桑珠孜区', 3, '540200', '日喀则市', '0892', NULL);
INSERT INTO `t_sys_area` VALUES ('540221', '南木林县', 3, '540200', '日喀则市', '0892', '8920299');
INSERT INTO `t_sys_area` VALUES ('540222', '江孜县', 3, '540200', '日喀则市', '0892', '8920399');
INSERT INTO `t_sys_area` VALUES ('540223', '定日县', 3, '540200', '日喀则市', '0892', '8920499');
INSERT INTO `t_sys_area` VALUES ('540224', '萨迦县', 3, '540200', '日喀则市', '0892', '8920599');
INSERT INTO `t_sys_area` VALUES ('540225', '拉孜县', 3, '540200', '日喀则市', '0892', '8920699');
INSERT INTO `t_sys_area` VALUES ('540226', '昂仁县', 3, '540200', '日喀则市', '0892', '8920799');
INSERT INTO `t_sys_area` VALUES ('540227', '谢通门县', 3, '540200', '日喀则市', '0892', '8920899');
INSERT INTO `t_sys_area` VALUES ('540228', '白朗县', 3, '540200', '日喀则市', '0892', '8920999');
INSERT INTO `t_sys_area` VALUES ('540229', '仁布县', 3, '540200', '日喀则市', '0892', '8921099');
INSERT INTO `t_sys_area` VALUES ('540230', '康马县', 3, '540200', '日喀则市', '0892', '8921199');
INSERT INTO `t_sys_area` VALUES ('540231', '定结县', 3, '540200', '日喀则市', '0892', '8921299');
INSERT INTO `t_sys_area` VALUES ('540232', '仲巴县', 3, '540200', '日喀则市', '0892', '8921399');
INSERT INTO `t_sys_area` VALUES ('540233', '亚东县', 3, '540200', '日喀则市', '0892', '8921499');
INSERT INTO `t_sys_area` VALUES ('540234', '吉隆县', 3, '540200', '日喀则市', '0892', '8921599');
INSERT INTO `t_sys_area` VALUES ('540235', '聂拉木县', 3, '540200', '日喀则市', '0892', '8921699');
INSERT INTO `t_sys_area` VALUES ('540236', '萨嘎县', 3, '540200', '日喀则市', '0892', '8921799');
INSERT INTO `t_sys_area` VALUES ('540237', '岗巴县', 3, '540200', '日喀则市', '0892', '8921899');
INSERT INTO `t_sys_area` VALUES ('540300', '昌都市', 2, '540000', '西藏自治区', '0895', NULL);
INSERT INTO `t_sys_area` VALUES ('540302', '卡若区', 3, '540300', '昌都市', '0895', NULL);
INSERT INTO `t_sys_area` VALUES ('540321', '江达县', 3, '540300', '昌都市', '0895', '8950299');
INSERT INTO `t_sys_area` VALUES ('540322', '贡觉县', 3, '540300', '昌都市', '0895', '8950399');
INSERT INTO `t_sys_area` VALUES ('540323', '类乌齐县', 3, '540300', '昌都市', '0895', NULL);
INSERT INTO `t_sys_area` VALUES ('540324', '丁青县', 3, '540300', '昌都市', '0895', NULL);
INSERT INTO `t_sys_area` VALUES ('540325', '察雅县', 3, '540300', '昌都市', '0895', NULL);
INSERT INTO `t_sys_area` VALUES ('540326', '八宿县', 3, '540300', '昌都市', '0895', NULL);
INSERT INTO `t_sys_area` VALUES ('540327', '左贡县', 3, '540300', '昌都市', '0895', NULL);
INSERT INTO `t_sys_area` VALUES ('540328', '芒康县', 3, '540300', '昌都市', '0895', NULL);
INSERT INTO `t_sys_area` VALUES ('540329', '洛隆县', 3, '540300', '昌都市', '0895', NULL);
INSERT INTO `t_sys_area` VALUES ('540330', '边坝县', 3, '540300', '昌都市', '0895', NULL);
INSERT INTO `t_sys_area` VALUES ('540400', '林芝市', 2, '540000', '西藏自治区', '0894', NULL);
INSERT INTO `t_sys_area` VALUES ('540402', '巴宜区', 3, '540400', '林芝市', '0894', NULL);
INSERT INTO `t_sys_area` VALUES ('540421', '工布江达县', 3, '540400', '林芝市', '0894', NULL);
INSERT INTO `t_sys_area` VALUES ('540422', '米林县', 3, '540400', '林芝市', '0894', NULL);
INSERT INTO `t_sys_area` VALUES ('540423', '墨脱县', 3, '540400', '林芝市', '0894', NULL);
INSERT INTO `t_sys_area` VALUES ('540424', '波密县', 3, '540400', '林芝市', '0894', NULL);
INSERT INTO `t_sys_area` VALUES ('540425', '察隅县', 3, '540400', '林芝市', '0894', NULL);
INSERT INTO `t_sys_area` VALUES ('540426', '朗县', 3, '540400', '林芝市', '0894', NULL);
INSERT INTO `t_sys_area` VALUES ('540500', '山南市', 2, '540000', '西藏自治区', '0893', NULL);
INSERT INTO `t_sys_area` VALUES ('540502', '乃东区', 3, '540500', '山南市', '0893', NULL);
INSERT INTO `t_sys_area` VALUES ('540521', '扎囊县', 3, '540500', '山南市', '0893', NULL);
INSERT INTO `t_sys_area` VALUES ('540522', '贡嘎县', 3, '540500', '山南市', '0893', NULL);
INSERT INTO `t_sys_area` VALUES ('540523', '桑日县', 3, '540500', '山南市', '0893', NULL);
INSERT INTO `t_sys_area` VALUES ('540524', '琼结县', 3, '540500', '山南市', '0893', NULL);
INSERT INTO `t_sys_area` VALUES ('540525', '曲松县', 3, '540500', '山南市', '0893', NULL);
INSERT INTO `t_sys_area` VALUES ('540526', '措美县', 3, '540500', '山南市', '0893', NULL);
INSERT INTO `t_sys_area` VALUES ('540527', '洛扎县', 3, '540500', '山南市', '0893', NULL);
INSERT INTO `t_sys_area` VALUES ('540528', '加查县', 3, '540500', '山南市', '0893', NULL);
INSERT INTO `t_sys_area` VALUES ('540529', '隆子县', 3, '540500', '山南市', '0893', NULL);
INSERT INTO `t_sys_area` VALUES ('540530', '错那县', 3, '540500', '山南市', '0893', NULL);
INSERT INTO `t_sys_area` VALUES ('540531', '浪卡子县', 3, '540500', '山南市', '0893', NULL);
INSERT INTO `t_sys_area` VALUES ('542400', '那曲地区', 2, '540000', '西藏自治区', '0896', NULL);
INSERT INTO `t_sys_area` VALUES ('542421', '那曲县', 3, '542400', '那曲地区', '0896', '8960199');
INSERT INTO `t_sys_area` VALUES ('542422', '嘉黎县', 3, '542400', '那曲地区', '0896', '8960299');
INSERT INTO `t_sys_area` VALUES ('542423', '比如县', 3, '542400', '那曲地区', '0896', '8960399');
INSERT INTO `t_sys_area` VALUES ('542424', '聂荣县', 3, '542400', '那曲地区', '0896', '8960499');
INSERT INTO `t_sys_area` VALUES ('542425', '安多县', 3, '542400', '那曲地区', '0896', '8960599');
INSERT INTO `t_sys_area` VALUES ('542426', '申扎县', 3, '542400', '那曲地区', '0896', '8960699');
INSERT INTO `t_sys_area` VALUES ('542427', '索县', 3, '542400', '那曲地区', '0896', '8960799');
INSERT INTO `t_sys_area` VALUES ('542428', '班戈县', 3, '542400', '那曲地区', '0896', '8960899');
INSERT INTO `t_sys_area` VALUES ('542429', '巴青县', 3, '542400', '那曲地区', '0896', '8960999');
INSERT INTO `t_sys_area` VALUES ('542430', '尼玛县', 3, '542400', '那曲地区', '0896', '8961099');
INSERT INTO `t_sys_area` VALUES ('542431', '双湖县', 3, '542400', '那曲地区', '0896', NULL);
INSERT INTO `t_sys_area` VALUES ('542500', '阿里地区', 2, '540000', '西藏自治区', '0897', NULL);
INSERT INTO `t_sys_area` VALUES ('542521', '普兰县', 3, '542500', '阿里地区', '0897', NULL);
INSERT INTO `t_sys_area` VALUES ('542522', '札达县', 3, '542500', '阿里地区', '0897', '8970299');
INSERT INTO `t_sys_area` VALUES ('542523', '噶尔县', 3, '542500', '阿里地区', '0897', '8970399');
INSERT INTO `t_sys_area` VALUES ('542524', '日土县', 3, '542500', '阿里地区', '0897', '8970499');
INSERT INTO `t_sys_area` VALUES ('542525', '革吉县', 3, '542500', '阿里地区', '0897', '8970599');
INSERT INTO `t_sys_area` VALUES ('542526', '改则县', 3, '542500', '阿里地区', '0897', '8970699');
INSERT INTO `t_sys_area` VALUES ('542527', '措勤县', 3, '542500', '阿里地区', '0897', '8970799');
INSERT INTO `t_sys_area` VALUES ('610000', '陕西省', 1, '000000', '中华人民共和国', NULL, NULL);
INSERT INTO `t_sys_area` VALUES ('610100', '西安市', 2, '610000', '陕西省', '029', NULL);
INSERT INTO `t_sys_area` VALUES ('610102', '新城区', 3, '610100', '西安市', '029', '0290199');
INSERT INTO `t_sys_area` VALUES ('610103', '碑林区', 3, '610100', '西安市', '029', '0290299');
INSERT INTO `t_sys_area` VALUES ('610104', '莲湖区', 3, '610100', '西安市', '029', '0290399');
INSERT INTO `t_sys_area` VALUES ('610111', '灞桥区', 3, '610100', '西安市', '029', '0290499');
INSERT INTO `t_sys_area` VALUES ('610112', '未央区', 3, '610100', '西安市', '029', '0290599');
INSERT INTO `t_sys_area` VALUES ('610113', '雁塔区', 3, '610100', '西安市', '029', '0290699');
INSERT INTO `t_sys_area` VALUES ('610114', '阎良区', 3, '610100', '西安市', '029', '0290799');
INSERT INTO `t_sys_area` VALUES ('610115', '临潼区', 3, '610100', '西安市', '029', '0290899');
INSERT INTO `t_sys_area` VALUES ('610116', '长安区', 3, '610100', '西安市', '029', '0290999');
INSERT INTO `t_sys_area` VALUES ('610117', '高陵区', 3, '610100', '西安市', '029', '0291399');
INSERT INTO `t_sys_area` VALUES ('610118', '鄠邑区', 3, '610100', '西安市', '029', NULL);
INSERT INTO `t_sys_area` VALUES ('610122', '蓝田县', 3, '610100', '西安市', '029', '0291099');
INSERT INTO `t_sys_area` VALUES ('610124', '周至县', 3, '610100', '西安市', '029', '0291199');
INSERT INTO `t_sys_area` VALUES ('610200', '铜川市', 2, '610000', '陕西省', '0919', NULL);
INSERT INTO `t_sys_area` VALUES ('610202', '王益区', 3, '610200', '铜川市', '0919', '9190199');
INSERT INTO `t_sys_area` VALUES ('610203', '印台区', 3, '610200', '铜川市', '0919', '9190299');
INSERT INTO `t_sys_area` VALUES ('610204', '耀州区', 3, '610200', '铜川市', '0919', '9190399');
INSERT INTO `t_sys_area` VALUES ('610222', '宜君县', 3, '610200', '铜川市', '0919', '9190499');
INSERT INTO `t_sys_area` VALUES ('610300', '宝鸡市', 2, '610000', '陕西省', '0917', NULL);
INSERT INTO `t_sys_area` VALUES ('610302', '渭滨区', 3, '610300', '宝鸡市', '0917', '9170199');
INSERT INTO `t_sys_area` VALUES ('610303', '金台区', 3, '610300', '宝鸡市', '0917', '9170299');
INSERT INTO `t_sys_area` VALUES ('610304', '陈仓区', 3, '610300', '宝鸡市', '0917', '9170399');
INSERT INTO `t_sys_area` VALUES ('610322', '凤翔县', 3, '610300', '宝鸡市', '0917', '9170499');
INSERT INTO `t_sys_area` VALUES ('610323', '岐山县', 3, '610300', '宝鸡市', '0917', '9170599');
INSERT INTO `t_sys_area` VALUES ('610324', '扶风县', 3, '610300', '宝鸡市', '0917', '9170699');
INSERT INTO `t_sys_area` VALUES ('610326', '眉县', 3, '610300', '宝鸡市', '0917', '9170799');
INSERT INTO `t_sys_area` VALUES ('610327', '陇县', 3, '610300', '宝鸡市', '0917', '9170899');
INSERT INTO `t_sys_area` VALUES ('610328', '千阳县', 3, '610300', '宝鸡市', '0917', '9170999');
INSERT INTO `t_sys_area` VALUES ('610329', '麟游县', 3, '610300', '宝鸡市', '0917', '9171099');
INSERT INTO `t_sys_area` VALUES ('610330', '凤县', 3, '610300', '宝鸡市', '0917', '9171199');
INSERT INTO `t_sys_area` VALUES ('610331', '太白县', 3, '610300', '宝鸡市', '0917', '9171299');
INSERT INTO `t_sys_area` VALUES ('610400', '咸阳市', 2, '610000', '陕西省', '0910', NULL);
INSERT INTO `t_sys_area` VALUES ('610402', '秦都区', 3, '610400', '咸阳市', '0910', '9100199');
INSERT INTO `t_sys_area` VALUES ('610403', '杨陵区', 3, '610400', '咸阳市', '0910', '9100299');
INSERT INTO `t_sys_area` VALUES ('610404', '渭城区', 3, '610400', '咸阳市', '0910', '9100399');
INSERT INTO `t_sys_area` VALUES ('610422', '三原县', 3, '610400', '咸阳市', '0910', '9100499');
INSERT INTO `t_sys_area` VALUES ('610423', '泾阳县', 3, '610400', '咸阳市', '0910', '9100599');
INSERT INTO `t_sys_area` VALUES ('610424', '乾县', 3, '610400', '咸阳市', '0910', '9100699');
INSERT INTO `t_sys_area` VALUES ('610425', '礼泉县', 3, '610400', '咸阳市', '0910', '9100799');
INSERT INTO `t_sys_area` VALUES ('610426', '永寿县', 3, '610400', '咸阳市', '0910', '9100899');
INSERT INTO `t_sys_area` VALUES ('610427', '彬县', 3, '610400', '咸阳市', '0910', '9100999');
INSERT INTO `t_sys_area` VALUES ('610428', '长武县', 3, '610400', '咸阳市', '0910', '9101099');
INSERT INTO `t_sys_area` VALUES ('610429', '旬邑县', 3, '610400', '咸阳市', '0910', '9101199');
INSERT INTO `t_sys_area` VALUES ('610430', '淳化县', 3, '610400', '咸阳市', '0910', '9101299');
INSERT INTO `t_sys_area` VALUES ('610431', '武功县', 3, '610400', '咸阳市', '0910', '9101399');
INSERT INTO `t_sys_area` VALUES ('610481', '兴平市', 3, '610400', '咸阳市', '0910', '9101499');
INSERT INTO `t_sys_area` VALUES ('610500', '渭南市', 2, '610000', '陕西省', '0913', NULL);
INSERT INTO `t_sys_area` VALUES ('610502', '临渭区', 3, '610500', '渭南市', '0913', '9130199');
INSERT INTO `t_sys_area` VALUES ('610503', '华州区', 3, '610500', '渭南市', '0913', NULL);
INSERT INTO `t_sys_area` VALUES ('610522', '潼关县', 3, '610500', '渭南市', '0913', '9130399');
INSERT INTO `t_sys_area` VALUES ('610523', '大荔县', 3, '610500', '渭南市', '0913', '9130499');
INSERT INTO `t_sys_area` VALUES ('610524', '合阳县', 3, '610500', '渭南市', '0913', '9130599');
INSERT INTO `t_sys_area` VALUES ('610525', '澄城县', 3, '610500', '渭南市', '0913', '9130699');
INSERT INTO `t_sys_area` VALUES ('610526', '蒲城县', 3, '610500', '渭南市', '0913', '9130799');
INSERT INTO `t_sys_area` VALUES ('610527', '白水县', 3, '610500', '渭南市', '0913', '9130899');
INSERT INTO `t_sys_area` VALUES ('610528', '富平县', 3, '610500', '渭南市', '0913', '9130999');
INSERT INTO `t_sys_area` VALUES ('610581', '韩城市', 3, '610500', '渭南市', '0913', '9131099');
INSERT INTO `t_sys_area` VALUES ('610582', '华阴市', 3, '610500', '渭南市', '0913', '9131199');
INSERT INTO `t_sys_area` VALUES ('610600', '延安市', 2, '610000', '陕西省', '0911', NULL);
INSERT INTO `t_sys_area` VALUES ('610602', '宝塔区', 3, '610600', '延安市', '0911', '9110199');
INSERT INTO `t_sys_area` VALUES ('610603', '安塞区', 3, '610600', '延安市', '0911', NULL);
INSERT INTO `t_sys_area` VALUES ('610621', '延长县', 3, '610600', '延安市', '0911', '9110299');
INSERT INTO `t_sys_area` VALUES ('610622', '延川县', 3, '610600', '延安市', '0911', '9110399');
INSERT INTO `t_sys_area` VALUES ('610623', '子长县', 3, '610600', '延安市', '0911', '9110499');
INSERT INTO `t_sys_area` VALUES ('610625', '志丹县', 3, '610600', '延安市', '0911', '9110699');
INSERT INTO `t_sys_area` VALUES ('610626', '吴起县', 3, '610600', '延安市', '0911', '9110799');
INSERT INTO `t_sys_area` VALUES ('610627', '甘泉县', 3, '610600', '延安市', '0911', '9110899');
INSERT INTO `t_sys_area` VALUES ('610628', '富县', 3, '610600', '延安市', '0911', '9110999');
INSERT INTO `t_sys_area` VALUES ('610629', '洛川县', 3, '610600', '延安市', '0911', '9111099');
INSERT INTO `t_sys_area` VALUES ('610630', '宜川县', 3, '610600', '延安市', '0911', '9111199');
INSERT INTO `t_sys_area` VALUES ('610631', '黄龙县', 3, '610600', '延安市', '0911', '9111299');
INSERT INTO `t_sys_area` VALUES ('610632', '黄陵县', 3, '610600', '延安市', '0911', '9111399');
INSERT INTO `t_sys_area` VALUES ('610700', '汉中市', 2, '610000', '陕西省', '0916', NULL);
INSERT INTO `t_sys_area` VALUES ('610702', '汉台区', 3, '610700', '汉中市', '0916', '9160199');
INSERT INTO `t_sys_area` VALUES ('610721', '南郑区', 3, '610700', '汉中市', '0916', '9160299');
INSERT INTO `t_sys_area` VALUES ('610722', '城固县', 3, '610700', '汉中市', '0916', '9160399');
INSERT INTO `t_sys_area` VALUES ('610723', '洋县', 3, '610700', '汉中市', '0916', '9160499');
INSERT INTO `t_sys_area` VALUES ('610724', '西乡县', 3, '610700', '汉中市', '0916', '9160599');
INSERT INTO `t_sys_area` VALUES ('610725', '勉县', 3, '610700', '汉中市', '0916', '9160699');
INSERT INTO `t_sys_area` VALUES ('610726', '宁强县', 3, '610700', '汉中市', '0916', '9160799');
INSERT INTO `t_sys_area` VALUES ('610727', '略阳县', 3, '610700', '汉中市', '0916', '9160899');
INSERT INTO `t_sys_area` VALUES ('610728', '镇巴县', 3, '610700', '汉中市', '0916', '9160999');
INSERT INTO `t_sys_area` VALUES ('610729', '留坝县', 3, '610700', '汉中市', '0916', '9161099');
INSERT INTO `t_sys_area` VALUES ('610730', '佛坪县', 3, '610700', '汉中市', '0916', '9161199');
INSERT INTO `t_sys_area` VALUES ('610800', '榆林市', 2, '610000', '陕西省', '0912', NULL);
INSERT INTO `t_sys_area` VALUES ('610802', '榆阳区', 3, '610800', '榆林市', '0912', '9120199');
INSERT INTO `t_sys_area` VALUES ('610803', '横山区', 3, '610800', '榆林市', '0912', NULL);
INSERT INTO `t_sys_area` VALUES ('610822', '府谷县', 3, '610800', '榆林市', '0912', '9120399');
INSERT INTO `t_sys_area` VALUES ('610824', '靖边县', 3, '610800', '榆林市', '0912', '9120599');
INSERT INTO `t_sys_area` VALUES ('610825', '定边县', 3, '610800', '榆林市', '0912', '9120699');
INSERT INTO `t_sys_area` VALUES ('610826', '绥德县', 3, '610800', '榆林市', '0912', '9120799');
INSERT INTO `t_sys_area` VALUES ('610827', '米脂县', 3, '610800', '榆林市', '0912', '9120899');
INSERT INTO `t_sys_area` VALUES ('610828', '佳县', 3, '610800', '榆林市', '0912', '9120999');
INSERT INTO `t_sys_area` VALUES ('610829', '吴堡县', 3, '610800', '榆林市', '0912', '9121099');
INSERT INTO `t_sys_area` VALUES ('610830', '清涧县', 3, '610800', '榆林市', '0912', '9121199');
INSERT INTO `t_sys_area` VALUES ('610831', '子洲县', 3, '610800', '榆林市', '0912', '9121299');
INSERT INTO `t_sys_area` VALUES ('610881', '神木市', 3, '610800', '榆林市', '0912', NULL);
INSERT INTO `t_sys_area` VALUES ('610900', '安康市', 2, '610000', '陕西省', '0915', NULL);
INSERT INTO `t_sys_area` VALUES ('610902', '汉滨区', 3, '610900', '安康市', '0915', '9150199');
INSERT INTO `t_sys_area` VALUES ('610921', '汉阴县', 3, '610900', '安康市', '0915', '9150299');
INSERT INTO `t_sys_area` VALUES ('610922', '石泉县', 3, '610900', '安康市', '0915', '9150399');
INSERT INTO `t_sys_area` VALUES ('610923', '宁陕县', 3, '610900', '安康市', '0915', '9150499');
INSERT INTO `t_sys_area` VALUES ('610924', '紫阳县', 3, '610900', '安康市', '0915', '9150599');
INSERT INTO `t_sys_area` VALUES ('610925', '岚皋县', 3, '610900', '安康市', '0915', '9150699');
INSERT INTO `t_sys_area` VALUES ('610926', '平利县', 3, '610900', '安康市', '0915', '9150799');
INSERT INTO `t_sys_area` VALUES ('610927', '镇坪县', 3, '610900', '安康市', '0915', '9150899');
INSERT INTO `t_sys_area` VALUES ('610928', '旬阳县', 3, '610900', '安康市', '0915', '9150999');
INSERT INTO `t_sys_area` VALUES ('610929', '白河县', 3, '610900', '安康市', '0915', '9151099');
INSERT INTO `t_sys_area` VALUES ('611000', '商洛市', 2, '610000', '陕西省', '0914', NULL);
INSERT INTO `t_sys_area` VALUES ('611002', '商州区', 3, '611000', '商洛市', '0914', '9140199');
INSERT INTO `t_sys_area` VALUES ('611021', '洛南县', 3, '611000', '商洛市', '0914', '9140299');
INSERT INTO `t_sys_area` VALUES ('611022', '丹凤县', 3, '611000', '商洛市', '0914', '9140399');
INSERT INTO `t_sys_area` VALUES ('611023', '商南县', 3, '611000', '商洛市', '0914', '9140499');
INSERT INTO `t_sys_area` VALUES ('611024', '山阳县', 3, '611000', '商洛市', '0914', '9140599');
INSERT INTO `t_sys_area` VALUES ('611025', '镇安县', 3, '611000', '商洛市', '0914', '9140699');
INSERT INTO `t_sys_area` VALUES ('611026', '柞水县', 3, '611000', '商洛市', '0914', '9140799');
INSERT INTO `t_sys_area` VALUES ('620000', '甘肃省', 1, '000000', '中华人民共和国', NULL, NULL);
INSERT INTO `t_sys_area` VALUES ('620100', '兰州市', 2, '620000', '甘肃省', '0931', NULL);
INSERT INTO `t_sys_area` VALUES ('620102', '城关区', 3, '620100', '兰州市', '0931', '9310199');
INSERT INTO `t_sys_area` VALUES ('620103', '七里河区', 3, '620100', '兰州市', '0931', '9310299');
INSERT INTO `t_sys_area` VALUES ('620104', '西固区', 3, '620100', '兰州市', '0931', '9310399');
INSERT INTO `t_sys_area` VALUES ('620105', '安宁区', 3, '620100', '兰州市', '0931', '9310499');
INSERT INTO `t_sys_area` VALUES ('620111', '红古区', 3, '620100', '兰州市', '0931', '9310599');
INSERT INTO `t_sys_area` VALUES ('620121', '永登县', 3, '620100', '兰州市', '0931', '9310699');
INSERT INTO `t_sys_area` VALUES ('620122', '皋兰县', 3, '620100', '兰州市', '0931', '9310799');
INSERT INTO `t_sys_area` VALUES ('620123', '榆中县', 3, '620100', '兰州市', '0931', '9310899');
INSERT INTO `t_sys_area` VALUES ('620200', '嘉峪关市', 2, '620000', '甘肃省', '1937', '9420199');
INSERT INTO `t_sys_area` VALUES ('620300', '金昌市', 2, '620000', '甘肃省', '0935', NULL);
INSERT INTO `t_sys_area` VALUES ('620302', '金川区', 3, '620300', '金昌市', '0935', '9400199');
INSERT INTO `t_sys_area` VALUES ('620321', '永昌县', 3, '620300', '金昌市', '0935', '9400299');
INSERT INTO `t_sys_area` VALUES ('620400', '白银市', 2, '620000', '甘肃省', '0943', NULL);
INSERT INTO `t_sys_area` VALUES ('620402', '白银区', 3, '620400', '白银市', '0943', '9430199');
INSERT INTO `t_sys_area` VALUES ('620403', '平川区', 3, '620400', '白银市', '0943', '9430299');
INSERT INTO `t_sys_area` VALUES ('620421', '靖远县', 3, '620400', '白银市', '0943', '9430399');
INSERT INTO `t_sys_area` VALUES ('620422', '会宁县', 3, '620400', '白银市', '0943', '9430499');
INSERT INTO `t_sys_area` VALUES ('620423', '景泰县', 3, '620400', '白银市', '0943', '9430599');
INSERT INTO `t_sys_area` VALUES ('620500', '天水市', 2, '620000', '甘肃省', '0938', NULL);
INSERT INTO `t_sys_area` VALUES ('620502', '秦州区', 3, '620500', '天水市', '0938', '9380199');
INSERT INTO `t_sys_area` VALUES ('620503', '麦积区', 3, '620500', '天水市', '0938', '9380299');
INSERT INTO `t_sys_area` VALUES ('620521', '清水县', 3, '620500', '天水市', '0938', '9380399');
INSERT INTO `t_sys_area` VALUES ('620522', '秦安县', 3, '620500', '天水市', '0938', '9380499');
INSERT INTO `t_sys_area` VALUES ('620523', '甘谷县', 3, '620500', '天水市', '0938', '9380599');
INSERT INTO `t_sys_area` VALUES ('620524', '武山县', 3, '620500', '天水市', '0938', '9380699');
INSERT INTO `t_sys_area` VALUES ('620525', '张家川回族自治县', 3, '620500', '天水市', '0938', '9380799');
INSERT INTO `t_sys_area` VALUES ('620600', '武威市', 2, '620000', '甘肃省', '1935', NULL);
INSERT INTO `t_sys_area` VALUES ('620602', '凉州区', 3, '620600', '武威市', '1935', '9350199');
INSERT INTO `t_sys_area` VALUES ('620621', '民勤县', 3, '620600', '武威市', '1935', '9350299');
INSERT INTO `t_sys_area` VALUES ('620622', '古浪县', 3, '620600', '武威市', '1935', '9350399');
INSERT INTO `t_sys_area` VALUES ('620623', '天祝藏族自治县', 3, '620600', '武威市', '1935', '9350499');
INSERT INTO `t_sys_area` VALUES ('620700', '张掖市', 2, '620000', '甘肃省', '0936', NULL);
INSERT INTO `t_sys_area` VALUES ('620702', '甘州区', 3, '620700', '张掖市', '0936', '9360199');
INSERT INTO `t_sys_area` VALUES ('620721', '肃南裕固族自治县', 3, '620700', '张掖市', '0936', '9360299');
INSERT INTO `t_sys_area` VALUES ('620722', '民乐县', 3, '620700', '张掖市', '0936', '9360399');
INSERT INTO `t_sys_area` VALUES ('620723', '临泽县', 3, '620700', '张掖市', '0936', '9360499');
INSERT INTO `t_sys_area` VALUES ('620724', '高台县', 3, '620700', '张掖市', '0936', '9360599');
INSERT INTO `t_sys_area` VALUES ('620725', '山丹县', 3, '620700', '张掖市', '0936', '9360699');
INSERT INTO `t_sys_area` VALUES ('620800', '平凉市', 2, '620000', '甘肃省', '0933', NULL);
INSERT INTO `t_sys_area` VALUES ('620802', '崆峒区', 3, '620800', '平凉市', '0933', '9330199');
INSERT INTO `t_sys_area` VALUES ('620821', '泾川县', 3, '620800', '平凉市', '0933', '9330299');
INSERT INTO `t_sys_area` VALUES ('620822', '灵台县', 3, '620800', '平凉市', '0933', '9330399');
INSERT INTO `t_sys_area` VALUES ('620823', '崇信县', 3, '620800', '平凉市', '0933', '9330499');
INSERT INTO `t_sys_area` VALUES ('620824', '华亭县', 3, '620800', '平凉市', '0933', '9330599');
INSERT INTO `t_sys_area` VALUES ('620825', '庄浪县', 3, '620800', '平凉市', '0933', '9330699');
INSERT INTO `t_sys_area` VALUES ('620826', '静宁县', 3, '620800', '平凉市', '0933', '9330799');
INSERT INTO `t_sys_area` VALUES ('620900', '酒泉市', 2, '620000', '甘肃省', '0937', NULL);
INSERT INTO `t_sys_area` VALUES ('620902', '肃州区', 3, '620900', '酒泉市', '0937', '9370199');
INSERT INTO `t_sys_area` VALUES ('620921', '金塔县', 3, '620900', '酒泉市', '0937', '9370299');
INSERT INTO `t_sys_area` VALUES ('620922', '瓜州县', 3, '620900', '酒泉市', '0937', '9370399');
INSERT INTO `t_sys_area` VALUES ('620923', '肃北蒙古族自治县', 3, '620900', '酒泉市', '0937', '9370499');
INSERT INTO `t_sys_area` VALUES ('620924', '阿克塞哈萨克族自治县', 3, '620900', '酒泉市', '0937', '9370599');
INSERT INTO `t_sys_area` VALUES ('620981', '玉门市', 3, '620900', '酒泉市', '0937', '9370699');
INSERT INTO `t_sys_area` VALUES ('620982', '敦煌市', 3, '620900', '酒泉市', '0937', '9370799');
INSERT INTO `t_sys_area` VALUES ('621000', '庆阳市', 2, '620000', '甘肃省', '0934', NULL);
INSERT INTO `t_sys_area` VALUES ('621002', '西峰区', 3, '621000', '庆阳市', '0934', '9340199');
INSERT INTO `t_sys_area` VALUES ('621021', '庆城县', 3, '621000', '庆阳市', '0934', '9340299');
INSERT INTO `t_sys_area` VALUES ('621022', '环县', 3, '621000', '庆阳市', '0934', '9340399');
INSERT INTO `t_sys_area` VALUES ('621023', '华池县', 3, '621000', '庆阳市', '0934', '9340499');
INSERT INTO `t_sys_area` VALUES ('621024', '合水县', 3, '621000', '庆阳市', '0934', '9340599');
INSERT INTO `t_sys_area` VALUES ('621025', '正宁县', 3, '621000', '庆阳市', '0934', '9340699');
INSERT INTO `t_sys_area` VALUES ('621026', '宁县', 3, '621000', '庆阳市', '0934', '9340799');
INSERT INTO `t_sys_area` VALUES ('621027', '镇原县', 3, '621000', '庆阳市', '0934', '9340899');
INSERT INTO `t_sys_area` VALUES ('621100', '定西市', 2, '620000', '甘肃省', '0932', NULL);
INSERT INTO `t_sys_area` VALUES ('621102', '安定区', 3, '621100', '定西市', '0932', '9320199');
INSERT INTO `t_sys_area` VALUES ('621121', '通渭县', 3, '621100', '定西市', '0932', '9320299');
INSERT INTO `t_sys_area` VALUES ('621122', '陇西县', 3, '621100', '定西市', '0932', '9320399');
INSERT INTO `t_sys_area` VALUES ('621123', '渭源县', 3, '621100', '定西市', '0932', '9320499');
INSERT INTO `t_sys_area` VALUES ('621124', '临洮县', 3, '621100', '定西市', '0932', '9320599');
INSERT INTO `t_sys_area` VALUES ('621125', '漳县', 3, '621100', '定西市', '0932', '9320699');
INSERT INTO `t_sys_area` VALUES ('621126', '岷县', 3, '621100', '定西市', '0932', '9320799');
INSERT INTO `t_sys_area` VALUES ('621200', '陇南市', 2, '620000', '甘肃省', '2935', NULL);
INSERT INTO `t_sys_area` VALUES ('621202', '武都区', 3, '621200', '陇南市', '2935', '9390199');
INSERT INTO `t_sys_area` VALUES ('621221', '成县', 3, '621200', '陇南市', '2935', '9390299');
INSERT INTO `t_sys_area` VALUES ('621222', '文县', 3, '621200', '陇南市', '2935', '9390399');
INSERT INTO `t_sys_area` VALUES ('621223', '宕昌县', 3, '621200', '陇南市', '2935', '9390499');
INSERT INTO `t_sys_area` VALUES ('621224', '康县', 3, '621200', '陇南市', '2935', '9390599');
INSERT INTO `t_sys_area` VALUES ('621225', '西和县', 3, '621200', '陇南市', '2935', '9390699');
INSERT INTO `t_sys_area` VALUES ('621226', '礼县', 3, '621200', '陇南市', '2935', '9390799');
INSERT INTO `t_sys_area` VALUES ('621227', '徽县', 3, '621200', '陇南市', '2935', '9390899');
INSERT INTO `t_sys_area` VALUES ('621228', '两当县', 3, '621200', '陇南市', '2935', '9390999');
INSERT INTO `t_sys_area` VALUES ('622900', '临夏回族自治州', 2, '620000', '甘肃省', '0930', NULL);
INSERT INTO `t_sys_area` VALUES ('622901', '临夏市', 3, '622900', '临夏回族自治州', '0930', '9300199');
INSERT INTO `t_sys_area` VALUES ('622921', '临夏县', 3, '622900', '临夏回族自治州', '0930', '9300299');
INSERT INTO `t_sys_area` VALUES ('622922', '康乐县', 3, '622900', '临夏回族自治州', '0930', '9300399');
INSERT INTO `t_sys_area` VALUES ('622923', '永靖县', 3, '622900', '临夏回族自治州', '0930', '9300499');
INSERT INTO `t_sys_area` VALUES ('622924', '广河县', 3, '622900', '临夏回族自治州', '0930', '9300599');
INSERT INTO `t_sys_area` VALUES ('622925', '和政县', 3, '622900', '临夏回族自治州', '0930', '9300699');
INSERT INTO `t_sys_area` VALUES ('622926', '东乡族自治县', 3, '622900', '临夏回族自治州', '0930', '9300799');
INSERT INTO `t_sys_area` VALUES ('622927', '积石山保安族东乡族撒拉族自治县', 3, '622900', '临夏回族自治州', '0930', '9300899');
INSERT INTO `t_sys_area` VALUES ('623000', '甘南藏族自治州', 2, '620000', '甘肃省', '0941', NULL);
INSERT INTO `t_sys_area` VALUES ('623001', '合作市', 3, '623000', '甘南藏族自治州', '0941', '9410199');
INSERT INTO `t_sys_area` VALUES ('623021', '临潭县', 3, '623000', '甘南藏族自治州', '0941', '9410299');
INSERT INTO `t_sys_area` VALUES ('623022', '卓尼县', 3, '623000', '甘南藏族自治州', '0941', '9410399');
INSERT INTO `t_sys_area` VALUES ('623023', '舟曲县', 3, '623000', '甘南藏族自治州', '0941', '9410499');
INSERT INTO `t_sys_area` VALUES ('623024', '迭部县', 3, '623000', '甘南藏族自治州', '0941', '9410599');
INSERT INTO `t_sys_area` VALUES ('623025', '玛曲县', 3, '623000', '甘南藏族自治州', '0941', '9410699');
INSERT INTO `t_sys_area` VALUES ('623026', '碌曲县', 3, '623000', '甘南藏族自治州', '0941', '9410799');
INSERT INTO `t_sys_area` VALUES ('623027', '夏河县', 3, '623000', '甘南藏族自治州', '0941', '9410899');
INSERT INTO `t_sys_area` VALUES ('630000', '青海省', 1, '000000', '中华人民共和国', NULL, NULL);
INSERT INTO `t_sys_area` VALUES ('630100', '西宁市', 2, '630000', '青海省', '0971', NULL);
INSERT INTO `t_sys_area` VALUES ('630102', '城东区', 3, '630100', '西宁市', '0971', '9710199');
INSERT INTO `t_sys_area` VALUES ('630103', '城中区', 3, '630100', '西宁市', '0971', '9710299');
INSERT INTO `t_sys_area` VALUES ('630104', '城西区', 3, '630100', '西宁市', '0971', '9710399');
INSERT INTO `t_sys_area` VALUES ('630105', '城北区', 3, '630100', '西宁市', '0971', '9710499');
INSERT INTO `t_sys_area` VALUES ('630121', '大通回族土族自治县', 3, '630100', '西宁市', '0971', '9710599');
INSERT INTO `t_sys_area` VALUES ('630122', '湟中县', 3, '630100', '西宁市', '0971', '9710699');
INSERT INTO `t_sys_area` VALUES ('630123', '湟源县', 3, '630100', '西宁市', '0971', '9710799');
INSERT INTO `t_sys_area` VALUES ('630200', '海东市', 2, '630000', '青海省', '0972', NULL);
INSERT INTO `t_sys_area` VALUES ('630202', '乐都区', 3, '630200', '海东市', '0972', NULL);
INSERT INTO `t_sys_area` VALUES ('630203', '平安区', 3, '630200', '海东市', '0972', '9720199');
INSERT INTO `t_sys_area` VALUES ('630222', '民和回族土族自治县', 3, '630200', '海东市', '0972', '9720299');
INSERT INTO `t_sys_area` VALUES ('630223', '互助土族自治县', 3, '630200', '海东市', '0972', NULL);
INSERT INTO `t_sys_area` VALUES ('630224', '化隆回族自治县', 3, '630200', '海东市', '0972', NULL);
INSERT INTO `t_sys_area` VALUES ('630225', '循化撒拉族自治县', 3, '630200', '海东市', '0972', '9720699');
INSERT INTO `t_sys_area` VALUES ('632200', '海北藏族自治州', 2, '630000', '青海省', '0970', NULL);
INSERT INTO `t_sys_area` VALUES ('632221', '门源回族自治县', 3, '632200', '海北藏族自治州', '0970', '9700199');
INSERT INTO `t_sys_area` VALUES ('632222', '祁连县', 3, '632200', '海北藏族自治州', '0970', '9700299');
INSERT INTO `t_sys_area` VALUES ('632223', '海晏县', 3, '632200', '海北藏族自治州', '0970', '9700399');
INSERT INTO `t_sys_area` VALUES ('632224', '刚察县', 3, '632200', '海北藏族自治州', '0970', '9700499');
INSERT INTO `t_sys_area` VALUES ('632300', '黄南藏族自治州', 2, '630000', '青海省', '0973', NULL);
INSERT INTO `t_sys_area` VALUES ('632321', '同仁县', 3, '632300', '黄南藏族自治州', '0973', '9730199');
INSERT INTO `t_sys_area` VALUES ('632322', '尖扎县', 3, '632300', '黄南藏族自治州', '0973', '9730299');
INSERT INTO `t_sys_area` VALUES ('632323', '泽库县', 3, '632300', '黄南藏族自治州', '0973', '9730399');
INSERT INTO `t_sys_area` VALUES ('632324', '河南蒙古族自治县', 3, '632300', '黄南藏族自治州', '0973', '9730499');
INSERT INTO `t_sys_area` VALUES ('632500', '海南藏族自治州', 2, '630000', '青海省', '0974', NULL);
INSERT INTO `t_sys_area` VALUES ('632521', '共和县', 3, '632500', '海南藏族自治州', '0974', '9740199');
INSERT INTO `t_sys_area` VALUES ('632522', '同德县', 3, '632500', '海南藏族自治州', '0974', '9740299');
INSERT INTO `t_sys_area` VALUES ('632523', '贵德县', 3, '632500', '海南藏族自治州', '0974', '9740399');
INSERT INTO `t_sys_area` VALUES ('632524', '兴海县', 3, '632500', '海南藏族自治州', '0974', NULL);
INSERT INTO `t_sys_area` VALUES ('632525', '贵南县', 3, '632500', '海南藏族自治州', '0974', '9740499');
INSERT INTO `t_sys_area` VALUES ('632600', '果洛藏族自治州', 2, '630000', '青海省', '0975', NULL);
INSERT INTO `t_sys_area` VALUES ('632621', '玛沁县', 3, '632600', '果洛藏族自治州', '0975', '9750199');
INSERT INTO `t_sys_area` VALUES ('632622', '班玛县', 3, '632600', '果洛藏族自治州', '0975', '9750299');
INSERT INTO `t_sys_area` VALUES ('632623', '甘德县', 3, '632600', '果洛藏族自治州', '0975', NULL);
INSERT INTO `t_sys_area` VALUES ('632624', '达日县', 3, '632600', '果洛藏族自治州', '0975', '9750399');
INSERT INTO `t_sys_area` VALUES ('632625', '久治县', 3, '632600', '果洛藏族自治州', '0975', '9750499');
INSERT INTO `t_sys_area` VALUES ('632626', '玛多县', 3, '632600', '果洛藏族自治州', '0975', NULL);
INSERT INTO `t_sys_area` VALUES ('632700', '玉树藏族自治州', 2, '630000', '青海省', '0976', NULL);
INSERT INTO `t_sys_area` VALUES ('632701', '玉树市', 3, '632700', '玉树藏族自治州', '0976', NULL);
INSERT INTO `t_sys_area` VALUES ('632722', '杂多县', 3, '632700', '玉树藏族自治州', '0976', NULL);
INSERT INTO `t_sys_area` VALUES ('632723', '称多县', 3, '632700', '玉树藏族自治州', '0976', '9760299');
INSERT INTO `t_sys_area` VALUES ('632724', '治多县', 3, '632700', '玉树藏族自治州', '0976', '9760399');
INSERT INTO `t_sys_area` VALUES ('632725', '囊谦县', 3, '632700', '玉树藏族自治州', '0976', NULL);
INSERT INTO `t_sys_area` VALUES ('632726', '曲麻莱县', 3, '632700', '玉树藏族自治州', '0976', '9760499');
INSERT INTO `t_sys_area` VALUES ('632800', '海西蒙古族藏族自治州', 2, '630000', '青海省', '0977', NULL);
INSERT INTO `t_sys_area` VALUES ('632801', '格尔木市', 3, '632800', '海西蒙古族藏族自治州', '0977', '9790199');
INSERT INTO `t_sys_area` VALUES ('632802', '德令哈市', 3, '632800', '海西蒙古族藏族自治州', '0977', '9790299');
INSERT INTO `t_sys_area` VALUES ('632821', '乌兰县', 3, '632800', '海西蒙古族藏族自治州', '0977', '9790399');
INSERT INTO `t_sys_area` VALUES ('632822', '都兰县', 3, '632800', '海西蒙古族藏族自治州', '0977', '9790499');
INSERT INTO `t_sys_area` VALUES ('632823', '天峻县', 3, '632800', '海西蒙古族藏族自治州', '0977', '9790599');
INSERT INTO `t_sys_area` VALUES ('632825', '海西蒙古族藏族自治州直辖', 3, '632800', '海西蒙古族藏族自治州', '0977', NULL);
INSERT INTO `t_sys_area` VALUES ('640000', '宁夏回族自治区', 1, '000000', '中华人民共和国', NULL, NULL);
INSERT INTO `t_sys_area` VALUES ('640100', '银川市', 2, '640000', '宁夏回族自治区', '0951', NULL);
INSERT INTO `t_sys_area` VALUES ('640104', '兴庆区', 3, '640100', '银川市', '0951', '9510199');
INSERT INTO `t_sys_area` VALUES ('640105', '西夏区', 3, '640100', '银川市', '0951', '9510299');
INSERT INTO `t_sys_area` VALUES ('640106', '金凤区', 3, '640100', '银川市', '0951', '9510399');
INSERT INTO `t_sys_area` VALUES ('640121', '永宁县', 3, '640100', '银川市', '0951', '9510499');
INSERT INTO `t_sys_area` VALUES ('640122', '贺兰县', 3, '640100', '银川市', '0951', '9510599');
INSERT INTO `t_sys_area` VALUES ('640181', '灵武市', 3, '640100', '银川市', '0951', '9510699');
INSERT INTO `t_sys_area` VALUES ('640200', '石嘴山市', 2, '640000', '宁夏回族自治区', '0952', NULL);
INSERT INTO `t_sys_area` VALUES ('640202', '大武口区', 3, '640200', '石嘴山市', '0952', '9520199');
INSERT INTO `t_sys_area` VALUES ('640205', '惠农区', 3, '640200', '石嘴山市', '0952', '9520299');
INSERT INTO `t_sys_area` VALUES ('640221', '平罗县', 3, '640200', '石嘴山市', '0952', '9520399');
INSERT INTO `t_sys_area` VALUES ('640300', '吴忠市', 2, '640000', '宁夏回族自治区', '0953', NULL);
INSERT INTO `t_sys_area` VALUES ('640302', '利通区', 3, '640300', '吴忠市', '0953', '9530199');
INSERT INTO `t_sys_area` VALUES ('640303', '红寺堡区', 3, '640300', '吴忠市', '0953', '9530499');
INSERT INTO `t_sys_area` VALUES ('640323', '盐池县', 3, '640300', '吴忠市', '0953', '9530299');
INSERT INTO `t_sys_area` VALUES ('640324', '同心县', 3, '640300', '吴忠市', '0953', '9530399');
INSERT INTO `t_sys_area` VALUES ('640381', '青铜峡市', 3, '640300', '吴忠市', '0953', '9530599');
INSERT INTO `t_sys_area` VALUES ('640400', '固原市', 2, '640000', '宁夏回族自治区', '0954', NULL);
INSERT INTO `t_sys_area` VALUES ('640402', '原州区', 3, '640400', '固原市', '0954', '9540199');
INSERT INTO `t_sys_area` VALUES ('640422', '西吉县', 3, '640400', '固原市', '0954', '9540299');
INSERT INTO `t_sys_area` VALUES ('640423', '隆德县', 3, '640400', '固原市', '0954', '9540399');
INSERT INTO `t_sys_area` VALUES ('640424', '泾源县', 3, '640400', '固原市', '0954', '9540499');
INSERT INTO `t_sys_area` VALUES ('640425', '彭阳县', 3, '640400', '固原市', '0954', '9540599');
INSERT INTO `t_sys_area` VALUES ('640500', '中卫市', 2, '640000', '宁夏回族自治区', '1953', NULL);
INSERT INTO `t_sys_area` VALUES ('640502', '沙坡头区', 3, '640500', '中卫市', '1953', '9550199');
INSERT INTO `t_sys_area` VALUES ('640521', '中宁县', 3, '640500', '中卫市', '1953', '9550299');
INSERT INTO `t_sys_area` VALUES ('640522', '海原县', 3, '640500', '中卫市', '1953', '9550399');
INSERT INTO `t_sys_area` VALUES ('650000', '新疆维吾尔自治区', 1, '000000', '中华人民共和国', NULL, NULL);
INSERT INTO `t_sys_area` VALUES ('650100', '乌鲁木齐市', 2, '650000', '新疆维吾尔自治区', '0991', NULL);
INSERT INTO `t_sys_area` VALUES ('650102', '天山区', 3, '650100', '乌鲁木齐市', '0991', '9910199');
INSERT INTO `t_sys_area` VALUES ('650103', '沙依巴克区', 3, '650100', '乌鲁木齐市', '0991', '9910299');
INSERT INTO `t_sys_area` VALUES ('650104', '新市区', 3, '650100', '乌鲁木齐市', '0991', '9910399');
INSERT INTO `t_sys_area` VALUES ('650105', '水磨沟区', 3, '650100', '乌鲁木齐市', '0991', '9910499');
INSERT INTO `t_sys_area` VALUES ('650106', '头屯河区', 3, '650100', '乌鲁木齐市', '0991', '9910599');
INSERT INTO `t_sys_area` VALUES ('650107', '达坂城区', 3, '650100', '乌鲁木齐市', '0991', '9910699');
INSERT INTO `t_sys_area` VALUES ('650109', '米东区', 3, '650100', '乌鲁木齐市', '0991', '9910799');
INSERT INTO `t_sys_area` VALUES ('650121', '乌鲁木齐县', 3, '650100', '乌鲁木齐市', '0991', '9910899');
INSERT INTO `t_sys_area` VALUES ('650200', '克拉玛依市', 2, '650000', '新疆维吾尔自治区', '0990', NULL);
INSERT INTO `t_sys_area` VALUES ('650202', '独山子区', 3, '650200', '克拉玛依市', '0990', '9900199');
INSERT INTO `t_sys_area` VALUES ('650203', '克拉玛依区', 3, '650200', '克拉玛依市', '0990', '9900299');
INSERT INTO `t_sys_area` VALUES ('650204', '白碱滩区', 3, '650200', '克拉玛依市', '0990', '9900399');
INSERT INTO `t_sys_area` VALUES ('650205', '乌尔禾区', 3, '650200', '克拉玛依市', '0990', '9900499');
INSERT INTO `t_sys_area` VALUES ('650400', '吐鲁番市', 2, '650000', '新疆维吾尔自治区', '0995', NULL);
INSERT INTO `t_sys_area` VALUES ('650402', '高昌区', 3, '650400', '吐鲁番市', '0995', '9950199');
INSERT INTO `t_sys_area` VALUES ('650421', '鄯善县', 3, '650400', '吐鲁番市', '0995', '9950299');
INSERT INTO `t_sys_area` VALUES ('650422', '托克逊县', 3, '650400', '吐鲁番市', '0995', NULL);
INSERT INTO `t_sys_area` VALUES ('650500', '哈密市', 2, '650000', '新疆维吾尔自治区', '0902', NULL);
INSERT INTO `t_sys_area` VALUES ('650502', '伊州区', 3, '650500', '哈密市', '0902', NULL);
INSERT INTO `t_sys_area` VALUES ('650521', '巴里坤哈萨克自治县', 3, '650500', '哈密市', '0902', NULL);
INSERT INTO `t_sys_area` VALUES ('650522', '伊吾县', 3, '650500', '哈密市', '0902', NULL);
INSERT INTO `t_sys_area` VALUES ('652300', '昌吉回族自治州', 2, '650000', '新疆维吾尔自治区', '0994', NULL);
INSERT INTO `t_sys_area` VALUES ('652301', '昌吉市', 3, '652300', '昌吉回族自治州', '0994', '9940199');
INSERT INTO `t_sys_area` VALUES ('652302', '阜康市', 3, '652300', '昌吉回族自治州', '0994', '9940299');
INSERT INTO `t_sys_area` VALUES ('652323', '呼图壁县', 3, '652300', '昌吉回族自治州', '0994', '9940399');
INSERT INTO `t_sys_area` VALUES ('652324', '玛纳斯县', 3, '652300', '昌吉回族自治州', '0994', '9940499');
INSERT INTO `t_sys_area` VALUES ('652325', '奇台县', 3, '652300', '昌吉回族自治州', '0994', '9940599');
INSERT INTO `t_sys_area` VALUES ('652327', '吉木萨尔县', 3, '652300', '昌吉回族自治州', '0994', '9940699');
INSERT INTO `t_sys_area` VALUES ('652328', '木垒哈萨克自治县', 3, '652300', '昌吉回族自治州', '0994', '9940799');
INSERT INTO `t_sys_area` VALUES ('652700', '博尔塔拉蒙古自治州', 2, '650000', '新疆维吾尔自治区', '0909', NULL);
INSERT INTO `t_sys_area` VALUES ('652701', '博乐市', 3, '652700', '博尔塔拉蒙古自治州', '0909', '9090199');
INSERT INTO `t_sys_area` VALUES ('652702', '阿拉山口市', 3, '652700', '博尔塔拉蒙古自治州', '0909', NULL);
INSERT INTO `t_sys_area` VALUES ('652722', '精河县', 3, '652700', '博尔塔拉蒙古自治州', '0909', '9090299');
INSERT INTO `t_sys_area` VALUES ('652723', '温泉县', 3, '652700', '博尔塔拉蒙古自治州', '0909', '9090399');
INSERT INTO `t_sys_area` VALUES ('652800', '巴音郭楞蒙古自治州', 2, '650000', '新疆维吾尔自治区', '0996', NULL);
INSERT INTO `t_sys_area` VALUES ('652801', '库尔勒市', 3, '652800', '巴音郭楞蒙古自治州', '0996', '9960199');
INSERT INTO `t_sys_area` VALUES ('652822', '轮台县', 3, '652800', '巴音郭楞蒙古自治州', '0996', '9960299');
INSERT INTO `t_sys_area` VALUES ('652823', '尉犁县', 3, '652800', '巴音郭楞蒙古自治州', '0996', '9960399');
INSERT INTO `t_sys_area` VALUES ('652824', '若羌县', 3, '652800', '巴音郭楞蒙古自治州', '0996', '9960499');
INSERT INTO `t_sys_area` VALUES ('652825', '且末县', 3, '652800', '巴音郭楞蒙古自治州', '0996', '9960599');
INSERT INTO `t_sys_area` VALUES ('652826', '焉耆回族自治县', 3, '652800', '巴音郭楞蒙古自治州', '0996', '9960699');
INSERT INTO `t_sys_area` VALUES ('652827', '和静县', 3, '652800', '巴音郭楞蒙古自治州', '0996', '9960799');
INSERT INTO `t_sys_area` VALUES ('652828', '和硕县', 3, '652800', '巴音郭楞蒙古自治州', '0996', '9960899');
INSERT INTO `t_sys_area` VALUES ('652829', '博湖县', 3, '652800', '巴音郭楞蒙古自治州', '0996', '9960999');
INSERT INTO `t_sys_area` VALUES ('652900', '阿克苏地区', 2, '650000', '新疆维吾尔自治区', '0997', NULL);
INSERT INTO `t_sys_area` VALUES ('652901', '阿克苏市', 3, '652900', '阿克苏地区', '0997', '9970199');
INSERT INTO `t_sys_area` VALUES ('652922', '温宿县', 3, '652900', '阿克苏地区', '0997', '9970299');
INSERT INTO `t_sys_area` VALUES ('652923', '库车县', 3, '652900', '阿克苏地区', '0997', '9970399');
INSERT INTO `t_sys_area` VALUES ('652924', '沙雅县', 3, '652900', '阿克苏地区', '0997', '9970499');
INSERT INTO `t_sys_area` VALUES ('652925', '新和县', 3, '652900', '阿克苏地区', '0997', '9970599');
INSERT INTO `t_sys_area` VALUES ('652926', '拜城县', 3, '652900', '阿克苏地区', '0997', '9970699');
INSERT INTO `t_sys_area` VALUES ('652927', '乌什县', 3, '652900', '阿克苏地区', '0997', '9970799');
INSERT INTO `t_sys_area` VALUES ('652928', '阿瓦提县', 3, '652900', '阿克苏地区', '0997', '9970899');
INSERT INTO `t_sys_area` VALUES ('652929', '柯坪县', 3, '652900', '阿克苏地区', '0997', '9970999');
INSERT INTO `t_sys_area` VALUES ('653000', '克孜勒苏柯尔克孜自治州', 2, '650000', '新疆维吾尔自治区', '0908', NULL);
INSERT INTO `t_sys_area` VALUES ('653001', '阿图什市', 3, '653000', '克孜勒苏柯尔克孜自治州', '0908', '9080199');
INSERT INTO `t_sys_area` VALUES ('653022', '阿克陶县', 3, '653000', '克孜勒苏柯尔克孜自治州', '0908', '9080299');
INSERT INTO `t_sys_area` VALUES ('653023', '阿合奇县', 3, '653000', '克孜勒苏柯尔克孜自治州', '0908', '9080399');
INSERT INTO `t_sys_area` VALUES ('653024', '乌恰县', 3, '653000', '克孜勒苏柯尔克孜自治州', '0908', '9080499');
INSERT INTO `t_sys_area` VALUES ('653100', '喀什地区', 2, '650000', '新疆维吾尔自治区', '0998', NULL);
INSERT INTO `t_sys_area` VALUES ('653101', '喀什市', 3, '653100', '喀什地区', '0998', '9980199');
INSERT INTO `t_sys_area` VALUES ('653121', '疏附县', 3, '653100', '喀什地区', '0998', '9980299');
INSERT INTO `t_sys_area` VALUES ('653122', '疏勒县', 3, '653100', '喀什地区', '0998', '9980399');
INSERT INTO `t_sys_area` VALUES ('653123', '英吉沙县', 3, '653100', '喀什地区', '0998', '9980499');
INSERT INTO `t_sys_area` VALUES ('653124', '泽普县', 3, '653100', '喀什地区', '0998', '9980599');
INSERT INTO `t_sys_area` VALUES ('653125', '莎车县', 3, '653100', '喀什地区', '0998', '9980699');
INSERT INTO `t_sys_area` VALUES ('653126', '叶城县', 3, '653100', '喀什地区', '0998', '9980799');
INSERT INTO `t_sys_area` VALUES ('653127', '麦盖提县', 3, '653100', '喀什地区', '0998', '9980899');
INSERT INTO `t_sys_area` VALUES ('653128', '岳普湖县', 3, '653100', '喀什地区', '0998', '9980999');
INSERT INTO `t_sys_area` VALUES ('653129', '伽师县', 3, '653100', '喀什地区', '0998', '9981099');
INSERT INTO `t_sys_area` VALUES ('653130', '巴楚县', 3, '653100', '喀什地区', '0998', '9981199');
INSERT INTO `t_sys_area` VALUES ('653131', '塔什库尔干塔吉克自治县', 3, '653100', '喀什地区', '0998', '9981299');
INSERT INTO `t_sys_area` VALUES ('653200', '和田地区', 2, '650000', '新疆维吾尔自治区', '0903', NULL);
INSERT INTO `t_sys_area` VALUES ('653201', '和田市', 3, '653200', '和田地区', '0903', '9030199');
INSERT INTO `t_sys_area` VALUES ('653221', '和田县', 3, '653200', '和田地区', '0903', '9030299');
INSERT INTO `t_sys_area` VALUES ('653222', '墨玉县', 3, '653200', '和田地区', '0903', '9030399');
INSERT INTO `t_sys_area` VALUES ('653223', '皮山县', 3, '653200', '和田地区', '0903', '9030499');
INSERT INTO `t_sys_area` VALUES ('653224', '洛浦县', 3, '653200', '和田地区', '0903', '9030599');
INSERT INTO `t_sys_area` VALUES ('653225', '策勒县', 3, '653200', '和田地区', '0903', '9030699');
INSERT INTO `t_sys_area` VALUES ('653226', '于田县', 3, '653200', '和田地区', '0903', '9030799');
INSERT INTO `t_sys_area` VALUES ('653227', '民丰县', 3, '653200', '和田地区', '0903', '9030899');
INSERT INTO `t_sys_area` VALUES ('654000', '伊犁哈萨克自治州', 2, '650000', '新疆维吾尔自治区', '0999', NULL);
INSERT INTO `t_sys_area` VALUES ('654002', '伊宁市', 3, '654000', '伊犁哈萨克自治州', '0999', '9920199');
INSERT INTO `t_sys_area` VALUES ('654003', '奎屯市', 3, '654000', '伊犁哈萨克自治州', '0999', '9920299');
INSERT INTO `t_sys_area` VALUES ('654004', '霍尔果斯市', 3, '654000', '伊犁哈萨克自治州', '0999', NULL);
INSERT INTO `t_sys_area` VALUES ('654021', '伊宁县', 3, '654000', '伊犁哈萨克自治州', '0999', '9920399');
INSERT INTO `t_sys_area` VALUES ('654022', '察布查尔锡伯自治县', 3, '654000', '伊犁哈萨克自治州', '0999', '9920499');
INSERT INTO `t_sys_area` VALUES ('654023', '霍城县', 3, '654000', '伊犁哈萨克自治州', '0999', '9920599');
INSERT INTO `t_sys_area` VALUES ('654024', '巩留县', 3, '654000', '伊犁哈萨克自治州', '0999', '9920699');
INSERT INTO `t_sys_area` VALUES ('654025', '新源县', 3, '654000', '伊犁哈萨克自治州', '0999', '9920799');
INSERT INTO `t_sys_area` VALUES ('654026', '昭苏县', 3, '654000', '伊犁哈萨克自治州', '0999', '9920899');
INSERT INTO `t_sys_area` VALUES ('654027', '特克斯县', 3, '654000', '伊犁哈萨克自治州', '0999', '9920999');
INSERT INTO `t_sys_area` VALUES ('654028', '尼勒克县', 3, '654000', '伊犁哈萨克自治州', '0999', '9921099');
INSERT INTO `t_sys_area` VALUES ('654200', '塔城地区', 2, '650000', '新疆维吾尔自治区', '0901', NULL);
INSERT INTO `t_sys_area` VALUES ('654201', '塔城市', 3, '654200', '塔城地区', '0901', '9010199');
INSERT INTO `t_sys_area` VALUES ('654202', '乌苏市', 3, '654200', '塔城地区', '0901', '9010299');
INSERT INTO `t_sys_area` VALUES ('654221', '额敏县', 3, '654200', '塔城地区', '0901', '9010399');
INSERT INTO `t_sys_area` VALUES ('654223', '沙湾县', 3, '654200', '塔城地区', '0901', '9010499');
INSERT INTO `t_sys_area` VALUES ('654224', '托里县', 3, '654200', '塔城地区', '0901', '9010599');
INSERT INTO `t_sys_area` VALUES ('654225', '裕民县', 3, '654200', '塔城地区', '0901', '9010699');
INSERT INTO `t_sys_area` VALUES ('654226', '和布克赛尔蒙古自治县', 3, '654200', '塔城地区', '0901', '9010799');
INSERT INTO `t_sys_area` VALUES ('654300', '阿勒泰地区', 2, '650000', '新疆维吾尔自治区', '0906', NULL);
INSERT INTO `t_sys_area` VALUES ('654301', '阿勒泰市', 3, '654300', '阿勒泰地区', '0906', '9060199');
INSERT INTO `t_sys_area` VALUES ('654321', '布尔津县', 3, '654300', '阿勒泰地区', '0906', '9060299');
INSERT INTO `t_sys_area` VALUES ('654322', '富蕴县', 3, '654300', '阿勒泰地区', '0906', '9060399');
INSERT INTO `t_sys_area` VALUES ('654323', '福海县', 3, '654300', '阿勒泰地区', '0906', '9060499');
INSERT INTO `t_sys_area` VALUES ('654324', '哈巴河县', 3, '654300', '阿勒泰地区', '0906', '9060599');
INSERT INTO `t_sys_area` VALUES ('654325', '青河县', 3, '654300', '阿勒泰地区', '0906', '9060699');
INSERT INTO `t_sys_area` VALUES ('654326', '吉木乃县', 3, '654300', '阿勒泰地区', '0906', '9060799');
INSERT INTO `t_sys_area` VALUES ('659001', '石河子市', 2, '650000', '新疆维吾尔自治区', '0993', '9930099');
INSERT INTO `t_sys_area` VALUES ('659002', '阿拉尔市', 2, '650000', '新疆维吾尔自治区', '1997', '9990199');
INSERT INTO `t_sys_area` VALUES ('659003', '图木舒克市', 2, '650000', '新疆维吾尔自治区', '1998', '9981399');
INSERT INTO `t_sys_area` VALUES ('659004', '五家渠市', 2, '650000', '新疆维吾尔自治区', '1994', '9940899');
INSERT INTO `t_sys_area` VALUES ('659005', '北屯市', 2, '650000', '新疆维吾尔自治区', '1906', NULL);
INSERT INTO `t_sys_area` VALUES ('659006', '铁门关市', 2, '650000', '新疆维吾尔自治区', '1996', NULL);
INSERT INTO `t_sys_area` VALUES ('659007', '双河市', 2, '650000', '新疆维吾尔自治区', '1909', NULL);
INSERT INTO `t_sys_area` VALUES ('659008', '可克达拉市', 2, '650000', '新疆维吾尔自治区', '1999', NULL);
INSERT INTO `t_sys_area` VALUES ('659009', '昆玉市', 2, '650000', '新疆维吾尔自治区', '1903', NULL);

-- ----------------------------
-- Table structure for t_sys_file
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_file`;
CREATE TABLE `t_sys_file`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '显示名称',
  `suffix` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '后缀',
  `version` int(11) NOT NULL COMMENT '版本信息id',
  `code` int(11) NOT NULL COMMENT '版本号',
  `key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件标识',
  `size` bigint(20) NOT NULL COMMENT '文件大小',
  `url` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件存放url',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `check_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '校验方式',
  `check_code` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '校验码',
  `state` bit(1) NOT NULL COMMENT '逻辑删除用的标识',
  `create_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统文件记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_sys_log
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_log`;
CREATE TABLE `t_sys_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作名称',
  `success` int(4) NULL DEFAULT NULL COMMENT '状态码成功与否',
  `from_address` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作者的地址',
  `target_address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作资源的目标地址',
  `method` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '方法/动作',
  `parameter` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数',
  `operator_id` bigint(20) NULL DEFAULT NULL COMMENT '操作者id',
  `operator_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作者名称',
  `note` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作备注',
  `success_quantity` int(11) NULL DEFAULT 0 COMMENT '成功数量  successQuantity=updateQuantity+saveQuantity',
  `update_quantity` int(11) NULL DEFAULT 0 COMMENT '更新数量',
  `insert_quantity` int(11) NULL DEFAULT NULL COMMENT '插入数量',
  `create_date` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sys_log
-- ----------------------------
INSERT INTO `t_sys_log` VALUES (1, '22222', 22222222, '2222', '2222222', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2019-02-02 14:00:32');

-- ----------------------------
-- Table structure for t_sys_message
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_message`;
CREATE TABLE `t_sys_message`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '系统通知ID',
  `send_id` bigint(8) NOT NULL COMMENT '接受者ID',
  `group_id` bigint(3) NOT NULL COMMENT '用户组ID',
  `send_default` bigint(8) NOT NULL COMMENT '1时发送所有用户，0时则不采用',
  `system_topic` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '通知内容',
  `system_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '通知内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统通知表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_sys_personal_address
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_personal_address`;
CREATE TABLE `t_sys_personal_address`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '名称',
  `cellphone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机',
  `area_main` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '省市区',
  `area_deatil` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '具体地址',
  `province_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '省',
  `city_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '市',
  `district_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '区',
  `town_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '镇',
  `road` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '街道',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `phone_area_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机区号',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地址标签',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sys_personal_address
-- ----------------------------
INSERT INTO `t_sys_personal_address` VALUES (1, '王三元', '18107200666', '湖北省十堰市茅箭区', '五堰街道和昌国际城二期C49-2702', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '家', '最近一次用的地址');
INSERT INTO `t_sys_personal_address` VALUES (2, NULL, NULL, '浙江省台州市玉环市', '玉环县汽摩工业园区 金泰机械锻造有限公司（收发室代收）', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_personal_address` VALUES (3, NULL, NULL, '上海市浦东新区', '杨高南路秀沿西路  绿地香颂附近（中国电信园区对面）', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_personal_address` VALUES (4, '中国电信园区', NULL, '上海市浦东新区', '杨高南路5678号中国电信园区（北门）', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_personal_address` VALUES (5, NULL, NULL, '上海市浦东新区', '宏雅路151弄保集澜湾一期34号701室', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_personal_address` VALUES (6, '易联互动网络信息技术', NULL, NULL, '易联互动网络信息技术（北京）有限公司  上海分部', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for t_sys_resource
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_resource`;
CREATE TABLE `t_sys_resource`  (
  `id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `resource_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '资源名',
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '备注',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '资源路径',
  `parent_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上级节点ID',
  `priority` int(2) NOT NULL DEFAULT 0 COMMENT '优先级',
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '资源类型（PART，LINK，ACTION）',
  `method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '请求方法（GET，POST，ALL）',
  `create_date` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_date` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sys_resource
-- ----------------------------
INSERT INTO `t_sys_resource` VALUES ('00ae08ddc3eaef70', '根据categoryCode查找价目名称', '条件为categoryCode', '/category/list/price/names', NULL, 2, 'LINK', 'ALL', '2018-03-23 16:39:23', NULL);
INSERT INTO `t_sys_resource` VALUES ('1', '系统管理', '', '', '1', 1, 'ROOT', 'ALL', '2018-03-23 16:39:16', NULL);
INSERT INTO `t_sys_resource` VALUES ('1642e8866a19088f', '查询客户家庭档案数据', '条件为 客户id', '/member/family/list', NULL, 2, 'ACTION', 'GET', '2018-03-23 16:39:23', NULL);
INSERT INTO `t_sys_resource` VALUES ('2', '合作方管理', '', '', '1', 1, 'ROOT', 'ALL', '2018-03-23 16:39:16', NULL);
INSERT INTO `t_sys_resource` VALUES ('269da22f08d71f49', '查询客户地址列表数据', '条件为 客户id', '/member/address/list/custom', NULL, 2, 'ACTION', 'ALL', '2018-03-23 16:39:23', NULL);
INSERT INTO `t_sys_resource` VALUES ('2c792d00085dea82', '据根节点的产品编码找下一级产品集合', '条件为节点的产品编码是必要的', '/category/list/children', NULL, 2, 'LINK', 'ALL', '2018-03-23 16:39:23', NULL);
INSERT INTO `t_sys_resource` VALUES ('3', '会员管理', '', '', '1', 1, 'ROOT', 'ALL', '2018-03-23 16:39:16', NULL);
INSERT INTO `t_sys_resource` VALUES ('4', '套餐管理', '', '', '1', 1, 'ROOT', 'ALL', '2018-03-23 16:39:16', NULL);
INSERT INTO `t_sys_resource` VALUES ('4f1f86319a41a0c4', '跳转客户列表页面', '跳转客户列表页面', '/member/query', NULL, 2, 'LINK', 'GET', '2018-03-23 16:39:23', NULL);
INSERT INTO `t_sys_resource` VALUES ('5', '订单管理', '', '', '1', 1, 'ROOT', 'ALL', '2018-03-23 16:39:16', NULL);
INSERT INTO `t_sys_resource` VALUES ('6', '坐席页面', '', '', '1', 1, 'ROOT', 'ALL', '2018-03-23 16:39:16', NULL);
INSERT INTO `t_sys_resource` VALUES ('6ea6b346ff0c5a53', '更新客户信息', '条件为 CustomQuery', '/member/update', NULL, 2, 'ACTION', 'ALL', '2018-03-23 16:39:23', NULL);
INSERT INTO `t_sys_resource` VALUES ('7', '服务管理', '', '', '1', 1, 'ROOT', 'ALL', '2018-03-23 16:39:16', NULL);
INSERT INTO `t_sys_resource` VALUES ('8', '短信管理', '', '', '1', 1, 'ROOT', 'ALL', '2018-03-23 16:39:16', NULL);
INSERT INTO `t_sys_resource` VALUES ('82604fc77d190931', ' 通过id 查询客户数据', '条件为 客户id', '/member/get', NULL, 2, 'ACTION', 'ALL', '2018-03-23 16:39:23', NULL);
INSERT INTO `t_sys_resource` VALUES ('91ed1a9fd3e8ecfd', '跳转客户编辑页面', '跳转客户编辑页面', '/member/edit', NULL, 2, 'LINK', 'GET', '2018-03-23 16:39:23', NULL);
INSERT INTO `t_sys_resource` VALUES ('93f3a482d1cde3a9', '查询客户列表数据', '条件为 查询对象', '/member/page', NULL, 2, 'LINK', 'ALL', '2018-03-23 16:39:23', NULL);
INSERT INTO `t_sys_resource` VALUES ('b0ce8e4310081d4f', '以Excel格式导出 客户数据', '直接返回excel文件', '/member/exportExcelPox', NULL, 2, 'ACTION', 'ALL', '2018-03-23 16:39:23', NULL);
INSERT INTO `t_sys_resource` VALUES ('beb7aee137537908', '查询客户订单记录数据', '条件为 CustomQuery', '/member/order/list/custom', NULL, 2, 'ACTION', 'ALL', '2018-03-23 16:39:23', NULL);
INSERT INTO `t_sys_resource` VALUES ('c48519ec5a498dda', '更新客户的家庭记录', '条件为 家庭记录的对象', '/member/family/update', NULL, 2, 'ACTION', 'ALL', '2018-03-23 16:39:23', NULL);
INSERT INTO `t_sys_resource` VALUES ('cb7516f5fb187be2', '查询客户客户权益数据', '条件为 CustomQuery', '/member/packRight/list/custom', NULL, 2, 'ACTION', 'ALL', '2018-03-23 16:39:23', NULL);
INSERT INTO `t_sys_resource` VALUES ('dd9d8b5ac6f8b0bd', '查询客户套餐列表基本数据', '条件为 客户id', '/member/subscription/list/custom', NULL, 2, 'ACTION', 'ALL', '2018-03-23 16:39:23', NULL);

-- ----------------------------
-- Table structure for t_sys_role
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_role`;
CREATE TABLE `t_sys_role`  (
  `id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '自增id',
  `role_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `root_admin` int(2) NOT NULL COMMENT '是否系统管理员',
  `state` int(2) NOT NULL COMMENT '状态',
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注 描述',
  `create_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_date` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_sys_role_resource
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_role_resource`;
CREATE TABLE `t_sys_role_resource`  (
  `role_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色ID',
  `resource_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '资源ID',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`, `resource_id`) USING BTREE,
  INDEX `realm_id`(`resource_id`) USING BTREE,
  CONSTRAINT `t_sys_role_resource_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `t_sys_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_sys_role_resource_ibfk_2` FOREIGN KEY (`resource_id`) REFERENCES `t_sys_resource` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色资源表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_sys_user
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_user`;
CREATE TABLE `t_sys_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `status` int(11) NULL DEFAULT 0 COMMENT '账号状态状态，status, condition, mode, position, state of affairs, fettle',
  `create_date` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_date` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 66 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sys_user
-- ----------------------------
INSERT INTO `t_sys_user` VALUES (1, '11112222', 'avatar11111', 1, '2018-03-01 16:00:04', '2018-03-01 16:00:11');
INSERT INTO `t_sys_user` VALUES (2, '1111', 'avatar11111', 1, '2018-03-01 16:01:00', '2018-03-07 16:01:05');
INSERT INTO `t_sys_user` VALUES (3, '毛熊', '3', 1, '2018-03-20 09:38:48', NULL);
INSERT INTO `t_sys_user` VALUES (4, '高丽', '4', 1, '2018-03-20 09:43:53', NULL);
INSERT INTO `t_sys_user` VALUES (5, '二毛', '5', 1, '2018-03-22 10:14:13', NULL);
INSERT INTO `t_sys_user` VALUES (6, '长鹿', '6', 1, '2018-03-22 21:13:04', NULL);
INSERT INTO `t_sys_user` VALUES (7, '狮子', '7', 1, '2018-03-22 21:19:47', NULL);
INSERT INTO `t_sys_user` VALUES (8, '老鼠', '7', 1, '2018-03-22 21:24:48', NULL);
INSERT INTO `t_sys_user` VALUES (9, '山鸡', '8', 1, '2018-03-22 21:25:55', NULL);
INSERT INTO `t_sys_user` VALUES (49, 'aa', 'aa', 1, '2019-03-21 15:16:30', NULL);
INSERT INTO `t_sys_user` VALUES (50, 'aaaa', 'aa', 1, '2019-03-21 15:16:47', NULL);
INSERT INTO `t_sys_user` VALUES (51, 'aaaa', 'aa', 1, '2019-03-21 15:17:15', NULL);
INSERT INTO `t_sys_user` VALUES (52, 'BB', 'bb', 1, '2019-03-21 16:10:19', NULL);
INSERT INTO `t_sys_user` VALUES (53, 'BB', 'bb', 1, '2019-03-21 16:11:13', NULL);
INSERT INTO `t_sys_user` VALUES (54, 'ewrw', 'avatar11111', 1, '2019-03-22 11:53:50', NULL);
INSERT INTO `t_sys_user` VALUES (55, 'ewrw', 'avatar11111', 1, '2019-03-22 11:53:57', NULL);
INSERT INTO `t_sys_user` VALUES (56, 'ewrw', 'avatar11111', 1, '2019-03-22 11:54:50', NULL);
INSERT INTO `t_sys_user` VALUES (57, 'ewrw', 'avatar11111', 1, '2019-03-22 11:55:50', NULL);
INSERT INTO `t_sys_user` VALUES (65, 'ssss', 'aaaa', NULL, '2019-04-04 16:46:39', NULL);
INSERT INTO `t_sys_user` VALUES (66, 'ssss', 'aaaa', NULL, '2019-04-04 18:00:56', NULL);

-- ----------------------------
-- Table structure for t_sys_user_area
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_user_area`;
CREATE TABLE `t_sys_user_area`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `area_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '地址',
  `create_date` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`user_id`, `area_code`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_sys_user_auth
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_user_auth`;
CREATE TABLE `t_sys_user_auth`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NULL DEFAULT NULL,
  `identifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标识（手机号 邮箱 用户名或第三方应用的唯一标识）',
  `credential` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码凭证（站内的保存密码，站外的不保存或保存token）',
  `identity_type` int(11) NULL DEFAULT 1 COMMENT '登录类型（1用户名 2手机号3 邮箱 4微信 5微博等）',
  `status` int(11) NULL DEFAULT NULL COMMENT '状态(逻辑删除/停用)',
  `verified` int(11) NULL DEFAULT NULL COMMENT '验证与否',
  `create_date` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_date` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户授权信息表 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sys_user_auth
-- ----------------------------
INSERT INTO `t_sys_user_auth` VALUES (1, 1, 'admin', 'admin', 1, 1, 1, '2019-01-29 16:13:28', '2019-01-29 16:13:28');
INSERT INTO `t_sys_user_auth` VALUES (2, 2, 'test', 'admin', 1, 1, 1, '2019-01-29 16:13:19', '2019-01-29 16:13:19');

-- ----------------------------
-- Table structure for t_sys_user_group
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_user_group`;
CREATE TABLE `t_sys_user_group`  (
  `id` tinyint(3) NOT NULL AUTO_INCREMENT COMMENT '自增ID号',
  `group_id` tinyint(3) NOT NULL COMMENT '用户组ID',
  `group_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户组名',
  `group_power` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户权限',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户组表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_user_role`;
CREATE TABLE `t_sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色ID',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE,
  INDEX `role_id`(`role_id`) USING BTREE,
  CONSTRAINT `t_sys_user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_sys_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_sys_user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `t_sys_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tenant
-- ----------------------------
DROP TABLE IF EXISTS `tenant`;
CREATE TABLE `tenant`  (
  `test_id` bigint(20) NOT NULL COMMENT '主键ID',
  `tenant_id` bigint(20) NOT NULL COMMENT '租户ID',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '名称',
  `age` int(11) NULL DEFAULT NULL COMMENT '年龄',
  `test_type` int(11) NULL DEFAULT NULL COMMENT '测试下划线字段命名类型',
  `test_date` datetime(0) NULL DEFAULT NULL COMMENT '日期',
  `role` bigint(20) NULL DEFAULT NULL COMMENT '测试',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号码',
  PRIMARY KEY (`test_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tenant
-- ----------------------------
INSERT INTO `tenant` VALUES (0, 1, '雷锋', 1, 1, '2017-01-01 01:01:01', 1, '10010');
INSERT INTO `tenant` VALUES (1, 1, '三毛', 2, 1, '2017-02-02 01:01:01', 1, '10086');
INSERT INTO `tenant` VALUES (2, 1, '小马', 1, 1, '2017-03-03 01:01:01', 1, '10000');
INSERT INTO `tenant` VALUES (3, 2, '测试', 1, 1, '2017-03-03 01:01:01', 1, '10000');
INSERT INTO `tenant` VALUES (4, 2, '东狗', 2, 1, '2017-03-03 01:01:01', 1, '10086');
INSERT INTO `tenant` VALUES (5, 1, '王五', 2, 1, '2017-03-03 01:01:01', 1, '10010');

SET FOREIGN_KEY_CHECKS = 1;
