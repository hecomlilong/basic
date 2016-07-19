-- phpMyAdmin SQL Dump
-- version 4.0.10.12
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2016-07-14 11:06:46
-- 服务器版本: 5.7.12-log
-- PHP 版本: 5.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `oms4`
--

-- --------------------------------------------------------

--
-- 表的结构 `access_token`
--

CREATE TABLE IF NOT EXISTS `access_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(90) NOT NULL,
  `time` datetime NOT NULL COMMENT '刷新时间点',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='访问会话控制' AUTO_INCREMENT=2005 ;

-- --------------------------------------------------------

--
-- 表的结构 `account`
--

CREATE TABLE IF NOT EXISTS `account` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='开户信息表' AUTO_INCREMENT=8700 ;

-- --------------------------------------------------------

--
-- 表的结构 `advice_comment`
--

CREATE TABLE IF NOT EXISTS `advice_comment` (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` int(11) NOT NULL COMMENT '评论者',
  `click` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1赞2踩0评论',
  `comment` varchar(255) NOT NULL COMMENT '评论内容',
  `add_time` datetime NOT NULL COMMENT '时间',
  `advice_id` int(11) NOT NULL COMMENT '建议ID',
  `adder` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='建议评论表' AUTO_INCREMENT=643 ;

-- --------------------------------------------------------

--
-- 表的结构 `advice_team`
--

