/*
 Navicat Premium Data Transfer

 Source Server         : 150.158.156.225
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : 150.158.156.225:3306
 Source Schema         : jizhangxitong

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 15/03/2021 20:29:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for accou_cate
-- ----------------------------
DROP TABLE IF EXISTS `accou_cate`;
CREATE TABLE `accou_cate`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `names` varchar(21) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of accou_cate
-- ----------------------------
INSERT INTO `accou_cate` VALUES (1, '生活用水');
INSERT INTO `accou_cate` VALUES (2, '超市购物');

-- ----------------------------
-- Table structure for account_msg
-- ----------------------------
DROP TABLE IF EXISTS `account_msg`;
CREATE TABLE `account_msg`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `cate_id` int(0) NULL DEFAULT NULL COMMENT '分类名',
  `cate_kind` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '记账类型',
  `cate_msg` varchar(38) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '记账标题',
  `cate_txt` varchar(68) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_date` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `user_id` bigint(0) NULL DEFAULT NULL COMMENT '用户ID',
  `show_money` decimal(7, 2) NULL DEFAULT NULL COMMENT '金额',
  `use_way` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用途',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of account_msg
-- ----------------------------
INSERT INTO `account_msg` VALUES (1, 2, '2', 'tiaoti 1', '111', '2020-10-25 13:35:13', 1, 12.00, '11');
INSERT INTO `account_msg` VALUES (2, 2, '1', 'biaoti2', 'beizhu 1', '2020-10-26 14:01:43', 1, 11.00, 'yongtu 1');
INSERT INTO `account_msg` VALUES (3, 2, '1', '11', '1', '2020-10-27 14:03:05', 1, 11.00, '1');
INSERT INTO `account_msg` VALUES (4, 2, '1', '11', '1', '2020-10-27 14:03:52', 1, 1.00, '1');
INSERT INTO `account_msg` VALUES (5, 2, '1', '11', '1', '2020-10-27 14:06:16', 1, 11.00, '1');
INSERT INTO `account_msg` VALUES (6, 2, '1', '11', '1', '2020-10-27 14:09:11', 1, 1.00, '1');
INSERT INTO `account_msg` VALUES (7, 1, '2', '34', 'd ', '2020-10-16 15:57:30', 2, 3.00, '12');
INSERT INTO `account_msg` VALUES (8, 1, '2', '35', 'sddc', '2020-10-29 15:57:53', 2, 23.00, '11');
INSERT INTO `account_msg` VALUES (9, 1, '2', '34', 'evsds', '2020-10-13 15:58:57', 2, 33.00, '23');

-- ----------------------------
-- Table structure for data_total
-- ----------------------------
DROP TABLE IF EXISTS `data_total`;
CREATE TABLE `data_total`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `user_id` bigint(0) NULL DEFAULT NULL COMMENT '用户ID',
  `pay_money` decimal(7, 2) NULL DEFAULT 0.00 COMMENT '支出',
  `income_money` decimal(7, 2) NULL DEFAULT 0.00 COMMENT '收入',
  `create_date` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of data_total
-- ----------------------------
INSERT INTO `data_total` VALUES (1, 1, 11.00, 23.00, '2020-10-27 22:26:14');
INSERT INTO `data_total` VALUES (2, 1, 12.00, 24.00, '2020-10-28 22:30:21');
INSERT INTO `data_total` VALUES (3, 1, 0.00, 0.00, '2020-10-29 22:48:34');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `BLOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `SCHED_NAME`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CRON_EXPRESSION` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TIME_ZONE_ID` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', '0 0/30 * * * ?', 'Etc/UTC');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ENTRY_ID` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FIRED_TIME` bigint(0) NOT NULL,
  `SCHED_TIME` bigint(0) NOT NULL,
  `PRIORITY` int(0) NOT NULL,
  `STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `ENTRY_ID`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TRIG_INST_NAME`(`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE,
  INDEX `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY`(`SCHED_NAME`, `INSTANCE_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `IDX_QRTZ_FT_J_G`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_T_G`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TG`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_DURABLE` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_UPDATE_DATA` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_J_REQ_RECOVERY`(`SCHED_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `IDX_QRTZ_J_GRP`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', NULL, 'io.renren.modules.job.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E72656E72656E2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200074C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017567EEA7187874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672656E72656E74000CE58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LOCK_NAME` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `LOCK_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LAST_CHECKIN_TIME` bigint(0) NOT NULL,
  `CHECKIN_INTERVAL` bigint(0) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RenrenScheduler', 'c739a767d6ab1614930219518', 1615811347852, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REPEAT_COUNT` bigint(0) NOT NULL,
  `REPEAT_INTERVAL` bigint(0) NOT NULL,
  `TIMES_TRIGGERED` bigint(0) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `STR_PROP_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR_PROP_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR_PROP_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `INT_PROP_1` int(0) NULL DEFAULT NULL,
  `INT_PROP_2` int(0) NULL DEFAULT NULL,
  `LONG_PROP_1` bigint(0) NULL DEFAULT NULL,
  `LONG_PROP_2` bigint(0) NULL DEFAULT NULL,
  `DEC_PROP_1` decimal(13, 4) NULL DEFAULT NULL,
  `DEC_PROP_2` decimal(13, 4) NULL DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(0) NULL DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(0) NULL DEFAULT NULL,
  `PRIORITY` int(0) NULL DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_TYPE` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `START_TIME` bigint(0) NOT NULL,
  `END_TIME` bigint(0) NULL DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MISFIRE_INSTR` smallint(0) NULL DEFAULT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_J`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_C`(`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE,
  INDEX `IDX_QRTZ_T_G`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_STATE`(`SCHED_NAME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_N_STATE`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_N_G_STATE`(`SCHED_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_NEXT_FIRE_TIME`(`SCHED_NAME`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST`(`SCHED_NAME`, `TRIGGER_STATE`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_MISFIRE`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', 'TASK_1', 'DEFAULT', NULL, 1615811400000, 1615809600000, 5, 'WAITING', 'CRON', 1603766512000, 0, NULL, 2, 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E72656E72656E2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200074C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017567EEA7187874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672656E72656E74000CE58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);

-- ----------------------------
-- Table structure for schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job`  (
  `job_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(0) NULL DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of schedule_job
-- ----------------------------
INSERT INTO `schedule_job` VALUES (1, 'testTask', 'renren', '0 0/30 * * * ?', 0, '参数测试', '2020-10-27 10:41:35');

-- ----------------------------
-- Table structure for schedule_job_log
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log`  (
  `log_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint(0) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参数',
  `status` tinyint(0) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '失败信息',
  `times` int(0) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`) USING BTREE,
  INDEX `job_id`(`job_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 521 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务日志' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of schedule_job_log
-- ----------------------------
INSERT INTO `schedule_job_log` VALUES (1, 1, 'testTask', 'renren', 0, NULL, 1, '2020-10-27 11:30:00');
INSERT INTO `schedule_job_log` VALUES (2, 1, 'testTask', 'renren', 0, NULL, 1, '2020-10-27 12:33:17');
INSERT INTO `schedule_job_log` VALUES (3, 1, 'testTask', 'renren', 0, NULL, 2, '2020-10-27 13:00:00');
INSERT INTO `schedule_job_log` VALUES (4, 1, 'testTask', 'renren', 0, NULL, 1, '2020-10-27 14:00:00');
INSERT INTO `schedule_job_log` VALUES (5, 1, 'testTask', 'renren', 0, NULL, 1, '2020-10-27 15:00:00');
INSERT INTO `schedule_job_log` VALUES (6, 1, 'testTask', 'renren', 0, NULL, 2, '2020-10-27 16:00:00');
INSERT INTO `schedule_job_log` VALUES (7, 1, 'testTask', 'renren', 0, NULL, 1, '2020-10-27 18:00:00');
INSERT INTO `schedule_job_log` VALUES (8, 1, 'testTask', 'renren', 0, NULL, 1, '2020-10-27 18:30:00');
INSERT INTO `schedule_job_log` VALUES (9, 1, 'testTask', 'renren', 0, NULL, 2, '2020-10-27 19:00:00');
INSERT INTO `schedule_job_log` VALUES (10, 1, 'testTask', 'renren', 0, NULL, 3, '2020-10-27 19:30:00');
INSERT INTO `schedule_job_log` VALUES (11, 1, 'testTask', 'renren', 0, NULL, 4, '2020-10-27 20:00:00');
INSERT INTO `schedule_job_log` VALUES (12, 1, 'testTask', 'renren', 0, NULL, 2, '2020-10-27 20:30:00');
INSERT INTO `schedule_job_log` VALUES (13, 1, 'testTask', 'renren', 0, NULL, 1, '2020-10-27 21:00:00');
INSERT INTO `schedule_job_log` VALUES (14, 1, 'testTask', 'renren', 0, NULL, 2, '2020-10-27 21:30:00');
INSERT INTO `schedule_job_log` VALUES (15, 1, 'testTask', 'renren', 0, NULL, 1, '2020-10-27 22:30:00');
INSERT INTO `schedule_job_log` VALUES (16, 1, 'testTask', 'renren', 0, NULL, 116, '2020-10-27 23:00:00');
INSERT INTO `schedule_job_log` VALUES (17, 1, 'testTask', 'renren', 0, NULL, 1, '2020-10-28 09:30:00');
INSERT INTO `schedule_job_log` VALUES (18, 1, 'testTask', 'renren', 0, NULL, 1, '2020-10-28 10:30:00');
INSERT INTO `schedule_job_log` VALUES (19, 1, 'testTask', 'renren', 0, NULL, 2, '2020-10-28 11:00:00');
INSERT INTO `schedule_job_log` VALUES (20, 1, 'testTask', 'renren', 0, NULL, 1, '2020-10-28 11:30:00');
INSERT INTO `schedule_job_log` VALUES (21, 1, 'testTask', 'renren', 0, NULL, 1, '2020-10-28 12:00:00');
INSERT INTO `schedule_job_log` VALUES (22, 1, 'testTask', 'renren', 0, NULL, 1, '2020-10-28 12:30:00');
INSERT INTO `schedule_job_log` VALUES (23, 1, 'testTask', 'renren', 0, NULL, 5, '2020-10-28 13:00:00');
INSERT INTO `schedule_job_log` VALUES (24, 1, 'testTask', 'renren', 0, NULL, 1, '2020-10-28 13:30:00');
INSERT INTO `schedule_job_log` VALUES (25, 1, 'testTask', 'renren', 0, NULL, 5, '2020-10-28 14:00:00');
INSERT INTO `schedule_job_log` VALUES (26, 1, 'testTask', 'renren', 0, NULL, 1, '2020-10-28 14:30:00');
INSERT INTO `schedule_job_log` VALUES (27, 1, 'testTask', 'renren', 0, NULL, 3, '2020-10-29 10:00:00');
INSERT INTO `schedule_job_log` VALUES (28, 1, 'testTask', 'renren', 0, NULL, 1, '2020-11-02 13:00:00');
INSERT INTO `schedule_job_log` VALUES (29, 1, 'testTask', 'renren', 0, NULL, 3, '2020-11-02 13:30:00');
INSERT INTO `schedule_job_log` VALUES (30, 1, 'testTask', 'renren', 0, NULL, 3, '2020-11-02 14:00:00');
INSERT INTO `schedule_job_log` VALUES (31, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-23 21:00:00');
INSERT INTO `schedule_job_log` VALUES (32, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-05 16:00:00');
INSERT INTO `schedule_job_log` VALUES (33, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-05 16:30:00');
INSERT INTO `schedule_job_log` VALUES (34, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-05 17:00:00');
INSERT INTO `schedule_job_log` VALUES (35, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-05 17:30:00');
INSERT INTO `schedule_job_log` VALUES (36, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-05 18:00:00');
INSERT INTO `schedule_job_log` VALUES (37, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-05 18:30:00');
INSERT INTO `schedule_job_log` VALUES (38, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-05 19:00:00');
INSERT INTO `schedule_job_log` VALUES (39, 1, 'testTask', 'renren', 0, NULL, 2, '2021-03-05 19:30:00');
INSERT INTO `schedule_job_log` VALUES (40, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-05 20:00:00');
INSERT INTO `schedule_job_log` VALUES (41, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-05 20:30:00');
INSERT INTO `schedule_job_log` VALUES (42, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-05 21:00:00');
INSERT INTO `schedule_job_log` VALUES (43, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-05 21:30:00');
INSERT INTO `schedule_job_log` VALUES (44, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-05 22:00:00');
INSERT INTO `schedule_job_log` VALUES (45, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-05 22:30:00');
INSERT INTO `schedule_job_log` VALUES (46, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-05 23:00:00');
INSERT INTO `schedule_job_log` VALUES (47, 1, 'testTask', 'renren', 0, NULL, 2, '2021-03-05 23:30:00');
INSERT INTO `schedule_job_log` VALUES (48, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-06 00:00:00');
INSERT INTO `schedule_job_log` VALUES (49, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-06 00:30:00');
INSERT INTO `schedule_job_log` VALUES (50, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-06 01:00:00');
INSERT INTO `schedule_job_log` VALUES (51, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-06 01:30:00');
INSERT INTO `schedule_job_log` VALUES (52, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-06 02:00:00');
INSERT INTO `schedule_job_log` VALUES (53, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-06 02:30:00');
INSERT INTO `schedule_job_log` VALUES (54, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-06 03:00:00');
INSERT INTO `schedule_job_log` VALUES (55, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-06 03:30:00');
INSERT INTO `schedule_job_log` VALUES (56, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-06 04:00:00');
INSERT INTO `schedule_job_log` VALUES (57, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-06 04:30:00');
INSERT INTO `schedule_job_log` VALUES (58, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-06 05:00:00');
INSERT INTO `schedule_job_log` VALUES (59, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-06 05:30:00');
INSERT INTO `schedule_job_log` VALUES (60, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-06 06:00:00');
INSERT INTO `schedule_job_log` VALUES (61, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-06 06:30:00');
INSERT INTO `schedule_job_log` VALUES (62, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-06 07:00:00');
INSERT INTO `schedule_job_log` VALUES (63, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-06 07:30:00');
INSERT INTO `schedule_job_log` VALUES (64, 1, 'testTask', 'renren', 0, NULL, 4, '2021-03-06 08:00:00');
INSERT INTO `schedule_job_log` VALUES (65, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-06 08:30:00');
INSERT INTO `schedule_job_log` VALUES (66, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-06 09:00:00');
INSERT INTO `schedule_job_log` VALUES (67, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-06 09:30:00');
INSERT INTO `schedule_job_log` VALUES (68, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-06 10:00:00');
INSERT INTO `schedule_job_log` VALUES (69, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-06 10:30:00');
INSERT INTO `schedule_job_log` VALUES (70, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-06 11:00:00');
INSERT INTO `schedule_job_log` VALUES (71, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-06 11:30:00');
INSERT INTO `schedule_job_log` VALUES (72, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-06 12:00:00');
INSERT INTO `schedule_job_log` VALUES (73, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-06 12:30:00');
INSERT INTO `schedule_job_log` VALUES (74, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-06 13:00:00');
INSERT INTO `schedule_job_log` VALUES (75, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-06 13:30:00');
INSERT INTO `schedule_job_log` VALUES (76, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-06 14:00:00');
INSERT INTO `schedule_job_log` VALUES (77, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-06 14:30:00');
INSERT INTO `schedule_job_log` VALUES (78, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-06 15:00:00');
INSERT INTO `schedule_job_log` VALUES (79, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-06 15:30:00');
INSERT INTO `schedule_job_log` VALUES (80, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-06 16:00:00');
INSERT INTO `schedule_job_log` VALUES (81, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-06 16:30:00');
INSERT INTO `schedule_job_log` VALUES (82, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-06 17:00:00');
INSERT INTO `schedule_job_log` VALUES (83, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-06 17:30:00');
INSERT INTO `schedule_job_log` VALUES (84, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-06 18:00:00');
INSERT INTO `schedule_job_log` VALUES (85, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-06 18:30:00');
INSERT INTO `schedule_job_log` VALUES (86, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-06 19:00:00');
INSERT INTO `schedule_job_log` VALUES (87, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-06 19:30:00');
INSERT INTO `schedule_job_log` VALUES (88, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-06 20:00:00');
INSERT INTO `schedule_job_log` VALUES (89, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-06 20:30:00');
INSERT INTO `schedule_job_log` VALUES (90, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-06 21:00:00');
INSERT INTO `schedule_job_log` VALUES (91, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-06 21:30:00');
INSERT INTO `schedule_job_log` VALUES (92, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-06 22:00:00');
INSERT INTO `schedule_job_log` VALUES (93, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-06 22:30:00');
INSERT INTO `schedule_job_log` VALUES (94, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-06 23:00:00');
INSERT INTO `schedule_job_log` VALUES (95, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-06 23:30:00');
INSERT INTO `schedule_job_log` VALUES (96, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-07 00:00:00');
INSERT INTO `schedule_job_log` VALUES (97, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-07 00:30:00');
INSERT INTO `schedule_job_log` VALUES (98, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-07 01:00:00');
INSERT INTO `schedule_job_log` VALUES (99, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-07 01:30:00');
INSERT INTO `schedule_job_log` VALUES (100, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-07 02:00:00');
INSERT INTO `schedule_job_log` VALUES (101, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-07 02:30:00');
INSERT INTO `schedule_job_log` VALUES (102, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-07 03:00:00');
INSERT INTO `schedule_job_log` VALUES (103, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-07 03:30:00');
INSERT INTO `schedule_job_log` VALUES (104, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-07 04:00:00');
INSERT INTO `schedule_job_log` VALUES (105, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-07 04:30:00');
INSERT INTO `schedule_job_log` VALUES (106, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-07 05:00:00');
INSERT INTO `schedule_job_log` VALUES (107, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-07 05:30:00');
INSERT INTO `schedule_job_log` VALUES (108, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-07 06:00:00');
INSERT INTO `schedule_job_log` VALUES (109, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-07 06:30:00');
INSERT INTO `schedule_job_log` VALUES (110, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-07 07:00:00');
INSERT INTO `schedule_job_log` VALUES (111, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-07 07:30:00');
INSERT INTO `schedule_job_log` VALUES (112, 1, 'testTask', 'renren', 0, NULL, 2, '2021-03-07 08:00:00');
INSERT INTO `schedule_job_log` VALUES (113, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-07 08:30:00');
INSERT INTO `schedule_job_log` VALUES (114, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-07 09:00:00');
INSERT INTO `schedule_job_log` VALUES (115, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-07 09:30:00');
INSERT INTO `schedule_job_log` VALUES (116, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-07 10:00:00');
INSERT INTO `schedule_job_log` VALUES (117, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-07 10:30:00');
INSERT INTO `schedule_job_log` VALUES (118, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-07 11:00:00');
INSERT INTO `schedule_job_log` VALUES (119, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-07 11:30:00');
INSERT INTO `schedule_job_log` VALUES (120, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-07 12:00:00');
INSERT INTO `schedule_job_log` VALUES (121, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-07 12:30:00');
INSERT INTO `schedule_job_log` VALUES (122, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-07 13:00:00');
INSERT INTO `schedule_job_log` VALUES (123, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-07 13:30:00');
INSERT INTO `schedule_job_log` VALUES (124, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-07 14:00:00');
INSERT INTO `schedule_job_log` VALUES (125, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-07 14:30:00');
INSERT INTO `schedule_job_log` VALUES (126, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-07 15:00:00');
INSERT INTO `schedule_job_log` VALUES (127, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-07 15:30:00');
INSERT INTO `schedule_job_log` VALUES (128, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-07 16:00:00');
INSERT INTO `schedule_job_log` VALUES (129, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-07 16:30:00');
INSERT INTO `schedule_job_log` VALUES (130, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-07 17:00:00');
INSERT INTO `schedule_job_log` VALUES (131, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-07 17:30:00');
INSERT INTO `schedule_job_log` VALUES (132, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-07 18:00:00');
INSERT INTO `schedule_job_log` VALUES (133, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-07 18:30:00');
INSERT INTO `schedule_job_log` VALUES (134, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-07 19:00:00');
INSERT INTO `schedule_job_log` VALUES (135, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-07 19:30:00');
INSERT INTO `schedule_job_log` VALUES (136, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-07 20:00:00');
INSERT INTO `schedule_job_log` VALUES (137, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-07 20:30:00');
INSERT INTO `schedule_job_log` VALUES (138, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-07 21:00:00');
INSERT INTO `schedule_job_log` VALUES (139, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-07 21:30:00');
INSERT INTO `schedule_job_log` VALUES (140, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-07 22:00:00');
INSERT INTO `schedule_job_log` VALUES (141, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-07 22:30:00');
INSERT INTO `schedule_job_log` VALUES (142, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-07 23:00:00');
INSERT INTO `schedule_job_log` VALUES (143, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-07 23:30:00');
INSERT INTO `schedule_job_log` VALUES (144, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-08 00:00:00');
INSERT INTO `schedule_job_log` VALUES (145, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-08 00:30:00');
INSERT INTO `schedule_job_log` VALUES (146, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-08 01:00:00');
INSERT INTO `schedule_job_log` VALUES (147, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-08 01:30:00');
INSERT INTO `schedule_job_log` VALUES (148, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-08 02:00:00');
INSERT INTO `schedule_job_log` VALUES (149, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-08 02:30:00');
INSERT INTO `schedule_job_log` VALUES (150, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-08 03:00:00');
INSERT INTO `schedule_job_log` VALUES (151, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-08 03:30:00');
INSERT INTO `schedule_job_log` VALUES (152, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-08 04:00:00');
INSERT INTO `schedule_job_log` VALUES (153, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-08 04:30:00');
INSERT INTO `schedule_job_log` VALUES (154, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-08 05:00:00');
INSERT INTO `schedule_job_log` VALUES (155, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-08 05:30:00');
INSERT INTO `schedule_job_log` VALUES (156, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-08 06:00:00');
INSERT INTO `schedule_job_log` VALUES (157, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-08 06:30:00');
INSERT INTO `schedule_job_log` VALUES (158, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-08 07:00:00');
INSERT INTO `schedule_job_log` VALUES (159, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-08 07:30:00');
INSERT INTO `schedule_job_log` VALUES (160, 1, 'testTask', 'renren', 0, NULL, 2, '2021-03-08 08:00:00');
INSERT INTO `schedule_job_log` VALUES (161, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-08 08:30:00');
INSERT INTO `schedule_job_log` VALUES (162, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-08 09:00:00');
INSERT INTO `schedule_job_log` VALUES (163, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-08 09:30:00');
INSERT INTO `schedule_job_log` VALUES (164, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-08 10:00:00');
INSERT INTO `schedule_job_log` VALUES (165, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-08 10:30:00');
INSERT INTO `schedule_job_log` VALUES (166, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-08 11:00:00');
INSERT INTO `schedule_job_log` VALUES (167, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-08 11:30:00');
INSERT INTO `schedule_job_log` VALUES (168, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-08 12:00:00');
INSERT INTO `schedule_job_log` VALUES (169, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-08 12:30:00');
INSERT INTO `schedule_job_log` VALUES (170, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-08 13:00:00');
INSERT INTO `schedule_job_log` VALUES (171, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-08 13:30:00');
INSERT INTO `schedule_job_log` VALUES (172, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-08 14:00:00');
INSERT INTO `schedule_job_log` VALUES (173, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-08 14:30:00');
INSERT INTO `schedule_job_log` VALUES (174, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-08 15:00:00');
INSERT INTO `schedule_job_log` VALUES (175, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-08 15:30:00');
INSERT INTO `schedule_job_log` VALUES (176, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-08 16:00:00');
INSERT INTO `schedule_job_log` VALUES (177, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-08 16:30:00');
INSERT INTO `schedule_job_log` VALUES (178, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-08 17:00:00');
INSERT INTO `schedule_job_log` VALUES (179, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-08 17:30:00');
INSERT INTO `schedule_job_log` VALUES (180, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-08 18:00:00');
INSERT INTO `schedule_job_log` VALUES (181, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-08 18:30:00');
INSERT INTO `schedule_job_log` VALUES (182, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-08 19:00:00');
INSERT INTO `schedule_job_log` VALUES (183, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-08 19:30:00');
INSERT INTO `schedule_job_log` VALUES (184, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-08 20:00:00');
INSERT INTO `schedule_job_log` VALUES (185, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-08 20:30:00');
INSERT INTO `schedule_job_log` VALUES (186, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-08 21:00:00');
INSERT INTO `schedule_job_log` VALUES (187, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-08 21:30:00');
INSERT INTO `schedule_job_log` VALUES (188, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-08 22:00:00');
INSERT INTO `schedule_job_log` VALUES (189, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-08 22:30:00');
INSERT INTO `schedule_job_log` VALUES (190, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-08 23:00:00');
INSERT INTO `schedule_job_log` VALUES (191, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-08 23:30:00');
INSERT INTO `schedule_job_log` VALUES (192, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-09 00:00:00');
INSERT INTO `schedule_job_log` VALUES (193, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-09 00:30:00');
INSERT INTO `schedule_job_log` VALUES (194, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-09 01:00:00');
INSERT INTO `schedule_job_log` VALUES (195, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-09 01:30:00');
INSERT INTO `schedule_job_log` VALUES (196, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-09 02:00:00');
INSERT INTO `schedule_job_log` VALUES (197, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-09 02:30:00');
INSERT INTO `schedule_job_log` VALUES (198, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-09 03:00:00');
INSERT INTO `schedule_job_log` VALUES (199, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-09 03:30:00');
INSERT INTO `schedule_job_log` VALUES (200, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-09 04:00:00');
INSERT INTO `schedule_job_log` VALUES (201, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-09 04:30:00');
INSERT INTO `schedule_job_log` VALUES (202, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-09 05:00:00');
INSERT INTO `schedule_job_log` VALUES (203, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-09 05:30:00');
INSERT INTO `schedule_job_log` VALUES (204, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-09 06:00:00');
INSERT INTO `schedule_job_log` VALUES (205, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-09 06:30:00');
INSERT INTO `schedule_job_log` VALUES (206, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-09 07:00:00');
INSERT INTO `schedule_job_log` VALUES (207, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-09 07:30:00');
INSERT INTO `schedule_job_log` VALUES (208, 1, 'testTask', 'renren', 0, NULL, 3, '2021-03-09 08:00:00');
INSERT INTO `schedule_job_log` VALUES (209, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-09 08:30:00');
INSERT INTO `schedule_job_log` VALUES (210, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-09 09:00:00');
INSERT INTO `schedule_job_log` VALUES (211, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-09 09:30:00');
INSERT INTO `schedule_job_log` VALUES (212, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-09 10:00:00');
INSERT INTO `schedule_job_log` VALUES (213, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-09 10:30:00');
INSERT INTO `schedule_job_log` VALUES (214, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-09 11:00:00');
INSERT INTO `schedule_job_log` VALUES (215, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-09 11:30:00');
INSERT INTO `schedule_job_log` VALUES (216, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-09 12:00:00');
INSERT INTO `schedule_job_log` VALUES (217, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-09 12:30:00');
INSERT INTO `schedule_job_log` VALUES (218, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-09 13:00:00');
INSERT INTO `schedule_job_log` VALUES (219, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-09 13:30:00');
INSERT INTO `schedule_job_log` VALUES (220, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-09 14:00:00');
INSERT INTO `schedule_job_log` VALUES (221, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-09 14:30:00');
INSERT INTO `schedule_job_log` VALUES (222, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-09 15:00:00');
INSERT INTO `schedule_job_log` VALUES (223, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-09 15:30:00');
INSERT INTO `schedule_job_log` VALUES (224, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-09 16:00:00');
INSERT INTO `schedule_job_log` VALUES (225, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-09 16:30:00');
INSERT INTO `schedule_job_log` VALUES (226, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-09 17:00:00');
INSERT INTO `schedule_job_log` VALUES (227, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-09 17:30:00');
INSERT INTO `schedule_job_log` VALUES (228, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-09 18:00:00');
INSERT INTO `schedule_job_log` VALUES (229, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-09 18:30:00');
INSERT INTO `schedule_job_log` VALUES (230, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-09 19:00:00');
INSERT INTO `schedule_job_log` VALUES (231, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-09 19:30:00');
INSERT INTO `schedule_job_log` VALUES (232, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-09 20:00:00');
INSERT INTO `schedule_job_log` VALUES (233, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-09 20:30:00');
INSERT INTO `schedule_job_log` VALUES (234, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-09 21:00:00');
INSERT INTO `schedule_job_log` VALUES (235, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-09 21:30:00');
INSERT INTO `schedule_job_log` VALUES (236, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-09 22:00:00');
INSERT INTO `schedule_job_log` VALUES (237, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-09 22:30:00');
INSERT INTO `schedule_job_log` VALUES (238, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-09 23:00:00');
INSERT INTO `schedule_job_log` VALUES (239, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-09 23:30:00');
INSERT INTO `schedule_job_log` VALUES (240, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-10 00:00:00');
INSERT INTO `schedule_job_log` VALUES (241, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-10 00:30:00');
INSERT INTO `schedule_job_log` VALUES (242, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-10 01:00:00');
INSERT INTO `schedule_job_log` VALUES (243, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-10 01:30:00');
INSERT INTO `schedule_job_log` VALUES (244, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-10 02:00:00');
INSERT INTO `schedule_job_log` VALUES (245, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-10 02:30:00');
INSERT INTO `schedule_job_log` VALUES (246, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-10 03:00:00');
INSERT INTO `schedule_job_log` VALUES (247, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-10 03:30:00');
INSERT INTO `schedule_job_log` VALUES (248, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-10 04:00:00');
INSERT INTO `schedule_job_log` VALUES (249, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-10 04:30:00');
INSERT INTO `schedule_job_log` VALUES (250, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-10 05:00:00');
INSERT INTO `schedule_job_log` VALUES (251, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-10 05:30:00');
INSERT INTO `schedule_job_log` VALUES (252, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-10 06:00:00');
INSERT INTO `schedule_job_log` VALUES (253, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-10 06:30:00');
INSERT INTO `schedule_job_log` VALUES (254, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-10 07:00:00');
INSERT INTO `schedule_job_log` VALUES (255, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-10 07:30:00');
INSERT INTO `schedule_job_log` VALUES (256, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-10 08:00:00');
INSERT INTO `schedule_job_log` VALUES (257, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-10 08:30:00');
INSERT INTO `schedule_job_log` VALUES (258, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-10 09:00:00');
INSERT INTO `schedule_job_log` VALUES (259, 1, 'testTask', 'renren', 0, NULL, 3, '2021-03-10 09:30:00');
INSERT INTO `schedule_job_log` VALUES (260, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-10 10:00:00');
INSERT INTO `schedule_job_log` VALUES (261, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-10 10:30:00');
INSERT INTO `schedule_job_log` VALUES (262, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-10 11:00:00');
INSERT INTO `schedule_job_log` VALUES (263, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-10 11:30:00');
INSERT INTO `schedule_job_log` VALUES (264, 1, 'testTask', 'renren', 0, NULL, 2, '2021-03-10 12:00:00');
INSERT INTO `schedule_job_log` VALUES (265, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-10 12:30:00');
INSERT INTO `schedule_job_log` VALUES (266, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-10 13:00:00');
INSERT INTO `schedule_job_log` VALUES (267, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-10 13:30:00');
INSERT INTO `schedule_job_log` VALUES (268, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-10 14:00:00');
INSERT INTO `schedule_job_log` VALUES (269, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-10 14:30:00');
INSERT INTO `schedule_job_log` VALUES (270, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-10 15:00:00');
INSERT INTO `schedule_job_log` VALUES (271, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-10 15:30:00');
INSERT INTO `schedule_job_log` VALUES (272, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-10 16:00:00');
INSERT INTO `schedule_job_log` VALUES (273, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-10 16:30:00');
INSERT INTO `schedule_job_log` VALUES (274, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-10 17:00:00');
INSERT INTO `schedule_job_log` VALUES (275, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-10 17:30:00');
INSERT INTO `schedule_job_log` VALUES (276, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-10 18:00:00');
INSERT INTO `schedule_job_log` VALUES (277, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-10 18:30:00');
INSERT INTO `schedule_job_log` VALUES (278, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-10 19:00:00');
INSERT INTO `schedule_job_log` VALUES (279, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-10 19:30:00');
INSERT INTO `schedule_job_log` VALUES (280, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-10 20:00:00');
INSERT INTO `schedule_job_log` VALUES (281, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-10 20:30:00');
INSERT INTO `schedule_job_log` VALUES (282, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-10 21:00:00');
INSERT INTO `schedule_job_log` VALUES (283, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-10 21:30:00');
INSERT INTO `schedule_job_log` VALUES (284, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-10 22:00:00');
INSERT INTO `schedule_job_log` VALUES (285, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-10 22:30:00');
INSERT INTO `schedule_job_log` VALUES (286, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-10 23:00:00');
INSERT INTO `schedule_job_log` VALUES (287, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-10 23:30:00');
INSERT INTO `schedule_job_log` VALUES (288, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-11 00:00:00');
INSERT INTO `schedule_job_log` VALUES (289, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-11 00:30:00');
INSERT INTO `schedule_job_log` VALUES (290, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-11 01:00:00');
INSERT INTO `schedule_job_log` VALUES (291, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-11 01:30:00');
INSERT INTO `schedule_job_log` VALUES (292, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-11 02:00:00');
INSERT INTO `schedule_job_log` VALUES (293, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-11 02:30:00');
INSERT INTO `schedule_job_log` VALUES (294, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-11 03:00:00');
INSERT INTO `schedule_job_log` VALUES (295, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-11 03:30:00');
INSERT INTO `schedule_job_log` VALUES (296, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-11 04:00:00');
INSERT INTO `schedule_job_log` VALUES (297, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-11 04:30:00');
INSERT INTO `schedule_job_log` VALUES (298, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-11 05:00:00');
INSERT INTO `schedule_job_log` VALUES (299, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-11 05:30:00');
INSERT INTO `schedule_job_log` VALUES (300, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-11 06:00:00');
INSERT INTO `schedule_job_log` VALUES (301, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-11 06:30:00');
INSERT INTO `schedule_job_log` VALUES (302, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-11 07:00:00');
INSERT INTO `schedule_job_log` VALUES (303, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-11 07:30:00');
INSERT INTO `schedule_job_log` VALUES (304, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-11 08:00:00');
INSERT INTO `schedule_job_log` VALUES (305, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-11 08:30:00');
INSERT INTO `schedule_job_log` VALUES (306, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-11 09:00:00');
INSERT INTO `schedule_job_log` VALUES (307, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-11 09:30:00');
INSERT INTO `schedule_job_log` VALUES (308, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-11 10:00:00');
INSERT INTO `schedule_job_log` VALUES (309, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-11 10:30:00');
INSERT INTO `schedule_job_log` VALUES (310, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-11 11:00:00');
INSERT INTO `schedule_job_log` VALUES (311, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-11 11:30:00');
INSERT INTO `schedule_job_log` VALUES (312, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-11 12:00:00');
INSERT INTO `schedule_job_log` VALUES (313, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-11 12:30:00');
INSERT INTO `schedule_job_log` VALUES (314, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-11 13:00:00');
INSERT INTO `schedule_job_log` VALUES (315, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-11 13:30:00');
INSERT INTO `schedule_job_log` VALUES (316, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-11 14:00:00');
INSERT INTO `schedule_job_log` VALUES (317, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-11 14:30:00');
INSERT INTO `schedule_job_log` VALUES (318, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-11 15:00:00');
INSERT INTO `schedule_job_log` VALUES (319, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-11 15:30:00');
INSERT INTO `schedule_job_log` VALUES (320, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-11 16:00:00');
INSERT INTO `schedule_job_log` VALUES (321, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-11 16:30:00');
INSERT INTO `schedule_job_log` VALUES (322, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-11 17:00:00');
INSERT INTO `schedule_job_log` VALUES (323, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-11 17:30:00');
INSERT INTO `schedule_job_log` VALUES (324, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-11 18:00:00');
INSERT INTO `schedule_job_log` VALUES (325, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-11 18:30:00');
INSERT INTO `schedule_job_log` VALUES (326, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-11 19:00:00');
INSERT INTO `schedule_job_log` VALUES (327, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-11 19:30:00');
INSERT INTO `schedule_job_log` VALUES (328, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-11 20:00:00');
INSERT INTO `schedule_job_log` VALUES (329, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-11 20:30:00');
INSERT INTO `schedule_job_log` VALUES (330, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-11 21:00:00');
INSERT INTO `schedule_job_log` VALUES (331, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-11 21:30:00');
INSERT INTO `schedule_job_log` VALUES (332, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-11 22:00:00');
INSERT INTO `schedule_job_log` VALUES (333, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-11 22:30:00');
INSERT INTO `schedule_job_log` VALUES (334, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-11 23:00:00');
INSERT INTO `schedule_job_log` VALUES (335, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-11 23:30:00');
INSERT INTO `schedule_job_log` VALUES (336, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-12 00:00:00');
INSERT INTO `schedule_job_log` VALUES (337, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-12 00:30:00');
INSERT INTO `schedule_job_log` VALUES (338, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-12 01:00:00');
INSERT INTO `schedule_job_log` VALUES (339, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-12 01:30:00');
INSERT INTO `schedule_job_log` VALUES (340, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-12 02:00:00');
INSERT INTO `schedule_job_log` VALUES (341, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-12 02:30:00');
INSERT INTO `schedule_job_log` VALUES (342, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-12 03:00:00');
INSERT INTO `schedule_job_log` VALUES (343, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-12 03:30:00');
INSERT INTO `schedule_job_log` VALUES (344, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-12 04:00:00');
INSERT INTO `schedule_job_log` VALUES (345, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-12 04:30:00');
INSERT INTO `schedule_job_log` VALUES (346, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-12 05:00:00');
INSERT INTO `schedule_job_log` VALUES (347, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-12 05:30:00');
INSERT INTO `schedule_job_log` VALUES (348, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-12 06:00:00');
INSERT INTO `schedule_job_log` VALUES (349, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-12 06:30:00');
INSERT INTO `schedule_job_log` VALUES (350, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-12 07:00:00');
INSERT INTO `schedule_job_log` VALUES (351, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-12 07:30:00');
INSERT INTO `schedule_job_log` VALUES (352, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-12 08:00:00');
INSERT INTO `schedule_job_log` VALUES (353, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-12 08:30:00');
INSERT INTO `schedule_job_log` VALUES (354, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-12 09:00:00');
INSERT INTO `schedule_job_log` VALUES (355, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-12 09:30:00');
INSERT INTO `schedule_job_log` VALUES (356, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-12 10:00:00');
INSERT INTO `schedule_job_log` VALUES (357, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-12 10:30:00');
INSERT INTO `schedule_job_log` VALUES (358, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-12 11:00:00');
INSERT INTO `schedule_job_log` VALUES (359, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-12 11:30:00');
INSERT INTO `schedule_job_log` VALUES (360, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-12 12:00:00');
INSERT INTO `schedule_job_log` VALUES (361, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-12 12:30:00');
INSERT INTO `schedule_job_log` VALUES (362, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-12 13:00:00');
INSERT INTO `schedule_job_log` VALUES (363, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-12 13:30:00');
INSERT INTO `schedule_job_log` VALUES (364, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-12 14:00:00');
INSERT INTO `schedule_job_log` VALUES (365, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-12 14:30:00');
INSERT INTO `schedule_job_log` VALUES (366, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-12 15:00:00');
INSERT INTO `schedule_job_log` VALUES (367, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-12 15:30:00');
INSERT INTO `schedule_job_log` VALUES (368, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-12 16:00:00');
INSERT INTO `schedule_job_log` VALUES (369, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-12 16:30:00');
INSERT INTO `schedule_job_log` VALUES (370, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-12 17:00:00');
INSERT INTO `schedule_job_log` VALUES (371, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-12 17:30:00');
INSERT INTO `schedule_job_log` VALUES (372, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-12 18:00:00');
INSERT INTO `schedule_job_log` VALUES (373, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-12 18:30:00');
INSERT INTO `schedule_job_log` VALUES (374, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-12 19:00:00');
INSERT INTO `schedule_job_log` VALUES (375, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-12 19:30:00');
INSERT INTO `schedule_job_log` VALUES (376, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-12 20:00:00');
INSERT INTO `schedule_job_log` VALUES (377, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-12 20:30:00');
INSERT INTO `schedule_job_log` VALUES (378, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-12 21:00:00');
INSERT INTO `schedule_job_log` VALUES (379, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-12 21:30:00');
INSERT INTO `schedule_job_log` VALUES (380, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-12 22:00:00');
INSERT INTO `schedule_job_log` VALUES (381, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-12 22:30:00');
INSERT INTO `schedule_job_log` VALUES (382, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-12 23:00:00');
INSERT INTO `schedule_job_log` VALUES (383, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-12 23:30:00');
INSERT INTO `schedule_job_log` VALUES (384, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-13 00:00:00');
INSERT INTO `schedule_job_log` VALUES (385, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-13 00:30:00');
INSERT INTO `schedule_job_log` VALUES (386, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-13 01:00:00');
INSERT INTO `schedule_job_log` VALUES (387, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-13 01:30:00');
INSERT INTO `schedule_job_log` VALUES (388, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-13 02:00:00');
INSERT INTO `schedule_job_log` VALUES (389, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-13 02:30:00');
INSERT INTO `schedule_job_log` VALUES (390, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-13 03:00:00');
INSERT INTO `schedule_job_log` VALUES (391, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-13 03:30:00');
INSERT INTO `schedule_job_log` VALUES (392, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-13 04:00:00');
INSERT INTO `schedule_job_log` VALUES (393, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-13 04:30:00');
INSERT INTO `schedule_job_log` VALUES (394, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-13 05:00:00');
INSERT INTO `schedule_job_log` VALUES (395, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-13 05:30:00');
INSERT INTO `schedule_job_log` VALUES (396, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-13 06:00:00');
INSERT INTO `schedule_job_log` VALUES (397, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-13 06:30:00');
INSERT INTO `schedule_job_log` VALUES (398, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-13 07:00:00');
INSERT INTO `schedule_job_log` VALUES (399, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-13 07:30:00');
INSERT INTO `schedule_job_log` VALUES (400, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-13 08:00:00');
INSERT INTO `schedule_job_log` VALUES (401, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-13 08:30:00');
INSERT INTO `schedule_job_log` VALUES (402, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-13 09:00:00');
INSERT INTO `schedule_job_log` VALUES (403, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-13 09:30:00');
INSERT INTO `schedule_job_log` VALUES (404, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-13 10:00:00');
INSERT INTO `schedule_job_log` VALUES (405, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-13 10:30:00');
INSERT INTO `schedule_job_log` VALUES (406, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-13 11:00:00');
INSERT INTO `schedule_job_log` VALUES (407, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-13 11:30:00');
INSERT INTO `schedule_job_log` VALUES (408, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-13 12:00:00');
INSERT INTO `schedule_job_log` VALUES (409, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-13 12:30:00');
INSERT INTO `schedule_job_log` VALUES (410, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-13 13:00:00');
INSERT INTO `schedule_job_log` VALUES (411, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-13 13:30:00');
INSERT INTO `schedule_job_log` VALUES (412, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-13 14:00:00');
INSERT INTO `schedule_job_log` VALUES (413, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-13 14:30:00');
INSERT INTO `schedule_job_log` VALUES (414, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-13 15:00:00');
INSERT INTO `schedule_job_log` VALUES (415, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-13 15:30:00');
INSERT INTO `schedule_job_log` VALUES (416, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-13 16:00:00');
INSERT INTO `schedule_job_log` VALUES (417, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-13 16:30:00');
INSERT INTO `schedule_job_log` VALUES (418, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-13 17:00:00');
INSERT INTO `schedule_job_log` VALUES (419, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-13 17:30:00');
INSERT INTO `schedule_job_log` VALUES (420, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-13 18:00:00');
INSERT INTO `schedule_job_log` VALUES (421, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-13 18:30:00');
INSERT INTO `schedule_job_log` VALUES (422, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-13 19:00:00');
INSERT INTO `schedule_job_log` VALUES (423, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-13 19:30:00');
INSERT INTO `schedule_job_log` VALUES (424, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-13 20:00:00');
INSERT INTO `schedule_job_log` VALUES (425, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-13 20:30:00');
INSERT INTO `schedule_job_log` VALUES (426, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-13 21:00:00');
INSERT INTO `schedule_job_log` VALUES (427, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-13 21:30:00');
INSERT INTO `schedule_job_log` VALUES (428, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-13 22:00:00');
INSERT INTO `schedule_job_log` VALUES (429, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-13 22:30:00');
INSERT INTO `schedule_job_log` VALUES (430, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-13 23:00:00');
INSERT INTO `schedule_job_log` VALUES (431, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-13 23:30:00');
INSERT INTO `schedule_job_log` VALUES (432, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-14 00:00:00');
INSERT INTO `schedule_job_log` VALUES (433, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-14 00:30:00');
INSERT INTO `schedule_job_log` VALUES (434, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-14 01:00:00');
INSERT INTO `schedule_job_log` VALUES (435, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-14 01:30:00');
INSERT INTO `schedule_job_log` VALUES (436, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-14 02:00:00');
INSERT INTO `schedule_job_log` VALUES (437, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-14 02:30:00');
INSERT INTO `schedule_job_log` VALUES (438, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-14 03:00:00');
INSERT INTO `schedule_job_log` VALUES (439, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-14 03:30:00');
INSERT INTO `schedule_job_log` VALUES (440, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-14 04:00:00');
INSERT INTO `schedule_job_log` VALUES (441, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-14 04:30:00');
INSERT INTO `schedule_job_log` VALUES (442, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-14 05:00:00');
INSERT INTO `schedule_job_log` VALUES (443, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-14 05:30:00');
INSERT INTO `schedule_job_log` VALUES (444, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-14 06:00:00');
INSERT INTO `schedule_job_log` VALUES (445, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-14 06:30:00');
INSERT INTO `schedule_job_log` VALUES (446, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-14 07:00:00');
INSERT INTO `schedule_job_log` VALUES (447, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-14 07:30:00');
INSERT INTO `schedule_job_log` VALUES (448, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-14 08:00:00');
INSERT INTO `schedule_job_log` VALUES (449, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-14 08:30:00');
INSERT INTO `schedule_job_log` VALUES (450, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-14 09:00:00');
INSERT INTO `schedule_job_log` VALUES (451, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-14 09:30:00');
INSERT INTO `schedule_job_log` VALUES (452, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-14 10:00:00');
INSERT INTO `schedule_job_log` VALUES (453, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-14 10:30:00');
INSERT INTO `schedule_job_log` VALUES (454, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-14 11:00:00');
INSERT INTO `schedule_job_log` VALUES (455, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-14 11:30:00');
INSERT INTO `schedule_job_log` VALUES (456, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-14 12:00:00');
INSERT INTO `schedule_job_log` VALUES (457, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-14 12:30:00');
INSERT INTO `schedule_job_log` VALUES (458, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-14 13:00:00');
INSERT INTO `schedule_job_log` VALUES (459, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-14 13:30:00');
INSERT INTO `schedule_job_log` VALUES (460, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-14 14:00:00');
INSERT INTO `schedule_job_log` VALUES (461, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-14 14:30:00');
INSERT INTO `schedule_job_log` VALUES (462, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-14 15:00:00');
INSERT INTO `schedule_job_log` VALUES (463, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-14 15:30:00');
INSERT INTO `schedule_job_log` VALUES (464, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-14 16:00:00');
INSERT INTO `schedule_job_log` VALUES (465, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-14 16:30:00');
INSERT INTO `schedule_job_log` VALUES (466, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-14 17:00:00');
INSERT INTO `schedule_job_log` VALUES (467, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-14 17:30:00');
INSERT INTO `schedule_job_log` VALUES (468, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-14 18:00:00');
INSERT INTO `schedule_job_log` VALUES (469, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-14 18:30:00');
INSERT INTO `schedule_job_log` VALUES (470, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-14 19:00:00');
INSERT INTO `schedule_job_log` VALUES (471, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-14 19:30:00');
INSERT INTO `schedule_job_log` VALUES (472, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-14 20:00:00');
INSERT INTO `schedule_job_log` VALUES (473, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-14 20:30:00');
INSERT INTO `schedule_job_log` VALUES (474, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-14 21:00:00');
INSERT INTO `schedule_job_log` VALUES (475, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-14 21:30:00');
INSERT INTO `schedule_job_log` VALUES (476, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-14 22:00:00');
INSERT INTO `schedule_job_log` VALUES (477, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-14 22:30:00');
INSERT INTO `schedule_job_log` VALUES (478, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-14 23:00:00');
INSERT INTO `schedule_job_log` VALUES (479, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-14 23:30:00');
INSERT INTO `schedule_job_log` VALUES (480, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-15 00:00:00');
INSERT INTO `schedule_job_log` VALUES (481, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-15 00:30:00');
INSERT INTO `schedule_job_log` VALUES (482, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-15 01:00:00');
INSERT INTO `schedule_job_log` VALUES (483, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-15 01:30:00');
INSERT INTO `schedule_job_log` VALUES (484, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-15 02:00:00');
INSERT INTO `schedule_job_log` VALUES (485, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-15 02:30:00');
INSERT INTO `schedule_job_log` VALUES (486, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-15 03:00:00');
INSERT INTO `schedule_job_log` VALUES (487, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-15 03:30:00');
INSERT INTO `schedule_job_log` VALUES (488, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-15 04:00:00');
INSERT INTO `schedule_job_log` VALUES (489, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-15 04:30:00');
INSERT INTO `schedule_job_log` VALUES (490, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-15 05:00:00');
INSERT INTO `schedule_job_log` VALUES (491, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-15 05:30:00');
INSERT INTO `schedule_job_log` VALUES (492, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-15 06:00:00');
INSERT INTO `schedule_job_log` VALUES (493, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-15 06:30:00');
INSERT INTO `schedule_job_log` VALUES (494, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-15 07:00:00');
INSERT INTO `schedule_job_log` VALUES (495, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-15 07:30:00');
INSERT INTO `schedule_job_log` VALUES (496, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-15 08:00:00');
INSERT INTO `schedule_job_log` VALUES (497, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-15 08:30:00');
INSERT INTO `schedule_job_log` VALUES (498, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-15 09:00:00');
INSERT INTO `schedule_job_log` VALUES (499, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-15 09:30:00');
INSERT INTO `schedule_job_log` VALUES (500, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-15 10:00:00');
INSERT INTO `schedule_job_log` VALUES (501, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-15 10:30:00');
INSERT INTO `schedule_job_log` VALUES (502, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-15 11:00:00');
INSERT INTO `schedule_job_log` VALUES (503, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-15 11:30:00');
INSERT INTO `schedule_job_log` VALUES (504, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-15 12:00:00');
INSERT INTO `schedule_job_log` VALUES (505, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-15 12:30:00');
INSERT INTO `schedule_job_log` VALUES (506, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-15 13:00:00');
INSERT INTO `schedule_job_log` VALUES (507, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-15 13:30:00');
INSERT INTO `schedule_job_log` VALUES (508, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-15 14:00:00');
INSERT INTO `schedule_job_log` VALUES (509, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-15 14:30:00');
INSERT INTO `schedule_job_log` VALUES (510, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-15 15:00:00');
INSERT INTO `schedule_job_log` VALUES (511, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-15 15:30:00');
INSERT INTO `schedule_job_log` VALUES (512, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-15 16:00:00');
INSERT INTO `schedule_job_log` VALUES (513, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-15 16:30:00');
INSERT INTO `schedule_job_log` VALUES (514, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-15 17:00:00');
INSERT INTO `schedule_job_log` VALUES (515, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-15 17:30:00');
INSERT INTO `schedule_job_log` VALUES (516, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-15 18:00:00');
INSERT INTO `schedule_job_log` VALUES (517, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-15 18:30:00');
INSERT INTO `schedule_job_log` VALUES (518, 1, 'testTask', 'renren', 0, NULL, 3, '2021-03-15 19:00:00');
INSERT INTO `schedule_job_log` VALUES (519, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-15 19:30:00');
INSERT INTO `schedule_job_log` VALUES (520, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-15 20:00:00');

-- ----------------------------
-- Table structure for sys_captcha
-- ----------------------------
DROP TABLE IF EXISTS `sys_captcha`;
CREATE TABLE `sys_captcha`  (
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'uuid',
  `code` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '验证码',
  `expire_time` datetime(0) NULL DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统验证码' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_captcha
-- ----------------------------
INSERT INTO `sys_captcha` VALUES ('010aacac-e9ec-4d4d-80b3-b2ac11d8d0f8', 'fffcg', '2020-10-27 14:22:55');
INSERT INTO `sys_captcha` VALUES ('03e5e466-495f-4018-86e3-9ebc98238f01', 'cc7b3', '2021-03-05 20:22:51');
INSERT INTO `sys_captcha` VALUES ('09c2bd40-0ec5-41e3-80d6-19d9b84e61ae', '7cwnw', '2021-03-05 20:08:22');
INSERT INTO `sys_captcha` VALUES ('11438cd8-e2b2-4d30-82e4-720f391bf5c5', '6f345', '2021-03-08 15:23:48');
INSERT INTO `sys_captcha` VALUES ('1e6c8ea8-555a-4194-8f64-5546ccddf9ef', 'ef7bw', '2020-10-27 22:32:15');
INSERT INTO `sys_captcha` VALUES ('1eb3ce28-a22b-4a00-8abd-01ec1dcd8465', 'p3m5b', '2020-10-28 10:04:57');
INSERT INTO `sys_captcha` VALUES ('2039b4b5-4200-4bdd-802c-dff945dcbea3', 'pagex', '2020-12-28 16:15:31');
INSERT INTO `sys_captcha` VALUES ('24b8bf19-33f5-45a1-8377-c901168aaba5', 'n4gx7', '2021-03-05 15:17:03');
INSERT INTO `sys_captcha` VALUES ('24ef53db-d3b1-4739-8bd9-129750eafbf6', '7c46w', '2020-10-28 12:26:55');
INSERT INTO `sys_captcha` VALUES ('292e83d7-d553-417b-8069-ea7e5fb2a817', 'fya42', '2021-03-05 20:17:12');
INSERT INTO `sys_captcha` VALUES ('2abdfaa2-c0de-4990-8103-27371dee9190', 'b86e5', '2021-03-05 16:30:08');
INSERT INTO `sys_captcha` VALUES ('2ce51abb-d00f-472f-8839-35a184ed7308', '85fwc', '2021-03-08 15:50:21');
INSERT INTO `sys_captcha` VALUES ('30d7fa5f-229c-407c-89a5-dff27f42a2ca', 'nx6nf', '2020-10-27 14:33:28');
INSERT INTO `sys_captcha` VALUES ('33b27813-7350-4c76-86c1-c377190d96ec', 'fbwc4', '2021-03-05 20:08:32');
INSERT INTO `sys_captcha` VALUES ('36e203b4-bc4e-4dae-8be9-fb6cb187d92c', 'cmmxg', '2020-10-27 14:24:31');
INSERT INTO `sys_captcha` VALUES ('4f325b28-108b-47c1-855d-24983b6aff74', '337mw', '2020-10-28 12:28:03');
INSERT INTO `sys_captcha` VALUES ('5aebaa91-7f61-4956-820e-3692650bb8ba', 'y5feg', '2020-10-27 14:25:31');
INSERT INTO `sys_captcha` VALUES ('713f17e1-552c-4fc8-8b44-16a11ece8e10', 'bd74n', '2020-10-27 14:21:21');
INSERT INTO `sys_captcha` VALUES ('78a37f89-8283-4692-8ef1-dcd07231b0af', '2ca6e', '2020-10-27 22:32:05');
INSERT INTO `sys_captcha` VALUES ('88f1016c-00e9-466e-8825-c6a366a05dd9', 'n72b6', '2020-10-28 11:49:05');
INSERT INTO `sys_captcha` VALUES ('92ffa7d0-31e3-425e-894e-07da8913ad89', 'we3nn', '2021-03-05 20:10:58');
INSERT INTO `sys_captcha` VALUES ('9415ddf7-cb80-465c-8f83-bbfedf56ca55', 'xfdbb', '2020-10-27 17:57:21');
INSERT INTO `sys_captcha` VALUES ('a2a3e7fa-551a-4413-81b2-2814fefb17ba', 'mgmb4', '2020-10-27 14:17:52');
INSERT INTO `sys_captcha` VALUES ('ac43cc2e-39b6-4213-8783-ad6589f1faad', '6f8x6', '2021-03-05 20:24:46');
INSERT INTO `sys_captcha` VALUES ('b3f3f73f-831d-4fde-8538-c0d210d76027', '8gayc', '2021-03-05 15:20:02');
INSERT INTO `sys_captcha` VALUES ('b5ee5112-6115-4461-872c-cc41b3b260c0', '3f7fm', '2021-03-05 20:08:35');
INSERT INTO `sys_captcha` VALUES ('d24b531b-ab2d-4af7-82b0-7eaf33a7c151', 'nn7gm', '2021-03-08 15:23:58');
INSERT INTO `sys_captcha` VALUES ('d2b1d13c-be54-4043-8a2b-07c64443fe4e', '6wnx5', '2020-10-27 14:25:51');
INSERT INTO `sys_captcha` VALUES ('d6f748c9-7fbd-4d64-80eb-6f78443ff4a7', '6cn54', '2021-03-08 15:24:00');
INSERT INTO `sys_captcha` VALUES ('e2ceedb7-e231-4d05-84a1-23f37f3b6c73', 'pe32n', '2020-10-28 09:17:52');
INSERT INTO `sys_captcha` VALUES ('e7b4f212-e98f-4042-828d-62752fd93335', 'c8233', '2020-10-27 14:23:51');
INSERT INTO `sys_captcha` VALUES ('ea9ecc26-b350-4b5e-8124-d18b95715e35', '85xma', '2020-10-27 14:23:22');
INSERT INTO `sys_captcha` VALUES ('f6f874c9-5280-4afa-890a-9dbec17f49f0', '4ce25', '2020-10-27 14:25:51');
INSERT INTO `sys_captcha` VALUES ('f96bb450-9f66-4d25-881f-7c10846cd1ac', 'w7g4n', '2020-10-27 12:46:20');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `param_key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'key',
  `param_value` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'value',
  `status` tinyint(0) NULL DEFAULT 1 COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `param_key`(`param_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统配置信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, 'CLOUD_STORAGE_CONFIG_KEY', '{\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunEndPoint\":\"\",\"aliyunPrefix\":\"\",\"qcloudBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuBucketName\":\"ios-app\",\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"type\":1}', 0, '云存储配置信息');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求参数',
  `time` bigint(0) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统日志' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES (1, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":31,\"parentId\":0,\"name\":\"记账管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"config\",\"orderNum\":0}]', 11, '0:0:0:0:0:0:0:1', '2020-10-27 11:05:40');
INSERT INTO `sys_log` VALUES (2, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":32,\"parentId\":0,\"name\":\"记账分类\",\"url\":\"jz/accoucate\",\"perms\":\"\",\"type\":1,\"icon\":\"mudedi\",\"orderNum\":0}]', 16, '0:0:0:0:0:0:0:1', '2020-10-27 11:07:07');
INSERT INTO `sys_log` VALUES (3, 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[32]', 27, '0:0:0:0:0:0:0:1', '2020-10-27 11:07:18');
INSERT INTO `sys_log` VALUES (4, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":33,\"parentId\":31,\"name\":\"记账分类\",\"url\":\"jz/accoucate\",\"perms\":\"\",\"type\":1,\"icon\":\"bianji\",\"orderNum\":0}]', 6, '0:0:0:0:0:0:0:1', '2020-10-27 11:07:38');
INSERT INTO `sys_log` VALUES (5, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":34,\"parentId\":31,\"name\":\"记账信息\",\"url\":\"jz/accountmsg\",\"perms\":\"\",\"type\":1,\"icon\":\"mudedi\",\"orderNum\":0}]', 8, '0:0:0:0:0:0:0:1', '2020-10-27 11:08:27');
INSERT INTO `sys_log` VALUES (6, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":35,\"parentId\":31,\"name\":\"记账统计\",\"url\":\"jz/tongji\",\"perms\":\"\",\"type\":1,\"icon\":\"editor\",\"orderNum\":0}]', 15, '0:0:0:0:0:0:0:1', '2020-10-27 11:09:02');
INSERT INTO `sys_log` VALUES (7, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":1,\"parentId\":0,\"name\":\"系统管理\",\"type\":0,\"icon\":\"system\",\"orderNum\":2}]', 17, '0:0:0:0:0:0:0:1', '2020-10-27 11:09:35');
INSERT INTO `sys_log` VALUES (8, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":35,\"parentId\":31,\"name\":\"记账统计\",\"url\":\"jz/reportform\",\"perms\":\"\",\"type\":1,\"icon\":\"editor\",\"orderNum\":5}]', 8, '0:0:0:0:0:0:0:1', '2020-10-27 14:13:19');
INSERT INTO `sys_log` VALUES (9, 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":1,\"roleName\":\"1\",\"remark\":\"1\",\"createUserId\":1,\"menuIdList\":[-666666],\"createTime\":\"Mar 8, 2021 7:43:42 AM\"}]', 139, '1.198.221.57', '2021-03-08 15:43:42');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(0) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(0) NULL DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(0) NULL DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(0) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 0, '系统管理', NULL, NULL, 0, 'system', 2);
INSERT INTO `sys_menu` VALUES (2, 1, '管理员列表', 'sys/user', NULL, 1, 'admin', 1);
INSERT INTO `sys_menu` VALUES (3, 1, '角色管理', 'sys/role', NULL, 1, 'role', 2);
INSERT INTO `sys_menu` VALUES (4, 1, '菜单管理', 'sys/menu', NULL, 1, 'menu', 3);
INSERT INTO `sys_menu` VALUES (5, 1, 'SQL监控', 'http://localhost:8080/renren-fast/druid/sql.html', NULL, 1, 'sql', 4);
INSERT INTO `sys_menu` VALUES (6, 1, '定时任务', 'job/schedule', NULL, 1, 'job', 5);
INSERT INTO `sys_menu` VALUES (7, 6, '查看', NULL, 'sys:schedule:list,sys:schedule:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (8, 6, '新增', NULL, 'sys:schedule:save', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (9, 6, '修改', NULL, 'sys:schedule:update', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (10, 6, '删除', NULL, 'sys:schedule:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (11, 6, '暂停', NULL, 'sys:schedule:pause', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (12, 6, '恢复', NULL, 'sys:schedule:resume', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (13, 6, '立即执行', NULL, 'sys:schedule:run', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (14, 6, '日志列表', NULL, 'sys:schedule:log', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (15, 2, '查看', NULL, 'sys:user:list,sys:user:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (16, 2, '新增', NULL, 'sys:user:save,sys:role:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (17, 2, '修改', NULL, 'sys:user:update,sys:role:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (18, 2, '删除', NULL, 'sys:user:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (19, 3, '查看', NULL, 'sys:role:list,sys:role:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (20, 3, '新增', NULL, 'sys:role:save,sys:menu:list', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (21, 3, '修改', NULL, 'sys:role:update,sys:menu:list', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (22, 3, '删除', NULL, 'sys:role:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (23, 4, '查看', NULL, 'sys:menu:list,sys:menu:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (24, 4, '新增', NULL, 'sys:menu:save,sys:menu:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (25, 4, '修改', NULL, 'sys:menu:update,sys:menu:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (26, 4, '删除', NULL, 'sys:menu:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (27, 1, '参数管理', 'sys/config', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', 1, 'config', 6);
INSERT INTO `sys_menu` VALUES (29, 1, '系统日志', 'sys/log', 'sys:log:list', 1, 'log', 7);
INSERT INTO `sys_menu` VALUES (30, 1, '文件上传', 'oss/oss', 'sys:oss:all', 1, 'oss', 6);
INSERT INTO `sys_menu` VALUES (31, 0, '记账管理', '', '', 0, 'config', 0);
INSERT INTO `sys_menu` VALUES (33, 31, '记账分类', 'jz/accoucate', '', 1, 'bianji', 0);
INSERT INTO `sys_menu` VALUES (34, 31, '记账信息', 'jz/accountmsg', '', 1, 'mudedi', 0);
INSERT INTO `sys_menu` VALUES (35, 31, '记账统计', 'jz/reportform', '', 1, 'editor', 5);

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文件上传' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oss
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(0) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(0) NULL DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '1', '1', 1, '2021-03-08 15:43:42');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(0) NULL DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(0) NULL DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色与菜单对应关系' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1, 1, -666666);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '盐',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `status` tinyint(0) NULL DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_user_id` bigint(0) NULL DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统用户' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d', 'YzcmCZNvbXocrsz9dm8e', 'root@renren.io', '13612345678', 1, 1, '2016-11-11 11:11:11');
INSERT INTO `sys_user` VALUES (2, 'a', '4c20334be9fec477b7b024fbda0124e9362b788aaa1ab965d18af6778d674fba', 'YRXqI4sp3aBkDpbC4EDi', NULL, NULL, NULL, NULL, '2020-10-27 14:43:03');
INSERT INTO `sys_user` VALUES (5, 'b', '3cc8b6e810d962e2724c34bcb040d6efc53afc56bcd5d44aa3c6d1cd574044bc', 'KuTCP0wsnLrtjfGYZ6MT', NULL, NULL, NULL, NULL, '2020-10-27 14:45:31');
INSERT INTO `sys_user` VALUES (6, 'c', '2cb3b18dc9681f5852c22c078f67f90c91ad905743080d9943a566dd5ed084ae', '6natFgwWmbtjYjas1PMv', NULL, NULL, NULL, NULL, '2020-10-27 14:45:43');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(0) NULL DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(0) NULL DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户与角色对应关系' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_token
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_token`;
CREATE TABLE `sys_user_token`  (
  `user_id` bigint(0) NOT NULL,
  `token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'token',
  `expire_time` datetime(0) NULL DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `token`(`token`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统用户Token' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_token
-- ----------------------------
INSERT INTO `sys_user_token` VALUES (1, '2f81b4b1a0c54e679cab4c9382b9eba1', '2021-03-09 03:41:32', '2021-03-08 15:41:32');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `user_id` bigint(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '手机号',
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES (1, 'mark', '13612345678', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '2017-03-23 22:37:41');

SET FOREIGN_KEY_CHECKS = 1;
