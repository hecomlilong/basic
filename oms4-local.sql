-- MySQL dump 10.13  Distrib 5.7.11, for osx10.11 (x86_64)
--
-- Host: localhost    Database: oms4
-- ------------------------------------------------------
-- Server version	5.7.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `access_token`
--

DROP TABLE IF EXISTS `access_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(90) NOT NULL,
  `time` datetime NOT NULL COMMENT '刷新时间点',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2005 DEFAULT CHARSET=utf8 COMMENT='访问会话控制';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cusid` int(11) NOT NULL COMMENT '所属客户ID',
  `cusname` varchar(200) NOT NULL,
  `contracts_id` int(11) NOT NULL COMMENT '所属合同ID',
  `enterprise_code` varchar(50) NOT NULL COMMENT '企业代码',
  `username` varchar(40) NOT NULL COMMENT '用户名',
  `password` varchar(40) NOT NULL COMMENT '密码',
  `contact` varchar(30) NOT NULL COMMENT '客户联系人',
  `contact_nb` varchar(30) NOT NULL COMMENT '联系电话',
  `email` varchar(60) NOT NULL COMMENT '邮箱',
  `industry` varchar(60) NOT NULL COMMENT '行业',
  `leader` varchar(30) NOT NULL COMMENT '企业负责人',
  `leader_phone` varchar(60) NOT NULL COMMENT '负责人电话',
  `install_addr` varchar(255) NOT NULL COMMENT '安装地址',
  `open_note` varchar(255) NOT NULL,
  `create_uid` int(11) NOT NULL COMMENT '申请人ID',
  `create_time` datetime NOT NULL COMMENT '申请时间',
  `audit_flg` tinyint(1) NOT NULL COMMENT '审核状态：0未审核，1审核通过，2审核未通过',
  `audit_remark` text NOT NULL COMMENT '审核备注',
  `audit_uid` int(11) NOT NULL COMMENT '审核人',
  `audit_time` datetime NOT NULL COMMENT '审核时间',
  `is_part` tinyint(1) NOT NULL COMMENT '是否部分开户',
  `isarea` smallint(4) NOT NULL COMMENT '区域',
  `is_delete` tinyint(1) NOT NULL COMMENT '是否已删除：0否1是',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8698 DEFAULT CHARSET=utf8 COMMENT='开户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `advice_comment`
--

DROP TABLE IF EXISTS `advice_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advice_comment` (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` int(11) NOT NULL COMMENT '评论者',
  `click` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1赞2踩0评论',
  `comment` varchar(255) NOT NULL COMMENT '评论内容',
  `add_time` datetime NOT NULL COMMENT '时间',
  `advice_id` int(11) NOT NULL COMMENT '建议ID',
  `adder` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=643 DEFAULT CHARSET=utf8 COMMENT='建议评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `advice_team`
--

DROP TABLE IF EXISTS `advice_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advice_team` (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `address` text NOT NULL,
  `content` text NOT NULL,
  `add_time` datetime NOT NULL,
  `adder` varchar(30) NOT NULL,
  `add_user` int(11) NOT NULL,
  `del` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COMMENT='团队建设建议表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blankcontract`
--

DROP TABLE IF EXISTS `blankcontract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blankcontract` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contract_no` varchar(30) NOT NULL COMMENT '合同编号',
  `apply_uid` int(11) NOT NULL COMMENT '申请业务员ID',
  `apply_time` datetime NOT NULL COMMENT '申请时间',
  `grant_status` tinyint(1) NOT NULL COMMENT '合同领取状态：0未领取、1已领取、2过期未领',
  `grant_uid` int(11) NOT NULL COMMENT '发放人ID',
  `grant_user` varchar(30) NOT NULL COMMENT '发放人',
  `grant_time` datetime NOT NULL COMMENT '发放时间',
  `sign_status` tinyint(1) NOT NULL COMMENT '是否已签回：0否1是',
  `sign_uid` int(11) NOT NULL COMMENT '签回人ID',
  `sign_time` datetime NOT NULL COMMENT '签回时间',
  `discard_status` tinyint(1) NOT NULL COMMENT '废弃/丢失处理状态：0正常、1丢失、2废弃',
  `discard_uid` int(11) NOT NULL COMMENT '作废操作人ID',
  `discard_user` varchar(30) NOT NULL,
  `discard_time` datetime NOT NULL COMMENT '作废操作时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `contract_no` (`contract_no`)
) ENGINE=MyISAM AUTO_INCREMENT=15796 DEFAULT CHARSET=utf8 COMMENT='空白合同';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blankcontract_config`
--

DROP TABLE IF EXISTS `blankcontract_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blankcontract_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_code` varchar(10) NOT NULL COMMENT '合同编号前缀',
  `year` varchar(10) NOT NULL COMMENT '年份',
  `flg` int(11) NOT NULL COMMENT '当前最大流水号',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=83 DEFAULT CHARSET=utf8 COMMENT='空白合同-合同编号前缀';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache_active_day`
--

DROP TABLE IF EXISTS `cache_active_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_active_day` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day` int(8) NOT NULL,
  `cusid` int(11) DEFAULT NULL,
  `operateid` int(11) NOT NULL,
  `cusname` varchar(255) DEFAULT NULL,
  `dhflg` tinyint(1) DEFAULT '0',
  `bfflg` tinyint(1) DEFAULT '0',
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=29556 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache_dashboard`
--

DROP TABLE IF EXISTS `cache_dashboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_dashboard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position` int(11) NOT NULL COMMENT '直销用户对应的position',
  `datatype` varchar(90) NOT NULL COMMENT '报表类型',
  `regionid` int(11) NOT NULL COMMENT '机构ID：position=57时为0，position为58时存uid,position=60/59时为configlistID、position=61时为用户ID',
  `res` text NOT NULL COMMENT '缓存的图表JSON值',
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=37441 DEFAULT CHARSET=utf8 COMMENT='驾驶舱缓存数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache_day`
--

DROP TABLE IF EXISTS `cache_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_day` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `realname` varchar(60) NOT NULL COMMENT '冗余字段：业务员姓名',
  `area_id` int(11) NOT NULL COMMENT '区域或战区ID',
  `area` varchar(60) NOT NULL COMMENT '冗余字段：业务员所属战区',
  `dept` varchar(90) NOT NULL COMMENT '当时所在部门',
  `deptid` int(11) NOT NULL COMMENT '当时所在部门ID',
  `day` int(11) NOT NULL COMMENT 'YYYYMMDD',
  `ziliao` int(11) NOT NULL COMMENT '资料量',
  `dianhua` int(11) NOT NULL COMMENT '电话量',
  `kp` int(11) NOT NULL COMMENT '绕到负责人数量',
  `yuefang` int(11) NOT NULL COMMENT '约访量',
  `baifang` int(11) NOT NULL COMMENT '拜访数',
  `peifang` int(11) NOT NULL COMMENT '陪访数',
  `yeji` int(11) NOT NULL COMMENT '业绩',
  `sihai` int(11) NOT NULL DEFAULT '0' COMMENT '私海数量',
  `cusin` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '拉入客户数',
  `cusout` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '抛出客户数',
  `lasttime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `isRenew` tinyint(1) NOT NULL COMMENT '是否是续签',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `day` (`day`),
  KEY `userid_2` (`userid`,`day`),
  KEY `isRenew` (`isRenew`),
  KEY `yeji` (`yeji`)
) ENGINE=MyISAM AUTO_INCREMENT=573533 DEFAULT CHARSET=utf8 COMMENT='业务员工作统计表-缓存数据-每天';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache_day_leader`
--

DROP TABLE IF EXISTS `cache_day_leader`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_day_leader` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `realname` varchar(60) NOT NULL COMMENT '冗余字段：业务员姓名',
  `area_id` int(11) NOT NULL COMMENT '区域或战区ID',
  `area` varchar(60) NOT NULL COMMENT '冗余字段：业务员所属战区',
  `dept` varchar(90) NOT NULL COMMENT '当时所在部门',
  `deptid` int(11) NOT NULL COMMENT '当时所在部门ID',
  `day` char(8) NOT NULL COMMENT 'YYYYMMDD',
  `ziliao` int(11) NOT NULL COMMENT '资料量',
  `dianhua` int(11) NOT NULL COMMENT '电话量',
  `kp` int(11) NOT NULL COMMENT '绕到负责人数量',
  `yuefang` int(11) NOT NULL COMMENT '约访量',
  `baifang` int(11) NOT NULL COMMENT '拜访数',
  `peifang` int(11) NOT NULL COMMENT '陪访数',
  `yeji` int(11) NOT NULL COMMENT '业绩',
  `sihai` int(11) NOT NULL DEFAULT '0' COMMENT '私海数量',
  `lasttime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `day` (`day`),
  KEY `userid_2` (`userid`,`day`)
) ENGINE=MyISAM AUTO_INCREMENT=3332 DEFAULT CHARSET=utf8 COMMENT='leader工作统计表-缓存数据-每天';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache_forecast_day`
--

DROP TABLE IF EXISTS `cache_forecast_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_forecast_day` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ownerid` int(11) NOT NULL COMMENT '用户ID',
  `realname` varchar(30) NOT NULL COMMENT '用户姓名',
  `area_id` int(11) NOT NULL COMMENT '区域或战区ID',
  `area` varchar(90) NOT NULL COMMENT '区域或战区名称',
  `dept` varchar(90) NOT NULL COMMENT '当时所在部门',
  `deptid` int(11) NOT NULL COMMENT '当时所在部门ID',
  `updatetime` datetime NOT NULL COMMENT '最近更新日期',
  `day` varchar(8) NOT NULL COMMENT '日期',
  `cust_forecast` varchar(30) NOT NULL COMMENT '预测客户数',
  `cust_real` varchar(30) NOT NULL COMMENT '实际客户数',
  `retmoney_forecast` varchar(30) NOT NULL COMMENT '预测回款金额',
  `retmoney_real` varchar(30) NOT NULL COMMENT '实际回款金额',
  PRIMARY KEY (`id`),
  KEY `ownerid` (`ownerid`),
  KEY `day` (`day`),
  KEY `ownerid_2` (`ownerid`,`day`)
) ENGINE=MyISAM AUTO_INCREMENT=120377 DEFAULT CHARSET=utf8 COMMENT='预测与回款缓存表-day';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache_forecast_month`
--

DROP TABLE IF EXISTS `cache_forecast_month`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_forecast_month` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ownerid` int(11) NOT NULL COMMENT '用户ID',
  `realname` varchar(30) NOT NULL COMMENT '用户姓名',
  `area_id` int(11) NOT NULL COMMENT '区域或战区ID',
  `area` varchar(90) NOT NULL COMMENT '区域或战区名称',
  `dept` varchar(90) NOT NULL COMMENT '当时所在部门',
  `deptid` int(11) NOT NULL COMMENT '当时所在部门ID',
  `updatetime` datetime NOT NULL COMMENT '最近更新日期',
  `month` varchar(6) NOT NULL COMMENT '月份',
  `cust_forecast` varchar(30) NOT NULL COMMENT '预测客户数',
  `cust_real` varchar(30) NOT NULL COMMENT '实际客户数',
  `retmoney_forecast` varchar(30) NOT NULL COMMENT '预测回款金额',
  `retmoney_real` varchar(30) NOT NULL COMMENT '实际回款金额',
  PRIMARY KEY (`id`),
  KEY `ownerid` (`ownerid`),
  KEY `month` (`month`),
  KEY `ownerid_2` (`ownerid`,`month`)
) ENGINE=MyISAM AUTO_INCREMENT=6981 DEFAULT CHARSET=utf8 COMMENT='预测与回款缓存表-month';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache_forecast_week`
--