CREATE TABLE IF NOT EXISTS `advice_team` (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `address` text NOT NULL,
  `content` text NOT NULL,
  `add_time` datetime NOT NULL,
  `adder` varchar(30) NOT NULL,
  `add_user` int(11) NOT NULL,
  `del` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='团队建设建议表' AUTO_INCREMENT=45 ;

-- --------------------------------------------------------

--
-- 表的结构 `blankcontract`
--

CREATE TABLE IF NOT EXISTS `blankcontract` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='空白合同' AUTO_INCREMENT=15940 ;

-- --------------------------------------------------------

--
-- 表的结构 `blankcontract_config`
--

CREATE TABLE IF NOT EXISTS `blankcontract_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_code` varchar(10) NOT NULL COMMENT '合同编号前缀',
  `year` varchar(10) NOT NULL COMMENT '年份',
  `flg` int(11) NOT NULL COMMENT '当前最大流水号',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='空白合同-合同编号前缀' AUTO_INCREMENT=83 ;

-- --------------------------------------------------------

--
-- 表的结构 `cache_active_day`
--

CREATE TABLE IF NOT EXISTS `cache_active_day` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day` int(8) NOT NULL,
  `cusid` int(11) DEFAULT NULL,
  `operateid` int(11) NOT NULL,
  `cusname` varchar(255) DEFAULT NULL,
  `dhflg` tinyint(1) DEFAULT '0',
  `bfflg` tinyint(1) DEFAULT '0',
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=29630 ;

-- --------------------------------------------------------

--
-- 表的结构 `cache_dashboard`
--

CREATE TABLE IF NOT EXISTS `cache_dashboard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position` int(11) NOT NULL COMMENT '直销用户对应的position',
  `datatype` varchar(90) NOT NULL COMMENT '报表类型',
  `regionid` int(11) NOT NULL COMMENT '机构ID：position=57时为0，position为58时存uid,position=60/59时为configlistID、position=61时为用户ID',
  `res` text NOT NULL COMMENT '缓存的图表JSON值',
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='驾驶舱缓存数据' AUTO_INCREMENT=37912 ;

-- --------------------------------------------------------

--
-- 表的结构 `cache_day`
--

CREATE TABLE IF NOT EXISTS `cache_day` (
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
  `yeji` decimal(10,2) NOT NULL COMMENT '业绩',
  `sihai` int(11) NOT NULL DEFAULT '0' COMMENT '私海数量',
  `cusin` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '拉入客户数',
  `cusout` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '抛出客户数',
  `peixun` int(11) NOT NULL DEFAULT '0' COMMENT '培训',
  `lasttime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `isRenew` tinyint(1) NOT NULL COMMENT '是否是续签',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `day` (`day`),
  KEY `userid_2` (`userid`,`day`),
  KEY `isRenew` (`isRenew`),
  KEY `yeji` (`yeji`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='业务员工作统计表-缓存数据-每天' AUTO_INCREMENT=644483 ;

-- --------------------------------------------------------

--
-- 表的结构 `cache_day_leader`
--

CREATE TABLE IF NOT EXISTS `cache_day_leader` (
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
  `yeji` decimal(10,2) NOT NULL COMMENT '业绩',
  `sihai` int(11) NOT NULL DEFAULT '0' COMMENT '私海数量',
  `lasttime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `day` (`day`),
  KEY `userid_2` (`userid`,`day`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='leader工作统计表-缓存数据-每天' AUTO_INCREMENT=3332 ;

-- --------------------------------------------------------

--
-- 表的结构 `cache_forecast_day`
--

CREATE TABLE IF NOT EXISTS `cache_forecast_day` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='预测与回款缓存表-day' AUTO_INCREMENT=120377 ;

-- --------------------------------------------------------

--
-- 表的结构 `cache_forecast_month`
--

CREATE TABLE IF NOT EXISTS `cache_forecast_month` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='预测与回款缓存表-month' AUTO_INCREMENT=6981 ;

-- --------------------------------------------------------

--
-- 表的结构 `cache_forecast_week`
--

CREATE TABLE IF NOT EXISTS `cache_forecast_week` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='预测与回款缓存表-week' AUTO_INCREMENT=18152 ;

-- --------------------------------------------------------

--
-- 表的结构 `cache_month`
--

CREATE TABLE IF NOT EXISTS `cache_month` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `area_id` int(11) NOT NULL COMMENT '区域或战区ID',
  `month` int(11) NOT NULL COMMENT 'YYYYMM',
  `ziliao` int(11) NOT NULL COMMENT '资料量',
  `dianhua` int(11) NOT NULL COMMENT '电话量',
  `yuefang` int(11) NOT NULL COMMENT '约访量',
  `baifang` int(11) NOT NULL COMMENT '拜访数',
  `yeji` decimal(10,2) NOT NULL COMMENT '业绩',
  `lidan1` int(11) NOT NULL,
  `lidancount1` int(11) NOT NULL,
  `lidan0` int(11) NOT NULL,
  `lidancount0` int(11) NOT NULL,
  `lidan2` int(11) NOT NULL,
  `lidancount2` int(11) NOT NULL,
  `lidan3` int(11) NOT NULL,
  `lidancount3` int(11) NOT NULL,
  `lidan4` int(11) NOT NULL,
  `lidancount4` int(11) NOT NULL,
  `lidan5` int(11) NOT NULL,
  `lidancount5` int(11) NOT NULL,
  `lidan6` int(11) NOT NULL,
  `lidancount6` int(11) NOT NULL,
  `lasttime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `month` (`month`),
  KEY `userid_2` (`userid`,`month`),
  KEY `yeji` (`yeji`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='业务员工作统计表-缓存数据-月度' AUTO_INCREMENT=5652 ;

-- --------------------------------------------------------

--
-- 表的结构 `cache_month_yeji`
--

CREATE TABLE IF NOT EXISTS `cache_month_yeji` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `realname` varchar(255) NOT NULL,
  `month` char(6) NOT NULL COMMENT '月份',
  `total` int(11) NOT NULL COMMENT '业绩',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `cache_org`
--

CREATE TABLE IF NOT EXISTS `cache_org` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `month` char(6) NOT NULL COMMENT '月份',
  `org` int(11) NOT NULL COMMENT '组织机构ID',
  `yeji` decimal(10,2) NOT NULL COMMENT '业绩',
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='每一个组织架构每月的业绩' AUTO_INCREMENT=661 ;

-- --------------------------------------------------------

--
-- 表的结构 `cache_report`
--

CREATE TABLE IF NOT EXISTS `cache_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_type` tinyint(3) NOT NULL COMMENT '报表类型：1月销售目标达成，2销售漏斗图，3本月销售业绩对比，4销售状态阶梯图，5本月人均拜访量分布，6本月人均拜访量对比，7本月人均资料量分布图，8本月人均资料量对比，9今日预测与回款对比，10月预测目标达成',
  `region_type` int(11) NOT NULL COMMENT '组织架构级别：1全国，2大区，3城市，4战区经理',
  `region_id` int(11) NOT NULL COMMENT '对应的configlist表的ID',
  `json` text NOT NULL COMMENT '展示数据需要的json',
  `last_update_time` datetime NOT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='首页报表缓存记录表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `cache_seapush_assign_log`
--

CREATE TABLE IF NOT EXISTS `cache_seapush_assign_log` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `calllog`
--

CREATE TABLE IF NOT EXISTS `calllog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cusid` int(11) NOT NULL DEFAULT '0' COMMENT '客户ID',
  `contactorid` int(11) NOT NULL DEFAULT '0' COMMENT '联系人ID',
  `userid` int(11) NOT NULL,
  `realname` varchar(25) DEFAULT NULL COMMENT '姓名',
  `calling` varchar(25) NOT NULL COMMENT '主叫方',
  `called` varchar(255) DEFAULT NULL COMMENT '被叫方；多个被叫用逗号分隔',
  `day` int(11) NOT NULL COMMENT 'YYYYMMDD',
  `month` int(11) NOT NULL COMMENT '月',
  `sessionid` varchar(64) DEFAULT NULL,
  `ctime` datetime NOT NULL,
  `type` varchar(5) NOT NULL DEFAULT 'false' COMMENT '//false:用友   true:容联',
  `duration` int(11) NOT NULL DEFAULT '0' COMMENT '通话时长秒',
  `recordurl` varchar(255) DEFAULT NULL COMMENT '录音URL',
  `res` text,
  `usertype` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:客户   1：下属',
  `iscancel` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否取消，0：否，1：是',
  `cancelres` text COMMENT '取消返回值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='用友电话记录' AUTO_INCREMENT=473 ;

-- --------------------------------------------------------

--
-- 表的结构 `callrecord`
--

CREATE TABLE IF NOT EXISTS `callrecord` (
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
  `isrecord` tinyint(1) NOT NULL COMMENT '0没有录音；1有录音',
  `recordurl` varchar(255) NOT NULL COMMENT '客户录音地址',
  `record_id` int(11) NOT NULL COMMENT '对callrecording表ID',
  PRIMARY KEY (`id`),
  KEY `cusid` (`cusid`),
  KEY `index_name` (`linkstatus`),
  KEY `operator` (`operator`),
  KEY `idx_create_time` (`create_time`),
  KEY `record_id` (`record_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10263800 ;

-- --------------------------------------------------------

--
-- 表的结构 `callrecording`
--

CREATE TABLE IF NOT EXISTS `callrecording` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cusid` int(11) DEFAULT NULL COMMENT '客户ID',
  `uid` int(11) DEFAULT NULL COMMENT 'UID',
  `contactorid` int(11) DEFAULT NULL COMMENT '联系人id  ',
  `callsid` varchar(64) DEFAULT NULL COMMENT '返回的callsid',
  `calling` varchar(255) DEFAULT NULL COMMENT '主叫方电话',
  `called` varchar(255) DEFAULT NULL COMMENT '被叫方；多个被叫用逗号分隔',
  `duration` int(11) DEFAULT '0' COMMENT '电话时长',
  `recordurl` varchar(255) DEFAULT NULL COMMENT '录音URl',
  `oss_recordurl` varchar(255) DEFAULT NULL COMMENT '存储在oss上的录音地址',
  `oss_times` int(11) DEFAULT '0' COMMENT '想oss转存的次数，大于3次时不再进行转存操作',
  `usertype` tinyint(1) DEFAULT '0' COMMENT '0：客户   1：下属',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `call_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '呼叫状态    0：通话结束， 1：通话中',
  `status_time` datetime DEFAULT NULL COMMENT '状态对应时间',
  PRIMARY KEY (`id`),
  KEY `cusid` (`cusid`),
  KEY `create_time` (`create_time`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=254 ;

-- --------------------------------------------------------

--
-- 表的结构 `callrecord_latest`
--

CREATE TABLE IF NOT EXISTS `callrecord_latest` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='电话记录表' AUTO_INCREMENT=68026 ;

-- --------------------------------------------------------

--
-- 表的结构 `conference_meeting`
--

CREATE TABLE IF NOT EXISTS `conference_meeting` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `meeting_name` varchar(100) NOT NULL DEFAULT '' COMMENT '会议名称',
  `start_time` date DEFAULT NULL COMMENT '会议开始时间',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `is_open` tinyint(1) NOT NULL DEFAULT '0' COMMENT '会议是否已开始：2,确认完成；1，已开始；0，未开始',
  `invited_num` int(11) NOT NULL DEFAULT '0' COMMENT '邀请客户数',
  `attend_num` int(11) NOT NULL DEFAULT '0' COMMENT '已参加客户数',
  `absent_num` int(11) NOT NULL DEFAULT '0' COMMENT '未参加客户数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='PC端电话录入增加选项“邀请会议"需求' AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- 表的结构 `configlist`
--

CREATE TABLE IF NOT EXISTS `configlist` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=70262 ;

-- --------------------------------------------------------

--
-- 表的结构 `configlist_user_cache`
--

CREATE TABLE IF NOT EXISTS `configlist_user_cache` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `userid` int(11) NOT NULL COMMENT '用户id',
  `structure` varchar(255) DEFAULT NULL COMMENT '用户组织架构',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='专门用于快速取得业务员组织架构字符串的表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `contracts`
--

CREATE TABLE IF NOT EXISTS `contracts` (
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
  `devmoney` decimal(10,2) DEFAULT NULL COMMENT '设备总额',
  `sermoney` decimal(10,2) DEFAULT NULL COMMENT '服务总额',
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
  `htmoney` decimal(10,2) DEFAULT NULL COMMENT '合同总额',
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
  `returnmoney` decimal(10,2) NOT NULL COMMENT '回款总额',
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22308 ;

-- --------------------------------------------------------

--
-- 表的结构 `contracts_config`
--

CREATE TABLE IF NOT EXISTS `contracts_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) NOT NULL,
  `name` varchar(90) NOT NULL,
  `orgid` int(11) NOT NULL COMMENT '原始ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='合同服务-设备基础数据表' AUTO_INCREMENT=70 ;

-- --------------------------------------------------------

--
-- 表的结构 `contracts_config_new`
--

CREATE TABLE IF NOT EXISTS `contracts_config_new` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) NOT NULL,
  `name` varchar(90) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='合同服务-设备基础数据表' AUTO_INCREMENT=12 ;

-- --------------------------------------------------------

--
-- 表的结构 `contracts_customer_trade`
--

CREATE TABLE IF NOT EXISTS `contracts_customer_trade` (
  `cusid` int(6) DEFAULT NULL,
  `cusname` varchar(255) DEFAULT NULL,
  `trade` varchar(60) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ordernum` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3046 ;

-- --------------------------------------------------------

--
-- 表的结构 `contracts_detail`
--

CREATE TABLE IF NOT EXISTS `contracts_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contracts_id` int(11) NOT NULL,
  `type` varchar(30) NOT NULL COMMENT '费用类型：service服务费用、device设备费用',
  `name` varchar(60) NOT NULL COMMENT '服务/设备名称',
  `number` int(11) NOT NULL COMMENT '服务/设备数量',
  `price` varchar(30) NOT NULL COMMENT '服务/设备单价',
  `amount` varchar(30) NOT NULL COMMENT '服务/设备总额',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='合同费用类型表' AUTO_INCREMENT=29336 ;

-- --------------------------------------------------------

--
-- 表的结构 `contract_image`
--

CREATE TABLE IF NOT EXISTS `contract_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `contract_id` int(11) NOT NULL COMMENT '合同ID',
  `image_url` varchar(100) NOT NULL COMMENT '合同图片地址',
  PRIMARY KEY (`id`),
  KEY `contract_id` (`contract_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=53142 ;

-- --------------------------------------------------------

--
-- 表的结构 `contract_income_month`
--

CREATE TABLE IF NOT EXISTS `contract_income_month` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='合同应收账款-按月拆分表' AUTO_INCREMENT=294361 ;

-- --------------------------------------------------------

--
-- 表的结构 `contract_money`
--

CREATE TABLE IF NOT EXISTS `contract_money` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contract_id` int(11) NOT NULL COMMENT '合同ID',
  `returndate` datetime NOT NULL COMMENT '回款日期',
  `money` decimal(10,2) NOT NULL COMMENT '金额',
  `create_uid` int(11) NOT NULL COMMENT '录入人ID',
  `create_time` datetime NOT NULL COMMENT '录入时间',
  `del` tinyint(1) NOT NULL COMMENT '是否已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='合同回款记录' AUTO_INCREMENT=16813 ;

-- --------------------------------------------------------

--
-- 表的结构 `contract_money_detail`
--

CREATE TABLE IF NOT EXISTS `contract_money_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `cm_id` int(11) NOT NULL COMMENT '对应的contract_money的ID',
  `cusid` int(11) NOT NULL COMMENT '企业ID',
  `cusname` varchar(100) NOT NULL COMMENT '公司名称',
  `contract_id` int(11) NOT NULL COMMENT '合同ID',
  `ownerid` int(11) NOT NULL COMMENT '业务员ID',
  `returned_date` date NOT NULL COMMENT '回款日期',
  `money` decimal(10,2) NOT NULL COMMENT '回款总金额',
  `newmoney` decimal(10,2) NOT NULL COMMENT '新增回款额',
  `remoney` decimal(10,2) NOT NULL COMMENT '续费汇款额',
  `devmoney` decimal(10,2) NOT NULL COMMENT '设备金额',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='回款详细分拆表' AUTO_INCREMENT=3577 ;

-- --------------------------------------------------------

--
-- 表的结构 `cursor_msgid`
--

CREATE TABLE IF NOT EXISTS `cursor_msgid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(90) NOT NULL COMMENT '用户',
  `msgid` varchar(60) NOT NULL COMMENT '消息ID',
  `createtime` int(11) NOT NULL COMMENT '时间',
  `time` datetime NOT NULL COMMENT '接收时间',
  PRIMARY KEY (`id`),
  KEY `user` (`user`,`msgid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='微信发送给我方的消息ID记录表' AUTO_INCREMENT=25 ;

-- --------------------------------------------------------

--
-- 表的结构 `cusinorout`
--

CREATE TABLE IF NOT EXISTS `cusinorout` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='业务员拉入客户每天统计表' AUTO_INCREMENT=1606 ;

-- --------------------------------------------------------

--
-- 表的结构 `customers`
--

CREATE TABLE IF NOT EXISTS `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cusname` varchar(128) DEFAULT NULL COMMENT '客户名称',
  `cusname_idx` varchar(255) DEFAULT NULL,
  `pinyin` varchar(255) NOT NULL COMMENT '拼音全拼',
  `py` varchar(100) NOT NULL COMMENT '拼音首字母',
  `linkman` varchar(64) DEFAULT NULL COMMENT '联系人',
  `corp` varchar(64) DEFAULT NULL COMMENT '法人',
  `telephone` varchar(64) DEFAULT NULL COMMENT '电话',
  `position` varchar(50) DEFAULT NULL COMMENT '职位',
  `capital` varchar(64) DEFAULT NULL COMMENT '注册资金',
  `trade` int(2) DEFAULT '0' COMMENT '行业',
  `terminals` smallint(4) NOT NULL,
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '客户最后一次操作时间',
  `safedays` int(2) DEFAULT NULL COMMENT '保护期',
  `operator` int(11) DEFAULT NULL COMMENT '录入人',
  `province` smallint(5) NOT NULL COMMENT '省市',
  `isarea` int(11) DEFAULT NULL COMMENT '办公区域',
  `status` int(11) DEFAULT NULL COMMENT '0=新录入  1=未绕到负责人  2=绕到负责人 3=约到负责人  4=拜访客户   5=理单客户  6=预测客户  7=申请合同  8=签单客户   9=完成客户',
  `linkcase` int(11) DEFAULT NULL COMMENT 'configlist',
  `type` int(11) DEFAULT NULL COMMENT '客户类型：公海=1 私海=2 开放池=3  待定池=4',
  `ownerid` int(11) DEFAULT NULL COMMENT '业务员',
  `mylevel` varchar(10) DEFAULT '无' COMMENT '个人理单评级',
  `managerlevel` varchar(10) DEFAULT '无' COMMENT '经理理单评级',
  `callrecord` text COMMENT '最后一次电话记录',
  `visitrecord` text COMMENT '最后一次拜访记录',
  `indirectreport` text COMMENT '最后一次业务指导记录',
  `remark` text COMMENT '备注',
  `into_time` datetime DEFAULT NULL COMMENT '客户流入日期',
  `callcount` int(11) DEFAULT '0' COMMENT '客户电话记录数',
  `visitcount` int(11) DEFAULT '0' COMMENT '客户拜访记录数',
  `traincount` int(11) NOT NULL COMMENT '客户培训记录数',
  `comnitcount` int(11) NOT NULL DEFAULT '0' COMMENT '业务沟通数量',
  `custype` int(11) DEFAULT '1' COMMENT '1=新客户  2=老客户',
  `newdata` tinyint(1) NOT NULL COMMENT '是否为新导入数据：0否，1是',
  `sea_push` tinyint(1) NOT NULL COMMENT '是否为公海推送：0否、1是',
  `throw_reason` tinyint(2) NOT NULL COMMENT '扔掉原因:0无、1客户不存在/名称错误、2绕不到电话/联系不上、3客户强烈不需要、4已使用别家产品、5已用本公司产品',
  `operate_id` int(11) NOT NULL,
  `level_op` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '¿Í»§µÈ¼¶ 0 ³õÊ¼, 1 A, 2 B, 3 C, 4 D, 5 E ',
  `status_op` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'ÔËÎ¬¸ú½ø×´Ì¬  1 ÒÑÇ©ÒÑ»Ø, 2 ÒÑÇ©ÔÚÍ¾, 3 ÖØµã¸ú½ø, 4 ÄÜÇ©ÄÜ»Ø, 5 Òµ¼¨³å»÷, 6 ÒÑËÀ¿Í»§',
  `isparticiple` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否分词  1是   0否',
  `renew` tinyint(1) NOT NULL COMMENT '0是非续签客户，1是续签客户',
  `areaid` int(11) NOT NULL COMMENT '成单确认回款时客户所在区域',
  `renew_uid` int(11) NOT NULL COMMENT '谁分配的续签',
  `renew_time` datetime NOT NULL COMMENT '最近一次分配续签时间',
  `renew_ownerid` int(11) NOT NULL COMMENT '最近一次分配的续签业务员',
  `renew_mylevel` varchar(30) NOT NULL COMMENT '续签个人评级',
  `renew_managerlevel` varchar(10) NOT NULL COMMENT '续签经理评级',
  `renew_is_config` tinyint(1) NOT NULL COMMENT '是否有续签配置',
  `last_action_time` int(11) NOT NULL COMMENT '最后联系时间',
  `next_time` datetime NOT NULL COMMENT '下次联系时间',
  `contractEnd` date NOT NULL COMMENT '最近的合同结束日期',
  `end_day` int(8) NOT NULL COMMENT '合同过期天数',
  `linkstatus` varchar(50) NOT NULL COMMENT '最新的联系情况',
  `contractAuditTime` datetime NOT NULL COMMENT '客户第一个合同审核通过的时间',
  `follow_type` tinyint(1) DEFAULT '-1' COMMENT '最新的跟进状态,-1表示未加入理单，0待理单、1已签已回、2重点跟进、3能签能回、4冲击客户、5已死客户',
  `source` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '客户来源，默认为0，1为内部运营商机客户，6为内部市场商机客户，2为外部商机客户, 3为会销, 4为已邀请未参会，5为邀请中未确认参会',
  `pullTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `newdata` (`newdata`),
  KEY `cusname` (`cusname`),
  KEY `type` (`type`,`ownerid`),
  KEY `operator` (`operator`),
  KEY `into_time` (`into_time`),
  KEY `isarea` (`isarea`),
  KEY `linkcase` (`linkcase`),
  KEY `status` (`status`),
  KEY `operate_id` (`operate_id`),
  KEY `isparticiple` (`isparticiple`),
  KEY `idx_level_op` (`level_op`),
  KEY `idx_status_op` (`status_op`),
  KEY `renew` (`renew`),
  KEY `create_time` (`create_time`),
  KEY `next_time` (`next_time`),
  KEY `idx_ownerid` (`ownerid`),
  KEY `idx_type_renew_ownerid` (`type`,`renew_ownerid`),
  KEY `renew_ownerid` (`renew_ownerid`),
  KEY `source_idx` (`source`),
  FULLTEXT KEY `pinyin` (`pinyin`),
  FULLTEXT KEY `cusname_idx` (`cusname_idx`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2243184 ;

-- --------------------------------------------------------

--
-- 表的结构 `customers_on_top`
--

CREATE TABLE IF NOT EXISTS `customers_on_top` (
  `cus_id` int(11) unsigned NOT NULL COMMENT '客户id',
  `ownerid` int(11) NOT NULL DEFAULT '0' COMMENT '客户所属业务员',
  `c_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `customer_comment`
--

CREATE TABLE IF NOT EXISTS `customer_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cusid` int(11) NOT NULL COMMENT '客户ID',
  `comment_uid` int(11) NOT NULL COMMENT '评论人',
  `comment_user` varchar(60) NOT NULL COMMENT '评论人姓名',
  `comment_header` text NOT NULL COMMENT '评论前文',
  `comment` text NOT NULL COMMENT '内容',
  `time` datetime NOT NULL COMMENT '时间',
  PRIMARY KEY (`id`),
  KEY `cusid` (`cusid`),
  KEY `comment_uid` (`comment_uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='客户评论表' AUTO_INCREMENT=70 ;

-- --------------------------------------------------------

--
-- 表的结构 `customer_invitation`
--

CREATE TABLE IF NOT EXISTS `customer_invitation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `meeting_id` int(11) DEFAULT '0' COMMENT '会议id',
  `cusid` int(11) NOT NULL COMMENT '客户id',
  `cusname` varchar(128) NOT NULL DEFAULT '' COMMENT '客户名称',
  `invitation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '邀请时间',
  `inviter_id` int(11) NOT NULL DEFAULT '0' COMMENT '邀请业务员id',
  `inviter_name` varchar(16) NOT NULL DEFAULT '' COMMENT '邀请业务员姓名',
  `vwar` mediumint(5) NOT NULL COMMENT '邀请战区id',
  `vwar_name` varchar(50) NOT NULL DEFAULT '' COMMENT '邀请战区名称',
  `varea` mediumint(5) NOT NULL COMMENT '邀请城市id',
  `varea_name` varchar(50) NOT NULL DEFAULT '' COMMENT '邀请城市名称',
  `is_attend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否参加:0,未选择;1,参加;2,未参加',
  PRIMARY KEY (`id`),
  KEY `invitation_time` (`invitation_time`),
  KEY `meeting_id` (`meeting_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='客户参加会议表' AUTO_INCREMENT=20 ;

-- --------------------------------------------------------

--
-- 表的结构 `customer_new`
--

CREATE TABLE IF NOT EXISTS `customer_new` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='批量导入新客户表' AUTO_INCREMENT=43311 ;

-- --------------------------------------------------------

--
-- 表的结构 `customer_open`
--

CREATE TABLE IF NOT EXISTS `customer_open` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `customer_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '客户ID',
  `ent_code` varchar(50) NOT NULL DEFAULT '' COMMENT '企业代码',
  `account` varchar(50) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(50) NOT NULL DEFAULT '' COMMENT '密码',
  `is_registered` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0未注册 1已注册',
  `c_from` tinyint(4) NOT NULL DEFAULT '0' COMMENT '客户来源 0oms 1代理商',
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=63 ;

-- --------------------------------------------------------

--
-- 表的结构 `customer_operate`
--

CREATE TABLE IF NOT EXISTS `customer_operate` (
  `oid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `cusid` int(11) NOT NULL COMMENT '客户ID',
  `oper_id` int(11) NOT NULL COMMENT '运营人员',
  `operate_level` tinyint(1) NOT NULL COMMENT '0未1好2中3差4死',
  `operate_time` datetime NOT NULL COMMENT '分配时间',
  `last_time` datetime NOT NULL COMMENT '最后联系时间',
  PRIMARY KEY (`oid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10355 ;

-- --------------------------------------------------------

--
-- 表的结构 `customer_throwlog`
--

CREATE TABLE IF NOT EXISTS `customer_throwlog` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COMMENT='客户扔回公海日志表' AUTO_INCREMENT=9646090 ;

-- --------------------------------------------------------

--
-- 表的结构 `customer_v30log`
--

CREATE TABLE IF NOT EXISTS `customer_v30log` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='客户同步日志表' AUTO_INCREMENT=3860539 ;

-- --------------------------------------------------------

--
-- 表的结构 `dayreport_info`
--

CREATE TABLE IF NOT EXISTS `dayreport_info` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='手机端日报' AUTO_INCREMENT=66 ;

-- --------------------------------------------------------

--
-- 表的结构 `dayreport_vwar`
--

CREATE TABLE IF NOT EXISTS `dayreport_vwar` (
  `da_vwar` int(11) unsigned NOT NULL COMMENT '战区ID',
  `da_userid` int(11) unsigned NOT NULL COMMENT '业务员ID',
  `da_username` varchar(32) NOT NULL COMMENT '业务员名',
  `da_reporttime` int(11) unsigned NOT NULL COMMENT '提交日报时间',
  PRIMARY KEY (`da_vwar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='手机端日报－战区最后一次提交日报信息';

-- --------------------------------------------------------

--
-- 表的结构 `dev4contract`
--

CREATE TABLE IF NOT EXISTS `dev4contract` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11333 ;

-- --------------------------------------------------------

--
-- 表的结构 `dingcus_assign_log`
--

CREATE TABLE IF NOT EXISTS `dingcus_assign_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `areaid` int(11) NOT NULL COMMENT '区域ID',
  `warid` int(11) NOT NULL COMMENT '本次分配给这个战区了',
  `assigntime` datetime NOT NULL COMMENT '分配时间',
  `assignuid` int(11) NOT NULL COMMENT '分配人ID：0表示系统分配',
  `cusid` int(11) NOT NULL COMMENT 'customers表ID',
  PRIMARY KEY (`id`),
  KEY `areaid` (`areaid`),
  KEY `assigntime` (`assigntime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='红圈钉钉客户分配日志表' AUTO_INCREMENT=8135 ;

-- --------------------------------------------------------

--
-- 表的结构 `disable_user_log`
--

CREATE TABLE IF NOT EXISTS `disable_user_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `timeflg` varchar(30) NOT NULL,
  `time` datetime NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '0日1周2月',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4254 ;

-- --------------------------------------------------------

--
-- 表的结构 `elastic_test`
--

CREATE TABLE IF NOT EXISTS `elastic_test` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `took_time` int(11) unsigned NOT NULL COMMENT '使用时间，毫秒',
  `keyword` varchar(2000) NOT NULL COMMENT '关键词',
  `ctime` datetime NOT NULL COMMENT '执行时间',
  `content` varchar(5000) NOT NULL COMMENT '内容',
  `type` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '0-查询结果集；1-总执行时间；2-单次插入时间；3-max_cusid',
  PRIMARY KEY (`id`),
  KEY `ctime` (`ctime`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='elasticsearch测试表' AUTO_INCREMENT=19193 ;

-- --------------------------------------------------------

--
-- 表的结构 `file_list`
--

CREATE TABLE IF NOT EXISTS `file_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `content` varchar(200) NOT NULL COMMENT '详细说明',
  `file_url` varchar(255) NOT NULL COMMENT '文件地址',
  `oper_id` int(11) NOT NULL COMMENT '添加人',
  `add_time` datetime NOT NULL COMMENT '添加时间',
  `del` tinyint(1) NOT NULL COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='产品文件清单' AUTO_INCREMENT=13 ;

-- --------------------------------------------------------

--
-- 表的结构 `followrecords`
--

CREATE TABLE IF NOT EXISTS `followrecords` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- 表的结构 `forecast`
--

CREATE TABLE IF NOT EXISTS `forecast` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22200 ;

-- --------------------------------------------------------

--
-- 表的结构 `forecast_comment`
--

CREATE TABLE IF NOT EXISTS `forecast_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `forecast_type` tinyint(1) NOT NULL COMMENT '1日，2周，3月',
  `forecast_tableid` int(11) NOT NULL COMMENT '如果forecast_type=1则为forecast_day表ID，=2则为forecast_week表ID，=3则为forecast_month表ID',
  `seq` tinyint(1) NOT NULL COMMENT '1为发起，2为跟评',
  `comment_uid` int(11) NOT NULL COMMENT '评论人ID',
  `comment_time` datetime NOT NULL COMMENT '评论时间',
  `comment` text NOT NULL COMMENT '评论内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='预测评论表' AUTO_INCREMENT=2212 ;

-- --------------------------------------------------------

--
-- 表的结构 `forecast_day`
--

CREATE TABLE IF NOT EXISTS `forecast_day` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='回款预测-天' AUTO_INCREMENT=3921 ;

-- --------------------------------------------------------

--
-- 表的结构 `forecast_log`
--

CREATE TABLE IF NOT EXISTS `forecast_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `forecast_uid` int(11) NOT NULL COMMENT '操作人ID',
  `forecast_type` tinyint(1) NOT NULL COMMENT '回款类型（1日、2周、3月）',
  `timeflg` varchar(20) NOT NULL COMMENT 'day=YYYYMMDD，week=YYYYMMDD-YYYYMMDD,month=YYYYMM',
  `forecast_time` datetime NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='回款预测操作日志' AUTO_INCREMENT=39630 ;

-- --------------------------------------------------------

--
-- 表的结构 `forecast_month`
--

CREATE TABLE IF NOT EXISTS `forecast_month` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='回款预测-月' AUTO_INCREMENT=4655 ;

-- --------------------------------------------------------

--
-- 表的结构 `forecast_week`
--

CREATE TABLE IF NOT EXISTS `forecast_week` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='回款预测-周' AUTO_INCREMENT=5134 ;

-- --------------------------------------------------------

--
-- 表的结构 `helpvideo`
--

CREATE TABLE IF NOT EXISTS `helpvideo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position` int(11) NOT NULL COMMENT '岗位ID',
  `videoname` varchar(200) NOT NULL COMMENT '视频名称',
  `videourl` varchar(200) NOT NULL COMMENT '视频URL',
  `clip` varchar(200) NOT NULL COMMENT '截图',
  `order` int(11) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='帮助视频' AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- 表的结构 `imageresolution`
--

CREATE TABLE IF NOT EXISTS `imageresolution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resolution` varchar(255) DEFAULT NULL COMMENT '分辨率',
  `appname` varchar(255) DEFAULT NULL COMMENT '浏览器类型',
  `appcodename` varchar(255) DEFAULT NULL COMMENT '浏览器代码名称',
  `appversion` varchar(255) DEFAULT NULL COMMENT '浏览器版本号',
  `create_time` datetime DEFAULT NULL COMMENT '获取时间',
  `useragent` text COMMENT '浏览器基本信息',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1008767 ;

-- --------------------------------------------------------

--
-- 表的结构 `indirectreport`
--

CREATE TABLE IF NOT EXISTS `indirectreport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cusid` int(11) DEFAULT NULL COMMENT '客户ID',
  `cusname` varchar(128) DEFAULT NULL COMMENT '客户名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `operator` varchar(50) DEFAULT NULL COMMENT '录入人',
  `content` text COMMENT '业务指导内容',
  `is_read` int(11) DEFAULT NULL COMMENT '指导内容是否已读',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3825 ;

-- --------------------------------------------------------

--
-- 表的结构 `invoice`
--

CREATE TABLE IF NOT EXISTS `invoice` (
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
  `invoice_total` decimal(10,2) NOT NULL COMMENT '发票总额',
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8886 ;

-- --------------------------------------------------------

--
-- 表的结构 `invoice_attach`
--

CREATE TABLE IF NOT EXISTS `invoice_attach` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) unsigned NOT NULL DEFAULT '0',
  `path` varchar(300) NOT NULL DEFAULT '',
  `del` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0 正常,1 删除',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `del_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_invoice` (`invoice_id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2167 ;

-- --------------------------------------------------------

--
-- 表的结构 `invoice_contract_bind`
--

CREATE TABLE IF NOT EXISTS `invoice_contract_bind` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) unsigned NOT NULL DEFAULT '0',
  `contract_id` int(11) unsigned NOT NULL DEFAULT '0',
  `invoiced_money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '开票金额',
  `rejected` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0:初始 1:驳回 2:合同退回',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `rejecct_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '驳回时间',
  PRIMARY KEY (`id`),
  KEY `idx_contract` (`contract_id`),
  KEY `idx_rejected_invoice` (`rejected`,`invoice_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3679 ;

-- --------------------------------------------------------

--
-- 表的结构 `invoice_pro`
--

CREATE TABLE IF NOT EXISTS `invoice_pro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cusid` int(11) NOT NULL COMMENT '公司ID',
  `cusname` varchar(200) NOT NULL COMMENT '公司开票名称',
  `tax_sn` varchar(60) NOT NULL COMMENT '纳税人识别号',
  `connection` varchar(255) NOT NULL COMMENT '公司地址及电话',
  `bankinfo` varchar(255) NOT NULL COMMENT '开户行及账户',
  `del` tinyint(1) NOT NULL COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4926 ;

-- --------------------------------------------------------

--
-- 表的结构 `invoice_pro_agent`
--

CREATE TABLE IF NOT EXISTS `invoice_pro_agent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cusid` int(11) NOT NULL COMMENT '公司ID',
  `cusname` varchar(200) NOT NULL COMMENT '公司开票名称',
  `tax_sn` varchar(60) NOT NULL COMMENT '纳税人识别号',
  `connection` varchar(255) NOT NULL COMMENT '公司地址及电话',
  `bankinfo` varchar(255) NOT NULL COMMENT '开户行及账户',
  `del` tinyint(1) NOT NULL COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `invoice_record`
--

CREATE TABLE IF NOT EXISTS `invoice_record` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3149 ;

-- --------------------------------------------------------

--
-- 表的结构 `lidan`
--

CREATE TABLE IF NOT EXISTS `lidan` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='理单表' AUTO_INCREMENT=113779 ;

-- --------------------------------------------------------

--
-- 表的结构 `lidan_bak`
--

CREATE TABLE IF NOT EXISTS `lidan_bak` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='理单表' AUTO_INCREMENT=113312 ;

-- --------------------------------------------------------

--
-- 表的结构 `lidan_follow`
--

CREATE TABLE IF NOT EXISTS `lidan_follow` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='理单跟进历史表' AUTO_INCREMENT=42833 ;

-- --------------------------------------------------------

--
-- 表的结构 `meeting`
--

CREATE TABLE IF NOT EXISTS `meeting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `confid` varchar(100) DEFAULT NULL COMMENT '会议Id',
  `voiptoconfid` varchar(100) DEFAULT NULL COMMENT '直呼加入的会议Id',
  `password` varchar(100) DEFAULT NULL COMMENT '创建会议自动生成密码时返回密码',
  `day` int(11) DEFAULT '0',
  `month` int(11) DEFAULT '0',
  `ctime` datetime DEFAULT NULL,
  `res` text NOT NULL,
  `dismiss_time` datetime NOT NULL COMMENT '会议解散时间',
  `dismiss_res` text NOT NULL COMMENT '解散会议返回结果',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=200 ;

-- --------------------------------------------------------

--
-- 表的结构 `meeting_parti`
--

CREATE TABLE IF NOT EXISTS `meeting_parti` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `record_id` int(11) NOT NULL COMMENT 'meeting_record表的id',
  `confid` varchar(100) NOT NULL DEFAULT '0' COMMENT '会议id',
  `callsid` varchar(100) NOT NULL COMMENT '加入会议时返回的callid',
  `orderid` varchar(100) NOT NULL COMMENT '加入会议时返回的orderid',
  `uid` int(100) NOT NULL DEFAULT '0' COMMENT '会议参与者id',
  `type` tinyint(2) NOT NULL COMMENT '参与人类型 0：发起人，1：下属，2：客户联系人',
  `tel` varchar(11) NOT NULL COMMENT '参与者电话',
  `ctime` datetime NOT NULL COMMENT '加入时间',
  `quit_time` datetime NOT NULL COMMENT '退出会议时间',
  `call_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '呼叫状态    0：通话结束， 1：通话中',
  `call_result` tinyint(1) NOT NULL DEFAULT '0' COMMENT '呼叫结果，0 成功，1未接听，2失败',
  `status_time` datetime DEFAULT NULL COMMENT '状态对应时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=337 ;

-- --------------------------------------------------------

--
-- 表的结构 `meeting_record`
--

CREATE TABLE IF NOT EXISTS `meeting_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `confid` varchar(100) NOT NULL COMMENT '会议id',
  `subject` varchar(100) NOT NULL COMMENT '主题',
  `ctime` datetime NOT NULL,
  `dismiss_time` datetime NOT NULL COMMENT '解散会议时间',
  `recordurl` varchar(255) DEFAULT NULL COMMENT '会议录音地址',
  `oss_recordurl` varchar(255) DEFAULT NULL COMMENT '转存到oss的录音地址',
  `oss_times` int(11) DEFAULT '0' COMMENT '向oss转存的次数，大于3次时不再进行转存服务',
  `recordduration` int(11) NOT NULL COMMENT '会议时长',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=222 ;

-- --------------------------------------------------------

--
-- 表的结构 `menus`
--

CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(128) DEFAULT NULL COMMENT '菜单URL',
  `status` int(11) DEFAULT NULL COMMENT '菜单状态是否有效',
  `order` int(11) DEFAULT NULL COMMENT '排序值',
  `remark` text COMMENT '菜单描述',
  `img` varchar(255) DEFAULT NULL COMMENT '图标url',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=97 ;

-- --------------------------------------------------------

--
-- 表的结构 `month_ids`
--

CREATE TABLE IF NOT EXISTS `month_ids` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `month` int(10) NOT NULL,
  `throw_id` int(11) NOT NULL DEFAULT '0',
  `return_id` int(11) NOT NULL DEFAULT '0',
  `contract_id` int(11) NOT NULL DEFAULT '0',
  `call_id` int(11) NOT NULL DEFAULT '0',
  `visit_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='月初ID记录表' AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `omslogs`
--

CREATE TABLE IF NOT EXISTS `omslogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ownerid` int(11) DEFAULT NULL,
  `ip` char(15) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `realname` char(20) DEFAULT NULL,
  `remark` text,
  `ipinfo` text,
  `ipinfobak` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=328634 ;

-- --------------------------------------------------------

--
-- 表的结构 `oms_data_date`
--

CREATE TABLE IF NOT EXISTS `oms_data_date` (
  `project_id` int(11) DEFAULT NULL COMMENT '引用项目id',
  `project_date` date DEFAULT NULL COMMENT '项目日期',
  UNIQUE KEY `project_date` (`project_date`,`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='OMS数据项目配置时间表';

-- --------------------------------------------------------

--
-- 表的结构 `oms_data_project`
--

CREATE TABLE IF NOT EXISTS `oms_data_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `project_date_str` varchar(100) DEFAULT NULL COMMENT '日期',
  `project_time` tinyint(4) DEFAULT NULL COMMENT '时间类型',
  `is_edit` tinyint(4) DEFAULT '0' COMMENT '是否可以编辑,1:是,0:否',
  `is_show_mobile` tinyint(4) DEFAULT '0' COMMENT '是否在手机上显示,1:是,0:否',
  `create_staff_id` int(11) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_fixed` tinyint(4) DEFAULT '0' COMMENT '是否是所有显示 1:是 0:否',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='OMS数据项目配置表' AUTO_INCREMENT=37 ;

-- --------------------------------------------------------

--
-- 表的结构 `oms_data_record`
--

CREATE TABLE IF NOT EXISTS `oms_data_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) DEFAULT NULL COMMENT '员工编号',
  `project_id` int(11) DEFAULT NULL COMMENT '项目编号',
  `vwar_id` int(11) DEFAULT NULL COMMENT '员工所在战区',
  `val` int(11) DEFAULT NULL COMMENT '填写的值',
  `create_time` int(11) NOT NULL,
  `day` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_idx` (`project_id`,`vwar_id`,`day`,`staff_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='OMS数据项目时间记录表' AUTO_INCREMENT=379 ;

-- --------------------------------------------------------

--
-- 表的结构 `open_apply`
--

CREATE TABLE IF NOT EXISTS `open_apply` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL DEFAULT '0' COMMENT '客户id',
  `customer_name` varchar(50) NOT NULL DEFAULT '' COMMENT '客户名称',
  `contactor` varchar(50) NOT NULL DEFAULT '' COMMENT '联系人',
  `tel` varchar(20) NOT NULL DEFAULT '' COMMENT '联系人手机',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '联系人邮箱',
  `product` varchar(30) NOT NULL DEFAULT '' COMMENT '开户产品',
  `terminal_cnt` int(11) NOT NULL DEFAULT '1' COMMENT '终端数量',
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
  `open_status` tinyint(4) NOT NULL DEFAULT '-127' COMMENT '开户返回的状态码',
  `open_msg` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=40 ;

-- --------------------------------------------------------

--
-- 表的结构 `open_apply_contract`
--

CREATE TABLE IF NOT EXISTS `open_apply_contract` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='合同申请开户或开通产品日志表' AUTO_INCREMENT=68 ;

-- --------------------------------------------------------

--
-- 表的结构 `open_send_log`
--

CREATE TABLE IF NOT EXISTS `open_send_log` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=105 ;

-- --------------------------------------------------------

--
-- 表的结构 `performance_info`
--

CREATE TABLE IF NOT EXISTS `performance_info` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4597 ;

-- --------------------------------------------------------

--
-- 表的结构 `phonebook`
--

CREATE TABLE IF NOT EXISTS `phonebook` (
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
  KEY `cusid` (`cusid`),
  FULLTEXT KEY `linkman_idx` (`linkman_idx`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3544916 ;

-- --------------------------------------------------------

--
-- 表的结构 `pk`
--

CREATE TABLE IF NOT EXISTS `pk` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='PK表' AUTO_INCREMENT=746 ;

-- --------------------------------------------------------

--
-- 表的结构 `pk_follow`
--

CREATE TABLE IF NOT EXISTS `pk_follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pk_id` int(11) NOT NULL COMMENT 'PK表ID',
  `uid` int(11) NOT NULL COMMENT '跟注人ID',
  `time` datetime NOT NULL COMMENT '跟注时间',
  `which` tinyint(1) NOT NULL COMMENT '跟注哪边：1为挑战方，2为迎战方',
  `type` tinyint(1) NOT NULL COMMENT '跟注类型：1人民币，2其他',
  `content` varchar(255) NOT NULL COMMENT '跟注内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='PK跟注表' AUTO_INCREMENT=150 ;

-- --------------------------------------------------------

--
-- 表的结构 `pk_month`
--

CREATE TABLE IF NOT EXISTS `pk_month` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pk_id` int(11) NOT NULL COMMENT 'PK表ID',
  `month` char(10) NOT NULL COMMENT '月份YYYY-MM',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='PK表-月份子表' AUTO_INCREMENT=746 ;

-- --------------------------------------------------------

--
-- 表的结构 `pk_obj`
--

CREATE TABLE IF NOT EXISTS `pk_obj` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pk_id` int(11) NOT NULL COMMENT 'PK表ID',
  `type` tinyint(1) NOT NULL COMMENT '1挑战方、2接受方',
  `obj` int(11) NOT NULL COMMENT '战个人ID、战区ID、部门ID、自定义个人ID',
  `obj_uid` int(11) NOT NULL COMMENT '最终[负责]人ID',
  `obj_flg` tinyint(1) NOT NULL COMMENT '负责人是否已接受PK：0否、1是',
  `obj_flg_time` datetime NOT NULL COMMENT '负责人接受PK的时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='PK表-对象子表' AUTO_INCREMENT=1491 ;

-- --------------------------------------------------------

--
-- 表的结构 `question`
--

CREATE TABLE IF NOT EXISTS `question` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='问题表' AUTO_INCREMENT=260 ;

-- --------------------------------------------------------

--
-- 表的结构 `question_follow`
--

CREATE TABLE IF NOT EXISTS `question_follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `add_time` datetime NOT NULL,
  `images` text NOT NULL,
  `add_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- 表的结构 `region`
--

CREATE TABLE IF NOT EXISTS `region` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=63409 ;

-- --------------------------------------------------------

--
-- 表的结构 `renew_action_history`
--

CREATE TABLE IF NOT EXISTS `renew_action_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `act_uid` int(11) NOT NULL COMMENT '操作人ID',
  `act_username` varchar(30) NOT NULL COMMENT '操作人姓名',
  `ctime` int(9) NOT NULL COMMENT '日志时间',
  `cusid` int(11) NOT NULL COMMENT '客户ID',
  `say` varchar(500) DEFAULT NULL COMMENT '时间轴',
  `act_reason` varchar(255) NOT NULL COMMENT '变更原因',
  `act_type` tinyint(1) NOT NULL COMMENT '操作类型：1 培训 ，2 电话 ，3 拜访 ，4评级，5 初始化配置，6 加入理单 7:回款预测 8:理单',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='续签操作客户历史记录表' AUTO_INCREMENT=1923 ;

-- --------------------------------------------------------

--
-- 表的结构 `renew_config`
--

CREATE TABLE IF NOT EXISTS `renew_config` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='续签配置详情' AUTO_INCREMENT=1115 ;

-- --------------------------------------------------------

--
-- 表的结构 `renew_training_report`
--

CREATE TABLE IF NOT EXISTS `renew_training_report` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='续签培训报告' AUTO_INCREMENT=101 ;

-- --------------------------------------------------------

--
-- 表的结构 `repair`
--

CREATE TABLE IF NOT EXISTS `repair` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='培训表' AUTO_INCREMENT=87 ;

-- --------------------------------------------------------

--
-- 表的结构 `report_cache_stuff`
--

CREATE TABLE IF NOT EXISTS `report_cache_stuff` (
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
  `yeji` decimal(10,2) NOT NULL COMMENT '业绩',
  `lasttime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `month` (`month`),
  KEY `userid_2` (`userid`,`month`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='业务员工作统计表-缓存数据' AUTO_INCREMENT=6512 ;

-- --------------------------------------------------------

--
-- 表的结构 `returnedmoney`
--

CREATE TABLE IF NOT EXISTS `returnedmoney` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cusid` int(11) DEFAULT NULL COMMENT '客户ID',
  `cusname` varchar(128) DEFAULT NULL COMMENT '客户名称',
  `conid` int(11) DEFAULT NULL COMMENT '合同ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `operator` varchar(50) DEFAULT NULL COMMENT '录入人',
  `operator_id` int(11) DEFAULT '0' COMMENT '录入人id',
  `money` decimal(10,2) DEFAULT '0.00' COMMENT '回款金额',
  `newmoney` decimal(10,2) NOT NULL DEFAULT '0.00',
  `remoney` decimal(10,2) NOT NULL DEFAULT '0.00',
  `devmoney` decimal(10,2) NOT NULL DEFAULT '0.00',
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12522 ;

-- --------------------------------------------------------

--
-- 表的结构 `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `auth` varchar(255) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='角色表' AUTO_INCREMENT=51 ;

-- --------------------------------------------------------

--
-- 表的结构 `seapush_assign_log`
--

CREATE TABLE IF NOT EXISTS `seapush_assign_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `areaid` int(11) NOT NULL COMMENT '区域ID',
  `warid` int(11) NOT NULL COMMENT '本次分配给这个战区了',
  `assigntime` datetime NOT NULL COMMENT '分配时间',
  `assignuid` int(11) NOT NULL COMMENT '分配人ID：0表示系统分配',
  `cusid` int(11) NOT NULL COMMENT 'customers表ID',
  PRIMARY KEY (`id`),
  KEY `areaid` (`areaid`),
  KEY `assigntime` (`assigntime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='公海开放池客户分配日志表' AUTO_INCREMENT=39471 ;

-- --------------------------------------------------------

--
-- 表的结构 `seapush_users`
--

CREATE TABLE IF NOT EXISTS `seapush_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `isarea` int(11) NOT NULL COMMENT '城市',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `turn` tinyint(3) NOT NULL COMMENT '批次',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `isarea` (`isarea`),
  KEY `turn` (`turn`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=282 ;

-- --------------------------------------------------------

--
-- 表的结构 `sendemaillogs`
--

CREATE TABLE IF NOT EXISTS `sendemaillogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `email` varchar(255) NOT NULL COMMENT '邮件',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='PK表' AUTO_INCREMENT=216 ;

-- --------------------------------------------------------

--
-- 表的结构 `session`
--

CREATE TABLE IF NOT EXISTS `session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL COMMENT '用户ID',
  `token` char(32) NOT NULL COMMENT '登录成功后生成，并返回给客户端',
  `lasttime` datetime NOT NULL COMMENT '最后一次活跃时间',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`,`token`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='用户手机端访问session表' AUTO_INCREMENT=3689 ;

-- --------------------------------------------------------

--
-- 表的结构 `slavecheck`
--

CREATE TABLE IF NOT EXISTS `slavecheck` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slave_ip` varchar(20) NOT NULL COMMENT '从服务器IP',
  `lastupdatetimestamp` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='检查主从同步状态表' AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `sorting`
--

CREATE TABLE IF NOT EXISTS `sorting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cusid` int(11) DEFAULT NULL COMMENT '客户ID',
  `cusname` varchar(128) DEFAULT NULL COMMENT '客户名称',
  `managerlevel` varchar(10) DEFAULT NULL COMMENT '经理理单',
  `mylevel` varchar(10) DEFAULT NULL COMMENT '业务员个人理单',
  `ownerid` int(11) DEFAULT NULL COMMENT '业务员',
  `operator` varchar(50) DEFAULT NULL COMMENT '理单人',
  `create_time` datetime DEFAULT NULL COMMENT '理单时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=719 ;

-- --------------------------------------------------------

--
-- 表的结构 `stat_staff_month`
--

CREATE TABLE IF NOT EXISTS `stat_staff_month` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `month` varchar(20) DEFAULT NULL,
  `region` varchar(10) DEFAULT NULL,
  `department` varchar(30) DEFAULT NULL,
  `user` varchar(30) DEFAULT NULL,
  `ownerid` int(11) NOT NULL,
  `ordernum` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8689 ;

-- --------------------------------------------------------

--
-- 表的结构 `submenus`
--

CREATE TABLE IF NOT EXISTS `submenus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menusid` int(11) DEFAULT NULL COMMENT '主菜单ID',
  `subname` varchar(128) DEFAULT NULL COMMENT '菜单名称',
  `suburl` varchar(128) DEFAULT NULL COMMENT '菜单URL',
  `status` int(11) DEFAULT NULL COMMENT '菜单状态是否有效',
  `order` int(11) DEFAULT NULL COMMENT '排序值',
  `remark` text COMMENT '菜单描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `synctask`
--

CREATE TABLE IF NOT EXISTS `synctask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(10) unsigned NOT NULL COMMENT '任务id',
  `type` tinyint(3) unsigned NOT NULL COMMENT '类型',
  `flag` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否同步',
  `ctime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='同步计划表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `target`
--

CREATE TABLE IF NOT EXISTS `target` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `areaid` int(11) NOT NULL DEFAULT '0' COMMENT '区域id',
  `warid` int(11) NOT NULL DEFAULT '0' COMMENT '战区id',
  `deptid` int(11) NOT NULL DEFAULT '0' COMMENT '部门id',
  `ownerid` int(11) NOT NULL DEFAULT '0' COMMENT '业务员ID',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '目标金额',
  `month` int(11) NOT NULL COMMENT '月份',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_uid` int(11) NOT NULL COMMENT '创建人',
  `type` tinyint(4) NOT NULL COMMENT '1=区域   2=战区   3=部门     4=个人业务员',
  `del` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='员工表' AUTO_INCREMENT=490 ;

-- --------------------------------------------------------

--
-- 表的结构 `target_month_department`
--

CREATE TABLE IF NOT EXISTS `target_month_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `areaid` int(11) NOT NULL DEFAULT '0' COMMENT '区域id',
  `warid` int(11) NOT NULL DEFAULT '0' COMMENT '战区id',
  `deptid` int(11) NOT NULL DEFAULT '0' COMMENT '部门id',
  `ownerid` int(11) NOT NULL DEFAULT '0' COMMENT '业务员ID',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '目标金额',
  `assess` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '考核值',
  `month` int(11) NOT NULL COMMENT '月份',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_uid` int(11) NOT NULL COMMENT '创建人',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0删除   1正常',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='员工表' AUTO_INCREMENT=1653 ;

-- --------------------------------------------------------

--
-- 表的结构 `tel_code`
--

CREATE TABLE IF NOT EXISTS `tel_code` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tel` varchar(20) NOT NULL DEFAULT '' COMMENT '电话号码',
  `tel_code` varchar(20) NOT NULL DEFAULT '' COMMENT '验证码',
  `send_time` int(11) NOT NULL DEFAULT '0' COMMENT '发送时间',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `send_result` int(11) NOT NULL DEFAULT '1' COMMENT '发送结果 1成功 -1失败',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=182 ;

-- --------------------------------------------------------

--
-- 表的结构 `todo`
--

CREATE TABLE IF NOT EXISTS `todo` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='待办事项' AUTO_INCREMENT=303 ;

-- --------------------------------------------------------

--
-- 表的结构 `train`
--

CREATE TABLE IF NOT EXISTS `train` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='培训表' AUTO_INCREMENT=5879 ;

-- --------------------------------------------------------

--
-- 表的结构 `train_assign`
--

CREATE TABLE IF NOT EXISTS `train_assign` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `train_id` int(11) NOT NULL COMMENT 'train表ID',
  `assign_uid` int(11) NOT NULL COMMENT '分配人',
  `assign_time` datetime NOT NULL COMMENT '分配时间',
  `assign_remark` text NOT NULL COMMENT '分配备注',
  `train_uid` int(11) NOT NULL COMMENT '培训人ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='培训表-分配历史表' AUTO_INCREMENT=5007 ;

-- --------------------------------------------------------

--
-- 表的结构 `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `passwordbak` char(32) NOT NULL,
  `realname` varchar(16) NOT NULL,
  `sex` int(1) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `department` int(11) DEFAULT NULL,
  `telephone` varchar(32) DEFAULT NULL,
  `update_phone_time` int(11) NOT NULL DEFAULT '0' COMMENT '电话字段更新时间',
  `superclass` int(11) DEFAULT NULL,
  `subclass` varchar(255) DEFAULT NULL,
  `authority` varchar(256) DEFAULT NULL,
  `operator` varchar(32) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `last_time` datetime DEFAULT NULL,
  `xkey` int(11) DEFAULT NULL,
  `issend` int(1) DEFAULT NULL,
  `city` int(11) NOT NULL DEFAULT '0' COMMENT '大区(这个是area意思反了，凑合用)',
  `varea` varchar(256) DEFAULT NULL,
  `vwar` text,
  `vdept` varchar(256) DEFAULT NULL,
  `isarea` int(11) DEFAULT NULL COMMENT '业务员区域',
  `isnewbie` int(11) DEFAULT '0' COMMENT '是否是新兵',
  `periods` int(11) DEFAULT '0' COMMENT '新兵周期11，2，3，4',
  `remark` text COMMENT '离职原因',
  `dimiss_time` datetime DEFAULT NULL COMMENT '离职日期',
  `customer_limit` int(11) NOT NULL DEFAULT '0' COMMENT '客户池数量',
  `staging` varchar(20) DEFAULT '' COMMENT '待发布版本号,用户在登录后需要跳转到该版本对应的系统',
  `ispwd` int(11) NOT NULL DEFAULT '0',
  `role_id` int(11) DEFAULT '0' COMMENT '角色ID',
  `wx_username` varchar(60) NOT NULL DEFAULT '-' COMMENT '绑定的微信企业号用户名',
  `codeid` char(20) DEFAULT NULL COMMENT '身份证',
  `token` varchar(255) DEFAULT NULL COMMENT '返回给客户端token登入识别码',
  `token_time` datetime DEFAULT NULL COMMENT 'token存入时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `is_owner` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否是大区或城市或战区负责人，1代表是，其他情况以及其他职位统统为0',
  `hr_staff_id` int(11) NOT NULL DEFAULT '0' COMMENT 'hr系统staff的id',
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `status` (`status`),
  KEY `position` (`position`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6113 ;

-- --------------------------------------------------------

--
-- 表的结构 `visitplan`
--

CREATE TABLE IF NOT EXISTS `visitplan` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='拜访计划表' AUTO_INCREMENT=291478 ;

-- --------------------------------------------------------

--
-- 表的结构 `visitrecord`
--

CREATE TABLE IF NOT EXISTS `visitrecord` (
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
  `start_lon_bd09` varchar(90) NOT NULL DEFAULT '' COMMENT '百度地图经纬度',
  `start_lat_bd09` varchar(90) NOT NULL DEFAULT '' COMMENT '百度地图经纬度',
  `start_address` varchar(255) NOT NULL,
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `end_lon_gcj02` varchar(90) NOT NULL COMMENT '结束经度',
  `end_lat_gcj02` varchar(90) NOT NULL COMMENT '结束纬度',
  `end_lon_bd09` varchar(90) NOT NULL DEFAULT '' COMMENT '百度地图经纬度',
  `end_lat_bd09` varchar(90) NOT NULL DEFAULT '' COMMENT '百度地图经纬度',
  `end_address` varchar(255) NOT NULL,
  `subvisit` tinyint(1) NOT NULL COMMENT '是否陪访：0否、1是',
  `fvid` int(11) NOT NULL COMMENT '被陪防记录id',
  `is_renew` tinyint(1) NOT NULL COMMENT '是否属于续签',
  `is_upload_report` tinyint(1) NOT NULL COMMENT '是否上传实施报告：0否1是',
  `report_file` varchar(255) NOT NULL COMMENT '实施报告文件',
  `no_upload_reason` varchar(30) NOT NULL COMMENT '未上传报告原因',
  `next_time` datetime DEFAULT NULL,
  `next_address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cusid` (`cusid`),
  KEY `subvisit` (`subvisit`),
  KEY `operator` (`operator`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=239452 ;

-- --------------------------------------------------------

--
-- 表的结构 `visitresult`
--

CREATE TABLE IF NOT EXISTS `visitresult` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='拜访记录表' AUTO_INCREMENT=136959 ;

-- --------------------------------------------------------

--
-- 表的结构 `visitresult_photo`
--

CREATE TABLE IF NOT EXISTS `visitresult_photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) NOT NULL COMMENT 'visitresult表ID',
  `picurl` varchar(255) NOT NULL COMMENT '拍照URL',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33509 ;

-- --------------------------------------------------------

--
-- 表的结构 `yunying_blankcontract`
--

CREATE TABLE IF NOT EXISTS `yunying_blankcontract` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contract_no` varchar(30) NOT NULL COMMENT '合同编号',
  `ownerid` int(11) NOT NULL COMMENT '申请业务员ID',
  `add_time` datetime NOT NULL COMMENT '申请时间',
  `status` tinyint(1) NOT NULL COMMENT '使用状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `contract_no` (`contract_no`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='运营空白合同' AUTO_INCREMENT=1764 ;

-- --------------------------------------------------------

--
-- 表的结构 `yunying_contract_config`
--

CREATE TABLE IF NOT EXISTS `yunying_contract_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_code` varchar(10) NOT NULL COMMENT '合同编号前缀',
  `year` varchar(10) NOT NULL COMMENT '年份',
  `flg` int(11) NOT NULL COMMENT '当前最大流水号',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='运营合同-合同编号前缀' AUTO_INCREMENT=60 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
