#!/usr/bin/python
# -*- coding: UTF-8 -*-
import datetime
import time
from datetime import date
from database_connection import Connection
import tushare as ts
import warnings
warnings.simplefilter(action = "ignore", category = FutureWarning)
class datafetch:

    def __init__(self):
        self.conn = Connection("localhost","root","root","stockanalyse")

    def get_today_all(self,option = 'append'):
    #option = 'replace','fail','append'
        rows = ts.get_today_all()
        cnx = self.conn.getCNX()
        rows.to_sql("today_all",cnx,flavor='mysql',if_exists=option,index=False)
        print "get_today_all executed"

    #option = 'replace','fail','append'
    #code：股票代码，即6位数字代码，或者指数代码（sh=上证指数 sz=深圳成指 hs300=沪深300指数 sz50=上证50 zxb=中小板 cyb=创业板）
    #start：开始日期，格式YYYY-MM-DD
    #end：结束日期，格式YYYY-MM-DD
    #ktype：数据类型，D=日k线 W=周 M=月 5=5分钟 15=15分钟 30=30分钟 60=60分钟，默认为D
    #retry_count：当网络异常后重试次数，默认为3
    #pause:重试时停顿秒数，默认为0
    def get_hist_data(self,code = '600848', start = 0, end = 0, ktype = 'D', option = 'append'):
        print "get %s history data from %s to %s" % (code, start,end)
        if(start != 0 and end != 0):
            df = ts.get_hist_data(code,start=start,end=end,ktype=ktype)
        else:
            df = ts.get_hist_data(code,ktype=ktype)
        if df is None:
            return
        for j in range(len(df.values)):
            date = df.index[j]
            tt = df.values[j]
            sqlPre = "insert into "+"hist_data_"+ktype+" (`code`, `date`, `open`, `high`, `close`, `low`, `volume`, `price_change`, `p_change`, `ma5`, `ma10`, `ma20`, `v_ma5`, `v_ma10`, `v_ma20`, `turnover`) VALUES ('"+code+"','"+date+"',"
            for i in range(len(tt)):
                sqlPre += "'"+tt[i].astype("str")+"',"
            sqlPre = sqlPre[:(len(sqlPre)-1)] + ")"
            self.conn.execute(sqlPre)
        #print "get_hist_data executed"
        #time.sleep(1)

    def get_hist_data_all(self, ktype = 'D', option = 'append'):
        df = ts.get_stock_basics()
        for i in range(len(df.index)):
            print i
            code = df.index[i]
            #start = df.ix[code]['timeToMarket']
            #start = datetime.datetime.strptime(str(start), "%Y%m%d").date().strftime("%Y-%m-%d")
            #end = date.today().strftime("%Y-%m-%d")
            periods = self.getLastThreeYears()
            for j in range(0,len(periods),2):
                self.get_hist_data(code,periods[j].strftime("%Y-%m-%d"),periods[j+1].strftime("%Y-%m-%d"),ktype)
        print "get_hist_data_all executed"

    def get_period_array(self, start, end):
        self.validateDate(start)
        self.validateDate(end)
        result = []
        current = datetime.datetime.strptime(start, "%Y-%m-%d").date()
        end = datetime.datetime.strptime(end, "%Y-%m-%d").date()
        while (current < end):
            result.append(current)
            current = date(current.year+1,current.month,current.day)
            if (current < end):
                pend = current - datetime.timedelta(days=1)
                result.append(pend)
            else:
                result.append(end)
        return result

    def getLastThreeYears(self):
        result = []
        today = date.today()
        current = date(today.year-3,today.month,today.day)
        result.append(current)
        current = date(today.year-2,today.month,today.day+1)
        result.append(current)
        current = date(today.year-2,today.month,today.day)
        result.append(current)
        current = date(today.year-1,today.month,today.day+1)
        result.append(current)
        current = date(today.year-1,today.month,today.day)
        result.append(current)
        result.append(today)
        return result

    def validateDate(self, date_text):
        try:
            datetime.datetime.strptime(date_text, '%Y-%m-%d')
        except ValueError:
            raise ValueError("Incorrect data format, should be YYYY-MM-DD")

    def __del__(self):
        del self.conn

