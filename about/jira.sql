/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : 127.0.0.1:3306
 Source Schema         : jira

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 08/04/2019 13:37:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ao_0ac321_recommendation_ao
-- ----------------------------
DROP TABLE IF EXISTS `ao_0ac321_recommendation_ao`;
CREATE TABLE `ao_0ac321_recommendation_ao`  (
  `CATEGORY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CUSTOM_FIELD_ID` bigint(20) NULL DEFAULT NULL,
  `ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PERFORMANCE_IMPACT` double NULL DEFAULT NULL,
  `PROJECT_IDS` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `RESOLVED` tinyint(1) NULL DEFAULT NULL,
  `TYPE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_21d670_whitelist_rules
-- ----------------------------
DROP TABLE IF EXISTS `ao_21d670_whitelist_rules`;
CREATE TABLE `ao_21d670_whitelist_rules`  (
  `ALLOWINBOUND` tinyint(1) NULL DEFAULT NULL,
  `EXPRESSION` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TYPE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ao_21d670_whitelist_rules
-- ----------------------------
INSERT INTO `ao_21d670_whitelist_rules` VALUES (0, 'http://www.atlassian.com/*', 1, 'WILDCARD_EXPRESSION');
INSERT INTO `ao_21d670_whitelist_rules` VALUES (0, 'http://www.atlassian.com/*', 2, 'WILDCARD_EXPRESSION');

-- ----------------------------
-- Table structure for ao_21f425_message_ao
-- ----------------------------
DROP TABLE IF EXISTS `ao_21f425_message_ao`;
CREATE TABLE `ao_21f425_message_ao`  (
  `CONTENT` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_21f425_message_mapping_ao
-- ----------------------------
DROP TABLE IF EXISTS `ao_21f425_message_mapping_ao`;
CREATE TABLE `ao_21f425_message_mapping_ao`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MESSAGE_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `USER_HASH` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `index_ao_21f425_mes1965715920`(`MESSAGE_ID`) USING BTREE,
  INDEX `index_ao_21f425_mes223897723`(`USER_HASH`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_21f425_user_property_ao
-- ----------------------------
DROP TABLE IF EXISTS `ao_21f425_user_property_ao`;
CREATE TABLE `ao_21f425_user_property_ao`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `KEY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `USER` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `index_ao_21f425_use1458667739`(`USER`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_38321b_custom_content_link
-- ----------------------------
DROP TABLE IF EXISTS `ao_38321b_custom_content_link`;
CREATE TABLE `ao_38321b_custom_content_link`  (
  `CONTENT_KEY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LINK_LABEL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LINK_URL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SEQUENCE` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `index_ao_38321b_cus1828044926`(`CONTENT_KEY`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_3b1893_loop_detection
-- ----------------------------
DROP TABLE IF EXISTS `ao_3b1893_loop_detection`;
CREATE TABLE `ao_3b1893_loop_detection`  (
  `COUNTER` int(11) NOT NULL DEFAULT 0,
  `EXPIRES_AT` bigint(20) NOT NULL DEFAULT 0,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SENDER_EMAIL` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_4789dd_health_check_status
-- ----------------------------
DROP TABLE IF EXISTS `ao_4789dd_health_check_status`;
CREATE TABLE `ao_4789dd_health_check_status`  (
  `APPLICATION_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COMPLETE_KEY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `FAILED_DATE` datetime(0) NULL DEFAULT NULL,
  `FAILURE_REASON` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IS_HEALTHY` tinyint(1) NULL DEFAULT NULL,
  `IS_RESOLVED` tinyint(1) NULL DEFAULT NULL,
  `RESOLVED_DATE` datetime(0) NULL DEFAULT NULL,
  `SEVERITY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STATUS_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ao_4789dd_health_check_status
-- ----------------------------
INSERT INTO `ao_4789dd_health_check_status` VALUES ('JIRA', 'com.atlassian.troubleshooting.plugin-jira:gadgetFeedUrlHealthCheck', '检查Jira是否能够通过小工具源URL访问自身，以确保仪表盘小工具正常工作。', '2019-03-07 22:35:33', 'Jira不能通过小工具源URL访问自身。这是必要的，以便可以成功生成仪表板小工具。请核准当前的基本URL，如果有必要，检查您的网络配置，以便解决问题。', 1, 0, 0, NULL, 'WARNING', '小工具源URL');
INSERT INTO `ao_4789dd_health_check_status` VALUES ('JIRA', 'com.atlassian.troubleshooting.plugin-jira:collationHealthCheck', '检查是否使用所需排序规则配置数据库和表格。', '2019-03-07 22:35:33', 'Jira不支持数据库排序规则“utf8mb4_general_ci”和表格排序规则“utf8mb4_general_ci”。', 2, 0, 0, NULL, 'CRITICAL', '排序规则');

-- ----------------------------
-- Table structure for ao_4789dd_properties
-- ----------------------------
DROP TABLE IF EXISTS `ao_4789dd_properties`;
CREATE TABLE `ao_4789dd_properties`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PROPERTY_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `PROPERTY_VALUE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ao_4789dd_properties
-- ----------------------------
INSERT INTO `ao_4789dd_properties` VALUES (1, 'last-run', '1552012120714');

-- ----------------------------
-- Table structure for ao_4789dd_read_notifications
-- ----------------------------
DROP TABLE IF EXISTS `ao_4789dd_read_notifications`;
CREATE TABLE `ao_4789dd_read_notifications`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IS_SNOOZED` tinyint(1) NULL DEFAULT NULL,
  `NOTIFICATION_ID` int(11) NOT NULL,
  `SNOOZE_COUNT` int(11) NULL DEFAULT NULL,
  `SNOOZE_DATE` datetime(0) NULL DEFAULT NULL,
  `USER_KEY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ao_4789dd_read_notifications
-- ----------------------------
INSERT INTO `ao_4789dd_read_notifications` VALUES (1, 1, 2, 1, '2019-03-07 22:36:30', 'yc');
INSERT INTO `ao_4789dd_read_notifications` VALUES (2, 1, 1, 1, '2019-03-07 22:36:32', 'yc');

-- ----------------------------
-- Table structure for ao_4789dd_task_monitor
-- ----------------------------
DROP TABLE IF EXISTS `ao_4789dd_task_monitor`;
CREATE TABLE `ao_4789dd_task_monitor`  (
  `CLUSTERED_TASK_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint(20) NULL DEFAULT 0,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NODE_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PROGRESS_MESSAGE` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `PROGRESS_PERCENTAGE` int(11) NULL DEFAULT NULL,
  `SERIALIZED_ERRORS` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `SERIALIZED_WARNINGS` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `TASK_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TASK_MONITOR_KIND` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TASK_STATUS` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `U_AO_4789DD_TASK_MO1827547914`(`TASK_ID`) USING BTREE,
  INDEX `index_ao_4789dd_tas42846517`(`TASK_MONITOR_KIND`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_4aeacd_webhook_dao
-- ----------------------------
DROP TABLE IF EXISTS `ao_4aeacd_webhook_dao`;
CREATE TABLE `ao_4aeacd_webhook_dao`  (
  `ENABLED` tinyint(1) NULL DEFAULT NULL,
  `ENCODED_EVENTS` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `FILTER` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `JQL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LAST_UPDATED` datetime(0) NOT NULL,
  `LAST_UPDATED_USER` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `NAME` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `REGISTRATION_METHOD` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `URL` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `EXCLUDE_ISSUE_DETAILS` tinyint(1) NULL DEFAULT NULL,
  `PARAMETERS` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_550953_shortcut
-- ----------------------------
DROP TABLE IF EXISTS `ao_550953_shortcut`;
CREATE TABLE `ao_550953_shortcut`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PROJECT_ID` bigint(20) NULL DEFAULT NULL,
  `SHORTCUT_URL` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `URL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ICON` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `index_ao_550953_sho1778115994`(`PROJECT_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_563aee_activity_entity
-- ----------------------------
DROP TABLE IF EXISTS `ao_563aee_activity_entity`;
CREATE TABLE `ao_563aee_activity_entity`  (
  `ACTIVITY_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ACTOR_ID` int(11) NULL DEFAULT NULL,
  `CONTENT` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `GENERATOR_DISPLAY_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `GENERATOR_ID` varchar(450) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ICON_ID` int(11) NULL DEFAULT NULL,
  `ID` varchar(450) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ISSUE_KEY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OBJECT_ID` int(11) NULL DEFAULT NULL,
  `POSTER` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PROJECT_KEY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PUBLISHED` datetime(0) NULL DEFAULT NULL,
  `TARGET_ID` int(11) NULL DEFAULT NULL,
  `TITLE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `URL` varchar(450) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VERB` varchar(450) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ACTIVITY_ID`) USING BTREE,
  INDEX `index_ao_563aee_act995325379`(`ACTOR_ID`) USING BTREE,
  INDEX `index_ao_563aee_act972488439`(`ICON_ID`) USING BTREE,
  INDEX `index_ao_563aee_act1642652291`(`OBJECT_ID`) USING BTREE,
  INDEX `index_ao_563aee_act1978295567`(`TARGET_ID`) USING BTREE,
  CONSTRAINT `fk_ao_563aee_activity_entity_actor_id` FOREIGN KEY (`ACTOR_ID`) REFERENCES `ao_563aee_actor_entity` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_ao_563aee_activity_entity_icon_id` FOREIGN KEY (`ICON_ID`) REFERENCES `ao_563aee_media_link_entity` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_ao_563aee_activity_entity_object_id` FOREIGN KEY (`OBJECT_ID`) REFERENCES `ao_563aee_object_entity` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_ao_563aee_activity_entity_target_id` FOREIGN KEY (`TARGET_ID`) REFERENCES `ao_563aee_target_entity` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_563aee_actor_entity
-- ----------------------------
DROP TABLE IF EXISTS `ao_563aee_actor_entity`;
CREATE TABLE `ao_563aee_actor_entity`  (
  `FULL_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PROFILE_PAGE_URI` varchar(450) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PROFILE_PICTURE_URI` varchar(450) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_563aee_media_link_entity
-- ----------------------------
DROP TABLE IF EXISTS `ao_563aee_media_link_entity`;
CREATE TABLE `ao_563aee_media_link_entity`  (
  `DURATION` int(11) NULL DEFAULT NULL,
  `HEIGHT` int(11) NULL DEFAULT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `URL` varchar(450) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WIDTH` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_563aee_object_entity
-- ----------------------------
DROP TABLE IF EXISTS `ao_563aee_object_entity`;
CREATE TABLE `ao_563aee_object_entity`  (
  `CONTENT` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IMAGE_ID` int(11) NULL DEFAULT NULL,
  `OBJECT_ID` varchar(450) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OBJECT_TYPE` varchar(450) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SUMMARY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `URL` varchar(450) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `index_ao_563aee_obj696886343`(`IMAGE_ID`) USING BTREE,
  CONSTRAINT `fk_ao_563aee_object_entity_image_id` FOREIGN KEY (`IMAGE_ID`) REFERENCES `ao_563aee_media_link_entity` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_563aee_target_entity
-- ----------------------------
DROP TABLE IF EXISTS `ao_563aee_target_entity`;
CREATE TABLE `ao_563aee_target_entity`  (
  `CONTENT` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IMAGE_ID` int(11) NULL DEFAULT NULL,
  `OBJECT_ID` varchar(450) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OBJECT_TYPE` varchar(450) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SUMMARY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `URL` varchar(450) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `index_ao_563aee_tar521440921`(`IMAGE_ID`) USING BTREE,
  CONSTRAINT `fk_ao_563aee_target_entity_image_id` FOREIGN KEY (`IMAGE_ID`) REFERENCES `ao_563aee_media_link_entity` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_575bf5_dev_summary
-- ----------------------------
DROP TABLE IF EXISTS `ao_575bf5_dev_summary`;
CREATE TABLE `ao_575bf5_dev_summary`  (
  `CREATED` datetime(0) NOT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ISSUE_ID` bigint(20) NOT NULL DEFAULT 0,
  `JSON` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `PROVIDER_SOURCE_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `UPDATED` datetime(0) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `index_ao_575bf5_dev996442447`(`PROVIDER_SOURCE_ID`) USING BTREE,
  INDEX `index_ao_575bf5_dev567785983`(`ISSUE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_575bf5_processed_commits
-- ----------------------------
DROP TABLE IF EXISTS `ao_575bf5_processed_commits`;
CREATE TABLE `ao_575bf5_processed_commits`  (
  `COMMIT_HASH` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `METADATA_HASH` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `index_ao_575bf5_pro78019725`(`METADATA_HASH`) USING BTREE,
  INDEX `index_ao_575bf5_pro1681808571`(`COMMIT_HASH`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_575bf5_provider_issue
-- ----------------------------
DROP TABLE IF EXISTS `ao_575bf5_provider_issue`;
CREATE TABLE `ao_575bf5_provider_issue`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ISSUE_ID` bigint(20) NOT NULL DEFAULT 0,
  `PROVIDER_SOURCE_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `STALE_AFTER` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `index_ao_575bf5_pro741170824`(`ISSUE_ID`) USING BTREE,
  INDEX `index_ao_575bf5_pro1348521624`(`PROVIDER_SOURCE_ID`) USING BTREE,
  INDEX `index_ao_575bf5_pro1117502689`(`STALE_AFTER`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_575bf5_provider_seq_no
-- ----------------------------
DROP TABLE IF EXISTS `ao_575bf5_provider_seq_no`;
CREATE TABLE `ao_575bf5_provider_seq_no`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PROVIDER_SOURCE_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SEQUENCE_NO` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `index_ao_575bf5_pro996609822`(`PROVIDER_SOURCE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_587b34_glance_config
-- ----------------------------
DROP TABLE IF EXISTS `ao_587b34_glance_config`;
CREATE TABLE `ao_587b34_glance_config`  (
  `ROOM_ID` bigint(20) NOT NULL DEFAULT 0,
  `STATE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SYNC_NEEDED` tinyint(1) NULL DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `JQL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLICATION_USER_KEY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ROOM_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_587b34_project_config
-- ----------------------------
DROP TABLE IF EXISTS `ao_587b34_project_config`;
CREATE TABLE `ao_587b34_project_config`  (
  `CONFIGURATION_GROUP_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NAME_UNIQUE_CONSTRAINT` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `PROJECT_ID` bigint(20) NOT NULL DEFAULT 0,
  `ROOM_ID` bigint(20) NOT NULL DEFAULT 0,
  `VALUE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `U_AO_587B34_PROJECT2070954277`(`NAME_UNIQUE_CONSTRAINT`) USING BTREE,
  INDEX `index_ao_587b34_pro2093917684`(`PROJECT_ID`) USING BTREE,
  INDEX `index_ao_587b34_pro193829489`(`CONFIGURATION_GROUP_ID`) USING BTREE,
  INDEX `index_ao_587b34_pro1732672724`(`ROOM_ID`) USING BTREE,
  INDEX `index_ao_587b34_pro2115480362`(`NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_5fb9d7_aohip_chat_link
-- ----------------------------
DROP TABLE IF EXISTS `ao_5fb9d7_aohip_chat_link`;
CREATE TABLE `ao_5fb9d7_aohip_chat_link`  (
  `ADDON_TOKEN_EXPIRY` datetime(0) NULL DEFAULT NULL,
  `API_URL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CONNECT_DESCRIPTOR` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `GROUP_ID` int(11) NULL DEFAULT 0,
  `GROUP_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `OAUTH_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SECRET_KEY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SYSTEM_PASSWORD` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SYSTEM_TOKEN_EXPIRY` datetime(0) NULL DEFAULT NULL,
  `SYSTEM_USER` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SYSTEM_USER_TOKEN` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TOKEN` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_5fb9d7_aohip_chat_user
-- ----------------------------
DROP TABLE IF EXISTS `ao_5fb9d7_aohip_chat_user`;
CREATE TABLE `ao_5fb9d7_aohip_chat_user`  (
  `HIP_CHAT_LINK_ID` int(11) NULL DEFAULT NULL,
  `HIP_CHAT_USER_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `HIP_CHAT_USER_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFRESH_CODE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `USER_KEY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `USER_SCOPES` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `USER_TOKEN` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `USER_TOKEN_EXPIRY` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `index_ao_5fb9d7_aoh1981563178`(`USER_KEY`) USING BTREE,
  INDEX `index_ao_5fb9d7_aoh49772492`(`HIP_CHAT_LINK_ID`) USING BTREE,
  CONSTRAINT `fk_ao_5fb9d7_aohip_chat_user_hip_chat_link_id` FOREIGN KEY (`HIP_CHAT_LINK_ID`) REFERENCES `ao_5fb9d7_aohip_chat_link` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_60db71_auditentry
-- ----------------------------
DROP TABLE IF EXISTS `ao_60db71_auditentry`;
CREATE TABLE `ao_60db71_auditentry`  (
  `CATEGORY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DATA` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ENTITY_CLASS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ENTITY_ID` bigint(20) NOT NULL,
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TIME` bigint(20) NULL DEFAULT NULL,
  `USER` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `index_ao_60db71_aud604788536`(`ENTITY_ID`) USING BTREE,
  INDEX `index_ao_60db71_aud137736645`(`ENTITY_CLASS`) USING BTREE,
  INDEX `index_ao_60db71_aud1756477597`(`CATEGORY`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_60db71_boardadmins
-- ----------------------------
DROP TABLE IF EXISTS `ao_60db71_boardadmins`;
CREATE TABLE `ao_60db71_boardadmins`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `KEY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `RAPID_VIEW_ID` bigint(20) NOT NULL,
  `TYPE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `index_ao_60db71_boa2110227660`(`RAPID_VIEW_ID`) USING BTREE,
  CONSTRAINT `fk_ao_60db71_boardadmins_rapid_view_id` FOREIGN KEY (`RAPID_VIEW_ID`) REFERENCES `ao_60db71_rapidview` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_60db71_cardcolor
-- ----------------------------
DROP TABLE IF EXISTS `ao_60db71_cardcolor`;
CREATE TABLE `ao_60db71_cardcolor`  (
  `COLOR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `POS` int(11) NOT NULL DEFAULT 0,
  `RAPID_VIEW_ID` bigint(20) NOT NULL,
  `STRATEGY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VAL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `index_ao_60db71_car2031978979`(`RAPID_VIEW_ID`) USING BTREE,
  CONSTRAINT `fk_ao_60db71_cardcolor_rapid_view_id` FOREIGN KEY (`RAPID_VIEW_ID`) REFERENCES `ao_60db71_rapidview` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_60db71_cardlayout
-- ----------------------------
DROP TABLE IF EXISTS `ao_60db71_cardlayout`;
CREATE TABLE `ao_60db71_cardlayout`  (
  `FIELD_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `MODE_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `POS` int(11) NOT NULL DEFAULT 0,
  `RAPID_VIEW_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `index_ao_60db71_car149237770`(`RAPID_VIEW_ID`) USING BTREE,
  CONSTRAINT `fk_ao_60db71_cardlayout_rapid_view_id` FOREIGN KEY (`RAPID_VIEW_ID`) REFERENCES `ao_60db71_rapidview` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_60db71_column
-- ----------------------------
DROP TABLE IF EXISTS `ao_60db71_column`;
CREATE TABLE `ao_60db71_column`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `MAXIM` double NULL DEFAULT NULL,
  `MINIM` double NULL DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `POS` int(11) NOT NULL DEFAULT 0,
  `RAPID_VIEW_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `index_ao_60db71_col2098611346`(`RAPID_VIEW_ID`) USING BTREE,
  CONSTRAINT `fk_ao_60db71_column_rapid_view_id` FOREIGN KEY (`RAPID_VIEW_ID`) REFERENCES `ao_60db71_rapidview` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_60db71_columnstatus
-- ----------------------------
DROP TABLE IF EXISTS `ao_60db71_columnstatus`;
CREATE TABLE `ao_60db71_columnstatus`  (
  `COLUMN_ID` bigint(20) NOT NULL,
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `POS` int(11) NOT NULL DEFAULT 0,
  `STATUS_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `index_ao_60db71_col1856623434`(`COLUMN_ID`) USING BTREE,
  CONSTRAINT `fk_ao_60db71_columnstatus_column_id` FOREIGN KEY (`COLUMN_ID`) REFERENCES `ao_60db71_column` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_60db71_detailviewfield
-- ----------------------------
DROP TABLE IF EXISTS `ao_60db71_detailviewfield`;
CREATE TABLE `ao_60db71_detailviewfield`  (
  `FIELD_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `POS` int(11) NOT NULL DEFAULT 0,
  `RAPID_VIEW_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `index_ao_60db71_det878495474`(`RAPID_VIEW_ID`) USING BTREE,
  CONSTRAINT `fk_ao_60db71_detailviewfield_rapid_view_id` FOREIGN KEY (`RAPID_VIEW_ID`) REFERENCES `ao_60db71_rapidview` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_60db71_estimatestatistic
-- ----------------------------
DROP TABLE IF EXISTS `ao_60db71_estimatestatistic`;
CREATE TABLE `ao_60db71_estimatestatistic`  (
  `FIELD_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `RAPID_VIEW_ID` bigint(20) NOT NULL,
  `TYPE_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `index_ao_60db71_est1680565966`(`RAPID_VIEW_ID`) USING BTREE,
  CONSTRAINT `fk_ao_60db71_estimatestatistic_rapid_view_id` FOREIGN KEY (`RAPID_VIEW_ID`) REFERENCES `ao_60db71_rapidview` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_60db71_issueranking
-- ----------------------------
DROP TABLE IF EXISTS `ao_60db71_issueranking`;
CREATE TABLE `ao_60db71_issueranking`  (
  `CUSTOM_FIELD_ID` bigint(20) NOT NULL DEFAULT 0,
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ISSUE_ID` bigint(20) NOT NULL DEFAULT 0,
  `NEXT_ID` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `index_ao_60db71_iss1786461035`(`CUSTOM_FIELD_ID`) USING BTREE,
  INDEX `index_ao_60db71_iss1616896230`(`ISSUE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_60db71_issuerankinglog
-- ----------------------------
DROP TABLE IF EXISTS `ao_60db71_issuerankinglog`;
CREATE TABLE `ao_60db71_issuerankinglog`  (
  `CUSTOM_FIELD_ID` bigint(20) NULL DEFAULT NULL,
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ISSUE_ID` bigint(20) NULL DEFAULT NULL,
  `LOG_TYPE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NEW_NEXT_ID` bigint(20) NULL DEFAULT NULL,
  `NEW_PREVIOUS_ID` bigint(20) NULL DEFAULT NULL,
  `OLD_NEXT_ID` bigint(20) NULL DEFAULT NULL,
  `OLD_PREVIOUS_ID` bigint(20) NULL DEFAULT NULL,
  `SANITY_CHECKED` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_60db71_lexorank
-- ----------------------------
DROP TABLE IF EXISTS `ao_60db71_lexorank`;
CREATE TABLE `ao_60db71_lexorank`  (
  `BUCKET` int(11) NULL DEFAULT 0,
  `FIELD_ID` bigint(20) NOT NULL DEFAULT 0,
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ISSUE_ID` bigint(20) NOT NULL DEFAULT 0,
  `LOCK_HASH` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LOCK_TIME` bigint(20) NULL DEFAULT NULL,
  `RANK` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TYPE` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `index_ao_60db71_lex1569533973`(`FIELD_ID`, `RANK`) USING BTREE,
  INDEX `index_ao_60db71_lex1694305086`(`FIELD_ID`, `BUCKET`, `RANK`) USING BTREE,
  INDEX `index_ao_60db71_lex604083109`(`ISSUE_ID`) USING BTREE,
  INDEX `index_ao_60db71_lex1632828616`(`LOCK_HASH`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ao_60db71_lexorank
-- ----------------------------
INSERT INTO `ao_60db71_lexorank` VALUES (0, 10100, 7, -9223372036854775808, NULL, NULL, '0|000000:', 0);
INSERT INTO `ao_60db71_lexorank` VALUES (0, 10100, 8, 9223372036854775807, NULL, NULL, '0|zzzzzz:', 2);

-- ----------------------------
-- Table structure for ao_60db71_lexorankbalancer
-- ----------------------------
DROP TABLE IF EXISTS `ao_60db71_lexorankbalancer`;
CREATE TABLE `ao_60db71_lexorankbalancer`  (
  `DISABLE_RANK_OPERATIONS` tinyint(1) NOT NULL,
  `FIELD_ID` bigint(20) NOT NULL,
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `REBALANCE_TIME` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_60db71_nonworkingday
-- ----------------------------
DROP TABLE IF EXISTS `ao_60db71_nonworkingday`;
CREATE TABLE `ao_60db71_nonworkingday`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ISO8601_DATE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `WORKING_DAYS_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `index_ao_60db71_non1145824037`(`WORKING_DAYS_ID`) USING BTREE,
  CONSTRAINT `fk_ao_60db71_nonworkingday_working_days_id` FOREIGN KEY (`WORKING_DAYS_ID`) REFERENCES `ao_60db71_workingdays` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_60db71_quickfilter
-- ----------------------------
DROP TABLE IF EXISTS `ao_60db71_quickfilter`;
CREATE TABLE `ao_60db71_quickfilter`  (
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `LONG_QUERY` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `POS` int(11) NOT NULL DEFAULT 0,
  `QUERY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RAPID_VIEW_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `index_ao_60db71_qui432573905`(`RAPID_VIEW_ID`) USING BTREE,
  CONSTRAINT `fk_ao_60db71_quickfilter_rapid_view_id` FOREIGN KEY (`RAPID_VIEW_ID`) REFERENCES `ao_60db71_rapidview` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_60db71_rankableobject
-- ----------------------------
DROP TABLE IF EXISTS `ao_60db71_rankableobject`;
CREATE TABLE `ao_60db71_rankableobject`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_60db71_rapidview
-- ----------------------------
DROP TABLE IF EXISTS `ao_60db71_rapidview`;
CREATE TABLE `ao_60db71_rapidview`  (
  `CARD_COLOR_STRATEGY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `KAN_PLAN_ENABLED` tinyint(1) NULL DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `OLD_DONE_ISSUES_CUTOFF` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OWNER_USER_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SAVED_FILTER_ID` bigint(20) NOT NULL,
  `SHOW_DAYS_IN_COLUMN` tinyint(1) NULL DEFAULT NULL,
  `SHOW_EPIC_AS_PANEL` tinyint(1) NULL DEFAULT NULL,
  `SPRINTS_ENABLED` tinyint(1) NULL DEFAULT NULL,
  `SWIMLANE_STRATEGY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_60db71_sprint
-- ----------------------------
DROP TABLE IF EXISTS `ao_60db71_sprint`;
CREATE TABLE `ao_60db71_sprint`  (
  `CLOSED` tinyint(1) NOT NULL,
  `COMPLETE_DATE` bigint(20) NULL DEFAULT NULL,
  `END_DATE` bigint(20) NULL DEFAULT NULL,
  `GOAL` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `RAPID_VIEW_ID` bigint(20) NULL DEFAULT NULL,
  `SEQUENCE` bigint(20) NULL DEFAULT NULL,
  `STARTED` tinyint(1) NULL DEFAULT NULL,
  `START_DATE` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `index_ao_60db71_spr1457658269`(`SEQUENCE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_60db71_statsfield
-- ----------------------------
DROP TABLE IF EXISTS `ao_60db71_statsfield`;
CREATE TABLE `ao_60db71_statsfield`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `RAPID_VIEW_ID` bigint(20) NOT NULL,
  `TYPE_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `index_ao_60db71_sta1907922871`(`RAPID_VIEW_ID`) USING BTREE,
  CONSTRAINT `fk_ao_60db71_statsfield_rapid_view_id` FOREIGN KEY (`RAPID_VIEW_ID`) REFERENCES `ao_60db71_rapidview` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_60db71_subquery
-- ----------------------------
DROP TABLE IF EXISTS `ao_60db71_subquery`;
CREATE TABLE `ao_60db71_subquery`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `LONG_QUERY` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `QUERY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RAPID_VIEW_ID` bigint(20) NULL DEFAULT NULL,
  `SECTION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `index_ao_60db71_sub730851836`(`RAPID_VIEW_ID`) USING BTREE,
  CONSTRAINT `fk_ao_60db71_subquery_rapid_view_id` FOREIGN KEY (`RAPID_VIEW_ID`) REFERENCES `ao_60db71_rapidview` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_60db71_swimlane
-- ----------------------------
DROP TABLE IF EXISTS `ao_60db71_swimlane`;
CREATE TABLE `ao_60db71_swimlane`  (
  `DEFAULT_LANE` tinyint(1) NOT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `LONG_QUERY` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `POS` int(11) NOT NULL DEFAULT 0,
  `QUERY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RAPID_VIEW_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `index_ao_60db71_swi1429284592`(`RAPID_VIEW_ID`) USING BTREE,
  CONSTRAINT `fk_ao_60db71_swimlane_rapid_view_id` FOREIGN KEY (`RAPID_VIEW_ID`) REFERENCES `ao_60db71_rapidview` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_60db71_trackingstatistic
-- ----------------------------
DROP TABLE IF EXISTS `ao_60db71_trackingstatistic`;
CREATE TABLE `ao_60db71_trackingstatistic`  (
  `FIELD_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `RAPID_VIEW_ID` bigint(20) NOT NULL,
  `TYPE_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `index_ao_60db71_tra1711190333`(`RAPID_VIEW_ID`) USING BTREE,
  CONSTRAINT `fk_ao_60db71_trackingstatistic_rapid_view_id` FOREIGN KEY (`RAPID_VIEW_ID`) REFERENCES `ao_60db71_rapidview` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_60db71_version
-- ----------------------------
DROP TABLE IF EXISTS `ao_60db71_version`;
CREATE TABLE `ao_60db71_version`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `START_DATE` bigint(20) NULL DEFAULT NULL,
  `VERSION_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_60db71_workingdays
-- ----------------------------
DROP TABLE IF EXISTS `ao_60db71_workingdays`;
CREATE TABLE `ao_60db71_workingdays`  (
  `FRIDAY` tinyint(1) NOT NULL,
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `MONDAY` tinyint(1) NOT NULL,
  `RAPID_VIEW_ID` bigint(20) NOT NULL,
  `SATURDAY` tinyint(1) NOT NULL,
  `SUNDAY` tinyint(1) NOT NULL,
  `THURSDAY` tinyint(1) NOT NULL,
  `TIMEZONE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TUESDAY` tinyint(1) NOT NULL,
  `WEDNESDAY` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `index_ao_60db71_wor1205491794`(`RAPID_VIEW_ID`) USING BTREE,
  CONSTRAINT `fk_ao_60db71_workingdays_rapid_view_id` FOREIGN KEY (`RAPID_VIEW_ID`) REFERENCES `ao_60db71_rapidview` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_733371_event
-- ----------------------------
DROP TABLE IF EXISTS `ao_733371_event`;
CREATE TABLE `ao_733371_event`  (
  `ACTION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ACTION_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATED` datetime(0) NOT NULL,
  `EVENT_BUNDLE_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EVENT_TYPE` bigint(20) NOT NULL,
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_KEY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `index_ao_733371_event_created`(`CREATED`) USING BTREE,
  INDEX `index_ao_733371_eve673683319`(`EVENT_BUNDLE_ID`) USING BTREE,
  INDEX `index_ao_733371_event_action`(`ACTION`) USING BTREE,
  INDEX `index_ao_733371_eve902883849`(`EVENT_TYPE`) USING BTREE,
  INDEX `index_ao_733371_event_user_key`(`USER_KEY`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_733371_event_parameter
-- ----------------------------
DROP TABLE IF EXISTS `ao_733371_event_parameter`;
CREATE TABLE `ao_733371_event_parameter`  (
  `EVENT_ID` bigint(20) NOT NULL,
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `VALUE` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `index_ao_733371_eve1423945899`(`NAME`) USING BTREE,
  INDEX `index_ao_733371_eve704112384`(`EVENT_ID`) USING BTREE,
  CONSTRAINT `fk_ao_733371_event_parameter_event_id` FOREIGN KEY (`EVENT_ID`) REFERENCES `ao_733371_event` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_733371_event_recipient
-- ----------------------------
DROP TABLE IF EXISTS `ao_733371_event_recipient`;
CREATE TABLE `ao_733371_event_recipient`  (
  `CONSUMER_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CREATED` datetime(0) NOT NULL,
  `EVENT_ID` bigint(20) NOT NULL,
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `SEND_DATE` datetime(0) NULL DEFAULT NULL,
  `STATUS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `UPDATED` datetime(0) NULL DEFAULT NULL,
  `USER_KEY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `index_ao_733371_eve525098581`(`SEND_DATE`) USING BTREE,
  INDEX `index_ao_733371_eve1645451632`(`EVENT_ID`) USING BTREE,
  INDEX `index_ao_733371_eve1266474620`(`CONSUMER_NAME`) USING BTREE,
  INDEX `index_ao_733371_eve678699426`(`STATUS`) USING BTREE,
  CONSTRAINT `fk_ao_733371_event_recipient_event_id` FOREIGN KEY (`EVENT_ID`) REFERENCES `ao_733371_event` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_97edab_userinvitation
-- ----------------------------
DROP TABLE IF EXISTS `ao_97edab_userinvitation`;
CREATE TABLE `ao_97edab_userinvitation`  (
  `APPLICATION_KEYS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EMAIL_ADDRESS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXPIRY` datetime(0) NULL DEFAULT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REDEEMED` tinyint(1) NULL DEFAULT NULL,
  `SENDER_USERNAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TOKEN` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_a0b856_web_hook_listener_ao
-- ----------------------------
DROP TABLE IF EXISTS `ao_a0b856_web_hook_listener_ao`;
CREATE TABLE `ao_a0b856_web_hook_listener_ao`  (
  `DESCRIPTION` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `ENABLED` tinyint(1) NULL DEFAULT NULL,
  `EVENTS` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `EXCLUDE_BODY` tinyint(1) NULL DEFAULT NULL,
  `FILTERS` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LAST_UPDATED` datetime(0) NOT NULL,
  `LAST_UPDATED_USER` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NAME` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `PARAMETERS` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `REGISTRATION_METHOD` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `URL` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_b9a0f0_applied_template
-- ----------------------------
DROP TABLE IF EXISTS `ao_b9a0f0_applied_template`;
CREATE TABLE `ao_b9a0f0_applied_template`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PROJECT_ID` bigint(20) NULL DEFAULT 0,
  `PROJECT_TEMPLATE_MODULE_KEY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PROJECT_TEMPLATE_WEB_ITEM_KEY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_c16815_alert_ao
-- ----------------------------
DROP TABLE IF EXISTS `ao_c16815_alert_ao`;
CREATE TABLE `ao_c16815_alert_ao`  (
  `CREATED_DATE` bigint(20) NULL DEFAULT 0,
  `DETAILS_JSON` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ISSUE_COMPONENT_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ISSUE_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ISSUE_SEVERITY` int(11) NULL DEFAULT 0,
  `NODE_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TRIGGER_MODULE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TRIGGER_PLUGIN_KEY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TRIGGER_PLUGIN_KEY_VERSION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TRIGGER_PLUGIN_VERSION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ao_c16815_alert_ao
-- ----------------------------
INSERT INTO `ao_c16815_alert_ao` VALUES (1552008885730, '{\"thread\":\"Caesium-1-1\",\"query\":\"order by updated DESC\",\"reason\":{\"query\":{\"whereClause\":null,\"orderByClause\":{\"searchSorts\":[{\"order\":\"DESC\",\"field\":\"updated\",\"property\":{\"defined\":false,\"empty\":true,\"orNull\":null},\"sortOrder\":\"DESC\",\"reverse\":true}]},\"queryString\":null},\"numberOfClausesInQuery\":1,\"executionTime\":1003,\"numberOfResults\":0,\"collectorType\":\"TopDocs\",\"name\":\"com.atlassian.jira.issue.search.metrics.LuceneQueryExecutionEvent\"}}', 1, 'JQL', 'JQL-1001', 100, 'jira', NULL, 'not-detected', NULL, NULL);

-- ----------------------------
-- Table structure for ao_cff990_aotransition_failure
-- ----------------------------
DROP TABLE IF EXISTS `ao_cff990_aotransition_failure`;
CREATE TABLE `ao_cff990_aotransition_failure`  (
  `ERROR_MESSAGES` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `FAILURE_TIME` datetime(0) NULL DEFAULT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ISSUE_ID` bigint(20) NULL DEFAULT 0,
  `LOG_REFERRAL_HASH` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TRANSITION_ID` bigint(20) NULL DEFAULT 0,
  `TRIGGER_ID` bigint(20) NULL DEFAULT 0,
  `USER_KEY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WORKFLOW_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_e8b6cc_branch
-- ----------------------------
DROP TABLE IF EXISTS `ao_e8b6cc_branch`;
CREATE TABLE `ao_e8b6cc_branch`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPOSITORY_ID` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `index_ao_e8b6cc_bra405461593`(`REPOSITORY_ID`) USING BTREE,
  CONSTRAINT `fk_ao_e8b6cc_branch_repository_id` FOREIGN KEY (`REPOSITORY_ID`) REFERENCES `ao_e8b6cc_repository_mapping` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_e8b6cc_branch_head_mapping
-- ----------------------------
DROP TABLE IF EXISTS `ao_e8b6cc_branch_head_mapping`;
CREATE TABLE `ao_e8b6cc_branch_head_mapping`  (
  `BRANCH_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `HEAD` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REPOSITORY_ID` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `index_ao_e8b6cc_bra1368852151`(`REPOSITORY_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_e8b6cc_changeset_mapping
-- ----------------------------
DROP TABLE IF EXISTS `ao_e8b6cc_changeset_mapping`;
CREATE TABLE `ao_e8b6cc_changeset_mapping`  (
  `AUTHOR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AUTHOR_EMAIL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BRANCH` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DATE` datetime(0) NULL DEFAULT NULL,
  `FILES_DATA` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `FILE_COUNT` int(11) NULL DEFAULT 0,
  `FILE_DETAILS_JSON` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ISSUE_KEY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MESSAGE` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `NODE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PARENTS_DATA` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PROJECT_KEY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RAW_AUTHOR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RAW_NODE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPOSITORY_ID` int(11) NULL DEFAULT 0,
  `SMARTCOMMIT_AVAILABLE` tinyint(1) NULL DEFAULT NULL,
  `VERSION` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `index_ao_e8b6cc_cha897886051`(`AUTHOR`) USING BTREE,
  INDEX `index_ao_e8b6cc_cha1483243924`(`NODE`) USING BTREE,
  INDEX `index_ao_e8b6cc_cha509722037`(`RAW_NODE`) USING BTREE,
  INDEX `index_ao_e8b6cc_cha1086340152`(`SMARTCOMMIT_AVAILABLE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_e8b6cc_commit
-- ----------------------------
DROP TABLE IF EXISTS `ao_e8b6cc_commit`;
CREATE TABLE `ao_e8b6cc_commit`  (
  `AUTHOR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AUTHOR_AVATAR_URL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DATE` datetime(0) NOT NULL,
  `DOMAIN_ID` int(11) NOT NULL DEFAULT 0,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MERGE` tinyint(1) NULL DEFAULT NULL,
  `MESSAGE` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `NODE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RAW_AUTHOR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `index_ao_e8b6cc_commit_node`(`NODE`) USING BTREE,
  INDEX `index_ao_e8b6cc_com1308336834`(`DOMAIN_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_e8b6cc_git_hub_event
-- ----------------------------
DROP TABLE IF EXISTS `ao_e8b6cc_git_hub_event`;
CREATE TABLE `ao_e8b6cc_git_hub_event`  (
  `CREATED_AT` datetime(0) NOT NULL,
  `GIT_HUB_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0',
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REPOSITORY_ID` int(11) NOT NULL,
  `SAVE_POINT` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `index_ao_e8b6cc_git1804640320`(`REPOSITORY_ID`) USING BTREE,
  INDEX `index_ao_e8b6cc_git1120895454`(`GIT_HUB_ID`) USING BTREE,
  CONSTRAINT `fk_ao_e8b6cc_git_hub_event_repository_id` FOREIGN KEY (`REPOSITORY_ID`) REFERENCES `ao_e8b6cc_repository_mapping` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_e8b6cc_issue_mapping
-- ----------------------------
DROP TABLE IF EXISTS `ao_e8b6cc_issue_mapping`;
CREATE TABLE `ao_e8b6cc_issue_mapping`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ISSUE_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NODE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PROJECT_KEY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPOSITORY_URI` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_e8b6cc_issue_mapping_v2
-- ----------------------------
DROP TABLE IF EXISTS `ao_e8b6cc_issue_mapping_v2`;
CREATE TABLE `ao_e8b6cc_issue_mapping_v2`  (
  `AUTHOR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BRANCH` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DATE` datetime(0) NULL DEFAULT NULL,
  `FILES_DATA` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ISSUE_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MESSAGE` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `NODE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PARENTS_DATA` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RAW_AUTHOR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RAW_NODE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPOSITORY_ID` int(11) NULL DEFAULT 0,
  `VERSION` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_e8b6cc_issue_to_branch
-- ----------------------------
DROP TABLE IF EXISTS `ao_e8b6cc_issue_to_branch`;
CREATE TABLE `ao_e8b6cc_issue_to_branch`  (
  `BRANCH_ID` int(11) NULL DEFAULT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ISSUE_KEY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `index_ao_e8b6cc_iss1325927291`(`BRANCH_ID`) USING BTREE,
  INDEX `index_ao_e8b6cc_iss353204826`(`ISSUE_KEY`) USING BTREE,
  CONSTRAINT `fk_ao_e8b6cc_issue_to_branch_branch_id` FOREIGN KEY (`BRANCH_ID`) REFERENCES `ao_e8b6cc_branch` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_e8b6cc_issue_to_changeset
-- ----------------------------
DROP TABLE IF EXISTS `ao_e8b6cc_issue_to_changeset`;
CREATE TABLE `ao_e8b6cc_issue_to_changeset`  (
  `CHANGESET_ID` int(11) NULL DEFAULT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ISSUE_KEY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PROJECT_KEY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `index_ao_e8b6cc_iss417950110`(`ISSUE_KEY`) USING BTREE,
  INDEX `index_ao_e8b6cc_iss1229805759`(`CHANGESET_ID`) USING BTREE,
  INDEX `index_ao_e8b6cc_iss648895902`(`PROJECT_KEY`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_e8b6cc_message
-- ----------------------------
DROP TABLE IF EXISTS `ao_e8b6cc_message`;
CREATE TABLE `ao_e8b6cc_message`  (
  `ADDRESS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PAYLOAD` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `PAYLOAD_TYPE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `PRIORITY` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `index_ao_e8b6cc_mes1247039512`(`ADDRESS`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_e8b6cc_message_queue_item
-- ----------------------------
DROP TABLE IF EXISTS `ao_e8b6cc_message_queue_item`;
CREATE TABLE `ao_e8b6cc_message_queue_item`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LAST_FAILED` datetime(0) NULL DEFAULT NULL,
  `MESSAGE_ID` int(11) NOT NULL,
  `QUEUE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `RETRIES_COUNT` int(11) NOT NULL DEFAULT 0,
  `STATE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `STATE_INFO` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `index_ao_e8b6cc_mes60959905`(`QUEUE`) USING BTREE,
  INDEX `index_ao_e8b6cc_mes59146529`(`STATE`) USING BTREE,
  INDEX `index_ao_e8b6cc_mes344532677`(`MESSAGE_ID`) USING BTREE,
  CONSTRAINT `fk_ao_e8b6cc_message_queue_item_message_id` FOREIGN KEY (`MESSAGE_ID`) REFERENCES `ao_e8b6cc_message` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_e8b6cc_message_tag
-- ----------------------------
DROP TABLE IF EXISTS `ao_e8b6cc_message_tag`;
CREATE TABLE `ao_e8b6cc_message_tag`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MESSAGE_ID` int(11) NULL DEFAULT NULL,
  `TAG` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `index_ao_e8b6cc_mes1648007831`(`TAG`) USING BTREE,
  INDEX `index_ao_e8b6cc_mes1391090780`(`MESSAGE_ID`) USING BTREE,
  CONSTRAINT `fk_ao_e8b6cc_message_tag_message_id` FOREIGN KEY (`MESSAGE_ID`) REFERENCES `ao_e8b6cc_message` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_e8b6cc_org_to_project
-- ----------------------------
DROP TABLE IF EXISTS `ao_e8b6cc_org_to_project`;
CREATE TABLE `ao_e8b6cc_org_to_project`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ORGANIZATION_ID` int(11) NULL DEFAULT NULL,
  `PROJECT_KEY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `index_ao_e8b6cc_org1899590324`(`ORGANIZATION_ID`) USING BTREE,
  CONSTRAINT `fk_ao_e8b6cc_org_to_project_organization_id` FOREIGN KEY (`ORGANIZATION_ID`) REFERENCES `ao_e8b6cc_organization_mapping` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_e8b6cc_organization_mapping
-- ----------------------------
DROP TABLE IF EXISTS `ao_e8b6cc_organization_mapping`;
CREATE TABLE `ao_e8b6cc_organization_mapping`  (
  `ACCESS_TOKEN` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ADMIN_PASSWORD` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ADMIN_USERNAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPROVAL_STATE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AUTOLINK_NEW_REPOS` tinyint(1) NULL DEFAULT NULL,
  `DEFAULT_GROUPS_SLUGS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DVCS_TYPE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `HOST_URL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LAST_POLLED` bigint(20) NULL DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OAUTH_KEY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OAUTH_SECRET` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PRINCIPAL_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SMARTCOMMITS_FOR_NEW_REPOS` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `index_ao_e8b6cc_org1513110290`(`DVCS_TYPE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_e8b6cc_pr_issue_key
-- ----------------------------
DROP TABLE IF EXISTS `ao_e8b6cc_pr_issue_key`;
CREATE TABLE `ao_e8b6cc_pr_issue_key`  (
  `DOMAIN_ID` int(11) NOT NULL DEFAULT 0,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ISSUE_KEY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PULL_REQUEST_ID` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `index_ao_e8b6cc_pr_281193494`(`PULL_REQUEST_ID`) USING BTREE,
  INDEX `index_ao_e8b6cc_pr_1639282617`(`DOMAIN_ID`) USING BTREE,
  INDEX `index_ao_e8b6cc_pr_2106805302`(`ISSUE_KEY`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_e8b6cc_pr_participant
-- ----------------------------
DROP TABLE IF EXISTS `ao_e8b6cc_pr_participant`;
CREATE TABLE `ao_e8b6cc_pr_participant`  (
  `APPROVED` tinyint(1) NULL DEFAULT NULL,
  `DOMAIN_ID` int(11) NOT NULL DEFAULT 0,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PULL_REQUEST_ID` int(11) NULL DEFAULT NULL,
  `ROLE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `index_ao_e8b6cc_pr_758084799`(`DOMAIN_ID`) USING BTREE,
  INDEX `index_ao_e8b6cc_pr_1105917040`(`PULL_REQUEST_ID`) USING BTREE,
  CONSTRAINT `fk_ao_e8b6cc_pr_participant_pull_request_id` FOREIGN KEY (`PULL_REQUEST_ID`) REFERENCES `ao_e8b6cc_pull_request` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_e8b6cc_pr_to_commit
-- ----------------------------
DROP TABLE IF EXISTS `ao_e8b6cc_pr_to_commit`;
CREATE TABLE `ao_e8b6cc_pr_to_commit`  (
  `COMMIT_ID` int(11) NOT NULL,
  `DOMAIN_ID` int(11) NOT NULL DEFAULT 0,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REQUEST_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `index_ao_e8b6cc_pr_1045528152`(`REQUEST_ID`) USING BTREE,
  INDEX `index_ao_e8b6cc_pr_1458633226`(`COMMIT_ID`) USING BTREE,
  INDEX `index_ao_e8b6cc_pr_685151049`(`DOMAIN_ID`) USING BTREE,
  CONSTRAINT `fk_ao_e8b6cc_pr_to_commit_commit_id` FOREIGN KEY (`COMMIT_ID`) REFERENCES `ao_e8b6cc_commit` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_ao_e8b6cc_pr_to_commit_request_id` FOREIGN KEY (`REQUEST_ID`) REFERENCES `ao_e8b6cc_pull_request` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_e8b6cc_project_mapping
-- ----------------------------
DROP TABLE IF EXISTS `ao_e8b6cc_project_mapping`;
CREATE TABLE `ao_e8b6cc_project_mapping`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PASSWORD` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PROJECT_KEY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPOSITORY_URI` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_e8b6cc_project_mapping_v2
-- ----------------------------
DROP TABLE IF EXISTS `ao_e8b6cc_project_mapping_v2`;
CREATE TABLE `ao_e8b6cc_project_mapping_v2`  (
  `ACCESS_TOKEN` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ADMIN_PASSWORD` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ADMIN_USERNAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LAST_COMMIT_DATE` datetime(0) NULL DEFAULT NULL,
  `PROJECT_KEY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPOSITORY_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPOSITORY_TYPE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPOSITORY_URL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_e8b6cc_pull_request
-- ----------------------------
DROP TABLE IF EXISTS `ao_e8b6cc_pull_request`;
CREATE TABLE `ao_e8b6cc_pull_request`  (
  `AUTHOR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COMMENT_COUNT` int(11) NULL DEFAULT 0,
  `CREATED_ON` datetime(0) NULL DEFAULT NULL,
  `DESTINATION_BRANCH` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOMAIN_ID` int(11) NOT NULL DEFAULT 0,
  `EXECUTED_BY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LAST_STATUS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REMOTE_ID` bigint(20) NULL DEFAULT NULL,
  `SOURCE_BRANCH` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SOURCE_REPO` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TO_REPOSITORY_ID` int(11) NULL DEFAULT 0,
  `UPDATED_ON` datetime(0) NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `index_ao_e8b6cc_pul1448445182`(`TO_REPOSITORY_ID`) USING BTREE,
  INDEX `index_ao_e8b6cc_pul602811170`(`REMOTE_ID`) USING BTREE,
  INDEX `index_ao_e8b6cc_pul1230717024`(`DOMAIN_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_e8b6cc_repo_to_changeset
-- ----------------------------
DROP TABLE IF EXISTS `ao_e8b6cc_repo_to_changeset`;
CREATE TABLE `ao_e8b6cc_repo_to_changeset`  (
  `CHANGESET_ID` int(11) NULL DEFAULT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REPOSITORY_ID` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `index_ao_e8b6cc_rep922992576`(`CHANGESET_ID`) USING BTREE,
  INDEX `index_ao_e8b6cc_rep1082901832`(`REPOSITORY_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_e8b6cc_repo_to_project
-- ----------------------------
DROP TABLE IF EXISTS `ao_e8b6cc_repo_to_project`;
CREATE TABLE `ao_e8b6cc_repo_to_project`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PROJECT_KEY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPOSITORY_ID` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `index_ao_e8b6cc_rep1928770529`(`REPOSITORY_ID`) USING BTREE,
  CONSTRAINT `fk_ao_e8b6cc_repo_to_project_repository_id` FOREIGN KEY (`REPOSITORY_ID`) REFERENCES `ao_e8b6cc_repository_mapping` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_e8b6cc_repository_mapping
-- ----------------------------
DROP TABLE IF EXISTS `ao_e8b6cc_repository_mapping`;
CREATE TABLE `ao_e8b6cc_repository_mapping`  (
  `ACTIVITY_LAST_SYNC` datetime(0) NULL DEFAULT NULL,
  `DELETED` tinyint(1) NULL DEFAULT NULL,
  `FORK` tinyint(1) NULL DEFAULT NULL,
  `FORK_OF_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FORK_OF_OWNER` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FORK_OF_SLUG` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LAST_CHANGESET_NODE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LAST_COMMIT_DATE` datetime(0) NULL DEFAULT NULL,
  `LINKED` tinyint(1) NULL DEFAULT NULL,
  `LOGO` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORGANIZATION_ID` int(11) NULL DEFAULT 0,
  `SLUG` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SMARTCOMMITS_ENABLED` tinyint(1) NULL DEFAULT NULL,
  `UPDATE_LINK_AUTHORISED` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `index_ao_e8b6cc_rep93578901`(`LINKED`) USING BTREE,
  INDEX `index_ao_e8b6cc_rep702725269`(`ORGANIZATION_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_e8b6cc_sync_audit_log
-- ----------------------------
DROP TABLE IF EXISTS `ao_e8b6cc_sync_audit_log`;
CREATE TABLE `ao_e8b6cc_sync_audit_log`  (
  `END_DATE` datetime(0) NULL DEFAULT NULL,
  `EXC_TRACE` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `FIRST_REQUEST_DATE` datetime(0) NULL DEFAULT NULL,
  `FLIGHT_TIME_MS` int(11) NULL DEFAULT 0,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NUM_REQUESTS` int(11) NULL DEFAULT 0,
  `REPO_ID` int(11) NULL DEFAULT 0,
  `START_DATE` datetime(0) NULL DEFAULT NULL,
  `SYNC_STATUS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SYNC_TYPE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TOTAL_ERRORS` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `index_ao_e8b6cc_syn203792807`(`REPO_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_e8b6cc_sync_event
-- ----------------------------
DROP TABLE IF EXISTS `ao_e8b6cc_sync_event`;
CREATE TABLE `ao_e8b6cc_sync_event`  (
  `EVENT_CLASS` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `EVENT_DATE` datetime(0) NOT NULL,
  `EVENT_JSON` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REPO_ID` int(11) NOT NULL DEFAULT 0,
  `SCHEDULED_SYNC` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `index_ao_e8b6cc_syn493078035`(`REPO_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ao_ed669c_seen_assertions
-- ----------------------------
DROP TABLE IF EXISTS `ao_ed669c_seen_assertions`;
CREATE TABLE `ao_ed669c_seen_assertions`  (
  `ASSERTION_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `EXPIRY_TIMESTAMP` bigint(20) NOT NULL DEFAULT 0,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `U_AO_ED669C_SEEN_AS1055534769`(`ASSERTION_ID`) USING BTREE,
  INDEX `index_ao_ed669c_see20117222`(`EXPIRY_TIMESTAMP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for app_user
-- ----------------------------
DROP TABLE IF EXISTS `app_user`;
CREATE TABLE `app_user`  (
  `ID` decimal(18, 0) NOT NULL,
  `user_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `lower_user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `uk_user_key`(`user_key`) USING BTREE,
  UNIQUE INDEX `uk_lower_user_name`(`lower_user_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_user
-- ----------------------------
INSERT INTO `app_user` VALUES (10000, 'yc', 'yc');

-- ----------------------------
-- Table structure for audit_changed_value
-- ----------------------------
DROP TABLE IF EXISTS `audit_changed_value`;
CREATE TABLE `audit_changed_value`  (
  `ID` decimal(18, 0) NOT NULL,
  `LOG_ID` decimal(18, 0) NULL DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DELTA_FROM` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `DELTA_TO` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `idx_changed_value_log_id`(`LOG_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of audit_changed_value
-- ----------------------------
INSERT INTO `audit_changed_value` VALUES (10000, 10001, 'Permission', '', 'Create Shared Objects');
INSERT INTO `audit_changed_value` VALUES (10001, 10001, 'Group', '', 'jira-software-users');
INSERT INTO `audit_changed_value` VALUES (10002, 10002, 'Permission', '', 'Manage Group Filter Subscriptions');
INSERT INTO `audit_changed_value` VALUES (10003, 10002, 'Group', '', 'jira-software-users');
INSERT INTO `audit_changed_value` VALUES (10004, 10003, 'Permission', '', 'Browse Users');
INSERT INTO `audit_changed_value` VALUES (10005, 10003, 'Group', '', 'jira-software-users');
INSERT INTO `audit_changed_value` VALUES (10006, 10004, 'Permission', '', 'Bulk Change');
INSERT INTO `audit_changed_value` VALUES (10007, 10004, 'Group', '', 'jira-software-users');
INSERT INTO `audit_changed_value` VALUES (10008, 10005, 'Organisation', NULL, 'yechao');
INSERT INTO `audit_changed_value` VALUES (10009, 10005, 'Date Purchased', NULL, '07/三月/19');
INSERT INTO `audit_changed_value` VALUES (10010, 10005, 'License Type', NULL, 'Jira Software (Server): Evaluation');
INSERT INTO `audit_changed_value` VALUES (10011, 10005, 'Server ID', NULL, 'BKVE-U2W9-3QFX-TF8F');
INSERT INTO `audit_changed_value` VALUES (10012, 10005, 'Support Entitlement Number (SEN)', NULL, 'SEN-L13231117');
INSERT INTO `audit_changed_value` VALUES (10013, 10005, 'User Limit', NULL, '无限');
INSERT INTO `audit_changed_value` VALUES (10014, 10005, 'jira-software', NULL, '-1');
INSERT INTO `audit_changed_value` VALUES (10015, 10006, 'Username', NULL, 'yc');
INSERT INTO `audit_changed_value` VALUES (10016, 10006, 'Full name', NULL, 'yechao');
INSERT INTO `audit_changed_value` VALUES (10017, 10006, 'Email', NULL, '2320158601@qq.com');
INSERT INTO `audit_changed_value` VALUES (10018, 10006, 'Active / Inactive', NULL, 'Active');
INSERT INTO `audit_changed_value` VALUES (10019, 10008, 'Permission', '', 'Bulk Change');
INSERT INTO `audit_changed_value` VALUES (10020, 10008, 'Group', '', 'jira-administrators');
INSERT INTO `audit_changed_value` VALUES (10021, 10009, 'Permission', '', 'Create Shared Objects');
INSERT INTO `audit_changed_value` VALUES (10022, 10009, 'Group', '', 'jira-administrators');
INSERT INTO `audit_changed_value` VALUES (10023, 10010, 'Permission', '', 'Manage Group Filter Subscriptions');
INSERT INTO `audit_changed_value` VALUES (10024, 10010, 'Group', '', 'jira-administrators');
INSERT INTO `audit_changed_value` VALUES (10025, 10011, 'Permission', '', 'Browse Users');
INSERT INTO `audit_changed_value` VALUES (10026, 10011, 'Group', '', 'jira-administrators');
INSERT INTO `audit_changed_value` VALUES (10027, 10013, 'Organisation', NULL, 'yechao');
INSERT INTO `audit_changed_value` VALUES (10028, 10013, 'Date Purchased', NULL, '07/三月/19');
INSERT INTO `audit_changed_value` VALUES (10029, 10013, 'License Type', NULL, 'Jira Software (Server): Evaluation');
INSERT INTO `audit_changed_value` VALUES (10030, 10013, 'Server ID', NULL, 'BKVE-U2W9-3QFX-TF8F');
INSERT INTO `audit_changed_value` VALUES (10031, 10013, 'Support Entitlement Number (SEN)', NULL, 'SEN-L13231117');
INSERT INTO `audit_changed_value` VALUES (10032, 10013, 'User Limit', NULL, '无限');
INSERT INTO `audit_changed_value` VALUES (10033, 10013, 'jira-software', NULL, '-1');
INSERT INTO `audit_changed_value` VALUES (10100, 10100, 'Permission', '', 'Manage Sprints');
INSERT INTO `audit_changed_value` VALUES (10101, 10100, 'Type', '', '项目角色');
INSERT INTO `audit_changed_value` VALUES (10102, 10100, 'Value', '', 'Administrators');
INSERT INTO `audit_changed_value` VALUES (10103, 10101, 'Permission', 'Manage Sprints', '');
INSERT INTO `audit_changed_value` VALUES (10104, 10101, 'Type', '项目角色', '');
INSERT INTO `audit_changed_value` VALUES (10105, 10101, 'Value', 'Administrators', '');
INSERT INTO `audit_changed_value` VALUES (10106, 10102, 'Permission', '', 'Manage Sprints');
INSERT INTO `audit_changed_value` VALUES (10107, 10102, 'Type', '', '项目角色');
INSERT INTO `audit_changed_value` VALUES (10108, 10102, 'Value', '', 'Administrators');
INSERT INTO `audit_changed_value` VALUES (10109, 10103, 'Name', NULL, '等级');
INSERT INTO `audit_changed_value` VALUES (10110, 10103, 'Description', NULL, '全局评级域仅供 Jira Software 使用。');
INSERT INTO `audit_changed_value` VALUES (10111, 10103, 'Type', NULL, '全局评级');
INSERT INTO `audit_changed_value` VALUES (10112, 10104, 'Name', NULL, '史诗链接');
INSERT INTO `audit_changed_value` VALUES (10113, 10104, 'Description', NULL, '选择与此问题关联的Epic。');
INSERT INTO `audit_changed_value` VALUES (10114, 10104, 'Type', NULL, '史诗链接关系');
INSERT INTO `audit_changed_value` VALUES (10115, 10105, 'Name', NULL, 'Epic状态');
INSERT INTO `audit_changed_value` VALUES (10116, 10105, 'Description', NULL, '仅供 Jira Software 使用的 Epic 状态域。');
INSERT INTO `audit_changed_value` VALUES (10117, 10105, 'Type', NULL, 'Epic的状态');
INSERT INTO `audit_changed_value` VALUES (10118, 10106, 'Name', NULL, '史诗名称');
INSERT INTO `audit_changed_value` VALUES (10119, 10106, 'Description', NULL, '用一个简短的名称标识此史诗。');
INSERT INTO `audit_changed_value` VALUES (10120, 10106, 'Type', NULL, '史诗名称');
INSERT INTO `audit_changed_value` VALUES (10121, 10107, 'Name', NULL, 'Epic颜色');
INSERT INTO `audit_changed_value` VALUES (10122, 10107, 'Description', NULL, '仅供 Jira Software 使用的 Epic 颜色域。');
INSERT INTO `audit_changed_value` VALUES (10123, 10107, 'Type', NULL, 'Epic的颜色');
INSERT INTO `audit_changed_value` VALUES (10124, 10108, 'Name', NULL, 'Sprint');
INSERT INTO `audit_changed_value` VALUES (10125, 10108, 'Description', NULL, 'Jira Software Sprint 域');
INSERT INTO `audit_changed_value` VALUES (10126, 10108, 'Type', NULL, 'Jira Sprint 域');
INSERT INTO `audit_changed_value` VALUES (10127, 10111, 'Name', NULL, 'Story Point');
INSERT INTO `audit_changed_value` VALUES (10128, 10111, 'Description', NULL, '用于测量需求的复杂度或大小。');
INSERT INTO `audit_changed_value` VALUES (10129, 10111, 'Type', NULL, '数值域');

-- ----------------------------
-- Table structure for audit_item
-- ----------------------------
DROP TABLE IF EXISTS `audit_item`;
CREATE TABLE `audit_item`  (
  `ID` decimal(18, 0) NOT NULL,
  `LOG_ID` decimal(18, 0) NULL DEFAULT NULL,
  `OBJECT_TYPE` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OBJECT_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OBJECT_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OBJECT_PARENT_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OBJECT_PARENT_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `idx_audit_item_log_id2`(`LOG_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of audit_item
-- ----------------------------
INSERT INTO `audit_item` VALUES (10000, 10007, 'USER', 'yc', 'yc', '1', 'Jira Internal Directory');
INSERT INTO `audit_item` VALUES (10001, 10012, 'USER', 'yc', 'yc', '1', 'Jira Internal Directory');

-- ----------------------------
-- Table structure for audit_log
-- ----------------------------
DROP TABLE IF EXISTS `audit_log`;
CREATE TABLE `audit_log`  (
  `ID` decimal(18, 0) NOT NULL,
  `REMOTE_ADDRESS` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATED` datetime(0) NULL DEFAULT NULL,
  `AUTHOR_KEY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SUMMARY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CATEGORY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OBJECT_TYPE` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OBJECT_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OBJECT_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OBJECT_PARENT_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OBJECT_PARENT_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AUTHOR_TYPE` decimal(9, 0) NULL DEFAULT NULL,
  `EVENT_SOURCE_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LONG_DESCRIPTION` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `SEARCH_FIELD` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `idx_audit_log_created`(`CREATED`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of audit_log
-- ----------------------------
INSERT INTO `audit_log` VALUES (10000, '0:0:0:0:0:0:0:1', '2019-03-07 22:08:54', NULL, 'Group created', 'group management', 'GROUP', NULL, 'jira-software-users', '1', 'Jira Internal Directory', 0, '', NULL, '', '0:0:0:0:0:0:0:1 group created management jira-software-users jira internal directory');
INSERT INTO `audit_log` VALUES (10001, '0:0:0:0:0:0:0:1', '2019-03-07 22:08:54', NULL, 'Global permission added', 'permissions', 'PERMISSIONS', NULL, 'Global Permissions', NULL, NULL, 0, '', NULL, '', '0:0:0:0:0:0:0:1 global permission added permissions create shared objects jira-software-users');
INSERT INTO `audit_log` VALUES (10002, '0:0:0:0:0:0:0:1', '2019-03-07 22:08:54', NULL, 'Global permission added', 'permissions', 'PERMISSIONS', NULL, 'Global Permissions', NULL, NULL, 0, '', NULL, '', '0:0:0:0:0:0:0:1 global permission added permissions manage group filter subscriptions jira-software-users');
INSERT INTO `audit_log` VALUES (10003, '0:0:0:0:0:0:0:1', '2019-03-07 22:08:54', NULL, 'Global permission added', 'permissions', 'PERMISSIONS', NULL, 'Global Permissions', NULL, NULL, 0, '', NULL, '', '0:0:0:0:0:0:0:1 global permission added permissions browse users jira-software-users');
INSERT INTO `audit_log` VALUES (10004, '0:0:0:0:0:0:0:1', '2019-03-07 22:08:54', NULL, 'Global permission added', 'permissions', 'PERMISSIONS', NULL, 'Global Permissions', NULL, NULL, 0, '', NULL, '', '0:0:0:0:0:0:0:1 global permission added permissions bulk change jira-software-users');
INSERT INTO `audit_log` VALUES (10005, '0:0:0:0:0:0:0:1', '2019-03-07 22:08:54', NULL, 'New license added', 'system', 'LICENSE', '0', 'SEN-L13231117', '0', 'License SEN', 0, '', NULL, '', '0:0:0:0:0:0:0:1 new license added system sen-l13231117 sen yechao 07/三月/19 jira software (server): evaluation bkve-u2w9-3qfx-tf8f 无限 -1');
INSERT INTO `audit_log` VALUES (10006, '0:0:0:0:0:0:0:1', '2019-03-07 22:12:17', NULL, 'User created', 'user management', 'USER', 'yc', 'yc', '1', 'Jira Internal Directory', 0, '', NULL, '', '0:0:0:0:0:0:0:1 user created management yc jira internal directory yechao 2320158601@qq.com active');
INSERT INTO `audit_log` VALUES (10007, '0:0:0:0:0:0:0:1', '2019-03-07 22:12:17', NULL, 'User added to group', 'group management', 'GROUP', NULL, 'jira-administrators', '1', 'Jira Internal Directory', 0, '', NULL, '', '0:0:0:0:0:0:0:1 user added to group management jira-administrators jira internal directory yc');
INSERT INTO `audit_log` VALUES (10008, '0:0:0:0:0:0:0:1', '2019-03-07 22:12:17', NULL, 'Global permission added', 'permissions', 'PERMISSIONS', NULL, 'Global Permissions', NULL, NULL, 0, '', NULL, '', '0:0:0:0:0:0:0:1 global permission added permissions bulk change jira-administrators');
INSERT INTO `audit_log` VALUES (10009, '0:0:0:0:0:0:0:1', '2019-03-07 22:12:17', NULL, 'Global permission added', 'permissions', 'PERMISSIONS', NULL, 'Global Permissions', NULL, NULL, 0, '', NULL, '', '0:0:0:0:0:0:0:1 global permission added permissions create shared objects jira-administrators');
INSERT INTO `audit_log` VALUES (10010, '0:0:0:0:0:0:0:1', '2019-03-07 22:12:17', NULL, 'Global permission added', 'permissions', 'PERMISSIONS', NULL, 'Global Permissions', NULL, NULL, 0, '', NULL, '', '0:0:0:0:0:0:0:1 global permission added permissions manage group filter subscriptions jira-administrators');
INSERT INTO `audit_log` VALUES (10011, '0:0:0:0:0:0:0:1', '2019-03-07 22:12:17', NULL, 'Global permission added', 'permissions', 'PERMISSIONS', NULL, 'Global Permissions', NULL, NULL, 0, '', NULL, '', '0:0:0:0:0:0:0:1 global permission added permissions browse users jira-administrators');
INSERT INTO `audit_log` VALUES (10012, '0:0:0:0:0:0:0:1', '2019-03-07 22:12:17', NULL, 'User added to group', 'group management', 'GROUP', NULL, 'jira-software-users', '1', 'Jira Internal Directory', 0, '', NULL, '', '0:0:0:0:0:0:0:1 user added to group management jira-software-users jira internal directory yc');
INSERT INTO `audit_log` VALUES (10013, '0:0:0:0:0:0:0:1', '2019-03-07 22:33:36', NULL, 'License updated', 'system', 'LICENSE', '0', 'SEN-L13231117', '0', 'License SEN', 0, '', NULL, '', '0:0:0:0:0:0:0:1 license updated system sen-l13231117 sen yechao 07/三月/19 jira software (server): evaluation bkve-u2w9-3qfx-tf8f 无限 -1');
INSERT INTO `audit_log` VALUES (10100, '0:0:0:0:0:0:0:1', '2019-03-07 22:34:02', NULL, 'Permission scheme updated', 'permissions', 'SCHEME', '0', 'Default Permission Scheme', NULL, NULL, 0, '', NULL, '', '0:0:0:0:0:0:0:1 permission scheme updated permissions default manage sprints 项目角色 administrators');
INSERT INTO `audit_log` VALUES (10101, '0:0:0:0:0:0:0:1', '2019-03-07 22:34:02', NULL, 'Permission scheme updated', 'permissions', 'SCHEME', '0', 'Default Permission Scheme', NULL, NULL, 0, '', NULL, '', '0:0:0:0:0:0:0:1 permission scheme updated permissions default manage sprints 项目角色 administrators');
INSERT INTO `audit_log` VALUES (10102, '0:0:0:0:0:0:0:1', '2019-03-07 22:34:02', NULL, 'Permission scheme updated', 'permissions', 'SCHEME', '0', 'Default Permission Scheme', NULL, NULL, 0, '', NULL, '', '0:0:0:0:0:0:0:1 permission scheme updated permissions default manage sprints 项目角色 administrators');
INSERT INTO `audit_log` VALUES (10103, '0:0:0:0:0:0:0:1', '2019-03-07 22:34:05', NULL, 'Custom field created', 'fields', 'CUSTOM_FIELD', 'customfield_10100', '等级', NULL, NULL, 0, '', NULL, '', '0:0:0:0:0:0:0:1 custom field created fields 等级 全局评级域仅供 jira software 使用。 全局评级');
INSERT INTO `audit_log` VALUES (10104, '0:0:0:0:0:0:0:1', '2019-03-07 22:34:05', NULL, 'Custom field created', 'fields', 'CUSTOM_FIELD', 'customfield_10101', '史诗链接', NULL, NULL, 0, '', NULL, '', '0:0:0:0:0:0:0:1 custom field created fields 史诗链接 选择与此问题关联的epic。 史诗链接关系');
INSERT INTO `audit_log` VALUES (10105, '0:0:0:0:0:0:0:1', '2019-03-07 22:34:06', NULL, 'Custom field created', 'fields', 'CUSTOM_FIELD', 'customfield_10102', 'Epic状态', NULL, NULL, 0, '', NULL, '', '0:0:0:0:0:0:0:1 custom field created fields epic状态 仅供 jira software 使用的 epic 状态域。 epic的状态');
INSERT INTO `audit_log` VALUES (10106, '0:0:0:0:0:0:0:1', '2019-03-07 22:34:06', NULL, 'Custom field created', 'fields', 'CUSTOM_FIELD', 'customfield_10103', '史诗名称', NULL, NULL, 0, '', NULL, '', '0:0:0:0:0:0:0:1 custom field created fields 史诗名称 用一个简短的名称标识此史诗。');
INSERT INTO `audit_log` VALUES (10107, '0:0:0:0:0:0:0:1', '2019-03-07 22:34:06', NULL, 'Custom field created', 'fields', 'CUSTOM_FIELD', 'customfield_10104', 'Epic颜色', NULL, NULL, 0, '', NULL, '', '0:0:0:0:0:0:0:1 custom field created fields epic颜色 仅供 jira software 使用的 epic 颜色域。 epic的颜色');
INSERT INTO `audit_log` VALUES (10108, '0:0:0:0:0:0:0:1', '2019-03-07 22:34:06', NULL, 'Custom field created', 'fields', 'CUSTOM_FIELD', 'customfield_10105', 'Sprint', NULL, NULL, 0, '', NULL, '', '0:0:0:0:0:0:0:1 custom field created fields sprint jira software 域');
INSERT INTO `audit_log` VALUES (10109, '0:0:0:0:0:0:0:1', '2019-03-07 22:34:15', NULL, 'Issue type created', 'issue types', 'ISSUE_TYPE', '10000', 'Epic', NULL, NULL, 0, '', NULL, '', '0:0:0:0:0:0:0:1 issue type created types epic');
INSERT INTO `audit_log` VALUES (10110, '0:0:0:0:0:0:0:1', '2019-03-07 22:34:15', NULL, 'Issue type created', 'issue types', 'ISSUE_TYPE', '10001', '故事', NULL, NULL, 0, '', NULL, '', '0:0:0:0:0:0:0:1 issue type created types 故事');
INSERT INTO `audit_log` VALUES (10111, '0:0:0:0:0:0:0:1', '2019-03-07 22:34:15', NULL, 'Custom field created', 'fields', 'CUSTOM_FIELD', 'customfield_10106', 'Story Point', NULL, NULL, 0, '', NULL, '', '0:0:0:0:0:0:0:1 custom field created fields story point 用于测量需求的复杂度或大小。 数值域');

-- ----------------------------
-- Table structure for avatar
-- ----------------------------
DROP TABLE IF EXISTS `avatar`;
CREATE TABLE `avatar`  (
  `ID` decimal(18, 0) NOT NULL,
  `filename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `contenttype` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `avatartype` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `systemavatar` decimal(9, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `avatar_index`(`avatartype`, `owner`) USING BTREE,
  INDEX `avatar_filename_index`(`filename`, `avatartype`, `systemavatar`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of avatar
-- ----------------------------
INSERT INTO `avatar` VALUES (10000, 'codegeist.png', 'image/png', 'project', NULL, 1);
INSERT INTO `avatar` VALUES (10001, 'bird.svg', 'image/svg+xml', 'project', NULL, 1);
INSERT INTO `avatar` VALUES (10002, 'jm_black.png', 'image/png', 'project', NULL, 1);
INSERT INTO `avatar` VALUES (10003, 'jm_brown.png', 'image/png', 'project', NULL, 1);
INSERT INTO `avatar` VALUES (10004, 'jm_orange.png', 'image/png', 'project', NULL, 1);
INSERT INTO `avatar` VALUES (10005, 'jm_red.png', 'image/png', 'project', NULL, 1);
INSERT INTO `avatar` VALUES (10006, 'jm_white.png', 'image/png', 'project', NULL, 1);
INSERT INTO `avatar` VALUES (10007, 'jm_yellow.png', 'image/png', 'project', NULL, 1);
INSERT INTO `avatar` VALUES (10008, 'monster.png', 'image/png', 'project', NULL, 1);
INSERT INTO `avatar` VALUES (10009, 'nature.svg', 'image/svg+xml', 'project', NULL, 1);
INSERT INTO `avatar` VALUES (10010, 'koala.svg', 'image/svg+xml', 'project', NULL, 1);
INSERT INTO `avatar` VALUES (10011, 'rocket.svg', 'image/svg+xml', 'project', NULL, 1);
INSERT INTO `avatar` VALUES (10100, 'Avatar-1.png', 'image/png', 'user', NULL, 1);
INSERT INTO `avatar` VALUES (10101, 'Avatar-2.png', 'image/png', 'user', NULL, 1);
INSERT INTO `avatar` VALUES (10102, 'Avatar-3.png', 'image/png', 'user', NULL, 1);
INSERT INTO `avatar` VALUES (10103, 'Avatar-4.png', 'image/png', 'user', NULL, 1);
INSERT INTO `avatar` VALUES (10104, 'Avatar-5.png', 'image/png', 'user', NULL, 1);
INSERT INTO `avatar` VALUES (10105, 'Avatar-6.png', 'image/png', 'user', NULL, 1);
INSERT INTO `avatar` VALUES (10106, 'Avatar-7.png', 'image/png', 'user', NULL, 1);
INSERT INTO `avatar` VALUES (10107, 'Avatar-8.png', 'image/png', 'user', NULL, 1);
INSERT INTO `avatar` VALUES (10108, 'Avatar-9.png', 'image/png', 'user', NULL, 1);
INSERT INTO `avatar` VALUES (10109, 'Avatar-10.png', 'image/png', 'user', NULL, 1);
INSERT INTO `avatar` VALUES (10110, 'Avatar-11.png', 'image/png', 'user', NULL, 1);
INSERT INTO `avatar` VALUES (10111, 'Avatar-12.png', 'image/png', 'user', NULL, 1);
INSERT INTO `avatar` VALUES (10112, 'Avatar-13.png', 'image/png', 'user', NULL, 1);
INSERT INTO `avatar` VALUES (10113, 'Avatar-14.png', 'image/png', 'user', NULL, 1);
INSERT INTO `avatar` VALUES (10114, 'Avatar-15.png', 'image/png', 'user', NULL, 1);
INSERT INTO `avatar` VALUES (10115, 'Avatar-16.png', 'image/png', 'user', NULL, 1);
INSERT INTO `avatar` VALUES (10116, 'Avatar-17.png', 'image/png', 'user', NULL, 1);
INSERT INTO `avatar` VALUES (10117, 'Avatar-18.png', 'image/png', 'user', NULL, 1);
INSERT INTO `avatar` VALUES (10118, 'Avatar-19.png', 'image/png', 'user', NULL, 1);
INSERT INTO `avatar` VALUES (10119, 'Avatar-20.png', 'image/png', 'user', NULL, 1);
INSERT INTO `avatar` VALUES (10120, 'Avatar-21.png', 'image/png', 'user', NULL, 1);
INSERT INTO `avatar` VALUES (10121, 'Avatar-22.png', 'image/png', 'user', NULL, 1);
INSERT INTO `avatar` VALUES (10122, 'Avatar-default.svg', 'image/svg+xml', 'user', NULL, 1);
INSERT INTO `avatar` VALUES (10123, 'Avatar-unknown.png', 'image/png', 'user', NULL, 1);
INSERT INTO `avatar` VALUES (10200, 'cloud.svg', 'image/svg+xml', 'project', NULL, 1);
INSERT INTO `avatar` VALUES (10201, 'spanner.svg', 'image/svg+xml', 'project', NULL, 1);
INSERT INTO `avatar` VALUES (10202, 'cd.svg', 'image/svg+xml', 'project', NULL, 1);
INSERT INTO `avatar` VALUES (10203, 'money.svg', 'image/svg+xml', 'project', NULL, 1);
INSERT INTO `avatar` VALUES (10204, 'mouse-hand.svg', 'image/svg+xml', 'project', NULL, 1);
INSERT INTO `avatar` VALUES (10205, 'yeti.svg', 'image/svg+xml', 'project', NULL, 1);
INSERT INTO `avatar` VALUES (10206, 'power.svg', 'image/svg+xml', 'project', NULL, 1);
INSERT INTO `avatar` VALUES (10207, 'refresh.svg', 'image/svg+xml', 'project', NULL, 1);
INSERT INTO `avatar` VALUES (10208, 'phone.svg', 'image/svg+xml', 'project', NULL, 1);
INSERT INTO `avatar` VALUES (10209, 'settings.svg', 'image/svg+xml', 'project', NULL, 1);
INSERT INTO `avatar` VALUES (10210, 'storm.svg', 'image/svg+xml', 'project', NULL, 1);
INSERT INTO `avatar` VALUES (10211, 'plane.svg', 'image/svg+xml', 'project', NULL, 1);
INSERT INTO `avatar` VALUES (10300, 'genericissue.svg', 'image/svg+xml', 'issuetype', NULL, 1);
INSERT INTO `avatar` VALUES (10303, 'bug.svg', 'image/svg+xml', 'issuetype', NULL, 1);
INSERT INTO `avatar` VALUES (10304, 'defect.svg', 'image/svg+xml', 'issuetype', NULL, 1);
INSERT INTO `avatar` VALUES (10306, 'documentation.svg', 'image/svg+xml', 'issuetype', NULL, 1);
INSERT INTO `avatar` VALUES (10307, 'epic.svg', 'image/svg+xml', 'issuetype', NULL, 1);
INSERT INTO `avatar` VALUES (10308, 'exclamation.svg', 'image/svg+xml', 'issuetype', NULL, 1);
INSERT INTO `avatar` VALUES (10309, 'design_task.svg', 'image/svg+xml', 'issuetype', NULL, 1);
INSERT INTO `avatar` VALUES (10310, 'improvement.svg', 'image/svg+xml', 'issuetype', NULL, 1);
INSERT INTO `avatar` VALUES (10311, 'newfeature.svg', 'image/svg+xml', 'issuetype', NULL, 1);
INSERT INTO `avatar` VALUES (10312, 'remove_feature.svg', 'image/svg+xml', 'issuetype', NULL, 1);
INSERT INTO `avatar` VALUES (10313, 'requirement.svg', 'image/svg+xml', 'issuetype', NULL, 1);
INSERT INTO `avatar` VALUES (10314, 'sales.svg', 'image/svg+xml', 'issuetype', NULL, 1);
INSERT INTO `avatar` VALUES (10315, 'story.svg', 'image/svg+xml', 'issuetype', NULL, 1);
INSERT INTO `avatar` VALUES (10316, 'subtask.svg', 'image/svg+xml', 'issuetype', NULL, 1);
INSERT INTO `avatar` VALUES (10318, 'task.svg', 'image/svg+xml', 'issuetype', NULL, 1);
INSERT INTO `avatar` VALUES (10320, 'question.svg', 'image/svg+xml', 'issuetype', NULL, 1);
INSERT INTO `avatar` VALUES (10321, 'development_task.svg', 'image/svg+xml', 'issuetype', NULL, 1);
INSERT INTO `avatar` VALUES (10322, 'feedback.svg', 'image/svg+xml', 'issuetype', NULL, 1);
INSERT INTO `avatar` VALUES (10323, 'request_access.svg', 'image/svg+xml', 'issuetype', NULL, 1);
INSERT INTO `avatar` VALUES (10324, 'default.svg', 'image/svg+xml', 'project', NULL, 1);
INSERT INTO `avatar` VALUES (10325, 'code.svg', 'image/svg+xml', 'project', NULL, 1);
INSERT INTO `avatar` VALUES (10326, 'coffee.svg', 'image/svg+xml', 'project', NULL, 1);
INSERT INTO `avatar` VALUES (10327, 'design.svg', 'image/svg+xml', 'project', NULL, 1);
INSERT INTO `avatar` VALUES (10328, 'drill.svg', 'image/svg+xml', 'project', NULL, 1);
INSERT INTO `avatar` VALUES (10329, 'food.svg', 'image/svg+xml', 'project', NULL, 1);
INSERT INTO `avatar` VALUES (10330, 'notes.svg', 'image/svg+xml', 'project', NULL, 1);
INSERT INTO `avatar` VALUES (10331, 'red-flag.svg', 'image/svg+xml', 'project', NULL, 1);
INSERT INTO `avatar` VALUES (10332, 'science.svg', 'image/svg+xml', 'project', NULL, 1);
INSERT INTO `avatar` VALUES (10333, 'support.svg', 'image/svg+xml', 'project', NULL, 1);
INSERT INTO `avatar` VALUES (10334, 'bull.svg', 'image/svg+xml', 'user', NULL, 1);
INSERT INTO `avatar` VALUES (10335, 'cat.svg', 'image/svg+xml', 'user', NULL, 1);
INSERT INTO `avatar` VALUES (10336, 'dog.svg', 'image/svg+xml', 'user', NULL, 1);
INSERT INTO `avatar` VALUES (10337, 'female_1.svg', 'image/svg+xml', 'user', NULL, 1);
INSERT INTO `avatar` VALUES (10338, 'female_2.svg', 'image/svg+xml', 'user', NULL, 1);
INSERT INTO `avatar` VALUES (10339, 'female_3.svg', 'image/svg+xml', 'user', NULL, 1);
INSERT INTO `avatar` VALUES (10340, 'female_4.svg', 'image/svg+xml', 'user', NULL, 1);
INSERT INTO `avatar` VALUES (10341, 'ghost.svg', 'image/svg+xml', 'user', NULL, 1);
INSERT INTO `avatar` VALUES (10342, 'male_1.svg', 'image/svg+xml', 'user', NULL, 1);
INSERT INTO `avatar` VALUES (10343, 'male_2.svg', 'image/svg+xml', 'user', NULL, 1);
INSERT INTO `avatar` VALUES (10344, 'male_3.svg', 'image/svg+xml', 'user', NULL, 1);
INSERT INTO `avatar` VALUES (10345, 'male_4.svg', 'image/svg+xml', 'user', NULL, 1);
INSERT INTO `avatar` VALUES (10346, 'male_5.svg', 'image/svg+xml', 'user', NULL, 1);
INSERT INTO `avatar` VALUES (10347, 'male_6.svg', 'image/svg+xml', 'user', NULL, 1);
INSERT INTO `avatar` VALUES (10348, 'male_8.svg', 'image/svg+xml', 'user', NULL, 1);
INSERT INTO `avatar` VALUES (10349, 'owl.svg', 'image/svg+xml', 'user', NULL, 1);
INSERT INTO `avatar` VALUES (10350, 'pirate.svg', 'image/svg+xml', 'user', NULL, 1);
INSERT INTO `avatar` VALUES (10351, 'robot.svg', 'image/svg+xml', 'user', NULL, 1);
INSERT INTO `avatar` VALUES (10352, 'vampire.svg', 'image/svg+xml', 'user', NULL, 1);
INSERT INTO `avatar` VALUES (10500, 'female_5.svg', 'image/svg+xml', 'user', NULL, 1);
INSERT INTO `avatar` VALUES (10501, 'female_6.svg', 'image/svg+xml', 'user', NULL, 1);
INSERT INTO `avatar` VALUES (10502, 'female_7.svg', 'image/svg+xml', 'user', NULL, 1);
INSERT INTO `avatar` VALUES (10503, 'female_8.svg', 'image/svg+xml', 'user', NULL, 1);
INSERT INTO `avatar` VALUES (10504, 'female_9.svg', 'image/svg+xml', 'user', NULL, 1);
INSERT INTO `avatar` VALUES (10505, 'male_7.svg', 'image/svg+xml', 'user', NULL, 1);
INSERT INTO `avatar` VALUES (10506, 'male_9.svg', 'image/svg+xml', 'user', NULL, 1);
INSERT INTO `avatar` VALUES (10507, 'pirate_female.svg', 'image/svg+xml', 'user', NULL, 1);
INSERT INTO `avatar` VALUES (10508, 'princess.svg', 'image/svg+xml', 'user', NULL, 1);
INSERT INTO `avatar` VALUES (10509, 'spectrum.svg', 'image/svg+xml', 'project', NULL, 1);

-- ----------------------------
-- Table structure for board
-- ----------------------------
DROP TABLE IF EXISTS `board`;
CREATE TABLE `board`  (
  `ID` decimal(18, 0) NOT NULL,
  `JQL` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for boardproject
-- ----------------------------
DROP TABLE IF EXISTS `boardproject`;
CREATE TABLE `boardproject`  (
  `BOARD_ID` decimal(18, 0) NOT NULL,
  `PROJECT_ID` decimal(18, 0) NOT NULL,
  PRIMARY KEY (`BOARD_ID`, `PROJECT_ID`) USING BTREE,
  INDEX `idx_board_project_ids`(`PROJECT_ID`) USING BTREE,
  INDEX `idx_board_board_ids`(`BOARD_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for changegroup
-- ----------------------------
DROP TABLE IF EXISTS `changegroup`;
CREATE TABLE `changegroup`  (
  `ID` decimal(18, 0) NOT NULL,
  `issueid` decimal(18, 0) NULL DEFAULT NULL,
  `AUTHOR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATED` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `chggroup_author_created`(`AUTHOR`, `CREATED`) USING BTREE,
  INDEX `chggroup_issue_id`(`issueid`, `ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for changeitem
-- ----------------------------
DROP TABLE IF EXISTS `changeitem`;
CREATE TABLE `changeitem`  (
  `ID` decimal(18, 0) NOT NULL,
  `groupid` decimal(18, 0) NULL DEFAULT NULL,
  `FIELDTYPE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FIELD` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OLDVALUE` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `OLDSTRING` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `NEWVALUE` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `NEWSTRING` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `chgitem_group_field`(`groupid`, `FIELD`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for clusteredjob
-- ----------------------------
DROP TABLE IF EXISTS `clusteredjob`;
CREATE TABLE `clusteredjob`  (
  `ID` decimal(18, 0) NOT NULL,
  `JOB_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `JOB_RUNNER_KEY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SCHED_TYPE` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INTERVAL_MILLIS` decimal(18, 0) NULL DEFAULT NULL,
  `FIRST_RUN` decimal(18, 0) NULL DEFAULT NULL,
  `CRON_EXPRESSION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TIME_ZONE` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NEXT_RUN` decimal(18, 0) NULL DEFAULT NULL,
  `VERSION` decimal(18, 0) NULL DEFAULT NULL,
  `PARAMETERS` blob NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `clusteredjob_jobid_idx`(`JOB_ID`) USING BTREE,
  INDEX `clusteredjob_jrk_idx`(`JOB_RUNNER_KEY`) USING BTREE,
  INDEX `clusteredjob_nextrun_idx`(`NEXT_RUN`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of clusteredjob
-- ----------------------------
INSERT INTO `clusteredjob` VALUES (10000, 'com.atlassian.jira.service.JiraService:10001', 'com.atlassian.jira.service.DefaultServiceManager', 'C', NULL, NULL, '0 0 8/12 * * ?', NULL, 1552046400000, 2, 0xACED000573720037636F6D2E676F6F676C652E636F6D6D6F6E2E636F6C6C6563742E496D6D757461626C6542694D61702453657269616C697A6564466F726D000000000000000002000078720035636F6D2E676F6F676C652E636F6D6D6F6E2E636F6C6C6563742E496D6D757461626C654D61702453657269616C697A6564466F726D00000000000000000200025B00046B6579737400135B4C6A6176612F6C616E672F4F626A6563743B5B000676616C75657371007E00027870757200135B4C6A6176612E6C616E672E4F626A6563743B90CE589F1073296C020000787000000001740033636F6D2E61746C61737369616E2E6A6972612E736572766963652E536572766963654D616E616765723A7365727669636549647571007E0004000000017372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000002711);
INSERT INTO `clusteredjob` VALUES (10001, 'com.atlassian.jira.service.JiraService:10002', 'com.atlassian.jira.service.DefaultServiceManager', 'C', NULL, NULL, '0 0 8 * * ?', NULL, 1552089600000, 2, 0xACED000573720037636F6D2E676F6F676C652E636F6D6D6F6E2E636F6C6C6563742E496D6D757461626C6542694D61702453657269616C697A6564466F726D000000000000000002000078720035636F6D2E676F6F676C652E636F6D6D6F6E2E636F6C6C6563742E496D6D757461626C654D61702453657269616C697A6564466F726D00000000000000000200025B00046B6579737400135B4C6A6176612F6C616E672F4F626A6563743B5B000676616C75657371007E00027870757200135B4C6A6176612E6C616E672E4F626A6563743B90CE589F1073296C020000787000000001740033636F6D2E61746C61737369616E2E6A6972612E736572766963652E536572766963654D616E616765723A7365727669636549647571007E0004000000017372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000002712);
INSERT INTO `clusteredjob` VALUES (10202, 'LocalPluginLicenseNotificationJob-job', 'LocalPluginLicenseNotificationJob-runner', 'I', 86400000, 1551969240251, NULL, NULL, 1552055640255, 2, NULL);
INSERT INTO `clusteredjob` VALUES (10203, 'PluginRequestCheckJob-job', 'PluginRequestCheckJob-runner', 'I', 3600000, 1551969240258, NULL, NULL, 1552016062864, 5, NULL);
INSERT INTO `clusteredjob` VALUES (10204, 'PluginUpdateCheckJob-job', 'PluginUpdateCheckJob-runner', 'I', 86400000, 1551978158981, NULL, NULL, 1552095262889, 2, NULL);
INSERT INTO `clusteredjob` VALUES (10205, 'InstanceTopologyJob-job', 'InstanceTopologyJob-runner', 'I', 86400000, 1552013400701, NULL, NULL, 1552099800702, 2, NULL);
INSERT INTO `clusteredjob` VALUES (10207, '905f78e3-288d-4ff0-bf77-37e23591db0c', 'com.atlassian.jira.plugin.ext.bamboo.service.PlanStatusUpdateJob', 'I', 60000, 1551969244621, NULL, NULL, 1552015068793, 166, NULL);
INSERT INTO `clusteredjob` VALUES (10214, 'CompatibilityPluginScheduler.JobId.LEXO_RANK_SCHEDULER_JOB', 'CompatibilityPluginScheduler.JobRunnerKey.com.atlassian.greenhopper.service.lexorank.balance.LexoRankBalancePluginJob', 'I', 60000, 1551969252795, NULL, NULL, 1552015068849, 166, NULL);
INSERT INTO `clusteredjob` VALUES (10217, 'com.atlassian.jira.plugins.dvcs.scheduler.DvcsScheduler:job', 'com.atlassian.jira.plugins.dvcs.scheduler.DvcsScheduler', 'I', 3600000, 1551971794025, NULL, NULL, 1552016062866, 4, NULL);
INSERT INTO `clusteredjob` VALUES (10306, 'com.atlassian.jira.service.JiraService:10200', 'com.atlassian.jira.service.DefaultServiceManager', 'C', NULL, NULL, '0 0 10/12 * * ?', NULL, 1552053600000, 2, 0xACED000573720037636F6D2E676F6F676C652E636F6D6D6F6E2E636F6C6C6563742E496D6D757461626C6542694D61702453657269616C697A6564466F726D000000000000000002000078720035636F6D2E676F6F676C652E636F6D6D6F6E2E636F6C6C6563742E496D6D757461626C654D61702453657269616C697A6564466F726D00000000000000000200025B00046B6579737400135B4C6A6176612F6C616E672F4F626A6563743B5B000676616C75657371007E00027870757200135B4C6A6176612E6C616E672E4F626A6563743B90CE589F1073296C020000787000000001740033636F6D2E61746C61737369616E2E6A6972612E736572766963652E536572766963654D616E616765723A7365727669636549647571007E0004000000017372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000027D8);
INSERT INTO `clusteredjob` VALUES (10319, 'db68843c-74ca-41ee-a0e8-faf3a412e792', 'com.atlassian.jira.plugin.ext.bamboo.service.PlanStatusUpdateJob', 'I', 60000, 1551970679630, NULL, NULL, 1552015069036, 148, NULL);
INSERT INTO `clusteredjob` VALUES (10419, 'ecce1fdb-2650-476e-a3e2-32d0fe0a706c', 'com.atlassian.jira.plugin.ext.bamboo.service.PlanStatusUpdateJob', 'I', 60000, 1551971762773, NULL, NULL, 1552015069748, 137, NULL);
INSERT INTO `clusteredjob` VALUES (10517, '85fa5fee-b7f8-4521-92d5-007ffe92dd64', 'com.atlassian.jira.plugin.ext.bamboo.service.PlanStatusUpdateJob', 'I', 60000, 1552008856473, NULL, NULL, 1552015068747, 98, NULL);
INSERT INTO `clusteredjob` VALUES (10600, 'analytics-collection', 'com.atlassian.plugins.authentication.impl.analytics.StatisticsCollectionService', 'C', NULL, NULL, '0 0 23 * * ?', NULL, 1552057200000, 1, NULL);
INSERT INTO `clusteredjob` VALUES (10601, 'assertionId-cleanup', 'com.atlassian.plugins.authentication.impl.web.saml.AssertionValidationService', 'I', 3600000, 1552015543700, NULL, NULL, 1552015543700, 1, NULL);
INSERT INTO `clusteredjob` VALUES (10602, 'data-provider-poll', 'com.atlassian.jira.plugin.devstatus.provider.DevSummaryUpdateJob', 'I', 300000, 1552011975976, NULL, NULL, 1552015068801, 11, NULL);
INSERT INTO `clusteredjob` VALUES (10603, 'data-provider-cleanup', 'com.atlassian.jira.plugin.devstatus.provider.DataProviderCleanupJob', 'I', 1800000, 1552011977258, NULL, NULL, 1552015668730, 3, NULL);
INSERT INTO `clusteredjob` VALUES (10604, 'com.atlassian.diagnostics.internal.analytics.DailyAlertAnalyticsJob', 'DailyAlertAnalyticsJob', 'C', NULL, NULL, '0 19 * * * ?', NULL, 1552015140000, 1, NULL);
INSERT INTO `clusteredjob` VALUES (10605, 'com.atlassian.jira.web.action.issue.DefaultTemporaryWebAttachmentsMonitor', 'com.atlassian.jira.web.action.issue.DefaultTemporaryWebAttachmentsMonitor', 'I', 3600000, 1552015612311, NULL, NULL, 1552015612311, 1, NULL);
INSERT INTO `clusteredjob` VALUES (10607, 'Service Provider Session Remover', 'com.atlassian.oauth.serviceprovider.internal.ExpiredSessionRemover', 'I', 28800000, 1552040848638, NULL, NULL, 1552040848638, 1, NULL);
INSERT INTO `clusteredjob` VALUES (10608, 'CompatibilityPluginScheduler.JobId.hipchatRefreshConnectionStatusJob', 'CompatibilityPluginScheduler.JobRunnerKey.com.atlassian.jira.plugins.hipchat.service.ping.RefreshConnectionStatusJobHandler', 'I', 3600000, 1552012073091, NULL, NULL, 1552015673121, 2, NULL);
INSERT INTO `clusteredjob` VALUES (10609, 'CompatibilityPluginScheduler.JobId.hipchatUpdateGlancesDataJob', 'CompatibilityPluginScheduler.JobRunnerKey.com.atlassian.jira.plugins.hipchat.service.connect.UpdateGlancesDataJobHandler', 'I', 60000, 1552012077845, NULL, NULL, 1552015078169, 51, NULL);
INSERT INTO `clusteredjob` VALUES (10610, 'CompatibilityPluginScheduler.JobId.hipchatInstallGlancesJob', 'CompatibilityPluginScheduler.JobRunnerKey.com.atlassian.jira.plugins.hipchat.service.connect.InstallGlancesJobHandler', 'I', 3600000, 1552012076267, NULL, NULL, 1552015676279, 2, NULL);
INSERT INTO `clusteredjob` VALUES (10611, 'com.atlassian.jira.plugins.inform.events.cleanup.CleanupJobScheduler', 'com.atlassian.jira.plugins.inform.events.cleanup.CleanupJobScheduler', 'C', NULL, NULL, '0 0 0 1/1 * ? *', NULL, 1552060800000, 1, NULL);
INSERT INTO `clusteredjob` VALUES (10612, '8430c53b-cfc1-4432-926a-4982532d2f2e', 'com.atlassian.jira.plugin.ext.bamboo.service.PlanStatusUpdateJob', 'I', 60000, 1552012049043, NULL, NULL, 1552015069767, 51, NULL);
INSERT INTO `clusteredjob` VALUES (10613, 'com.atlassian.jira.analytics.scheduler.AnalyticsScheduler', 'com.atlassian.jira.analytics.scheduler.AnalyticsScheduler', 'I', 604800000, 1552098449293, NULL, NULL, 1552098449293, 1, NULL);
INSERT INTO `clusteredjob` VALUES (10614, 'TruncateAlertsJobRunner', 'com.atlassian.diagnostics.internal.DefaultMonitoringService$TruncateAlertsJobRunner', 'I', 86400000, 1552098449308, NULL, NULL, 1552098449308, 1, NULL);
INSERT INTO `clusteredjob` VALUES (10615, 'applink-status-analytics-job', 'com.atlassian.applinks.analytics.ApplinkStatusJob', 'I', 86400000, NULL, NULL, NULL, 1552098468792, 2, NULL);
INSERT INTO `clusteredjob` VALUES (10617, 'com.atlassian.jira.plugins.inform.batching.cron.BatchNotificationJobSchedulerImpl', 'com.atlassian.jira.plugins.inform.batching.cron.BatchNotificationJobSchedulerImpl', 'I', 300000, 1552012349917, NULL, NULL, 1552015049922, 10, 0xACED000573720035636F6D2E676F6F676C652E636F6D6D6F6E2E636F6C6C6563742E496D6D757461626C654D61702453657269616C697A6564466F726D00000000000000000200025B00046B6579737400135B4C6A6176612F6C616E672F4F626A6563743B5B000676616C75657371007E00017870757200135B4C6A6176612E6C616E672E4F626A6563743B90CE589F1073296C0200007870000000027400116576656E74436F6E73756D65724E616D6574000D636C75737465724C6F636B49647571007E0003000000027400116D61696C4576656E74436F6E73756D6572740059636F6D2E61746C61737369616E2E6A6972612E706C7567696E732E696E666F726D2E6261746368696E672E63726F6E2E4F6E6365506572436C75737465724A6F6252756E6E65722E6D61696C4576656E74436F6E73756D6572);
INSERT INTO `clusteredjob` VALUES (10618, 'com.atlassian.jira.plugins.inform.batching.cron.BatchNotificationJobSchedulerImpl.mentions', 'com.atlassian.jira.plugins.inform.batching.cron.BatchNotificationJobSchedulerImpl', 'I', 60000, 1552012109950, NULL, NULL, 1552015050841, 50, 0xACED000573720035636F6D2E676F6F676C652E636F6D6D6F6E2E636F6C6C6563742E496D6D757461626C654D61702453657269616C697A6564466F726D00000000000000000200025B00046B6579737400135B4C6A6176612F6C616E672F4F626A6563743B5B000676616C75657371007E00017870757200135B4C6A6176612E6C616E672E4F626A6563743B90CE589F1073296C0200007870000000027400116576656E74436F6E73756D65724E616D6574000D636C75737465724C6F636B49647571007E0003000000027400186D61696C4D656E74696F6E4576656E74436F6E73756D6572740060636F6D2E61746C61737369616E2E6A6972612E706C7567696E732E696E666F726D2E6261746368696E672E63726F6E2E4F6E6365506572436C75737465724A6F6252756E6E65722E6D61696C4D656E74696F6E4576656E74436F6E73756D6572);
INSERT INTO `clusteredjob` VALUES (10619, 'com.atlassian.whisper.plugin.fetch.FetchJob', 'com.atlassian.whisper.plugin.fetch.FetchJob', 'I', 21600000, 1552015667608, NULL, NULL, 1552015667608, 1, NULL);

-- ----------------------------
-- Table structure for clusterlockstatus
-- ----------------------------
DROP TABLE IF EXISTS `clusterlockstatus`;
CREATE TABLE `clusterlockstatus`  (
  `ID` decimal(18, 0) NOT NULL,
  `LOCK_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LOCKED_BY_NODE` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UPDATE_TIME` decimal(18, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `cluster_lock_name_idx`(`LOCK_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for clustermessage
-- ----------------------------
DROP TABLE IF EXISTS `clustermessage`;
CREATE TABLE `clustermessage`  (
  `ID` decimal(18, 0) NOT NULL,
  `SOURCE_NODE` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DESTINATION_NODE` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CLAIMED_BY_NODE` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MESSAGE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MESSAGE_TIME` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `source_destination_node_idx`(`SOURCE_NODE`, `DESTINATION_NODE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for clusternode
-- ----------------------------
DROP TABLE IF EXISTS `clusternode`;
CREATE TABLE `clusternode`  (
  `NODE_ID` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `NODE_STATE` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TIMESTAMP` decimal(18, 0) NULL DEFAULT NULL,
  `IP` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CACHE_LISTENER_PORT` decimal(18, 0) NULL DEFAULT NULL,
  `NODE_BUILD_NUMBER` decimal(18, 0) NULL DEFAULT NULL,
  `NODE_VERSION` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`NODE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for clusternodeheartbeat
-- ----------------------------
DROP TABLE IF EXISTS `clusternodeheartbeat`;
CREATE TABLE `clusternodeheartbeat`  (
  `NODE_ID` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `HEARTBEAT_TIME` decimal(18, 0) NULL DEFAULT NULL,
  `DATABASE_TIME` decimal(18, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`NODE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for clusterupgradestate
-- ----------------------------
DROP TABLE IF EXISTS `clusterupgradestate`;
CREATE TABLE `clusterupgradestate`  (
  `ID` decimal(18, 0) NOT NULL,
  `DATABASE_TIME` decimal(18, 0) NULL DEFAULT NULL,
  `CLUSTER_BUILD_NUMBER` decimal(18, 0) NULL DEFAULT NULL,
  `CLUSTER_VERSION` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STATE` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORDER_NUMBER` decimal(18, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `ordernumber_idx`(`ORDER_NUMBER`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for columnlayout
-- ----------------------------
DROP TABLE IF EXISTS `columnlayout`;
CREATE TABLE `columnlayout`  (
  `ID` decimal(18, 0) NOT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SEARCHREQUEST` decimal(18, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `cl_searchrequest`(`SEARCHREQUEST`) USING BTREE,
  INDEX `cl_username`(`USERNAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of columnlayout
-- ----------------------------
INSERT INTO `columnlayout` VALUES (10000, NULL, NULL);

-- ----------------------------
-- Table structure for columnlayoutitem
-- ----------------------------
DROP TABLE IF EXISTS `columnlayoutitem`;
CREATE TABLE `columnlayoutitem`  (
  `ID` decimal(18, 0) NOT NULL,
  `COLUMNLAYOUT` decimal(18, 0) NULL DEFAULT NULL,
  `FIELDIDENTIFIER` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `HORIZONTALPOSITION` decimal(18, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `idx_cli_fieldidentifier`(`FIELDIDENTIFIER`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of columnlayoutitem
-- ----------------------------
INSERT INTO `columnlayoutitem` VALUES (10000, 10000, 'issuekey', 0);
INSERT INTO `columnlayoutitem` VALUES (10001, 10000, 'status', 1);
INSERT INTO `columnlayoutitem` VALUES (10002, 10000, 'created', 2);
INSERT INTO `columnlayoutitem` VALUES (10003, 10000, 'updated', 3);
INSERT INTO `columnlayoutitem` VALUES (10004, 10000, 'customfield_10000', 4);

-- ----------------------------
-- Table structure for component
-- ----------------------------
DROP TABLE IF EXISTS `component`;
CREATE TABLE `component`  (
  `ID` decimal(18, 0) NOT NULL,
  `PROJECT` decimal(18, 0) NULL DEFAULT NULL,
  `cname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `URL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LEAD` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ASSIGNEETYPE` decimal(18, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `idx_component_project`(`PROJECT`) USING BTREE,
  INDEX `idx_component_name`(`cname`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for configurationcontext
-- ----------------------------
DROP TABLE IF EXISTS `configurationcontext`;
CREATE TABLE `configurationcontext`  (
  `ID` decimal(18, 0) NOT NULL,
  `PROJECTCATEGORY` decimal(18, 0) NULL DEFAULT NULL,
  `PROJECT` decimal(18, 0) NULL DEFAULT NULL,
  `customfield` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FIELDCONFIGSCHEME` decimal(18, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `confcontextkey`(`customfield`) USING BTREE,
  INDEX `confcontext`(`PROJECTCATEGORY`, `PROJECT`, `customfield`) USING BTREE,
  INDEX `confcontextprojectkey`(`PROJECT`, `customfield`) USING BTREE,
  INDEX `confcontextfieldconfigscheme`(`FIELDCONFIGSCHEME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of configurationcontext
-- ----------------------------
INSERT INTO `configurationcontext` VALUES (10000, NULL, NULL, 'issuetype', 10000);
INSERT INTO `configurationcontext` VALUES (10100, NULL, NULL, 'priority', 10100);
INSERT INTO `configurationcontext` VALUES (10200, NULL, NULL, 'customfield_10000', 10200);
INSERT INTO `configurationcontext` VALUES (10300, NULL, NULL, 'customfield_10100', 10300);
INSERT INTO `configurationcontext` VALUES (10301, NULL, NULL, 'customfield_10101', 10301);
INSERT INTO `configurationcontext` VALUES (10302, NULL, NULL, 'customfield_10105', 10302);
INSERT INTO `configurationcontext` VALUES (10303, NULL, NULL, 'customfield_10103', 10303);
INSERT INTO `configurationcontext` VALUES (10304, NULL, NULL, 'customfield_10102', 10304);
INSERT INTO `configurationcontext` VALUES (10305, NULL, NULL, 'customfield_10104', 10305);
INSERT INTO `configurationcontext` VALUES (10306, NULL, NULL, 'customfield_10106', 10306);

-- ----------------------------
-- Table structure for customfield
-- ----------------------------
DROP TABLE IF EXISTS `customfield`;
CREATE TABLE `customfield`  (
  `ID` decimal(18, 0) NOT NULL,
  `cfkey` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CUSTOMFIELDTYPEKEY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CUSTOMFIELDSEARCHERKEY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `cfname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `defaultvalue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FIELDTYPE` decimal(18, 0) NULL DEFAULT NULL,
  `PROJECT` decimal(18, 0) NULL DEFAULT NULL,
  `ISSUETYPE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customfield
-- ----------------------------
INSERT INTO `customfield` VALUES (10000, NULL, 'com.atlassian.jira.plugins.jira-development-integration-plugin:devsummary', 'com.atlassian.jira.plugins.jira-development-integration-plugin:devsummarysearcher', '开发', '开发摘要域只用于Jira软件。', NULL, NULL, NULL, NULL);
INSERT INTO `customfield` VALUES (10100, NULL, 'com.pyxis.greenhopper.jira:gh-lexo-rank', 'com.pyxis.greenhopper.jira:gh-lexo-rank-searcher', '等级', '全局评级域仅供 Jira Software 使用。', NULL, NULL, NULL, NULL);
INSERT INTO `customfield` VALUES (10101, NULL, 'com.pyxis.greenhopper.jira:gh-epic-link', 'com.pyxis.greenhopper.jira:gh-epic-link-searcher', '史诗链接', '选择与此问题关联的Epic。', NULL, NULL, NULL, NULL);
INSERT INTO `customfield` VALUES (10102, NULL, 'com.pyxis.greenhopper.jira:gh-epic-status', 'com.pyxis.greenhopper.jira:gh-epic-status-searcher', 'Epic状态', '仅供 Jira Software 使用的 Epic 状态域。', NULL, NULL, NULL, NULL);
INSERT INTO `customfield` VALUES (10103, NULL, 'com.pyxis.greenhopper.jira:gh-epic-label', 'com.pyxis.greenhopper.jira:gh-epic-label-searcher', '史诗名称', '用一个简短的名称标识此史诗。', NULL, NULL, NULL, NULL);
INSERT INTO `customfield` VALUES (10104, NULL, 'com.pyxis.greenhopper.jira:gh-epic-color', 'com.pyxis.greenhopper.jira:gh-epic-color-searcher', 'Epic颜色', '仅供 Jira Software 使用的 Epic 颜色域。', NULL, NULL, NULL, NULL);
INSERT INTO `customfield` VALUES (10105, NULL, 'com.pyxis.greenhopper.jira:gh-sprint', 'com.pyxis.greenhopper.jira:gh-sprint-searcher', 'Sprint', 'Jira Software Sprint 域', NULL, NULL, NULL, NULL);
INSERT INTO `customfield` VALUES (10106, NULL, 'com.atlassian.jira.plugin.system.customfieldtypes:float', 'com.atlassian.jira.plugin.system.customfieldtypes:exactnumber', 'Story Point', '用于测量需求的复杂度或大小。', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for customfieldoption
-- ----------------------------
DROP TABLE IF EXISTS `customfieldoption`;
CREATE TABLE `customfieldoption`  (
  `ID` decimal(18, 0) NOT NULL,
  `CUSTOMFIELD` decimal(18, 0) NULL DEFAULT NULL,
  `CUSTOMFIELDCONFIG` decimal(18, 0) NULL DEFAULT NULL,
  `PARENTOPTIONID` decimal(18, 0) NULL DEFAULT NULL,
  `SEQUENCE` decimal(18, 0) NULL DEFAULT NULL,
  `customvalue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `optiontype` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `disabled` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `cf_cfoption`(`CUSTOMFIELD`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customfieldoption
-- ----------------------------
INSERT INTO `customfieldoption` VALUES (10000, 10102, 10304, NULL, 0, '待办', NULL, 'N');
INSERT INTO `customfieldoption` VALUES (10001, 10102, 10304, NULL, 1, '处理中', NULL, 'N');
INSERT INTO `customfieldoption` VALUES (10002, 10102, 10304, NULL, 2, '完成', NULL, 'N');

-- ----------------------------
-- Table structure for customfieldvalue
-- ----------------------------
DROP TABLE IF EXISTS `customfieldvalue`;
CREATE TABLE `customfieldvalue`  (
  `ID` decimal(18, 0) NOT NULL,
  `ISSUE` decimal(18, 0) NULL DEFAULT NULL,
  `CUSTOMFIELD` decimal(18, 0) NULL DEFAULT NULL,
  `UPDATED` decimal(18, 0) NULL DEFAULT NULL,
  `PARENTKEY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STRINGVALUE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NUMBERVALUE` decimal(18, 6) NULL DEFAULT NULL,
  `TEXTVALUE` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `DATEVALUE` datetime(0) NULL DEFAULT NULL,
  `VALUETYPE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `cfvalue_issue`(`ISSUE`, `CUSTOMFIELD`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cwd_application
-- ----------------------------
DROP TABLE IF EXISTS `cwd_application`;
CREATE TABLE `cwd_application`  (
  `ID` decimal(18, 0) NOT NULL,
  `application_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `lower_application_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `active` decimal(9, 0) NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `application_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `credential` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `uk_application_name`(`lower_application_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cwd_application
-- ----------------------------
INSERT INTO `cwd_application` VALUES (1, 'crowd-embedded', 'crowd-embedded', '2013-02-28 11:57:51', '2013-02-28 11:57:51', 1, '', 'CROWD', 'X');

-- ----------------------------
-- Table structure for cwd_application_address
-- ----------------------------
DROP TABLE IF EXISTS `cwd_application_address`;
CREATE TABLE `cwd_application_address`  (
  `application_id` decimal(18, 0) NOT NULL,
  `remote_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `encoded_address_binary` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `remote_address_mask` decimal(9, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`application_id`, `remote_address`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cwd_directory
-- ----------------------------
DROP TABLE IF EXISTS `cwd_directory`;
CREATE TABLE `cwd_directory`  (
  `ID` decimal(18, 0) NOT NULL,
  `directory_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `lower_directory_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `active` decimal(9, 0) NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `impl_class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `lower_impl_class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `directory_type` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `directory_position` decimal(18, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `uk_directory_name`(`lower_directory_name`) USING BTREE,
  INDEX `idx_directory_active`(`active`) USING BTREE,
  INDEX `idx_directory_impl`(`lower_impl_class`) USING BTREE,
  INDEX `idx_directory_type`(`directory_type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cwd_directory
-- ----------------------------
INSERT INTO `cwd_directory` VALUES (1, 'Jira Internal Directory', 'jira internal directory', '2013-02-28 11:57:51', '2013-02-28 11:57:51', 1, 'Jira default internal directory', 'com.atlassian.crowd.directory.InternalDirectory', 'com.atlassian.crowd.directory.internaldirectory', 'INTERNAL', 0);

-- ----------------------------
-- Table structure for cwd_directory_attribute
-- ----------------------------
DROP TABLE IF EXISTS `cwd_directory_attribute`;
CREATE TABLE `cwd_directory_attribute`  (
  `directory_id` decimal(18, 0) NOT NULL,
  `attribute_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `attribute_value` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`directory_id`, `attribute_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cwd_directory_attribute
-- ----------------------------
INSERT INTO `cwd_directory_attribute` VALUES (1, 'user_encryption_method', 'atlassian-security');

-- ----------------------------
-- Table structure for cwd_directory_operation
-- ----------------------------
DROP TABLE IF EXISTS `cwd_directory_operation`;
CREATE TABLE `cwd_directory_operation`  (
  `directory_id` decimal(18, 0) NOT NULL,
  `operation_type` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`directory_id`, `operation_type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cwd_directory_operation
-- ----------------------------
INSERT INTO `cwd_directory_operation` VALUES (1, 'CREATE_GROUP');
INSERT INTO `cwd_directory_operation` VALUES (1, 'CREATE_ROLE');
INSERT INTO `cwd_directory_operation` VALUES (1, 'CREATE_USER');
INSERT INTO `cwd_directory_operation` VALUES (1, 'DELETE_GROUP');
INSERT INTO `cwd_directory_operation` VALUES (1, 'DELETE_ROLE');
INSERT INTO `cwd_directory_operation` VALUES (1, 'DELETE_USER');
INSERT INTO `cwd_directory_operation` VALUES (1, 'UPDATE_GROUP');
INSERT INTO `cwd_directory_operation` VALUES (1, 'UPDATE_GROUP_ATTRIBUTE');
INSERT INTO `cwd_directory_operation` VALUES (1, 'UPDATE_ROLE');
INSERT INTO `cwd_directory_operation` VALUES (1, 'UPDATE_ROLE_ATTRIBUTE');
INSERT INTO `cwd_directory_operation` VALUES (1, 'UPDATE_USER');
INSERT INTO `cwd_directory_operation` VALUES (1, 'UPDATE_USER_ATTRIBUTE');

-- ----------------------------
-- Table structure for cwd_group
-- ----------------------------
DROP TABLE IF EXISTS `cwd_group`;
CREATE TABLE `cwd_group`  (
  `ID` decimal(18, 0) NOT NULL,
  `group_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `lower_group_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `active` decimal(9, 0) NULL DEFAULT NULL,
  `local` decimal(9, 0) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `lower_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `group_type` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `directory_id` decimal(18, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `uk_group_name_dir_id`(`lower_group_name`, `directory_id`) USING BTREE,
  INDEX `idx_group_active`(`lower_group_name`, `active`) USING BTREE,
  INDEX `idx_group_dir_id`(`directory_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cwd_group
-- ----------------------------
INSERT INTO `cwd_group` VALUES (10000, 'jira-administrators', 'jira-administrators', 1, 0, '2013-02-28 11:57:51', '2013-02-28 11:57:51', '', NULL, 'GROUP', 1);
INSERT INTO `cwd_group` VALUES (10010, 'jira-software-users', 'jira-software-users', 1, 0, '2019-03-07 22:08:54', '2019-03-07 22:08:54', NULL, NULL, 'GROUP', 1);

-- ----------------------------
-- Table structure for cwd_group_attributes
-- ----------------------------
DROP TABLE IF EXISTS `cwd_group_attributes`;
CREATE TABLE `cwd_group_attributes`  (
  `ID` decimal(18, 0) NOT NULL,
  `group_id` decimal(18, 0) NULL DEFAULT NULL,
  `directory_id` decimal(18, 0) NULL DEFAULT NULL,
  `attribute_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `attribute_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `lower_attribute_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `uk_group_attr_name_lval`(`group_id`, `attribute_name`, `lower_attribute_value`) USING BTREE,
  INDEX `idx_group_attr_dir_name_lval`(`directory_id`, `attribute_name`, `lower_attribute_value`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cwd_membership
-- ----------------------------
DROP TABLE IF EXISTS `cwd_membership`;
CREATE TABLE `cwd_membership`  (
  `ID` decimal(18, 0) NOT NULL,
  `parent_id` decimal(18, 0) NULL DEFAULT NULL,
  `child_id` decimal(18, 0) NULL DEFAULT NULL,
  `membership_type` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `group_type` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `parent_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `lower_parent_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `child_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `lower_child_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `directory_id` decimal(18, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `uk_mem_parent_child_type`(`parent_id`, `child_id`, `membership_type`) USING BTREE,
  INDEX `idx_mem_dir_parent_child`(`lower_parent_name`, `lower_child_name`, `membership_type`, `directory_id`) USING BTREE,
  INDEX `idx_mem_dir_parent`(`lower_parent_name`, `membership_type`, `directory_id`) USING BTREE,
  INDEX `idx_mem_dir_child`(`lower_child_name`, `membership_type`, `directory_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cwd_membership
-- ----------------------------
INSERT INTO `cwd_membership` VALUES (10000, 10000, 10000, 'GROUP_USER', NULL, 'jira-administrators', 'jira-administrators', 'yc', 'yc', 1);
INSERT INTO `cwd_membership` VALUES (10001, 10010, 10000, 'GROUP_USER', NULL, 'jira-software-users', 'jira-software-users', 'yc', 'yc', 1);

-- ----------------------------
-- Table structure for cwd_user
-- ----------------------------
DROP TABLE IF EXISTS `cwd_user`;
CREATE TABLE `cwd_user`  (
  `ID` decimal(18, 0) NOT NULL,
  `directory_id` decimal(18, 0) NULL DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `lower_user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `active` decimal(9, 0) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `lower_first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `lower_last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `lower_display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `lower_email_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREDENTIAL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `deleted_externally` decimal(9, 0) NULL DEFAULT NULL,
  `EXTERNAL_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `uk_user_name_dir_id`(`lower_user_name`, `directory_id`) USING BTREE,
  INDEX `uk_user_externalid_dir_id`(`EXTERNAL_ID`, `directory_id`) USING BTREE,
  INDEX `idx_first_name`(`lower_first_name`) USING BTREE,
  INDEX `idx_last_name`(`lower_last_name`) USING BTREE,
  INDEX `idx_display_name`(`lower_display_name`) USING BTREE,
  INDEX `idx_email_address`(`lower_email_address`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cwd_user
-- ----------------------------
INSERT INTO `cwd_user` VALUES (10000, 1, 'yc', 'yc', 1, '2019-03-07 22:12:15', '2019-03-07 22:12:15', '', '', 'yechao', 'yechao', 'yechao', 'yechao', '2320158601@qq.com', '2320158601@qq.com', '{PKCS5S2}60m7O0ngBkpSU6tSSNKvxiqmt+oxgeU+fJzDMj+khRJSWGvxUNx1sEk6QM9IJAiS', NULL, '9ead7371-b1fb-4714-91b9-d2adb2bc516c');

-- ----------------------------
-- Table structure for cwd_user_attributes
-- ----------------------------
DROP TABLE IF EXISTS `cwd_user_attributes`;
CREATE TABLE `cwd_user_attributes`  (
  `ID` decimal(18, 0) NOT NULL,
  `user_id` decimal(18, 0) NULL DEFAULT NULL,
  `directory_id` decimal(18, 0) NULL DEFAULT NULL,
  `attribute_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `attribute_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `lower_attribute_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `idx_user_attr_dir_name_lval`(`directory_id`, `attribute_name`, `lower_attribute_value`) USING BTREE,
  INDEX `uk_user_attr_name_lval`(`user_id`, `attribute_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cwd_user_attributes
-- ----------------------------
INSERT INTO `cwd_user_attributes` VALUES (10000, 10000, 1, 'requiresPasswordChange', 'false', 'false');
INSERT INTO `cwd_user_attributes` VALUES (10001, 10000, 1, 'invalidPasswordAttempts', '0', '0');
INSERT INTO `cwd_user_attributes` VALUES (10002, 10000, 1, 'passwordLastChanged', '1551967936121', '1551967936121');
INSERT INTO `cwd_user_attributes` VALUES (10003, 10000, 1, 'password.reset.request.expiry', '1552054336572', '1552054336572');
INSERT INTO `cwd_user_attributes` VALUES (10004, 10000, 1, 'password.reset.request.token', '97b507e407760f3914db0726ed79f762bd9728fd', '97b507e407760f3914db0726ed79f762bd9728fd');
INSERT INTO `cwd_user_attributes` VALUES (10100, 10000, 1, 'lastAuthenticated', '1552014443061', '1552014443061');
INSERT INTO `cwd_user_attributes` VALUES (10101, 10000, 1, 'login.currentFailedCount', '0', '0');
INSERT INTO `cwd_user_attributes` VALUES (10102, 10000, 1, 'login.lastLoginMillis', '1552014443244', '1552014443244');
INSERT INTO `cwd_user_attributes` VALUES (10103, 10000, 1, 'login.count', '9', '9');
INSERT INTO `cwd_user_attributes` VALUES (10104, 10000, 1, 'login.previousLoginMillis', '1552012206140', '1552012206140');

-- ----------------------------
-- Table structure for deadletter
-- ----------------------------
DROP TABLE IF EXISTS `deadletter`;
CREATE TABLE `deadletter`  (
  `ID` decimal(18, 0) NOT NULL,
  `MESSAGE_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LAST_SEEN` decimal(18, 0) NULL DEFAULT NULL,
  `MAIL_SERVER_ID` decimal(18, 0) NULL DEFAULT NULL,
  `FOLDER_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `deadletter_msg_server_folder`(`MESSAGE_ID`, `MAIL_SERVER_ID`, `FOLDER_NAME`) USING BTREE,
  INDEX `deadletter_lastSeen`(`LAST_SEEN`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for draftworkflowscheme
-- ----------------------------
DROP TABLE IF EXISTS `draftworkflowscheme`;
CREATE TABLE `draftworkflowscheme`  (
  `ID` decimal(18, 0) NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `WORKFLOW_SCHEME_ID` decimal(18, 0) NULL DEFAULT NULL,
  `LAST_MODIFIED_DATE` datetime(0) NULL DEFAULT NULL,
  `LAST_MODIFIED_USER` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `draft_workflow_scheme_parent`(`WORKFLOW_SCHEME_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for draftworkflowschemeentity
-- ----------------------------
DROP TABLE IF EXISTS `draftworkflowschemeentity`;
CREATE TABLE `draftworkflowschemeentity`  (
  `ID` decimal(18, 0) NOT NULL,
  `SCHEME` decimal(18, 0) NULL DEFAULT NULL,
  `WORKFLOW` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `issuetype` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `draft_workflow_scheme`(`SCHEME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for entity_property
-- ----------------------------
DROP TABLE IF EXISTS `entity_property`;
CREATE TABLE `entity_property`  (
  `ID` decimal(18, 0) NOT NULL,
  `ENTITY_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ENTITY_ID` decimal(18, 0) NULL DEFAULT NULL,
  `PROPERTY_KEY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATED` datetime(0) NULL DEFAULT NULL,
  `UPDATED` datetime(0) NULL DEFAULT NULL,
  `json_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `entityproperty_id_name_key`(`ENTITY_ID`, `ENTITY_NAME`, `PROPERTY_KEY`) USING BTREE,
  INDEX `entityproperty_key_name`(`PROPERTY_KEY`, `ENTITY_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for entity_property_index_document
-- ----------------------------
DROP TABLE IF EXISTS `entity_property_index_document`;
CREATE TABLE `entity_property_index_document`  (
  `ID` decimal(18, 0) NOT NULL,
  `PLUGIN_KEY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MODULE_KEY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ENTITY_KEY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UPDATED` datetime(0) NULL DEFAULT NULL,
  `DOCUMENT` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `entpropindexdoc_module`(`PLUGIN_KEY`, `MODULE_KEY`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of entity_property_index_document
-- ----------------------------
INSERT INTO `entity_property_index_document` VALUES (10000, 'com.atlassian.jira.plugins.jira-development-integration-plugin', 'jira-issue-fusion-jql', 'IssueProperty', '2019-03-07 22:03:15', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<index-document-configuration entity-key=\"IssueProperty\"><key property-key=\"development\"><extract path=\"totalBuilds\" type=\"NUMBER\"/><extract path=\"failingbuilds\" type=\"NUMBER\"/><extract path=\"passedbuilds\" type=\"NUMBER\"/><extract path=\"buildstatus\" type=\"STRING\"/><extract path=\"openprs\" type=\"NUMBER\"/><extract path=\"mergedprs\" type=\"NUMBER\"/><extract path=\"declinedprs\" type=\"NUMBER\"/><extract path=\"prs\" type=\"NUMBER\"/><extract path=\"prstatus\" type=\"STRING\"/><extract path=\"reviews\" type=\"NUMBER\"/><extract path=\"openreviews\" type=\"NUMBER\"/><extract path=\"commits\" type=\"NUMBER\"/><extract path=\"totalDeployments\" type=\"NUMBER\"/><extract path=\"deployed\" type=\"NUMBER\"/><extract path=\"notDeployed\" type=\"NUMBER\"/><extract path=\"environment\" type=\"STRING\"/><extract path=\"totalBranches\" type=\"NUMBER\"/></key></index-document-configuration>');

-- ----------------------------
-- Table structure for entity_translation
-- ----------------------------
DROP TABLE IF EXISTS `entity_translation`;
CREATE TABLE `entity_translation`  (
  `ID` decimal(18, 0) NOT NULL,
  `ENTITY_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ENTITY_ID` decimal(18, 0) NULL DEFAULT NULL,
  `LOCALE` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TRANS_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TRANS_DESC` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `uk_entitytranslation`(`ENTITY_NAME`, `ENTITY_ID`, `LOCALE`) USING BTREE,
  INDEX `entitytranslation_locale`(`LOCALE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for external_entities
-- ----------------------------
DROP TABLE IF EXISTS `external_entities`;
CREATE TABLE `external_entities`  (
  `ID` decimal(18, 0) NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `entitytype` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `ext_entity_name`(`NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for externalgadget
-- ----------------------------
DROP TABLE IF EXISTS `externalgadget`;
CREATE TABLE `externalgadget`  (
  `ID` decimal(18, 0) NOT NULL,
  `GADGET_XML` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for favouriteassociations
-- ----------------------------
DROP TABLE IF EXISTS `favouriteassociations`;
CREATE TABLE `favouriteassociations`  (
  `ID` decimal(18, 0) NOT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `entitytype` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `entityid` decimal(18, 0) NULL DEFAULT NULL,
  `SEQUENCE` decimal(18, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `favourite_index`(`USERNAME`, `entitytype`, `entityid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for feature
-- ----------------------------
DROP TABLE IF EXISTS `feature`;
CREATE TABLE `feature`  (
  `ID` decimal(18, 0) NOT NULL,
  `FEATURE_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FEATURE_TYPE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `USER_KEY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `feature_id_userkey`(`ID`, `USER_KEY`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of feature
-- ----------------------------
INSERT INTO `feature` VALUES (10000, 'com.atlassian.jira.projects.ProjectCentricNavigation.Switch', 'site', '');
INSERT INTO `feature` VALUES (10001, 'com.atlassian.jira.projects.issuenavigator', 'site', '');
INSERT INTO `feature` VALUES (10100, 'com.atlassian.jira.agile.darkfeature.kanplan.enabled', 'site', '');
INSERT INTO `feature` VALUES (10101, 'com.atlassian.jira.agile.darkfeature.kanplan.epics.and.versions.enabled', 'site', '');
INSERT INTO `feature` VALUES (10102, 'com.atlassian.jira.agile.darkfeature.sprint.goal.enabled', 'site', '');
INSERT INTO `feature` VALUES (10103, 'com.atlassian.jira.agile.darkfeature.edit.closed.sprint.enabled', 'site', '');
INSERT INTO `feature` VALUES (10104, 'com.atlassian.jira.agile.darkfeature.splitissue', 'site', '');

-- ----------------------------
-- Table structure for fieldconfigscheme
-- ----------------------------
DROP TABLE IF EXISTS `fieldconfigscheme`;
CREATE TABLE `fieldconfigscheme`  (
  `ID` decimal(18, 0) NOT NULL,
  `configname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `FIELDID` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CUSTOMFIELD` decimal(18, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `fcs_fieldid`(`FIELDID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fieldconfigscheme
-- ----------------------------
INSERT INTO `fieldconfigscheme` VALUES (10000, 'Default Issue Type Scheme', 'Default issue type scheme is the list of global issue types. All newly created issue types will automatically be added to this scheme.', 'issuetype', NULL);
INSERT INTO `fieldconfigscheme` VALUES (10100, 'Default priority scheme', 'This is default priority scheme used by all projects without any other scheme assigned', 'priority', NULL);
INSERT INTO `fieldconfigscheme` VALUES (10200, 'Default Configuration Scheme for 开发', 'Default configuration scheme generated by Jira', 'customfield_10000', NULL);
INSERT INTO `fieldconfigscheme` VALUES (10300, '等级的默认配置方案', 'Jira生成的默认配置方案', 'customfield_10100', NULL);
INSERT INTO `fieldconfigscheme` VALUES (10301, '史诗链接的默认配置方案', 'Jira生成的默认配置方案', 'customfield_10101', NULL);
INSERT INTO `fieldconfigscheme` VALUES (10302, 'Sprint的默认配置方案', 'Jira生成的默认配置方案', 'customfield_10105', NULL);
INSERT INTO `fieldconfigscheme` VALUES (10303, '史诗名称的默认配置方案', 'Jira生成的默认配置方案', 'customfield_10103', NULL);
INSERT INTO `fieldconfigscheme` VALUES (10304, 'Epic状态的默认配置方案', 'Jira生成的默认配置方案', 'customfield_10102', NULL);
INSERT INTO `fieldconfigscheme` VALUES (10305, 'Epic颜色的默认配置方案', 'Jira生成的默认配置方案', 'customfield_10104', NULL);
INSERT INTO `fieldconfigscheme` VALUES (10306, 'Story Point的默认配置方案', 'Jira生成的默认配置方案', 'customfield_10106', NULL);

-- ----------------------------
-- Table structure for fieldconfigschemeissuetype
-- ----------------------------
DROP TABLE IF EXISTS `fieldconfigschemeissuetype`;
CREATE TABLE `fieldconfigschemeissuetype`  (
  `ID` decimal(18, 0) NOT NULL,
  `ISSUETYPE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FIELDCONFIGSCHEME` decimal(18, 0) NULL DEFAULT NULL,
  `FIELDCONFIGURATION` decimal(18, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `fcs_issuetype`(`ISSUETYPE`) USING BTREE,
  INDEX `fcs_scheme`(`FIELDCONFIGSCHEME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fieldconfigschemeissuetype
-- ----------------------------
INSERT INTO `fieldconfigschemeissuetype` VALUES (10100, NULL, 10000, 10000);
INSERT INTO `fieldconfigschemeissuetype` VALUES (10200, NULL, 10100, 10100);
INSERT INTO `fieldconfigschemeissuetype` VALUES (10300, NULL, 10200, 10200);
INSERT INTO `fieldconfigschemeissuetype` VALUES (10400, NULL, 10300, 10300);
INSERT INTO `fieldconfigschemeissuetype` VALUES (10401, NULL, 10301, 10301);
INSERT INTO `fieldconfigschemeissuetype` VALUES (10402, NULL, 10302, 10302);
INSERT INTO `fieldconfigschemeissuetype` VALUES (10403, '10000', 10303, 10303);
INSERT INTO `fieldconfigschemeissuetype` VALUES (10404, '10000', 10304, 10304);
INSERT INTO `fieldconfigschemeissuetype` VALUES (10405, '10000', 10305, 10305);
INSERT INTO `fieldconfigschemeissuetype` VALUES (10406, '10000', 10306, 10306);
INSERT INTO `fieldconfigschemeissuetype` VALUES (10407, '10001', 10306, 10306);

-- ----------------------------
-- Table structure for fieldconfiguration
-- ----------------------------
DROP TABLE IF EXISTS `fieldconfiguration`;
CREATE TABLE `fieldconfiguration`  (
  `ID` decimal(18, 0) NOT NULL,
  `configname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `FIELDID` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CUSTOMFIELD` decimal(18, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `fc_fieldid`(`FIELDID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fieldconfiguration
-- ----------------------------
INSERT INTO `fieldconfiguration` VALUES (10000, 'Default Configuration for Issue Type', 'Default configuration generated by Jira', 'issuetype', NULL);
INSERT INTO `fieldconfiguration` VALUES (10100, 'Default configuration for priority', 'Default configuration generated by Jira', 'priority', NULL);
INSERT INTO `fieldconfiguration` VALUES (10200, 'Default Configuration for 开发', 'Default configuration generated by JIRA', 'customfield_10000', NULL);
INSERT INTO `fieldconfiguration` VALUES (10300, 'Default Configuration for 等级', 'Default configuration generated by JIRA', 'customfield_10100', NULL);
INSERT INTO `fieldconfiguration` VALUES (10301, 'Default Configuration for 史诗链接', 'Default configuration generated by JIRA', 'customfield_10101', NULL);
INSERT INTO `fieldconfiguration` VALUES (10302, 'Default Configuration for Sprint', 'Default configuration generated by JIRA', 'customfield_10105', NULL);
INSERT INTO `fieldconfiguration` VALUES (10303, 'Default Configuration for 史诗名称', 'Default configuration generated by JIRA', 'customfield_10103', NULL);
INSERT INTO `fieldconfiguration` VALUES (10304, 'Default Configuration for Epic状态', 'Default configuration generated by JIRA', 'customfield_10102', NULL);
INSERT INTO `fieldconfiguration` VALUES (10305, 'Default Configuration for Epic颜色', 'Default configuration generated by JIRA', 'customfield_10104', NULL);
INSERT INTO `fieldconfiguration` VALUES (10306, 'Default Configuration for Story Point', 'Default configuration generated by JIRA', 'customfield_10106', NULL);

-- ----------------------------
-- Table structure for fieldlayout
-- ----------------------------
DROP TABLE IF EXISTS `fieldlayout`;
CREATE TABLE `fieldlayout`  (
  `ID` decimal(18, 0) NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `layout_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LAYOUTSCHEME` decimal(18, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fieldlayout
-- ----------------------------
INSERT INTO `fieldlayout` VALUES (10000, 'Default Field Configuration', 'The default field configuration', 'default', NULL);

-- ----------------------------
-- Table structure for fieldlayoutitem
-- ----------------------------
DROP TABLE IF EXISTS `fieldlayoutitem`;
CREATE TABLE `fieldlayoutitem`  (
  `ID` decimal(18, 0) NOT NULL,
  `FIELDLAYOUT` decimal(18, 0) NULL DEFAULT NULL,
  `FIELDIDENTIFIER` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `VERTICALPOSITION` decimal(18, 0) NULL DEFAULT NULL,
  `ISHIDDEN` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ISREQUIRED` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RENDERERTYPE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `idx_fli_fieldidentifier`(`FIELDIDENTIFIER`) USING BTREE,
  INDEX `idx_fli_fieldlayout`(`FIELDLAYOUT`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fieldlayoutitem
-- ----------------------------
INSERT INTO `fieldlayoutitem` VALUES (10120, 10000, 'summary', NULL, NULL, 'false', 'true', 'jira-text-renderer');
INSERT INTO `fieldlayoutitem` VALUES (10121, 10000, 'issuetype', NULL, NULL, 'false', 'true', 'jira-text-renderer');
INSERT INTO `fieldlayoutitem` VALUES (10122, 10000, 'security', NULL, NULL, 'false', 'false', 'jira-text-renderer');
INSERT INTO `fieldlayoutitem` VALUES (10123, 10000, 'priority', NULL, NULL, 'false', 'false', 'jira-text-renderer');
INSERT INTO `fieldlayoutitem` VALUES (10124, 10000, 'duedate', NULL, NULL, 'false', 'false', 'jira-text-renderer');
INSERT INTO `fieldlayoutitem` VALUES (10125, 10000, 'components', NULL, NULL, 'false', 'false', 'frother-control-renderer');
INSERT INTO `fieldlayoutitem` VALUES (10126, 10000, 'versions', NULL, NULL, 'false', 'false', 'frother-control-renderer');
INSERT INTO `fieldlayoutitem` VALUES (10127, 10000, 'fixVersions', NULL, NULL, 'false', 'false', 'frother-control-renderer');
INSERT INTO `fieldlayoutitem` VALUES (10128, 10000, 'assignee', NULL, NULL, 'false', 'false', 'jira-text-renderer');
INSERT INTO `fieldlayoutitem` VALUES (10129, 10000, 'reporter', NULL, NULL, 'false', 'true', 'jira-text-renderer');
INSERT INTO `fieldlayoutitem` VALUES (10130, 10000, 'environment', 'For example operating system, software platform and/or hardware specifications (include as appropriate for the issue).', NULL, 'false', 'false', 'atlassian-wiki-renderer');
INSERT INTO `fieldlayoutitem` VALUES (10131, 10000, 'description', NULL, NULL, 'false', 'false', 'atlassian-wiki-renderer');
INSERT INTO `fieldlayoutitem` VALUES (10132, 10000, 'timetracking', 'An estimate of how much work remains until this issue will be resolved.<br>The format of this is \' *w *d *h *m \' (representing weeks, days, hours and minutes - where * can be any number)<br>Examples: 4d, 5h 30m, 60m and 3w.<br>', NULL, 'false', 'false', 'jira-text-renderer');
INSERT INTO `fieldlayoutitem` VALUES (10133, 10000, 'resolution', NULL, NULL, 'false', 'false', 'jira-text-renderer');
INSERT INTO `fieldlayoutitem` VALUES (10134, 10000, 'attachment', NULL, NULL, 'false', 'false', 'jira-text-renderer');
INSERT INTO `fieldlayoutitem` VALUES (10135, 10000, 'comment', NULL, NULL, 'false', 'false', 'atlassian-wiki-renderer');
INSERT INTO `fieldlayoutitem` VALUES (10136, 10000, 'labels', NULL, NULL, 'false', 'false', 'jira-text-renderer');
INSERT INTO `fieldlayoutitem` VALUES (10137, 10000, 'worklog', 'Allows work to be logged whilst creating, editing or transitioning issues.', NULL, 'false', 'false', 'atlassian-wiki-renderer');
INSERT INTO `fieldlayoutitem` VALUES (10138, 10000, 'issuelinks', NULL, NULL, 'false', 'false', 'jira-text-renderer');
INSERT INTO `fieldlayoutitem` VALUES (10139, 10000, 'customfield_10000', '开发摘要域只用于Jira软件。', NULL, 'false', 'false', 'jira-text-renderer');
INSERT INTO `fieldlayoutitem` VALUES (10140, 10000, 'customfield_10100', '全局评级域仅供 Jira Software 使用。', NULL, 'false', 'false', 'jira-text-renderer');
INSERT INTO `fieldlayoutitem` VALUES (10141, 10000, 'customfield_10101', '选择与此问题关联的Epic。', NULL, 'false', 'false', 'jira-text-renderer');
INSERT INTO `fieldlayoutitem` VALUES (10142, 10000, 'customfield_10102', '仅供 Jira Software 使用的 Epic 状态域。', NULL, 'false', 'false', 'jira-text-renderer');
INSERT INTO `fieldlayoutitem` VALUES (10143, 10000, 'customfield_10103', '用一个简短的名称标识此史诗。', NULL, 'false', 'true', 'jira-text-renderer');

-- ----------------------------
-- Table structure for fieldlayoutscheme
-- ----------------------------
DROP TABLE IF EXISTS `fieldlayoutscheme`;
CREATE TABLE `fieldlayoutscheme`  (
  `ID` decimal(18, 0) NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fieldlayoutschemeassociation
-- ----------------------------
DROP TABLE IF EXISTS `fieldlayoutschemeassociation`;
CREATE TABLE `fieldlayoutschemeassociation`  (
  `ID` decimal(18, 0) NOT NULL,
  `ISSUETYPE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PROJECT` decimal(18, 0) NULL DEFAULT NULL,
  `FIELDLAYOUTSCHEME` decimal(18, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `fl_scheme_assoc`(`PROJECT`, `ISSUETYPE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fieldlayoutschemeentity
-- ----------------------------
DROP TABLE IF EXISTS `fieldlayoutschemeentity`;
CREATE TABLE `fieldlayoutschemeentity`  (
  `ID` decimal(18, 0) NOT NULL,
  `SCHEME` decimal(18, 0) NULL DEFAULT NULL,
  `issuetype` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FIELDLAYOUT` decimal(18, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `fieldlayout_scheme`(`SCHEME`) USING BTREE,
  INDEX `fieldlayout_layout`(`FIELDLAYOUT`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fieldscreen
-- ----------------------------
DROP TABLE IF EXISTS `fieldscreen`;
CREATE TABLE `fieldscreen`  (
  `ID` decimal(18, 0) NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fieldscreen
-- ----------------------------
INSERT INTO `fieldscreen` VALUES (1, 'Default Screen', 'Allows to update all system fields.');
INSERT INTO `fieldscreen` VALUES (2, 'Workflow Screen', 'This screen is used in the workflow and enables you to assign issues');
INSERT INTO `fieldscreen` VALUES (3, 'Resolve Issue Screen', 'Allows to set resolution, change fix versions and assign an issue.');

-- ----------------------------
-- Table structure for fieldscreenlayoutitem
-- ----------------------------
DROP TABLE IF EXISTS `fieldscreenlayoutitem`;
CREATE TABLE `fieldscreenlayoutitem`  (
  `ID` decimal(18, 0) NOT NULL,
  `FIELDIDENTIFIER` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SEQUENCE` decimal(18, 0) NULL DEFAULT NULL,
  `FIELDSCREENTAB` decimal(18, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `fieldscitem_tab`(`FIELDSCREENTAB`) USING BTREE,
  INDEX `fieldscreen_field`(`FIELDIDENTIFIER`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fieldscreenlayoutitem
-- ----------------------------
INSERT INTO `fieldscreenlayoutitem` VALUES (10000, 'summary', 0, 10000);
INSERT INTO `fieldscreenlayoutitem` VALUES (10001, 'issuetype', 1, 10000);
INSERT INTO `fieldscreenlayoutitem` VALUES (10002, 'security', 2, 10000);
INSERT INTO `fieldscreenlayoutitem` VALUES (10003, 'priority', 3, 10000);
INSERT INTO `fieldscreenlayoutitem` VALUES (10004, 'duedate', 4, 10000);
INSERT INTO `fieldscreenlayoutitem` VALUES (10005, 'components', 5, 10000);
INSERT INTO `fieldscreenlayoutitem` VALUES (10006, 'versions', 6, 10000);
INSERT INTO `fieldscreenlayoutitem` VALUES (10007, 'fixVersions', 7, 10000);
INSERT INTO `fieldscreenlayoutitem` VALUES (10008, 'assignee', 8, 10000);
INSERT INTO `fieldscreenlayoutitem` VALUES (10009, 'reporter', 9, 10000);
INSERT INTO `fieldscreenlayoutitem` VALUES (10010, 'environment', 10, 10000);
INSERT INTO `fieldscreenlayoutitem` VALUES (10011, 'description', 11, 10000);
INSERT INTO `fieldscreenlayoutitem` VALUES (10012, 'timetracking', 12, 10000);
INSERT INTO `fieldscreenlayoutitem` VALUES (10013, 'attachment', 13, 10000);
INSERT INTO `fieldscreenlayoutitem` VALUES (10014, 'assignee', 0, 10001);
INSERT INTO `fieldscreenlayoutitem` VALUES (10015, 'resolution', 0, 10002);
INSERT INTO `fieldscreenlayoutitem` VALUES (10016, 'fixVersions', 1, 10002);
INSERT INTO `fieldscreenlayoutitem` VALUES (10017, 'assignee', 2, 10002);
INSERT INTO `fieldscreenlayoutitem` VALUES (10018, 'worklog', 3, 10002);
INSERT INTO `fieldscreenlayoutitem` VALUES (10100, 'labels', 14, 10000);

-- ----------------------------
-- Table structure for fieldscreenscheme
-- ----------------------------
DROP TABLE IF EXISTS `fieldscreenscheme`;
CREATE TABLE `fieldscreenscheme`  (
  `ID` decimal(18, 0) NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fieldscreenscheme
-- ----------------------------
INSERT INTO `fieldscreenscheme` VALUES (1, 'Default Screen Scheme', 'Default Screen Scheme');

-- ----------------------------
-- Table structure for fieldscreenschemeitem
-- ----------------------------
DROP TABLE IF EXISTS `fieldscreenschemeitem`;
CREATE TABLE `fieldscreenschemeitem`  (
  `ID` decimal(18, 0) NOT NULL,
  `OPERATION` decimal(18, 0) NULL DEFAULT NULL,
  `FIELDSCREEN` decimal(18, 0) NULL DEFAULT NULL,
  `FIELDSCREENSCHEME` decimal(18, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `screenitem_scheme`(`FIELDSCREENSCHEME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fieldscreenschemeitem
-- ----------------------------
INSERT INTO `fieldscreenschemeitem` VALUES (10000, NULL, 1, 1);

-- ----------------------------
-- Table structure for fieldscreentab
-- ----------------------------
DROP TABLE IF EXISTS `fieldscreentab`;
CREATE TABLE `fieldscreentab`  (
  `ID` decimal(18, 0) NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SEQUENCE` decimal(18, 0) NULL DEFAULT NULL,
  `FIELDSCREEN` decimal(18, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `fieldscreen_tab`(`FIELDSCREEN`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fieldscreentab
-- ----------------------------
INSERT INTO `fieldscreentab` VALUES (10000, 'Field Tab', NULL, 0, 1);
INSERT INTO `fieldscreentab` VALUES (10001, 'Field Tab', NULL, 0, 2);
INSERT INTO `fieldscreentab` VALUES (10002, 'Field Tab', NULL, 0, 3);

-- ----------------------------
-- Table structure for fileattachment
-- ----------------------------
DROP TABLE IF EXISTS `fileattachment`;
CREATE TABLE `fileattachment`  (
  `ID` decimal(18, 0) NOT NULL,
  `issueid` decimal(18, 0) NULL DEFAULT NULL,
  `MIMETYPE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FILENAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATED` datetime(0) NULL DEFAULT NULL,
  `FILESIZE` decimal(18, 0) NULL DEFAULT NULL,
  `AUTHOR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `zip` decimal(9, 0) NULL DEFAULT NULL,
  `thumbnailable` decimal(9, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `attach_issue`(`issueid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for filtersubscription
-- ----------------------------
DROP TABLE IF EXISTS `filtersubscription`;
CREATE TABLE `filtersubscription`  (
  `ID` decimal(18, 0) NOT NULL,
  `FILTER_I_D` decimal(18, 0) NULL DEFAULT NULL,
  `USERNAME` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `groupname` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LAST_RUN` datetime(0) NULL DEFAULT NULL,
  `EMAIL_ON_EMPTY` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `subscrpt_user`(`FILTER_I_D`, `USERNAME`) USING BTREE,
  INDEX `subscrptn_group`(`FILTER_I_D`, `groupname`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gadgetuserpreference
-- ----------------------------
DROP TABLE IF EXISTS `gadgetuserpreference`;
CREATE TABLE `gadgetuserpreference`  (
  `ID` decimal(18, 0) NOT NULL,
  `PORTLETCONFIGURATION` decimal(18, 0) NULL DEFAULT NULL,
  `USERPREFKEY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `USERPREFVALUE` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `userpref_portletconfiguration`(`PORTLETCONFIGURATION`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gadgetuserpreference
-- ----------------------------
INSERT INTO `gadgetuserpreference` VALUES (10000, 10002, 'isConfigured', 'true');
INSERT INTO `gadgetuserpreference` VALUES (10001, 10003, 'keys', '__all_projects__');
INSERT INTO `gadgetuserpreference` VALUES (10002, 10003, 'isConfigured', 'true');
INSERT INTO `gadgetuserpreference` VALUES (10003, 10003, 'title', 'Your Company Jira');
INSERT INTO `gadgetuserpreference` VALUES (10004, 10003, 'numofentries', '5');

-- ----------------------------
-- Table structure for genericconfiguration
-- ----------------------------
DROP TABLE IF EXISTS `genericconfiguration`;
CREATE TABLE `genericconfiguration`  (
  `ID` decimal(18, 0) NOT NULL,
  `DATATYPE` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DATAKEY` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `XMLVALUE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `type_key`(`DATATYPE`, `DATAKEY`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of genericconfiguration
-- ----------------------------
INSERT INTO `genericconfiguration` VALUES (10000, 'DefaultValue', '10000', '<string>1</string>');
INSERT INTO `genericconfiguration` VALUES (10100, 'DefaultValue', '10304', '<long>10000</long>');

-- ----------------------------
-- Table structure for globalpermissionentry
-- ----------------------------
DROP TABLE IF EXISTS `globalpermissionentry`;
CREATE TABLE `globalpermissionentry`  (
  `ID` decimal(18, 0) NOT NULL,
  `PERMISSION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `GROUP_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of globalpermissionentry
-- ----------------------------
INSERT INTO `globalpermissionentry` VALUES (10000, 'ADMINISTER', 'jira-administrators');
INSERT INTO `globalpermissionentry` VALUES (10006, 'SYSTEM_ADMIN', 'jira-administrators');
INSERT INTO `globalpermissionentry` VALUES (10100, 'CREATE_SHARED_OBJECTS', 'jira-software-users');
INSERT INTO `globalpermissionentry` VALUES (10101, 'MANAGE_GROUP_FILTER_SUBSCRIPTIONS', 'jira-software-users');
INSERT INTO `globalpermissionentry` VALUES (10102, 'USER_PICKER', 'jira-software-users');
INSERT INTO `globalpermissionentry` VALUES (10103, 'BULK_CHANGE', 'jira-software-users');
INSERT INTO `globalpermissionentry` VALUES (10104, 'BULK_CHANGE', 'jira-administrators');
INSERT INTO `globalpermissionentry` VALUES (10105, 'CREATE_SHARED_OBJECTS', 'jira-administrators');
INSERT INTO `globalpermissionentry` VALUES (10106, 'MANAGE_GROUP_FILTER_SUBSCRIPTIONS', 'jira-administrators');
INSERT INTO `globalpermissionentry` VALUES (10107, 'USER_PICKER', 'jira-administrators');

-- ----------------------------
-- Table structure for groupbase
-- ----------------------------
DROP TABLE IF EXISTS `groupbase`;
CREATE TABLE `groupbase`  (
  `ID` decimal(18, 0) NOT NULL,
  `groupname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `osgroup_name`(`groupname`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for issue_field_option
-- ----------------------------
DROP TABLE IF EXISTS `issue_field_option`;
CREATE TABLE `issue_field_option`  (
  `ID` decimal(18, 0) NOT NULL,
  `OPTION_ID` decimal(18, 0) NULL DEFAULT NULL,
  `FIELD_KEY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `option_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PROPERTIES` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for issue_field_option_scope
-- ----------------------------
DROP TABLE IF EXISTS `issue_field_option_scope`;
CREATE TABLE `issue_field_option_scope`  (
  `ID` decimal(18, 0) NOT NULL,
  `OPTION_ID` decimal(18, 0) NULL DEFAULT NULL,
  `ENTITY_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SCOPE_TYPE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for issuelink
-- ----------------------------
DROP TABLE IF EXISTS `issuelink`;
CREATE TABLE `issuelink`  (
  `ID` decimal(18, 0) NOT NULL,
  `LINKTYPE` decimal(18, 0) NULL DEFAULT NULL,
  `SOURCE` decimal(18, 0) NULL DEFAULT NULL,
  `DESTINATION` decimal(18, 0) NULL DEFAULT NULL,
  `SEQUENCE` decimal(18, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `issuelink_src`(`SOURCE`) USING BTREE,
  INDEX `issuelink_dest`(`DESTINATION`) USING BTREE,
  INDEX `issuelink_type`(`LINKTYPE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for issuelinktype
-- ----------------------------
DROP TABLE IF EXISTS `issuelinktype`;
CREATE TABLE `issuelinktype`  (
  `ID` decimal(18, 0) NOT NULL,
  `LINKNAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INWARD` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OUTWARD` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `pstyle` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `linktypename`(`LINKNAME`) USING BTREE,
  INDEX `linktypestyle`(`pstyle`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of issuelinktype
-- ----------------------------
INSERT INTO `issuelinktype` VALUES (10000, 'Blocks', 'is blocked by', 'blocks', NULL);
INSERT INTO `issuelinktype` VALUES (10001, 'Cloners', 'is cloned by', 'clones', NULL);
INSERT INTO `issuelinktype` VALUES (10002, 'Duplicate', 'is duplicated by', 'duplicates', NULL);
INSERT INTO `issuelinktype` VALUES (10003, 'Relates', 'relates to', 'relates to', NULL);
INSERT INTO `issuelinktype` VALUES (10100, 'jira_subtask_link', 'jira_subtask_inward', 'jira_subtask_outward', 'jira_subtask');
INSERT INTO `issuelinktype` VALUES (10200, 'Epic-Story Link', 'has Epic', 'is Epic of', 'jira_gh_epic_story');

-- ----------------------------
-- Table structure for issuesecurityscheme
-- ----------------------------
DROP TABLE IF EXISTS `issuesecurityscheme`;
CREATE TABLE `issuesecurityscheme`  (
  `ID` decimal(18, 0) NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `DEFAULTLEVEL` decimal(18, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for issuestatus
-- ----------------------------
DROP TABLE IF EXISTS `issuestatus`;
CREATE TABLE `issuestatus`  (
  `ID` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SEQUENCE` decimal(18, 0) NULL DEFAULT NULL,
  `pname` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `ICONURL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STATUSCATEGORY` decimal(18, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of issuestatus
-- ----------------------------
INSERT INTO `issuestatus` VALUES ('1', 1, 'Open', 'The issue is open and ready for the assignee to start work on it.', '/images/icons/statuses/open.png', 2);
INSERT INTO `issuestatus` VALUES ('3', 3, 'In Progress', 'This issue is being actively worked on at the moment by the assignee.', '/images/icons/statuses/inprogress.png', 4);
INSERT INTO `issuestatus` VALUES ('4', 4, 'Reopened', 'This issue was once resolved, but the resolution was deemed incorrect. From here issues are either marked assigned or resolved.', '/images/icons/statuses/reopened.png', 2);
INSERT INTO `issuestatus` VALUES ('5', 5, 'Resolved', 'A resolution has been taken, and it is awaiting verification by reporter. From here issues are either reopened, or are closed.', '/images/icons/statuses/resolved.png', 3);
INSERT INTO `issuestatus` VALUES ('6', 6, 'Closed', 'The issue is considered finished, the resolution is correct. Issues which are closed can be reopened.', '/images/icons/statuses/closed.png', 3);

-- ----------------------------
-- Table structure for issuetype
-- ----------------------------
DROP TABLE IF EXISTS `issuetype`;
CREATE TABLE `issuetype`  (
  `ID` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SEQUENCE` decimal(18, 0) NULL DEFAULT NULL,
  `pname` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `pstyle` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `ICONURL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AVATAR` decimal(18, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of issuetype
-- ----------------------------
INSERT INTO `issuetype` VALUES ('10000', NULL, 'Epic', NULL, '由 Jira Software 创建——请勿编辑或删除。适用于大型用户故事的事务类型，需对其加以细分。', '/images/icons/issuetypes/epic.svg', NULL);
INSERT INTO `issuetype` VALUES ('10001', NULL, '故事', NULL, '由 Jira Software 创建——请勿编辑或删除。适用于一种用户故事的事务类型。', '/images/icons/issuetypes/story.svg', NULL);

-- ----------------------------
-- Table structure for issuetypescreenscheme
-- ----------------------------
DROP TABLE IF EXISTS `issuetypescreenscheme`;
CREATE TABLE `issuetypescreenscheme`  (
  `ID` decimal(18, 0) NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of issuetypescreenscheme
-- ----------------------------
INSERT INTO `issuetypescreenscheme` VALUES (1, 'Default Issue Type Screen Scheme', 'The default issue type screen scheme');

-- ----------------------------
-- Table structure for issuetypescreenschemeentity
-- ----------------------------
DROP TABLE IF EXISTS `issuetypescreenschemeentity`;
CREATE TABLE `issuetypescreenschemeentity`  (
  `ID` decimal(18, 0) NOT NULL,
  `ISSUETYPE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SCHEME` decimal(18, 0) NULL DEFAULT NULL,
  `FIELDSCREENSCHEME` decimal(18, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `fieldscreen_scheme`(`FIELDSCREENSCHEME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of issuetypescreenschemeentity
-- ----------------------------
INSERT INTO `issuetypescreenschemeentity` VALUES (10000, NULL, 1, 1);

-- ----------------------------
-- Table structure for jiraaction
-- ----------------------------
DROP TABLE IF EXISTS `jiraaction`;
CREATE TABLE `jiraaction`  (
  `ID` decimal(18, 0) NOT NULL,
  `issueid` decimal(18, 0) NULL DEFAULT NULL,
  `AUTHOR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `actiontype` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `actionlevel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `rolelevel` decimal(18, 0) NULL DEFAULT NULL,
  `actionbody` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `CREATED` datetime(0) NULL DEFAULT NULL,
  `UPDATEAUTHOR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UPDATED` datetime(0) NULL DEFAULT NULL,
  `actionnum` decimal(18, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `action_author_created`(`AUTHOR`, `CREATED`) USING BTREE,
  INDEX `action_issue`(`issueid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jiradraftworkflows
-- ----------------------------
DROP TABLE IF EXISTS `jiradraftworkflows`;
CREATE TABLE `jiradraftworkflows`  (
  `ID` decimal(18, 0) NOT NULL,
  `PARENTNAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DESCRIPTOR` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jiraeventtype
-- ----------------------------
DROP TABLE IF EXISTS `jiraeventtype`;
CREATE TABLE `jiraeventtype`  (
  `ID` decimal(18, 0) NOT NULL,
  `TEMPLATE_ID` decimal(18, 0) NULL DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `event_type` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jiraeventtype
-- ----------------------------
INSERT INTO `jiraeventtype` VALUES (1, NULL, 'Issue Created', 'This is the \'issue created\' event.', 'jira.system.event.type');
INSERT INTO `jiraeventtype` VALUES (2, NULL, 'Issue Updated', 'This is the \'issue updated\' event.', 'jira.system.event.type');
INSERT INTO `jiraeventtype` VALUES (3, NULL, 'Issue Assigned', 'This is the \'issue assigned\' event.', 'jira.system.event.type');
INSERT INTO `jiraeventtype` VALUES (4, NULL, 'Issue Resolved', 'This is the \'issue resolved\' event.', 'jira.system.event.type');
INSERT INTO `jiraeventtype` VALUES (5, NULL, 'Issue Closed', 'This is the \'issue closed\' event.', 'jira.system.event.type');
INSERT INTO `jiraeventtype` VALUES (6, NULL, 'Issue Commented', 'This is the \'issue commented\' event.', 'jira.system.event.type');
INSERT INTO `jiraeventtype` VALUES (7, NULL, 'Issue Reopened', 'This is the \'issue reopened\' event.', 'jira.system.event.type');
INSERT INTO `jiraeventtype` VALUES (8, NULL, 'Issue Deleted', 'This is the \'issue deleted\' event.', 'jira.system.event.type');
INSERT INTO `jiraeventtype` VALUES (9, NULL, 'Issue Moved', 'This is the \'issue moved\' event.', 'jira.system.event.type');
INSERT INTO `jiraeventtype` VALUES (10, NULL, 'Work Logged On Issue', 'This is the \'work logged on issue\' event.', 'jira.system.event.type');
INSERT INTO `jiraeventtype` VALUES (11, NULL, 'Work Started On Issue', 'This is the \'work started on issue\' event.', 'jira.system.event.type');
INSERT INTO `jiraeventtype` VALUES (12, NULL, 'Work Stopped On Issue', 'This is the \'work stopped on issue\' event.', 'jira.system.event.type');
INSERT INTO `jiraeventtype` VALUES (13, NULL, 'Generic Event', 'This is the \'generic event\' event.', 'jira.system.event.type');
INSERT INTO `jiraeventtype` VALUES (14, NULL, 'Issue Comment Edited', 'This is the \'issue comment edited\' event.', 'jira.system.event.type');
INSERT INTO `jiraeventtype` VALUES (15, NULL, 'Issue Worklog Updated', 'This is the \'issue worklog updated\' event.', 'jira.system.event.type');
INSERT INTO `jiraeventtype` VALUES (16, NULL, 'Issue Worklog Deleted', 'This is the \'issue worklog deleted\' event.', 'jira.system.event.type');
INSERT INTO `jiraeventtype` VALUES (17, NULL, 'Issue Comment Deleted', 'This is the \'issue comment deleted\' event.', 'jira.system.event.type');

-- ----------------------------
-- Table structure for jiraissue
-- ----------------------------
DROP TABLE IF EXISTS `jiraissue`;
CREATE TABLE `jiraissue`  (
  `ID` decimal(18, 0) NOT NULL,
  `pkey` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `issuenum` decimal(18, 0) NULL DEFAULT NULL,
  `PROJECT` decimal(18, 0) NULL DEFAULT NULL,
  `REPORTER` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ASSIGNEE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATOR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `issuetype` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SUMMARY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `ENVIRONMENT` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `PRIORITY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RESOLUTION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `issuestatus` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATED` datetime(0) NULL DEFAULT NULL,
  `UPDATED` datetime(0) NULL DEFAULT NULL,
  `DUEDATE` datetime(0) NULL DEFAULT NULL,
  `RESOLUTIONDATE` datetime(0) NULL DEFAULT NULL,
  `VOTES` decimal(18, 0) NULL DEFAULT NULL,
  `WATCHES` decimal(18, 0) NULL DEFAULT NULL,
  `TIMEORIGINALESTIMATE` decimal(18, 0) NULL DEFAULT NULL,
  `TIMEESTIMATE` decimal(18, 0) NULL DEFAULT NULL,
  `TIMESPENT` decimal(18, 0) NULL DEFAULT NULL,
  `WORKFLOW_ID` decimal(18, 0) NULL DEFAULT NULL,
  `SECURITY` decimal(18, 0) NULL DEFAULT NULL,
  `FIXFOR` decimal(18, 0) NULL DEFAULT NULL,
  `COMPONENT` decimal(18, 0) NULL DEFAULT NULL,
  `ARCHIVED` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `issue_proj_num`(`issuenum`, `PROJECT`) USING BTREE,
  INDEX `issue_proj_status`(`PROJECT`, `issuestatus`) USING BTREE,
  INDEX `issue_created`(`CREATED`) USING BTREE,
  INDEX `issue_updated`(`UPDATED`) USING BTREE,
  INDEX `issue_duedate`(`DUEDATE`) USING BTREE,
  INDEX `issue_resolutiondate`(`RESOLUTIONDATE`) USING BTREE,
  INDEX `issue_assignee`(`ASSIGNEE`) USING BTREE,
  INDEX `issue_reporter`(`REPORTER`) USING BTREE,
  INDEX `issue_workflow`(`WORKFLOW_ID`) USING BTREE,
  INDEX `issue_votes`(`VOTES`) USING BTREE,
  INDEX `issue_watches`(`WATCHES`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jiraperms
-- ----------------------------
DROP TABLE IF EXISTS `jiraperms`;
CREATE TABLE `jiraperms`  (
  `ID` decimal(18, 0) NOT NULL,
  `permtype` decimal(18, 0) NULL DEFAULT NULL,
  `projectid` decimal(18, 0) NULL DEFAULT NULL,
  `groupname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jiraworkflows
-- ----------------------------
DROP TABLE IF EXISTS `jiraworkflows`;
CREATE TABLE `jiraworkflows`  (
  `ID` decimal(18, 0) NOT NULL,
  `workflowname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `creatorname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DESCRIPTOR` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `ISLOCKED` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jiraworkflows
-- ----------------------------
INSERT INTO `jiraworkflows` VALUES (10000, 'classic default workflow', NULL, '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!DOCTYPE workflow PUBLIC \"-//OpenSymphony Group//DTD OSWorkflow 2.8//EN\" \"http://www.opensymphony.com/osworkflow/workflow_2_8.dtd\">\n<workflow>\n  <meta name=\"jira.description\">The classic Jira default workflow</meta>\n  <initial-actions>\n    <action id=\"1\" name=\"Create Issue\">\n      <meta name=\"opsbar-sequence\">0</meta>\n      <meta name=\"jira.i18n.title\">common.forms.create</meta>\n      <validators>\n        <validator name=\"\" type=\"class\">\n          <arg name=\"class.name\">com.atlassian.jira.workflow.validator.PermissionValidator</arg>\n          <arg name=\"permission\">Create Issue</arg>\n        </validator>\n      </validators>\n      <results>\n        <unconditional-result old-status=\"Finished\" status=\"Open\" step=\"1\">\n          <post-functions>\n            <function type=\"class\">\n              <arg name=\"class.name\">com.atlassian.jira.workflow.function.issue.IssueCreateFunction</arg>\n            </function>\n            <function type=\"class\">\n              <arg name=\"class.name\">com.atlassian.jira.workflow.function.event.FireIssueEventFunction</arg>\n              <arg name=\"eventTypeId\">1</arg>\n            </function>\n          </post-functions>\n        </unconditional-result>\n      </results>\n    </action>\n  </initial-actions>\n  <common-actions>\n    <action id=\"2\" name=\"Close Issue\" view=\"resolveissue\">\n      <meta name=\"opsbar-sequence\">60</meta>\n      <meta name=\"jira.i18n.submit\">closeissue.close</meta>\n      <meta name=\"jira.i18n.description\">closeissue.desc</meta>\n      <meta name=\"jira.i18n.title\">closeissue.title</meta>\n      <restrict-to>\n        <conditions type=\"AND\">\n          <condition type=\"class\">\n            <arg name=\"class.name\">com.atlassian.jira.workflow.condition.PermissionCondition</arg>\n            <arg name=\"permission\">Resolve Issue</arg>\n          </condition>\n          <condition type=\"class\">\n            <arg name=\"class.name\">com.atlassian.jira.workflow.condition.PermissionCondition</arg>\n            <arg name=\"permission\">Close Issue</arg>\n          </condition>\n        </conditions>\n      </restrict-to>\n      <results>\n        <unconditional-result old-status=\"Finished\" status=\"Closed\" step=\"6\">\n          <post-functions>\n            <function type=\"class\">\n              <arg name=\"class.name\">com.atlassian.jira.workflow.function.issue.UpdateIssueStatusFunction</arg>\n            </function>\n            <function type=\"class\">\n              <arg name=\"class.name\">com.atlassian.jira.workflow.function.misc.CreateCommentFunction</arg>\n            </function>\n            <function type=\"class\">\n              <arg name=\"class.name\">com.atlassian.jira.workflow.function.issue.GenerateChangeHistoryFunction</arg>\n            </function>\n            <function type=\"class\">\n              <arg name=\"class.name\">com.atlassian.jira.workflow.function.issue.IssueReindexFunction</arg>\n            </function>\n            <function type=\"class\">\n              <arg name=\"class.name\">com.atlassian.jira.workflow.function.event.FireIssueEventFunction</arg>\n              <arg name=\"eventTypeId\">5</arg>\n            </function>\n          </post-functions>\n        </unconditional-result>\n      </results>\n    </action>\n    <action id=\"3\" name=\"Reopen Issue\" view=\"commentassign\">\n      <meta name=\"opsbar-sequence\">80</meta>\n      <meta name=\"jira.i18n.submit\">issue.operations.reopen.issue</meta>\n      <meta name=\"jira.i18n.description\">issue.operations.reopen.description</meta>\n      <meta name=\"jira.i18n.title\">issue.operations.reopen.issue</meta>\n      <restrict-to>\n        <conditions>\n          <condition type=\"class\">\n            <arg name=\"class.name\">com.atlassian.jira.workflow.condition.PermissionCondition</arg>\n            <arg name=\"permission\">Resolve Issue</arg>\n          </condition>\n        </conditions>\n      </restrict-to>\n      <results>\n        <unconditional-result old-status=\"Finished\" status=\"Reopened\" step=\"5\">\n          <post-functions>\n            <function type=\"class\">\n              <arg name=\"class.name\">com.atlassian.jira.workflow.function.issue.UpdateIssueFieldFunction</arg>\n              <arg name=\"field.value\"></arg>\n              <arg name=\"field.name\">resolution</arg>\n            </function>\n            <function type=\"class\">\n              <arg name=\"class.name\">com.atlassian.jira.workflow.function.issue.UpdateIssueStatusFunction</arg>\n            </function>\n            <function type=\"class\">\n              <arg name=\"class.name\">com.atlassian.jira.workflow.function.misc.CreateCommentFunction</arg>\n            </function>\n            <function type=\"class\">\n              <arg name=\"class.name\">com.atlassian.jira.workflow.function.issue.GenerateChangeHistoryFunction</arg>\n            </function>\n            <function type=\"class\">\n              <arg name=\"class.name\">com.atlassian.jira.workflow.function.issue.IssueReindexFunction</arg>\n            </function>\n            <function type=\"class\">\n              <arg name=\"class.name\">com.atlassian.jira.workflow.function.event.FireIssueEventFunction</arg>\n              <arg name=\"eventTypeId\">7</arg>\n            </function>\n          </post-functions>\n        </unconditional-result>\n      </results>\n    </action>\n    <action id=\"4\" name=\"Start Progress\">\n      <meta name=\"opsbar-sequence\">20</meta>\n      <meta name=\"jira.i18n.title\">startprogress.title</meta>\n      <restrict-to>\n        <conditions>\n          <condition type=\"class\">\n            <arg name=\"class.name\">com.atlassian.jira.workflow.condition.AllowOnlyAssignee</arg>\n          </condition>\n        </conditions>\n      </restrict-to>\n      <results>\n        <unconditional-result old-status=\"Finished\" status=\"Underway\" step=\"3\">\n          <post-functions>\n            <function type=\"class\">\n              <arg name=\"class.name\">com.atlassian.jira.workflow.function.issue.UpdateIssueFieldFunction</arg>\n              <arg name=\"field.value\"></arg>\n              <arg name=\"field.name\">resolution</arg>\n            </function>\n            <function type=\"class\">\n              <arg name=\"class.name\">com.atlassian.jira.workflow.function.issue.UpdateIssueStatusFunction</arg>\n            </function>\n            <function type=\"class\">\n              <arg name=\"class.name\">com.atlassian.jira.workflow.function.misc.CreateCommentFunction</arg>\n            </function>\n            <function type=\"class\">\n              <arg name=\"class.name\">com.atlassian.jira.workflow.function.issue.GenerateChangeHistoryFunction</arg>\n            </function>\n            <function type=\"class\">\n              <arg name=\"class.name\">com.atlassian.jira.workflow.function.issue.IssueReindexFunction</arg>\n            </function>\n            <function type=\"class\">\n              <arg name=\"class.name\">com.atlassian.jira.workflow.function.event.FireIssueEventFunction</arg>\n              <arg name=\"eventTypeId\">11</arg>\n            </function>\n          </post-functions>\n        </unconditional-result>\n      </results>\n    </action>\n    <action id=\"5\" name=\"Resolve Issue\" view=\"resolveissue\">\n      <meta name=\"opsbar-sequence\">40</meta>\n      <meta name=\"jira.i18n.submit\">resolveissue.resolve</meta>\n      <meta name=\"jira.i18n.description\">resolveissue.desc.line1</meta>\n      <meta name=\"jira.i18n.title\">resolveissue.title</meta>\n      <restrict-to>\n        <conditions>\n          <condition type=\"class\">\n            <arg name=\"class.name\">com.atlassian.jira.workflow.condition.PermissionCondition</arg>\n            <arg name=\"permission\">Resolve Issue</arg>\n          </condition>\n        </conditions>\n      </restrict-to>\n      <results>\n        <unconditional-result old-status=\"Finished\" status=\"Resolved\" step=\"4\">\n          <post-functions>\n            <function type=\"class\">\n              <arg name=\"class.name\">com.atlassian.jira.workflow.function.issue.UpdateIssueStatusFunction</arg>\n            </function>\n            <function type=\"class\">\n              <arg name=\"class.name\">com.atlassian.jira.workflow.function.misc.CreateCommentFunction</arg>\n            </function>\n            <function type=\"class\">\n              <arg name=\"class.name\">com.atlassian.jira.workflow.function.issue.GenerateChangeHistoryFunction</arg>\n            </function>\n            <function type=\"class\">\n              <arg name=\"class.name\">com.atlassian.jira.workflow.function.issue.IssueReindexFunction</arg>\n            </function>\n            <function type=\"class\">\n              <arg name=\"class.name\">com.atlassian.jira.workflow.function.event.FireIssueEventFunction</arg>\n              <arg name=\"eventTypeId\">4</arg>\n            </function>\n          </post-functions>\n        </unconditional-result>\n      </results>\n    </action>\n  </common-actions>\n  <steps>\n    <step id=\"1\" name=\"Open\">\n      <meta name=\"jira.status.id\">1</meta>\n      <actions>\n<common-action id=\"4\" />\n<common-action id=\"5\" />\n<common-action id=\"2\" />\n      </actions>\n    </step>\n    <step id=\"3\" name=\"In Progress\">\n      <meta name=\"jira.status.id\">3</meta>\n      <actions>\n<common-action id=\"5\" />\n<common-action id=\"2\" />\n        <action id=\"301\" name=\"Stop Progress\">\n          <meta name=\"opsbar-sequence\">20</meta>\n          <meta name=\"jira.i18n.title\">stopprogress.title</meta>\n          <restrict-to>\n            <conditions>\n              <condition type=\"class\">\n                <arg name=\"class.name\">com.atlassian.jira.workflow.condition.AllowOnlyAssignee</arg>\n              </condition>\n            </conditions>\n          </restrict-to>\n          <results>\n            <unconditional-result old-status=\"Finished\" status=\"Assigned\" step=\"1\">\n              <post-functions>\n                <function type=\"class\">\n                  <arg name=\"class.name\">com.atlassian.jira.workflow.function.issue.UpdateIssueFieldFunction</arg>\n                  <arg name=\"field.value\"></arg>\n                  <arg name=\"field.name\">resolution</arg>\n                </function>\n                <function type=\"class\">\n                  <arg name=\"class.name\">com.atlassian.jira.workflow.function.issue.UpdateIssueStatusFunction</arg>\n                </function>\n                <function type=\"class\">\n                  <arg name=\"class.name\">com.atlassian.jira.workflow.function.misc.CreateCommentFunction</arg>\n                </function>\n                <function type=\"class\">\n                  <arg name=\"class.name\">com.atlassian.jira.workflow.function.issue.GenerateChangeHistoryFunction</arg>\n                </function>\n                <function type=\"class\">\n                  <arg name=\"class.name\">com.atlassian.jira.workflow.function.issue.IssueReindexFunction</arg>\n                </function>\n                <function type=\"class\">\n                  <arg name=\"class.name\">com.atlassian.jira.workflow.function.event.FireIssueEventFunction</arg>\n                  <arg name=\"eventTypeId\">12</arg>\n                </function>\n              </post-functions>\n            </unconditional-result>\n          </results>\n        </action>\n      </actions>\n    </step>\n    <step id=\"4\" name=\"Resolved\">\n      <meta name=\"jira.status.id\">5</meta>\n      <actions>\n<common-action id=\"3\" />\n        <action id=\"701\" name=\"Close Issue\" view=\"commentassign\">\n          <meta name=\"opsbar-sequence\">60</meta>\n          <meta name=\"jira.i18n.submit\">closeissue.close</meta>\n          <meta name=\"jira.i18n.description\">closeissue.desc</meta>\n          <meta name=\"jira.i18n.title\">closeissue.title</meta>\n          <meta name=\"jira.description\">Closing an issue indicates there is no more work to be done on it, and it has been verified as complete.</meta>\n          <restrict-to>\n            <conditions>\n              <condition type=\"class\">\n                <arg name=\"class.name\">com.atlassian.jira.workflow.condition.PermissionCondition</arg>\n                <arg name=\"permission\">Close Issue</arg>\n              </condition>\n            </conditions>\n          </restrict-to>\n          <results>\n            <unconditional-result old-status=\"Finished\" status=\"Closed\" step=\"6\">\n              <post-functions>\n                <function type=\"class\">\n                  <arg name=\"class.name\">com.atlassian.jira.workflow.function.issue.UpdateIssueStatusFunction</arg>\n                </function>\n                <function type=\"class\">\n                  <arg name=\"class.name\">com.atlassian.jira.workflow.function.misc.CreateCommentFunction</arg>\n                </function>\n                <function type=\"class\">\n                  <arg name=\"class.name\">com.atlassian.jira.workflow.function.issue.GenerateChangeHistoryFunction</arg>\n                </function>\n                <function type=\"class\">\n                  <arg name=\"class.name\">com.atlassian.jira.workflow.function.issue.IssueReindexFunction</arg>\n                </function>\n                <function type=\"class\">\n                  <arg name=\"class.name\">com.atlassian.jira.workflow.function.event.FireIssueEventFunction</arg>\n                  <arg name=\"eventTypeId\">5</arg>\n                </function>\n              </post-functions>\n            </unconditional-result>\n          </results>\n        </action>\n      </actions>\n    </step>\n    <step id=\"5\" name=\"Reopened\">\n      <meta name=\"jira.status.id\">4</meta>\n      <actions>\n<common-action id=\"5\" />\n<common-action id=\"2\" />\n<common-action id=\"4\" />\n      </actions>\n    </step>\n    <step id=\"6\" name=\"Closed\">\n      <meta name=\"jira.status.id\">6</meta>\n      <meta name=\"jira.issue.editable\">false</meta>\n      <actions>\n<common-action id=\"3\" />\n      </actions>\n    </step>\n  </steps>\n</workflow>\n', NULL);

-- ----------------------------
-- Table structure for jiraworkflowstatuses
-- ----------------------------
DROP TABLE IF EXISTS `jiraworkflowstatuses`;
CREATE TABLE `jiraworkflowstatuses`  (
  `ID` decimal(18, 0) NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `parentname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `idx_parent_name`(`parentname`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jquartz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `jquartz_blob_triggers`;
CREATE TABLE `jquartz_blob_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `BLOB_DATA` blob NULL,
  PRIMARY KEY (`TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jquartz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `jquartz_calendars`;
CREATE TABLE `jquartz_calendars`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CALENDAR` blob NULL,
  PRIMARY KEY (`CALENDAR_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jquartz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `jquartz_cron_triggers`;
CREATE TABLE `jquartz_cron_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CRON_EXPRESSION` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TIME_ZONE_ID` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jquartz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `jquartz_fired_triggers`;
CREATE TABLE `jquartz_fired_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ENTRY_ID` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IS_VOLATILE` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FIRED_TIME` bigint(20) NULL DEFAULT NULL,
  `SCHED_TIME` bigint(20) NULL DEFAULT NULL,
  `PRIORITY` int(11) NULL DEFAULT NULL,
  `STATE` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IS_STATEFUL` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IS_UPDATE_DATA` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ENTRY_ID`) USING BTREE,
  INDEX `idx_qrtz_ft_trig_inst_name`(`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE,
  INDEX `idx_qrtz_ft_inst_job_req_rcvry`(`SCHED_NAME`, `INSTANCE_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `idx_qrtz_ft_j_g`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `idx_qrtz_ft_jg`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `idx_qrtz_ft_t_g`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `idx_qrtz_ft_tg`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jquartz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `jquartz_job_details`;
CREATE TABLE `jquartz_job_details`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IS_DURABLE` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IS_VOLATILE` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IS_STATEFUL` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IS_UPDATE_DATA` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `idx_qrtz_j_req_recovery`(`SCHED_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `idx_qrtz_j_grp`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jquartz_job_listeners
-- ----------------------------
DROP TABLE IF EXISTS `jquartz_job_listeners`;
CREATE TABLE `jquartz_job_listeners`  (
  `JOB_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `JOB_LISTENER` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`JOB_NAME`, `JOB_GROUP`, `JOB_LISTENER`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jquartz_locks
-- ----------------------------
DROP TABLE IF EXISTS `jquartz_locks`;
CREATE TABLE `jquartz_locks`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LOCK_NAME` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`LOCK_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jquartz_locks
-- ----------------------------
INSERT INTO `jquartz_locks` VALUES (NULL, 'CALENDAR_ACCESS');
INSERT INTO `jquartz_locks` VALUES (NULL, 'JOB_ACCESS');
INSERT INTO `jquartz_locks` VALUES (NULL, 'MISFIRE_ACCESS');
INSERT INTO `jquartz_locks` VALUES (NULL, 'STATE_ACCESS');
INSERT INTO `jquartz_locks` VALUES (NULL, 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for jquartz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `jquartz_paused_trigger_grps`;
CREATE TABLE `jquartz_paused_trigger_grps`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jquartz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `jquartz_scheduler_state`;
CREATE TABLE `jquartz_scheduler_state`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `LAST_CHECKIN_TIME` bigint(20) NULL DEFAULT NULL,
  `CHECKIN_INTERVAL` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`INSTANCE_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jquartz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `jquartz_simple_triggers`;
CREATE TABLE `jquartz_simple_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `REPEAT_COUNT` bigint(20) NULL DEFAULT NULL,
  `REPEAT_INTERVAL` bigint(20) NULL DEFAULT NULL,
  `TIMES_TRIGGERED` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jquartz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `jquartz_simprop_triggers`;
CREATE TABLE `jquartz_simprop_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `STR_PROP_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STR_PROP_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STR_PROP_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INT_PROP_1` int(11) NULL DEFAULT NULL,
  `INT_PROP_2` int(11) NULL DEFAULT NULL,
  `LONG_PROP_1` bigint(20) NULL DEFAULT NULL,
  `LONG_PROP_2` bigint(20) NULL DEFAULT NULL,
  `DEC_PROP_1` decimal(13, 4) NULL DEFAULT NULL,
  `DEC_PROP_2` decimal(13, 4) NULL DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jquartz_trigger_listeners
-- ----------------------------
DROP TABLE IF EXISTS `jquartz_trigger_listeners`;
CREATE TABLE `jquartz_trigger_listeners`  (
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_LISTENER` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`TRIGGER_GROUP`, `TRIGGER_LISTENER`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jquartz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `jquartz_triggers`;
CREATE TABLE `jquartz_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IS_VOLATILE` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(20) NULL DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(20) NULL DEFAULT NULL,
  `PRIORITY` int(11) NULL DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TRIGGER_TYPE` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `START_TIME` bigint(20) NULL DEFAULT NULL,
  `END_TIME` bigint(20) NULL DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MISFIRE_INSTR` smallint(5) NULL DEFAULT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `idx_qrtz_t_j`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `idx_qrtz_t_jg`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `idx_qrtz_t_c`(`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE,
  INDEX `idx_qrtz_j_g`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `idx_qrtz_j_state`(`SCHED_NAME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `idx_qrtz_t_n_state`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `idx_qrtz_t_n_g_state`(`SCHED_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `idx_qrtz_t_next_fire_time`(`SCHED_NAME`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `idx_qrtz_t_nft_st`(`SCHED_NAME`, `TRIGGER_STATE`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `idx_qrtz_t_nft_misfire`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `idx_qrtz_t_nft_st_misfire`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `idx_qrtz_t_nft_st_misfire_grp`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for label
-- ----------------------------
DROP TABLE IF EXISTS `label`;
CREATE TABLE `label`  (
  `ID` decimal(18, 0) NOT NULL,
  `FIELDID` decimal(18, 0) NULL DEFAULT NULL,
  `ISSUE` decimal(18, 0) NULL DEFAULT NULL,
  `LABEL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `label_fieldissue`(`ISSUE`, `FIELDID`) USING BTREE,
  INDEX `label_fieldissuelabel`(`ISSUE`, `FIELDID`, `LABEL`) USING BTREE,
  INDEX `label_label`(`LABEL`) USING BTREE,
  INDEX `label_issue`(`ISSUE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for licenserolesdefault
-- ----------------------------
DROP TABLE IF EXISTS `licenserolesdefault`;
CREATE TABLE `licenserolesdefault`  (
  `ID` decimal(18, 0) NOT NULL,
  `LICENSE_ROLE_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `licenseroledefault_index`(`LICENSE_ROLE_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of licenserolesdefault
-- ----------------------------
INSERT INTO `licenserolesdefault` VALUES (10000, 'jira-software');

-- ----------------------------
-- Table structure for licenserolesgroup
-- ----------------------------
DROP TABLE IF EXISTS `licenserolesgroup`;
CREATE TABLE `licenserolesgroup`  (
  `ID` decimal(18, 0) NOT NULL,
  `LICENSE_ROLE_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `GROUP_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PRIMARY_GROUP` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `licenserolegroup_index`(`LICENSE_ROLE_NAME`, `GROUP_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of licenserolesgroup
-- ----------------------------
INSERT INTO `licenserolesgroup` VALUES (10000, 'jira-software', 'jira-software-users', 'Y');
INSERT INTO `licenserolesgroup` VALUES (10001, 'jira-software', 'jira-administrators', 'N');

-- ----------------------------
-- Table structure for listenerconfig
-- ----------------------------
DROP TABLE IF EXISTS `listenerconfig`;
CREATE TABLE `listenerconfig`  (
  `ID` decimal(18, 0) NOT NULL,
  `CLAZZ` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `listenername` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of listenerconfig
-- ----------------------------
INSERT INTO `listenerconfig` VALUES (10000, 'com.atlassian.jira.event.listeners.mail.MailListener', 'Mail Listener');
INSERT INTO `listenerconfig` VALUES (10001, 'com.atlassian.jira.event.listeners.history.IssueAssignHistoryListener', 'Issue Assignment Listener');
INSERT INTO `listenerconfig` VALUES (10201, 'com.atlassian.jira.event.listeners.search.IssueIndexListener', 'Issue Index Listener');

-- ----------------------------
-- Table structure for mailserver
-- ----------------------------
DROP TABLE IF EXISTS `mailserver`;
CREATE TABLE `mailserver`  (
  `ID` decimal(18, 0) NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `mailfrom` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PREFIX` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `smtp_port` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `protocol` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `server_type` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SERVERNAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `JNDILOCATION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `mailusername` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `mailpassword` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ISTLSREQUIRED` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TIMEOUT` decimal(18, 0) NULL DEFAULT NULL,
  `socks_port` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `socks_host` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for managedconfigurationitem
-- ----------------------------
DROP TABLE IF EXISTS `managedconfigurationitem`;
CREATE TABLE `managedconfigurationitem`  (
  `ID` decimal(18, 0) NOT NULL,
  `ITEM_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ITEM_TYPE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MANAGED` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ACCESS_LEVEL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SOURCE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DESCRIPTION_KEY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `managedconfigitem_id_type_idx`(`ITEM_ID`, `ITEM_TYPE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of managedconfigurationitem
-- ----------------------------
INSERT INTO `managedconfigurationitem` VALUES (10000, 'customfield_10000', 'CUSTOM_FIELD', 'true', 'LOCKED', 'com.atlassian.jira.plugins.jira-development-integration-plugin:reserved-field-locked', 'devstatus.customfield.locked.desc');
INSERT INTO `managedconfigurationitem` VALUES (10100, 'customfield_10100', 'CUSTOM_FIELD', 'true', 'LOCKED', 'com.pyxis.greenhopper.jira:reference-select-locked', 'gh.customfield.locked.desc');
INSERT INTO `managedconfigurationitem` VALUES (10101, 'customfield_10101', 'CUSTOM_FIELD', 'true', 'LOCKED', 'com.pyxis.greenhopper.jira:reference-select-locked', 'gh.customfield.locked.desc');
INSERT INTO `managedconfigurationitem` VALUES (10102, 'customfield_10102', 'CUSTOM_FIELD', 'true', 'LOCKED', 'com.pyxis.greenhopper.jira:reference-select-locked', 'gh.customfield.locked.desc');
INSERT INTO `managedconfigurationitem` VALUES (10103, 'customfield_10103', 'CUSTOM_FIELD', 'true', 'LOCKED', 'com.pyxis.greenhopper.jira:reference-select-locked', 'gh.customfield.locked.desc');
INSERT INTO `managedconfigurationitem` VALUES (10104, 'customfield_10104', 'CUSTOM_FIELD', 'true', 'LOCKED', 'com.pyxis.greenhopper.jira:reference-select-locked', 'gh.customfield.locked.desc');
INSERT INTO `managedconfigurationitem` VALUES (10105, 'customfield_10105', 'CUSTOM_FIELD', 'true', 'LOCKED', 'com.pyxis.greenhopper.jira:reference-select-locked', 'gh.customfield.locked.desc');

-- ----------------------------
-- Table structure for membershipbase
-- ----------------------------
DROP TABLE IF EXISTS `membershipbase`;
CREATE TABLE `membershipbase`  (
  `ID` decimal(18, 0) NOT NULL,
  `USER_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `GROUP_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `mshipbase_user`(`USER_NAME`) USING BTREE,
  INDEX `mshipbase_group`(`GROUP_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for moved_issue_key
-- ----------------------------
DROP TABLE IF EXISTS `moved_issue_key`;
CREATE TABLE `moved_issue_key`  (
  `ID` decimal(18, 0) NOT NULL,
  `OLD_ISSUE_KEY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ISSUE_ID` decimal(18, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `idx_old_issue_key`(`OLD_ISSUE_KEY`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for nodeassociation
-- ----------------------------
DROP TABLE IF EXISTS `nodeassociation`;
CREATE TABLE `nodeassociation`  (
  `SOURCE_NODE_ID` decimal(18, 0) NOT NULL,
  `SOURCE_NODE_ENTITY` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SINK_NODE_ID` decimal(18, 0) NOT NULL,
  `SINK_NODE_ENTITY` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ASSOCIATION_TYPE` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SEQUENCE` decimal(9, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`SOURCE_NODE_ID`, `SOURCE_NODE_ENTITY`, `SINK_NODE_ID`, `SINK_NODE_ENTITY`, `ASSOCIATION_TYPE`) USING BTREE,
  INDEX `node_source`(`SOURCE_NODE_ID`, `SOURCE_NODE_ENTITY`) USING BTREE,
  INDEX `node_sink`(`SINK_NODE_ID`, `SINK_NODE_ENTITY`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for nodeindexcounter
-- ----------------------------
DROP TABLE IF EXISTS `nodeindexcounter`;
CREATE TABLE `nodeindexcounter`  (
  `ID` decimal(18, 0) NOT NULL,
  `NODE_ID` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SENDING_NODE_ID` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INDEX_OPERATION_ID` decimal(18, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `node_id_idx`(`NODE_ID`, `SENDING_NODE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for notification
-- ----------------------------
DROP TABLE IF EXISTS `notification`;
CREATE TABLE `notification`  (
  `ID` decimal(18, 0) NOT NULL,
  `SCHEME` decimal(18, 0) NULL DEFAULT NULL,
  `EVENT` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EVENT_TYPE_ID` decimal(18, 0) NULL DEFAULT NULL,
  `TEMPLATE_ID` decimal(18, 0) NULL DEFAULT NULL,
  `notif_type` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `notif_parameter` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `ntfctn_scheme`(`SCHEME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notification
-- ----------------------------
INSERT INTO `notification` VALUES (10000, 10000, NULL, 1, NULL, 'Current_Assignee', NULL);
INSERT INTO `notification` VALUES (10001, 10000, NULL, 1, NULL, 'Current_Reporter', NULL);
INSERT INTO `notification` VALUES (10002, 10000, NULL, 1, NULL, 'All_Watchers', NULL);
INSERT INTO `notification` VALUES (10003, 10000, NULL, 2, NULL, 'Current_Assignee', NULL);
INSERT INTO `notification` VALUES (10004, 10000, NULL, 2, NULL, 'Current_Reporter', NULL);
INSERT INTO `notification` VALUES (10005, 10000, NULL, 2, NULL, 'All_Watchers', NULL);
INSERT INTO `notification` VALUES (10006, 10000, NULL, 3, NULL, 'Current_Assignee', NULL);
INSERT INTO `notification` VALUES (10007, 10000, NULL, 3, NULL, 'Current_Reporter', NULL);
INSERT INTO `notification` VALUES (10008, 10000, NULL, 3, NULL, 'All_Watchers', NULL);
INSERT INTO `notification` VALUES (10009, 10000, NULL, 4, NULL, 'Current_Assignee', NULL);
INSERT INTO `notification` VALUES (10010, 10000, NULL, 4, NULL, 'Current_Reporter', NULL);
INSERT INTO `notification` VALUES (10011, 10000, NULL, 4, NULL, 'All_Watchers', NULL);
INSERT INTO `notification` VALUES (10012, 10000, NULL, 5, NULL, 'Current_Assignee', NULL);
INSERT INTO `notification` VALUES (10013, 10000, NULL, 5, NULL, 'Current_Reporter', NULL);
INSERT INTO `notification` VALUES (10014, 10000, NULL, 5, NULL, 'All_Watchers', NULL);
INSERT INTO `notification` VALUES (10015, 10000, NULL, 6, NULL, 'Current_Assignee', NULL);
INSERT INTO `notification` VALUES (10016, 10000, NULL, 6, NULL, 'Current_Reporter', NULL);
INSERT INTO `notification` VALUES (10017, 10000, NULL, 6, NULL, 'All_Watchers', NULL);
INSERT INTO `notification` VALUES (10018, 10000, NULL, 7, NULL, 'Current_Assignee', NULL);
INSERT INTO `notification` VALUES (10019, 10000, NULL, 7, NULL, 'Current_Reporter', NULL);
INSERT INTO `notification` VALUES (10020, 10000, NULL, 7, NULL, 'All_Watchers', NULL);
INSERT INTO `notification` VALUES (10021, 10000, NULL, 8, NULL, 'Current_Assignee', NULL);
INSERT INTO `notification` VALUES (10022, 10000, NULL, 8, NULL, 'Current_Reporter', NULL);
INSERT INTO `notification` VALUES (10023, 10000, NULL, 8, NULL, 'All_Watchers', NULL);
INSERT INTO `notification` VALUES (10024, 10000, NULL, 9, NULL, 'Current_Assignee', NULL);
INSERT INTO `notification` VALUES (10025, 10000, NULL, 9, NULL, 'Current_Reporter', NULL);
INSERT INTO `notification` VALUES (10026, 10000, NULL, 9, NULL, 'All_Watchers', NULL);
INSERT INTO `notification` VALUES (10027, 10000, NULL, 10, NULL, 'Current_Assignee', NULL);
INSERT INTO `notification` VALUES (10028, 10000, NULL, 10, NULL, 'Current_Reporter', NULL);
INSERT INTO `notification` VALUES (10029, 10000, NULL, 10, NULL, 'All_Watchers', NULL);
INSERT INTO `notification` VALUES (10030, 10000, NULL, 11, NULL, 'Current_Assignee', NULL);
INSERT INTO `notification` VALUES (10031, 10000, NULL, 11, NULL, 'Current_Reporter', NULL);
INSERT INTO `notification` VALUES (10032, 10000, NULL, 11, NULL, 'All_Watchers', NULL);
INSERT INTO `notification` VALUES (10033, 10000, NULL, 12, NULL, 'Current_Assignee', NULL);
INSERT INTO `notification` VALUES (10034, 10000, NULL, 12, NULL, 'Current_Reporter', NULL);
INSERT INTO `notification` VALUES (10035, 10000, NULL, 12, NULL, 'All_Watchers', NULL);
INSERT INTO `notification` VALUES (10036, 10000, NULL, 13, NULL, 'Current_Assignee', NULL);
INSERT INTO `notification` VALUES (10037, 10000, NULL, 13, NULL, 'Current_Reporter', NULL);
INSERT INTO `notification` VALUES (10038, 10000, NULL, 13, NULL, 'All_Watchers', NULL);
INSERT INTO `notification` VALUES (10100, 10000, NULL, 14, NULL, 'Current_Assignee', NULL);
INSERT INTO `notification` VALUES (10101, 10000, NULL, 14, NULL, 'Current_Reporter', NULL);
INSERT INTO `notification` VALUES (10102, 10000, NULL, 14, NULL, 'All_Watchers', NULL);
INSERT INTO `notification` VALUES (10103, 10000, NULL, 15, NULL, 'Current_Assignee', NULL);
INSERT INTO `notification` VALUES (10104, 10000, NULL, 15, NULL, 'Current_Reporter', NULL);
INSERT INTO `notification` VALUES (10105, 10000, NULL, 15, NULL, 'All_Watchers', NULL);
INSERT INTO `notification` VALUES (10106, 10000, NULL, 16, NULL, 'Current_Assignee', NULL);
INSERT INTO `notification` VALUES (10107, 10000, NULL, 16, NULL, 'Current_Reporter', NULL);
INSERT INTO `notification` VALUES (10108, 10000, NULL, 16, NULL, 'All_Watchers', NULL);

-- ----------------------------
-- Table structure for notificationinstance
-- ----------------------------
DROP TABLE IF EXISTS `notificationinstance`;
CREATE TABLE `notificationinstance`  (
  `ID` decimal(18, 0) NOT NULL,
  `notificationtype` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SOURCE` decimal(18, 0) NULL DEFAULT NULL,
  `emailaddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MESSAGEID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `notif_source`(`SOURCE`) USING BTREE,
  INDEX `notif_messageid`(`MESSAGEID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for notificationscheme
-- ----------------------------
DROP TABLE IF EXISTS `notificationscheme`;
CREATE TABLE `notificationscheme`  (
  `ID` decimal(18, 0) NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notificationscheme
-- ----------------------------
INSERT INTO `notificationscheme` VALUES (10000, 'Default Notification Scheme', NULL);

-- ----------------------------
-- Table structure for oauthconsumer
-- ----------------------------
DROP TABLE IF EXISTS `oauthconsumer`;
CREATE TABLE `oauthconsumer`  (
  `ID` decimal(18, 0) NOT NULL,
  `CREATED` datetime(0) NULL DEFAULT NULL,
  `consumername` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CONSUMER_KEY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `consumerservice` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PUBLIC_KEY` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `PRIVATE_KEY` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `DESCRIPTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `CALLBACK` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `SIGNATURE_METHOD` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SHARED_SECRET` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `oauth_consumer_index`(`CONSUMER_KEY`) USING BTREE,
  UNIQUE INDEX `oauth_consumer_service_index`(`consumerservice`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oauthconsumertoken
-- ----------------------------
DROP TABLE IF EXISTS `oauthconsumertoken`;
CREATE TABLE `oauthconsumertoken`  (
  `ID` decimal(18, 0) NOT NULL,
  `CREATED` datetime(0) NULL DEFAULT NULL,
  `TOKEN_KEY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TOKEN` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TOKEN_SECRET` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TOKEN_TYPE` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CONSUMER_KEY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `oauth_consumer_token_key_index`(`TOKEN_KEY`) USING BTREE,
  INDEX `oauth_consumer_token_index`(`TOKEN`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oauthspconsumer
-- ----------------------------
DROP TABLE IF EXISTS `oauthspconsumer`;
CREATE TABLE `oauthspconsumer`  (
  `ID` decimal(18, 0) NOT NULL,
  `CREATED` datetime(0) NULL DEFAULT NULL,
  `CONSUMER_KEY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `consumername` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PUBLIC_KEY` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `DESCRIPTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `CALLBACK` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `TWO_L_O_ALLOWED` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXECUTING_TWO_L_O_USER` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TWO_L_O_IMPERSONATION_ALLOWED` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `THREE_L_O_ALLOWED` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `oauth_sp_consumer_index`(`CONSUMER_KEY`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oauthsptoken
-- ----------------------------
DROP TABLE IF EXISTS `oauthsptoken`;
CREATE TABLE `oauthsptoken`  (
  `ID` decimal(18, 0) NOT NULL,
  `CREATED` datetime(0) NULL DEFAULT NULL,
  `TOKEN` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TOKEN_SECRET` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TOKEN_TYPE` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CONSUMER_KEY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TTL` decimal(18, 0) NULL DEFAULT NULL,
  `spauth` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CALLBACK` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `spverifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `spversion` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SESSION_HANDLE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SESSION_CREATION_TIME` datetime(0) NULL DEFAULT NULL,
  `SESSION_LAST_RENEWAL_TIME` datetime(0) NULL DEFAULT NULL,
  `SESSION_TIME_TO_LIVE` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `oauth_sp_token_index`(`TOKEN`) USING BTREE,
  INDEX `oauth_sp_consumer_key_index`(`CONSUMER_KEY`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for optionconfiguration
-- ----------------------------
DROP TABLE IF EXISTS `optionconfiguration`;
CREATE TABLE `optionconfiguration`  (
  `ID` decimal(18, 0) NOT NULL,
  `FIELDID` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPTIONID` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FIELDCONFIG` decimal(18, 0) NULL DEFAULT NULL,
  `SEQUENCE` decimal(18, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `fieldid_optionid`(`FIELDID`, `OPTIONID`) USING BTREE,
  INDEX `fieldid_fieldconf`(`FIELDID`, `FIELDCONFIG`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of optionconfiguration
-- ----------------------------
INSERT INTO `optionconfiguration` VALUES (10200, 'priority', '1', 10100, 1);
INSERT INTO `optionconfiguration` VALUES (10201, 'priority', '2', 10100, 2);
INSERT INTO `optionconfiguration` VALUES (10202, 'priority', '3', 10100, 3);
INSERT INTO `optionconfiguration` VALUES (10203, 'priority', '4', 10100, 4);
INSERT INTO `optionconfiguration` VALUES (10204, 'priority', '5', 10100, 5);
INSERT INTO `optionconfiguration` VALUES (10300, 'issuetype', '10000', 10000, 0);
INSERT INTO `optionconfiguration` VALUES (10301, 'issuetype', '10001', 10000, 1);

-- ----------------------------
-- Table structure for os_currentstep
-- ----------------------------
DROP TABLE IF EXISTS `os_currentstep`;
CREATE TABLE `os_currentstep`  (
  `ID` decimal(18, 0) NOT NULL,
  `ENTRY_ID` decimal(18, 0) NULL DEFAULT NULL,
  `STEP_ID` decimal(9, 0) NULL DEFAULT NULL,
  `ACTION_ID` decimal(9, 0) NULL DEFAULT NULL,
  `OWNER` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `START_DATE` datetime(0) NULL DEFAULT NULL,
  `DUE_DATE` datetime(0) NULL DEFAULT NULL,
  `FINISH_DATE` datetime(0) NULL DEFAULT NULL,
  `STATUS` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CALLER` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `wf_entryid`(`ENTRY_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for os_currentstep_prev
-- ----------------------------
DROP TABLE IF EXISTS `os_currentstep_prev`;
CREATE TABLE `os_currentstep_prev`  (
  `ID` decimal(18, 0) NOT NULL,
  `PREVIOUS_ID` decimal(18, 0) NOT NULL,
  PRIMARY KEY (`ID`, `PREVIOUS_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for os_historystep
-- ----------------------------
DROP TABLE IF EXISTS `os_historystep`;
CREATE TABLE `os_historystep`  (
  `ID` decimal(18, 0) NOT NULL,
  `ENTRY_ID` decimal(18, 0) NULL DEFAULT NULL,
  `STEP_ID` decimal(9, 0) NULL DEFAULT NULL,
  `ACTION_ID` decimal(9, 0) NULL DEFAULT NULL,
  `OWNER` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `START_DATE` datetime(0) NULL DEFAULT NULL,
  `DUE_DATE` datetime(0) NULL DEFAULT NULL,
  `FINISH_DATE` datetime(0) NULL DEFAULT NULL,
  `STATUS` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CALLER` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `historystep_entryid`(`ENTRY_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for os_historystep_prev
-- ----------------------------
DROP TABLE IF EXISTS `os_historystep_prev`;
CREATE TABLE `os_historystep_prev`  (
  `ID` decimal(18, 0) NOT NULL,
  `PREVIOUS_ID` decimal(18, 0) NOT NULL,
  PRIMARY KEY (`ID`, `PREVIOUS_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for os_wfentry
-- ----------------------------
DROP TABLE IF EXISTS `os_wfentry`;
CREATE TABLE `os_wfentry`  (
  `ID` decimal(18, 0) NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INITIALIZED` decimal(9, 0) NULL DEFAULT NULL,
  `STATE` decimal(9, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for permissionscheme
-- ----------------------------
DROP TABLE IF EXISTS `permissionscheme`;
CREATE TABLE `permissionscheme`  (
  `ID` decimal(18, 0) NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permissionscheme
-- ----------------------------
INSERT INTO `permissionscheme` VALUES (0, 'Default Permission Scheme', 'This is the default Permission Scheme. Any new projects that are created will be assigned this scheme.');

-- ----------------------------
-- Table structure for permissionschemeattribute
-- ----------------------------
DROP TABLE IF EXISTS `permissionschemeattribute`;
CREATE TABLE `permissionschemeattribute`  (
  `ID` decimal(18, 0) NOT NULL,
  `SCHEME` decimal(18, 0) NULL DEFAULT NULL,
  `ATTRIBUTE_KEY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ATTRIBUTE_VALUE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `prmssn_scheme_attr_idx`(`SCHEME`) USING BTREE,
  INDEX `prmssn_scheme_attr_key_idx`(`SCHEME`, `ATTRIBUTE_KEY`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pluginstate
-- ----------------------------
DROP TABLE IF EXISTS `pluginstate`;
CREATE TABLE `pluginstate`  (
  `pluginkey` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pluginenabled` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`pluginkey`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pluginversion
-- ----------------------------
DROP TABLE IF EXISTS `pluginversion`;
CREATE TABLE `pluginversion`  (
  `ID` decimal(18, 0) NOT NULL,
  `pluginname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `pluginkey` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `pluginversion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATED` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pluginversion
-- ----------------------------
INSERT INTO `pluginversion` VALUES (10000, 'Jira Projects Plugin', 'com.atlassian.jira.jira-projects-plugin', '5.0.5-f1e430325', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10001, 'Jira Software Application', 'com.atlassian.jira.jira-software-application', '8.0.2', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10002, 'Atlassian OAuth Consumer Plugin', 'com.atlassian.oauth.consumer', '4.0.2', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10003, 'Atlassian Jira - Plugins - My Jira Home', 'com.atlassian.jira.jira-my-home-plugin', '8.0.2', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10004, 'JIRA Software English (United States) Language Pack', 'tac.jira software.languages.en_US', '8.1.0.v20190201000506', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10005, 'Project Creation Plugin SPI for JIRA', 'com.atlassian.plugins.jira-project-creation', '4.0.0-74bdd7a6fa', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10006, 'Atlassian Embedded Crowd - Administration Plugin', 'com.atlassian.crowd.embedded.admin', '2.3.4-j11-2', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10007, 'Analytics Client Plugin', 'com.atlassian.analytics.analytics-client', '5.6.4', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10008, 'JIRA Software Chinese (China) Language Pack', 'tac.jira software.languages.zh_CN', '8.1.0.v20190201000506', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10009, 'Jira Help Tips plugin', 'com.atlassian.plugins.helptips.jira-help-tips', '8.0.2', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10010, 'Atlassian Navigation Links Plugin', 'com.atlassian.plugins.atlassian-nav-links-plugin', '5.0.0', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10011, 'JIRA Core Romanian (Romania) Language Pack', 'tac.jira core.languages.ro_RO', '8.1.0.v20190201001325', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10012, 'Atlassian Jira - Plugins - Issue Web Link', 'com.atlassian.jira.jira-issue-link-web-plugin', '8.0.2', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10013, 'JIRA Core Slovak (Slovakia) Language Pack', 'tac.jira core.languages.sk_SK', '8.1.0.v20190201001325', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10014, 'Atlassian Hipchat Integration Plugin Core', 'com.atlassian.plugins.base-hipchat-integration-plugin-api', '8.2.4', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10015, 'Whisper Messages Plugin', 'whisper.messages', '1.0', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10016, 'Project Role Actors Plugin', 'com.atlassian.jira.plugin.system.projectroleactors', '1.0', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10017, 'Atlassian Jira - Plugins - OAuth Service Provider SPI', 'com.atlassian.jira.oauth.serviceprovider', '8.0.2', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10018, 'Keyboard Shortcuts Plugin', 'jira.keyboard.shortcuts', '1.0', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10019, 'Bitbucket Importer Plugin for JIM', 'com.atlassian.jira.plugins.jira-importers-bitbucket-plugin', '3.0.0', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10020, 'Atlassian Remote Event Common Plugin', 'com.atlassian.plugins.atlassian-remote-event-common-plugin', '6.1.0', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10021, 'Jira GitHub Issue Importer', 'com.atlassian.jira.plugins.jira-importers-github-plugin', '3.0.5', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10022, 'JIRA Password Policy Plugin', 'com.atlassian.jira.plugins.jira-password-policy-plugin', '2.1.0', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10023, 'ROME: RSS/Atom syndication and publishing tools', 'com.springsource.com.sun.syndication-0.9.0', '0.9.0', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10024, 'JIRA iCalendar Plugin', 'com.atlassian.jira.extra.jira-ical-feed', '1.4.7', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10025, 'Jira Drag and Drop Attachment Plugin', 'com.atlassian.jira.plugins.jira-dnd-attachment-plugin', '5.0.1', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10026, 'Atlassian Jira - Plugins - Post setup announcements plugin', 'com.atlassian.jira.jira-postsetup-announcements-plugin', '8.0.2', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10027, 'Streams Inline Actions Plugin', 'com.atlassian.streams.actions', '8.1.1', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10028, 'JIRA Software Spanish (Spain) Language Pack', 'tac.jira software.languages.es_ES', '8.1.0.v20190201000506', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10029, 'JIRA Core Swedish (Sweden) Language Pack', 'tac.jira core.languages.sv_SE', '8.1.0.v20190201001325', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10030, 'Comment Panel Plugin', 'com.atlassian.jira.plugin.system.comment-panel', '1.0', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10031, 'Atlassian Jira - Plugins - Development Integration Plugin', 'com.atlassian.jira.plugins.jira-development-integration-plugin', '5.3.0', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10032, 'Atlassian Remote Event Consumer Plugin', 'com.atlassian.plugins.atlassian-remote-event-consumer-plugin', '6.1.0', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10033, 'scala-2.11-provider-plugin', 'com.atlassian.scala.plugins.scala-2.11-provider-plugin', '0.13', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10034, 'JIRA Workflow Transition Tabs', 'com.atlassian.jira.plugin.system.workfloweditor.transition.tabs', '1.0', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10035, 'Jira inform - batching plugin', 'com.atlassian.jira.plugins.inform.batching-plugin', '1.0.27', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10036, 'JIRA Core Czech (Czech Republic) Language Pack', 'tac.jira core.languages.cs_CZ', '8.1.0.v20190201001325', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10037, 'Renderer Plugin', 'com.atlassian.jira.plugin.system.jirarenderers', '1.0', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10038, 'Atlassian Gadgets OAuth Service Provider Plugin', 'com.atlassian.gadgets.oauth.serviceprovider', '4.3.9', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10039, 'JIRA Software Finnish (Finland) Language Pack', 'tac.jira software.languages.fi_FI', '8.1.0.v20190201000506', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10040, 'JIRA Core Japanese (Japan) Language Pack', 'tac.jira core.languages.ja_JP', '8.1.0.v20190201001325', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10041, 'JIRA Core Italian (Italy) Language Pack', 'tac.jira core.languages.it_IT', '8.1.0.v20190201001325', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10042, 'Jira for Software Plugin', 'com.atlassian.jira.plugins.jira-software-plugin', '3.0.2', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10043, 'JIRA Core Polish (Poland) Language Pack', 'tac.jira core.languages.pl_PL', '8.1.0.v20190201001325', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10044, 'Atlassian Jira - Plugins - Admin Navigation Component', 'com.atlassian.jira.jira-admin-navigation-plugin', '8.0.2', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10045, 'JIRA Software Danish (Denmark) Language Pack', 'tac.jira software.languages.da_DK', '8.1.0.v20190201000506', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10046, 'JIRA Core German (Germany) Language Pack', 'tac.jira core.languages.de_DE', '8.1.0.v20190201001325', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10047, 'Atlassian Plugins - Web Resources - Implementation Plugin', 'com.atlassian.plugins.atlassian-plugins-webresource-plugin', '4.0.1', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10048, 'Preset Filters Sections', 'jira.webfragments.preset.filters', '1.0', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10049, 'Atlassian Jira - Plugins - Project Config Plugin', 'com.atlassian.jira.jira-project-config-plugin', '8.0.2', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10050, 'Crowd System Password Encoders', 'crowd.system.passwordencoders', '1.0', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10051, 'Atlassian UI Plugin', 'com.atlassian.auiplugin', '8.0.1', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10052, 'Atlassian Jira - Plugins - Share Content Component', 'com.atlassian.jira.jira-share-plugin', '8.0.2', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10053, 'Atlassian Jira - Plugins - Statistics plugin', 'com.atlassian.jira.jira-statistics-plugin', '8.0.2', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10054, 'Atlassian Jira - Plugins - Remote Jira Link', 'com.atlassian.jira.jira-issue-link-remote-jira-plugin', '8.0.2', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10055, 'Functional Extensions Guava Inter-Ops', 'io.atlassian.fugue.guava-4.7.2', '4.7.2', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10056, 'Remote Link Aggregator Plugin', 'com.atlassian.plugins.remote-link-aggregator-plugin', '3.0.0', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10057, 'Atlassian HealthCheck Common Module', 'com.atlassian.healthcheck.atlassian-healthcheck', '6.0.0', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10058, 'Workbox - Common Plugin', 'com.atlassian.mywork.mywork-common-plugin', '7.0.1', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10059, 'Jira Workflow Sharing Plugin', 'com.atlassian.jira.plugins.workflow.sharing.jira-workflow-sharing-plugin', '2.2.3', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10060, 'Entity property conditions', 'system.entity.property.conditions', '1.0', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10061, 'org.osgi:org.osgi.service.cm', 'org.osgi.service.cm-1.5.0.201505202024', '1.5.0.201505202024', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10062, 'JIRA Software Korean (South Korea) Language Pack', 'tac.jira software.languages.ko_KR', '8.1.0.v20190201000506', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10063, 'Atlassian Jira - Plugins - APDEX', 'com.atlassian.jira.jira-apdex-plugin', '8.0.2', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10064, 'JQL Functions', 'jira.jql.function', '1.0', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10065, 'Atlassian Soy - Plugin', 'com.atlassian.soy.soy-template-plugin', '5.0.0', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10066, 'JIRA Software Icelandic (Iceland) Language Pack', 'tac.jira software.languages.is_IS', '8.1.0.v20190201000506', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10067, 'atlassian-failure-cache-plugin', 'com.atlassian.atlassian-failure-cache-plugin', '2.0.0', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10068, 'Atlassian Jira - Plugins - View Issue Panels', 'com.atlassian.jira.jira-view-issue-plugin', '8.0.2', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10069, 'JIRA Footer', 'jira.footer', '1.0', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10070, 'Applinks - Plugin - Core', 'com.atlassian.applinks.applinks-plugin', '6.0.3', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10071, 'Atlassian Whitelist API Plugin', 'com.atlassian.plugins.atlassian-whitelist-api-plugin-4.0.7', '4.0.7', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10072, 'Jira inform - batchers', 'com.atlassian.jira.plugins.inform.batchers', '1.0.27', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10073, 'jira-optimizer-plugin', 'com.atlassian.jira.plugins.jira-optimizer-plugin', '2.0.9', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10074, 'Analytics Whitelist Plugin', 'com.atlassian.analytics.analytics-whitelist', '3.68', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10075, 'Atlassian Jira - Plugins - Invite User', 'com.atlassian.jira.jira-invite-user-plugin', '2.2.6', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10076, 'JIRA Software Norwegian (Norway) Language Pack', 'tac.jira software.languages.no_NO', '8.1.0.v20190201000506', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10077, 'Applinks - Plugin - Basic Authentication', 'com.atlassian.applinks.applinks-basicauth-plugin', '6.0.3', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10078, 'Atlassian Jira - Plugins - Quick Search', 'com.atlassian.jira.plugins.jira-quicksearch-plugin', '8.0.2', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10079, 'User Profile Links', 'jira.webfragments.user.profile.links', '1.0', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10080, 'JIRA Software Italian (Italy) Language Pack', 'tac.jira software.languages.it_IT', '8.1.0.v20190201000506', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10081, 'Admin Menu Sections', 'jira.webfragments.admin', '1.0', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10082, 'wiki-editor', 'com.atlassian.jira.plugins.jira-wiki-editor', '4.0.13', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10083, 'Atlassian OAuth Service Provider SPI', 'com.atlassian.oauth.atlassian-oauth-service-provider-spi', '4.0.2', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10084, 'Top Navigation Bar', 'jira.top.navigation.bar', '1.0', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10085, 'Apache Apache HttpClient OSGi bundle', 'org.apache.httpcomponents.httpclient-4.5.5', '4.5.5', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10086, 'Applinks - Plugin - Trusted Apps', 'com.atlassian.applinks.applinks-trustedapps-plugin', '6.0.3', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10087, 'Wiki Renderer Macros Plugin', 'com.atlassian.jira.plugin.system.renderers.wiki.macros', '1.0', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10088, 'Issue Views Plugin', 'jira.issueviews', '1.0', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10089, 'JIRA Core Icelandic (Iceland) Language Pack', 'tac.jira core.languages.is_IS', '8.1.0.v20190201001325', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10090, 'Streams SPI', 'com.atlassian.streams.streams-spi', '8.1.1', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10091, 'Jira inform - event plugin', 'com.atlassian.jira.plugins.inform.event-plugin', '1.0.27', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10092, 'Applinks - Plugin - CORS', 'com.atlassian.applinks.applinks-cors-plugin', '6.0.3', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10093, 'Streams Third Party Provider Plugin', 'com.atlassian.streams.streams-thirdparty-plugin', '8.1.1', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10094, 'Atlassian OAuth Service Provider Plugin', 'com.atlassian.oauth.serviceprovider', '4.0.2', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10095, 'Atlassian Jira - Plugins - Common AppLinks Based Issue Link Plugin', 'com.atlassian.jira.jira-issue-link-applinks-common-plugin', '8.0.2', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10096, 'Functional Extensions', 'io.atlassian.fugue-4.7.2', '4.7.2', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10097, 'jira-webresources-plugin', 'jira.webresources', '1.0', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10098, 'Embedded Gadgets Plugin', 'com.atlassian.gadgets.embedded', '4.3.9', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10099, 'Atlassian Jira - Plugins - Core Reports', 'com.atlassian.jira.jira-core-reports-plugin', '8.0.2', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10100, 'Streams Plugin', 'com.atlassian.streams', '8.1.1', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10101, 'Browse Project Operations Sections', 'jira.webfragments.browse.project.links', '1.0', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10102, 'JIRA Issue Collector Plugin', 'com.atlassian.jira.collector.plugin.jira-issue-collector-plugin', '3.0.7', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10103, 'Atlassian Whitelist Core Plugin', 'com.atlassian.plugins.atlassian-whitelist-core-plugin', '4.0.7', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10104, 'JIRA Core Russian (Russia) Language Pack', 'tac.jira core.languages.ru_RU', '8.1.0.v20190201001325', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10105, 'ICU4J', 'com.atlassian.bundles.icu4j-3.8.0.1', '3.8.0.1', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10106, 'Streams Core Plugin', 'com.atlassian.streams.core', '8.1.1', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10107, 'Atlassian Jira - Plugins - WebHooks Plugin', 'com.atlassian.jira.plugins.webhooks.jira-webhooks-plugin', '8.0.2', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10108, 'Issue Operations Plugin', 'com.atlassian.jira.plugin.system.issueoperations', '1.0', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10109, 'Gadget Directory Plugin', 'com.atlassian.gadgets.directory', '4.3.9', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10110, 'Attach Image for JIRA', 'com.atlassian.plugins.jira-html5-attach-images', '4.0.0', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10111, 'Jira Monitoring Plugin', 'com.atlassian.jira.jira-monitoring-plugin', '05.7.3', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10112, 'Atlassian Hipchat Integration Plugin', 'com.atlassian.plugins.base-hipchat-integration-plugin', '8.2.4', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10113, 'Atlassian Jira - Plugins - Project Centric Issue Navigator', 'com.atlassian.jira.jira-projects-issue-navigator', '9.0.19', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10114, 'jira-importers-plugin', 'com.atlassian.jira.plugins.jira-importers-plugin', '9.0.10', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10115, 'Atlassian Plugins - JavaScript libraries', 'com.atlassian.plugin.jslibs', '1.2.4', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10116, 'JIRA Software Portuguese (Brazil) Language Pack', 'tac.jira software.languages.pt_BR', '8.1.0.v20190201000506', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10117, 'Jira Time Zone Detection plugin', 'com.atlassian.jira.jira-tzdetect-plugin', '3.0.3', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10118, 'Hipchat for Jira', 'com.atlassian.labs.hipchat.hipchat-for-jira-plugin', '8.2.4', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10119, 'Atlassian Jira - Plugins - Diagnostics Plugin', 'com.atlassian.jira.diagnostics', '8.0.2', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10120, 'JIRA Core Dutch (Netherlands) Language Pack', 'tac.jira core.languages.nl_NL', '8.1.0.v20190201001325', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10121, 'JIRA Core Estonian (Estonia) Language Pack', 'tac.jira core.languages.et_EE', '8.1.0.v20190201001325', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10122, 'JSON Library', 'com.atlassian.bundles.json-20070829.0.0.1', '20070829.0.0.1', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10123, 'JDOM DOM Processor', 'com.springsource.org.jdom-1.0.0', '1.0.0', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10124, 'JIRA Core Chinese (China) Language Pack', 'tac.jira core.languages.zh_CN', '8.1.0.v20190201001325', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10125, 'Atlassian Jira - Plugins - Feedback Plugin', 'com.atlassian.feedback.jira-feedback-plugin', '8.0.2', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10126, 'ActiveObjects Plugin - OSGi Bundle', 'com.atlassian.activeobjects.activeobjects-plugin', '3.0.0', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10127, 'Atlassian Jira - Plugins - Header Plugin', 'com.atlassian.jira.jira-header-plugin', '8.0.2', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10128, 'Issue Tab Panels Plugin', 'com.atlassian.jira.plugin.system.issuetabpanels', '1.0', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10129, 'JIRA Feature Keys', 'jira.feature.keys', '1.0', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10130, 'JIRA Streams Inline Actions Plugin', 'com.atlassian.streams.jira.inlineactions', '8.1.1', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10131, 'Atlassian Jira - Plugins - Application Properties', 'com.atlassian.jira.jira-application-properties-plugin', '8.0.2', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10132, 'Atlassian Jira - Plugins - Gadgets Plugin', 'com.atlassian.jira.gadgets', '8.0.2', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10133, 'Atlassian Jira - Plugins - Analytics whitelist', 'com.atlassian.jira.jira-analytics-whitelist-plugin', '8.0.2', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10134, 'jira-inline-issue-create-plugin', 'com.atlassian.jira.plugins.inline-create.jira-inline-issue-create-plugin', '2.0.14', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10135, 'Functional Extensions Scala Inter-Ops', 'io.atlassian.fugue.scala-4.7.2', '4.7.2', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10136, 'Workbox - JIRA Provider Plugin', 'com.atlassian.mywork.mywork-jira-provider-plugin', '7.0.1', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10137, 'JIRA Core Korean (South Korea) Language Pack', 'tac.jira core.languages.ko_KR', '8.1.0.v20190201001325', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10138, 'Content Link Resolvers Plugin', 'com.atlassian.jira.plugin.wiki.contentlinkresolvers', '1.0', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10139, 'Atlassian Application Manager plugin', 'com.atlassian.upm.upm-application-plugin', '4.0.1', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10140, 'JIRA Core Spanish (Spain) Language Pack', 'tac.jira core.languages.es_ES', '8.1.0.v20190201001325', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10141, 'JIRA Software Russian (Russia) Language Pack', 'tac.jira software.languages.ru_RU', '8.1.0.v20190201000506', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10142, 'JIRA Software Swedish (Sweden) Language Pack', 'tac.jira software.languages.sv_SE', '8.1.0.v20190201000506', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10143, 'Jira Mobile', 'com.atlassian.jira.mobile', '3.2.1', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10144, 'Atlassian Jira - Plugins - Onboarding', 'com.atlassian.jira.jira-onboarding-assets-plugin', '8.0.2', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10145, 'FishEye Plugin', 'com.atlassian.jirafisheyeplugin', '8.0.2', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10146, 'JIRA Software French (France) Language Pack', 'tac.jira software.languages.fr_FR', '8.1.0.v20190201000506', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10147, 'Atlassian JIRA - Admin Helper Plugin', 'com.atlassian.jira.plugins.jira-admin-helper-plugin', '5.0.1', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10148, 'Atlassian browser metrics plugin', 'com.atlassian.plugins.browser.metrics.browser-metrics-plugin', '7.0.1', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10149, 'JIRA Software German (Germany) Language Pack', 'tac.jira software.languages.de_DE', '8.1.0.v20190201000506', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10150, 'Atlassian Jira - Plugins - Global Issue Navigator', 'com.atlassian.jira.jira-issue-nav-plugin', '9.0.19', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10151, 'User Navigation Bar Sections', 'jira.webfragments.user.navigation.bar', '1.0', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10152, 'Atlassian Troubleshooting and Support Tools', 'com.atlassian.troubleshooting.plugin-jira', '1.15.1', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10153, 'Neko HTML', 'com.atlassian.bundles.nekohtml-1.9.12.1', '1.9.12.1', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10154, 'JIRA Global Permissions', 'jira.system.global.permissions', '1.0', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10155, 'JIRA Software Slovak (Slovakia) Language Pack', 'tac.jira software.languages.sk_SK', '8.1.0.v20190201000506', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10156, 'Atlassian Template Renderer API', 'com.atlassian.templaterenderer.api', '4.0.0', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10157, 'JIRA Core Danish (Denmark) Language Pack', 'tac.jira core.languages.da_DK', '8.1.0.v20190201001325', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10158, 'Atlassian JIRA - Plugins - File viewer plugin', 'com.atlassian.jira.jira-fileviewer-plugin', '8.0.0', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10159, 'Atlassian Pretty URLs Plugin', 'com.atlassian.prettyurls.atlassian-pretty-urls-plugin', '3.0.0', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10160, 'JIRA Attachment Archive File Processors', 'jira.system.attachment.processors', '1.0', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10161, 'Atlassian Jira - Plugins - Admin Upgrades', 'com.atlassian.jira.jira-admin-updates-plugin', '8.0.2', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10162, 'jira-ui', 'com.atlassian.jira.plugins.jira-ui', '0.2.0', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10163, 'Atlassian Universal Plugin Manager Plugin', 'com.atlassian.upm.atlassian-universal-plugin-manager-plugin', '4.0.1', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10164, 'SAML for Atlassian Data Center', 'com.atlassian.plugins.authentication.atlassian-authentication-plugin', '3.0.0-a22dd6d', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10165, 'Atlassian Whitelist UI Plugin', 'com.atlassian.plugins.atlassian-whitelist-ui-plugin', '4.0.7', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10166, 'JIRA Core Portuguese (Brazil) Language Pack', 'tac.jira core.languages.pt_BR', '8.1.0.v20190201001325', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10167, 'Redmine Importers Plugin for JIM', 'com.atlassian.jira.plugins.jira-importers-redmine-plugin', '2.1.9', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10168, 'Atlassian JIRA - Plugins - Quick Edit Plugin', 'com.atlassian.jira.jira-quick-edit-plugin', '3.2.0', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10169, 'Soy Function Plugin', 'com.atlassian.jira.plugin.system.soyfunction', '1.0', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10170, 'Universal Plugin Manager - Role-Based Licensing Implementation Plugin', 'com.atlassian.upm.role-based-licensing-plugin', '4.0.1', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10171, 'Jira Core Project Templates Plugin', 'com.atlassian.jira-core-project-templates', '7.0.1', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10172, 'Atlassian OAuth Admin Plugin', 'com.atlassian.oauth.admin', '4.0.2', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10173, 'Atlassian REST - Module Types', 'com.atlassian.plugins.rest.atlassian-rest-module', '6.0.0', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10174, 'Crowd REST API', 'crowd-rest-application-management', '1.0', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10175, 'jira-issue-nav-components', 'com.atlassian.jira.jira-issue-nav-components', '9.0.19', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10176, 'jquery', 'com.atlassian.plugins.jquery', '2.2.4.6', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10177, 'Atlassian Jira - Plugins - Auditing Plugin [Audit Log]', 'com.atlassian.jira.plugins.jira-auditing-plugin', '8.0.2', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10178, 'JIRA Remote Link Aggregator Plugin', 'com.atlassian.plugins.jira-remote-link-aggregator-plugin', '3.0.0', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10179, 'Streams API', 'com.atlassian.streams.streams-api', '8.1.1', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10180, 'Atlassian Jira - Plugins - Atlassian Notifications Plugin', 'com.atlassian.jira.jira-whisper-plugin', '8.0.2', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10181, 'Atlassian HTTP Client, Apache HTTP components impl', 'com.atlassian.httpclient.atlassian-httpclient-plugin', '2.0.0', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10182, 'Jira DVCS Connector Plugin', 'com.atlassian.jira.plugins.jira-bitbucket-connector-plugin', '5.1.3', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10183, 'JIRA Software Hungarian (Hungary) Language Pack', 'tac.jira software.languages.hu_HU', '8.1.0.v20190201000506', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10184, 'Asana Importers Plugin for JIM', 'com.atlassian.jira.plugins.jira-importers-asana-plugin', '2.0.2', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10185, 'Atlassian Awareness Capability', 'com.atlassian.plugins.atlassian-awareness-capability', '0.0.6', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10186, 'Atlassian Plugins - Web Resources REST', 'com.atlassian.plugins.atlassian-plugins-webresource-rest', '4.0.1', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10187, 'Custom Field Types & Searchers', 'com.atlassian.jira.plugin.system.customfieldtypes', '1.0', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10188, 'Project Creation Capability Product REST Plugin', 'com.atlassian.plugins.atlassian-project-creation-plugin', '4.0.0-74bdd7a6fa', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10189, 'Atlassian Jira - Plugins - REST Plugin', 'com.atlassian.jira.rest', '8.0.2', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10190, 'Atlassian Spring Scanner Runtime', 'com.atlassian.plugin.atlassian-spring-scanner-runtime', '2.1.7', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10191, 'JIRA Software Czech (Czech Republic) Language Pack', 'tac.jira software.languages.cs_CZ', '8.1.0.v20190201000506', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10192, 'Opensocial Plugin', 'com.atlassian.gadgets.opensocial', '4.3.9', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10193, 'Atlassian Jira - Plugins - Confluence Link', 'com.atlassian.jira.jira-issue-link-confluence-plugin', '8.0.2', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10194, 'ROME, RSS and atOM utilitiEs for Java', 'rome.rome-1.0', '1.0', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10195, 'User Format', 'jira.user.format', '1.0', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10196, 'JIRA Core Finnish (Finland) Language Pack', 'tac.jira core.languages.fi_FI', '8.1.0.v20190201001325', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10197, 'JIRA Software Japanese (Japan) Language Pack', 'tac.jira software.languages.ja_JP', '8.1.0.v20190201000506', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10198, 'View Project Operations Sections', 'jira.webfragments.view.project.operations', '1.0', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10199, 'atlassian-servlet-plugin', 'com.atlassian.web.atlassian-servlet-plugin', '5.2.0', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10200, 'Apache Apache HttpCore OSGi bundle', 'org.apache.httpcomponents.httpcore-4.4.9', '4.4.9', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10201, 'Crowd REST API', 'crowd-rest-plugin', '1.0', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10202, 'JIRA Software Polish (Poland) Language Pack', 'tac.jira software.languages.pl_PL', '8.1.0.v20190201000506', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10203, 'Atlassian OAuth Consumer SPI', 'com.atlassian.oauth.atlassian-oauth-consumer-spi', '4.0.2', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10204, 'Atlassian Jira - Plugins - Post-Upgrade Landing Page', 'com.atlassian.jira.plugins.jira-post-upgrade-landing-page-plugin', '8.0.2', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10205, 'JIRA Core Hungarian (Hungary) Language Pack', 'tac.jira core.languages.hu_HU', '8.1.0.v20190201001325', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10206, 'Atlassian Spring Scanner Annotations', 'com.atlassian.plugin.atlassian-spring-scanner-annotation', '2.1.7', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10207, 'jackson-module-scala-2.10-provider', 'com.atlassian.scala.plugins.jackson-module-scala-2.10-provider-plugin', '0.5', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10208, 'Rich Text Editor for JIRA', 'com.atlassian.jira.plugins.jira-editor-plugin', '4.0.13', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10209, 'Web Resources Plugin Jira Core', 'jira.core', '1.0', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10210, 'Workflow Plugin', 'com.atlassian.jira.plugin.system.workflow', '1.0', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10211, 'jira-importers-trello-plugin', 'com.atlassian.jira.plugins.jira-importers-trello-plugin', '3.0.1', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10212, 'JIRA Software Dutch (Netherlands) Language Pack', 'tac.jira software.languages.nl_NL', '8.1.0.v20190201000506', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10213, 'Icon Types Plugin', 'jira.icontypes', '1.0', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10214, 'JIRA Core Norwegian (Norway) Language Pack', 'tac.jira core.languages.no_NO', '8.1.0.v20190201001325', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10215, 'Atlassian WebHooks Plugin', 'com.atlassian.webhooks.atlassian-webhooks-plugin', '3.3.0', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10216, 'Help Paths Plugin', 'jira.help.paths', '1.0', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10217, 'Jira Base URL Plugin', 'com.atlassian.jira.jira-baseurl-plugin', '3.2.0', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10218, 'Atlassian Jira - Plugins - Look And Feel Logo Upload Plugin', 'com.atlassian.jira.lookandfeel', '8.0.2', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10219, 'Issue Status Plugin', 'com.atlassian.plugins.issue-status-plugin', '1.1.7', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10220, 'Gadget Spec Publisher Plugin', 'com.atlassian.gadgets.publisher', '4.3.9', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10221, 'Atlassian Jira - Plugins - OAuth Consumer SPI', 'com.atlassian.jira.oauth.consumer', '8.0.2', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10222, 'JIRA Agile', 'com.pyxis.greenhopper.jira', '8.0.0-DAILY20190215023029', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10223, 'JIRA Software Estonian (Estonia) Language Pack', 'tac.jira software.languages.et_EE', '8.1.0.v20190201000506', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10224, 'JIRA Core French (France) Language Pack', 'tac.jira core.languages.fr_FR', '8.1.0.v20190201001325', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10225, 'Renderer Component Factories Plugin', 'com.atlassian.jira.plugin.wiki.renderercomponentfactories', '1.0', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10226, 'Atlassian LESS Transformer Plugin', 'com.atlassian.plugins.less-transformer-plugin', '4.0.0', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10227, 'Pocketknife Feature Flags Plugin', 'com.atlassian.pocketknife.featureflags-plugin', '0.5.4', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10228, 'Functional Optics Library', 'io.atlassian.fugue.optics-4.7.2', '4.7.2', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10229, 'Functional Extensions Retry Inter-Ops', 'io.atlassian.fugue.retry-4.7.2', '4.7.2', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10230, 'Jira Bamboo Plugin', 'com.atlassian.jira.plugin.ext.bamboo', '8.0.3', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10231, 'Atlassian Jira - Plugins - Transition Trigger Plugin', 'com.atlassian.jira.plugins.jira-transition-triggers-plugin', '8.2.0', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10232, 'Atlassian Bot Session Killer', 'com.atlassian.labs.atlassian-bot-killer', '1.7.9', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10233, 'User Profile Panels', 'jira.user.profile.panels', '1.0', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10234, 'scala-2.10-provider-plugin', 'com.atlassian.scala.plugins.scala-2.10-provider-plugin', '0.14', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10235, 'JIRA Software Romanian (Romania) Language Pack', 'tac.jira software.languages.ro_RO', '8.1.0.v20190201000506', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10236, 'Atlassian Jira - Plugins - ActiveObjects SPI', 'com.atlassian.jira.jira-activeobjects-spi-plugin', '8.0.2', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10237, 'JIRA Project Permissions', 'jira.system.project.permissions', '1.0', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10238, 'Wallboard Plugin', 'com.atlassian.jirawallboard.atlassian-wallboard-plugin', '3.0.2', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10239, 'Atlassian Jira - Plugins - User Profile Plugin', 'com.atlassian.jira.jira-user-profile-plugin', '3.0.8', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10240, 'Project Templates Plugin', 'com.atlassian.jira.project-templates-plugin', '7.0.1', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10241, 'Atlassian Notifications', 'com.atlassian.whisper.atlassian-whisper-plugin', '2.0.2', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10242, 'Filter Deletion Warning Plugin', 'jira.filter.deletion.warning', '1.0', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10243, 'JIRA Software Monitor Plugin', 'com.atlassian.jira.plugins.jira-software-monitor-plugin', '1.0.0', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10244, 'English (United States) Language Pack', 'com.atlassian.jira.jira-languages.en_US', '8.0.2', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10245, 'Atlassian Jira - Plugins - LESS integration', 'com.atlassian.jira.jira-less-integration', '8.0.2', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10246, 'Atlassian Jira - Plugins - SAL Plugin', 'com.atlassian.sal.jira', '8.0.2', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10247, 'Atlassian Template Renderer Velocity 1.6 Plugin', 'com.atlassian.templaterenderer.atlassian-template-renderer-velocity1.6-plugin', '4.0.0', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10248, 'Atlassian Jira - Plugins - Mail Plugin', 'com.atlassian.jira.jira-mail-plugin', '11.0.1', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10249, 'Atlassian Jira - Plugins - Closure Template Renderer', 'com.atlassian.jira.jira-soy-plugin', '8.0.2', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10250, 'Jira Workflow Designer Plugin', 'com.atlassian.jira.plugins.jira-workflow-designer', '8.0.6', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10251, 'Gadget Dashboard Plugin', 'com.atlassian.gadgets.dashboard', '4.3.9', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10252, 'Atlassian - Administration - Quick Search - JIRA', 'com.atlassian.administration.atlassian-admin-quicksearch-jira', '2.3.3', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10253, 'Web Panel Plugin', 'jira.webpanels', '1.0', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10254, 'Applinks - Plugin - OAuth', 'com.atlassian.applinks.applinks-oauth-plugin', '6.0.3', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10255, 'JIRA browser metrics integration plugin', 'com.atlassian.jira.plugins.jira-browser-metrics', '2.0.14', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10256, 'JIRA Activity Stream Plugin', 'com.atlassian.streams.streams-jira-plugin', '8.1.1', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10257, 'English (United Kingdom) Language Pack', 'com.atlassian.jira.jira-languages.en_UK', '8.0.2', '2019-03-07 22:10:52');
INSERT INTO `pluginversion` VALUES (10258, 'JIRA Usage Hints', 'jira.usage.hints', '1.0', '2019-03-07 22:10:52');

-- ----------------------------
-- Table structure for portalpage
-- ----------------------------
DROP TABLE IF EXISTS `portalpage`;
CREATE TABLE `portalpage`  (
  `ID` decimal(18, 0) NOT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PAGENAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SEQUENCE` decimal(18, 0) NULL DEFAULT NULL,
  `FAV_COUNT` decimal(18, 0) NULL DEFAULT NULL,
  `LAYOUT` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ppversion` decimal(18, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `ppage_username`(`USERNAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of portalpage
-- ----------------------------
INSERT INTO `portalpage` VALUES (10000, NULL, 'System Dashboard', NULL, 0, 0, 'AA', 0);

-- ----------------------------
-- Table structure for portletconfiguration
-- ----------------------------
DROP TABLE IF EXISTS `portletconfiguration`;
CREATE TABLE `portletconfiguration`  (
  `ID` decimal(18, 0) NOT NULL,
  `PORTALPAGE` decimal(18, 0) NULL DEFAULT NULL,
  `PORTLET_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COLUMN_NUMBER` decimal(9, 0) NULL DEFAULT NULL,
  `positionseq` decimal(9, 0) NULL DEFAULT NULL,
  `GADGET_XML` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `COLOR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DASHBOARD_MODULE_COMPLETE_KEY` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of portletconfiguration
-- ----------------------------
INSERT INTO `portletconfiguration` VALUES (10000, 10000, NULL, 0, 0, NULL, NULL, 'com.atlassian.jira.gadgets:introduction-dashboard-item');
INSERT INTO `portletconfiguration` VALUES (10002, 10000, NULL, 1, 0, 'rest/gadgets/1.0/g/com.atlassian.jira.gadgets:assigned-to-me-gadget/gadgets/assigned-to-me-gadget.xml', NULL, NULL);
INSERT INTO `portletconfiguration` VALUES (10003, 10000, NULL, 1, 1, 'rest/gadgets/1.0/g/com.atlassian.streams.streams-jira-plugin:activitystream-gadget/gadgets/activitystream-gadget.xml', NULL, NULL);

-- ----------------------------
-- Table structure for priority
-- ----------------------------
DROP TABLE IF EXISTS `priority`;
CREATE TABLE `priority`  (
  `ID` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SEQUENCE` decimal(18, 0) NULL DEFAULT NULL,
  `pname` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `ICONURL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STATUS_COLOR` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of priority
-- ----------------------------
INSERT INTO `priority` VALUES ('1', 1, 'Highest', 'This problem will block progress.', '/images/icons/priorities/highest.png', '#ff7452');
INSERT INTO `priority` VALUES ('2', 2, 'High', 'Serious problem that could block progress.', '/images/icons/priorities/high.png', '#ff8f73');
INSERT INTO `priority` VALUES ('3', 3, 'Medium', 'Has the potential to affect progress.', '/images/icons/priorities/medium.png', '#ffab00');
INSERT INTO `priority` VALUES ('4', 4, 'Low', 'Minor problem or easily worked around.', '/images/icons/priorities/low.png', '#0065ff');
INSERT INTO `priority` VALUES ('5', 5, 'Lowest', 'Trivial problem with little or no impact on progress.', '/images/icons/priorities/lowest.png', '#2684ff');

-- ----------------------------
-- Table structure for productlicense
-- ----------------------------
DROP TABLE IF EXISTS `productlicense`;
CREATE TABLE `productlicense`  (
  `ID` decimal(18, 0) NOT NULL,
  `LICENSE` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of productlicense
-- ----------------------------
INSERT INTO `productlicense` VALUES (10001, 'AAABfA0ODAoPeNp9kVtPwkAQhd/7K5r4og/b9ELkkjRR2yWpcpMW9MGXtQywpmyb2S3Kv3dpIYJckr5Md+bMd87cJMvS7DM07aZptzr6cz0ziBPTtZ22sUAAscyLAtDq8RSEBDrjiufCp4OEjkfjKKbGoFx9Ag7nEwkofeIYQS4US9WArcBXMl1kRcO7b7ce0iVLy9wSoIwvjsw6GRyVqHskhEyBvyUgtkfslrHbnWwKqESDYb9Px0H02Ns/0Z+C4+ZgrkHs5h6E9hnPLpHEgGvAKPSfXqaUTNy3NvFeu+8k6ba6NWaB+axMlbUtiMzn6pshWFqXr7U/LKFuuxzQmRjPWdGUQoFgIr1g5wrNSZS7PdpXLwpjOiA9x3M9x3Gahq784z9XhGPFUAH6c5ZJMIa4YIJLVjncgI4xNwKEqv5/tKwmmGqgbbd7FANop1ggl7sEQ5Ap8qLSfdYAZrwDMG/rA919dEy6ZllZ7aqJL53gXLiHyw/n/jTr+heYvAvHMC0CFF/Ew6MvyBcVN7BwCKZ3QLxaEsmWAhUAhF203hvA03mwQZfMdd1EN6rkWRM=X02ii');

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project`  (
  `ID` decimal(18, 0) NOT NULL,
  `pname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LEAD` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `pkey` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `pcounter` decimal(18, 0) NULL DEFAULT NULL,
  `ASSIGNEETYPE` decimal(18, 0) NULL DEFAULT NULL,
  `AVATAR` decimal(18, 0) NULL DEFAULT NULL,
  `ORIGINALKEY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PROJECTTYPE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `idx_project_key`(`pkey`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for project_key
-- ----------------------------
DROP TABLE IF EXISTS `project_key`;
CREATE TABLE `project_key`  (
  `ID` decimal(18, 0) NOT NULL,
  `PROJECT_ID` decimal(18, 0) NULL DEFAULT NULL,
  `PROJECT_KEY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `idx_all_project_keys`(`PROJECT_KEY`) USING BTREE,
  INDEX `idx_all_project_ids`(`PROJECT_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for projectcategory
-- ----------------------------
DROP TABLE IF EXISTS `projectcategory`;
CREATE TABLE `projectcategory`  (
  `ID` decimal(18, 0) NOT NULL,
  `cname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `idx_project_category_name`(`cname`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for projectchangedtime
-- ----------------------------
DROP TABLE IF EXISTS `projectchangedtime`;
CREATE TABLE `projectchangedtime`  (
  `PROJECT_ID` decimal(18, 0) NOT NULL,
  `ISSUE_CHANGED_TIME` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`PROJECT_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for projectrole
-- ----------------------------
DROP TABLE IF EXISTS `projectrole`;
CREATE TABLE `projectrole`  (
  `ID` decimal(18, 0) NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of projectrole
-- ----------------------------
INSERT INTO `projectrole` VALUES (10002, 'Administrators', 'A project role that represents administrators in a project');

-- ----------------------------
-- Table structure for projectroleactor
-- ----------------------------
DROP TABLE IF EXISTS `projectroleactor`;
CREATE TABLE `projectroleactor`  (
  `ID` decimal(18, 0) NOT NULL,
  `PID` decimal(18, 0) NULL DEFAULT NULL,
  `PROJECTROLEID` decimal(18, 0) NULL DEFAULT NULL,
  `ROLETYPE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ROLETYPEPARAMETER` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `role_player_idx`(`PROJECTROLEID`, `PID`) USING BTREE,
  INDEX `role_pid_idx`(`PID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of projectroleactor
-- ----------------------------
INSERT INTO `projectroleactor` VALUES (10002, NULL, 10002, 'atlassian-group-role-actor', 'jira-administrators');

-- ----------------------------
-- Table structure for projectversion
-- ----------------------------
DROP TABLE IF EXISTS `projectversion`;
CREATE TABLE `projectversion`  (
  `ID` decimal(18, 0) NOT NULL,
  `PROJECT` decimal(18, 0) NULL DEFAULT NULL,
  `vname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `SEQUENCE` decimal(18, 0) NULL DEFAULT NULL,
  `RELEASED` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ARCHIVED` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STARTDATE` datetime(0) NULL DEFAULT NULL,
  `RELEASEDATE` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `idx_version_project`(`PROJECT`) USING BTREE,
  INDEX `idx_version_sequence`(`SEQUENCE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for propertydata
-- ----------------------------
DROP TABLE IF EXISTS `propertydata`;
CREATE TABLE `propertydata`  (
  `ID` decimal(18, 0) NOT NULL,
  `propertyvalue` blob NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for propertydate
-- ----------------------------
DROP TABLE IF EXISTS `propertydate`;
CREATE TABLE `propertydate`  (
  `ID` decimal(18, 0) NOT NULL,
  `propertyvalue` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of propertydate
-- ----------------------------
INSERT INTO `propertydate` VALUES (10351, '2019-03-07 22:34:15');

-- ----------------------------
-- Table structure for propertydecimal
-- ----------------------------
DROP TABLE IF EXISTS `propertydecimal`;
CREATE TABLE `propertydecimal`  (
  `ID` decimal(18, 0) NOT NULL,
  `propertyvalue` decimal(18, 6) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for propertyentry
-- ----------------------------
DROP TABLE IF EXISTS `propertyentry`;
CREATE TABLE `propertyentry`  (
  `ID` decimal(18, 0) NOT NULL,
  `ENTITY_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ENTITY_ID` decimal(18, 0) NULL DEFAULT NULL,
  `PROPERTY_KEY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `propertytype` decimal(9, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `osproperty_entId_name_propKey`(`ENTITY_ID`, `ENTITY_NAME`, `PROPERTY_KEY`) USING BTREE,
  INDEX `osproperty_propertyKey`(`PROPERTY_KEY`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of propertyentry
-- ----------------------------
INSERT INTO `propertyentry` VALUES (1, 'jira.properties', 1, 'jira.version.patched', 5);
INSERT INTO `propertyentry` VALUES (2, 'jira.properties', 1, 'jira.avatar.issuetype.subtask.default.id', 5);
INSERT INTO `propertyentry` VALUES (3, 'jira.properties', 1, 'jira.avatar.default.id', 5);
INSERT INTO `propertyentry` VALUES (4, 'jira.properties', 1, 'jira.avatar.issuetype.default.id', 5);
INSERT INTO `propertyentry` VALUES (5, 'jira.properties', 1, 'jira.avatar.user.default.id', 5);
INSERT INTO `propertyentry` VALUES (6, 'jira.properties', 1, 'jira.avatar.user.anonymous.id', 5);
INSERT INTO `propertyentry` VALUES (7, 'jira.properties', 1, 'jira.scheme.default.issue.type', 5);
INSERT INTO `propertyentry` VALUES (9, 'jira.properties', 1, 'jira.whitelist.disabled', 1);
INSERT INTO `propertyentry` VALUES (10, 'jira.properties', 1, 'jira.whitelist.rules', 6);
INSERT INTO `propertyentry` VALUES (11, 'jira.properties', 1, 'jira.option.timetracking', 1);
INSERT INTO `propertyentry` VALUES (12, 'jira.properties', 1, 'jira.timetracking.estimates.legacy.behaviour', 1);
INSERT INTO `propertyentry` VALUES (13, 'jira.properties', 1, 'jira.version', 5);
INSERT INTO `propertyentry` VALUES (14, 'jira.properties', 1, 'jira.downgrade.minimum.version', 5);
INSERT INTO `propertyentry` VALUES (15, 'jira.properties', 1, 'jira.option.allowunassigned', 1);
INSERT INTO `propertyentry` VALUES (16, 'jira.properties', 1, 'jira.path.index.use.default.directory', 1);
INSERT INTO `propertyentry` VALUES (21, 'com.atlassian.jira.plugins.jira-workflow-designer', 1, 'jira.workflow.layout:8a6044147cf2c19c02d099279cfbfd47', 6);
INSERT INTO `propertyentry` VALUES (22, 'jira.properties', 1, 'jira.onboarding.app_user.id.threshold', 5);
INSERT INTO `propertyentry` VALUES (23, 'jira.properties', 1, 'post.migration.page.displayed', 1);
INSERT INTO `propertyentry` VALUES (10100, 'jira.properties', 1, 'jira.webresource.superbatch.flushcounter', 5);
INSERT INTO `propertyentry` VALUES (10101, 'jira.properties', 1, 'jira.i18n.language.index', 5);
INSERT INTO `propertyentry` VALUES (10102, 'jira.properties', 1, 'jira.sid.key', 5);
INSERT INTO `propertyentry` VALUES (10103, 'jira.properties', 1, 'AO_550953_#', 5);
INSERT INTO `propertyentry` VALUES (10104, 'jira.properties', 1, 'AO_60DB71_#', 5);
INSERT INTO `propertyentry` VALUES (10105, 'jira.properties', 1, 'jira.scheme.default.priority', 5);
INSERT INTO `propertyentry` VALUES (10108, 'com.atlassian.jira.user.flag.FlagDismissalServiceImpl', 1, 'com.atlassian.jira.flag.resets', 6);
INSERT INTO `propertyentry` VALUES (10200, 'jira.properties', 1, 'jira.webresource.flushcounter', 5);
INSERT INTO `propertyentry` VALUES (10201, 'jira.properties', 1, 'jira.mail.send.disabled', 1);
INSERT INTO `propertyentry` VALUES (10202, 'jira.properties', 1, 'mailsetting.jira.mail.send.disabled.modifiedBy', 5);
INSERT INTO `propertyentry` VALUES (10203, 'jira.properties', 1, 'mailsetting.jira.mail.send.disabled.modifiedDate', 5);
INSERT INTO `propertyentry` VALUES (10204, 'jira.properties', 1, 'jvm.system.timezone', 5);
INSERT INTO `propertyentry` VALUES (10205, 'jira.properties', 1, 'jira.i18n.default.locale', 5);
INSERT INTO `propertyentry` VALUES (10206, 'jira.properties', 1, 'webwork.i18n.encoding', 5);
INSERT INTO `propertyentry` VALUES (10207, 'jira.properties', 1, 'jira.title', 5);
INSERT INTO `propertyentry` VALUES (10208, 'jira.properties', 1, 'AO_587B34_#', 5);
INSERT INTO `propertyentry` VALUES (10209, 'jira.properties', 1, 'AO_E8B6CC_#', 5);
INSERT INTO `propertyentry` VALUES (10210, 'jira.properties', 1, 'dvcs.connector.bitbucket.url', 5);
INSERT INTO `propertyentry` VALUES (10211, 'jira.properties', 1, 'dvcs.connector.github.url', 5);
INSERT INTO `propertyentry` VALUES (10212, 'jira.properties', 1, 'AO_4AEACD_#', 5);
INSERT INTO `propertyentry` VALUES (10213, 'jira.properties', 1, 'jira.baseurl', 5);
INSERT INTO `propertyentry` VALUES (10214, 'jira.properties', 1, 'jira.mode', 5);
INSERT INTO `propertyentry` VALUES (10215, 'jira.properties', 1, 'jira.path.attachments', 5);
INSERT INTO `propertyentry` VALUES (10216, 'jira.properties', 1, 'jira.path.attachments.use.default.directory', 1);
INSERT INTO `propertyentry` VALUES (10217, 'jira.properties', 1, 'jira.option.allowattachments', 1);
INSERT INTO `propertyentry` VALUES (10218, 'ServiceConfig', 10200, 'USE_DEFAULT_DIRECTORY', 5);
INSERT INTO `propertyentry` VALUES (10219, 'jira.properties', 1, 'jira.path.backup', 5);
INSERT INTO `propertyentry` VALUES (10220, 'BambooServerProperties', 1, 'bamboo.config.version', 2);
INSERT INTO `propertyentry` VALUES (10221, 'GreenHopper.Run.History', 1, 'lastRunVersion', 6);
INSERT INTO `propertyentry` VALUES (10222, 'GreenHopper.Run.History', 2, '2019-03-07T22:10:42.250+08:00', 6);
INSERT INTO `propertyentry` VALUES (10223, 'jira.plugin.devstatus.datastorage', 1, 'upgrade.state', 5);
INSERT INTO `propertyentry` VALUES (10227, 'jira.properties', 1, 'com.atlassian.jira.util.index.IndexingCounterManagerImpl.counterValue', 3);
INSERT INTO `propertyentry` VALUES (10228, 'jira.properties', 1, 'jira.monitoring.jmx.enabled', 1);
INSERT INTO `propertyentry` VALUES (10229, 'jira.properties', 1, 'jira.setup', 5);
INSERT INTO `propertyentry` VALUES (10230, 'jira.properties', 1, 'jira.initial.build.number', 5);
INSERT INTO `propertyentry` VALUES (10231, 'jira.properties', 1, 'jira.option.user.externalmanagement', 1);
INSERT INTO `propertyentry` VALUES (10232, 'jira.properties', 1, 'jira.option.voting', 1);
INSERT INTO `propertyentry` VALUES (10233, 'jira.properties', 1, 'jira.option.watching', 1);
INSERT INTO `propertyentry` VALUES (10234, 'jira.properties', 1, 'jira.option.issuelinking', 1);
INSERT INTO `propertyentry` VALUES (10235, 'jira.properties', 1, 'jira.option.emailvisible', 5);
INSERT INTO `propertyentry` VALUES (10300, 'jira.properties', 1, 'jira.option.allowsubtasks', 1);
INSERT INTO `propertyentry` VALUES (10301, 'jira.properties', 1, 'com.atlassian.upm:notifications:notification-plugin.request', 5);
INSERT INTO `propertyentry` VALUES (10302, 'jira.properties', 1, 'com.atlassian.upm:notifications:notification-edition.mismatch', 5);
INSERT INTO `propertyentry` VALUES (10303, 'jira.properties', 1, 'com.atlassian.upm:notifications:notification-evaluation.expired', 5);
INSERT INTO `propertyentry` VALUES (10304, 'jira.properties', 1, 'com.atlassian.upm:notifications:notification-evaluation.nearlyexpired', 5);
INSERT INTO `propertyentry` VALUES (10305, 'jira.properties', 1, 'com.atlassian.upm:notifications:notification-maintenance.expired', 5);
INSERT INTO `propertyentry` VALUES (10306, 'jira.properties', 1, 'com.atlassian.upm:notifications:notification-maintenance.nearlyexpired', 5);
INSERT INTO `propertyentry` VALUES (10307, 'jira.properties', 1, 'com.atlassian.upm:notifications:notification-license.expired', 5);
INSERT INTO `propertyentry` VALUES (10308, 'jira.properties', 1, 'com.atlassian.upm:notifications:notification-license.nearlyexpired', 5);
INSERT INTO `propertyentry` VALUES (10309, 'jira.properties', 1, 'com.atlassian.upm.log.PluginSettingsAuditLogService:log:upm_audit_log_v3', 6);
INSERT INTO `propertyentry` VALUES (10310, 'jira.properties', 1, 'com.atlassian.analytics.client.configuration..policy_acknowledged', 5);
INSERT INTO `propertyentry` VALUES (10311, 'jira.properties', 1, 'com.atlassian.sal.jira:build', 5);
INSERT INTO `propertyentry` VALUES (10312, 'jira.properties', 1, 'com.atlassian.plugins.atlassian-whitelist-api-plugin:whitelist.enabled', 5);
INSERT INTO `propertyentry` VALUES (10313, 'jira.properties', 1, 'com.atlassian.jira.gadgets:build', 5);
INSERT INTO `propertyentry` VALUES (10314, 'jira.properties', 1, 'com.atlassian.jira.plugins.jira-bitbucket-connector-plugin:build', 5);
INSERT INTO `propertyentry` VALUES (10315, 'GreenHopper.UpgradeHistory', 1, '2019-03-07T22:34:01.574+08:00', 6);
INSERT INTO `propertyentry` VALUES (10316, 'GreenHopper.UpgradeHistory', 2, '2019-03-07T22:34:01.639+08:00', 6);
INSERT INTO `propertyentry` VALUES (10317, 'GreenHopper.properties', 1, 'GreenHopper.Upgrade.Latest.Upgraded.Version', 3);
INSERT INTO `propertyentry` VALUES (10318, 'jira.properties', 1, 'com.pyxis.greenhopper.jira:build', 5);
INSERT INTO `propertyentry` VALUES (10319, 'GreenHopper.UpgradeHistory', 1, '2019-03-07T22:34:01.663+08:00', 6);
INSERT INTO `propertyentry` VALUES (10320, 'GreenHopper.UpgradeHistory', 2, '2019-03-07T22:34:01.735+08:00', 6);
INSERT INTO `propertyentry` VALUES (10321, 'GreenHopper.UpgradeHistory', 1, '2019-03-07T22:34:01.759+08:00', 6);
INSERT INTO `propertyentry` VALUES (10322, 'GreenHopper.UpgradeHistory', 2, '2019-03-07T22:34:01.776+08:00', 6);
INSERT INTO `propertyentry` VALUES (10323, 'GreenHopper.UpgradeHistory', 1, '2019-03-07T22:34:01.805+08:00', 6);
INSERT INTO `propertyentry` VALUES (10324, 'GreenHopper.UpgradeHistory', 2, '2019-03-07T22:34:02.151+08:00', 6);
INSERT INTO `propertyentry` VALUES (10325, 'GreenHopper.UpgradeHistory', 1, '2019-03-07T22:34:02.194+08:00', 6);
INSERT INTO `propertyentry` VALUES (10326, 'GreenHopper.UpgradeHistory', 2, '2019-03-07T22:34:02.284+08:00', 6);
INSERT INTO `propertyentry` VALUES (10327, 'GreenHopper.UpgradeHistory', 1, '2019-03-07T22:34:02.341+08:00', 6);
INSERT INTO `propertyentry` VALUES (10328, 'GreenHopper.UpgradeHistory', 2, '2019-03-07T22:34:02.356+08:00', 6);
INSERT INTO `propertyentry` VALUES (10329, 'jira.properties', 1, 'com.atlassian.crowd.embedded.admin:build', 5);
INSERT INTO `propertyentry` VALUES (10330, 'jira.properties', 1, 'com.atlassian.labs.hipchat.hipchat-for-jira-plugin:build', 5);
INSERT INTO `propertyentry` VALUES (10331, 'jira.properties', 1, 'com.atlassian.plugins.atlassian-whitelist-core-plugin:build', 5);
INSERT INTO `propertyentry` VALUES (10332, 'jira.properties', 1, 'com.atlassian.jira.plugin.ext.bamboo:build', 5);
INSERT INTO `propertyentry` VALUES (10333, 'jira.properties', 1, 'com.atlassian.jira.jira-mail-plugin:build', 5);
INSERT INTO `propertyentry` VALUES (10334, 'jira.properties', 1, 'com.atlassian.plugins.custom_apps.hasCustomOrder', 5);
INSERT INTO `propertyentry` VALUES (10335, 'jira.properties', 1, 'com.atlassian.plugins.atlassian-nav-links-plugin:build', 5);
INSERT INTO `propertyentry` VALUES (10336, 'jira.properties', 1, 'com.atlassian.jira.plugins.jira-workflow-designer:build', 5);
INSERT INTO `propertyentry` VALUES (10337, 'jira.properties', 1, 'com.atlassian.jira.plugins.webhooks.jira-webhooks-plugin:build', 5);
INSERT INTO `propertyentry` VALUES (10338, 'jira.properties', 1, 'com.atlassian.jirawallboard.atlassian-wallboard-plugin:build', 5);
INSERT INTO `propertyentry` VALUES (10339, 'jira.properties', 1, 'com.atlassian.upm.atlassian-universal-plugin-manager-plugin:build', 5);
INSERT INTO `propertyentry` VALUES (10340, 'jira.properties', 1, 'com.atlassian.jira.lookandfeel:isDefaultFavicon', 5);
INSERT INTO `propertyentry` VALUES (10341, 'jira.properties', 1, 'com.atlassian.jira.lookandfeel:usingCustomFavicon', 5);
INSERT INTO `propertyentry` VALUES (10342, 'jira.properties', 1, 'com.atlassian.jira.lookandfeel:customDefaultFaviconURL', 5);
INSERT INTO `propertyentry` VALUES (10343, 'jira.properties', 1, 'com.atlassian.jira.lookandfeel:customDefaultFaviconHiresURL', 5);
INSERT INTO `propertyentry` VALUES (10344, 'jira.properties', 1, 'com.atlassian.jira.lookandfeel:faviconWidth', 5);
INSERT INTO `propertyentry` VALUES (10345, 'jira.properties', 1, 'com.atlassian.jira.lookandfeel:faviconHeight', 5);
INSERT INTO `propertyentry` VALUES (10346, 'jira.properties', 1, 'com.atlassian.jira.lookandfeel:build', 5);
INSERT INTO `propertyentry` VALUES (10347, 'jira.properties', 1, 'com.atlassian.jira.project-templates-plugin:build', 5);
INSERT INTO `propertyentry` VALUES (10348, 'GreenHopper.properties', 1, 'GreenHopper.LexoRank.Default.customfield.id', 3);
INSERT INTO `propertyentry` VALUES (10349, 'GreenHopper.properties', 1, 'GreenHopper.EpicLink.Default.customfield.id', 3);
INSERT INTO `propertyentry` VALUES (10350, 'admin.message.manager', 1, 'user', 5);
INSERT INTO `propertyentry` VALUES (10351, 'admin.message.manager', 1, 'time', 7);
INSERT INTO `propertyentry` VALUES (10352, 'admin.message.manager', 1, 'task', 5);
INSERT INTO `propertyentry` VALUES (10353, 'GreenHopper.properties', 1, 'GreenHopper.EpicStatus.Default.customfield.id', 3);
INSERT INTO `propertyentry` VALUES (10354, 'GreenHopper.properties', 1, 'GreenHopper.EpicLabel.Default.customfield.id', 3);
INSERT INTO `propertyentry` VALUES (10355, 'GreenHopper.properties', 1, 'GreenHopper.EpicColor.Default.customfield.id', 3);
INSERT INTO `propertyentry` VALUES (10356, 'GreenHopper.properties', 1, 'GreenHopper.Sprint.Default.customfield.id', 3);
INSERT INTO `propertyentry` VALUES (10357, 'GreenHopper.properties', 1, 'GreenHopper.Sprint.Index.Check.Necessary', 5);
INSERT INTO `propertyentry` VALUES (10358, 'GreenHopper.properties', 1, 'GreenHopper.JIRA60.Version.Migration', 1);
INSERT INTO `propertyentry` VALUES (10359, 'GreenHopper.properties', 1, 'JIRA.Software.Simplified.Workflow.Upgraded', 1);
INSERT INTO `propertyentry` VALUES (10360, 'GreenHopper.properties', 1, 'GreenHopper.Epic.Default.issuetype.id', 5);
INSERT INTO `propertyentry` VALUES (10361, 'GreenHopper.properties', 1, 'GreenHopper.Story.Default.issuetype.id', 5);
INSERT INTO `propertyentry` VALUES (10362, 'GreenHopper.properties', 1, 'GreenHopper.StoryPoints.Default.customfield.id', 3);
INSERT INTO `propertyentry` VALUES (10363, 'GreenHopper.properties', 1, 'GreenHopper.Epic.Default.linktype.id', 3);
INSERT INTO `propertyentry` VALUES (10364, 'jira.properties', 1, 'com.atlassian.analytics.client.configuration..analytics_enabled', 5);
INSERT INTO `propertyentry` VALUES (10365, 'jira.properties', 1, 'com.atlassian.streams.InlineActivityStream:loaded.from.jira.projects', 5);
INSERT INTO `propertyentry` VALUES (10366, 'jira.properties', 1, 'com.atlassian.analytics.client.configuration.uuid', 5);
INSERT INTO `propertyentry` VALUES (10367, 'jira.properties', 1, 'com.atlassian.analytics.client.configuration.serverid', 5);
INSERT INTO `propertyentry` VALUES (10368, 'jira.properties', 1, 'jira-header-plugin.studio-tab-migration-complete', 5);
INSERT INTO `propertyentry` VALUES (10369, 'fisheye-jira-plugin.properties', 1, 'Upgrade Conditions Applied', 5);
INSERT INTO `propertyentry` VALUES (10370, 'fisheye-jira-plugin.properties', 1, 'FISH-375-fixed', 5);
INSERT INTO `propertyentry` VALUES (10371, 'fisheye-jira-plugin.properties', 1, 'fisheye.ual.migration.complete', 5);
INSERT INTO `propertyentry` VALUES (10372, 'fisheye-jira-plugin.properties', 1, 'fisheye.ual.crucible.enabled.property.fix.complete', 5);
INSERT INTO `propertyentry` VALUES (10373, 'fisheye-jira-plugin.properties', 1, 'Perforce Update Applied', 5);
INSERT INTO `propertyentry` VALUES (10374, 'jira.properties', 1, 'com.atlassian.analytics.client.configuration..logged_base_analytics_data', 5);
INSERT INTO `propertyentry` VALUES (10375, 'jira.properties', 1, 'com.atlassian.upm:notifications:notification-update', 5);
INSERT INTO `propertyentry` VALUES (10376, 'ApplicationUser', 10000, 'com.atlassian.jira.flag.dismissals', 6);
INSERT INTO `propertyentry` VALUES (10377, 'jira.properties', 1, 'com.atlassian.jira.onboarding.postsetup.AppPropertiesPostSetupAnnouncementStore.all', 6);
INSERT INTO `propertyentry` VALUES (10378, 'ApplicationUser', 10000, 'jira.onboarding.first.use.flow.started', 5);
INSERT INTO `propertyentry` VALUES (10379, 'ApplicationUser', 10000, 'newsletter.signup.first.view', 3);
INSERT INTO `propertyentry` VALUES (10380, 'ApplicationUser', 10000, 'jira.onboarding.first.use.flow.current.sequence', 5);
INSERT INTO `propertyentry` VALUES (10381, 'ApplicationUser', 10000, 'jira.user.suppressedTips.qs-onboarding-tip', 1);
INSERT INTO `propertyentry` VALUES (10382, 'user.format.mapping', 1, 'fullName', 5);
INSERT INTO `propertyentry` VALUES (10383, 'ApplicationUser', 10000, 'jira.user.suppressedTips.add.new.users', 1);
INSERT INTO `propertyentry` VALUES (10384, 'user.format.mapping', 1, 'profileLink', 5);
INSERT INTO `propertyentry` VALUES (10400, 'ApplicationUser', 10000, 'jira.onboarding.first.use.flow.completed', 1);

-- ----------------------------
-- Table structure for propertynumber
-- ----------------------------
DROP TABLE IF EXISTS `propertynumber`;
CREATE TABLE `propertynumber`  (
  `ID` decimal(18, 0) NOT NULL,
  `propertyvalue` decimal(18, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of propertynumber
-- ----------------------------
INSERT INTO `propertynumber` VALUES (9, 0);
INSERT INTO `propertynumber` VALUES (11, 1);
INSERT INTO `propertynumber` VALUES (12, 0);
INSERT INTO `propertynumber` VALUES (15, 1);
INSERT INTO `propertynumber` VALUES (16, 1);
INSERT INTO `propertynumber` VALUES (23, 1);
INSERT INTO `propertynumber` VALUES (10201, 0);
INSERT INTO `propertynumber` VALUES (10216, 1);
INSERT INTO `propertynumber` VALUES (10217, 1);
INSERT INTO `propertynumber` VALUES (10220, 22);
INSERT INTO `propertynumber` VALUES (10227, 1);
INSERT INTO `propertynumber` VALUES (10228, 0);
INSERT INTO `propertynumber` VALUES (10231, 0);
INSERT INTO `propertynumber` VALUES (10232, 1);
INSERT INTO `propertynumber` VALUES (10233, 1);
INSERT INTO `propertynumber` VALUES (10234, 1);
INSERT INTO `propertynumber` VALUES (10300, 1);
INSERT INTO `propertynumber` VALUES (10317, 51);
INSERT INTO `propertynumber` VALUES (10348, 10100);
INSERT INTO `propertynumber` VALUES (10349, 10101);
INSERT INTO `propertynumber` VALUES (10353, 10102);
INSERT INTO `propertynumber` VALUES (10354, 10103);
INSERT INTO `propertynumber` VALUES (10355, 10104);
INSERT INTO `propertynumber` VALUES (10356, 10105);
INSERT INTO `propertynumber` VALUES (10358, 1);
INSERT INTO `propertynumber` VALUES (10359, 1);
INSERT INTO `propertynumber` VALUES (10362, 10106);
INSERT INTO `propertynumber` VALUES (10363, 10200);
INSERT INTO `propertynumber` VALUES (10379, 1551969325695);
INSERT INTO `propertynumber` VALUES (10381, 1);
INSERT INTO `propertynumber` VALUES (10383, 1);
INSERT INTO `propertynumber` VALUES (10400, 1);

-- ----------------------------
-- Table structure for propertystring
-- ----------------------------
DROP TABLE IF EXISTS `propertystring`;
CREATE TABLE `propertystring`  (
  `ID` decimal(18, 0) NOT NULL,
  `propertyvalue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of propertystring
-- ----------------------------
INSERT INTO `propertystring` VALUES (1, '800010');
INSERT INTO `propertystring` VALUES (2, '10316');
INSERT INTO `propertystring` VALUES (3, '10011');
INSERT INTO `propertystring` VALUES (4, '10300');
INSERT INTO `propertystring` VALUES (5, '10122');
INSERT INTO `propertystring` VALUES (6, '10123');
INSERT INTO `propertystring` VALUES (7, '10000');
INSERT INTO `propertystring` VALUES (13, '8.0.2');
INSERT INTO `propertystring` VALUES (14, '7.1.2');
INSERT INTO `propertystring` VALUES (22, '0');
INSERT INTO `propertystring` VALUES (10100, '3');
INSERT INTO `propertystring` VALUES (10101, 'english-moderate-stemming');
INSERT INTO `propertystring` VALUES (10102, 'BKVE-U2W9-3QFX-TF8F');
INSERT INTO `propertystring` VALUES (10103, '1');
INSERT INTO `propertystring` VALUES (10104, '1');
INSERT INTO `propertystring` VALUES (10105, '10100');
INSERT INTO `propertystring` VALUES (10200, '6411e0087192541a09d88223fb51a6a0');
INSERT INTO `propertystring` VALUES (10202, '');
INSERT INTO `propertystring` VALUES (10203, '1551967394866');
INSERT INTO `propertystring` VALUES (10204, 'Asia/Shanghai');
INSERT INTO `propertystring` VALUES (10205, 'zh_CN');
INSERT INTO `propertystring` VALUES (10206, 'UTF-8');
INSERT INTO `propertystring` VALUES (10207, 'Jira');
INSERT INTO `propertystring` VALUES (10208, '4');
INSERT INTO `propertystring` VALUES (10209, '16');
INSERT INTO `propertystring` VALUES (10210, 'https://bitbucket.org');
INSERT INTO `propertystring` VALUES (10211, 'https://github.com');
INSERT INTO `propertystring` VALUES (10212, '1');
INSERT INTO `propertystring` VALUES (10213, 'http://localhost:8080');
INSERT INTO `propertystring` VALUES (10214, 'private');
INSERT INTO `propertystring` VALUES (10215, 'C:\\Program Files\\Atlassian\\Application Data\\JIRA\\data\\attachments');
INSERT INTO `propertystring` VALUES (10218, 'true');
INSERT INTO `propertystring` VALUES (10219, 'C:\\Program Files\\Atlassian\\Application Data\\JIRA\\export');
INSERT INTO `propertystring` VALUES (10223, 'UPGRADED');
INSERT INTO `propertystring` VALUES (10229, 'true');
INSERT INTO `propertystring` VALUES (10230, '800010');
INSERT INTO `propertystring` VALUES (10235, 'show');
INSERT INTO `propertystring` VALUES (10301, '#java.util.List\n');
INSERT INTO `propertystring` VALUES (10302, '#java.util.List\n');
INSERT INTO `propertystring` VALUES (10303, '#java.util.List\n');
INSERT INTO `propertystring` VALUES (10304, '#java.util.List\n');
INSERT INTO `propertystring` VALUES (10305, '#java.util.List\n');
INSERT INTO `propertystring` VALUES (10306, '#java.util.List\n');
INSERT INTO `propertystring` VALUES (10307, '#java.util.List\n');
INSERT INTO `propertystring` VALUES (10308, '#java.util.List\n');
INSERT INTO `propertystring` VALUES (10310, 'true');
INSERT INTO `propertystring` VALUES (10311, '2');
INSERT INTO `propertystring` VALUES (10312, 'true');
INSERT INTO `propertystring` VALUES (10313, '1');
INSERT INTO `propertystring` VALUES (10314, '2');
INSERT INTO `propertystring` VALUES (10318, '51');
INSERT INTO `propertystring` VALUES (10329, '3');
INSERT INTO `propertystring` VALUES (10330, '1');
INSERT INTO `propertystring` VALUES (10331, '4');
INSERT INTO `propertystring` VALUES (10332, '1');
INSERT INTO `propertystring` VALUES (10333, '2');
INSERT INTO `propertystring` VALUES (10334, 'false');
INSERT INTO `propertystring` VALUES (10335, '1');
INSERT INTO `propertystring` VALUES (10336, '1');
INSERT INTO `propertystring` VALUES (10337, '3');
INSERT INTO `propertystring` VALUES (10338, '6086');
INSERT INTO `propertystring` VALUES (10339, '5');
INSERT INTO `propertystring` VALUES (10340, 'false');
INSERT INTO `propertystring` VALUES (10341, 'false');
INSERT INTO `propertystring` VALUES (10342, '/favicon.ico');
INSERT INTO `propertystring` VALUES (10343, '/images/64jira.png');
INSERT INTO `propertystring` VALUES (10344, '64');
INSERT INTO `propertystring` VALUES (10345, '64');
INSERT INTO `propertystring` VALUES (10346, '1');
INSERT INTO `propertystring` VALUES (10347, '2001');
INSERT INTO `propertystring` VALUES (10350, '');
INSERT INTO `propertystring` VALUES (10352, 'Story Point Field Creation');
INSERT INTO `propertystring` VALUES (10357, 'true');
INSERT INTO `propertystring` VALUES (10360, '10000');
INSERT INTO `propertystring` VALUES (10361, '10001');
INSERT INTO `propertystring` VALUES (10364, 'true');
INSERT INTO `propertystring` VALUES (10365, 'true');
INSERT INTO `propertystring` VALUES (10366, '13b9cca1-0200-48e3-a220-c2754c0e0f2b');
INSERT INTO `propertystring` VALUES (10367, 'BKVE-U2W9-3QFX-TF8F');
INSERT INTO `propertystring` VALUES (10368, 'migrated');
INSERT INTO `propertystring` VALUES (10369, '1');
INSERT INTO `propertystring` VALUES (10370, '1');
INSERT INTO `propertystring` VALUES (10371, '1');
INSERT INTO `propertystring` VALUES (10372, '1');
INSERT INTO `propertystring` VALUES (10373, '1');
INSERT INTO `propertystring` VALUES (10374, 'true');
INSERT INTO `propertystring` VALUES (10375, '#java.util.List\n');
INSERT INTO `propertystring` VALUES (10378, 'cyoaFirstUseFlow');
INSERT INTO `propertystring` VALUES (10380, 'cyoa:return');
INSERT INTO `propertystring` VALUES (10382, 'jira.user.format:full-name-user-format');
INSERT INTO `propertystring` VALUES (10384, 'jira.user.format:profile-link-user-format');

-- ----------------------------
-- Table structure for propertytext
-- ----------------------------
DROP TABLE IF EXISTS `propertytext`;
CREATE TABLE `propertytext`  (
  `ID` decimal(18, 0) NOT NULL,
  `propertyvalue` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of propertytext
-- ----------------------------
INSERT INTO `propertytext` VALUES (10, 'http://www.atlassian.com/*\n');
INSERT INTO `propertytext` VALUES (21, '{\n    \"edgeMap\": {\n        \"1DEDB66F-FE5C-EDFD-54D0-4D19CDC8CECA\": {\n            \"actionId\": 5,\n            \"allPoints\": [\n                {\n                    \"positiveController\": null,\n                    \"x\": 1806.5,\n                    \"y\": 434.0\n                },\n                {\n                    \"positiveController\": null,\n                    \"x\": 1801.0,\n                    \"y\": 115.0\n                }\n            ],\n            \"controlPoints\": [],\n            \"endNodeId\": \"6DA64EEB-08FE-2870-C90C-4D19CDA2F72D\",\n            \"endPoint\": {\n                \"positiveController\": null,\n                \"x\": 1801.0,\n                \"y\": 115.0\n            },\n            \"endStepId\": 4,\n            \"id\": \"1DEDB66F-FE5C-EDFD-54D0-4D19CDC8CECA\",\n            \"label\": \"Resolve Issue\",\n            \"labelPoint\": {\n                \"positiveController\": null,\n                \"x\": 1776.85,\n                \"y\": 355.25\n            },\n            \"lineType\": \"straight\",\n            \"startNodeId\": \"A8B1A431-AC3A-6DCD-BFF0-4D19CDBCAADB\",\n            \"startPoint\": {\n                \"positiveController\": null,\n                \"x\": 1806.5,\n                \"y\": 434.0\n            },\n            \"startStepId\": 5\n        },\n        \"3DF7CEC8-9FBC-C0D0-AFB1-4D19CE6EA230\": {\n            \"actionId\": 2,\n            \"allPoints\": [\n                {\n                    \"positiveController\": null,\n                    \"x\": 1469.5,\n                    \"y\": 113.0\n                },\n                {\n                    \"positiveController\": null,\n                    \"x\": 1614.0,\n                    \"y\": 226.0\n                }\n            ],\n            \"controlPoints\": [],\n            \"endNodeId\": \"1C846CFB-4F0D-2F40-D0AE-4D19CDAF5D34\",\n            \"endPoint\": {\n                \"positiveController\": null,\n                \"x\": 1614.0,\n                \"y\": 226.0\n            },\n            \"endStepId\": 6,\n            \"id\": \"3DF7CEC8-9FBC-C0D0-AFB1-4D19CE6EA230\",\n            \"label\": \"Close Issue\",\n            \"labelPoint\": {\n                \"positiveController\": null,\n                \"x\": 1492.25,\n                \"y\": 154.25\n            },\n            \"lineType\": \"straight\",\n            \"startNodeId\": \"778534F4-7595-88B6-45E1-4D19CD518712\",\n            \"startPoint\": {\n                \"positiveController\": null,\n                \"x\": 1469.5,\n                \"y\": 113.0\n            },\n            \"startStepId\": 1\n        },\n        \"483797F1-1BF4-5E0F-86C6-4D19CE6023A2\": {\n            \"actionId\": 5,\n            \"allPoints\": [\n                {\n                    \"positiveController\": null,\n                    \"x\": 1469.5,\n                    \"y\": 113.0\n                },\n                {\n                    \"positiveController\": null,\n                    \"x\": 1763.0,\n                    \"y\": 113.0\n                }\n            ],\n            \"controlPoints\": [],\n            \"endNodeId\": \"6DA64EEB-08FE-2870-C90C-4D19CDA2F72D\",\n            \"endPoint\": {\n                \"positiveController\": null,\n                \"x\": 1763.0,\n                \"y\": 113.0\n            },\n            \"endStepId\": 4,\n            \"id\": \"483797F1-1BF4-5E0F-86C6-4D19CE6023A2\",\n            \"label\": \"Resolve Issue\",\n            \"labelPoint\": {\n                \"positiveController\": null,\n                \"x\": 1551.0,\n                \"y\": 104.0\n            },\n            \"lineType\": \"straight\",\n            \"startNodeId\": \"778534F4-7595-88B6-45E1-4D19CD518712\",\n            \"startPoint\": {\n                \"positiveController\": null,\n                \"x\": 1469.5,\n                \"y\": 113.0\n            },\n            \"startStepId\": 1\n        },\n        \"517D7F32-20FB-309E-8639-4D19CE2ACB54\": {\n            \"actionId\": 5,\n            \"allPoints\": [\n                {\n                    \"positiveController\": null,\n                    \"x\": 1434.0,\n                    \"y\": 435.0\n                },\n                {\n                    \"positiveController\": {\n                        \"positiveController\": null,\n                        \"x\": 0.0,\n                        \"y\": 0.0\n                    },\n                    \"x\": 1435.0,\n                    \"y\": 490.0\n                },\n                {\n                    \"positiveController\": {\n                        \"positiveController\": null,\n                        \"x\": 0.0,\n                        \"y\": 0.0\n                    },\n                    \"x\": 1947.0,\n                    \"y\": 494.0\n                },\n                {\n                    \"positiveController\": {\n                        \"positiveController\": null,\n                        \"x\": 0.0,\n                        \"y\": 0.0\n                    },\n                    \"x\": 1950.0,\n                    \"y\": 118.0\n                },\n                {\n                    \"positiveController\": null,\n                    \"x\": 1763.0,\n                    \"y\": 113.0\n                }\n            ],\n            \"controlPoints\": [\n                {\n                    \"positiveController\": {\n                        \"positiveController\": null,\n                        \"x\": 0.0,\n                        \"y\": 0.0\n                    },\n                    \"x\": 1435.0,\n                    \"y\": 490.0\n                },\n                {\n                    \"positiveController\": {\n                        \"positiveController\": null,\n                        \"x\": 0.0,\n                        \"y\": 0.0\n                    },\n                    \"x\": 1947.0,\n                    \"y\": 494.0\n                },\n                {\n                    \"positiveController\": {\n                        \"positiveController\": null,\n                        \"x\": 0.0,\n                        \"y\": 0.0\n                    },\n                    \"x\": 1950.0,\n                    \"y\": 118.0\n                }\n            ],\n            \"endNodeId\": \"6DA64EEB-08FE-2870-C90C-4D19CDA2F72D\",\n            \"endPoint\": {\n                \"positiveController\": null,\n                \"x\": 1763.0,\n                \"y\": 113.0\n            },\n            \"endStepId\": 4,\n            \"id\": \"517D7F32-20FB-309E-8639-4D19CE2ACB54\",\n            \"label\": \"Resolve Issue\",\n            \"labelPoint\": {\n                \"positiveController\": null,\n                \"x\": 1631.25,\n                \"y\": 479.5\n            },\n            \"lineType\": \"poly\",\n            \"startNodeId\": \"0740FFFA-2AA1-C90A-38ED-4D19CD61899B\",\n            \"startPoint\": {\n                \"positiveController\": null,\n                \"x\": 1434.0,\n                \"y\": 435.0\n            },\n            \"startStepId\": 3\n        },\n        \"58BD4605-5FB9-84EA-6952-4D19CE7B454B\": {\n            \"actionId\": 1,\n            \"allPoints\": [\n                {\n                    \"positiveController\": null,\n                    \"x\": 1470.0,\n                    \"y\": 16.0\n                },\n                {\n                    \"positiveController\": null,\n                    \"x\": 1469.5,\n                    \"y\": 113.0\n                }\n            ],\n            \"controlPoints\": [],\n            \"endNodeId\": \"778534F4-7595-88B6-45E1-4D19CD518712\",\n            \"endPoint\": {\n                \"positiveController\": null,\n                \"x\": 1469.5,\n                \"y\": 113.0\n            },\n            \"endStepId\": 1,\n            \"id\": \"58BD4605-5FB9-84EA-6952-4D19CE7B454B\",\n            \"label\": \"Create Issue\",\n            \"labelPoint\": {\n                \"positiveController\": null,\n                \"x\": 1475.5,\n                \"y\": 48.5\n            },\n            \"lineType\": \"straight\",\n            \"startNodeId\": \"15174530-AE75-04E0-1D9D-4D19CD200835\",\n            \"startPoint\": {\n                \"positiveController\": null,\n                \"x\": 1470.0,\n                \"y\": 16.0\n            },\n            \"startStepId\": 1\n        },\n        \"92D3DEFD-13AC-06A7-E5D8-4D19CE537791\": {\n            \"actionId\": 4,\n            \"allPoints\": [\n                {\n                    \"positiveController\": null,\n                    \"x\": 1439.5,\n                    \"y\": 116.0\n                },\n                {\n                    \"positiveController\": {\n                        \"positiveController\": null,\n                        \"x\": 0.0,\n                        \"y\": 0.0\n                    },\n                    \"x\": 1393.0,\n                    \"y\": 116.0\n                },\n                {\n                    \"positiveController\": null,\n                    \"x\": 1390.0,\n                    \"y\": 434.0\n                }\n            ],\n            \"controlPoints\": [\n                {\n                    \"positiveController\": {\n                        \"positiveController\": null,\n                        \"x\": 0.0,\n                        \"y\": 0.0\n                    },\n                    \"x\": 1393.0,\n                    \"y\": 116.0\n                }\n            ],\n            \"endNodeId\": \"0740FFFA-2AA1-C90A-38ED-4D19CD61899B\",\n            \"endPoint\": {\n                \"positiveController\": null,\n                \"x\": 1390.0,\n                \"y\": 434.0\n            },\n            \"endStepId\": 3,\n            \"id\": \"92D3DEFD-13AC-06A7-E5D8-4D19CE537791\",\n            \"label\": \"Start Progress\",\n            \"labelPoint\": {\n                \"positiveController\": null,\n                \"x\": 1323.65,\n                \"y\": 193.75\n            },\n            \"lineType\": \"poly\",\n            \"startNodeId\": \"778534F4-7595-88B6-45E1-4D19CD518712\",\n            \"startPoint\": {\n                \"positiveController\": null,\n                \"x\": 1439.5,\n                \"y\": 116.0\n            },\n            \"startStepId\": 1\n        },\n        \"C049EE11-C5BB-F93B-36C3-4D19CDF12B8F\": {\n            \"actionId\": 3,\n            \"allPoints\": [\n                {\n                    \"positiveController\": null,\n                    \"x\": 1677.0,\n                    \"y\": 227.0\n                },\n                {\n                    \"positiveController\": {\n                        \"positiveController\": null,\n                        \"x\": 0.0,\n                        \"y\": 0.0\n                    },\n                    \"x\": 1767.05,\n                    \"y\": 230.05\n                },\n                {\n                    \"positiveController\": null,\n                    \"x\": 1773.5,\n                    \"y\": 425.0\n                }\n            ],\n            \"controlPoints\": [\n                {\n                    \"positiveController\": {\n                        \"positiveController\": null,\n                        \"x\": 0.0,\n                        \"y\": 0.0\n                    },\n                    \"x\": 1767.05,\n                    \"y\": 230.05\n                }\n            ],\n            \"endNodeId\": \"A8B1A431-AC3A-6DCD-BFF0-4D19CDBCAADB\",\n            \"endPoint\": {\n                \"positiveController\": null,\n                \"x\": 1773.5,\n                \"y\": 425.0\n            },\n            \"endStepId\": 5,\n            \"id\": \"C049EE11-C5BB-F93B-36C3-4D19CDF12B8F\",\n            \"label\": \"Reopen Issue\",\n            \"labelPoint\": {\n                \"positiveController\": null,\n                \"x\": 1703.85,\n                \"y\": 218.5\n            },\n            \"lineType\": \"poly\",\n            \"startNodeId\": \"1C846CFB-4F0D-2F40-D0AE-4D19CDAF5D34\",\n            \"startPoint\": {\n                \"positiveController\": null,\n                \"x\": 1677.0,\n                \"y\": 227.0\n            },\n            \"startStepId\": 6\n        },\n        \"C9EA1792-2332-8B56-A04D-4D19CD725367\": {\n            \"actionId\": 301,\n            \"allPoints\": [\n                {\n                    \"positiveController\": null,\n                    \"x\": 1465.0,\n                    \"y\": 436.0\n                },\n                {\n                    \"positiveController\": null,\n                    \"x\": 1469.5,\n                    \"y\": 113.0\n                }\n            ],\n            \"controlPoints\": [],\n            \"endNodeId\": \"778534F4-7595-88B6-45E1-4D19CD518712\",\n            \"endPoint\": {\n                \"positiveController\": null,\n                \"x\": 1469.5,\n                \"y\": 113.0\n            },\n            \"endStepId\": 1,\n            \"id\": \"C9EA1792-2332-8B56-A04D-4D19CD725367\",\n            \"label\": \"Stop Progress\",\n            \"labelPoint\": {\n                \"positiveController\": null,\n                \"x\": 1407.8,\n                \"y\": 308.5\n            },\n            \"lineType\": \"straight\",\n            \"startNodeId\": \"0740FFFA-2AA1-C90A-38ED-4D19CD61899B\",\n            \"startPoint\": {\n                \"positiveController\": null,\n                \"x\": 1465.0,\n                \"y\": 436.0\n            },\n            \"startStepId\": 3\n        },\n        \"CAF37138-6321-E03A-8E41-4D19CDD7DC78\": {\n            \"actionId\": 2,\n            \"allPoints\": [\n                {\n                    \"positiveController\": null,\n                    \"x\": 1764.5,\n                    \"y\": 430.0\n                },\n                {\n                    \"positiveController\": null,\n                    \"x\": 1614.0,\n                    \"y\": 226.0\n                }\n            ],\n            \"controlPoints\": [],\n            \"endNodeId\": \"1C846CFB-4F0D-2F40-D0AE-4D19CDAF5D34\",\n            \"endPoint\": {\n                \"positiveController\": null,\n                \"x\": 1614.0,\n                \"y\": 226.0\n            },\n            \"endStepId\": 6,\n            \"id\": \"CAF37138-6321-E03A-8E41-4D19CDD7DC78\",\n            \"label\": \"Close Issue\",\n            \"labelPoint\": {\n                \"positiveController\": null,\n                \"x\": 1677.65,\n                \"y\": 365.0\n            },\n            \"lineType\": \"straight\",\n            \"startNodeId\": \"A8B1A431-AC3A-6DCD-BFF0-4D19CDBCAADB\",\n            \"startPoint\": {\n                \"positiveController\": null,\n                \"x\": 1764.5,\n                \"y\": 430.0\n            },\n            \"startStepId\": 5\n        },\n        \"E1F8462A-8B0A-87EA-4F70-4D19CE423C83\": {\n            \"actionId\": 2,\n            \"allPoints\": [\n                {\n                    \"positiveController\": null,\n                    \"x\": 1488.0,\n                    \"y\": 430.0\n                },\n                {\n                    \"positiveController\": null,\n                    \"x\": 1614.0,\n                    \"y\": 226.0\n                }\n            ],\n            \"controlPoints\": [],\n            \"endNodeId\": \"1C846CFB-4F0D-2F40-D0AE-4D19CDAF5D34\",\n            \"endPoint\": {\n                \"positiveController\": null,\n                \"x\": 1614.0,\n                \"y\": 226.0\n            },\n            \"endStepId\": 6,\n            \"id\": \"E1F8462A-8B0A-87EA-4F70-4D19CE423C83\",\n            \"label\": \"Close Issue\",\n            \"labelPoint\": {\n                \"positiveController\": null,\n                \"x\": 1492.0,\n                \"y\": 345.0\n            },\n            \"lineType\": \"straight\",\n            \"startNodeId\": \"0740FFFA-2AA1-C90A-38ED-4D19CD61899B\",\n            \"startPoint\": {\n                \"positiveController\": null,\n                \"x\": 1488.0,\n                \"y\": 430.0\n            },\n            \"startStepId\": 3\n        },\n        \"E27D8EB8-8E49-430B-8FCB-4D19CE127171\": {\n            \"actionId\": 3,\n            \"allPoints\": [\n                {\n                    \"positiveController\": null,\n                    \"x\": 1840.0,\n                    \"y\": 130.0\n                },\n                {\n                    \"positiveController\": null,\n                    \"x\": 1846.5,\n                    \"y\": 428.0\n                }\n            ],\n            \"controlPoints\": [],\n            \"endNodeId\": \"A8B1A431-AC3A-6DCD-BFF0-4D19CDBCAADB\",\n            \"endPoint\": {\n                \"positiveController\": null,\n                \"x\": 1846.5,\n                \"y\": 428.0\n            },\n            \"endStepId\": 5,\n            \"id\": \"E27D8EB8-8E49-430B-8FCB-4D19CE127171\",\n            \"label\": \"Reopen Issue\",\n            \"labelPoint\": {\n                \"positiveController\": null,\n                \"x\": 1814.05,\n                \"y\": 169.5\n            },\n            \"lineType\": \"straight\",\n            \"startNodeId\": \"6DA64EEB-08FE-2870-C90C-4D19CDA2F72D\",\n            \"startPoint\": {\n                \"positiveController\": null,\n                \"x\": 1840.0,\n                \"y\": 130.0\n            },\n            \"startStepId\": 4\n        },\n        \"F79E742D-A9E4-0124-D7D4-4D19CDE48C9C\": {\n            \"actionId\": 4,\n            \"allPoints\": [\n                {\n                    \"positiveController\": null,\n                    \"x\": 1806.5,\n                    \"y\": 434.0\n                },\n                {\n                    \"positiveController\": null,\n                    \"x\": 1434.0,\n                    \"y\": 435.0\n                }\n            ],\n            \"controlPoints\": [],\n            \"endNodeId\": \"0740FFFA-2AA1-C90A-38ED-4D19CD61899B\",\n            \"endPoint\": {\n                \"positiveController\": null,\n                \"x\": 1434.0,\n                \"y\": 435.0\n            },\n            \"endStepId\": 3,\n            \"id\": \"F79E742D-A9E4-0124-D7D4-4D19CDE48C9C\",\n            \"label\": \"Start Progress\",\n            \"labelPoint\": {\n                \"positiveController\": null,\n                \"x\": 1607.25,\n                \"y\": 423.5\n            },\n            \"lineType\": \"straight\",\n            \"startNodeId\": \"A8B1A431-AC3A-6DCD-BFF0-4D19CDBCAADB\",\n            \"startPoint\": {\n                \"positiveController\": null,\n                \"x\": 1806.5,\n                \"y\": 434.0\n            },\n            \"startStepId\": 5\n        },\n        \"FD6BA267-475B-70B3-8AA4-4D19CE00BCD1\": {\n            \"actionId\": 701,\n            \"allPoints\": [\n                {\n                    \"positiveController\": null,\n                    \"x\": 1763.0,\n                    \"y\": 113.0\n                },\n                {\n                    \"positiveController\": null,\n                    \"x\": 1614.0,\n                    \"y\": 226.0\n                }\n            ],\n            \"controlPoints\": [],\n            \"endNodeId\": \"1C846CFB-4F0D-2F40-D0AE-4D19CDAF5D34\",\n            \"endPoint\": {\n                \"positiveController\": null,\n                \"x\": 1614.0,\n                \"y\": 226.0\n            },\n            \"endStepId\": 6,\n            \"id\": \"FD6BA267-475B-70B3-8AA4-4D19CE00BCD1\",\n            \"label\": \"Close Issue\",\n            \"labelPoint\": {\n                \"positiveController\": null,\n                \"x\": 1635.75,\n                \"y\": 152.25\n            },\n            \"lineType\": \"straight\",\n            \"startNodeId\": \"6DA64EEB-08FE-2870-C90C-4D19CDA2F72D\",\n            \"startPoint\": {\n                \"positiveController\": null,\n                \"x\": 1763.0,\n                \"y\": 113.0\n            },\n            \"startStepId\": 4\n        }\n    },\n    \"nodeMap\": {\n        \"0740FFFA-2AA1-C90A-38ED-4D19CD61899B\": {\n            \"id\": \"0740FFFA-2AA1-C90A-38ED-4D19CD61899B\",\n            \"inLinkIds\": [\n                \"F79E742D-A9E4-0124-D7D4-4D19CDE48C9C\",\n                \"92D3DEFD-13AC-06A7-E5D8-4D19CE537791\"\n            ],\n            \"isInitialAction\": false,\n            \"label\": \"In Progress\",\n            \"outLinkIds\": [\n                \"C9EA1792-2332-8B56-A04D-4D19CD725367\",\n                \"517D7F32-20FB-309E-8639-4D19CE2ACB54\",\n                \"E1F8462A-8B0A-87EA-4F70-4D19CE423C83\"\n            ],\n            \"rect\": {\n                \"height\": 45.0,\n                \"positiveController\": null,\n                \"width\": 146.0,\n                \"x\": 1373.0,\n                \"y\": 419.0\n            },\n            \"stepId\": 3\n        },\n        \"15174530-AE75-04E0-1D9D-4D19CD200835\": {\n            \"id\": \"15174530-AE75-04E0-1D9D-4D19CD200835\",\n            \"inLinkIds\": [],\n            \"isInitialAction\": true,\n            \"label\": \"Create Issue\",\n            \"outLinkIds\": [\n                \"58BD4605-5FB9-84EA-6952-4D19CE7B454B\"\n            ],\n            \"rect\": {\n                \"height\": 45.0,\n                \"positiveController\": null,\n                \"width\": 157.0,\n                \"x\": 1405.0,\n                \"y\": 0.0\n            },\n            \"stepId\": 1\n        },\n        \"1C846CFB-4F0D-2F40-D0AE-4D19CDAF5D34\": {\n            \"id\": \"1C846CFB-4F0D-2F40-D0AE-4D19CDAF5D34\",\n            \"inLinkIds\": [\n                \"CAF37138-6321-E03A-8E41-4D19CDD7DC78\",\n                \"E1F8462A-8B0A-87EA-4F70-4D19CE423C83\",\n                \"FD6BA267-475B-70B3-8AA4-4D19CE00BCD1\",\n                \"3DF7CEC8-9FBC-C0D0-AFB1-4D19CE6EA230\"\n            ],\n            \"isInitialAction\": false,\n            \"label\": \"Closed\",\n            \"outLinkIds\": [\n                \"C049EE11-C5BB-F93B-36C3-4D19CDF12B8F\"\n            ],\n            \"rect\": {\n                \"height\": 45.0,\n                \"positiveController\": null,\n                \"width\": 120.0,\n                \"x\": 1569.0,\n                \"y\": 210.0\n            },\n            \"stepId\": 6\n        },\n        \"6DA64EEB-08FE-2870-C90C-4D19CDA2F72D\": {\n            \"id\": \"6DA64EEB-08FE-2870-C90C-4D19CDA2F72D\",\n            \"inLinkIds\": [\n                \"517D7F32-20FB-309E-8639-4D19CE2ACB54\",\n                \"1DEDB66F-FE5C-EDFD-54D0-4D19CDC8CECA\",\n                \"483797F1-1BF4-5E0F-86C6-4D19CE6023A2\"\n            ],\n            \"isInitialAction\": false,\n            \"label\": \"Resolved\",\n            \"outLinkIds\": [\n                \"FD6BA267-475B-70B3-8AA4-4D19CE00BCD1\",\n                \"E27D8EB8-8E49-430B-8FCB-4D19CE127171\"\n            ],\n            \"rect\": {\n                \"height\": 44.0,\n                \"positiveController\": null,\n                \"width\": 137.0,\n                \"x\": 1709.0,\n                \"y\": 97.0\n            },\n            \"stepId\": 4\n        },\n        \"778534F4-7595-88B6-45E1-4D19CD518712\": {\n            \"id\": \"778534F4-7595-88B6-45E1-4D19CD518712\",\n            \"inLinkIds\": [\n                \"C9EA1792-2332-8B56-A04D-4D19CD725367\",\n                \"58BD4605-5FB9-84EA-6952-4D19CE7B454B\"\n            ],\n            \"isInitialAction\": false,\n            \"label\": \"Open\",\n            \"outLinkIds\": [\n                \"92D3DEFD-13AC-06A7-E5D8-4D19CE537791\",\n                \"483797F1-1BF4-5E0F-86C6-4D19CE6023A2\",\n                \"3DF7CEC8-9FBC-C0D0-AFB1-4D19CE6EA230\"\n            ],\n            \"rect\": {\n                \"height\": 45.0,\n                \"positiveController\": null,\n                \"width\": 106.0,\n                \"x\": 1429.5,\n                \"y\": 97.0\n            },\n            \"stepId\": 1\n        },\n        \"A8B1A431-AC3A-6DCD-BFF0-4D19CDBCAADB\": {\n            \"id\": \"A8B1A431-AC3A-6DCD-BFF0-4D19CDBCAADB\",\n            \"inLinkIds\": [\n                \"E27D8EB8-8E49-430B-8FCB-4D19CE127171\",\n                \"C049EE11-C5BB-F93B-36C3-4D19CDF12B8F\"\n            ],\n            \"isInitialAction\": false,\n            \"label\": \"Reopened\",\n            \"outLinkIds\": [\n                \"1DEDB66F-FE5C-EDFD-54D0-4D19CDC8CECA\",\n                \"CAF37138-6321-E03A-8E41-4D19CDD7DC78\",\n                \"F79E742D-A9E4-0124-D7D4-4D19CDE48C9C\"\n            ],\n            \"rect\": {\n                \"height\": 45.0,\n                \"positiveController\": null,\n                \"width\": 142.0,\n                \"x\": 1749.5,\n                \"y\": 418.0\n            },\n            \"stepId\": 5\n        }\n    },\n    \"rootIds\": [\n        \"15174530-AE75-04E0-1D9D-4D19CD200835\"\n    ],\n    \"width\": 1136\n}\n');
INSERT INTO `propertytext` VALUES (10108, '{\"com.atlassian.jira.reindex.required\":1551969255212}');
INSERT INTO `propertytext` VALUES (10221, '<map>\n  <entry>\n    <string>pluginVersion</string>\n    <string>8.0.0-DAILY20190215023029</string>\n  </entry>\n  <entry>\n    <string>ranOn</string>\n    <string>2019-03-08T10:26:22.117+08:00</string>\n  </entry>\n  <entry>\n    <string>buildDate</string>\n    <string>2019-02-15T10:37:35.231+08:00</string>\n  </entry>\n  <entry>\n    <string>latestUpgradeTaskRun</string>\n    <string>0</string>\n  </entry>\n  <entry>\n    <string>changeSet</string>\n    <string>9037657ebb63f682</string>\n  </entry>\n</map>');
INSERT INTO `propertytext` VALUES (10222, '<map>\n  <entry>\n    <string>pluginVersion</string>\n    <string>8.0.0-DAILY20190215023029</string>\n  </entry>\n  <entry>\n    <string>ranOn</string>\n    <string>2019-03-07T22:10:42.231+08:00</string>\n  </entry>\n  <entry>\n    <string>buildDate</string>\n    <string>2019-02-15T10:37:35.231+08:00</string>\n  </entry>\n  <entry>\n    <string>latestUpgradeTaskRun</string>\n    <string>0</string>\n  </entry>\n  <entry>\n    <string>changeSet</string>\n    <string>9037657ebb63f682</string>\n  </entry>\n</map>');
INSERT INTO `propertytext` VALUES (10309, '#java.util.List\n{\"userKey\":\"JIRA\",\"date\":1552012049074,\"i18nKey\":\"upm.auditLog.upm.startup\",\"entryType\":\"UPM_STARTUP\",\"params\":[]}\n{\"userKey\":\"JIRA\",\"date\":1552008853790,\"i18nKey\":\"upm.auditLog.upm.startup\",\"entryType\":\"UPM_STARTUP\",\"params\":[]}\n{\"userKey\":\"JIRA\",\"date\":1551971757728,\"i18nKey\":\"upm.auditLog.upm.startup\",\"entryType\":\"UPM_STARTUP\",\"params\":[]}\n{\"userKey\":\"JIRA\",\"date\":1551970679364,\"i18nKey\":\"upm.auditLog.upm.startup\",\"entryType\":\"UPM_STARTUP\",\"params\":[]}\n{\"userKey\":\"JIRA\",\"date\":1551969240432,\"i18nKey\":\"upm.auditLog.upm.startup\",\"entryType\":\"UPM_STARTUP\",\"params\":[]}');
INSERT INTO `propertytext` VALUES (10315, '<map>\n  <entry>\n    <string>timeTaken</string>\n    <string>-1</string>\n  </entry>\n  <entry>\n    <string>pluginVersion</string>\n    <string>8.0.0-DAILY20190215023029</string>\n  </entry>\n  <entry>\n    <string>ranOn</string>\n    <string>2019-03-07T22:34:01.573+08:00</string>\n  </entry>\n  <entry>\n    <string>buildNumber</string>\n    <string>46</string>\n  </entry>\n  <entry>\n    <string>changeSet</string>\n    <string>9037657ebb63f682</string>\n  </entry>\n</map>');
INSERT INTO `propertytext` VALUES (10316, '<map>\n  <entry>\n    <string>timeTaken</string>\n    <string>46</string>\n  </entry>\n  <entry>\n    <string>pluginVersion</string>\n    <string>8.0.0-DAILY20190215023029</string>\n  </entry>\n  <entry>\n    <string>ranOn</string>\n    <string>2019-03-07T22:34:01.639+08:00</string>\n  </entry>\n  <entry>\n    <string>buildNumber</string>\n    <string>46</string>\n  </entry>\n  <entry>\n    <string>changeSet</string>\n    <string>9037657ebb63f682</string>\n  </entry>\n</map>');
INSERT INTO `propertytext` VALUES (10319, '<map>\n  <entry>\n    <string>timeTaken</string>\n    <string>-1</string>\n  </entry>\n  <entry>\n    <string>pluginVersion</string>\n    <string>8.0.0-DAILY20190215023029</string>\n  </entry>\n  <entry>\n    <string>ranOn</string>\n    <string>2019-03-07T22:34:01.662+08:00</string>\n  </entry>\n  <entry>\n    <string>buildNumber</string>\n    <string>47</string>\n  </entry>\n  <entry>\n    <string>changeSet</string>\n    <string>9037657ebb63f682</string>\n  </entry>\n</map>');
INSERT INTO `propertytext` VALUES (10320, '<map>\n  <entry>\n    <string>timeTaken</string>\n    <string>65</string>\n  </entry>\n  <entry>\n    <string>pluginVersion</string>\n    <string>8.0.0-DAILY20190215023029</string>\n  </entry>\n  <entry>\n    <string>ranOn</string>\n    <string>2019-03-07T22:34:01.735+08:00</string>\n  </entry>\n  <entry>\n    <string>buildNumber</string>\n    <string>47</string>\n  </entry>\n  <entry>\n    <string>changeSet</string>\n    <string>9037657ebb63f682</string>\n  </entry>\n</map>');
INSERT INTO `propertytext` VALUES (10321, '<map>\n  <entry>\n    <string>timeTaken</string>\n    <string>-1</string>\n  </entry>\n  <entry>\n    <string>pluginVersion</string>\n    <string>8.0.0-DAILY20190215023029</string>\n  </entry>\n  <entry>\n    <string>ranOn</string>\n    <string>2019-03-07T22:34:01.759+08:00</string>\n  </entry>\n  <entry>\n    <string>buildNumber</string>\n    <string>48</string>\n  </entry>\n  <entry>\n    <string>changeSet</string>\n    <string>9037657ebb63f682</string>\n  </entry>\n</map>');
INSERT INTO `propertytext` VALUES (10322, '<map>\n  <entry>\n    <string>timeTaken</string>\n    <string>11</string>\n  </entry>\n  <entry>\n    <string>pluginVersion</string>\n    <string>8.0.0-DAILY20190215023029</string>\n  </entry>\n  <entry>\n    <string>ranOn</string>\n    <string>2019-03-07T22:34:01.776+08:00</string>\n  </entry>\n  <entry>\n    <string>buildNumber</string>\n    <string>48</string>\n  </entry>\n  <entry>\n    <string>changeSet</string>\n    <string>9037657ebb63f682</string>\n  </entry>\n</map>');
INSERT INTO `propertytext` VALUES (10323, '<map>\n  <entry>\n    <string>timeTaken</string>\n    <string>-1</string>\n  </entry>\n  <entry>\n    <string>pluginVersion</string>\n    <string>8.0.0-DAILY20190215023029</string>\n  </entry>\n  <entry>\n    <string>ranOn</string>\n    <string>2019-03-07T22:34:01.805+08:00</string>\n  </entry>\n  <entry>\n    <string>buildNumber</string>\n    <string>49</string>\n  </entry>\n  <entry>\n    <string>changeSet</string>\n    <string>9037657ebb63f682</string>\n  </entry>\n</map>');
INSERT INTO `propertytext` VALUES (10324, '<map>\n  <entry>\n    <string>timeTaken</string>\n    <string>342</string>\n  </entry>\n  <entry>\n    <string>pluginVersion</string>\n    <string>8.0.0-DAILY20190215023029</string>\n  </entry>\n  <entry>\n    <string>ranOn</string>\n    <string>2019-03-07T22:34:02.151+08:00</string>\n  </entry>\n  <entry>\n    <string>buildNumber</string>\n    <string>49</string>\n  </entry>\n  <entry>\n    <string>changeSet</string>\n    <string>9037657ebb63f682</string>\n  </entry>\n</map>');
INSERT INTO `propertytext` VALUES (10325, '<map>\n  <entry>\n    <string>timeTaken</string>\n    <string>-1</string>\n  </entry>\n  <entry>\n    <string>pluginVersion</string>\n    <string>8.0.0-DAILY20190215023029</string>\n  </entry>\n  <entry>\n    <string>ranOn</string>\n    <string>2019-03-07T22:34:02.194+08:00</string>\n  </entry>\n  <entry>\n    <string>buildNumber</string>\n    <string>50</string>\n  </entry>\n  <entry>\n    <string>changeSet</string>\n    <string>9037657ebb63f682</string>\n  </entry>\n</map>');
INSERT INTO `propertytext` VALUES (10326, '<map>\n  <entry>\n    <string>timeTaken</string>\n    <string>80</string>\n  </entry>\n  <entry>\n    <string>pluginVersion</string>\n    <string>8.0.0-DAILY20190215023029</string>\n  </entry>\n  <entry>\n    <string>ranOn</string>\n    <string>2019-03-07T22:34:02.284+08:00</string>\n  </entry>\n  <entry>\n    <string>buildNumber</string>\n    <string>50</string>\n  </entry>\n  <entry>\n    <string>changeSet</string>\n    <string>9037657ebb63f682</string>\n  </entry>\n</map>');
INSERT INTO `propertytext` VALUES (10327, '<map>\n  <entry>\n    <string>timeTaken</string>\n    <string>-1</string>\n  </entry>\n  <entry>\n    <string>pluginVersion</string>\n    <string>8.0.0-DAILY20190215023029</string>\n  </entry>\n  <entry>\n    <string>ranOn</string>\n    <string>2019-03-07T22:34:02.341+08:00</string>\n  </entry>\n  <entry>\n    <string>buildNumber</string>\n    <string>51</string>\n  </entry>\n  <entry>\n    <string>changeSet</string>\n    <string>9037657ebb63f682</string>\n  </entry>\n</map>');
INSERT INTO `propertytext` VALUES (10328, '<map>\n  <entry>\n    <string>timeTaken</string>\n    <string>4</string>\n  </entry>\n  <entry>\n    <string>pluginVersion</string>\n    <string>8.0.0-DAILY20190215023029</string>\n  </entry>\n  <entry>\n    <string>ranOn</string>\n    <string>2019-03-07T22:34:02.356+08:00</string>\n  </entry>\n  <entry>\n    <string>buildNumber</string>\n    <string>51</string>\n  </entry>\n  <entry>\n    <string>changeSet</string>\n    <string>9037657ebb63f682</string>\n  </entry>\n</map>');
INSERT INTO `propertytext` VALUES (10376, '{\"com.atlassian.jira.reindex.required\":1551969426768}');
INSERT INTO `propertytext` VALUES (10377, 'app.properties.setup=FULLFILLED;create.user.mail.properties.setup=ANNOUNCED;database.setup=AWAITS;mail.properties.setup=ANNOUNCED');

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `ID` decimal(18, 0) NULL DEFAULT NULL,
  `CALENDAR_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CALENDAR` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`CALENDAR_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `ID` decimal(18, 0) NOT NULL,
  `trigger_id` decimal(18, 0) NULL DEFAULT NULL,
  `cronExperssion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `ID` decimal(18, 0) NULL DEFAULT NULL,
  `ENTRY_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_id` decimal(18, 0) NULL DEFAULT NULL,
  `TRIGGER_LISTENER` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FIRED_TIME` datetime(0) NULL DEFAULT NULL,
  `TRIGGER_STATE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ENTRY_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `ID` decimal(18, 0) NOT NULL,
  `JOB_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `JOB_GROUP` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CLASS_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IS_DURABLE` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IS_STATEFUL` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `JOB_DATA` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_job_listeners
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_listeners`;
CREATE TABLE `qrtz_job_listeners`  (
  `ID` decimal(18, 0) NOT NULL,
  `JOB` decimal(18, 0) NULL DEFAULT NULL,
  `JOB_LISTENER` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `ID` decimal(18, 0) NOT NULL,
  `trigger_id` decimal(18, 0) NULL DEFAULT NULL,
  `REPEAT_COUNT` decimal(9, 0) NULL DEFAULT NULL,
  `REPEAT_INTERVAL` decimal(18, 0) NULL DEFAULT NULL,
  `TIMES_TRIGGERED` decimal(9, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_trigger_listeners
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_trigger_listeners`;
CREATE TABLE `qrtz_trigger_listeners`  (
  `ID` decimal(18, 0) NOT NULL,
  `trigger_id` decimal(18, 0) NULL DEFAULT NULL,
  `TRIGGER_LISTENER` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `ID` decimal(18, 0) NOT NULL,
  `TRIGGER_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TRIGGER_GROUP` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `JOB` decimal(18, 0) NULL DEFAULT NULL,
  `NEXT_FIRE` datetime(0) NULL DEFAULT NULL,
  `TRIGGER_STATE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TRIGGER_TYPE` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `START_TIME` datetime(0) NULL DEFAULT NULL,
  `END_TIME` datetime(0) NULL DEFAULT NULL,
  `CALENDAR_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MISFIRE_INSTR` decimal(9, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for reindex_component
-- ----------------------------
DROP TABLE IF EXISTS `reindex_component`;
CREATE TABLE `reindex_component`  (
  `ID` decimal(18, 0) NOT NULL,
  `REQUEST_ID` decimal(18, 0) NULL DEFAULT NULL,
  `AFFECTED_INDEX` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ENTITY_TYPE` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `idx_reindex_component_req_id`(`REQUEST_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reindex_component
-- ----------------------------
INSERT INTO `reindex_component` VALUES (10100, 10000, 'ISSUE', 'NONE');
INSERT INTO `reindex_component` VALUES (10101, 10000, 'COMMENT', 'NONE');
INSERT INTO `reindex_component` VALUES (10102, 10000, 'CHANGEHISTORY', 'NONE');
INSERT INTO `reindex_component` VALUES (10103, 10000, 'WORKLOG', 'NONE');

-- ----------------------------
-- Table structure for reindex_request
-- ----------------------------
DROP TABLE IF EXISTS `reindex_request`;
CREATE TABLE `reindex_request`  (
  `ID` decimal(18, 0) NOT NULL,
  `TYPE` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REQUEST_TIME` datetime(0) NULL DEFAULT NULL,
  `START_TIME` datetime(0) NULL DEFAULT NULL,
  `COMPLETION_TIME` datetime(0) NULL DEFAULT NULL,
  `STATUS` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXECUTION_NODE_ID` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `QUERY` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reindex_request
-- ----------------------------
INSERT INTO `reindex_request` VALUES (10000, 'IMMEDIATE', '2019-03-07 22:03:15', '2019-03-07 22:33:59', '2019-03-07 22:34:00', 'COMPLETE', NULL, NULL);

-- ----------------------------
-- Table structure for remembermetoken
-- ----------------------------
DROP TABLE IF EXISTS `remembermetoken`;
CREATE TABLE `remembermetoken`  (
  `ID` decimal(18, 0) NOT NULL,
  `CREATED` datetime(0) NULL DEFAULT NULL,
  `TOKEN` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `remembermetoken_username_index`(`USERNAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of remembermetoken
-- ----------------------------
INSERT INTO `remembermetoken` VALUES (10000, '2019-03-07 22:34:48', 'c98f7d775ccd3584bc5ac552733211e0cbc2bd23', 'yc');

-- ----------------------------
-- Table structure for remotelink
-- ----------------------------
DROP TABLE IF EXISTS `remotelink`;
CREATE TABLE `remotelink`  (
  `ID` decimal(18, 0) NOT NULL,
  `ISSUEID` decimal(18, 0) NULL DEFAULT NULL,
  `GLOBALID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TITLE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SUMMARY` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `URL` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `ICONURL` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `ICONTITLE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `RELATIONSHIP` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RESOLVED` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STATUSNAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STATUSDESCRIPTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `STATUSICONURL` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `STATUSICONTITLE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `STATUSICONLINK` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `STATUSCATEGORYKEY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STATUSCATEGORYCOLORNAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLICATIONTYPE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLICATIONNAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `remotelink_issueid`(`ISSUEID`, `GLOBALID`) USING BTREE,
  INDEX `remotelink_globalid`(`GLOBALID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for replicatedindexoperation
-- ----------------------------
DROP TABLE IF EXISTS `replicatedindexoperation`;
CREATE TABLE `replicatedindexoperation`  (
  `ID` decimal(18, 0) NOT NULL,
  `INDEX_TIME` datetime(0) NULL DEFAULT NULL,
  `NODE_ID` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AFFECTED_INDEX` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ENTITY_TYPE` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AFFECTED_IDS` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `OPERATION` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FILENAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `node_operation_idx`(`NODE_ID`, `AFFECTED_INDEX`, `OPERATION`, `INDEX_TIME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for resolution
-- ----------------------------
DROP TABLE IF EXISTS `resolution`;
CREATE TABLE `resolution`  (
  `ID` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SEQUENCE` decimal(18, 0) NULL DEFAULT NULL,
  `pname` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `ICONURL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rundetails
-- ----------------------------
DROP TABLE IF EXISTS `rundetails`;
CREATE TABLE `rundetails`  (
  `ID` decimal(18, 0) NOT NULL,
  `JOB_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `START_TIME` datetime(0) NULL DEFAULT NULL,
  `RUN_DURATION` decimal(18, 0) NULL DEFAULT NULL,
  `RUN_OUTCOME` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INFO_MESSAGE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `rundetails_jobid_idx`(`JOB_ID`) USING BTREE,
  INDEX `rundetails_starttime_idx`(`START_TIME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rundetails
-- ----------------------------
INSERT INTO `rundetails` VALUES (10001, 'a4c1a32d-2f7d-4874-8077-b75a66abb678', '2019-03-07 22:03:15', 22626, 'S', '');
INSERT INTO `rundetails` VALUES (10103, 'LocalPluginLicenseNotificationJob-job', '2019-03-07 22:34:00', 271, 'S', '');
INSERT INTO `rundetails` VALUES (10310, '58bca5d1-7964-4af0-8ff6-5ed3bfd3c6b2', '2019-03-07 22:58:00', 687, 'S', '');
INSERT INTO `rundetails` VALUES (10312, '5d2255ed-2998-4854-89fe-628879b68d0c', '2019-03-07 22:58:00', 20489, 'S', '');
INSERT INTO `rundetails` VALUES (10411, 'analytics-collection', '2019-03-07 23:00:00', 18, 'S', 'Skipped collection');
INSERT INTO `rundetails` VALUES (10424, 'a574b9b1-21e6-46d4-b70e-4646db5f2b23', '2019-03-07 23:01:00', 666, 'S', '');
INSERT INTO `rundetails` VALUES (10512, '6f6d2ad1-4a5a-44b8-a674-7187596263b2', '2019-03-07 23:16:04', 1684, 'S', '');
INSERT INTO `rundetails` VALUES (10513, '29ee9fe6-4332-4620-9308-46fc51b35d8f', '2019-03-07 23:16:04', 12713, 'S', '');
INSERT INTO `rundetails` VALUES (10621, '991b288f-a022-49c8-a64c-0a52d0dd71d3', '2019-03-07 23:19:04', 42674, 'S', '');
INSERT INTO `rundetails` VALUES (11008, 'com.atlassian.jira.service.JiraService:10002', '2019-03-08 09:34:23', 453, 'S', '');
INSERT INTO `rundetails` VALUES (11009, 'com.atlassian.jira.cache.monitor.CacheStatisticsMonitor', '2019-03-08 09:34:23', 160, 'S', '');
INSERT INTO `rundetails` VALUES (11020, 'PluginUpdateCheckJob-job', '2019-03-08 09:34:23', 21820, 'S', '');
INSERT INTO `rundetails` VALUES (11021, '4fcbfde4-9545-42d0-8b5d-2fc176f09351', '2019-03-08 09:34:24', 21714, 'S', '');
INSERT INTO `rundetails` VALUES (11102, 'com.atlassian.jira.service.JiraService:10001', '2019-03-08 09:34:23', 39380, 'S', '');
INSERT INTO `rundetails` VALUES (11112, '0e714877-6189-4ccc-866f-0aedce0920fc', '2019-03-08 09:34:24', 82014, 'S', '');
INSERT INTO `rundetails` VALUES (11162, '20b3e436-b184-4a55-8caa-6b2cde657087', '2019-03-08 09:37:23', 222441, 'S', '');
INSERT INTO `rundetails` VALUES (11331, 'com.atlassian.jira.service.JiraService:10200', '2019-03-08 10:00:00', 9103, 'S', '');
INSERT INTO `rundetails` VALUES (11513, 'com.atlassian.diagnostics.internal.analytics.DailyAlertAnalyticsJob', '2019-03-08 10:19:00', 5571, 'S', '');
INSERT INTO `rundetails` VALUES (11605, 'com.atlassian.jira.user.UserHistoryDatabaseCompactor', '2019-03-08 10:27:49', 15, 'S', '');
INSERT INTO `rundetails` VALUES (11609, 'BundledUpdateCheckJob-job', '2019-03-08 10:27:49', 32, 'S', '');
INSERT INTO `rundetails` VALUES (11611, 'applink-status-analytics-job', '2019-03-08 10:27:49', 47, 'S', '');
INSERT INTO `rundetails` VALUES (11613, 'com.atlassian.jira.plugins.software.monitor.ApplicationPluginsEnablerJobRunner', '2019-03-08 10:27:49', 31, 'S', '');
INSERT INTO `rundetails` VALUES (11614, 'e6e7152a-7cc0-43e5-9814-ad6ec5cc35ee', '2019-03-08 10:27:49', 2219, 'S', '');
INSERT INTO `rundetails` VALUES (11615, 'CompatibilityPluginScheduler.JobId.hipchatRefreshConnectionStatusJob', '2019-03-08 10:27:53', 15, 'S', '');
INSERT INTO `rundetails` VALUES (11616, 'JiraPluginScheduler:com.atlassian.analytics.client.upload.RemoteFilterRead:job', '2019-03-08 10:27:49', 5672, 'S', '');
INSERT INTO `rundetails` VALUES (11617, 'CompatibilityPluginScheduler.JobId.hipchatInstallGlancesJob', '2019-03-08 10:27:56', 13, 'S', '');
INSERT INTO `rundetails` VALUES (11700, 'com.atlassian.jira.upgrade.UpgradeService', '2019-03-08 10:28:26', 5021, 'S', '');
INSERT INTO `rundetails` VALUES (11701, 'JiraPluginScheduler:com.atlassian.troubleshooting.healthcheck.scheduler.HealthCheckSchedulerImpl:job', '2019-03-08 10:28:29', 12512, 'S', '');
INSERT INTO `rundetails` VALUES (11719, '063b1d12-ca3b-45d7-881b-d21904d2e23e', '2019-03-08 10:27:49', 128333, 'S', '');
INSERT INTO `rundetails` VALUES (11730, 'c1da474b-68bc-49c8-b38e-6166f42e9875', '2019-03-08 10:30:49', 4618, 'S', '');
INSERT INTO `rundetails` VALUES (11765, 'com.atlassian.jira.plugins.dvcs.scheduler.DvcsScheduler:job', '2019-03-08 10:34:23', 73, 'S', '');
INSERT INTO `rundetails` VALUES (11766, 'PluginRequestCheckJob-job', '2019-03-08 10:34:23', 107, 'S', '');
INSERT INTO `rundetails` VALUES (11933, 'InstanceTopologyJob-job', '2019-03-08 10:50:01', 3802, 'S', '');
INSERT INTO `rundetails` VALUES (12009, 'data-provider-cleanup', '2019-03-08 10:57:49', 28, 'S', '');
INSERT INTO `rundetails` VALUES (12049, 'com.atlassian.jira.apdex.impl.SendAnalyticsJobRunner', '2019-03-08 11:01:00', 64, 'S', '');
INSERT INTO `rundetails` VALUES (12164, 'com.atlassian.jira.plugins.inform.batching.cron.BatchNotificationJobSchedulerImpl', '2019-03-08 11:12:30', 5, 'S', '');
INSERT INTO `rundetails` VALUES (12168, 'data-provider-poll', '2019-03-08 11:12:49', 4, 'S', '');
INSERT INTO `rundetails` VALUES (12206, 'com.atlassian.jira.plugins.inform.batching.cron.BatchNotificationJobSchedulerImpl.mentions', '2019-03-08 11:16:31', 15, 'S', '');
INSERT INTO `rundetails` VALUES (12207, '85fa5fee-b7f8-4521-92d5-007ffe92dd64', '2019-03-08 11:16:49', 2, 'S', '');
INSERT INTO `rundetails` VALUES (12208, '905f78e3-288d-4ff0-bf77-37e23591db0c', '2019-03-08 11:16:49', 2, 'S', '');
INSERT INTO `rundetails` VALUES (12209, 'CompatibilityPluginScheduler.JobId.LEXO_RANK_SCHEDULER_JOB', '2019-03-08 11:16:49', 5, 'S', '');
INSERT INTO `rundetails` VALUES (12210, 'db68843c-74ca-41ee-a0e8-faf3a412e792', '2019-03-08 11:16:49', 7, 'S', '');
INSERT INTO `rundetails` VALUES (12211, 'ecce1fdb-2650-476e-a3e2-32d0fe0a706c', '2019-03-08 11:16:50', 3, 'S', '');
INSERT INTO `rundetails` VALUES (12212, '8430c53b-cfc1-4432-926a-4982532d2f2e', '2019-03-08 11:16:50', 3, 'S', '');
INSERT INTO `rundetails` VALUES (12213, 'JiraPluginScheduler:LEXO_RANK_STATS_COLLECTOR_JOB', '2019-03-08 11:16:50', 0, 'S', '');
INSERT INTO `rundetails` VALUES (12214, 'CompatibilityPluginScheduler.JobId.hipchatUpdateGlancesDataJob', '2019-03-08 11:16:58', 14, 'S', '');
INSERT INTO `rundetails` VALUES (12215, 'com.atlassian.jira.service.JiraService:10000', '2019-03-08 11:17:00', 2, 'S', '');

-- ----------------------------
-- Table structure for schemeissuesecurities
-- ----------------------------
DROP TABLE IF EXISTS `schemeissuesecurities`;
CREATE TABLE `schemeissuesecurities`  (
  `ID` decimal(18, 0) NOT NULL,
  `SCHEME` decimal(18, 0) NULL DEFAULT NULL,
  `SECURITY` decimal(18, 0) NULL DEFAULT NULL,
  `sec_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sec_parameter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `sec_scheme`(`SCHEME`) USING BTREE,
  INDEX `sec_security`(`SECURITY`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for schemeissuesecuritylevels
-- ----------------------------
DROP TABLE IF EXISTS `schemeissuesecuritylevels`;
CREATE TABLE `schemeissuesecuritylevels`  (
  `ID` decimal(18, 0) NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `SCHEME` decimal(18, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for schemepermissions
-- ----------------------------
DROP TABLE IF EXISTS `schemepermissions`;
CREATE TABLE `schemepermissions`  (
  `ID` decimal(18, 0) NOT NULL,
  `SCHEME` decimal(18, 0) NULL DEFAULT NULL,
  `PERMISSION` decimal(18, 0) NULL DEFAULT NULL,
  `perm_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `perm_parameter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PERMISSION_KEY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `prmssn_scheme`(`SCHEME`) USING BTREE,
  INDEX `permission_key_idx`(`PERMISSION_KEY`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of schemepermissions
-- ----------------------------
INSERT INTO `schemepermissions` VALUES (10000, NULL, 0, 'group', 'jira-administrators', NULL);
INSERT INTO `schemepermissions` VALUES (10004, 0, 23, 'projectrole', '10002', 'ADMINISTER_PROJECTS');
INSERT INTO `schemepermissions` VALUES (10005, 0, 10, 'applicationRole', '', 'BROWSE_PROJECTS');
INSERT INTO `schemepermissions` VALUES (10006, 0, 11, 'applicationRole', '', 'CREATE_ISSUES');
INSERT INTO `schemepermissions` VALUES (10007, 0, 15, 'applicationRole', '', 'ADD_COMMENTS');
INSERT INTO `schemepermissions` VALUES (10008, 0, 19, 'applicationRole', '', 'CREATE_ATTACHMENTS');
INSERT INTO `schemepermissions` VALUES (10009, 0, 13, 'applicationRole', '', 'ASSIGN_ISSUES');
INSERT INTO `schemepermissions` VALUES (10010, 0, 17, 'applicationRole', '', 'ASSIGNABLE_USER');
INSERT INTO `schemepermissions` VALUES (10011, 0, 14, 'applicationRole', '', 'RESOLVE_ISSUES');
INSERT INTO `schemepermissions` VALUES (10012, 0, 21, 'applicationRole', '', 'LINK_ISSUES');
INSERT INTO `schemepermissions` VALUES (10013, 0, 12, 'applicationRole', '', 'EDIT_ISSUES');
INSERT INTO `schemepermissions` VALUES (10014, 0, 16, 'projectrole', '10002', 'DELETE_ISSUES');
INSERT INTO `schemepermissions` VALUES (10015, 0, 18, 'applicationRole', '', 'CLOSE_ISSUES');
INSERT INTO `schemepermissions` VALUES (10016, 0, 25, 'applicationRole', '', 'MOVE_ISSUES');
INSERT INTO `schemepermissions` VALUES (10017, 0, 28, 'applicationRole', '', 'SCHEDULE_ISSUES');
INSERT INTO `schemepermissions` VALUES (10018, 0, 30, 'projectrole', '10002', 'MODIFY_REPORTER');
INSERT INTO `schemepermissions` VALUES (10019, 0, 20, 'applicationRole', '', 'WORK_ON_ISSUES');
INSERT INTO `schemepermissions` VALUES (10020, 0, 43, 'projectrole', '10002', 'DELETE_ALL_WORKLOGS');
INSERT INTO `schemepermissions` VALUES (10021, 0, 42, 'applicationRole', '', 'DELETE_OWN_WORKLOGS');
INSERT INTO `schemepermissions` VALUES (10022, 0, 41, 'projectrole', '10002', 'EDIT_ALL_WORKLOGS');
INSERT INTO `schemepermissions` VALUES (10023, 0, 40, 'applicationRole', '', 'EDIT_OWN_WORKLOGS');
INSERT INTO `schemepermissions` VALUES (10024, 0, 31, 'applicationRole', '', 'VIEW_VOTERS_AND_WATCHERS');
INSERT INTO `schemepermissions` VALUES (10025, 0, 32, 'projectrole', '10002', 'MANAGE_WATCHERS');
INSERT INTO `schemepermissions` VALUES (10026, 0, 34, 'projectrole', '10002', 'EDIT_ALL_COMMENTS');
INSERT INTO `schemepermissions` VALUES (10027, 0, 35, 'applicationRole', '', 'EDIT_OWN_COMMENTS');
INSERT INTO `schemepermissions` VALUES (10028, 0, 36, 'projectrole', '10002', 'DELETE_ALL_COMMENTS');
INSERT INTO `schemepermissions` VALUES (10029, 0, 37, 'applicationRole', '', 'DELETE_OWN_COMMENTS');
INSERT INTO `schemepermissions` VALUES (10030, 0, 38, 'projectrole', '10002', 'DELETE_ALL_ATTACHMENTS');
INSERT INTO `schemepermissions` VALUES (10031, 0, 39, 'applicationRole', '', 'DELETE_OWN_ATTACHMENTS');
INSERT INTO `schemepermissions` VALUES (10033, 0, 29, 'applicationRole', '', 'VIEW_DEV_TOOLS');
INSERT INTO `schemepermissions` VALUES (10101, NULL, 44, 'group', 'jira-administrators', NULL);
INSERT INTO `schemepermissions` VALUES (10200, 0, 45, 'applicationRole', '', 'VIEW_READONLY_WORKFLOW');
INSERT INTO `schemepermissions` VALUES (10300, 0, 46, 'applicationRole', '', 'TRANSITION_ISSUES');
INSERT INTO `schemepermissions` VALUES (10401, 0, NULL, 'projectrole', '10002', 'MANAGE_SPRINTS_PERMISSION');

-- ----------------------------
-- Table structure for searchrequest
-- ----------------------------
DROP TABLE IF EXISTS `searchrequest`;
CREATE TABLE `searchrequest`  (
  `ID` decimal(18, 0) NOT NULL,
  `filtername` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `authorname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `groupname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `projectid` decimal(18, 0) NULL DEFAULT NULL,
  `reqcontent` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `FAV_COUNT` decimal(18, 0) NULL DEFAULT NULL,
  `filtername_lower` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `sr_author`(`authorname`) USING BTREE,
  INDEX `searchrequest_filternameLower`(`filtername_lower`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sequence_value_item
-- ----------------------------
DROP TABLE IF EXISTS `sequence_value_item`;
CREATE TABLE `sequence_value_item`  (
  `SEQ_NAME` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SEQ_ID` decimal(18, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`SEQ_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sequence_value_item
-- ----------------------------
INSERT INTO `sequence_value_item` VALUES ('ApplicationUser', 10100);
INSERT INTO `sequence_value_item` VALUES ('AuditChangedValue', 10200);
INSERT INTO `sequence_value_item` VALUES ('AuditItem', 10100);
INSERT INTO `sequence_value_item` VALUES ('AuditLog', 10200);
INSERT INTO `sequence_value_item` VALUES ('Avatar', 10600);
INSERT INTO `sequence_value_item` VALUES ('ClusteredJob', 10700);
INSERT INTO `sequence_value_item` VALUES ('ColumnLayout', 10100);
INSERT INTO `sequence_value_item` VALUES ('ColumnLayoutItem', 10100);
INSERT INTO `sequence_value_item` VALUES ('ConfigurationContext', 10400);
INSERT INTO `sequence_value_item` VALUES ('CustomField', 10200);
INSERT INTO `sequence_value_item` VALUES ('CustomFieldOption', 10100);
INSERT INTO `sequence_value_item` VALUES ('EntityPropertyIndexDocument', 10100);
INSERT INTO `sequence_value_item` VALUES ('EventType', 10000);
INSERT INTO `sequence_value_item` VALUES ('Feature', 10200);
INSERT INTO `sequence_value_item` VALUES ('FieldConfigScheme', 10400);
INSERT INTO `sequence_value_item` VALUES ('FieldConfigSchemeIssueType', 10500);
INSERT INTO `sequence_value_item` VALUES ('FieldConfiguration', 10400);
INSERT INTO `sequence_value_item` VALUES ('FieldLayout', 10100);
INSERT INTO `sequence_value_item` VALUES ('FieldLayoutItem', 10200);
INSERT INTO `sequence_value_item` VALUES ('FieldScreen', 10000);
INSERT INTO `sequence_value_item` VALUES ('FieldScreenLayoutItem', 10200);
INSERT INTO `sequence_value_item` VALUES ('FieldScreenScheme', 10000);
INSERT INTO `sequence_value_item` VALUES ('FieldScreenSchemeItem', 10100);
INSERT INTO `sequence_value_item` VALUES ('FieldScreenTab', 10100);
INSERT INTO `sequence_value_item` VALUES ('GadgetUserPreference', 10100);
INSERT INTO `sequence_value_item` VALUES ('GenericConfiguration', 10200);
INSERT INTO `sequence_value_item` VALUES ('GlobalPermissionEntry', 10200);
INSERT INTO `sequence_value_item` VALUES ('Group', 10110);
INSERT INTO `sequence_value_item` VALUES ('IssueLinkType', 10300);
INSERT INTO `sequence_value_item` VALUES ('IssueType', 10100);
INSERT INTO `sequence_value_item` VALUES ('IssueTypeScreenSchemeEntity', 10100);
INSERT INTO `sequence_value_item` VALUES ('LicenseRoleDefault', 10100);
INSERT INTO `sequence_value_item` VALUES ('LicenseRoleGroup', 10100);
INSERT INTO `sequence_value_item` VALUES ('ListenerConfig', 10300);
INSERT INTO `sequence_value_item` VALUES ('ManagedConfigurationItem', 10200);
INSERT INTO `sequence_value_item` VALUES ('Membership', 10100);
INSERT INTO `sequence_value_item` VALUES ('Notification', 10200);
INSERT INTO `sequence_value_item` VALUES ('NotificationScheme', 10100);
INSERT INTO `sequence_value_item` VALUES ('OAuthConsumer', 10100);
INSERT INTO `sequence_value_item` VALUES ('OptionConfiguration', 10400);
INSERT INTO `sequence_value_item` VALUES ('OSPropertyEntry', 10500);
INSERT INTO `sequence_value_item` VALUES ('PluginVersion', 10300);
INSERT INTO `sequence_value_item` VALUES ('PortalPage', 10100);
INSERT INTO `sequence_value_item` VALUES ('PortletConfiguration', 10100);
INSERT INTO `sequence_value_item` VALUES ('Priority', 10000);
INSERT INTO `sequence_value_item` VALUES ('ProductLicense', 10100);
INSERT INTO `sequence_value_item` VALUES ('ProjectRole', 10100);
INSERT INTO `sequence_value_item` VALUES ('ProjectRoleActor', 10100);
INSERT INTO `sequence_value_item` VALUES ('ReindexComponent', 10200);
INSERT INTO `sequence_value_item` VALUES ('ReindexRequest', 10100);
INSERT INTO `sequence_value_item` VALUES ('RememberMeToken', 10100);
INSERT INTO `sequence_value_item` VALUES ('Resolution', 10000);
INSERT INTO `sequence_value_item` VALUES ('RunDetails', 12300);
INSERT INTO `sequence_value_item` VALUES ('SchemePermissions', 10500);
INSERT INTO `sequence_value_item` VALUES ('ServiceConfig', 10300);
INSERT INTO `sequence_value_item` VALUES ('SharePermissions', 10100);
INSERT INTO `sequence_value_item` VALUES ('Status', 10000);
INSERT INTO `sequence_value_item` VALUES ('TaskIdSequence', 10100);
INSERT INTO `sequence_value_item` VALUES ('UpgradeHistory', 10200);
INSERT INTO `sequence_value_item` VALUES ('UpgradeTaskHistory', 10200);
INSERT INTO `sequence_value_item` VALUES ('UpgradeTaskHistoryAuditLog', 10200);
INSERT INTO `sequence_value_item` VALUES ('UpgradeVersionHistory', 10100);
INSERT INTO `sequence_value_item` VALUES ('User', 10100);
INSERT INTO `sequence_value_item` VALUES ('UserAttribute', 10200);
INSERT INTO `sequence_value_item` VALUES ('UserHistoryItem', 10100);
INSERT INTO `sequence_value_item` VALUES ('Workflow', 10100);
INSERT INTO `sequence_value_item` VALUES ('WorkflowScheme', 10100);
INSERT INTO `sequence_value_item` VALUES ('WorkflowSchemeEntity', 10100);

-- ----------------------------
-- Table structure for serviceconfig
-- ----------------------------
DROP TABLE IF EXISTS `serviceconfig`;
CREATE TABLE `serviceconfig`  (
  `ID` decimal(18, 0) NOT NULL,
  `delaytime` decimal(18, 0) NULL DEFAULT NULL,
  `CLAZZ` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `servicename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CRON_EXPRESSION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of serviceconfig
-- ----------------------------
INSERT INTO `serviceconfig` VALUES (10000, 60000, 'com.atlassian.jira.service.services.mail.MailQueueService', 'Mail Queue Service', '0 * * * * ?');
INSERT INTO `serviceconfig` VALUES (10001, 43200000, 'com.atlassian.jira.service.services.export.ExportService', 'Backup Service', '0 0 8/12 * * ?');
INSERT INTO `serviceconfig` VALUES (10002, 86400000, 'com.atlassian.jira.service.services.auditing.AuditLogCleaningService', 'Audit log cleaning service', '0 0 8 * * ?');
INSERT INTO `serviceconfig` VALUES (10200, 43200000, 'com.atlassian.jira.service.services.export.ExportService', '备份服务', '0 0 10/12 * * ?');

-- ----------------------------
-- Table structure for sharepermissions
-- ----------------------------
DROP TABLE IF EXISTS `sharepermissions`;
CREATE TABLE `sharepermissions`  (
  `ID` decimal(18, 0) NOT NULL,
  `entityid` decimal(18, 0) NULL DEFAULT NULL,
  `entitytype` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sharetype` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PARAM1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PARAM2` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RIGHTS` decimal(9, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `share_index`(`entityid`, `entitytype`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sharepermissions
-- ----------------------------
INSERT INTO `sharepermissions` VALUES (10000, 10000, 'PortalPage', 'global', NULL, NULL, 1);

-- ----------------------------
-- Table structure for tempattachmentsmonitor
-- ----------------------------
DROP TABLE IF EXISTS `tempattachmentsmonitor`;
CREATE TABLE `tempattachmentsmonitor`  (
  `TEMPORARY_ATTACHMENT_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `FORM_TOKEN` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FILE_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CONTENT_TYPE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FILE_SIZE` decimal(18, 0) NULL DEFAULT NULL,
  `CREATED_TIME` decimal(18, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`TEMPORARY_ATTACHMENT_ID`) USING BTREE,
  INDEX `idx_tam_by_form_token`(`FORM_TOKEN`) USING BTREE,
  INDEX `idx_tam_by_created_time`(`CREATED_TIME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for trackback_ping
-- ----------------------------
DROP TABLE IF EXISTS `trackback_ping`;
CREATE TABLE `trackback_ping`  (
  `ID` decimal(18, 0) NOT NULL,
  `ISSUE` decimal(18, 0) NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TITLE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BLOGNAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXCERPT` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATED` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for trustedapp
-- ----------------------------
DROP TABLE IF EXISTS `trustedapp`;
CREATE TABLE `trustedapp`  (
  `ID` decimal(18, 0) NOT NULL,
  `APPLICATION_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PUBLIC_KEY` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `IP_MATCH` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `URL_MATCH` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `TIMEOUT` decimal(18, 0) NULL DEFAULT NULL,
  `CREATED` datetime(0) NULL DEFAULT NULL,
  `CREATED_BY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UPDATED` datetime(0) NULL DEFAULT NULL,
  `UPDATED_BY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `trustedapp_id`(`APPLICATION_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for upgradehistory
-- ----------------------------
DROP TABLE IF EXISTS `upgradehistory`;
CREATE TABLE `upgradehistory`  (
  `ID` decimal(18, 0) NULL DEFAULT NULL,
  `UPGRADECLASS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TARGETBUILD` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STATUS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOWNGRADETASKREQUIRED` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`UPGRADECLASS`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of upgradehistory
-- ----------------------------
INSERT INTO `upgradehistory` VALUES (10000, 'com.atlassian.jira.upgrade.tasks.UpgradeTask_Build70100', '70100', 'complete', 'Y');
INSERT INTO `upgradehistory` VALUES (10100, 'com.atlassian.jira.upgrade.tasks.UpgradeTask_Build70101', '70101', 'complete', 'N');
INSERT INTO `upgradehistory` VALUES (10101, 'com.atlassian.jira.upgrade.tasks.UpgradeTask_Build70102', '70102', 'complete', 'N');
INSERT INTO `upgradehistory` VALUES (10102, 'com.atlassian.jira.upgrade.tasks.UpgradeTask_Build71001', '71001', 'complete', 'N');
INSERT INTO `upgradehistory` VALUES (10103, 'com.atlassian.jira.upgrade.tasks.UpgradeTask_Build72001', '72001', 'complete', 'N');
INSERT INTO `upgradehistory` VALUES (10104, 'com.atlassian.jira.upgrade.tasks.UpgradeTask_Build72002', '72002', 'complete', 'N');
INSERT INTO `upgradehistory` VALUES (10105, 'com.atlassian.jira.upgrade.tasks.UpgradeTask_Build73002', '73002', 'complete', 'N');

-- ----------------------------
-- Table structure for upgradetaskhistory
-- ----------------------------
DROP TABLE IF EXISTS `upgradetaskhistory`;
CREATE TABLE `upgradetaskhistory`  (
  `ID` decimal(18, 0) NOT NULL,
  `UPGRADE_TASK_FACTORY_KEY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BUILD_NUMBER` decimal(9, 0) NULL DEFAULT NULL,
  `STATUS` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UPGRADE_TYPE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of upgradetaskhistory
-- ----------------------------
INSERT INTO `upgradetaskhistory` VALUES (10006, 'host', 73010, 'COMPLETED', 'SERVER');
INSERT INTO `upgradetaskhistory` VALUES (10007, 'host', 73011, 'COMPLETED', 'SERVER');
INSERT INTO `upgradetaskhistory` VALUES (10008, 'host', 74002, 'COMPLETED', 'SERVER');
INSERT INTO `upgradetaskhistory` VALUES (10009, 'host', 75002, 'COMPLETED', 'SERVER');
INSERT INTO `upgradetaskhistory` VALUES (10010, 'host', 75003, 'COMPLETED', 'SERVER');
INSERT INTO `upgradetaskhistory` VALUES (10011, 'host', 75004, 'COMPLETED', 'SERVER');
INSERT INTO `upgradetaskhistory` VALUES (10012, 'host', 75005, 'COMPLETED', 'SERVER');
INSERT INTO `upgradetaskhistory` VALUES (10013, 'host', 76001, 'COMPLETED', 'SERVER');
INSERT INTO `upgradetaskhistory` VALUES (10014, 'host', 77001, 'COMPLETED', 'SERVER');
INSERT INTO `upgradetaskhistory` VALUES (10015, 'host', 710001, 'COMPLETED', 'SERVER');
INSERT INTO `upgradetaskhistory` VALUES (10016, 'host', 711001, 'COMPLETED', 'SERVER');
INSERT INTO `upgradetaskhistory` VALUES (10017, 'host', 712001, 'COMPLETED', 'SERVER');
INSERT INTO `upgradetaskhistory` VALUES (10018, 'host', 800000, 'COMPLETED', 'SERVER');
INSERT INTO `upgradetaskhistory` VALUES (10019, 'host', 800003, 'COMPLETED', 'SERVER');
INSERT INTO `upgradetaskhistory` VALUES (10020, 'host', 800004, 'COMPLETED', 'SERVER');
INSERT INTO `upgradetaskhistory` VALUES (10021, 'host', 800005, 'COMPLETED', 'SERVER');
INSERT INTO `upgradetaskhistory` VALUES (10022, 'host', 800006, 'COMPLETED', 'SERVER');
INSERT INTO `upgradetaskhistory` VALUES (10023, 'host', 800007, 'COMPLETED', 'SERVER');
INSERT INTO `upgradetaskhistory` VALUES (10024, 'host', 800009, 'COMPLETED', 'SERVER');
INSERT INTO `upgradetaskhistory` VALUES (10100, 'com.atlassian.jira.plugins.jira-development-integration-plugin', 1, 'COMPLETED', 'SERVER');
INSERT INTO `upgradetaskhistory` VALUES (10101, 'com.atlassian.jira.plugins.jira-development-integration-plugin', 2, 'COMPLETED', 'SERVER');
INSERT INTO `upgradetaskhistory` VALUES (10102, 'com.atlassian.jira.plugins.jira-development-integration-plugin', 3, 'COMPLETED', 'SERVER');

-- ----------------------------
-- Table structure for upgradetaskhistoryauditlog
-- ----------------------------
DROP TABLE IF EXISTS `upgradetaskhistoryauditlog`;
CREATE TABLE `upgradetaskhistoryauditlog`  (
  `ID` decimal(18, 0) NOT NULL,
  `UPGRADE_TASK_FACTORY_KEY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BUILD_NUMBER` decimal(9, 0) NULL DEFAULT NULL,
  `STATUS` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UPGRADE_TYPE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TIMEPERFORMED` datetime(0) NULL DEFAULT NULL,
  `ACTION` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of upgradetaskhistoryauditlog
-- ----------------------------
INSERT INTO `upgradetaskhistoryauditlog` VALUES (10000, 'host', 70101, 'COMPLETED', 'SERVER', '2019-03-07 22:03:13', 'upgrade');
INSERT INTO `upgradetaskhistoryauditlog` VALUES (10001, 'host', 70102, 'COMPLETED', 'SERVER', '2019-03-07 22:03:13', 'upgrade');
INSERT INTO `upgradetaskhistoryauditlog` VALUES (10002, 'host', 71001, 'COMPLETED', 'SERVER', '2019-03-07 22:03:13', 'upgrade');
INSERT INTO `upgradetaskhistoryauditlog` VALUES (10003, 'host', 72001, 'COMPLETED', 'SERVER', '2019-03-07 22:03:13', 'upgrade');
INSERT INTO `upgradetaskhistoryauditlog` VALUES (10004, 'host', 72002, 'COMPLETED', 'SERVER', '2019-03-07 22:03:14', 'upgrade');
INSERT INTO `upgradetaskhistoryauditlog` VALUES (10005, 'host', 73002, 'COMPLETED', 'SERVER', '2019-03-07 22:03:14', 'upgrade');
INSERT INTO `upgradetaskhistoryauditlog` VALUES (10006, 'host', 73010, 'COMPLETED', 'SERVER', '2019-03-07 22:03:14', 'upgrade');
INSERT INTO `upgradetaskhistoryauditlog` VALUES (10007, 'host', 73011, 'COMPLETED', 'SERVER', '2019-03-07 22:03:14', 'upgrade');
INSERT INTO `upgradetaskhistoryauditlog` VALUES (10008, 'host', 74002, 'COMPLETED', 'SERVER', '2019-03-07 22:03:14', 'upgrade');
INSERT INTO `upgradetaskhistoryauditlog` VALUES (10009, 'host', 75002, 'COMPLETED', 'SERVER', '2019-03-07 22:03:14', 'upgrade');
INSERT INTO `upgradetaskhistoryauditlog` VALUES (10010, 'host', 75003, 'COMPLETED', 'SERVER', '2019-03-07 22:03:14', 'upgrade');
INSERT INTO `upgradetaskhistoryauditlog` VALUES (10011, 'host', 75004, 'COMPLETED', 'SERVER', '2019-03-07 22:03:14', 'upgrade');
INSERT INTO `upgradetaskhistoryauditlog` VALUES (10012, 'host', 75005, 'COMPLETED', 'SERVER', '2019-03-07 22:03:14', 'upgrade');
INSERT INTO `upgradetaskhistoryauditlog` VALUES (10013, 'host', 76001, 'COMPLETED', 'SERVER', '2019-03-07 22:03:14', 'upgrade');
INSERT INTO `upgradetaskhistoryauditlog` VALUES (10014, 'host', 77001, 'COMPLETED', 'SERVER', '2019-03-07 22:03:14', 'upgrade');
INSERT INTO `upgradetaskhistoryauditlog` VALUES (10015, 'host', 710001, 'COMPLETED', 'SERVER', '2019-03-07 22:03:14', 'upgrade');
INSERT INTO `upgradetaskhistoryauditlog` VALUES (10016, 'host', 711001, 'COMPLETED', 'SERVER', '2019-03-07 22:03:14', 'upgrade');
INSERT INTO `upgradetaskhistoryauditlog` VALUES (10017, 'host', 712001, 'COMPLETED', 'SERVER', '2019-03-07 22:03:14', 'upgrade');
INSERT INTO `upgradetaskhistoryauditlog` VALUES (10018, 'host', 800000, 'COMPLETED', 'SERVER', '2019-03-07 22:03:14', 'upgrade');
INSERT INTO `upgradetaskhistoryauditlog` VALUES (10019, 'host', 800003, 'COMPLETED', 'SERVER', '2019-03-07 22:03:15', 'upgrade');
INSERT INTO `upgradetaskhistoryauditlog` VALUES (10020, 'host', 800004, 'COMPLETED', 'SERVER', '2019-03-07 22:03:15', 'upgrade');
INSERT INTO `upgradetaskhistoryauditlog` VALUES (10021, 'host', 800005, 'COMPLETED', 'SERVER', '2019-03-07 22:03:15', 'upgrade');
INSERT INTO `upgradetaskhistoryauditlog` VALUES (10022, 'host', 800006, 'COMPLETED', 'SERVER', '2019-03-07 22:03:15', 'upgrade');
INSERT INTO `upgradetaskhistoryauditlog` VALUES (10023, 'host', 800007, 'COMPLETED', 'SERVER', '2019-03-07 22:03:15', 'upgrade');
INSERT INTO `upgradetaskhistoryauditlog` VALUES (10024, 'host', 800009, 'COMPLETED', 'SERVER', '2019-03-07 22:03:15', 'upgrade');
INSERT INTO `upgradetaskhistoryauditlog` VALUES (10100, 'com.atlassian.jira.plugins.jira-development-integration-plugin', 1, 'COMPLETED', 'SERVER', '2019-03-07 22:10:49', 'upgrade');
INSERT INTO `upgradetaskhistoryauditlog` VALUES (10101, 'com.atlassian.jira.plugins.jira-development-integration-plugin', 2, 'COMPLETED', 'SERVER', '2019-03-07 22:10:49', 'upgrade');
INSERT INTO `upgradetaskhistoryauditlog` VALUES (10102, 'com.atlassian.jira.plugins.jira-development-integration-plugin', 3, 'COMPLETED', 'SERVER', '2019-03-07 22:10:49', 'upgrade');

-- ----------------------------
-- Table structure for upgradeversionhistory
-- ----------------------------
DROP TABLE IF EXISTS `upgradeversionhistory`;
CREATE TABLE `upgradeversionhistory`  (
  `ID` decimal(18, 0) NULL DEFAULT NULL,
  `TIMEPERFORMED` datetime(0) NULL DEFAULT NULL,
  `TARGETBUILD` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TARGETVERSION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`TARGETBUILD`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of upgradeversionhistory
-- ----------------------------
INSERT INTO `upgradeversionhistory` VALUES (10000, '2019-03-07 22:03:15', '800009', '8.0.2');

-- ----------------------------
-- Table structure for userassociation
-- ----------------------------
DROP TABLE IF EXISTS `userassociation`;
CREATE TABLE `userassociation`  (
  `SOURCE_NAME` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SINK_NODE_ID` decimal(18, 0) NOT NULL,
  `SINK_NODE_ENTITY` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ASSOCIATION_TYPE` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SEQUENCE` decimal(9, 0) NULL DEFAULT NULL,
  `CREATED` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`SOURCE_NAME`, `SINK_NODE_ID`, `SINK_NODE_ENTITY`, `ASSOCIATION_TYPE`) USING BTREE,
  INDEX `user_source`(`SOURCE_NAME`) USING BTREE,
  INDEX `user_sink`(`SINK_NODE_ID`, `SINK_NODE_ENTITY`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for userbase
-- ----------------------------
DROP TABLE IF EXISTS `userbase`;
CREATE TABLE `userbase`  (
  `ID` decimal(18, 0) NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PASSWORD_HASH` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `osuser_name`(`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for userhistoryitem
-- ----------------------------
DROP TABLE IF EXISTS `userhistoryitem`;
CREATE TABLE `userhistoryitem`  (
  `ID` decimal(18, 0) NOT NULL,
  `entitytype` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `entityid` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `lastviewed` decimal(18, 0) NULL DEFAULT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `uh_type_user_entity`(`entitytype`, `USERNAME`, `entityid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userhistoryitem
-- ----------------------------
INSERT INTO `userhistoryitem` VALUES (10000, 'Dashboard', '10000', 'yc', 1552014443445, NULL);

-- ----------------------------
-- Table structure for userpickerfilter
-- ----------------------------
DROP TABLE IF EXISTS `userpickerfilter`;
CREATE TABLE `userpickerfilter`  (
  `ID` decimal(18, 0) NOT NULL,
  `CUSTOMFIELD` decimal(18, 0) NULL DEFAULT NULL,
  `CUSTOMFIELDCONFIG` decimal(18, 0) NULL DEFAULT NULL,
  `enabled` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `upf_customfield`(`CUSTOMFIELD`) USING BTREE,
  INDEX `upf_fieldconfigid`(`CUSTOMFIELDCONFIG`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for userpickerfiltergroup
-- ----------------------------
DROP TABLE IF EXISTS `userpickerfiltergroup`;
CREATE TABLE `userpickerfiltergroup`  (
  `ID` decimal(18, 0) NOT NULL,
  `USERPICKERFILTER` decimal(18, 0) NULL DEFAULT NULL,
  `groupname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `cf_userpickerfiltergroup`(`USERPICKERFILTER`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for userpickerfilterrole
-- ----------------------------
DROP TABLE IF EXISTS `userpickerfilterrole`;
CREATE TABLE `userpickerfilterrole`  (
  `ID` decimal(18, 0) NOT NULL,
  `USERPICKERFILTER` decimal(18, 0) NULL DEFAULT NULL,
  `PROJECTROLEID` decimal(18, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `cf_userpickerfilterrole`(`USERPICKERFILTER`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for versioncontrol
-- ----------------------------
DROP TABLE IF EXISTS `versioncontrol`;
CREATE TABLE `versioncontrol`  (
  `ID` decimal(18, 0) NOT NULL,
  `vcsname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `vcsdescription` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `vcstype` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for votehistory
-- ----------------------------
DROP TABLE IF EXISTS `votehistory`;
CREATE TABLE `votehistory`  (
  `ID` decimal(18, 0) NOT NULL,
  `issueid` decimal(18, 0) NULL DEFAULT NULL,
  `VOTES` decimal(18, 0) NULL DEFAULT NULL,
  `TIMESTAMP` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `votehistory_issue_index`(`issueid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for workflowscheme
-- ----------------------------
DROP TABLE IF EXISTS `workflowscheme`;
CREATE TABLE `workflowscheme`  (
  `ID` decimal(18, 0) NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of workflowscheme
-- ----------------------------
INSERT INTO `workflowscheme` VALUES (10000, 'classic', 'classic');

-- ----------------------------
-- Table structure for workflowschemeentity
-- ----------------------------
DROP TABLE IF EXISTS `workflowschemeentity`;
CREATE TABLE `workflowschemeentity`  (
  `ID` decimal(18, 0) NOT NULL,
  `SCHEME` decimal(18, 0) NULL DEFAULT NULL,
  `WORKFLOW` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `issuetype` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `workflow_scheme`(`SCHEME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of workflowschemeentity
-- ----------------------------
INSERT INTO `workflowschemeentity` VALUES (10000, 10000, 'classic default workflow', '0');

-- ----------------------------
-- Table structure for worklog
-- ----------------------------
DROP TABLE IF EXISTS `worklog`;
CREATE TABLE `worklog`  (
  `ID` decimal(18, 0) NOT NULL,
  `issueid` decimal(18, 0) NULL DEFAULT NULL,
  `AUTHOR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `grouplevel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `rolelevel` decimal(18, 0) NULL DEFAULT NULL,
  `worklogbody` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `CREATED` datetime(0) NULL DEFAULT NULL,
  `UPDATEAUTHOR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UPDATED` datetime(0) NULL DEFAULT NULL,
  `STARTDATE` datetime(0) NULL DEFAULT NULL,
  `timeworked` decimal(18, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `worklog_issue`(`issueid`) USING BTREE,
  INDEX `worklog_author`(`AUTHOR`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
