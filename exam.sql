/*
 Navicat Premium Data Transfer

 Source Server         : 本地mysql
 Source Server Type    : MySQL
 Source Server Version : 50735
 Source Host           : localhost:3306
 Source Schema         : exam

 Target Server Type    : MySQL
 Target Server Version : 50735
 File Encoding         : 65001

 Date: 05/05/2022 19:33:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for s_student_exam
-- ----------------------------
DROP TABLE IF EXISTS `s_student_exam`;
CREATE TABLE `s_student_exam`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `student_id` int(11) NOT NULL DEFAULT 0 COMMENT '学生id',
  `exam_id` int(11) NOT NULL DEFAULT 0 COMMENT '考试id',
  `is_finished` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否交卷',
  `start_time` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `finish_time` datetime NULL DEFAULT NULL COMMENT '交卷时间',
  `score` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '得分',
  `total_score` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '总分',
  `qualify_score` decimal(10, 0) NOT NULL COMMENT '及格分',
  `is_qualify` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否及格',
  `is_checked` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否批改',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_s_student_exam_sys_user_1`(`student_id`) USING BTREE,
  INDEX `fk_s_student_exam_t_exam_1`(`exam_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学生考试表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of s_student_exam
-- ----------------------------
INSERT INTO `s_student_exam` VALUES (33, 2, 1, 1, '2022-04-24 18:55:39', '2022-04-24 20:51:30', 8, 100, 40, 0, 1);
INSERT INTO `s_student_exam` VALUES (38, 1, 1, 1, '2022-04-29 23:59:43', '2022-04-30 13:29:41', 10, 100, 40, 0, 0);
INSERT INTO `s_student_exam` VALUES (39, 1, 9, 1, '2022-04-30 00:26:21', '2022-04-30 00:27:02', 92, 100, 60, 1, 1);
INSERT INTO `s_student_exam` VALUES (40, 2, 8, 1, '2022-04-30 19:25:11', '2022-04-30 19:26:50', 43, 100, 40, 1, 0);
INSERT INTO `s_student_exam` VALUES (41, 2, 9, 0, '2022-04-30 19:27:02', NULL, 0, 100, 60, 0, 0);
INSERT INTO `s_student_exam` VALUES (42, 1, 8, 1, '2022-05-01 18:51:06', '2022-05-02 17:33:21', 0, 100, 40, 0, 0);

-- ----------------------------
-- Table structure for s_student_option
-- ----------------------------
DROP TABLE IF EXISTS `s_student_option`;
CREATE TABLE `s_student_option`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `student_question_id` int(11) NOT NULL DEFAULT 0 COMMENT '学生问题id',
  `option_id` int(11) NOT NULL DEFAULT 0 COMMENT '选项id',
  `is_checked` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否选中',
  `order_num` int(11) NOT NULL DEFAULT 0 COMMENT '排序号',
  `abc` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'abc的序号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2366 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_student_option
-- ----------------------------
INSERT INTO `s_student_option` VALUES (1506, 811, 542, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (1507, 811, 543, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (1508, 811, 544, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (1509, 811, 545, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (1510, 811, 546, 0, 5, 'E');
INSERT INTO `s_student_option` VALUES (1511, 812, 547, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (1512, 812, 548, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (1513, 812, 549, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (1514, 812, 550, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (1515, 812, 551, 0, 5, 'E');
INSERT INTO `s_student_option` VALUES (1516, 812, 552, 0, 6, 'F');
INSERT INTO `s_student_option` VALUES (1517, 819, 495, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (1518, 819, 496, 1, 2, 'B');
INSERT INTO `s_student_option` VALUES (1519, 819, 497, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (1520, 819, 498, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (1521, 820, 499, 1, 1, 'A');
INSERT INTO `s_student_option` VALUES (1522, 820, 500, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (1523, 820, 501, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (1524, 820, 502, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (1525, 821, 503, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (1526, 821, 504, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (1527, 821, 505, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (1528, 821, 506, 1, 4, 'D');
INSERT INTO `s_student_option` VALUES (1529, 821, 507, 0, 5, 'E');
INSERT INTO `s_student_option` VALUES (1530, 821, 508, 0, 6, 'F');
INSERT INTO `s_student_option` VALUES (1531, 822, 509, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (1532, 822, 510, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (1533, 822, 511, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (1534, 822, 512, 1, 4, 'D');
INSERT INTO `s_student_option` VALUES (1535, 822, 513, 0, 5, 'E');
INSERT INTO `s_student_option` VALUES (1536, 822, 514, 0, 6, 'F');
INSERT INTO `s_student_option` VALUES (1537, 823, 515, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (1538, 823, 516, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (1539, 823, 517, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (1540, 823, 518, 1, 4, 'D');
INSERT INTO `s_student_option` VALUES (1541, 823, 519, 0, 5, 'E');
INSERT INTO `s_student_option` VALUES (1542, 824, 520, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (1543, 824, 521, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (1544, 825, 522, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (1545, 825, 523, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (1546, 825, 524, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (1547, 825, 525, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (1548, 826, 526, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (1549, 826, 527, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (1550, 826, 528, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (1551, 826, 529, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (1552, 827, 530, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (1553, 827, 531, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (1554, 827, 532, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (1555, 827, 533, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (1556, 828, 538, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (1557, 828, 539, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (1558, 828, 540, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (1559, 828, 541, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (1560, 829, 553, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (1561, 829, 554, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (1562, 829, 555, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (1563, 829, 556, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (1564, 830, 557, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (1565, 830, 558, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (1566, 830, 559, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (1567, 830, 560, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (1568, 831, 561, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (1569, 831, 562, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (1570, 831, 563, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (1571, 831, 564, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (1572, 831, 565, 0, 5, 'E');
INSERT INTO `s_student_option` VALUES (1573, 831, 566, 0, 6, 'F');
INSERT INTO `s_student_option` VALUES (1574, 831, 567, 0, 7, 'G');
INSERT INTO `s_student_option` VALUES (1575, 832, 573, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (1576, 832, 574, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (1577, 832, 575, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (1578, 832, 576, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (1579, 832, 577, 0, 5, 'E');
INSERT INTO `s_student_option` VALUES (1580, 833, 583, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (1581, 833, 584, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (1582, 833, 585, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (1583, 833, 586, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (1584, 833, 587, 0, 5, 'E');
INSERT INTO `s_student_option` VALUES (1585, 834, 588, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (1586, 834, 589, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (1587, 834, 590, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (1588, 834, 591, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (1589, 835, 592, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (1590, 835, 593, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (1591, 835, 594, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (1592, 835, 595, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (1593, 836, 596, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (1594, 836, 597, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (1595, 836, 598, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (1596, 836, 599, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (1914, 974, 542, 1, 1, 'A');
INSERT INTO `s_student_option` VALUES (1915, 974, 543, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (1916, 974, 544, 1, 3, 'C');
INSERT INTO `s_student_option` VALUES (1917, 974, 545, 1, 4, 'D');
INSERT INTO `s_student_option` VALUES (1918, 974, 546, 1, 5, 'E');
INSERT INTO `s_student_option` VALUES (1919, 975, 547, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (1920, 975, 548, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (1921, 975, 549, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (1922, 975, 550, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (1923, 975, 551, 0, 5, 'E');
INSERT INTO `s_student_option` VALUES (1924, 975, 552, 0, 6, 'F');
INSERT INTO `s_student_option` VALUES (1925, 982, 495, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (1926, 982, 496, 1, 2, 'B');
INSERT INTO `s_student_option` VALUES (1927, 982, 497, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (1928, 982, 498, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (1929, 983, 499, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (1930, 983, 500, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (1931, 983, 501, 1, 3, 'C');
INSERT INTO `s_student_option` VALUES (1932, 983, 502, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (1933, 984, 503, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (1934, 984, 504, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (1935, 984, 505, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (1936, 984, 506, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (1937, 984, 507, 1, 5, 'E');
INSERT INTO `s_student_option` VALUES (1938, 984, 508, 0, 6, 'F');
INSERT INTO `s_student_option` VALUES (1939, 985, 509, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (1940, 985, 510, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (1941, 985, 511, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (1942, 985, 512, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (1943, 985, 513, 0, 5, 'E');
INSERT INTO `s_student_option` VALUES (1944, 985, 514, 0, 6, 'F');
INSERT INTO `s_student_option` VALUES (1945, 986, 515, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (1946, 986, 516, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (1947, 986, 517, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (1948, 986, 518, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (1949, 986, 519, 0, 5, 'E');
INSERT INTO `s_student_option` VALUES (1950, 987, 520, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (1951, 987, 521, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (1952, 988, 522, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (1953, 988, 523, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (1954, 988, 524, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (1955, 988, 525, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (1956, 989, 526, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (1957, 989, 527, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (1958, 989, 528, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (1959, 989, 529, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (1960, 990, 530, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (1961, 990, 531, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (1962, 990, 532, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (1963, 990, 533, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (1964, 991, 538, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (1965, 991, 539, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (1966, 991, 540, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (1967, 991, 541, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (1968, 992, 553, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (1969, 992, 554, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (1970, 992, 555, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (1971, 992, 556, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (1972, 993, 557, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (1973, 993, 558, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (1974, 993, 559, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (1975, 993, 560, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (1976, 994, 561, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (1977, 994, 562, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (1978, 994, 563, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (1979, 994, 564, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (1980, 994, 565, 0, 5, 'E');
INSERT INTO `s_student_option` VALUES (1981, 994, 566, 0, 6, 'F');
INSERT INTO `s_student_option` VALUES (1982, 994, 567, 0, 7, 'G');
INSERT INTO `s_student_option` VALUES (1983, 995, 573, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (1984, 995, 574, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (1985, 995, 575, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (1986, 995, 576, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (1987, 995, 577, 0, 5, 'E');
INSERT INTO `s_student_option` VALUES (1988, 996, 583, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (1989, 996, 584, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (1990, 996, 585, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (1991, 996, 586, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (1992, 996, 587, 0, 5, 'E');
INSERT INTO `s_student_option` VALUES (1993, 997, 588, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (1994, 997, 589, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (1995, 997, 590, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (1996, 997, 591, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (1997, 998, 592, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (1998, 998, 593, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (1999, 998, 594, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (2000, 998, 595, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (2001, 999, 596, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (2002, 999, 597, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (2003, 999, 598, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (2004, 999, 599, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (2005, 1011, 473, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (2006, 1011, 474, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (2007, 1011, 475, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (2008, 1011, 476, 1, 4, 'D');
INSERT INTO `s_student_option` VALUES (2009, 1011, 477, 0, 5, 'E');
INSERT INTO `s_student_option` VALUES (2010, 1012, 461, 1, 1, 'A');
INSERT INTO `s_student_option` VALUES (2011, 1012, 462, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (2012, 1012, 463, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (2013, 1012, 464, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (2014, 1013, 489, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (2015, 1013, 490, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (2016, 1013, 491, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (2017, 1013, 492, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (2018, 1013, 493, 1, 5, 'E');
INSERT INTO `s_student_option` VALUES (2019, 1013, 494, 0, 6, 'F');
INSERT INTO `s_student_option` VALUES (2020, 1014, 478, 1, 1, 'A');
INSERT INTO `s_student_option` VALUES (2021, 1014, 479, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (2022, 1014, 480, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (2023, 1014, 481, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (2024, 1015, 526, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (2025, 1015, 527, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (2026, 1015, 528, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (2027, 1015, 529, 1, 4, 'D');
INSERT INTO `s_student_option` VALUES (2028, 1016, 592, 1, 1, 'A');
INSERT INTO `s_student_option` VALUES (2029, 1016, 593, 1, 2, 'B');
INSERT INTO `s_student_option` VALUES (2030, 1016, 594, 1, 3, 'C');
INSERT INTO `s_student_option` VALUES (2031, 1016, 595, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (2032, 1017, 553, 1, 1, 'A');
INSERT INTO `s_student_option` VALUES (2033, 1017, 554, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (2034, 1017, 555, 1, 3, 'C');
INSERT INTO `s_student_option` VALUES (2035, 1017, 556, 1, 4, 'D');
INSERT INTO `s_student_option` VALUES (2036, 1018, 596, 1, 1, 'A');
INSERT INTO `s_student_option` VALUES (2037, 1018, 597, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (2038, 1018, 598, 1, 3, 'C');
INSERT INTO `s_student_option` VALUES (2039, 1018, 599, 1, 4, 'D');
INSERT INTO `s_student_option` VALUES (2040, 1019, 588, 1, 1, 'A');
INSERT INTO `s_student_option` VALUES (2041, 1019, 589, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (2042, 1019, 590, 1, 3, 'C');
INSERT INTO `s_student_option` VALUES (2043, 1019, 591, 1, 4, 'D');
INSERT INTO `s_student_option` VALUES (2044, 1020, 542, 1, 1, 'A');
INSERT INTO `s_student_option` VALUES (2045, 1020, 543, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (2046, 1020, 544, 1, 3, 'C');
INSERT INTO `s_student_option` VALUES (2047, 1020, 545, 1, 4, 'D');
INSERT INTO `s_student_option` VALUES (2048, 1020, 546, 1, 5, 'E');
INSERT INTO `s_student_option` VALUES (2049, 1026, 542, 1, 1, 'A');
INSERT INTO `s_student_option` VALUES (2050, 1026, 543, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (2051, 1026, 544, 1, 3, 'C');
INSERT INTO `s_student_option` VALUES (2052, 1026, 545, 1, 4, 'D');
INSERT INTO `s_student_option` VALUES (2053, 1026, 546, 1, 5, 'E');
INSERT INTO `s_student_option` VALUES (2054, 1027, 547, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (2055, 1027, 548, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (2056, 1027, 549, 1, 3, 'C');
INSERT INTO `s_student_option` VALUES (2057, 1027, 550, 1, 4, 'D');
INSERT INTO `s_student_option` VALUES (2058, 1027, 551, 1, 5, 'E');
INSERT INTO `s_student_option` VALUES (2059, 1027, 552, 0, 6, 'F');
INSERT INTO `s_student_option` VALUES (2060, 1034, 495, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (2061, 1034, 496, 1, 2, 'B');
INSERT INTO `s_student_option` VALUES (2062, 1034, 497, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (2063, 1034, 498, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (2064, 1035, 499, 1, 1, 'A');
INSERT INTO `s_student_option` VALUES (2065, 1035, 500, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (2066, 1035, 501, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (2067, 1035, 502, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (2068, 1036, 503, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (2069, 1036, 504, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (2070, 1036, 505, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (2071, 1036, 506, 1, 4, 'D');
INSERT INTO `s_student_option` VALUES (2072, 1036, 507, 0, 5, 'E');
INSERT INTO `s_student_option` VALUES (2073, 1036, 508, 0, 6, 'F');
INSERT INTO `s_student_option` VALUES (2074, 1037, 509, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (2075, 1037, 510, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (2076, 1037, 511, 1, 3, 'C');
INSERT INTO `s_student_option` VALUES (2077, 1037, 512, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (2078, 1037, 513, 0, 5, 'E');
INSERT INTO `s_student_option` VALUES (2079, 1037, 514, 0, 6, 'F');
INSERT INTO `s_student_option` VALUES (2080, 1038, 515, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (2081, 1038, 516, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (2082, 1038, 517, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (2083, 1038, 518, 1, 4, 'D');
INSERT INTO `s_student_option` VALUES (2084, 1038, 519, 0, 5, 'E');
INSERT INTO `s_student_option` VALUES (2085, 1039, 520, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (2086, 1039, 521, 1, 2, 'B');
INSERT INTO `s_student_option` VALUES (2087, 1040, 522, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (2088, 1040, 523, 1, 2, 'B');
INSERT INTO `s_student_option` VALUES (2089, 1040, 524, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (2090, 1040, 525, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (2091, 1041, 526, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (2092, 1041, 527, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (2093, 1041, 528, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (2094, 1041, 529, 1, 4, 'D');
INSERT INTO `s_student_option` VALUES (2095, 1042, 530, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (2096, 1042, 531, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (2097, 1042, 532, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (2098, 1042, 533, 1, 4, 'D');
INSERT INTO `s_student_option` VALUES (2099, 1043, 538, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (2100, 1043, 539, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (2101, 1043, 540, 1, 3, 'C');
INSERT INTO `s_student_option` VALUES (2102, 1043, 541, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (2103, 1044, 553, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (2104, 1044, 554, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (2105, 1044, 555, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (2106, 1044, 556, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (2107, 1045, 557, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (2108, 1045, 558, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (2109, 1045, 559, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (2110, 1045, 560, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (2111, 1046, 561, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (2112, 1046, 562, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (2113, 1046, 563, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (2114, 1046, 564, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (2115, 1046, 565, 0, 5, 'E');
INSERT INTO `s_student_option` VALUES (2116, 1046, 566, 0, 6, 'F');
INSERT INTO `s_student_option` VALUES (2117, 1046, 567, 0, 7, 'G');
INSERT INTO `s_student_option` VALUES (2118, 1047, 573, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (2119, 1047, 574, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (2120, 1047, 575, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (2121, 1047, 576, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (2122, 1047, 577, 0, 5, 'E');
INSERT INTO `s_student_option` VALUES (2123, 1048, 583, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (2124, 1048, 584, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (2125, 1048, 585, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (2126, 1048, 586, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (2127, 1048, 587, 0, 5, 'E');
INSERT INTO `s_student_option` VALUES (2128, 1049, 588, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (2129, 1049, 589, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (2130, 1049, 590, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (2131, 1049, 591, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (2132, 1050, 592, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (2133, 1050, 593, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (2134, 1050, 594, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (2135, 1050, 595, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (2136, 1051, 596, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (2137, 1051, 597, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (2138, 1051, 598, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (2139, 1051, 599, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (2140, 1063, 473, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (2141, 1063, 474, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (2142, 1063, 475, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (2143, 1063, 476, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (2144, 1063, 477, 0, 5, 'E');
INSERT INTO `s_student_option` VALUES (2145, 1064, 461, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (2146, 1064, 462, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (2147, 1064, 463, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (2148, 1064, 464, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (2149, 1065, 489, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (2150, 1065, 490, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (2151, 1065, 491, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (2152, 1065, 492, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (2153, 1065, 493, 0, 5, 'E');
INSERT INTO `s_student_option` VALUES (2154, 1065, 494, 0, 6, 'F');
INSERT INTO `s_student_option` VALUES (2155, 1066, 478, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (2156, 1066, 479, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (2157, 1066, 480, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (2158, 1066, 481, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (2159, 1067, 526, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (2160, 1067, 527, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (2161, 1067, 528, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (2162, 1067, 529, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (2163, 1068, 592, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (2164, 1068, 593, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (2165, 1068, 594, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (2166, 1068, 595, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (2167, 1069, 553, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (2168, 1069, 554, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (2169, 1069, 555, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (2170, 1069, 556, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (2171, 1070, 596, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (2172, 1070, 597, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (2173, 1070, 598, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (2174, 1070, 599, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (2175, 1071, 588, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (2176, 1071, 589, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (2177, 1071, 590, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (2178, 1071, 591, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (2179, 1072, 542, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (2180, 1072, 543, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (2181, 1072, 544, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (2182, 1072, 545, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (2183, 1072, 546, 0, 5, 'E');
INSERT INTO `s_student_option` VALUES (2184, 1078, 542, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (2185, 1078, 543, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (2186, 1078, 544, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (2187, 1078, 545, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (2188, 1078, 546, 0, 5, 'E');
INSERT INTO `s_student_option` VALUES (2189, 1079, 547, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (2190, 1079, 548, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (2191, 1079, 549, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (2192, 1079, 550, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (2193, 1079, 551, 0, 5, 'E');
INSERT INTO `s_student_option` VALUES (2194, 1079, 552, 0, 6, 'F');
INSERT INTO `s_student_option` VALUES (2195, 1086, 495, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (2196, 1086, 496, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (2197, 1086, 497, 1, 3, 'C');
INSERT INTO `s_student_option` VALUES (2198, 1086, 498, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (2199, 1087, 499, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (2200, 1087, 500, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (2201, 1087, 501, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (2202, 1087, 502, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (2203, 1088, 503, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (2204, 1088, 504, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (2205, 1088, 505, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (2206, 1088, 506, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (2207, 1088, 507, 0, 5, 'E');
INSERT INTO `s_student_option` VALUES (2208, 1088, 508, 0, 6, 'F');
INSERT INTO `s_student_option` VALUES (2209, 1089, 509, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (2210, 1089, 510, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (2211, 1089, 511, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (2212, 1089, 512, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (2213, 1089, 513, 0, 5, 'E');
INSERT INTO `s_student_option` VALUES (2214, 1089, 514, 0, 6, 'F');
INSERT INTO `s_student_option` VALUES (2215, 1090, 515, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (2216, 1090, 516, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (2217, 1090, 517, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (2218, 1090, 518, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (2219, 1090, 519, 0, 5, 'E');
INSERT INTO `s_student_option` VALUES (2220, 1091, 520, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (2221, 1091, 521, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (2222, 1092, 522, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (2223, 1092, 523, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (2224, 1092, 524, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (2225, 1092, 525, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (2226, 1093, 526, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (2227, 1093, 527, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (2228, 1093, 528, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (2229, 1093, 529, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (2230, 1094, 530, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (2231, 1094, 531, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (2232, 1094, 532, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (2233, 1094, 533, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (2234, 1095, 538, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (2235, 1095, 539, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (2236, 1095, 540, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (2237, 1095, 541, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (2238, 1096, 553, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (2239, 1096, 554, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (2240, 1096, 555, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (2241, 1096, 556, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (2242, 1097, 557, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (2243, 1097, 558, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (2244, 1097, 559, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (2245, 1097, 560, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (2246, 1098, 561, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (2247, 1098, 562, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (2248, 1098, 563, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (2249, 1098, 564, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (2250, 1098, 565, 0, 5, 'E');
INSERT INTO `s_student_option` VALUES (2251, 1098, 566, 0, 6, 'F');
INSERT INTO `s_student_option` VALUES (2252, 1098, 567, 0, 7, 'G');
INSERT INTO `s_student_option` VALUES (2253, 1099, 573, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (2254, 1099, 574, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (2255, 1099, 575, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (2256, 1099, 576, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (2257, 1099, 577, 0, 5, 'E');
INSERT INTO `s_student_option` VALUES (2258, 1100, 583, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (2259, 1100, 584, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (2260, 1100, 585, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (2261, 1100, 586, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (2262, 1100, 587, 0, 5, 'E');
INSERT INTO `s_student_option` VALUES (2263, 1101, 588, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (2264, 1101, 589, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (2265, 1101, 590, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (2266, 1101, 591, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (2267, 1102, 592, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (2268, 1102, 593, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (2269, 1102, 594, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (2270, 1102, 595, 0, 4, 'D');
INSERT INTO `s_student_option` VALUES (2271, 1103, 596, 0, 1, 'A');
INSERT INTO `s_student_option` VALUES (2272, 1103, 597, 0, 2, 'B');
INSERT INTO `s_student_option` VALUES (2273, 1103, 598, 0, 3, 'C');
INSERT INTO `s_student_option` VALUES (2274, 1103, 599, 0, 4, 'D');

-- ----------------------------
-- Table structure for s_student_question
-- ----------------------------
DROP TABLE IF EXISTS `s_student_question`;
CREATE TABLE `s_student_question`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `student_exam_id` int(11) NOT NULL COMMENT '学生考试id',
  `question_id` int(11) NOT NULL COMMENT '题目id',
  `type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '题目类型',
  `score` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '题目分数',
  `got_score` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '题目得分',
  `order_num` int(11) NOT NULL COMMENT '题目排序',
  `answer` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '回答',
  `is_answered` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否已答',
  `is_right` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否答对',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_s_answer_s_exam_1`(`student_exam_id`) USING BTREE,
  INDEX `fk_s_answer_t_question_1`(`question_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1152 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学生答题表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of s_student_question
-- ----------------------------
INSERT INTO `s_student_question` VALUES (811, 33, 21, 1, 4, 0, 1, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (812, 33, 22, 1, 4, 0, 2, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (813, 33, 31, 2, 2, 0, 1, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (814, 33, 32, 2, 2, 0, 2, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (815, 33, 41, 3, 2, 0, 1, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (816, 33, 42, 3, 2, 0, 2, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (817, 33, 46, 4, 5, 5, 1, NULL, 0, 1);
INSERT INTO `s_student_question` VALUES (818, 33, 47, 4, 5, 3, 2, NULL, 0, 1);
INSERT INTO `s_student_question` VALUES (819, 33, 11, 0, 2, 2, 1, '496', 1, 1);
INSERT INTO `s_student_question` VALUES (820, 33, 12, 0, 2, 2, 2, '499', 1, 1);
INSERT INTO `s_student_question` VALUES (821, 33, 13, 0, 2, 2, 3, '506', 1, 1);
INSERT INTO `s_student_question` VALUES (822, 33, 14, 0, 2, 0, 4, '512', 1, 0);
INSERT INTO `s_student_question` VALUES (823, 33, 15, 0, 2, 2, 5, '518', 1, 1);
INSERT INTO `s_student_question` VALUES (824, 33, 16, 0, 2, 0, 6, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (825, 33, 17, 0, 2, 0, 7, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (826, 33, 18, 0, 2, 0, 8, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (827, 33, 19, 0, 2, 0, 9, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (828, 33, 20, 0, 2, 0, 10, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (829, 33, 23, 1, 4, 0, 3, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (830, 33, 24, 1, 4, 0, 4, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (831, 33, 25, 1, 4, 0, 5, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (832, 33, 26, 1, 4, 0, 6, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (833, 33, 27, 1, 4, 0, 7, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (834, 33, 28, 1, 4, 0, 8, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (835, 33, 29, 1, 4, 0, 9, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (836, 33, 30, 1, 4, 0, 10, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (837, 33, 33, 2, 2, 0, 3, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (838, 33, 34, 2, 2, 0, 4, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (839, 33, 35, 2, 2, 0, 5, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (840, 33, 36, 2, 2, 0, 6, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (841, 33, 37, 2, 2, 0, 7, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (842, 33, 38, 2, 2, 0, 8, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (843, 33, 39, 2, 2, 0, 9, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (844, 33, 40, 2, 2, 0, 10, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (845, 33, 43, 3, 2, 0, 3, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (846, 33, 44, 3, 2, 0, 4, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (847, 33, 45, 3, 2, 0, 5, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (974, 38, 21, 1, 4, 4, 1, '542,544,545,546', 1, 1);
INSERT INTO `s_student_question` VALUES (975, 38, 22, 1, 4, 0, 2, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (976, 38, 31, 2, 2, 2, 1, 'true', 1, 1);
INSERT INTO `s_student_question` VALUES (977, 38, 32, 2, 2, 0, 2, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (978, 38, 41, 3, 2, 0, 1, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (979, 38, 42, 3, 2, 0, 2, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (980, 38, 46, 4, 5, 0, 1, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (981, 38, 47, 4, 5, 0, 2, '（1）颁布“推恩令”，削弱王国权力，加强中央对王国的控制。 \n（2）把盐铁经营权和铸币权收归中央，加强中央对经济的控制。 \n（3）接受董仲舒“罢黜百家，独尊儒术”的建议，把儒家学说作为思想统治工具，在长安设立太学。\n（4）派卫青、霍去病北击匈奴，安定北部边境。', 0, 0);
INSERT INTO `s_student_question` VALUES (982, 38, 11, 0, 2, 2, 1, '496', 1, 1);
INSERT INTO `s_student_question` VALUES (983, 38, 12, 0, 2, 0, 2, '501', 1, 0);
INSERT INTO `s_student_question` VALUES (984, 38, 13, 0, 2, 0, 3, '507', 1, 0);
INSERT INTO `s_student_question` VALUES (985, 38, 14, 0, 2, 0, 4, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (986, 38, 15, 0, 2, 0, 5, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (987, 38, 16, 0, 2, 0, 6, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (988, 38, 17, 0, 2, 0, 7, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (989, 38, 18, 0, 2, 0, 8, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (990, 38, 19, 0, 2, 0, 9, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (991, 38, 20, 0, 2, 0, 10, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (992, 38, 23, 1, 4, 0, 3, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (993, 38, 24, 1, 4, 0, 4, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (994, 38, 25, 1, 4, 0, 5, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (995, 38, 26, 1, 4, 0, 6, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (996, 38, 27, 1, 4, 0, 7, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (997, 38, 28, 1, 4, 0, 8, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (998, 38, 29, 1, 4, 0, 9, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (999, 38, 30, 1, 4, 0, 10, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1000, 38, 33, 2, 2, 2, 3, 'true', 1, 1);
INSERT INTO `s_student_question` VALUES (1001, 38, 34, 2, 2, 0, 4, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1002, 38, 35, 2, 2, 0, 5, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1003, 38, 36, 2, 2, 0, 6, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1004, 38, 37, 2, 2, 0, 7, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1005, 38, 38, 2, 2, 0, 8, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1006, 38, 39, 2, 2, 0, 9, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1007, 38, 40, 2, 2, 0, 10, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1008, 38, 43, 3, 2, 0, 3, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1009, 38, 44, 3, 2, 0, 4, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1010, 38, 45, 3, 2, 0, 5, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1011, 39, 6, 0, 4, 4, 1, '476', 1, 1);
INSERT INTO `s_student_question` VALUES (1012, 39, 3, 0, 4, 4, 2, '461', 1, 1);
INSERT INTO `s_student_question` VALUES (1013, 39, 10, 0, 4, 4, 3, '493', 1, 1);
INSERT INTO `s_student_question` VALUES (1014, 39, 7, 0, 4, 4, 4, '478', 1, 1);
INSERT INTO `s_student_question` VALUES (1015, 39, 18, 0, 4, 4, 5, '529', 1, 1);
INSERT INTO `s_student_question` VALUES (1016, 39, 29, 1, 8, 8, 1, '592,593,594', 1, 1);
INSERT INTO `s_student_question` VALUES (1017, 39, 23, 1, 8, 8, 2, '553,555,556', 1, 1);
INSERT INTO `s_student_question` VALUES (1018, 39, 30, 1, 8, 0, 3, '596,598,599', 1, 0);
INSERT INTO `s_student_question` VALUES (1019, 39, 28, 1, 8, 8, 4, '588,590,591', 1, 1);
INSERT INTO `s_student_question` VALUES (1020, 39, 21, 1, 8, 8, 5, '542,544,545,546', 1, 1);
INSERT INTO `s_student_question` VALUES (1021, 39, 40, 2, 8, 8, 1, 'false', 1, 1);
INSERT INTO `s_student_question` VALUES (1022, 39, 31, 2, 8, 8, 2, 'true', 1, 1);
INSERT INTO `s_student_question` VALUES (1023, 39, 37, 2, 8, 8, 3, 'true', 1, 1);
INSERT INTO `s_student_question` VALUES (1024, 39, 34, 2, 8, 8, 4, 'true', 1, 1);
INSERT INTO `s_student_question` VALUES (1025, 39, 36, 2, 8, 8, 5, 'false', 1, 1);
INSERT INTO `s_student_question` VALUES (1026, 40, 21, 1, 4, 4, 1, '542,544,545,546', 1, 1);
INSERT INTO `s_student_question` VALUES (1027, 40, 22, 1, 4, 4, 2, '549,550,551', 1, 1);
INSERT INTO `s_student_question` VALUES (1028, 40, 31, 2, 2, 2, 1, 'true', 1, 1);
INSERT INTO `s_student_question` VALUES (1029, 40, 32, 2, 2, 2, 2, 'false', 1, 1);
INSERT INTO `s_student_question` VALUES (1030, 40, 41, 3, 2, 2, 1, '论语', 1, 1);
INSERT INTO `s_student_question` VALUES (1031, 40, 42, 3, 2, 2, 2, '陈庆之', 1, 1);
INSERT INTO `s_student_question` VALUES (1032, 40, 46, 4, 5, 3, 1, '功：统一中国\n过：焚书坑儒', 1, 1);
INSERT INTO `s_student_question` VALUES (1033, 40, 47, 4, 5, 0, 2, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1034, 40, 11, 0, 2, 2, 1, '496', 1, 1);
INSERT INTO `s_student_question` VALUES (1035, 40, 12, 0, 2, 2, 2, '499', 1, 1);
INSERT INTO `s_student_question` VALUES (1036, 40, 13, 0, 2, 2, 3, '506', 1, 1);
INSERT INTO `s_student_question` VALUES (1037, 40, 14, 0, 2, 2, 4, '511', 1, 1);
INSERT INTO `s_student_question` VALUES (1038, 40, 15, 0, 2, 2, 5, '518', 1, 1);
INSERT INTO `s_student_question` VALUES (1039, 40, 16, 0, 2, 2, 6, '521', 1, 1);
INSERT INTO `s_student_question` VALUES (1040, 40, 17, 0, 2, 2, 7, '523', 1, 1);
INSERT INTO `s_student_question` VALUES (1041, 40, 18, 0, 2, 2, 8, '529', 1, 1);
INSERT INTO `s_student_question` VALUES (1042, 40, 19, 0, 2, 2, 9, '533', 1, 1);
INSERT INTO `s_student_question` VALUES (1043, 40, 20, 0, 2, 2, 10, '540', 1, 1);
INSERT INTO `s_student_question` VALUES (1044, 40, 23, 1, 4, 0, 3, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1045, 40, 24, 1, 4, 0, 4, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1046, 40, 25, 1, 4, 0, 5, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1047, 40, 26, 1, 4, 0, 6, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1048, 40, 27, 1, 4, 0, 7, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1049, 40, 28, 1, 4, 0, 8, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1050, 40, 29, 1, 4, 0, 9, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1051, 40, 30, 1, 4, 0, 10, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1052, 40, 33, 2, 2, 0, 3, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1053, 40, 34, 2, 2, 0, 4, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1054, 40, 35, 2, 2, 0, 5, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1055, 40, 36, 2, 2, 0, 6, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1056, 40, 37, 2, 2, 0, 7, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1057, 40, 38, 2, 2, 0, 8, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1058, 40, 39, 2, 2, 0, 9, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1059, 40, 40, 2, 2, 0, 10, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1060, 40, 43, 3, 2, 2, 3, '于谦', 1, 1);
INSERT INTO `s_student_question` VALUES (1061, 40, 44, 3, 2, 2, 4, '湖南', 1, 1);
INSERT INTO `s_student_question` VALUES (1062, 40, 45, 3, 2, 0, 5, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1063, 41, 6, 0, 4, 0, 1, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1064, 41, 3, 0, 4, 0, 2, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1065, 41, 10, 0, 4, 0, 3, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1066, 41, 7, 0, 4, 0, 4, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1067, 41, 18, 0, 4, 0, 5, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1068, 41, 29, 1, 8, 0, 1, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1069, 41, 23, 1, 8, 0, 2, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1070, 41, 30, 1, 8, 0, 3, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1071, 41, 28, 1, 8, 0, 4, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1072, 41, 21, 1, 8, 0, 5, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1073, 41, 40, 2, 8, 0, 1, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1074, 41, 31, 2, 8, 0, 2, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1075, 41, 37, 2, 8, 0, 3, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1076, 41, 34, 2, 8, 0, 4, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1077, 41, 36, 2, 8, 0, 5, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1078, 42, 21, 1, 4, 0, 1, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1079, 42, 22, 1, 4, 0, 2, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1080, 42, 31, 2, 2, 0, 1, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1081, 42, 32, 2, 2, 0, 2, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1082, 42, 41, 3, 2, 0, 1, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1083, 42, 42, 3, 2, 0, 2, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1084, 42, 46, 4, 5, 0, 1, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1085, 42, 47, 4, 5, 0, 2, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1086, 42, 11, 0, 2, 0, 1, '497', 1, 0);
INSERT INTO `s_student_question` VALUES (1087, 42, 12, 0, 2, 0, 2, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1088, 42, 13, 0, 2, 0, 3, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1089, 42, 14, 0, 2, 0, 4, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1090, 42, 15, 0, 2, 0, 5, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1091, 42, 16, 0, 2, 0, 6, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1092, 42, 17, 0, 2, 0, 7, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1093, 42, 18, 0, 2, 0, 8, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1094, 42, 19, 0, 2, 0, 9, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1095, 42, 20, 0, 2, 0, 10, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1096, 42, 23, 1, 4, 0, 3, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1097, 42, 24, 1, 4, 0, 4, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1098, 42, 25, 1, 4, 0, 5, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1099, 42, 26, 1, 4, 0, 6, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1100, 42, 27, 1, 4, 0, 7, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1101, 42, 28, 1, 4, 0, 8, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1102, 42, 29, 1, 4, 0, 9, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1103, 42, 30, 1, 4, 0, 10, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1104, 42, 33, 2, 2, 0, 3, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1105, 42, 34, 2, 2, 0, 4, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1106, 42, 35, 2, 2, 0, 5, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1107, 42, 36, 2, 2, 0, 6, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1108, 42, 37, 2, 2, 0, 7, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1109, 42, 38, 2, 2, 0, 8, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1110, 42, 39, 2, 2, 0, 9, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1111, 42, 40, 2, 2, 0, 10, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1112, 42, 43, 3, 2, 0, 3, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1113, 42, 44, 3, 2, 0, 4, NULL, 0, 0);
INSERT INTO `s_student_question` VALUES (1114, 42, 45, 3, 2, 0, 5, NULL, 0, 0);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `role` tinyint(4) NOT NULL COMMENT '角色',
  `profile` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username_unique_index`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', 'admin', 0, 'https://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/Exam/pictures/16516750320401.jpeg');
INSERT INTO `sys_user` VALUES (2, 'wangpeng', '123456', 1, 'https://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/Exam/pictures/16516750391632.jpeg');
INSERT INTO `sys_user` VALUES (3, '张三', '123456', 1, 'https://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/Exam/pictures/16516751582683.jpeg');
INSERT INTO `sys_user` VALUES (4, '李四', '123456', 1, 'https://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/Exam/pictures/16516753907524.jpeg');
INSERT INTO `sys_user` VALUES (5, '王五', '123456', 1, 'https://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/Exam/pictures/16516754804065.jpeg');
INSERT INTO `sys_user` VALUES (6, '机器猫', '123456', 1, 'https://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/Exam/pictures/16516755166346.jpeg');
INSERT INTO `sys_user` VALUES (7, '汤姆猫', '123456', 1, 'https://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/Exam/pictures/16516755208997.jpeg');
INSERT INTO `sys_user` VALUES (8, '杰瑞鼠', '123456', 1, 'https://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/Exam/pictures/16516755257138.jpeg');
INSERT INTO `sys_user` VALUES (9, '江流儿', '123456', 1, 'https://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/Exam/pictures/16516755303939.jpeg');
INSERT INTO `sys_user` VALUES (10, '哪吒', '123456', 1, 'https://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/Exam/pictures/165167553452910.jpeg');
INSERT INTO `sys_user` VALUES (11, '小男孩', '123456', 1, 'https://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/Exam/pictures/165167554020911.jpeg');
INSERT INTO `sys_user` VALUES (12, '小女孩', '123456', 1, 'https://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/Exam/pictures/165167554428112.jpeg');
INSERT INTO `sys_user` VALUES (20, 'wp10', '123', 1, 'http://localhost:8093/exam/pictures/1651647627875赵今麦.jpeg');

-- ----------------------------
-- Table structure for t_chapter
-- ----------------------------
DROP TABLE IF EXISTS `t_chapter`;
CREATE TABLE `t_chapter`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `repo_id` int(11) NOT NULL DEFAULT 0 COMMENT '题库id',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '章节名',
  `sigle_count` int(11) NOT NULL DEFAULT 0 COMMENT '单选题数量',
  `multi_count` int(11) NOT NULL DEFAULT 0 COMMENT '多选题数量',
  `judge_count` int(11) NOT NULL DEFAULT 0 COMMENT '判断题数量',
  `blank_count` int(11) NOT NULL DEFAULT 0 COMMENT '填空题数量',
  `write_count` int(11) NOT NULL DEFAULT 0 COMMENT '简答题数量',
  `order_num` int(11) NOT NULL DEFAULT 0 COMMENT '排序号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_t_chapter_t_course_1`(`repo_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '章节表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_chapter
-- ----------------------------
INSERT INTO `t_chapter` VALUES (48, 1, '历史', 0, 0, 0, 0, 0, 1);
INSERT INTO `t_chapter` VALUES (49, 1, '地理', 0, 0, 0, 0, 0, 2);
INSERT INTO `t_chapter` VALUES (50, 1, '文学', 0, 0, 0, 0, 0, 3);
INSERT INTO `t_chapter` VALUES (51, 1, '政治', 0, 0, 0, 0, 0, 4);
INSERT INTO `t_chapter` VALUES (53, 1, '体育', 0, 0, 0, 0, 0, 5);
INSERT INTO `t_chapter` VALUES (55, 1, '法律', 0, 0, 0, 0, 0, 6);

-- ----------------------------
-- Table structure for t_exam
-- ----------------------------
DROP TABLE IF EXISTS `t_exam`;
CREATE TABLE `t_exam`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `paper_id` int(11) NOT NULL COMMENT '试卷id',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '考试名称',
  `duration` int(11) NOT NULL COMMENT '考试时长（分钟）',
  `limit_time` tinyint(4) NOT NULL COMMENT '是否限制考试时间',
  `start_time` datetime NULL DEFAULT NULL COMMENT '考试开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '考试结束时间',
  `notice` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '考前注意事项',
  `privilege` tinyint(4) NOT NULL COMMENT '考试权限',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '考试密码',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_t_exam_t_paper_1`(`paper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '考试表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_exam
-- ----------------------------
INSERT INTO `t_exam` VALUES (1, 1, '第一次知识问答考试', 60, 0, NULL, NULL, '没有注意事项哦。', 0, '888', '2022-04-13 15:12:16', '2022-04-24 11:53:12');
INSERT INTO `t_exam` VALUES (8, 1, '第三次知识问答考试', 60, 0, NULL, NULL, NULL, 0, '', '2022-04-24 19:04:10', '2022-04-24 19:04:10');
INSERT INTO `t_exam` VALUES (9, 5, '只有客观题的考试', 60, 0, NULL, NULL, '只有客观题', 0, '', '2022-04-24 21:27:18', '2022-04-24 21:27:18');
INSERT INTO `t_exam` VALUES (10, 1, '有时间限制的考试', 60, 1, '2022-05-11 00:00:00', '2022-05-12 00:00:00', '请在规定时间内开始考试。', 0, '', '2022-05-01 18:47:46', '2022-05-05 15:25:15');
INSERT INTO `t_exam` VALUES (12, 5, '有密码的考试', 60, 0, NULL, NULL, '请输入正确的密码进入考试。', 1, '888', '2022-05-05 15:11:04', '2022-05-05 15:11:04');
INSERT INTO `t_exam` VALUES (13, 1, '有时间限制的考试2', 60, 1, '2022-04-29 00:00:00', '2022-04-30 00:00:00', '请在规定时间内开始考试。', 0, '', '2022-05-05 15:30:38', '2022-05-05 15:30:38');

-- ----------------------------
-- Table structure for t_option
-- ----------------------------
DROP TABLE IF EXISTS `t_option`;
CREATE TABLE `t_option`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `question_id` int(11) NOT NULL COMMENT '题目id',
  `content` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '答案内容',
  `image` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片',
  `is_right` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否答案',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '排序号',
  `abc` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'abc的序号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_t_question_option_t_question_1`(`question_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 771 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '题目选项表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_option
-- ----------------------------
INSERT INTO `t_option` VALUES (461, 3, '隋朝', NULL, 1, 1, 'A');
INSERT INTO `t_option` VALUES (462, 3, '唐朝', NULL, 0, 2, 'B');
INSERT INTO `t_option` VALUES (463, 3, '宋朝', NULL, 0, 3, 'C');
INSERT INTO `t_option` VALUES (464, 3, '元朝', NULL, 0, 4, 'D');
INSERT INTO `t_option` VALUES (465, 4, '杜甫', NULL, 0, 1, 'A');
INSERT INTO `t_option` VALUES (466, 4, '辛弃疾', NULL, 0, 2, 'B');
INSERT INTO `t_option` VALUES (467, 4, '李商隐', NULL, 0, 3, 'C');
INSERT INTO `t_option` VALUES (468, 4, '李清照', NULL, 1, 4, 'D');
INSERT INTO `t_option` VALUES (469, 5, '史记', NULL, 1, 1, 'A');
INSERT INTO `t_option` VALUES (470, 5, '汉书', NULL, 0, 2, 'B');
INSERT INTO `t_option` VALUES (471, 5, '三国志', NULL, 0, 3, 'C');
INSERT INTO `t_option` VALUES (472, 5, '资治通鉴', NULL, 0, 4, 'D');
INSERT INTO `t_option` VALUES (473, 6, '中国', NULL, 0, 1, 'A');
INSERT INTO `t_option` VALUES (474, 6, '加拿大', NULL, 0, 2, 'B');
INSERT INTO `t_option` VALUES (475, 6, '美国', NULL, 0, 3, 'C');
INSERT INTO `t_option` VALUES (476, 6, '俄罗斯', NULL, 1, 4, 'D');
INSERT INTO `t_option` VALUES (477, 6, '巴西', NULL, 0, 5, 'E');
INSERT INTO `t_option` VALUES (478, 7, '刘翔', NULL, 1, 1, 'A');
INSERT INTO `t_option` VALUES (479, 7, '巴特尔', NULL, 0, 2, 'B');
INSERT INTO `t_option` VALUES (480, 7, '姚明', NULL, 0, 3, 'C');
INSERT INTO `t_option` VALUES (481, 7, '博尔特', NULL, 0, 4, 'D');
INSERT INTO `t_option` VALUES (482, 8, '北京人', NULL, 0, 1, 'A');
INSERT INTO `t_option` VALUES (483, 8, '山顶洞人', NULL, 0, 2, 'B');
INSERT INTO `t_option` VALUES (484, 8, '元谋人', NULL, 1, 3, 'C');
INSERT INTO `t_option` VALUES (485, 9, '李渊', NULL, 0, 1, 'A');
INSERT INTO `t_option` VALUES (486, 9, '李建成', NULL, 0, 2, 'B');
INSERT INTO `t_option` VALUES (487, 9, '李世民', NULL, 1, 3, 'C');
INSERT INTO `t_option` VALUES (488, 9, '李隆基', NULL, 0, 4, 'D');
INSERT INTO `t_option` VALUES (489, 10, '僧一行', NULL, 0, 1, 'A');
INSERT INTO `t_option` VALUES (490, 10, '李时珍', NULL, 0, 2, 'B');
INSERT INTO `t_option` VALUES (491, 10, '张仲景', NULL, 0, 3, 'C');
INSERT INTO `t_option` VALUES (492, 10, '扁鹊', NULL, 0, 4, 'D');
INSERT INTO `t_option` VALUES (493, 10, '孙思邈', NULL, 1, 5, 'E');
INSERT INTO `t_option` VALUES (494, 10, '华佗', NULL, 0, 6, 'F');
INSERT INTO `t_option` VALUES (495, 11, '北宋和西夏', NULL, 0, 1, 'A');
INSERT INTO `t_option` VALUES (496, 11, '北宋和辽', NULL, 1, 2, 'B');
INSERT INTO `t_option` VALUES (497, 11, '南宋和西夏', NULL, 0, 3, 'C');
INSERT INTO `t_option` VALUES (498, 11, '南宋和金', NULL, 0, 4, 'D');
INSERT INTO `t_option` VALUES (499, 12, '太平洋', NULL, 1, 1, 'A');
INSERT INTO `t_option` VALUES (500, 12, '大西洋', NULL, 0, 2, 'B');
INSERT INTO `t_option` VALUES (501, 12, '北冰洋', NULL, 0, 3, 'C');
INSERT INTO `t_option` VALUES (502, 12, '印度洋', NULL, 0, 4, 'D');
INSERT INTO `t_option` VALUES (503, 13, '欧洲', NULL, 0, 1, 'A');
INSERT INTO `t_option` VALUES (504, 13, '北美洲', NULL, 0, 2, 'B');
INSERT INTO `t_option` VALUES (505, 13, '大洋洲', NULL, 0, 3, 'C');
INSERT INTO `t_option` VALUES (506, 13, '亚洲', NULL, 1, 4, 'D');
INSERT INTO `t_option` VALUES (507, 13, '南美洲', NULL, 0, 5, 'E');
INSERT INTO `t_option` VALUES (508, 13, '南极洲', NULL, 0, 6, 'F');
INSERT INTO `t_option` VALUES (509, 14, '长江', NULL, 0, 1, 'A');
INSERT INTO `t_option` VALUES (510, 14, '雅鲁藏布江', NULL, 0, 2, 'B');
INSERT INTO `t_option` VALUES (511, 14, '尼罗河', NULL, 1, 3, 'C');
INSERT INTO `t_option` VALUES (512, 14, '恒河', NULL, 0, 4, 'D');
INSERT INTO `t_option` VALUES (513, 14, '伏尔加河', NULL, 0, 5, 'E');
INSERT INTO `t_option` VALUES (514, 14, '亚马逊河', NULL, 0, 6, 'F');
INSERT INTO `t_option` VALUES (515, 15, '太湖', NULL, 0, 1, 'A');
INSERT INTO `t_option` VALUES (516, 15, '抚仙湖', NULL, 0, 2, 'B');
INSERT INTO `t_option` VALUES (517, 15, '苏必利尔湖', NULL, 0, 3, 'C');
INSERT INTO `t_option` VALUES (518, 15, '贝加尔湖', NULL, 1, 4, 'D');
INSERT INTO `t_option` VALUES (519, 15, '卡里巴湖', NULL, 0, 5, 'E');
INSERT INTO `t_option` VALUES (520, 16, '长江流域', NULL, 0, 1, 'A');
INSERT INTO `t_option` VALUES (521, 16, '黄河流域', NULL, 1, 2, 'B');
INSERT INTO `t_option` VALUES (522, 17, '中秋节', NULL, 0, 1, 'A');
INSERT INTO `t_option` VALUES (523, 17, '元宵节', NULL, 1, 2, 'B');
INSERT INTO `t_option` VALUES (524, 17, '端午节', NULL, 0, 3, 'C');
INSERT INTO `t_option` VALUES (525, 17, '七夕节', NULL, 0, 4, 'D');
INSERT INTO `t_option` VALUES (526, 18, '晴雯撕扇', NULL, 0, 1, 'A');
INSERT INTO `t_option` VALUES (527, 18, '黛玉葬花', NULL, 0, 2, 'B');
INSERT INTO `t_option` VALUES (528, 18, '宝钗扑蝶', NULL, 0, 3, 'C');
INSERT INTO `t_option` VALUES (529, 18, '元春远嫁', NULL, 1, 4, 'D');
INSERT INTO `t_option` VALUES (530, 19, '吴承恩', NULL, 0, 1, 'A');
INSERT INTO `t_option` VALUES (531, 19, '罗贯中', NULL, 0, 2, 'B');
INSERT INTO `t_option` VALUES (532, 19, '曹雪芹', NULL, 0, 3, 'C');
INSERT INTO `t_option` VALUES (533, 19, '施耐庵', NULL, 1, 4, 'D');
INSERT INTO `t_option` VALUES (538, 20, '如来佛祖', NULL, 0, 1, 'A');
INSERT INTO `t_option` VALUES (539, 20, '玉皇大帝', NULL, 0, 2, 'B');
INSERT INTO `t_option` VALUES (540, 20, '东海龙王', NULL, 1, 3, 'C');
INSERT INTO `t_option` VALUES (541, 20, '菩提祖师', NULL, 0, 4, 'D');
INSERT INTO `t_option` VALUES (542, 21, '宋', NULL, 1, 1, 'A');
INSERT INTO `t_option` VALUES (543, 21, '魏', NULL, 0, 2, 'B');
INSERT INTO `t_option` VALUES (544, 21, '齐', NULL, 1, 3, 'C');
INSERT INTO `t_option` VALUES (545, 21, '陈', NULL, 1, 4, 'D');
INSERT INTO `t_option` VALUES (546, 21, '梁', NULL, 1, 5, 'E');
INSERT INTO `t_option` VALUES (547, 22, '李白', NULL, 0, 1, 'A');
INSERT INTO `t_option` VALUES (548, 22, '杜甫', NULL, 0, 2, 'B');
INSERT INTO `t_option` VALUES (549, 22, '韩愈', NULL, 1, 3, 'C');
INSERT INTO `t_option` VALUES (550, 22, '苏轼', NULL, 1, 4, 'D');
INSERT INTO `t_option` VALUES (551, 22, '曾巩', NULL, 1, 5, 'E');
INSERT INTO `t_option` VALUES (552, 22, '米芾', NULL, 0, 6, 'F');
INSERT INTO `t_option` VALUES (553, 23, '衡山', NULL, 1, 1, 'A');
INSERT INTO `t_option` VALUES (554, 23, '黄山', NULL, 0, 2, 'B');
INSERT INTO `t_option` VALUES (555, 23, '泰山', NULL, 1, 3, 'C');
INSERT INTO `t_option` VALUES (556, 23, '嵩山', NULL, 1, 4, 'D');
INSERT INTO `t_option` VALUES (557, 24, '刘邦', NULL, 1, 1, 'A');
INSERT INTO `t_option` VALUES (558, 24, '刘彻', NULL, 1, 2, 'B');
INSERT INTO `t_option` VALUES (559, 24, '刘秀', NULL, 0, 3, 'C');
INSERT INTO `t_option` VALUES (560, 24, '刘弗陵', NULL, 1, 4, 'D');
INSERT INTO `t_option` VALUES (561, 25, '非洲', NULL, 1, 1, 'A');
INSERT INTO `t_option` VALUES (562, 25, '亚洲', NULL, 1, 2, 'B');
INSERT INTO `t_option` VALUES (563, 25, '欧洲', NULL, 1, 3, 'C');
INSERT INTO `t_option` VALUES (564, 25, '南美洲', NULL, 0, 4, 'D');
INSERT INTO `t_option` VALUES (565, 25, '北美洲', NULL, 0, 5, 'E');
INSERT INTO `t_option` VALUES (566, 25, '大洋洲', NULL, 1, 6, 'F');
INSERT INTO `t_option` VALUES (567, 25, '南极洲', NULL, 0, 7, 'G');
INSERT INTO `t_option` VALUES (573, 26, '青岛', NULL, 0, 1, 'A');
INSERT INTO `t_option` VALUES (574, 26, '厦门', NULL, 0, 2, 'B');
INSERT INTO `t_option` VALUES (575, 26, '南京', NULL, 1, 3, 'C');
INSERT INTO `t_option` VALUES (576, 26, '济南', NULL, 1, 4, 'D');
INSERT INTO `t_option` VALUES (577, 26, '深圳', NULL, 0, 5, 'E');
INSERT INTO `t_option` VALUES (588, 28, '红楼梦', NULL, 1, 1, 'A');
INSERT INTO `t_option` VALUES (589, 28, '金瓶梅', NULL, 0, 2, 'B');
INSERT INTO `t_option` VALUES (590, 28, '三国演义', NULL, 1, 3, 'C');
INSERT INTO `t_option` VALUES (591, 28, '水浒传', NULL, 1, 4, 'D');
INSERT INTO `t_option` VALUES (592, 29, '王勃', NULL, 1, 1, 'A');
INSERT INTO `t_option` VALUES (593, 29, '骆宾王', NULL, 1, 2, 'B');
INSERT INTO `t_option` VALUES (594, 29, '杨炯', NULL, 1, 3, 'C');
INSERT INTO `t_option` VALUES (595, 29, '李白', NULL, 0, 4, 'D');
INSERT INTO `t_option` VALUES (596, 30, '林丹', NULL, 1, 1, 'A');
INSERT INTO `t_option` VALUES (597, 30, '谌龙', NULL, 1, 2, 'B');
INSERT INTO `t_option` VALUES (598, 30, '李宗伟', NULL, 0, 3, 'C');
INSERT INTO `t_option` VALUES (599, 30, '傅海峰', NULL, 1, 4, 'D');
INSERT INTO `t_option` VALUES (683, 78, '万历', NULL, 0, 1, 'A');
INSERT INTO `t_option` VALUES (684, 78, '嘉庆', NULL, 0, 2, 'B');
INSERT INTO `t_option` VALUES (685, 78, '崇祯', NULL, 1, 3, 'C');
INSERT INTO `t_option` VALUES (686, 78, '永乐', NULL, 0, 4, 'D');
INSERT INTO `t_option` VALUES (720, 1, '洞庭湖', NULL, 0, 1, 'A');
INSERT INTO `t_option` VALUES (721, 1, '鄱阳湖', NULL, 1, 2, 'B');
INSERT INTO `t_option` VALUES (722, 1, '太湖', NULL, 0, 3, 'C');
INSERT INTO `t_option` VALUES (723, 1, '洪泽湖', NULL, 0, 4, 'D');
INSERT INTO `t_option` VALUES (745, 2, '汉武帝', NULL, 0, 1, 'A');
INSERT INTO `t_option` VALUES (746, 2, '乾隆皇帝', NULL, 0, 2, 'B');
INSERT INTO `t_option` VALUES (747, 2, '康熙皇帝', NULL, 1, 3, 'C');
INSERT INTO `t_option` VALUES (748, 2, '万历皇帝', NULL, 0, 4, 'D');
INSERT INTO `t_option` VALUES (749, 2, '唐玄宗', NULL, 0, 5, 'E');
INSERT INTO `t_option` VALUES (758, 27, '热带季风气候', NULL, 1, 1, 'A');
INSERT INTO `t_option` VALUES (759, 27, '亚热带季风气候', NULL, 1, 2, 'B');
INSERT INTO `t_option` VALUES (760, 27, '温带季风气候', NULL, 1, 3, 'C');
INSERT INTO `t_option` VALUES (761, 27, '温带大陆性气候', NULL, 1, 4, 'D');
INSERT INTO `t_option` VALUES (762, 27, '温带海洋性气候', NULL, 0, 5, 'E');
INSERT INTO `t_option` VALUES (763, 104, '选项1', NULL, 0, 1, 'A');
INSERT INTO `t_option` VALUES (764, 104, '选项2', NULL, 1, 2, 'B');
INSERT INTO `t_option` VALUES (765, 104, '选项3', NULL, 0, 3, 'C');
INSERT INTO `t_option` VALUES (766, 104, '选项4', NULL, 0, 4, 'D');
INSERT INTO `t_option` VALUES (767, 105, '选项1', NULL, 1, 1, 'A');
INSERT INTO `t_option` VALUES (768, 105, '选项2', NULL, 1, 2, 'B');
INSERT INTO `t_option` VALUES (769, 105, '选项3', NULL, 1, 3, 'C');
INSERT INTO `t_option` VALUES (770, 105, '选项4', NULL, 1, 4, 'D');

-- ----------------------------
-- Table structure for t_paper
-- ----------------------------
DROP TABLE IF EXISTS `t_paper`;
CREATE TABLE `t_paper`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '试卷名称',
  `creator` int(11) NOT NULL COMMENT '创建人',
  `question_count` int(11) NOT NULL COMMENT '题目总数',
  `total_score` decimal(10, 0) NOT NULL COMMENT '总分',
  `qualify_score` decimal(10, 0) NOT NULL COMMENT '及格分',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '试卷表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_paper
-- ----------------------------
INSERT INTO `t_paper` VALUES (1, '知识问答1', 1, 37, 100, 40, '2022-04-13 15:08:04', '2022-04-24 18:07:07');
INSERT INTO `t_paper` VALUES (5, '只有客观题', 1, 15, 100, 60, '2022-04-24 21:24:40', '2022-04-24 21:24:40');

-- ----------------------------
-- Table structure for t_paper_question
-- ----------------------------
DROP TABLE IF EXISTS `t_paper_question`;
CREATE TABLE `t_paper_question`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `paper_id` int(11) NOT NULL COMMENT '试卷id',
  `question_id` int(11) NOT NULL COMMENT '题目id',
  `score` decimal(10, 0) NOT NULL COMMENT '题目分数',
  `order_num` int(11) NOT NULL COMMENT '排序号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_t_paper_question_t_paper_1`(`paper_id`) USING BTREE,
  INDEX `fk_t_paper_question_t_question_1`(`question_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 310 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '试卷题目表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_paper_question
-- ----------------------------
INSERT INTO `t_paper_question` VALUES (159, 7, 1, 2, 1);
INSERT INTO `t_paper_question` VALUES (160, 7, 2, 2, 2);
INSERT INTO `t_paper_question` VALUES (161, 7, 3, 2, 3);
INSERT INTO `t_paper_question` VALUES (162, 7, 4, 2, 4);
INSERT INTO `t_paper_question` VALUES (163, 7, 5, 2, 5);
INSERT INTO `t_paper_question` VALUES (164, 7, 6, 2, 6);
INSERT INTO `t_paper_question` VALUES (165, 7, 7, 2, 7);
INSERT INTO `t_paper_question` VALUES (166, 7, 8, 2, 8);
INSERT INTO `t_paper_question` VALUES (167, 7, 9, 2, 9);
INSERT INTO `t_paper_question` VALUES (168, 7, 10, 2, 10);
INSERT INTO `t_paper_question` VALUES (169, 7, 21, 2, 1);
INSERT INTO `t_paper_question` VALUES (170, 7, 22, 2, 2);
INSERT INTO `t_paper_question` VALUES (171, 7, 23, 2, 3);
INSERT INTO `t_paper_question` VALUES (172, 7, 24, 2, 4);
INSERT INTO `t_paper_question` VALUES (173, 7, 25, 2, 5);
INSERT INTO `t_paper_question` VALUES (174, 7, 26, 2, 6);
INSERT INTO `t_paper_question` VALUES (175, 7, 27, 2, 7);
INSERT INTO `t_paper_question` VALUES (176, 7, 28, 2, 8);
INSERT INTO `t_paper_question` VALUES (177, 7, 29, 2, 9);
INSERT INTO `t_paper_question` VALUES (178, 7, 30, 2, 10);
INSERT INTO `t_paper_question` VALUES (179, 7, 31, 2, 1);
INSERT INTO `t_paper_question` VALUES (180, 7, 32, 2, 2);
INSERT INTO `t_paper_question` VALUES (181, 7, 33, 2, 3);
INSERT INTO `t_paper_question` VALUES (182, 7, 34, 2, 4);
INSERT INTO `t_paper_question` VALUES (183, 7, 35, 2, 5);
INSERT INTO `t_paper_question` VALUES (184, 7, 36, 2, 6);
INSERT INTO `t_paper_question` VALUES (185, 7, 37, 2, 7);
INSERT INTO `t_paper_question` VALUES (186, 7, 38, 2, 8);
INSERT INTO `t_paper_question` VALUES (187, 7, 39, 2, 9);
INSERT INTO `t_paper_question` VALUES (188, 7, 40, 2, 10);
INSERT INTO `t_paper_question` VALUES (189, 7, 41, 4, 1);
INSERT INTO `t_paper_question` VALUES (190, 7, 42, 4, 2);
INSERT INTO `t_paper_question` VALUES (191, 7, 43, 4, 3);
INSERT INTO `t_paper_question` VALUES (192, 7, 44, 4, 4);
INSERT INTO `t_paper_question` VALUES (193, 7, 45, 4, 5);
INSERT INTO `t_paper_question` VALUES (194, 7, 46, 10, 1);
INSERT INTO `t_paper_question` VALUES (195, 7, 47, 10, 2);
INSERT INTO `t_paper_question` VALUES (206, 1, 21, 4, 1);
INSERT INTO `t_paper_question` VALUES (207, 1, 22, 4, 2);
INSERT INTO `t_paper_question` VALUES (216, 1, 31, 2, 1);
INSERT INTO `t_paper_question` VALUES (217, 1, 32, 2, 2);
INSERT INTO `t_paper_question` VALUES (226, 1, 41, 2, 1);
INSERT INTO `t_paper_question` VALUES (227, 1, 42, 2, 2);
INSERT INTO `t_paper_question` VALUES (231, 1, 46, 5, 1);
INSERT INTO `t_paper_question` VALUES (232, 1, 47, 5, 2);
INSERT INTO `t_paper_question` VALUES (233, 1, 11, 2, 1);
INSERT INTO `t_paper_question` VALUES (234, 1, 12, 2, 2);
INSERT INTO `t_paper_question` VALUES (235, 1, 13, 2, 3);
INSERT INTO `t_paper_question` VALUES (236, 1, 14, 2, 4);
INSERT INTO `t_paper_question` VALUES (237, 1, 15, 2, 5);
INSERT INTO `t_paper_question` VALUES (238, 1, 16, 2, 6);
INSERT INTO `t_paper_question` VALUES (239, 1, 17, 2, 7);
INSERT INTO `t_paper_question` VALUES (240, 1, 18, 2, 8);
INSERT INTO `t_paper_question` VALUES (241, 1, 19, 2, 9);
INSERT INTO `t_paper_question` VALUES (242, 1, 20, 2, 10);
INSERT INTO `t_paper_question` VALUES (243, 1, 23, 4, 3);
INSERT INTO `t_paper_question` VALUES (244, 1, 24, 4, 4);
INSERT INTO `t_paper_question` VALUES (245, 1, 25, 4, 5);
INSERT INTO `t_paper_question` VALUES (246, 1, 26, 4, 6);
INSERT INTO `t_paper_question` VALUES (247, 1, 27, 4, 7);
INSERT INTO `t_paper_question` VALUES (248, 1, 28, 4, 8);
INSERT INTO `t_paper_question` VALUES (249, 1, 29, 4, 9);
INSERT INTO `t_paper_question` VALUES (250, 1, 30, 4, 10);
INSERT INTO `t_paper_question` VALUES (251, 1, 33, 2, 3);
INSERT INTO `t_paper_question` VALUES (252, 1, 34, 2, 4);
INSERT INTO `t_paper_question` VALUES (253, 1, 35, 2, 5);
INSERT INTO `t_paper_question` VALUES (254, 1, 36, 2, 6);
INSERT INTO `t_paper_question` VALUES (255, 1, 37, 2, 7);
INSERT INTO `t_paper_question` VALUES (256, 1, 38, 2, 8);
INSERT INTO `t_paper_question` VALUES (257, 1, 39, 2, 9);
INSERT INTO `t_paper_question` VALUES (258, 1, 40, 2, 10);
INSERT INTO `t_paper_question` VALUES (259, 1, 43, 2, 3);
INSERT INTO `t_paper_question` VALUES (260, 1, 44, 2, 4);
INSERT INTO `t_paper_question` VALUES (261, 1, 45, 2, 5);
INSERT INTO `t_paper_question` VALUES (287, 5, 6, 4, 1);
INSERT INTO `t_paper_question` VALUES (288, 5, 3, 4, 2);
INSERT INTO `t_paper_question` VALUES (289, 5, 10, 4, 3);
INSERT INTO `t_paper_question` VALUES (290, 5, 7, 4, 4);
INSERT INTO `t_paper_question` VALUES (291, 5, 18, 4, 5);
INSERT INTO `t_paper_question` VALUES (292, 5, 29, 8, 1);
INSERT INTO `t_paper_question` VALUES (293, 5, 23, 8, 2);
INSERT INTO `t_paper_question` VALUES (294, 5, 30, 8, 3);
INSERT INTO `t_paper_question` VALUES (295, 5, 28, 8, 4);
INSERT INTO `t_paper_question` VALUES (296, 5, 21, 8, 5);
INSERT INTO `t_paper_question` VALUES (297, 5, 40, 8, 1);
INSERT INTO `t_paper_question` VALUES (298, 5, 31, 8, 2);
INSERT INTO `t_paper_question` VALUES (299, 5, 37, 8, 3);
INSERT INTO `t_paper_question` VALUES (300, 5, 34, 8, 4);
INSERT INTO `t_paper_question` VALUES (301, 5, 36, 8, 5);

-- ----------------------------
-- Table structure for t_question
-- ----------------------------
DROP TABLE IF EXISTS `t_question`;
CREATE TABLE `t_question`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `repo_id` int(11) NOT NULL COMMENT '题库id',
  `chapter_id` int(11) NULL DEFAULT NULL COMMENT '章节id',
  `type` tinyint(4) NOT NULL COMMENT '题目类型',
  `content` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '题目内容',
  `image` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '题目图片',
  `answer` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '答案',
  `answer_image` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '答案图片',
  `analysis` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分析',
  `analysis_image` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分析图片',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_t_question_t_chapter_1`(`chapter_id`) USING BTREE,
  INDEX `fk_t_question_t_repo_1`(`repo_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 109 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '题目表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_question
-- ----------------------------
INSERT INTO `t_question` VALUES (1, 1, 49, 0, '中国最大的淡水湖是哪一个？', NULL, '721', NULL, '中国四大淡水湖分别是：鄱阳湖、洞庭湖、太湖和洪泽湖。', NULL, NULL, '2022-05-04 13:09:47', '2022-05-04 13:09:47');
INSERT INTO `t_question` VALUES (2, 1, 48, 0, '中国历史上在位时间最长的皇帝是谁？', 'https://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/Exam/pictures/16516787865661.jpeg', '747', NULL, '康熙皇帝在位62年，乾隆皇帝在位60年，汉武帝在位54年，万历皇帝在位48年，唐玄宗在位44年。', NULL, NULL, '2022-04-13 12:43:10', '2022-05-04 23:39:49');
INSERT INTO `t_question` VALUES (3, 1, 48, 0, '科举制度最早诞生于哪个朝代？', NULL, '461', NULL, '科举制度在隋朝大业元年（605年）开始实行。', NULL, NULL, '2022-04-13 12:45:17', '2022-04-13 12:55:57');
INSERT INTO `t_question` VALUES (4, 1, 50, 0, '“生当做人杰﹐死亦为鬼雄﹐至今思项羽﹐不肯过江东。\"为哪位诗人的作品?', NULL, '468', NULL, '出自李清照《夏日绝句》。', NULL, NULL, '2022-04-13 13:20:15', '2022-04-13 13:20:15');
INSERT INTO `t_question` VALUES (5, 1, 50, 0, '鲁迅先生称（）为“史家之绝唱﹐无韵之离骚”。', NULL, '469', NULL, '鲁迅先生称《史记》为“史家之绝唱﹐无韵之离骚”。', NULL, NULL, '2022-04-13 13:21:49', '2022-04-13 13:21:50');
INSERT INTO `t_question` VALUES (6, 1, 49, 0, '世界上面积最大的国家是？', NULL, '476', NULL, '面积排名：俄罗斯、加拿大、中国、美国、巴西。', NULL, NULL, '2022-04-13 13:23:49', '2022-04-13 13:23:49');
INSERT INTO `t_question` VALUES (7, 1, 53, 0, '在2004年雅典奥运会上获得男子110米栏金牌，并打破奥运会纪录的“亚洲飞龙\"是（）。', NULL, '478', NULL, '刘翔获得2004年雅典奥运会110米栏金牌。', NULL, NULL, '2022-04-13 13:29:02', '2022-04-13 13:29:02');
INSERT INTO `t_question` VALUES (8, 1, 48, 0, '我国境内目前确定的最早人类是（）。', NULL, '484', NULL, '“生活在距今约一百七十万年的云南元谋人是我国境内已知的最早人类”。', NULL, NULL, '2022-04-13 13:31:28', '2022-04-13 13:31:28');
INSERT INTO `t_question` VALUES (9, 1, 48, 0, '626年发动“玄武门之变”的是（）。', NULL, '487', NULL, '玄武门之变，是唐高祖武德九年六月初四（公元626年7月2日），由当时唐高祖李渊次子秦王李世民在唐王朝的首都长安城（今陕西省西安）太极宫的北宫门——玄武门附近发动的一次政变。', NULL, NULL, '2022-04-13 13:32:44', '2022-04-13 13:32:44');
INSERT INTO `t_question` VALUES (10, 1, 48, 0, '后世尊称的“药王\"的是（）。', NULL, '493', NULL, '孙思邈（541年—682年），京兆华原（今陕西省铜川市耀州区）人，相传为楚大夫屈原的后人， 唐代医药学家、道士，被后人尊称为“药王”。', NULL, NULL, '2022-04-13 13:35:40', '2022-04-13 13:35:40');
INSERT INTO `t_question` VALUES (11, 1, 48, 0, '澶渊之盟的签约双方是（）。', NULL, '496', NULL, '澶（chán）渊之盟是北宋和辽朝，在经过二十五年的战争后缔结的盟约。', NULL, NULL, '2022-04-13 13:38:08', '2022-04-13 13:38:08');
INSERT INTO `t_question` VALUES (12, 1, 49, 0, '世界上面积最大的洋是（）。', NULL, '499', NULL, '太平洋面积最大、北冰洋面积最小。', NULL, NULL, '2022-04-13 13:41:56', '2022-04-13 13:41:56');
INSERT INTO `t_question` VALUES (13, 1, 49, 0, '世界上面积最大的大洲是（）。', NULL, '506', NULL, '亚洲面积最大。', NULL, NULL, '2022-04-13 13:43:23', '2022-04-13 13:43:23');
INSERT INTO `t_question` VALUES (14, 1, 49, 0, '世界上最长的河是（）。', NULL, '511', NULL, '最长的是尼罗河。', NULL, NULL, '2022-04-13 13:45:15', '2022-04-13 13:45:15');
INSERT INTO `t_question` VALUES (15, 1, 49, 0, '世界上最深的湖是（）。', NULL, '518', NULL, '最深的湖是贝加尔湖。', NULL, NULL, '2022-04-13 13:47:49', '2022-04-13 13:47:49');
INSERT INTO `t_question` VALUES (16, 1, 48, 0, '“大禹治水”的故事家喻户晓，大禹治理的是哪个流域的洪水？', NULL, '521', NULL, '黄河流域。', NULL, NULL, '2022-04-13 13:50:21', '2022-04-13 13:50:21');
INSERT INTO `t_question` VALUES (17, 1, 50, 0, '“月上柳梢头，人约黄昏后”描写的是哪个传统节日？', NULL, '523', NULL, '出自欧阳修《生查子·元夕》。原文如下：去年元夜时，花市灯如昼。月上柳梢头，人约黄昏后。今年元夜时，月与灯依旧。不见去年人，泪湿春衫袖。描述的是元宵节。', NULL, NULL, '2022-04-13 13:52:12', '2022-04-13 13:52:12');
INSERT INTO `t_question` VALUES (18, 1, 50, 0, '对《红楼梦》中的情节概述不准确的一项是（）。', NULL, '529', NULL, '远嫁的是探春。', NULL, NULL, '2022-04-13 13:55:48', '2022-04-13 13:55:48');
INSERT INTO `t_question` VALUES (19, 1, 50, 0, '名著水浒传的作者是（）？', NULL, '533', NULL, '中国四大名著的作者分别是《水浒传》施耐庵；《三国演义》罗贯中；《西游记》吴承恩；《红楼梦》曹雪芹。', NULL, NULL, '2022-04-13 13:57:55', '2022-04-13 13:57:55');
INSERT INTO `t_question` VALUES (20, 1, 50, 0, '孙悟空向（）借来金箍棒。', NULL, '540', NULL, '不多说', NULL, NULL, '2022-04-13 14:00:32', '2022-04-13 14:00:57');
INSERT INTO `t_question` VALUES (21, 1, 48, 1, '南北朝的南朝指的是（）。', NULL, '542,544,545,546', NULL, '南朝宋齐梁陈', NULL, NULL, '2022-04-13 14:02:50', '2022-04-13 14:02:50');
INSERT INTO `t_question` VALUES (22, 1, 48, 1, '属于唐宋八大家的有（）。', NULL, '549,550,551', NULL, '唐宋八大家，又称为“唐宋散文八大家”，是唐代和宋代八位散文家的合称，分别为唐代韩愈、柳宗元和宋代欧阳修、苏洵、苏轼、苏辙、王安石、曾巩八位。', NULL, NULL, '2022-04-13 14:05:34', '2022-04-13 14:05:34');
INSERT INTO `t_question` VALUES (23, 1, 48, 1, '中国五岳，中华传统文化中五大名山的总称，属于五岳的有（）。', NULL, '553,555,556', NULL, '东岳泰山、南岳衡山、西岳华山、北岳恒山、中岳嵩山', NULL, NULL, '2022-04-13 14:10:10', '2022-04-13 14:10:10');
INSERT INTO `t_question` VALUES (24, 1, 48, 1, '下面属于西汉皇帝的有（）。', NULL, '557,558,560', NULL, '刘秀是东汉皇帝。', NULL, NULL, '2022-04-13 14:15:59', '2022-04-13 14:15:59');
INSERT INTO `t_question` VALUES (25, 1, 49, 1, '七大洲中，在东半球的大洲有（）。', NULL, '561,562,563,566', NULL, '东半球四大洲：亚洲、欧洲、非洲、大洋洲', NULL, NULL, '2022-04-13 14:17:48', '2022-04-13 14:17:48');
INSERT INTO `t_question` VALUES (26, 1, 49, 1, '下面的省会城市有（）。', NULL, '575,576', NULL, '不多说', NULL, NULL, '2022-04-13 14:20:20', '2022-04-13 14:20:34');
INSERT INTO `t_question` VALUES (27, 1, 49, 1, '我国的气候类型主要有（）。', NULL, '758,759,760,761', NULL, '请看图片。', NULL, NULL, '2022-04-13 14:22:41', '2022-05-04 23:55:33');
INSERT INTO `t_question` VALUES (28, 1, 50, 1, '下面属于四大名著的有（）。', NULL, '588,590,591', NULL, '四大名著：《红楼梦》、《水浒传》、《三国演义》、《西游记》。', NULL, NULL, '2022-04-13 14:26:03', '2022-04-13 14:26:03');
INSERT INTO `t_question` VALUES (29, 1, 50, 1, '初唐四杰有（）。', NULL, '592,593,594', NULL, '初唐四杰:王勃、杨炯、卢照邻、骆宾王。', NULL, NULL, '2022-04-13 14:27:06', '2022-04-13 14:27:06');
INSERT INTO `t_question` VALUES (30, 1, 53, 1, '下面属于我国羽毛球运动员的有（）。', NULL, '596,597,599', NULL, '李宗伟是来自马来西亚的运动员。', NULL, NULL, '2022-04-13 14:31:37', '2022-04-13 14:31:37');
INSERT INTO `t_question` VALUES (31, 1, 48, 2, '秦始皇是第一个称皇帝的君主。', NULL, 'true', NULL, '是的', NULL, NULL, '2022-04-13 14:33:01', '2022-04-13 14:33:01');
INSERT INTO `t_question` VALUES (32, 1, 48, 2, '科举考试中殿试的第三名是榜眼。', NULL, 'false', NULL, '第一名状元、第二名榜眼、第三名探花。', NULL, NULL, '2022-04-13 14:41:16', '2022-04-13 14:41:16');
INSERT INTO `t_question` VALUES (33, 1, 48, 2, '朱元璋是明朝的第一个皇帝', NULL, 'true', NULL, '是的', NULL, NULL, '2022-04-13 14:41:34', '2022-04-13 14:41:34');
INSERT INTO `t_question` VALUES (34, 1, 48, 2, '罢黜百家独尊儒术的皇帝是汉武帝刘彻。', NULL, 'true', NULL, '是的', NULL, NULL, '2022-04-13 14:42:36', '2022-04-13 14:42:36');
INSERT INTO `t_question` VALUES (35, 1, 49, 2, '黄河是中国最长的河流。', NULL, 'false', NULL, '长江是中国最长的河流。', NULL, NULL, '2022-04-13 14:42:59', '2022-04-13 14:42:59');
INSERT INTO `t_question` VALUES (36, 1, 49, 2, '中国面积最大的省是西藏。', NULL, 'false', NULL, '我国面积最大的省是新疆。', NULL, NULL, '2022-04-13 14:43:54', '2022-04-13 14:43:54');
INSERT INTO `t_question` VALUES (37, 1, 49, 2, '\"江南佳丽地，金陵帝王州。\"中描述的地方是现在的南京。', NULL, 'true', NULL, '是的', NULL, NULL, '2022-04-13 14:44:55', '2022-04-13 14:44:55');
INSERT INTO `t_question` VALUES (38, 1, 50, 2, '水浒传中被称为入云龙的是关胜。', NULL, 'false', NULL, '入云龙公孙胜，大刀关胜', NULL, NULL, '2022-04-13 14:46:55', '2022-04-13 14:46:55');
INSERT INTO `t_question` VALUES (39, 1, 50, 2, '“锦瑟无端五十弦 一弦一柱思华年”是李商隐的诗。', NULL, 'true', NULL, '是的', NULL, NULL, '2022-04-13 14:47:59', '2022-04-13 14:47:59');
INSERT INTO `t_question` VALUES (40, 1, 50, 2, '中国的第一步纪传体通史是《资治通鉴》。', NULL, 'false', NULL, '中国的第一步纪传体通史是《史记》。', NULL, NULL, '2022-04-13 14:48:48', '2022-04-13 14:48:48');
INSERT INTO `t_question` VALUES (41, 1, 50, 3, '四书五经中的四书包括《大学》、《中庸》、《______》、《孟子》。', NULL, '论语', NULL, '四书指《大学》《中庸》《论语》《孟子》。', NULL, NULL, '2022-04-13 14:49:53', '2022-04-29 17:43:57');
INSERT INTO `t_question` VALUES (42, 1, 48, 3, '“名师大将莫自牢，千军万马避白袍。”描述的是________将军。', NULL, '陈庆之', NULL, '不多说', NULL, NULL, '2022-04-13 14:52:11', '2022-04-13 14:52:11');
INSERT INTO `t_question` VALUES (43, 1, 48, 3, '岳飞、张煌言和_______并称西湖三杰？', NULL, '于谦', NULL, '不多说', NULL, NULL, '2022-04-13 14:54:39', '2022-04-13 14:54:54');
INSERT INTO `t_question` VALUES (44, 1, 49, 3, '被称为中国四大名楼之一的岳阳楼是位于_____省。', NULL, '湖南', NULL, '湖南岳阳岳阳楼。', NULL, NULL, '2022-04-13 14:56:56', '2022-04-13 14:58:38');
INSERT INTO `t_question` VALUES (45, 1, 53, 3, '我国第一位奥运金牌是______获得的。', NULL, '许海峰', NULL, '不多说', NULL, NULL, '2022-04-13 15:02:20', '2022-04-13 15:02:20');
INSERT INTO `t_question` VALUES (46, 1, 48, 4, '论秦始皇的功与过。', NULL, '功：\n（1） 秦始皇顺应历史潮流，灭六国统一了中国，结束了诸侯长期割据混战的局面，符合广大人民的愿望。\n（2）建立了君主专制中央集权制度，在地方推行郡县制。\n（3）统一文字、货币、度量衡等。\n（4）派蒙恬北击匈奴，修万里长城，修灵渠。\n（5）促进了各地区各民族之间的经济文化交流，对后世产生了深远影响。\n过：\n（1）但是他又是统治残暴的封建皇帝。他广建宫殿陵墓，浪费了大量人力、物力、财力。\n（2）他还制定残酷的刑法，使人民生活在水深火热之中。\n（3）他焚书坑儒，钳制了思想，摧残了文化。', NULL, '言之有理即可。', NULL, NULL, '2022-04-13 15:03:31', '2022-04-13 15:05:17');
INSERT INTO `t_question` VALUES (47, 1, 48, 4, '汉武帝时出现大一统局面的原因。', NULL, '（1）颁布“推恩令”，削弱王国权力，加强中央对王国的控制。\n（2）把盐铁经营权和铸币权收归中央，加强中央对经济的控制。\n（3）接受董仲舒“罢黜百家，独尊儒术”的建议，把儒家学说作为思想统治工具，在长安设立太学。\n（4）派卫青、霍去病北击匈奴，安定北部边境。', NULL, '言之有理即可。', NULL, NULL, '2022-04-13 15:05:58', '2022-04-13 15:05:58');
INSERT INTO `t_question` VALUES (56, 1, 50, 3, '四书五经中的四书包括《大学》、《中庸》、《______》、《孟子》。', NULL, '论语', NULL, '填空题分析', NULL, NULL, '2022-04-26 22:23:38', '2022-04-29 17:44:42');
INSERT INTO `t_question` VALUES (57, 1, 48, 4, '论秦始皇的功与过。', NULL, '功：\n（1） 秦始皇顺应历史潮流，灭六国统一了中国，结束了诸侯长期割据混战的局面，符合广大人民的愿望。\n（2）建立了君主专制中央集权制度，在地方推行郡县制。\n（3）统一文字、货币、度量衡等。\n（4）派蒙恬北击匈奴，修万里长城，修灵渠。\n（5）促进了各地区各民族之间的经济文化交流，对后世产生了深远影响。\n过：\n（1）但是他又是统治残暴的封建皇帝。他广建宫殿陵墓，浪费了大量人力、物力、财力。\n（2）他还制定残酷的刑法，使人民生活在水深火热之中。\n（3）他焚书坑儒，钳制了思想，摧残了文化。', NULL, '简答题分析', NULL, NULL, '2022-04-26 22:23:38', '2022-04-26 22:23:38');
INSERT INTO `t_question` VALUES (78, 1, 49, 0, '明朝最后一个皇帝是谁？', NULL, '685', NULL, '单选题分析', NULL, NULL, '2022-04-26 23:11:42', '2022-04-26 23:11:42');
INSERT INTO `t_question` VALUES (104, 1, 49, 0, '测试单选题', NULL, '764', NULL, '单选题分析', NULL, NULL, '2022-05-05 00:01:50', '2022-05-05 00:01:50');
INSERT INTO `t_question` VALUES (105, 1, 48, 1, '测试多选题', NULL, '767,768,769,770', NULL, '多选题分析', NULL, NULL, '2022-05-05 00:01:50', '2022-05-05 00:01:50');
INSERT INTO `t_question` VALUES (106, 1, 50, 2, '测试判断题', NULL, 'false', NULL, '判断题分析', NULL, NULL, '2022-05-05 00:01:50', '2022-05-05 00:01:50');
INSERT INTO `t_question` VALUES (107, 1, 50, 3, '测试填空题', NULL, '填空题答案', NULL, '填空题分析', NULL, NULL, '2022-05-05 00:01:50', '2022-05-05 00:01:50');
INSERT INTO `t_question` VALUES (108, 1, 48, 4, '测试简答题', NULL, '简答题答案', NULL, '简答题分析', NULL, NULL, '2022-05-05 00:01:50', '2022-05-05 00:01:50');

-- ----------------------------
-- Table structure for t_repo
-- ----------------------------
DROP TABLE IF EXISTS `t_repo`;
CREATE TABLE `t_repo`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '题库名称',
  `sigle_count` int(11) NOT NULL DEFAULT 0 COMMENT '单选题数量',
  `multi_count` int(11) NOT NULL DEFAULT 0 COMMENT '多选题数量',
  `judge_count` int(11) NOT NULL DEFAULT 0 COMMENT '判断题数量',
  `blank_count` int(11) NOT NULL DEFAULT 0 COMMENT '填空题数量',
  `write_count` int(11) NOT NULL DEFAULT 0 COMMENT '简答题数量',
  `is_open` tinyint(4) NOT NULL DEFAULT 0 COMMENT '开放训练',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课程表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_repo
-- ----------------------------
INSERT INTO `t_repo` VALUES (1, '知识问答综合题库', 22, 10, 10, 5, 2, 1, '无', '2022-04-13 12:36:51', '2022-04-22 12:38:40');
INSERT INTO `t_repo` VALUES (6, 'C程序设计', 0, 0, 0, 0, 0, 0, '123', '2022-05-04 14:13:42', '2022-05-04 14:13:42');
INSERT INTO `t_repo` VALUES (7, 'Java程序设计', 0, 0, 0, 0, 0, 0, 'hhh', '2022-05-04 14:13:53', '2022-05-04 14:13:53');

SET FOREIGN_KEY_CHECKS = 1;