DROP TABLE IF EXISTS `cache_forecast_week`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_forecast_week` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ownerid` int(11) NOT NULL COMMENT '用户ID',
  `realname` varchar(30) NOT NULL COMMENT '用户姓名',
  `area_id` int(11) NOT NULL COMMENT '区域或战区ID',
  `area` varchar(90) NOT NULL COMMENT '区域或战区名称',
  `dept` varchar(90) NOT NULL COMMENT '当时所在部门',
  `deptid` int(11) NOT NULL COMMENT '当时所在部门ID',
  `updatetime` datetime NOT NULL COMMENT '最近更新日期',
  `week` varchar(20) NOT NULL COMMENT '星期',
  `cust_forecast` varchar(30) NOT NULL COMMENT '预测客户数',
  `cust_real` varchar(30) NOT NULL COMMENT '实际客户数',
  `retmoney_forecast` varchar(30) NOT NULL COMMENT '预测回款金额',
  `retmoney_real` varchar(30) NOT NULL COMMENT '实际回款金额',
  PRIMARY KEY (`id`),
  KEY `ownerid` (`ownerid`),
  KEY `week` (`week`),
  KEY `ownerid_2` (`ownerid`,`week`)
) ENGINE=MyISAM AUTO_INCREMENT=18152 DEFAULT CHARSET=utf8 COMMENT='预测与回款缓存表-week';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache_month_yeji`
--

DROP TABLE IF EXISTS `cache_month_yeji`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_month_yeji` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `realname` varchar(255) NOT NULL,
  `month` char(6) NOT NULL COMMENT '月份',
  `total` int(11) NOT NULL COMMENT '业绩',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache_org`
--

DROP TABLE IF EXISTS `cache_org`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_org` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `month` char(6) NOT NULL COMMENT '月份',
  `org` int(11) NOT NULL COMMENT '组织机构ID',
  `yeji` int(11) NOT NULL COMMENT '业绩',
  `yqyh` int(11) NOT NULL COMMENT '金额：已签已回，应该与yeji字段相等才正确',
  `yqwh` int(11) NOT NULL COMMENT '金额：已签未回',
  `zdgj` int(11) NOT NULL COMMENT '金额：重点跟进',
  `nqnh` int(11) NOT NULL COMMENT '金额：能签能回',
  `cjkh` int(11) NOT NULL COMMENT '金额：冲击客户',
  `yskh` int(11) NOT NULL COMMENT '金额：已死客户',
  `dld` int(11) NOT NULL COMMENT '金额：待理单',
  `num_yqyh` int(11) NOT NULL COMMENT '客户数-已签已回',
  `num_yqwh` int(11) NOT NULL COMMENT '客户数-已签未回',
  `num_zdgj` int(11) NOT NULL COMMENT '客户数-重点跟进',
  `num_nqnh` int(11) NOT NULL COMMENT '客户数-能签能回',
  `num_cjkh` int(11) NOT NULL COMMENT '客户数-冲击客户',
  `num_yskh` int(11) NOT NULL COMMENT '客户数-已死客户',
  `num_dld` int(11) NOT NULL COMMENT '客户数-待理单',
  `xf_money` varchar(30) NOT NULL COMMENT '续费本月已回款金额',
  `xf_kh` int(11) NOT NULL COMMENT '本月已续费客户数',
  `xf_total_kh` int(11) NOT NULL COMMENT '本月可续费客户数',
  `xf_perc` varchar(30) NOT NULL COMMENT '续费率（%前面的数字）',
  PRIMARY KEY (`id`),
  KEY `org` (`org`),
  KEY `month` (`month`),
  KEY `month_2` (`month`,`org`)
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=utf8 COMMENT='每一个组织架构每月的业绩';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache_report`
--

DROP TABLE IF EXISTS `cache_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_type` tinyint(3) NOT NULL COMMENT '报表类型：1月销售目标达成，2销售漏斗图，3本月销售业绩对比，4销售状态阶梯图，5本月人均拜访量分布，6本月人均拜访量对比，7本月人均资料量分布图，8本月人均资料量对比，9今日预测与回款对比，10月预测目标达成',
  `region_type` int(11) NOT NULL COMMENT '组织架构级别：1全国，2大区，3城市，4战区经理',
  `region_id` int(11) NOT NULL COMMENT '对应的configlist表的ID',
  `json` text NOT NULL COMMENT '展示数据需要的json',
  `last_update_time` datetime NOT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='首页报表缓存记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache_seapush_assign_log`
--

DROP TABLE IF EXISTS `cache_seapush_assign_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_seapush_assign_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assigntime` datetime DEFAULT NULL,
  `war` varchar(255) DEFAULT NULL,
  `realname` varchar(255) NOT NULL,
  `cusname` varchar(255) DEFAULT NULL,
  `linkstatus` varchar(255) DEFAULT '0',
  `recallcount` varchar(255) DEFAULT '0',
  `vtplancount` datetime NOT NULL,
  `rvisitcount` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `into_time` varchar(255) NOT NULL,
  `throw_reason` varchar(255) NOT NULL,
  `contract_flg` varchar(255) NOT NULL,
  `contract_uid` varchar(255) NOT NULL,
  `contract_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `callrecord`
--

DROP TABLE IF EXISTS `callrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `callrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cusid` int(11) DEFAULT NULL COMMENT '客户ID',
  `cusname` varchar(128) DEFAULT NULL COMMENT '客户名称',
  `linkman` varchar(64) DEFAULT NULL COMMENT '联系人',
  `telephone` varchar(64) DEFAULT NULL COMMENT '电话',
  `position` varchar(64) DEFAULT NULL COMMENT '职位',
  `content` text COMMENT '电话记录',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `operator` varchar(50) DEFAULT NULL COMMENT '录入人',
  `legworknumber` int(11) DEFAULT NULL COMMENT '外勤人数',
  `carnumber` int(11) DEFAULT NULL COMMENT '车辆数',
  `linkstatus` varchar(50) DEFAULT NULL COMMENT '联系情况',
  `next_time` datetime DEFAULT NULL COMMENT '下次联系时间',
  `is_renew` tinyint(1) NOT NULL COMMENT '是否续签',
  `appoint_time` datetime NOT NULL COMMENT '约见时间',
  `appoint_location` text NOT NULL COMMENT '约见地点',
  `review_type` tinyint(1) NOT NULL COMMENT '回访类型：0无，1使用情况了解，2客户来电，3约见客户',
  `review_target` tinyint(1) NOT NULL COMMENT '回访对象：1平台负责人，2老板',
  `is_deal_problems` tinyint(1) NOT NULL COMMENT '是否处理客户问题：0否1有',
  PRIMARY KEY (`id`),
  KEY `cusid` (`cusid`),
  KEY `index_name` (`linkstatus`),
  KEY `operator` (`operator`),
  KEY `create_time` (`create_time`)
) ENGINE=MyISAM AUTO_INCREMENT=9285739 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `callrecord_latest`
--

DROP TABLE IF EXISTS `callrecord_latest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `callrecord_latest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cusid` int(11) DEFAULT NULL COMMENT '客户ID',
  `cusname` varchar(128) DEFAULT NULL COMMENT '客户名称',
  `linkman` varchar(64) DEFAULT NULL COMMENT '联系人',
  `telephone` varchar(64) DEFAULT NULL COMMENT '电话',
  `position` varchar(64) DEFAULT NULL COMMENT '职位',
  `content` text COMMENT '电话记录',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `operator` varchar(50) DEFAULT NULL COMMENT '录入人',
  `legworknumber` int(11) DEFAULT NULL COMMENT '外勤人数',
  `carnumber` int(11) DEFAULT NULL COMMENT '车辆数',
  `linkstatus` varchar(50) DEFAULT NULL COMMENT '联系情况',
  `next_time` datetime DEFAULT NULL COMMENT '下次联系时间',
  `is_renew` tinyint(1) NOT NULL COMMENT '是否属于续签',
  `appoint_time` datetime NOT NULL COMMENT '约见时间',
  `appoint_location` varchar(120) NOT NULL COMMENT '约见地点',
  `review_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '回访类型：0 无，1 使用情况了解，2 客户来电 ，3 约见客户 ',
  `review_ target` tinyint(1) NOT NULL COMMENT '回访对象：1、平台负责人 2、老板',
  `is_deal_problems` tinyint(1) NOT NULL COMMENT '是否处理客户问题：0、没有，1、有',
  PRIMARY KEY (`id`),
  KEY `cusid` (`cusid`),
  KEY `index_name` (`linkstatus`),
  KEY `operator` (`operator`)
) ENGINE=MyISAM AUTO_INCREMENT=67884 DEFAULT CHARSET=utf8 COMMENT='电话记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `configlist`
--

DROP TABLE IF EXISTS `configlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '属性名称',
  `type` varchar(50) DEFAULT NULL COMMENT '属性类型',
  `order` int(11) DEFAULT NULL COMMENT '排序值',
  `isshow` int(11) DEFAULT NULL COMMENT '是否有效',
  `pid` int(11) DEFAULT NULL COMMENT '父类ID',
  `remark` text COMMENT '属性描述',
  `issubclass` int(11) DEFAULT '0' COMMENT '是否有子类  1有  0没有',
  `isnew` tinyint(1) NOT NULL COMMENT '是否新签',
  `del` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=70259 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contract_image`
--

DROP TABLE IF EXISTS `contract_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contract_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `contract_id` int(11) NOT NULL COMMENT '合同ID',
  `image_url` varchar(100) NOT NULL COMMENT '合同图片地址',
  PRIMARY KEY (`id`),
  KEY `contract_id` (`contract_id`)
) ENGINE=MyISAM AUTO_INCREMENT=53057 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contract_income_month`
--

DROP TABLE IF EXISTS `contract_income_month`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contract_income_month` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contract_id` int(11) NOT NULL COMMENT '合同ID',
  `product_version` varchar(30) NOT NULL COMMENT '产品版本',
  `type` tinyint(1) NOT NULL COMMENT '0续单，1新签，2续费',
  `sd` tinyint(1) NOT NULL COMMENT '1代表服务，2代表设备',
  `sdname` varchar(60) NOT NULL COMMENT '服务/设备名称',
  `month` char(6) NOT NULL COMMENT '月份YYYYMM',
  `income` varchar(20) NOT NULL COMMENT '当月应收',
  `income_desc` text NOT NULL COMMENT '费用组成描述',
  PRIMARY KEY (`id`),
  KEY `contract_id` (`contract_id`,`month`),
  KEY `contract_id_2` (`contract_id`)
) ENGINE=MyISAM AUTO_INCREMENT=293539 DEFAULT CHARSET=utf8 COMMENT='合同应收账款-按月拆分表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contract_money`
--

DROP TABLE IF EXISTS `contract_money`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contract_money` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contract_id` int(11) NOT NULL COMMENT '合同ID',
  `returndate` date NOT NULL COMMENT '回款日期',
  `money` int(11) NOT NULL COMMENT '金额',
  `create_uid` int(11) NOT NULL COMMENT '录入人ID',
  `create_time` datetime NOT NULL COMMENT '录入时间',
  `del` tinyint(1) NOT NULL COMMENT '是否已删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16738 DEFAULT CHARSET=utf8 COMMENT='合同回款记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contract_money_detail`
--

DROP TABLE IF EXISTS `contract_money_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contract_money_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `cm_id` int(11) NOT NULL COMMENT '对应的contract_money的ID',
  `cusid` int(11) NOT NULL COMMENT '企业ID',
  `cusname` varchar(100) NOT NULL COMMENT '公司名称',
  `contract_id` int(11) NOT NULL COMMENT '合同ID',
  `ownerid` int(11) NOT NULL COMMENT '业务员ID',
  `returned_date` date NOT NULL COMMENT '回款日期',
  `money` int(11) NOT NULL COMMENT '回款总金额',
  `newmoney` int(11) NOT NULL COMMENT '新增回款额',
  `remoney` int(11) NOT NULL COMMENT '续费汇款额',
  `devmoney` int(11) NOT NULL COMMENT '设备金额',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3577 DEFAULT CHARSET=utf8 COMMENT='回款详细分拆表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contracts`
--

DROP TABLE IF EXISTS `contracts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contracts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cusid` int(11) DEFAULT NULL COMMENT '客户ID',
  `cusname` varchar(128) DEFAULT NULL COMMENT '客户原始名称',
  `org_cusid` int(11) NOT NULL,
  `trade` smallint(4) NOT NULL COMMENT '行业参照配置',
  `org_cusname` varchar(255) NOT NULL,
  `deptid` int(11) DEFAULT NULL COMMENT '所在部门ID',
  `ownerid` int(11) DEFAULT NULL COMMENT '业务员ID',
  `contractno` varchar(64) DEFAULT NULL COMMENT '合同编号',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `sign_date` date DEFAULT NULL COMMENT '签订日期',
  `new_cusid` int(11) NOT NULL COMMENT '根据company返查customers',
  `company` varchar(128) DEFAULT NULL COMMENT '合同名称',
  `linkman` varchar(32) DEFAULT NULL COMMENT '联系人',
  `telephone` varchar(32) DEFAULT NULL COMMENT '电话',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '客户邮箱地址',
  `devmoney` int(11) DEFAULT NULL COMMENT '设备总额',
  `sermoney` int(11) DEFAULT NULL COMMENT '服务总额',
  `period` varchar(4) DEFAULT NULL COMMENT '购买日期',
  `giftperiod` varchar(4) DEFAULT NULL COMMENT '赠送日期',
  `begindate` date DEFAULT NULL COMMENT '开始时间',
  `enddate` date DEFAULT NULL COMMENT '结束时间',
  `operator` varchar(32) DEFAULT NULL COMMENT '录入人',
  `sertype` int(11) DEFAULT NULL COMMENT '服务类型',
  `status` int(1) DEFAULT NULL COMMENT '1：待录入；2：签约合同；3：完成合同',
  `devtype` int(11) DEFAULT NULL COMMENT '设备类型',
  `pid` int(11) DEFAULT NULL COMMENT '续费合同，原合同的id',
  `devnumber` int(11) DEFAULT NULL COMMENT '设备数量',
  `devprice` int(11) DEFAULT NULL COMMENT '设备单价',
  `sernumber` int(11) DEFAULT NULL COMMENT '服务数量',
  `serprice` int(11) DEFAULT NULL COMMENT '服务单价',
  `htmoney` int(11) DEFAULT NULL COMMENT '合同总额',
  `invoiced_money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '已开的发票金额',
  `versions` int(11) DEFAULT NULL COMMENT '版本号',
  `type` int(11) DEFAULT NULL COMMENT '0续单1新签2续费',
  `new_audit_flg` tinyint(1) NOT NULL COMMENT '是否已校对',
  `new_audit_uid` int(11) NOT NULL COMMENT '校对人',
  `new_audit_time` datetime NOT NULL COMMENT '校对时间',
  `new_contract_property` varchar(60) NOT NULL COMMENT '合同性质',
  `new_contract_cusname` varchar(255) NOT NULL COMMENT '合同客户名称',
  `new_cuscode` varchar(90) NOT NULL COMMENT '客户编码',
  `new_product_version` varchar(60) NOT NULL COMMENT '版本',
  `new_product_class` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '产品分类，0-红圈营销；1-红圈管理；2-其他版本（不走自动开户）',
  `new_open_account_time` date NOT NULL COMMENT '开户时间',
  `bl` tinyint(1) NOT NULL COMMENT '是否为补录的合同：0否1是',
  `bl_time` datetime NOT NULL COMMENT '补录时间',
  `bl_user` int(11) NOT NULL COMMENT '补录人',
  `returnmoney_flg` tinyint(1) NOT NULL COMMENT '是否已有回款：0否1是',
  `returnmoney` int(10) NOT NULL COMMENT '回款总额',
  `income_month_flg` tinyint(1) NOT NULL COMMENT '应收款项是否已按月份拆分:0否1是',
  `del` tinyint(1) NOT NULL COMMENT '是否已删除：0否1是',
  `input_flg` tinyint(1) NOT NULL COMMENT '是否已录入，0否1是',
  `input_uid` int(11) NOT NULL COMMENT '录入人ID',
  `input_time` datetime NOT NULL COMMENT '录入时间',
  `audit_flg` tinyint(1) NOT NULL COMMENT '财务审核标识0未1已',
  `audit_time` datetime NOT NULL COMMENT '审核时间',
  `audit_uid` int(11) NOT NULL COMMENT '审核人ID',
  `audit_note` varchar(255) NOT NULL COMMENT '审核备注',
  `is_standard` tinyint(1) NOT NULL COMMENT '是否标准合同',
  `note` varchar(255) NOT NULL COMMENT '非标准合同备注',
  `task_status` tinyint(1) DEFAULT '0' COMMENT '运营审核状态  1：已审   0：未审',
  `task_audit_flg` tinyint(1) NOT NULL DEFAULT '0' COMMENT '运营审核结果   1：客户退款合同作废    2：签单数量与实际回款不符      3：重复合同作废        4：合同调整到期时间',
  `task_note` text COMMENT '运营审核备注',
  `is_sendmsg` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '是否已经发送45天后到期短信／邮件提醒，0-没有；1-已经发送',
  PRIMARY KEY (`id`),
  KEY `contract_no` (`contractno`),
  KEY `company` (`company`),
  KEY `userid` (`ownerid`),
  KEY `customerid` (`cusid`),
  KEY `idx_ennddate` (`enddate`),
  KEY `idx_audit_flg` (`audit_flg`),
  KEY `idx_returnmoney` (`returnmoney`)
) ENGINE=MyISAM AUTO_INCREMENT=22228 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contracts_config`
--

DROP TABLE IF EXISTS `contracts_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contracts_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) NOT NULL,
  `name` varchar(90) NOT NULL,
  `orgid` int(11) NOT NULL COMMENT '原始ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 COMMENT='合同服务-设备基础数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contracts_config_new`
--

DROP TABLE IF EXISTS `contracts_config_new`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contracts_config_new` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) NOT NULL,
  `name` varchar(90) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='合同服务-设备基础数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contracts_customer_trade`
--

DROP TABLE IF EXISTS `contracts_customer_trade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contracts_customer_trade` (
  `cusid` int(6) DEFAULT NULL,
  `cusname` varchar(255) DEFAULT NULL,
  `trade` varchar(60) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ordernum` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3046 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contracts_detail`
--

DROP TABLE IF EXISTS `contracts_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contracts_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contracts_id` int(11) NOT NULL,
  `type` varchar(30) NOT NULL COMMENT '费用类型：service服务费用、device设备费用',
  `name` varchar(60) NOT NULL COMMENT '服务/设备名称',
  `number` int(11) NOT NULL COMMENT '服务/设备数量',
  `price` varchar(30) NOT NULL COMMENT '服务/设备单价',
  `amount` varchar(30) NOT NULL COMMENT '服务/设备总额',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=29246 DEFAULT CHARSET=utf8 COMMENT='合同费用类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cursor_msgid`
--

DROP TABLE IF EXISTS `cursor_msgid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cursor_msgid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(90) NOT NULL COMMENT '用户',
  `msgid` varchar(60) NOT NULL COMMENT '消息ID',
  `createtime` int(11) NOT NULL COMMENT '时间',
  `time` datetime NOT NULL COMMENT '接收时间',
  PRIMARY KEY (`id`),
  KEY `user` (`user`,`msgid`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='微信发送给我方的消息ID记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cusinorout`
--

DROP TABLE IF EXISTS `cusinorout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cusinorout` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `cusid` int(11) NOT NULL,
  `day` char(8) NOT NULL COMMENT 'YYYYMMDD',
  `month` int(11) NOT NULL COMMENT '月',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1：拉入；2：扔出',
  `ctime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `day` (`day`),
  KEY `userid_2` (`userid`,`day`)
) ENGINE=InnoDB AUTO_INCREMENT=236 DEFAULT CHARSET=utf8 COMMENT='业务员拉入客户每天统计表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_comment`
--

DROP TABLE IF EXISTS `customer_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cusid` int(11) NOT NULL COMMENT '客户ID',
  `comment_uid` int(11) NOT NULL COMMENT '评论人',
  `comment_user` varchar(60) NOT NULL COMMENT '评论人姓名',
  `comment` text NOT NULL COMMENT '内容',
  `time` datetime NOT NULL COMMENT '时间',
  PRIMARY KEY (`id`),
  KEY `cusid` (`cusid`),
  KEY `comment_uid` (`comment_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='客户评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_new`
--

DROP TABLE IF EXISTS `customer_new`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_new` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(255) NOT NULL COMMENT '公司名称',
  `contact_name` varchar(40) NOT NULL COMMENT '联系人',
  `contact_phone` varchar(30) NOT NULL COMMENT '电  话',
  `mobile` varchar(20) NOT NULL COMMENT '移动电话',
  `fax` varchar(40) NOT NULL COMMENT '传  真',
  `addr` varchar(255) NOT NULL COMMENT '地  址',
  `post_number` char(20) NOT NULL COMMENT '邮编',
  `business_area` text NOT NULL COMMENT '经营范围',
  `area` varchar(30) NOT NULL COMMENT '所在地址',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '导入时间',
  `last_update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `flag` tinyint(1) NOT NULL COMMENT '是否已导入到customers：0否，1是',
  `oldexist` tinyint(1) NOT NULL COMMENT 'customers表中是否存在该客户名称:0否，1是',
  PRIMARY KEY (`id`),
  UNIQUE KEY `company_name` (`company_name`),
  KEY `area` (`area`)
) ENGINE=MyISAM AUTO_INCREMENT=43311 DEFAULT CHARSET=utf8 COMMENT='批量导入新客户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_open`
--

DROP TABLE IF EXISTS `customer_open`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_open` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `customer_id` int(11) unsigned NOT NULL COMMENT '客户ID',
  `ent_code` varchar(50) NOT NULL DEFAULT '' COMMENT '企业代码',
  `try_times` int(11) NOT NULL DEFAULT '0' COMMENT '申请次数',
  `account` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `is_registered` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0未注册 1已注册',
  `c_from` tinyint(4) NOT NULL DEFAULT '0' COMMENT '客户来源 0oms 1代理商',
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_operate`
--

DROP TABLE IF EXISTS `customer_operate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_operate` (
  `oid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `cusid` int(11) NOT NULL COMMENT '客户ID',
  `oper_id` int(11) NOT NULL COMMENT '运营人员',
  `operate_level` tinyint(1) NOT NULL COMMENT '0未1好2中3差4死',
  `operate_time` datetime NOT NULL COMMENT '分配时间',
  `last_time` datetime NOT NULL COMMENT '最后联系时间',
  PRIMARY KEY (`oid`)
) ENGINE=MyISAM AUTO_INCREMENT=10303 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_throwlog`
--

DROP TABLE IF EXISTS `customer_throwlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_throwlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '谁扔的',
  `cusid` int(11) NOT NULL COMMENT '扔的客户',
  `throwtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '扔入时间',
  `type` smallint(1) NOT NULL DEFAULT '0' COMMENT '0：公海   1：开放池',
  `throw_reason` tinyint(2) NOT NULL COMMENT '扔掉原因:0无、1客户不存在/名称错误、2绕不到电话/联系不上、3客户强烈不需要、4已使用别家产品、5已用本公司产品',
  `sync_status` tinyint(2) NOT NULL COMMENT '同步状态0未10已经成功其余未待重试',
  PRIMARY KEY (`id`),
  KEY `cusid` (`cusid`),
  KEY `type` (`type`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=9613487 DEFAULT CHARSET=latin1 COMMENT='客户扔回公海日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_v30log`
--

DROP TABLE IF EXISTS `customer_v30log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_v30log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '谁扔的',
  `cusid` int(11) NOT NULL COMMENT '扔的客户',
  `intotime` datetime NOT NULL COMMENT '扔入时间',
  `type` smallint(1) NOT NULL DEFAULT '0' COMMENT '0增加1删除',
  `cat` tinyint(1) NOT NULL COMMENT '1录入2公海拉3检索拉4离职转5管理员转6到期流出7客户扔',
  `status` tinyint(2) NOT NULL COMMENT '同步状态0未10已经成功其余未待重试',
  PRIMARY KEY (`id`),
  KEY `cusid` (`cusid`),
  KEY `type` (`type`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=3828318 DEFAULT CHARSET=utf8 COMMENT='客户同步日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dayreport_info`
--

DROP TABLE IF EXISTS `dayreport_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dayreport_info` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `di_monthaim` int(11) unsigned NOT NULL COMMENT '本月目标',
  `di_monthreturn` int(11) unsigned NOT NULL COMMENT '本月回款',
  `di_weekforecast` int(11) unsigned NOT NULL COMMENT '本周预测',
  `di_weekreturn` int(11) unsigned NOT NULL COMMENT '本周回款',
  `di_todayforecast` int(11) unsigned NOT NULL COMMENT '今日预测',
  `di_todayreach` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '今日达成',
  `di_todaysummary` varchar(3000) NOT NULL DEFAULT '' COMMENT '今日纪要',
  `c_userid` int(11) unsigned NOT NULL COMMENT '提交人ID，同users.id',
  `c_userrealname` varchar(32) NOT NULL COMMENT '提交人名',
  `c_vwar` int(11) unsigned NOT NULL COMMENT '提交人所在战区',
  `c_vwarname` varchar(100) NOT NULL COMMENT '提交人所在区域名',
  `c_time` int(11) unsigned NOT NULL COMMENT '提交时间',
  `del` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '该条数据是否有效，0-有效；1-无效',
  PRIMARY KEY (`id`),
  KEY `c_vwar` (`c_vwar`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='手机端日报';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dayreport_vwar`
--

DROP TABLE IF EXISTS `dayreport_vwar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dayreport_vwar` (
  `da_vwar` int(11) unsigned NOT NULL COMMENT '战区ID',
  `da_userid` int(11) unsigned NOT NULL COMMENT '业务员ID',
  `da_username` varchar(32) NOT NULL COMMENT '业务员名',
  `da_reporttime` int(11) unsigned NOT NULL COMMENT '提交日报时间',
  PRIMARY KEY (`da_vwar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='手机端日报－战区最后一次提交日报信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dev4contract`
--

DROP TABLE IF EXISTS `dev4contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dev4contract` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contractid` int(11) NOT NULL,
  `deviceid` int(11) NOT NULL,
  `devcount` int(11) NOT NULL,
  `unitprice` int(11) NOT NULL,
  `type` int(1) NOT NULL COMMENT '1：服务费；0：设备费',
  `sertype` int(11) NOT NULL,
  `init_time` datetime NOT NULL,
  `operator` varchar(32) NOT NULL,
  `tertype` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `contractid` (`contractid`)
) ENGINE=MyISAM AUTO_INCREMENT=11333 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dingcus_assign_log`
--

DROP TABLE IF EXISTS `dingcus_assign_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dingcus_assign_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `areaid` int(11) NOT NULL COMMENT '区域ID',
  `warid` int(11) NOT NULL COMMENT '本次分配给这个战区了',
  `assigntime` datetime NOT NULL COMMENT '分配时间',
  `assignuid` int(11) NOT NULL COMMENT '分配人ID：0表示系统分配',
  `cusid` int(11) NOT NULL COMMENT 'customers表ID',
  PRIMARY KEY (`id`),
  KEY `areaid` (`areaid`),
  KEY `assigntime` (`assigntime`)
) ENGINE=MyISAM AUTO_INCREMENT=8135 DEFAULT CHARSET=utf8 COMMENT='红圈钉钉客户分配日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `disable_user_log`
--

DROP TABLE IF EXISTS `disable_user_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disable_user_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `timeflg` varchar(30) NOT NULL,
  `time` datetime NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '0日1周2月',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4254 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `file_list`
--

DROP TABLE IF EXISTS `file_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `content` varchar(200) NOT NULL COMMENT '详细说明',
  `file_url` varchar(255) NOT NULL COMMENT '文件地址',
  `oper_id` int(11) NOT NULL COMMENT '添加人',
  `add_time` datetime NOT NULL COMMENT '添加时间',
  `del` tinyint(1) NOT NULL COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='产品文件清单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `followrecords`
--

DROP TABLE IF EXISTS `followrecords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `followrecords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `foreid` int(11) DEFAULT NULL COMMENT '预测表ID',
  `cusid` int(11) DEFAULT NULL COMMENT '客户ID',
  `cusname` varchar(128) DEFAULT NULL COMMENT '客户名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `money` int(11) DEFAULT NULL COMMENT '预计回款金额',
  `return_time` datetime DEFAULT NULL COMMENT '预计回款时间',
  `follow_status` varchar(255) DEFAULT NULL COMMENT '跟进情况',
  `pre_cogs` varchar(50) DEFAULT NULL COMMENT '预测人',
  `ownerid` int(11) DEFAULT NULL COMMENT '业务员',
  `deptname` int(11) DEFAULT NULL COMMENT '部门',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `forecast`
--

DROP TABLE IF EXISTS `forecast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forecast` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cusid` int(11) DEFAULT NULL COMMENT '客户ID',
  `cusname` varchar(128) DEFAULT NULL COMMENT '客户名称',
  `deptname` int(11) DEFAULT NULL COMMENT '部门',
  `ownerid` int(11) DEFAULT NULL COMMENT '业务员',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `money` int(11) DEFAULT NULL COMMENT '预计回款金额',
  `return_time` datetime DEFAULT NULL COMMENT '预计回款时间',
  `follow_status` varchar(255) DEFAULT NULL COMMENT '跟进情况',
  `status` int(11) DEFAULT NULL COMMENT '预测状态：跟进，删除',
  `type` int(11) DEFAULT NULL COMMENT '预测类型：日周月',
  `forecast_uid` int(11) NOT NULL COMMENT '预测人ID',
  `pre_cogs` varchar(50) DEFAULT NULL COMMENT '预测人',
  `is_delete` tinyint(1) NOT NULL COMMENT '是否已删除：0否1是',
  `do` tinyint(1) NOT NULL COMMENT '0新签，1续签',
  PRIMARY KEY (`id`),
  KEY `cusid` (`cusid`)
) ENGINE=MyISAM AUTO_INCREMENT=22063 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `forecast_comment`
--

DROP TABLE IF EXISTS `forecast_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forecast_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `forecast_type` tinyint(1) NOT NULL COMMENT '1日，2周，3月',
  `forecast_tableid` int(11) NOT NULL COMMENT '如果forecast_type=1则为forecast_day表ID，=2则为forecast_week表ID，=3则为forecast_month表ID',
  `seq` tinyint(1) NOT NULL COMMENT '1为发起，2为跟评',
  `comment_uid` int(11) NOT NULL COMMENT '评论人ID',
  `comment_time` datetime NOT NULL COMMENT '评论时间',
  `comment` text NOT NULL COMMENT '评论内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2205 DEFAULT CHARSET=utf8 COMMENT='预测评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `forecast_day`
--

DROP TABLE IF EXISTS `forecast_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forecast_day` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `forecast_uid` int(11) NOT NULL COMMENT '预测人ID',
  `cusid` int(11) NOT NULL COMMENT '客户ID',
  `ownerid` int(11) NOT NULL COMMENT '客户当前所属业务员ID',
  `vwarid` int(11) NOT NULL COMMENT '当时的战区ID',
  `deptid` int(11) NOT NULL COMMENT '当时的部门ID',
  `forecast_time` datetime NOT NULL COMMENT '预测时间',
  `money` varchar(30) NOT NULL COMMENT '回款金额',
  `return_time` datetime NOT NULL COMMENT '预测回款日期',
  `follow_status` varchar(200) NOT NULL COMMENT '跟进情况',
  `timeflg` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ownerid` (`ownerid`),
  KEY `vwarid` (`vwarid`)
) ENGINE=MyISAM AUTO_INCREMENT=3893 DEFAULT CHARSET=utf8 COMMENT='回款预测-天';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `forecast_log`
--

DROP TABLE IF EXISTS `forecast_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forecast_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `forecast_uid` int(11) NOT NULL COMMENT '操作人ID',
  `forecast_type` tinyint(1) NOT NULL COMMENT '回款类型（1日、2周、3月）',
  `timeflg` varchar(20) NOT NULL COMMENT 'day=YYYYMMDD，week=YYYYMMDD-YYYYMMDD,month=YYYYMM',
  `forecast_time` datetime NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=39567 DEFAULT CHARSET=utf8 COMMENT='回款预测操作日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `forecast_month`
--

DROP TABLE IF EXISTS `forecast_month`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forecast_month` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `forecast_uid` int(11) NOT NULL COMMENT '预测人ID',
  `cusid` int(11) NOT NULL COMMENT '客户ID',
  `ownerid` int(11) NOT NULL COMMENT '客户当前所属业务员ID',
  `vwarid` int(11) NOT NULL COMMENT '当时的战区ID',
  `deptid` int(11) NOT NULL COMMENT '当时的部门ID',
  `forecast_time` datetime NOT NULL COMMENT '预测时间',
  `money` varchar(30) NOT NULL COMMENT '回款金额',
  `return_time` datetime NOT NULL COMMENT '预测回款日期',
  `follow_status` varchar(200) NOT NULL COMMENT '跟进情况',
  `timeflg` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ownerid` (`ownerid`),
  KEY `vwarid` (`vwarid`)
) ENGINE=MyISAM AUTO_INCREMENT=4641 DEFAULT CHARSET=utf8 COMMENT='回款预测-月';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `forecast_week`
--

DROP TABLE IF EXISTS `forecast_week`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forecast_week` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `forecast_uid` int(11) NOT NULL COMMENT '预测人ID',
  `cusid` int(11) NOT NULL COMMENT '客户ID',
  `ownerid` int(11) NOT NULL COMMENT '客户当前所属业务员ID',
  `vwarid` int(11) NOT NULL COMMENT '当时的战区ID',
  `deptid` int(11) NOT NULL COMMENT '当时的部门ID',
  `forecast_time` datetime NOT NULL COMMENT '预测时间',
  `money` varchar(30) NOT NULL COMMENT '回款金额',
  `return_time` datetime NOT NULL COMMENT '预测回款日期',
  `follow_status` varchar(200) NOT NULL COMMENT '跟进情况',
  `timeflg` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ownerid` (`ownerid`),
  KEY `vwarid` (`vwarid`)
) ENGINE=MyISAM AUTO_INCREMENT=5128 DEFAULT CHARSET=utf8 COMMENT='回款预测-周';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `helpvideo`
--

DROP TABLE IF EXISTS `helpvideo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `helpvideo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position` int(11) NOT NULL COMMENT '岗位ID',
  `videoname` varchar(200) NOT NULL COMMENT '视频名称',
  `videourl` varchar(200) NOT NULL COMMENT '视频URL',
  `clip` varchar(200) NOT NULL COMMENT '截图',
  `order` int(11) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='帮助视频';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imageresolution`
--

DROP TABLE IF EXISTS `imageresolution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imageresolution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resolution` varchar(255) DEFAULT NULL COMMENT '分辨率',
  `appname` varchar(255) DEFAULT NULL COMMENT '浏览器类型',
  `appcodename` varchar(255) DEFAULT NULL COMMENT '浏览器代码名称',
  `appversion` varchar(255) DEFAULT NULL COMMENT '浏览器版本号',
  `create_time` datetime DEFAULT NULL COMMENT '获取时间',
  `useragent` text COMMENT '浏览器基本信息',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1008767 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `indirectreport`
--

DROP TABLE IF EXISTS `indirectreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `indirectreport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cusid` int(11) DEFAULT NULL COMMENT '客户ID',
  `cusname` varchar(128) DEFAULT NULL COMMENT '客户名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `operator` varchar(50) DEFAULT NULL COMMENT '录入人',
  `content` text COMMENT '业务指导内容',
  `is_read` int(11) DEFAULT NULL COMMENT '指导内容是否已读',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3816 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `cusid` int(11) NOT NULL COMMENT '公司iD',
  `cusnamec` varchar(255) NOT NULL COMMENT '客户名称',
  `cusname` varchar(200) NOT NULL COMMENT '开票单位名称',
  `contract_id` varchar(100) NOT NULL DEFAULT '' COMMENT '合同ID',
  `contractno` varchar(50) NOT NULL COMMENT '合同编号',
  `ownerid` int(11) NOT NULL COMMENT '申请人ID',
  `owner` varchar(30) NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '类型0直销1运维',
  `invoice_no` varchar(30) NOT NULL,
  `invoiceinfo` varchar(255) NOT NULL COMMENT '开票明显',
  `invoice_total` int(11) NOT NULL COMMENT '发票总额',
  `address` varchar(255) NOT NULL COMMENT '邮寄地址',
  `consignee` varchar(60) NOT NULL COMMENT '收件人',
  `phone` varchar(20) NOT NULL COMMENT '联系电话',
  `is_pro` tinyint(1) NOT NULL COMMENT '是否专票',
  `pro_id` int(11) NOT NULL COMMENT '专票ID',
  `audit_status` tinyint(1) NOT NULL COMMENT '审核状态0未1已2驳回',
  `audit_time` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '审核时间',
  `audit_uid` int(11) NOT NULL DEFAULT '0' COMMENT '审核人',
  `audit_note` varchar(255) NOT NULL DEFAULT '' COMMENT '审核备注',
  `add_time` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '添加时间',
  `is_relevance` smallint(5) NOT NULL DEFAULT '0' COMMENT '0:未关联  1：已关联',
  `del` tinyint(1) NOT NULL DEFAULT '0',
  `send_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '邮寄时间',
  `send_sn` varchar(30) NOT NULL DEFAULT '' COMMENT '快递单号',
  `send_uid` int(11) NOT NULL DEFAULT '0' COMMENT '邮寄人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8872 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `invoice_attach`
--

DROP TABLE IF EXISTS `invoice_attach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_attach` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) unsigned NOT NULL DEFAULT '0',
  `path` varchar(300) NOT NULL DEFAULT '',
  `del` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0 正常,1 删除',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `del_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_invoice` (`invoice_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2167 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `invoice_contract_bind`
--

DROP TABLE IF EXISTS `invoice_contract_bind`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_contract_bind` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) unsigned NOT NULL DEFAULT '0',
  `contract_id` int(11) unsigned NOT NULL DEFAULT '0',
  `invoiced_money` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '开票金额',
  `rejected` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0:初始 1:驳回 2:合同退回',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `rejecct_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '驳回时间',
  PRIMARY KEY (`id`),
  KEY `idx_contract` (`contract_id`),
  KEY `idx_rejected_invoice` (`rejected`,`invoice_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3663 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `invoice_pro`
--

DROP TABLE IF EXISTS `invoice_pro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_pro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cusid` int(11) NOT NULL COMMENT '公司ID',
  `cusname` varchar(200) NOT NULL COMMENT '公司开票名称',
  `tax_sn` varchar(60) NOT NULL COMMENT '纳税人识别号',
  `connection` varchar(255) NOT NULL COMMENT '公司地址及电话',
  `bankinfo` varchar(255) NOT NULL COMMENT '开户行及账户',
  `del` tinyint(1) NOT NULL COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4918 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `invoice_pro_agent`
--

DROP TABLE IF EXISTS `invoice_pro_agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_pro_agent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cusid` int(11) NOT NULL COMMENT '公司ID',
  `cusname` varchar(200) NOT NULL COMMENT '公司开票名称',
  `tax_sn` varchar(60) NOT NULL COMMENT '纳税人识别号',
  `connection` varchar(255) NOT NULL COMMENT '公司地址及电话',
  `bankinfo` varchar(255) NOT NULL COMMENT '开户行及账户',
  `del` tinyint(1) NOT NULL COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `invoice_record`
--

DROP TABLE IF EXISTS `invoice_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_record` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '发票申请id',
  `cusid` int(11) unsigned NOT NULL DEFAULT '0',
  `contract_id` int(11) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0直销, 1运维',
  `code` varchar(30) NOT NULL DEFAULT '' COMMENT '发票号',
  `amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '开票金额',
  `invalid` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否失效 0:有效 1:失效',
  `invalid_reason` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '1:发票开错 2:发票丢失',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `created_by` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建者id',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  `updated_by` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改者id',
  PRIMARY KEY (`id`),
  KEY `idx_code` (`code`),
  KEY `idx_invalid` (`invalid`),
  KEY `idx_invoice` (`invoice_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3149 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lidan`
--

DROP TABLE IF EXISTS `lidan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lidan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `do` tinyint(4) NOT NULL COMMENT '0新签，1续签',
  `cusid` int(11) NOT NULL COMMENT '客户ID',
  `ownerid` int(11) NOT NULL COMMENT '当前业务员ID',
  `create_uid` int(11) NOT NULL COMMENT '填报人ID',
  `create_time` datetime NOT NULL COMMENT '填报时间',
  `follow_time` date NOT NULL COMMENT '下次跟进时间',
  `follow_type` tinyint(1) NOT NULL COMMENT '跟进类型：0待理单、1已签已回、2重点跟进、3能签能回、4冲击客户、5已死客户',
  `follow_remark` text NOT NULL COMMENT '跟进说明',
  `notrenew` text NOT NULL COMMENT '不续费原因',
  `mylevel` varchar(10) NOT NULL COMMENT '个人评级',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=113410 DEFAULT CHARSET=utf8 COMMENT='理单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lidan_bak`
--

DROP TABLE IF EXISTS `lidan_bak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lidan_bak` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `do` tinyint(4) NOT NULL COMMENT '0新签，1续签',
  `cusid` int(11) NOT NULL COMMENT '客户ID',
  `ownerid` int(11) NOT NULL COMMENT '当前业务员ID',
  `create_uid` int(11) NOT NULL COMMENT '填报人ID',
  `create_time` datetime NOT NULL COMMENT '填报时间',
  `follow_time` date NOT NULL COMMENT '下次跟进时间',
  `follow_type` tinyint(1) NOT NULL COMMENT '跟进类型：0待理单、1已签已回、2重点跟进、3能签能回、4冲击客户、5已死客户',
  `follow_remark` text NOT NULL COMMENT '跟进说明',
  `notrenew` text NOT NULL COMMENT '不续费原因',
  `mylevel` varchar(10) NOT NULL COMMENT '个人评级',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=113312 DEFAULT CHARSET=utf8 COMMENT='理单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lidan_follow`
--

DROP TABLE IF EXISTS `lidan_follow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lidan_follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `do` tinyint(4) NOT NULL COMMENT '0新签，1续签',
  `cusid` int(11) NOT NULL COMMENT '客户ID',
  `ownerid` int(11) NOT NULL COMMENT '当前业务员ID',
  `create_uid` int(11) NOT NULL COMMENT '填报人ID',
  `create_time` datetime NOT NULL COMMENT '填报时间',
  `follow_time` date NOT NULL COMMENT '下次跟进时间',
  `follow_type` tinyint(1) NOT NULL COMMENT '跟进类型：1已签已回、2重点跟进、3能签能回、4冲击客户、5已死客户',
  `managerlevel` varchar(10) NOT NULL COMMENT '经理评级记录',
  `mylevel` varchar(10) NOT NULL COMMENT '个人评级记录',
  `follow_remark` text NOT NULL COMMENT '跟进说明',
  `notrenew` text NOT NULL COMMENT '不续费原因',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=42640 DEFAULT CHARSET=utf8 COMMENT='理单跟进历史表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(128) DEFAULT NULL COMMENT '菜单URL',
  `status` int(11) DEFAULT NULL COMMENT '菜单状态是否有效',
  `order` int(11) DEFAULT NULL COMMENT '排序值',
  `remark` text COMMENT '菜单描述',
  `img` varchar(255) DEFAULT NULL COMMENT '图标url',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `omslogs`
--

DROP TABLE IF EXISTS `omslogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omslogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ownerid` int(11) DEFAULT NULL,
  `ip` char(15) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `realname` char(20) DEFAULT NULL,
  `remark` text,
  `ipinfo` text,
  `ipinfobak` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=101499 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `open_apply`
--

DROP TABLE IF EXISTS `open_apply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `open_apply` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL DEFAULT '0' COMMENT '客户id',
  `customer_name` varchar(50) NOT NULL DEFAULT '' COMMENT '客户名称',
  `contactor` varchar(50) NOT NULL DEFAULT '' COMMENT '联系人',
  `tel` varchar(20) NOT NULL DEFAULT '' COMMENT '联系人手机',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '联系人邮箱',
  `product` varchar(30) NOT NULL DEFAULT '' COMMENT '开户产品',
  `terminal_cnt` int(11) NOT NULL DEFAULT '1' COMMENT '终端数量',
  `try_th` tinyint(4) DEFAULT NULL COMMENT '第几次申请',
  `try_days` int(11) NOT NULL COMMENT '试用天数',
  `apply_time` int(11) NOT NULL DEFAULT '0' COMMENT '申请日期',
  `examine_time` int(11) NOT NULL DEFAULT '0' COMMENT '审批时间',
  `start_time` int(11) NOT NULL DEFAULT '0' COMMENT '开始日期',
  `end_time` int(11) NOT NULL DEFAULT '0' COMMENT '结束日期',
  `applicant` int(11) NOT NULL DEFAULT '0' COMMENT '申请人id',
  `approver` int(11) NOT NULL DEFAULT '0' COMMENT '审批人id',
  `apply_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '申请状态 0待审核 1批准 2拒绝',
  `invite_code` varchar(50) NOT NULL DEFAULT '' COMMENT '邀请码',
  `refuse_reason` varchar(100) NOT NULL DEFAULT '' COMMENT '拒绝原因',
  `notice` tinyint(4) NOT NULL DEFAULT '-1' COMMENT '到期提醒 -1未提醒 1已提醒',
  `app_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '企业类型 1红圈营销 2红圈管理',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `open_apply_contract`
--

DROP TABLE IF EXISTS `open_apply_contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `open_apply_contract` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `customer_id` int(11) unsigned NOT NULL COMMENT '客户ID',
  `customer_name` varchar(128) NOT NULL COMMENT '客户名称',
  `linkman_name` varchar(32) NOT NULL COMMENT '联系人姓名',
  `linkman_tel` varchar(32) NOT NULL COMMENT '联系人电话',
  `linkman_email` varchar(50) NOT NULL COMMENT '联系人邮箱',
  `contract_id` int(11) unsigned NOT NULL COMMENT '合同ID',
  `contract_type` tinyint(4) NOT NULL COMMENT '合同类型，0-oms4.contract;1-hecomagent. agencyContract',
  `contract_starttime` int(11) unsigned NOT NULL COMMENT '合同开始时间',
  `contract_endtime` int(11) unsigned NOT NULL COMMENT '合同结束时间',
  `contract_product` varchar(60) NOT NULL COMMENT '合同开通产品',
  `contract_productclass` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '0-红圈营销；1-红圈管理',
  `contract_terminalnum` int(11) unsigned NOT NULL COMMENT '合同开通产品终端数',
  `invite_code` varchar(50) NOT NULL DEFAULT '' COMMENT '邀请码；有代表邀请开户；无代表申请开通产品',
  `open_status` tinyint(4) NOT NULL DEFAULT '-1' COMMENT '开户开通接口返回的状态码',
  `open_msg` varchar(300) NOT NULL DEFAULT '' COMMENT '开户开通接口返回的msg',
  `c_operid` int(11) unsigned NOT NULL COMMENT '操作人ID',
  `c_opername` varchar(50) NOT NULL DEFAULT '' COMMENT '操作人姓名',
  `c_time` int(11) unsigned NOT NULL COMMENT '申请时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='合同申请开户或开通产品日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `open_send_log`
--

DROP TABLE IF EXISTS `open_send_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `open_send_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '客户ID',
  `customer_name` varchar(128) NOT NULL DEFAULT '' COMMENT '客户名称',
  `customer_type` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '客户来源，0-oms;1-agent',
  `tel` varchar(20) NOT NULL DEFAULT '' COMMENT '发送的手机号',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '发送的邮箱',
  `tel_content` varchar(2000) NOT NULL DEFAULT '' COMMENT '短信内容',
  `email_content` varchar(4000) NOT NULL DEFAULT '' COMMENT '邮件内容',
  `tel_send_result` tinyint(4) NOT NULL DEFAULT '1' COMMENT '短信发送结果 1成功 -1失败',
  `email_send_result` tinyint(4) NOT NULL DEFAULT '1' COMMENT '邮件发送结果 1成功 -1失败',
  `send_time` int(11) NOT NULL DEFAULT '0' COMMENT '发送时间',
  `sender` int(11) NOT NULL DEFAULT '0' COMMENT '操作人id',
  `open_apply_id` int(11) NOT NULL DEFAULT '0' COMMENT '申请的id',
  `send_type` tinyint(4) NOT NULL COMMENT '类型 1试用验证码 2试用无验证码 3正式验证码 4 正式无验证码 5试用到期提醒 6正式oms到期提醒 7正式agent到期提醒',
  `resend_email_cnt` int(11) NOT NULL DEFAULT '0' COMMENT '邮件重发次数',
  `resend_sms_cnt` int(11) NOT NULL DEFAULT '0' COMMENT '短信重发次数',
  PRIMARY KEY (`id`),
  KEY `send_time` (`send_time`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `performance_info`
--

DROP TABLE IF EXISTS `performance_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `performance_info` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `realname` varchar(60) NOT NULL COMMENT '用户姓名',
  `userid` int(11) NOT NULL COMMENT '用户id',
  `bestTotal` int(10) NOT NULL COMMENT '最好的业绩',
  `bestTotalMonth` char(6) NOT NULL,
  `countryRank` int(6) NOT NULL COMMENT '上次的全国排名',
  `cityRank` int(6) NOT NULL COMMENT '上次的城市排名',
  `oldCountryRank` int(6) NOT NULL COMMENT '上次的全国排名',
  `oldCityRank` int(6) NOT NULL COMMENT '上次的城市排名',
  `curTotal` int(10) NOT NULL COMMENT '当前的业绩',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1465 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `phonebook`
--

DROP TABLE IF EXISTS `phonebook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phonebook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cusid` int(11) DEFAULT NULL COMMENT '客户ID',
  `cusname` varchar(128) DEFAULT NULL COMMENT '客户名称',
  `linkman` varchar(64) DEFAULT NULL COMMENT '联系人',
  `linkman_idx` text NOT NULL COMMENT '联系人分词全文索引',
  `pinyin` varchar(255) NOT NULL COMMENT '联系人拼音',
  `py` varchar(100) NOT NULL COMMENT '拼音首字母',
  `linkman_ascii` text NOT NULL COMMENT 'linkman的ascii',
  `telephone` varchar(64) DEFAULT NULL COMMENT '电话',
  `position` varchar(64) DEFAULT NULL COMMENT '职位',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `operator` varchar(50) DEFAULT NULL COMMENT '录入人',
  `status` int(11) DEFAULT NULL COMMENT '电话是否有效 1有效  0 无效',
  `labeler` varchar(50) DEFAULT NULL COMMENT '标记人',
  `email` varchar(50) NOT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`),
  KEY `cusid` (`cusid`)
) ENGINE=MyISAM AUTO_INCREMENT=3544500 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pk`
--

DROP TABLE IF EXISTS `pk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_uid` int(11) NOT NULL COMMENT '发起人ID',
  `create_time` datetime NOT NULL COMMENT '发起时间',
  `obj` int(11) NOT NULL COMMENT 'PK对象：1个人、2战区、3部门、4自定义个人团体 50我赌你 51我赌部门 52我赌战区 53我赌全国',
  `type` tinyint(1) NOT NULL COMMENT 'PK类型：1人均单产、2总业绩',
  `timerange` tinyint(1) NOT NULL COMMENT 'PK时段：1是月份',
  `content` text NOT NULL COMMENT '彩头',
  `stop_time` date NOT NULL COMMENT '迎战截止日期',
  `status` tinyint(4) NOT NULL COMMENT 'PK状态：0等待接受PK、1正在PK、2PK结束',
  `result` varchar(255) NOT NULL DEFAULT '0/0',
  `mystake` int(11) NOT NULL DEFAULT '0' COMMENT '我赌你达不到金额',
  `left_follow` int(11) NOT NULL DEFAULT '0' COMMENT '挑战方跟注数量',
  `right_follow` int(11) NOT NULL DEFAULT '0' COMMENT '迎战方跟注数量',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=746 DEFAULT CHARSET=utf8 COMMENT='PK表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pk_follow`
--

DROP TABLE IF EXISTS `pk_follow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pk_follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pk_id` int(11) NOT NULL COMMENT 'PK表ID',
  `uid` int(11) NOT NULL COMMENT '跟注人ID',
  `time` datetime NOT NULL COMMENT '跟注时间',
  `which` tinyint(1) NOT NULL COMMENT '跟注哪边：1为挑战方，2为迎战方',
  `type` tinyint(1) NOT NULL COMMENT '跟注类型：1人民币，2其他',
  `content` varchar(255) NOT NULL COMMENT '跟注内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=150 DEFAULT CHARSET=utf8 COMMENT='PK跟注表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pk_month`
--

DROP TABLE IF EXISTS `pk_month`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pk_month` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pk_id` int(11) NOT NULL COMMENT 'PK表ID',
  `month` char(10) NOT NULL COMMENT '月份YYYY-MM',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=746 DEFAULT CHARSET=utf8 COMMENT='PK表-月份子表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pk_obj`
--

DROP TABLE IF EXISTS `pk_obj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pk_obj` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pk_id` int(11) NOT NULL COMMENT 'PK表ID',
  `type` tinyint(1) NOT NULL COMMENT '1挑战方、2接受方',
  `obj` int(11) NOT NULL COMMENT '战个人ID、战区ID、部门ID、自定义个人ID',
  `obj_uid` int(11) NOT NULL COMMENT '最终[负责]人ID',
  `obj_flg` tinyint(1) NOT NULL COMMENT '负责人是否已接受PK：0否、1是',
  `obj_flg_time` datetime NOT NULL COMMENT '负责人接受PK的时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1491 DEFAULT CHARSET=utf8 COMMENT='PK表-对象子表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) NOT NULL,
  `cusid` int(11) NOT NULL,
  `cusname` varchar(100) NOT NULL,
  `cate` tinyint(1) NOT NULL COMMENT '1产品技术2服务',
  `content` text NOT NULL,
  `referer` varchar(30) NOT NULL,
  `images` text NOT NULL COMMENT '序列化图片',
  `status` tinyint(1) NOT NULL,
  `add_time` datetime NOT NULL,
  `operator` int(11) NOT NULL,
  `undo_reason` varchar(200) NOT NULL,
  `update_time` datetime NOT NULL,
  `referer_type` tinyint(1) NOT NULL COMMENT '问题来源（1:电话记录 2:拜访记录 3:培训）',
  `referer_id` int(11) NOT NULL COMMENT '问题来源id',
  PRIMARY KEY (`id`),
  KEY `operator` (`operator`),
  KEY `cusid` (`cusid`),
  KEY `cate` (`cate`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=208 DEFAULT CHARSET=utf8 COMMENT='问题表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `question_follow`
--

DROP TABLE IF EXISTS `question_follow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `add_time` datetime NOT NULL,
  `images` text NOT NULL,
  `add_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `region` (
  `region_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `region_name` varchar(120) NOT NULL DEFAULT '',
  `pinyin` varchar(255) NOT NULL COMMENT '拼音全拼',
  `py` varchar(100) NOT NULL COMMENT '拼音首字母',
  `region_type` tinyint(1) NOT NULL DEFAULT '2',
  `agency_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`region_id`),
  KEY `parent_id` (`parent_id`),
  KEY `region_type` (`region_type`),
  KEY `agency_id` (`agency_id`)
) ENGINE=MyISAM AUTO_INCREMENT=63409 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `renew_action_history`
--

DROP TABLE IF EXISTS `renew_action_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `renew_action_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `act_uid` int(11) NOT NULL COMMENT '操作人ID',
  `act_username` varchar(30) NOT NULL COMMENT '操作人姓名',
  `ctime` int(9) NOT NULL COMMENT '日志时间',
  `cusid` int(11) NOT NULL COMMENT '客户ID',
  `say` varchar(500) DEFAULT NULL COMMENT '时间轴',
  `act_reason` varchar(255) NOT NULL COMMENT '变更原因',
  `act_type` tinyint(1) NOT NULL COMMENT '操作类型：1 培训 ，2 电话 ，3 拜访 ，4评级，5 初始化配置，6 加入理单 7:回款预测 8:理单',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1620 DEFAULT CHARSET=utf8 COMMENT='续签操作客户历史记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `renew_config`
--

DROP TABLE IF EXISTS `renew_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `renew_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cusid` int(11) NOT NULL,
  `comm_config` varchar(255) NOT NULL COMMENT '通用配置',
  `is_presale_config` tinyint(1) NOT NULL COMMENT '是否需要售前配置：0，不需要，1，需要',
  `presale_version` tinyint(1) NOT NULL COMMENT '配置版本',
  `act_uid` int(11) NOT NULL COMMENT '配置人',
  `act_username` varchar(30) NOT NULL,
  `config_username` varchar(30) NOT NULL COMMENT '配置人',
  `config_uid` int(11) NOT NULL COMMENT '配置人uid',
  `renew_uid` int(11) NOT NULL COMMENT '续签人',
  `renew_username` varchar(30) NOT NULL,
  `presale_config` text NOT NULL COMMENT '售前配置选项',
  `remark` varchar(100) NOT NULL COMMENT '配置备注',
  `ctime` int(9) NOT NULL,
  `is_init` tinyint(1) NOT NULL COMMENT '是否为初始化配置：0 不是，1 是',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1031 DEFAULT CHARSET=utf8 COMMENT='续签配置详情';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `renew_training_report`
--

DROP TABLE IF EXISTS `renew_training_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `renew_training_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cusid` int(11) NOT NULL,
  `training_object` varchar(100) NOT NULL COMMENT ' 培训对象',
  `training_uid` int(11) NOT NULL COMMENT '培训人',
  `training_username` varchar(30) NOT NULL,
  `actual_visit_time` int(9) NOT NULL COMMENT '实际上门时间',
  `finish_time` int(9) NOT NULL COMMENT '完成时间',
  `training_content` text NOT NULL COMMENT '培训内容 多选',
  `is_need_add` varchar(255) NOT NULL COMMENT '是否有增值需求',
  `is_problems` tinyint(1) NOT NULL DEFAULT '0' COMMENT ' 是否存在问题',
  `is_renew` tinyint(1) NOT NULL COMMENT '是否续签',
  `no_renew_reason` varchar(255) NOT NULL COMMENT '否续签原因',
  `remark` varchar(100) NOT NULL COMMENT '培训备注',
  `ctime` int(9) NOT NULL,
  `start_address` varchar(255) DEFAULT NULL COMMENT '开始培训地址',
  `start_lon_gcj02` varchar(90) DEFAULT NULL COMMENT '开始培训地址',
  `start_lat_gcj02` varchar(90) DEFAULT NULL COMMENT '开始培训纬度',
  `end_address` varchar(255) DEFAULT NULL COMMENT '结束地址',
  `end_lon_gcj02` varchar(90) DEFAULT NULL COMMENT '结束经度',
  `end_lat_gcj02` varchar(90) DEFAULT NULL COMMENT '结束纬度',
  PRIMARY KEY (`id`),
  KEY `cusid` (`cusid`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COMMENT='续签培训报告';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `repair`
--

DROP TABLE IF EXISTS `repair`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repair` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cusid` int(11) NOT NULL COMMENT '客户ID',
  `cusname` varchar(255) NOT NULL COMMENT '客户名称-冗余字段',
  `ownerid` int(11) NOT NULL COMMENT '申请业务员ID',
  `terminal_type` varchar(60) NOT NULL COMMENT '终端类型：车载或手持',
  `terminal_name` varchar(255) NOT NULL COMMENT '终端名称',
  `terminal_locate` varchar(60) NOT NULL COMMENT '终端所在地：图搜或客户公司',
  `terminal_num` int(11) NOT NULL COMMENT '终端数量',
  `version_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '°æ±¾ 1:3.0ÐÐÒµ°æ, 2:3.0±ê×¼°æ, 3:3.0»ù´¡°æ, 4:¶¨ÖÆ°æ, 5:´óÀñ°ü, 6:ºìÈ¦¶¤¶¤, 7:ºìÈ¦ÓªÏú4.0, 8:ºìÈ¦ÓªÏú4.3.0, 9:´óÐÍ¿Í»§',
  `train_object` varchar(200) NOT NULL COMMENT '培训对象',
  `contact` varchar(60) NOT NULL COMMENT '联系人',
  `phone` varchar(60) NOT NULL COMMENT '联系电话',
  `train_time` datetime NOT NULL COMMENT '上门维修时间',
  `train_item` varchar(200) NOT NULL COMMENT '上门事项',
  `train_addr` varchar(255) NOT NULL COMMENT '维修地址',
  `train_content` text NOT NULL COMMENT '维修内容',
  `train_type` tinyint(1) NOT NULL COMMENT '维修类型：1首次2续增3维修',
  `is_opened` tinyint(1) NOT NULL COMMENT '是否已开户1未2已0无关',
  `create_time` datetime NOT NULL COMMENT '申请时间',
  `assign_status` tinyint(1) NOT NULL COMMENT '分配状态：0待分配，1已分配',
  `assign_uid` int(11) NOT NULL COMMENT '分配操作人',
  `assign_time` datetime NOT NULL COMMENT '分配时间',
  `assign_remark` text NOT NULL COMMENT '分配备注',
  `train_uid` int(11) NOT NULL COMMENT '维修人ID',
  `accept_status` tinyint(1) NOT NULL COMMENT '接受状态：0未接受，1已接受',
  `accept_uid` int(11) NOT NULL COMMENT '接受人ID',
  `accept_time` datetime NOT NULL COMMENT '接受时间',
  `real_time` datetime NOT NULL COMMENT '实际上门时间',
  `complete_time` datetime NOT NULL COMMENT '完成时间',
  `service_desc` text NOT NULL COMMENT '服务内容描述',
  `cpl_status` tinyint(1) NOT NULL COMMENT '完成状态：0未完成，1已完成',
  `cpl_create_time` datetime NOT NULL COMMENT '完成报告提交时间',
  `cpl_create_uid` int(11) NOT NULL COMMENT '完成报告提交人',
  `comment_status` tinyint(1) NOT NULL COMMENT '评价状态：0未评价，1已评价',
  `comment_total_score` int(11) NOT NULL COMMENT '评论总分',
  `comment_train_score` int(11) NOT NULL COMMENT '维修效果得分',
  `comment_person_score` int(11) NOT NULL COMMENT '个人表现得分',
  `comment_content` text NOT NULL COMMENT '评价内容',
  `comment_uid` int(11) NOT NULL COMMENT '评价人',
  `comment_time` datetime NOT NULL COMMENT '评价时间',
  `del` tinyint(1) NOT NULL COMMENT '0未删除，1已删除',
  `del_uid` int(11) NOT NULL COMMENT '删除人',
  `deltime` datetime NOT NULL COMMENT '删除时间',
  `region` int(11) NOT NULL COMMENT '所属区域',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=87 DEFAULT CHARSET=utf8 COMMENT='培训表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_cache_stuff`
--

DROP TABLE IF EXISTS `report_cache_stuff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_cache_stuff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `realname` varchar(60) NOT NULL COMMENT '冗余字段：业务员姓名',
  `area_id` int(11) NOT NULL COMMENT '区域或战区ID',
  `area` varchar(60) NOT NULL COMMENT '冗余字段：业务员所属战区',
  `dept` varchar(90) NOT NULL COMMENT '当时所在部门',
  `deptid` int(11) NOT NULL COMMENT '当时所在部门ID',
  `month` char(6) NOT NULL COMMENT '月份YYYYMM',
  `ziliao` int(11) NOT NULL COMMENT '资料量',
  `dianhua` int(11) NOT NULL COMMENT '电话量',
  `kp` int(11) NOT NULL COMMENT '绕到负责人数量',
  `yuefang` int(11) NOT NULL COMMENT '约访量',
  `baifang` int(11) NOT NULL COMMENT '拜访数',
  `peifang` int(11) NOT NULL COMMENT '陪访数',
  `yeji` int(11) NOT NULL COMMENT '业绩',
  `lasttime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `month` (`month`),
  KEY `userid_2` (`userid`,`month`)
) ENGINE=MyISAM AUTO_INCREMENT=6512 DEFAULT CHARSET=utf8 COMMENT='业务员工作统计表-缓存数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `returnedmoney`
--

DROP TABLE IF EXISTS `returnedmoney`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `returnedmoney` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cusid` int(11) DEFAULT NULL COMMENT '客户ID',
  `cusname` varchar(128) DEFAULT NULL COMMENT '客户名称',
  `conid` int(11) DEFAULT NULL COMMENT '合同ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `operator` varchar(50) DEFAULT NULL COMMENT '录入人',
  `operator_id` int(11) DEFAULT '0' COMMENT '录入人id',
  `money` int(11) DEFAULT '0' COMMENT '回款金额',
  `newmoney` int(11) NOT NULL DEFAULT '0',
  `remoney` int(11) NOT NULL DEFAULT '0',
  `devmoney` int(11) NOT NULL DEFAULT '0',
  `type` varchar(50) DEFAULT NULL COMMENT '回款类型',
  `auditor` varchar(50) DEFAULT NULL COMMENT '审核人',
  `auditor_time` datetime DEFAULT NULL COMMENT '审核时间',
  `status` int(11) DEFAULT NULL COMMENT '回款审核状态  0:未审核   1:审核通过   2:无效回款',
  `match_status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '财务对账状态 0:未认领匹配 1:手动认领 2:驳回 3自动认领',
  `remark` text COMMENT '回款说明',
  `ownerid` int(11) DEFAULT NULL COMMENT '业务员ID',
  `remit_time` date NOT NULL COMMENT '回款日期',
  `remit_account_no` varchar(60) NOT NULL COMMENT '汇款帐号',
  `remit_imgurl` varchar(100) NOT NULL COMMENT '回款照片地址',
  `pay_time` datetime DEFAULT NULL COMMENT '回款时间',
  `return_account` varchar(255) NOT NULL COMMENT '回款帐户名称',
  `vwarid` int(11) NOT NULL DEFAULT '0',
  `deptid` int(11) NOT NULL DEFAULT '0',
  `old_vwarid` int(11) NOT NULL DEFAULT '0',
  `old_deptid` int(11) NOT NULL DEFAULT '0',
  `edit_remark` text,
  `remit_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '回款渠道0直销1运营',
  `do` tinyint(1) NOT NULL COMMENT '0新签，1续签',
  PRIMARY KEY (`id`),
  KEY `pay_time` (`pay_time`),
  KEY `vwarid` (`vwarid`)
) ENGINE=MyISAM AUTO_INCREMENT=12438 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `auth` varchar(255) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seapush_assign_log`
--

DROP TABLE IF EXISTS `seapush_assign_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seapush_assign_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `areaid` int(11) NOT NULL COMMENT '区域ID',
  `warid` int(11) NOT NULL COMMENT '本次分配给这个战区了',
  `assigntime` datetime NOT NULL COMMENT '分配时间',
  `assignuid` int(11) NOT NULL COMMENT '分配人ID：0表示系统分配',
  `cusid` int(11) NOT NULL COMMENT 'customers表ID',
  PRIMARY KEY (`id`),
  KEY `areaid` (`areaid`),
  KEY `assigntime` (`assigntime`)
) ENGINE=MyISAM AUTO_INCREMENT=39471 DEFAULT CHARSET=utf8 COMMENT='公海开放池客户分配日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seapush_users`
--

DROP TABLE IF EXISTS `seapush_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seapush_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `isarea` int(11) NOT NULL COMMENT '城市',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `turn` tinyint(3) NOT NULL COMMENT '批次',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `isarea` (`isarea`),
  KEY `turn` (`turn`)
) ENGINE=MyISAM AUTO_INCREMENT=282 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sendemaillogs`
--

DROP TABLE IF EXISTS `sendemaillogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sendemaillogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `email` varchar(255) NOT NULL COMMENT '邮件',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=216 DEFAULT CHARSET=utf8 COMMENT='PK表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL COMMENT '用户ID',
  `token` char(32) NOT NULL COMMENT '登录成功后生成，并返回给客户端',
  `lasttime` datetime NOT NULL COMMENT '最后一次活跃时间',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`,`token`)
) ENGINE=MyISAM AUTO_INCREMENT=3689 DEFAULT CHARSET=utf8 COMMENT='用户手机端访问session表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sorting`
--

DROP TABLE IF EXISTS `sorting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sorting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cusid` int(11) DEFAULT NULL COMMENT '客户ID',
  `cusname` varchar(128) DEFAULT NULL COMMENT '客户名称',
  `managerlevel` varchar(10) DEFAULT NULL COMMENT '经理理单',
  `mylevel` varchar(10) DEFAULT NULL COMMENT '业务员个人理单',
  `ownerid` int(11) DEFAULT NULL COMMENT '业务员',
  `operator` varchar(50) DEFAULT NULL COMMENT '理单人',
  `create_time` datetime DEFAULT NULL COMMENT '理单时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=719 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stat_staff_month`
--

DROP TABLE IF EXISTS `stat_staff_month`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_staff_month` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `month` varchar(20) DEFAULT NULL,
  `region` varchar(10) DEFAULT NULL,
  `department` varchar(30) DEFAULT NULL,
  `user` varchar(30) DEFAULT NULL,
  `ownerid` int(11) NOT NULL,
  `ordernum` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8689 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `submenus`
--

DROP TABLE IF EXISTS `submenus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submenus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menusid` int(11) DEFAULT NULL COMMENT '主菜单ID',
  `subname` varchar(128) DEFAULT NULL COMMENT '菜单名称',
  `suburl` varchar(128) DEFAULT NULL COMMENT '菜单URL',
  `status` int(11) DEFAULT NULL COMMENT '菜单状态是否有效',
  `order` int(11) DEFAULT NULL COMMENT '排序值',
  `remark` text COMMENT '菜单描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `synctask`
--

DROP TABLE IF EXISTS `synctask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `synctask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(10) unsigned NOT NULL COMMENT '任务id',
  `type` tinyint(3) unsigned NOT NULL COMMENT '类型',
  `flag` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否同步',
  `ctime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='同步计划表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `target`
--

DROP TABLE IF EXISTS `target`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `target` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `areaid` int(11) NOT NULL DEFAULT '0' COMMENT '区域id',
  `warid` int(11) NOT NULL DEFAULT '0' COMMENT '战区id',
  `deptid` int(11) NOT NULL DEFAULT '0' COMMENT '部门id',
  `ownerid` int(11) NOT NULL DEFAULT '0' COMMENT '业务员ID',
  `money` int(11) NOT NULL DEFAULT '0' COMMENT '目标金额',
  `month` int(11) NOT NULL COMMENT '月份',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_uid` int(11) NOT NULL COMMENT '创建人',
  `type` tinyint(4) NOT NULL COMMENT '1=区域   2=战区   3=部门     4=个人业务员',
  `del` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=490 DEFAULT CHARSET=utf8 COMMENT='员工表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `target_month_department`
--

DROP TABLE IF EXISTS `target_month_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `target_month_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `areaid` int(11) NOT NULL DEFAULT '0' COMMENT '区域id',
  `warid` int(11) NOT NULL DEFAULT '0' COMMENT '战区id',
  `deptid` int(11) NOT NULL DEFAULT '0' COMMENT '部门id',
  `ownerid` int(11) NOT NULL DEFAULT '0' COMMENT '业务员ID',
  `money` int(11) NOT NULL DEFAULT '0' COMMENT '目标金额',
  `assess` int(11) NOT NULL DEFAULT '0' COMMENT '考核值',
  `month` int(11) NOT NULL COMMENT '月份',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_uid` int(11) NOT NULL COMMENT '创建人',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0删除   1正常',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1653 DEFAULT CHARSET=utf8 COMMENT='员工表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `todo`
--

DROP TABLE IF EXISTS `todo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `todo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cusid` int(11) NOT NULL COMMENT '客户ID',
  `relate_id` int(11) NOT NULL DEFAULT '0' COMMENT 'callrecord表id',
  `cusname` varchar(60) NOT NULL COMMENT '客户名称',
  `operator` int(11) NOT NULL COMMENT '操作人',
  `type` tinyint(1) NOT NULL COMMENT '类型1拜访2电话',
  `sdate` date NOT NULL COMMENT '开始日期',
  `stime` varchar(5) NOT NULL COMMENT '开始时间',
  `info` varchar(200) NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '状态',
  `add_time` int(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=151 DEFAULT CHARSET=utf8 COMMENT='待办事项';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `train`
--

DROP TABLE IF EXISTS `train`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `train` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cusid` int(11) NOT NULL COMMENT '客户ID',
  `cusname` varchar(255) NOT NULL COMMENT '客户名称-冗余字段',
  `ownerid` int(11) NOT NULL COMMENT '申请业务员ID',
  `terminal_type` varchar(60) NOT NULL COMMENT '终端类型：车载或手持',
  `terminal_name` varchar(255) NOT NULL COMMENT '终端名称',
  `terminal_locate` varchar(60) NOT NULL COMMENT '终端所在地：图搜或客户公司',
  `terminal_num` int(11) NOT NULL COMMENT '终端数量',
  `version_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '°æ±¾ 1:3.0ÐÐÒµ°æ, 2:3.0±ê×¼°æ, 3:3.0»ù´¡°æ, 4:¶¨ÖÆ°æ, 5:´óÀñ°ü, 6:ºìÈ¦¶¤¶¤, 7:ºìÈ¦ÓªÏú4.0, 8:ºìÈ¦ÓªÏú4.3.0, 9:´óÐÍ¿Í»§',
  `train_object` varchar(200) NOT NULL COMMENT '培训对象',
  `contact` varchar(60) NOT NULL COMMENT '联系人',
  `phone` varchar(60) NOT NULL COMMENT '联系电话',
  `train_time` datetime NOT NULL COMMENT '上门培训时间',
  `train_item` varchar(200) NOT NULL COMMENT '上门事项',
  `train_addr` varchar(255) NOT NULL COMMENT '培训地址',
  `train_content` text NOT NULL COMMENT '培训内容',
  `create_time` datetime NOT NULL COMMENT '申请时间',
  `assign_status` tinyint(1) NOT NULL COMMENT '分配状态：0待分配，1已分配',
  `assign_uid` int(11) NOT NULL COMMENT '分配操作人',
  `assign_time` datetime NOT NULL COMMENT '分配时间',
  `assign_remark` text NOT NULL COMMENT '分配备注',
  `train_uid` int(11) NOT NULL COMMENT '培训人ID',
  `accept_status` tinyint(1) NOT NULL COMMENT '接受状态：0未接受，1已接受',
  `accept_uid` int(11) NOT NULL COMMENT '接受人ID',
  `accept_time` datetime NOT NULL COMMENT '接受时间',
  `real_time` datetime NOT NULL COMMENT '实际上门时间',
  `complete_time` datetime NOT NULL COMMENT '完成时间',
  `service_desc` text NOT NULL COMMENT '服务内容描述',
  `cpl_status` tinyint(1) NOT NULL COMMENT '完成状态：0未完成，1已完成',
  `cpl_create_time` datetime NOT NULL COMMENT '完成报告提交时间',
  `cpl_create_uid` int(11) NOT NULL COMMENT '完成报告提交人',
  `comment_status` tinyint(1) NOT NULL COMMENT '评价状态：0未评价，1已评价',
  `comment_total_score` int(11) NOT NULL COMMENT '评论总分',
  `comment_train_score` int(11) NOT NULL COMMENT '培训效果得分',
  `comment_person_score` int(11) NOT NULL COMMENT '个人表现得分',
  `comment_content` text NOT NULL COMMENT '评价内容',
  `comment_uid` int(11) NOT NULL COMMENT '评价人',
  `comment_time` datetime NOT NULL COMMENT '评价时间',
  `del` tinyint(1) NOT NULL COMMENT '0未删除，1已删除',
  `del_uid` int(11) NOT NULL COMMENT '删除人',
  `deltime` datetime NOT NULL COMMENT '删除时间',
  `region` int(11) NOT NULL COMMENT '区域',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5879 DEFAULT CHARSET=utf8 COMMENT='培训表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `train_assign`
--

DROP TABLE IF EXISTS `train_assign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `train_assign` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `train_id` int(11) NOT NULL COMMENT 'train表ID',
  `assign_uid` int(11) NOT NULL COMMENT '分配人',
  `assign_time` datetime NOT NULL COMMENT '分配时间',
  `assign_remark` text NOT NULL COMMENT '分配备注',
  `train_uid` int(11) NOT NULL COMMENT '培训人ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5007 DEFAULT CHARSET=utf8 COMMENT='培训表-分配历史表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `passwordbak` char(32) NOT NULL,
  `realname` varchar(16) NOT NULL,
  `sex` int(1) NOT NULL,
  `email` varchar(64) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `department` int(11) DEFAULT NULL,
  `telephone` varchar(32) DEFAULT NULL,
  `superclass` int(11) DEFAULT NULL,
  `subclass` varchar(255) DEFAULT NULL,
  `authority` varchar(256) DEFAULT NULL,
  `operator` varchar(32) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `last_time` datetime DEFAULT NULL,
  `xkey` int(11) DEFAULT NULL,
  `issend` int(1) DEFAULT NULL,
  `city` int(11) NOT NULL COMMENT '大区(这个是area意思反了，凑合用)',
  `varea` varchar(256) DEFAULT NULL,
  `vwar` text,
  `vdept` varchar(256) DEFAULT NULL,
  `isarea` int(11) DEFAULT NULL COMMENT '业务员区域',
  `isnewbie` int(11) DEFAULT '0' COMMENT '是否是新兵',
  `periods` int(11) DEFAULT '0' COMMENT '新兵周期11，2，3，4',
  `remark` text COMMENT '离职原因',
  `dimiss_time` datetime NOT NULL COMMENT '离职日期',
  `customer_limit` int(11) NOT NULL COMMENT '客户池数量',
  `staging` varchar(20) NOT NULL COMMENT '待发布版本号,用户在登录后需要跳转到该版本对应的系统',
  `ispwd` int(11) NOT NULL DEFAULT '0',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `wx_username` varchar(60) NOT NULL DEFAULT '-' COMMENT '绑定的微信企业号用户名',
  `codeid` char(20) DEFAULT NULL COMMENT '身份证',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `status` (`status`),
  KEY `position` (`position`)
) ENGINE=MyISAM AUTO_INCREMENT=6059 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `visitplan`
--

DROP TABLE IF EXISTS `visitplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visitplan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cusid` int(11) NOT NULL COMMENT '客户ID',
  `cusname` varchar(200) NOT NULL COMMENT '客户名称',
  `linkman` varchar(90) NOT NULL COMMENT '联系人',
  `telephone` varchar(30) NOT NULL COMMENT '电话',
  `position` varchar(60) NOT NULL COMMENT '职位',
  `content` text NOT NULL COMMENT '备注',
  `create_time` datetime NOT NULL COMMENT '录入时间',
  `operator` int(11) NOT NULL COMMENT '录入人',
  `plan_time` datetime NOT NULL COMMENT '约见时间',
  `plan_addr` varchar(255) NOT NULL COMMENT '约见地址',
  `sync_status` tinyint(1) NOT NULL COMMENT '同步给V30系统状态：0未同步、1同步成功、2同步失败',
  `sync_time` datetime NOT NULL COMMENT '同步时间',
  `sync_failed_reason` varchar(200) NOT NULL COMMENT '最后一次同步失败原因',
  `visit_flg` tinyint(1) NOT NULL COMMENT '0未拜访，1已拜访',
  `del` tinyint(1) NOT NULL COMMENT '删除标记：0否1是',
  `del_uid` int(11) NOT NULL COMMENT '删除操作人ID',
  `del_time` datetime NOT NULL COMMENT '删除时间',
  `del_sync_status` int(11) NOT NULL COMMENT '删除同步状态：0未同步、1已同步、2同步失败',
  `del_sync_time` datetime NOT NULL COMMENT '删除同步时间',
  `del_sync_failed_reason` varchar(200) NOT NULL COMMENT '删除标记最后一次同步失败原因',
  `is_unplaned` tinyint(1) NOT NULL COMMENT '是否临时拜访',
  `main_id` int(11) NOT NULL COMMENT '主拜访ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=291457 DEFAULT CHARSET=utf8 COMMENT='拜访计划表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `visitrecord`
--

DROP TABLE IF EXISTS `visitrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visitrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cusid` int(11) DEFAULT NULL COMMENT '客户ID',
  `cusname` varchar(128) DEFAULT NULL COMMENT '客户名称',
  `linkman` varchar(64) DEFAULT NULL COMMENT '约见人',
  `position` varchar(64) DEFAULT NULL COMMENT '职位',
  `visit_time` datetime DEFAULT NULL COMMENT '见面时间',
  `visitaddr` varchar(255) DEFAULT NULL COMMENT '见面地址',
  `content` text COMMENT '会议记录',
  `create_time` datetime DEFAULT NULL COMMENT '录入时间',
  `operator` varchar(50) DEFAULT NULL COMMENT '录入人',
  `legworknumber` int(11) DEFAULT NULL COMMENT '外勤人数',
  `carnumber` int(11) DEFAULT NULL COMMENT '车载人数',
  `mylevel` varchar(10) DEFAULT '无' COMMENT '个人评级',
  `start_lon_gcj02` varchar(90) NOT NULL COMMENT '开始经度',
  `start_lat_gcj02` varchar(90) NOT NULL COMMENT '开始纬度',
  `start_address` varchar(255) NOT NULL,
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `end_lon_gcj02` varchar(90) NOT NULL COMMENT '结束经度',
  `end_lat_gcj02` varchar(90) NOT NULL COMMENT '结束纬度',
  `end_address` varchar(255) NOT NULL,
  `subvisit` tinyint(1) NOT NULL COMMENT '是否陪访：0否、1是',
  `fvid` int(11) NOT NULL COMMENT '被陪防记录id',
  `is_renew` tinyint(1) NOT NULL COMMENT '是否属于续签',
  `is_upload_report` tinyint(1) NOT NULL COMMENT '是否上传实施报告：0否1是',
  `report_file` varchar(255) NOT NULL COMMENT '实施报告文件',
  `no_upload_reason` varchar(30) NOT NULL COMMENT '未上传报告原因',
  PRIMARY KEY (`id`),
  KEY `cusid` (`cusid`),
  KEY `subvisit` (`subvisit`),
  KEY `operator` (`operator`)
) ENGINE=MyISAM AUTO_INCREMENT=239045 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `visitresult`
--

DROP TABLE IF EXISTS `visitresult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visitresult` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL COMMENT 'visitplan表ID',
  `start_time` datetime NOT NULL COMMENT '开始拜访时间',
  `start_lon` varchar(30) NOT NULL COMMENT '开始拜访经度',
  `start_lat` varchar(30) NOT NULL COMMENT '开始拜访纬度',
  `start_addr` varchar(255) NOT NULL COMMENT '开始拜访地址',
  `start_lon_gcj02` varchar(90) NOT NULL COMMENT 'gcj02格式的经度',
  `start_lat_gcj02` varchar(90) NOT NULL COMMENT 'gcj02格式的纬度',
  `end_time` datetime NOT NULL COMMENT '结束拜访时间',
  `end_lon` varchar(30) NOT NULL COMMENT '结束拜访经度',
  `end_lat` varchar(30) NOT NULL COMMENT '结束拜访纬度',
  `end_addr` varchar(255) NOT NULL COMMENT '结束拜访地址',
  `end_lon_gcj02` varchar(90) NOT NULL COMMENT 'gcj02格式的经度',
  `end_lat_gcj02` varchar(90) NOT NULL COMMENT 'gcj02格式的纬度',
  `remark` text NOT NULL COMMENT '拜访备注',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=136959 DEFAULT CHARSET=utf8 COMMENT='拜访记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `visitresult_photo`
--

DROP TABLE IF EXISTS `visitresult_photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visitresult_photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) NOT NULL COMMENT 'visitresult表ID',
  `picurl` varchar(255) NOT NULL COMMENT '拍照URL',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=33509 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `yunying_blankcontract`
--

DROP TABLE IF EXISTS `yunying_blankcontract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yunying_blankcontract` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contract_no` varchar(30) NOT NULL COMMENT '合同编号',
  `ownerid` int(11) NOT NULL COMMENT '申请业务员ID',
  `add_time` datetime NOT NULL COMMENT '申请时间',
  `status` tinyint(1) NOT NULL COMMENT '使用状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `contract_no` (`contract_no`)
) ENGINE=MyISAM AUTO_INCREMENT=1764 DEFAULT CHARSET=utf8 COMMENT='运营空白合同';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `yunying_contract_config`
--

DROP TABLE IF EXISTS `yunying_contract_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yunying_contract_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_code` varchar(10) NOT NULL COMMENT '合同编号前缀',
  `year` varchar(10) NOT NULL COMMENT '年份',
  `flg` int(11) NOT NULL COMMENT '当前最大流水号',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 COMMENT='运营合同-合同编号前缀';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-14 11:16:07
